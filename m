From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 4 Jan 2023 14:29:25 +0800
Subject: [PATCH 4/6] platform: andes/ae350: Implement hart hotplug using HSM extension
In-Reply-To: <20230104062927.15628-1-peterlin@andestech.com>
References: <20230104062927.15628-1-peterlin@andestech.com>
Message-ID: <20230104062927.15628-5-peterlin@andestech.com>
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
---
 platform/generic/andes/ae350.c           | 138 +++++++++++++++++++++++
 platform/generic/andes/objects.mk        |   2 +-
 platform/generic/andes/sleep.S           |  61 ++++++++++
 platform/generic/include/andes/andes45.h |  10 ++
 platform/generic/include/andes/atcsmu.h  |  44 ++++++++
 5 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 platform/generic/andes/sleep.S
 create mode 100644 platform/generic/include/andes/andes45.h
 create mode 100644 platform/generic/include/andes/atcsmu.h

diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index cf7f6f2..62aba50 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -10,6 +10,143 @@
 #include <platform_override.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_ipi.h>
+
+#include <andes/atcsmu.h>
+#include <andes/andes45.h>
+
+struct smu_data smu;
+extern void __ae350_enable_coherency_warmboot(void);
+extern void __ae350_disable_coherency(void);
+
+static __always_inline bool is_andes25(void)
+{
+	ulong marchid = csr_read(CSR_MARCHID);
+	return EXTRACT_FIELD(marchid, CSR_MARCHID_MICROID) == 0xa25;
+}
+
+static void smu_set_wakeup_events(u32 events, u32 hartid)
+{
+	writel(events, (void *)(smu.addr + PCSm_WE_OFFSET(hartid)));
+}
+
+static bool smu_support_sleep_mode(u32 sleep_mode, u32 hartid)
+{
+	u32 pcs_cfg;
+
+	pcs_cfg = readl((void *)(smu.addr + PCSm_CFG_OFFSET(hartid)));
+
+	switch (sleep_mode) {
+	case LIGHTSLEEP_MODE:
+		if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_LIGHT_SLEEP) == 0) {
+			sbi_printf(
+				"SMU: hart%d (PCS%d) does not support light sleep mode\n",
+				hartid, hartid + 3);
+			return false;
+		}
+	case DEEPSLEEP_MODE:
+		if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_DEEP_SLEEP) == 0) {
+			sbi_printf(
+				"SMU: hart%d (PCS%d) does not support deep sleep mode\n",
+				hartid, hartid + 3);
+			return false;
+		}
+	};
+
+	return true;
+}
+
+static void smu_set_command(u32 pcs_ctl, u32 hartid)
+{
+	writel(pcs_ctl, (void *)(smu.addr + PCSm_CTL_OFFSET(hartid)));
+}
+
+static void smu_set_reset_vector(ulong wakeup_addr, u32 hartid)
+{
+	writel(wakeup_addr,
+	       (void *)(smu.addr + HARTn_RESET_VEC_LO(hartid)));
+	writel((u64)wakeup_addr >> 32,
+	       (void *)(smu.addr + HARTn_RESET_VEC_HI(hartid)));
+}
+
+static int ae350_hart_start(u32 hartid, ulong saddr)
+{
+	if (is_andes25() && hartid == 0)
+		return sbi_ipi_raw_send(hartid);
+
+	/* Write wakeup command to the sleep hart */
+	smu_set_command(WAKEUP_CMD, hartid);
+
+	return 0;
+}
+
+static int ae350_hart_stop(void)
+{
+	u32 hartid = current_hartid();
+
+	/**
+	 * The hart0 shares power domain with L2-cache,
+	 * instead of turning it off, it falls through
+	 * and jump to warmboot_addr.
+	 */
+	if (is_andes25() && hartid == 0)
+		return SBI_ENOTSUPP;
+
+	if (!smu_support_sleep_mode(DEEPSLEEP_MODE, hartid))
+		return SBI_ENOTSUPP;
+
+	/**
+	 * disable all events, the current hart will be
+	 * woken up from reset vector when other hart
+	 * writes its PCS (power control slot) control
+	 * register
+	 */
+	smu_set_wakeup_events(0x0, hartid);
+	smu_set_command(DEEP_SLEEP_CMD, hartid);
+	smu_set_reset_vector((ulong)__ae350_enable_coherency_warmboot,
+			       hartid);
+	__ae350_disable_coherency();
+
+	wfi();
+
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
@@ -18,4 +155,5 @@ static const struct fdt_match andes_ae350_match[] = {
 
 const struct platform_override andes_ae350 = {
 	.match_table = andes_ae350_match,
+	.final_init  = ae350_final_init,
 };
diff --git a/platform/generic/andes/objects.mk b/platform/generic/andes/objects.mk
index dd6408d..28275ef 100644
--- a/platform/generic/andes/objects.mk
+++ b/platform/generic/andes/objects.mk
@@ -3,4 +3,4 @@
 #
 
 carray-platform_override_modules-$(CONFIG_PLATFORM_ANDES_AE350) += andes_ae350
-platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o
+platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o andes/sleep.o
diff --git a/platform/generic/andes/sleep.S b/platform/generic/andes/sleep.S
new file mode 100644
index 0000000..2171f0d
--- /dev/null
+++ b/platform/generic/andes/sleep.S
@@ -0,0 +1,61 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
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
+	/* flush D-cache */
+	csrw	CSR_MCCTLCOMMAND, 0x6
+	/* disable I/D-cache */
+	csrc	CSR_MCACHECTL, 0x3
+	/* disable D-cache coherency */
+	lui	t1, 0x80
+	csrc	CSR_MCACHECTL, t1
+	/* 45-series: wait for mcache_ctl.DC_COHSTA to be cleared */
+check_cm_disabled:
+	csrr	t1, CSR_MCACHECTL
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
+	/* enable D-cache coherency */
+	lui		t1, 0x80
+	csrs	CSR_MCACHECTL, t1
+	/*
+	 * check CM support
+	 * 25-series: mcache_ctl.DC_COHEN is hard-wired to 0
+	 */
+	csrr	t1, CSR_MCACHECTL
+	srli	t1, t1, 20
+	andi	t1, t1, 0x1
+	beqz	t1, enable_L1_cache
+	/* 45-series: wait for mcache_ctl.DC_COHSTA to be set */
+check_cm_enabled:
+	csrr	t1, CSR_MCACHECTL
+	srli	t1, t1, 20
+	andi	t1, t1, 0x1
+	beqz	t1, check_cm_enabled
+enable_L1_cache:
+	/* enable I/D-cache */
+	csrs	CSR_MCACHECTL, 0x3
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
index 0000000..aea2368
--- /dev/null
+++ b/platform/generic/include/andes/andes45.h
@@ -0,0 +1,10 @@
+#ifndef _RISCV_ANDES45_H
+#define _RISCV_ANDES45_H
+
+#define CSR_MARCHID_MICROID 0xfff
+
+/* Memory and Miscellaneous Registers */
+#define CSR_MCACHECTL 0x7ca
+#define CSR_MCCTLCOMMAND 0x7cc
+
+#endif /* _RISCV_ANDES45_H */
diff --git a/platform/generic/include/andes/atcsmu.h b/platform/generic/include/andes/atcsmu.h
new file mode 100644
index 0000000..c72600c
--- /dev/null
+++ b/platform/generic/include/andes/atcsmu.h
@@ -0,0 +1,44 @@
+#ifndef _RISCV_ATCSMU_H
+#define _RISCV_ATCSMU_H
+
+#define PCS0_WE_OFFSET 0x90
+#define PCSm_WE_OFFSET(i) ((i + 3) * 0x20 + PCS0_WE_OFFSET)
+
+#define PCS0_CTL_OFFSET 0x94
+#define PCSm_CTL_OFFSET(i) ((i + 3) * 0x20 + PCS0_CTL_OFFSET)
+#define PCS_CTL_CMD_SHIFT 0
+#define PCS_CTL_PARAM_SHIFT 3
+#define SLEEP_CMD 0x3
+#define WAKEUP_CMD (0x0 | (1 << PCS_CTL_PARAM_SHIFT))
+#define LIGHTSLEEP_MODE 0
+#define DEEPSLEEP_MODE 1
+#define LIGHT_SLEEP_CMD (SLEEP_CMD | (LIGHTSLEEP_MODE << PCS_CTL_PARAM_SHIFT))
+#define DEEP_SLEEP_CMD (SLEEP_CMD | (DEEPSLEEP_MODE << PCS_CTL_PARAM_SHIFT))
+
+#define PCS0_CFG_OFFSET 0x80
+#define PCSm_CFG_OFFSET(i) ((i + 3) * 0x20 + PCS0_CFG_OFFSET)
+#define PCS_CFG_LIGHT_SLEEP_SHIFT 2
+#define PCS_CFG_LIGHT_SLEEP (1 << PCS_CFG_LIGHT_SLEEP_SHIFT)
+#define PCS_CFG_DEEP_SLEEP_SHIFT 3
+#define PCS_CFG_DEEP_SLEEP (1 << PCS_CFG_DEEP_SLEEP_SHIFT)
+#define RESET_VEC_LO_OFFSET 0x50
+#define RESET_VEC_HI_OFFSET 0x60
+#define RESET_VEC_8CORE_OFFSET 0x1a0
+#define HARTn_RESET_VEC_LO(n)  \
+	(RESET_VEC_LO_OFFSET + \
+	 ((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + ((n) * 0x4))
+#define HARTn_RESET_VEC_HI(n)  \
+	(RESET_VEC_HI_OFFSET + \
+	 ((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + ((n) * 0x4))
+#define PCS_MAX_NR 8
+#define FLASH_BASE 0x80000000ULL
+
+#ifndef __ASSEMBLER__
+
+struct smu_data {
+	unsigned long addr;
+};
+
+#endif /* __ASSEMBLER__ */
+
+#endif /* _RISCV_ATCSMU_H */
-- 
2.34.1


