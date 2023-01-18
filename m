From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 18 Jan 2023 15:53:20 +0800
Subject: [PATCH v3 5/6] platform: andes/ae350: Implement hart hotplug using HSM extension
In-Reply-To: <20230118075321.19447-1-peterlin@andestech.com>
References: <20230118075321.19447-1-peterlin@andestech.com>
Message-ID: <20230118075321.19447-6-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add hart_start() and hart_stop() callbacks for the multi-core ae350
platform, it utilizes the ATCSMU to put the harts into power-gated
deep sleep mode. The programming sequence is stated as below:

1. Set the wakeup events to PCSm_WE
2. Set the sleep command to PCSm_CTL
3. Set the reset vector to HARTm_RESET_VECTOR_{LO|HI}
4. Write back and invalidate D-cache by executing the CCTL command L1D_WBINVAL_ALL
5. Disable I/D-cache by clearing mcache_ctl.{I|D}C_EN
6. Disable D-cache coherency by clearing mcache_ctl_.DC_COHEN
7. Wait for mcache_ctl.DC_COHSTA to be cleared to ensure the previous step is completed
8. Execute WFI

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 platform/generic/andes/ae350.c           | 99 ++++++++++++++++++++++++
 platform/generic/andes/objects.mk        |  2 +-
 platform/generic/andes/sleep.S           | 70 +++++++++++++++++
 platform/generic/include/andes/andes45.h | 10 +++
 4 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 platform/generic/andes/sleep.S
 create mode 100644 platform/generic/include/andes/andes45.h

diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index cf7f6f2a..89f5b74a 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -10,6 +10,104 @@
 #include <platform_override.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/sys/atcsmu.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi/sbi_init.h>
+#include <andes/andes45.h>
+
+static struct smu_data smu = { 0 };
+extern void __ae350_enable_coherency_warmboot(void);
+extern void __ae350_disable_coherency(void);
+
+static __always_inline bool is_andes25(void)
+{
+	ulong marchid = csr_read(CSR_MARCHID);
+	return !!(EXTRACT_FIELD(marchid, CSR_MARCHID_MICROID) == 0xa25);
+}
+
+static int ae350_hart_start(u32 hartid, ulong saddr)
+{
+	/* Don't send wakeup command at boot-time */
+	if (!sbi_init_count(hartid) || (is_andes25() && hartid == 0))
+		return sbi_ipi_raw_send(hartid);
+
+	/* Write wakeup command to the sleep hart */
+	smu_set_command(&smu, WAKEUP_CMD, hartid);
+
+	return 0;
+}
+
+static int ae350_hart_stop(void)
+{
+	int rc;
+	u32 hartid = current_hartid();
+
+	/**
+	 * For Andes AX25MP, the hart0 shares power domain with
+	 * L2-cache, instead of turning it off, it should fall
+	 * through and jump to warmboot_addr.
+	 */
+	if (is_andes25() && hartid == 0)
+		return SBI_ENOTSUPP;
+
+	if (!smu_support_sleep_mode(&smu, DEEPSLEEP_MODE, hartid))
+		return SBI_ENOTSUPP;
+
+	/**
+	 * disable all events, the current hart will be
+	 * woken up from reset vector when other hart
+	 * writes its PCS (power control slot) control
+	 * register
+	 */
+	smu_set_wakeup_events(&smu, 0x0, hartid);
+	smu_set_command(&smu, DEEP_SLEEP_CMD, hartid);
+
+	rc = smu_set_reset_vector(&smu, (ulong)__ae350_enable_coherency_warmboot,
+			       hartid);
+	if (rc)
+		goto fail;
+
+	__ae350_disable_coherency();
+
+	wfi();
+
+fail:
+	/* It should never reach here */
+	sbi_hart_hang();
+	return 0;
+}
+
+static const struct sbi_hsm_device andes_smu = {
+	.name	      = "andes_smu",
+	.hart_start   = ae350_hart_start,
+	.hart_stop    = ae350_hart_stop,
+};
+
+static void ae350_hsm_device_init(void)
+{
+	int rc;
+	void *fdt;
+
+	fdt = fdt_get_address();
+
+	rc = fdt_parse_compat_addr(fdt, (uint64_t *)&smu.addr,
+				   "andestech,atcsmu");
+
+	if (!rc) {
+		sbi_hsm_set_device(&andes_smu);
+	}
+}
+
+static int ae350_final_init(bool cold_boot, const struct fdt_match *match)
+{
+	if (cold_boot)
+		ae350_hsm_device_init();
+
+	return 0;
+}
 
 static const struct fdt_match andes_ae350_match[] = {
 	{ .compatible = "andestech,ae350" },
@@ -18,4 +116,5 @@ static const struct fdt_match andes_ae350_match[] = {
 
 const struct platform_override andes_ae350 = {
 	.match_table = andes_ae350_match,
+	.final_init  = ae350_final_init,
 };
diff --git a/platform/generic/andes/objects.mk b/platform/generic/andes/objects.mk
index dd6408de..28275efb 100644
--- a/platform/generic/andes/objects.mk
+++ b/platform/generic/andes/objects.mk
@@ -3,4 +3,4 @@
 #
 
 carray-platform_override_modules-$(CONFIG_PLATFORM_ANDES_AE350) += andes_ae350
-platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o
+platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o andes/sleep.o
diff --git a/platform/generic/andes/sleep.S b/platform/generic/andes/sleep.S
new file mode 100644
index 00000000..59a5597d
--- /dev/null
+++ b/platform/generic/andes/sleep.S
@@ -0,0 +1,70 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Andes Technology Corporation
+ *
+ * Authors:
+ *   Yu Chien Peter Lin <peterlin@andestech.com>
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_asm.h>
+#include <andes/andes45.h>
+
+	.section .text, "ax", %progbits
+	.align 3
+	.global __ae350_disable_coherency
+__ae350_disable_coherency:
+	/* flush d-cache */
+	csrw	CSR_MCCTLCOMMAND, 0x6
+	/* disable i/d-cache */
+	csrc	CSR_MCACHE_CTL, 0x3
+	/* disable d-cache coherency */
+	lui	t1, 0x80
+	csrc	CSR_MCACHE_CTL, t1
+	/*
+	 * wait for mcache_ctl.DC_COHSTA to be cleared,
+	 * the bit is hard-wired 0 on platforms w/o CM
+	 * (Coherence Manager)
+	 */
+check_cm_disabled:
+	csrr	t1, CSR_MCACHE_CTL
+	srli	t1, t1, 20
+	andi	t1, t1, 0x1
+	bnez	t1, check_cm_disabled
+
+	ret
+
+	.section .text, "ax", %progbits
+	.align 3
+	.global __ae350_enable_coherency
+__ae350_enable_coherency:
+	/* enable d-cache coherency */
+	lui		t1, 0x80
+	csrs	CSR_MCACHE_CTL, t1
+	/*
+	 * mcache_ctl.DC_COHEN is hard-wired 0 on platforms
+	 * w/o CM support
+	 */
+	csrr	t1, CSR_MCACHE_CTL
+	srli	t1, t1, 19
+	andi	t1, t1, 0x1
+	beqz	t1, enable_L1_cache
+	/* wait for mcache_ctl.DC_COHSTA to be set */
+check_cm_enabled:
+	csrr	t1, CSR_MCACHE_CTL
+	srli	t1, t1, 20
+	andi	t1, t1, 0x1
+	beqz	t1, check_cm_enabled
+enable_L1_cache:
+	/* enable i/d-cache */
+	csrs	CSR_MCACHE_CTL, 0x3
+
+	ret
+
+	.section .text, "ax", %progbits
+	.align 3
+	.global __ae350_enable_coherency_warmboot
+__ae350_enable_coherency_warmboot:
+	call ra, __ae350_enable_coherency
+	j _start_warm
diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes45.h
new file mode 100644
index 00000000..08b3d188
--- /dev/null
+++ b/platform/generic/include/andes/andes45.h
@@ -0,0 +1,10 @@
+#ifndef _RISCV_ANDES45_H
+#define _RISCV_ANDES45_H
+
+#define CSR_MARCHID_MICROID 0xfff
+
+/* Memory and Miscellaneous Registers */
+#define CSR_MCACHE_CTL 0x7ca
+#define CSR_MCCTLCOMMAND 0x7cc
+
+#endif /* _RISCV_ANDES45_H */
-- 
2.34.1


