Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381D7E8FDB1
	for <opensbi@archiver.kernel.org>; Mon, 29 Dec 2025 07:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fwuPWoeVoBGFwnScgl2bRm+zCkc6C2RlZti8vlx5nU=; b=4FyvAK2JNULdrf
	iF4rumcSwsAWQI6+fdSLqQLyd2rdvS2r1+TVRzuFjytBEdV5S9Q2D0cDMOsCv4bSd0lLgWutAx/mw
	I3ZQzDysEWwDCXpZOA8dsa+RqzpIQpelktgIpAHufw/Jga37gIPdPFMKbDcg+6Fw5vvQVGabcTrv3
	msoP36WcUfR+t1z1Kh36+1Jn7XQDWIhZ/dJ+fxNlt9K7rHzdpA5wanVZr8nr7uWWfg772StIL8SjX
	ZHY9DQWeLKsgc+FfmpQczu/c3j5pk69LHsvl+HQtdhGSXxm0zWNe9WDI2wbFeMCHrNFj1FydoAsKH
	3a5qZNvrJiFT7uK1/SBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XR-00000003Pva-0khM;
	Mon, 29 Dec 2025 07:19:33 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XN-00000003PuM-3NMD
	for opensbi@lists.infradead.org;
	Mon, 29 Dec 2025 07:19:31 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5BT7JLgL084286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <opensbi@lists.infradead.org>; Mon, 29 Dec 2025 15:19:21 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Dec 2025
 15:19:21 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 1/5] lib: utils/hsm: factor out ATCSMU code into an HSM driver
Date: Mon, 29 Dec 2025 15:19:10 +0800
Message-ID: <20251229071914.1451587-2-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229071914.1451587-1-ben717@andestech.com>
References: <20251229071914.1451587-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5BT7JLgL084286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_231930_351958_2B14F3A0 
X-CRM114-Status: GOOD (  29.10  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Refactor ATCSMU (System Management Unit) support by moving it from a
system utility into a dedicated FDT-based HSM driver.

Key changes include:

- Moving the functions in lib/utils/sys/atcsmu.c into the new HSM driver
- Moving hart start and stop operations on AE350 platform into the new
  HSM driver
- Converting the assembly-based functions in sleep.S to C code for the
  readability
- Updating the ATCWDT200 driver

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h |  49 ++++++
 include/sbi_utils/sys/atcsmu.h               |  59 -------
 lib/utils/hsm/Kconfig                        |   4 +
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c         | 166 +++++++++++++++++++
 lib/utils/hsm/objects.mk                     |   5 +-
 lib/utils/reset/Kconfig                      |   2 +-
 lib/utils/reset/fdt_reset_atcwdt200.c        |  22 +--
 lib/utils/sys/Kconfig                        |   4 -
 lib/utils/sys/atcsmu.c                       |  89 ----------
 lib/utils/sys/objects.mk                     |   1 -
 platform/generic/Kconfig                     |   1 -
 platform/generic/andes/ae350.c               | 112 +------------
 platform/generic/andes/objects.mk            |   2 +-
 platform/generic/andes/sleep.S               |  70 --------
 platform/generic/configs/defconfig           |   1 +
 platform/generic/include/andes/andes.h       |  62 +++++++
 16 files changed, 301 insertions(+), 348 deletions(-)
 create mode 100644 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
 delete mode 100644 include/sbi_utils/sys/atcsmu.h
 create mode 100644 lib/utils/hsm/fdt_hsm_andes_atcsmu.c
 delete mode 100644 lib/utils/sys/atcsmu.c
 delete mode 100644 platform/generic/andes/sleep.S

diff --git a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
new file mode 100644
index 000000000000..881d8b215060
--- /dev/null
+++ b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
@@ -0,0 +1,49 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Andes Technology Corporation
+ */
+
+#ifndef __FDT_HSM_ANDES_ATCSMU_H__
+#define __FDT_HSM_ANDES_ATCSMU_H__
+
+#include <sbi/sbi_types.h>
+
+/* clang-format off */
+
+#define RESET_VEC_LO_OFFSET		0x50
+#define RESET_VEC_HI_OFFSET		0x60
+#define RESET_VEC_8CORE_OFFSET		0x1a0
+#define HARTn_RESET_VEC_LO(n)		(RESET_VEC_LO_OFFSET + \
+					((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + \
+					((n) * 0x4))
+#define HARTn_RESET_VEC_HI(n)		(RESET_VEC_HI_OFFSET + \
+					((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + \
+					((n) * 0x4))
+
+#define PCS0_CFG_OFFSET			0x80
+#define PCSm_CFG_OFFSET(i)		((i + 3) * 0x20 + PCS0_CFG_OFFSET)
+#define PCS_CFG_LIGHT_SLEEP		BIT(2)
+#define PCS_CFG_DEEP_SLEEP		BIT(3)
+
+#define PCS0_SCRATCH_OFFSET		0x84
+#define PCSm_SCRATCH_OFFSET(i)		((i + 3) * 0x20 + PCS0_SCRATCH_OFFSET)
+
+#define PCS0_WE_OFFSET			0x90
+#define PCSm_WE_OFFSET(i)		((i + 3) * 0x20 + PCS0_WE_OFFSET)
+
+#define PCS0_CTL_OFFSET			0x94
+#define PCSm_CTL_OFFSET(i)		((i + 3) * 0x20 + PCS0_CTL_OFFSET)
+#define LIGHT_SLEEP_CMD			0x3
+#define WAKEUP_CMD			0x8
+#define DEEP_SLEEP_CMD			0xb
+
+/* clang-format on */
+
+void atcsmu_set_wakeup_events(u32 events, u32 hartid);
+bool atcsmu_support_sleep_mode(u32 sleep_type, u32 hartid);
+void atcsmu_set_command(u32 pcs_ctl, u32 hartid);
+int atcsmu_set_reset_vector(u64 wakeup_addr, u32 hartid);
+u32 atcsmu_get_sleep_type(u32 hartid);
+
+#endif
diff --git a/include/sbi_utils/sys/atcsmu.h b/include/sbi_utils/sys/atcsmu.h
deleted file mode 100644
index 07be22eef626..000000000000
--- a/include/sbi_utils/sys/atcsmu.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-3-Clause
- *
- * Copyright (c) 2023 Andes Technology Corporation
- */
-
-#ifndef _SYS_ATCSMU_H
-#define _SYS_ATCSMU_H
-
-#include <sbi/sbi_types.h>
-
-/* clang-format off */
-
-#define PCS0_WE_OFFSET		0x90
-#define PCSm_WE_OFFSET(i)	((i + 3) * 0x20 + PCS0_WE_OFFSET)
-
-#define PCS0_CTL_OFFSET		0x94
-#define PCSm_CTL_OFFSET(i)	((i + 3) * 0x20 + PCS0_CTL_OFFSET)
-#define PCS_CTL_CMD_SHIFT	0
-#define PCS_CTL_PARAM_SHIFT	3
-#define SLEEP_CMD		0x3
-#define WAKEUP_CMD		(0x0 | (1 << PCS_CTL_PARAM_SHIFT))
-#define LIGHTSLEEP_MODE		0
-#define DEEPSLEEP_MODE		1
-#define LIGHT_SLEEP_CMD		(SLEEP_CMD | (LIGHTSLEEP_MODE << PCS_CTL_PARAM_SHIFT))
-#define DEEP_SLEEP_CMD		(SLEEP_CMD | (DEEPSLEEP_MODE << PCS_CTL_PARAM_SHIFT))
-
-#define PCS0_CFG_OFFSET			0x80
-#define PCSm_CFG_OFFSET(i)		((i + 3) * 0x20 + PCS0_CFG_OFFSET)
-#define PCS_CFG_LIGHT_SLEEP_SHIFT	2
-#define PCS_CFG_LIGHT_SLEEP		(1 << PCS_CFG_LIGHT_SLEEP_SHIFT)
-#define PCS_CFG_DEEP_SLEEP_SHIFT	3
-#define PCS_CFG_DEEP_SLEEP		(1 << PCS_CFG_DEEP_SLEEP_SHIFT)
-
-#define RESET_VEC_LO_OFFSET	0x50
-#define RESET_VEC_HI_OFFSET	0x60
-#define RESET_VEC_8CORE_OFFSET	0x1a0
-#define HARTn_RESET_VEC_LO(n)	(RESET_VEC_LO_OFFSET + \
-			        ((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + \
-			        ((n) * 0x4))
-#define HARTn_RESET_VEC_HI(n)	(RESET_VEC_HI_OFFSET + \
-			        ((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + \
-			        ((n) * 0x4))
-
-#define PCS_MAX_NR  8
-#define FLASH_BASE  0x80000000ULL
-
-/* clang-format on */
-
-struct smu_data {
-	unsigned long addr;
-};
-
-int smu_set_wakeup_events(struct smu_data *smu, u32 events, u32 hartid);
-bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode, u32 hartid);
-int smu_set_command(struct smu_data *smu, u32 pcs_ctl, u32 hartid);
-int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr, u32 hartid);
-
-#endif /* _SYS_ATCSMU_H */
diff --git a/lib/utils/hsm/Kconfig b/lib/utils/hsm/Kconfig
index 94973c8fd7bd..1dfb243e3109 100644
--- a/lib/utils/hsm/Kconfig
+++ b/lib/utils/hsm/Kconfig
@@ -9,6 +9,10 @@ config FDT_HSM
 
 if FDT_HSM
 
+config FDT_HSM_ANDES_ATCSMU
+	bool "FDT Andes ATCSMU driver"
+	default n
+
 config FDT_HSM_RPMI
 	bool "FDT RPMI HSM driver"
 	depends on FDT_MAILBOX && RPMI_MAILBOX
diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
new file mode 100644
index 000000000000..ee7873dc6d00
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -0,0 +1,166 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Andes Technology Corporation
+ */
+
+#include <andes/andes.h>
+#include <libfdt.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_init.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/hsm/fdt_hsm_andes_atcsmu.h>
+
+static uint64_t atcsmu_base;
+
+void atcsmu_set_wakeup_events(u32 events, u32 hartid)
+{
+	writel_relaxed(events, (char *)atcsmu_base + PCSm_WE_OFFSET(hartid));
+}
+
+bool atcsmu_support_sleep_mode(u32 sleep_type, u32 hartid)
+{
+	u32 pcs_cfg;
+	u32 mask;
+	const char *sleep_mode;
+
+	pcs_cfg = readl_relaxed((char *)atcsmu_base + PCSm_CFG_OFFSET(hartid));
+	switch (sleep_type) {
+	case SBI_SUSP_AE350_LIGHT_SLEEP:
+		mask = PCS_CFG_LIGHT_SLEEP;
+		sleep_mode = "light sleep";
+		break;
+	case SBI_SUSP_SLEEP_TYPE_SUSPEND:
+		mask = PCS_CFG_DEEP_SLEEP;
+		sleep_mode = "deep sleep";
+		break;
+	default:
+		return false;
+	}
+
+	if (!EXTRACT_FIELD(pcs_cfg, mask)) {
+		sbi_printf("ATCSMU: hart%d (PCS%d) does not support %s mode\n",
+			   hartid, hartid + 3, sleep_mode);
+		return false;
+	}
+
+	return true;
+}
+
+void atcsmu_set_command(u32 pcs_ctl, u32 hartid)
+{
+	writel_relaxed(pcs_ctl, (char *)atcsmu_base + PCSm_CTL_OFFSET(hartid));
+}
+
+int atcsmu_set_reset_vector(u64 wakeup_addr, u32 hartid)
+{
+	u32 vec_lo;
+	u32 vec_hi;
+	u64 reset_vector;
+
+	writel((u32)wakeup_addr, (char *)atcsmu_base + HARTn_RESET_VEC_LO(hartid));
+	writel((u32)(wakeup_addr >> 32), (char *)atcsmu_base + HARTn_RESET_VEC_HI(hartid));
+	vec_lo = readl((char *)atcsmu_base + HARTn_RESET_VEC_LO(hartid));
+	vec_hi = readl((char *)atcsmu_base + HARTn_RESET_VEC_HI(hartid));
+	reset_vector = (u64)vec_hi << 32 | vec_lo;
+	if (reset_vector != wakeup_addr) {
+		sbi_printf("ATCSMU: hart%d (PCS%d): failed to program the reset vector\n",
+			   hartid, hartid + 3);
+		return SBI_EFAIL;
+	}
+
+	return SBI_OK;
+}
+
+u32 atcsmu_get_sleep_type(u32 hartid)
+{
+	return readl_relaxed((char *)atcsmu_base + PCSm_SCRATCH_OFFSET(hartid));
+}
+
+static int ae350_hart_start(u32 hartid, ulong saddr)
+{
+	u32 hartindex = sbi_hartid_to_hartindex(hartid);
+
+	/*
+	 * Don't send wakeup command when:
+	 * 1) boot time
+	 * 2) the target hart is non-sleepable 25-series hart0
+	 */
+	if (!sbi_init_count(hartindex) || (is_andes(25) && hartid == 0))
+		return sbi_ipi_raw_send(hartindex, false);
+
+	atcsmu_set_command(WAKEUP_CMD, hartid);
+	return 0;
+}
+
+static int ae350_hart_stop(void)
+{
+	u32 hartid = current_hartid();
+	u32 sleep_type = atcsmu_get_sleep_type(hartid);
+	int rc;
+
+	/*
+	 * For Andes AX25MP, the hart0 shares power domain with the last level
+	 * cache. Instead of turning it off, it should fall through and jump to
+	 * warmboot_addr.
+	 */
+	if (is_andes(25) && hartid == 0)
+		return SBI_ENOTSUPP;
+
+	if (!atcsmu_support_sleep_mode(sleep_type, hartid))
+		return SBI_ENOTSUPP;
+
+	/* Prevent the core leaving the WFI mode unexpectedly */
+	csr_write(CSR_MIE, 0);
+
+	atcsmu_set_wakeup_events(0x0, hartid);
+	atcsmu_set_command(DEEP_SLEEP_CMD, hartid);
+	rc = atcsmu_set_reset_vector((u64)ae350_enable_coherency_warmboot, hartid);
+	if (rc)
+		return SBI_EFAIL;
+
+	ae350_disable_coherency();
+	wfi();
+	return 0;
+}
+
+static const struct sbi_hsm_device hsm_andes_atcsmu = {
+	.name = "andes_atcsmu",
+	.hart_start = ae350_hart_start,
+	.hart_stop = ae350_hart_stop,
+};
+
+static int hsm_andes_atcsmu_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	int poff;
+	int rc;
+
+	/* Need to find the parent for the address property  */
+	poff = fdt_parent_offset(fdt, nodeoff);
+	if (poff < 0)
+		return SBI_EINVAL;
+
+	rc = fdt_get_node_addr_size(fdt, poff, 0, &atcsmu_base, NULL);
+	if (rc < 0 || !atcsmu_base)
+		return SBI_ENODEV;
+
+	sbi_hsm_set_device(&hsm_andes_atcsmu);
+	return 0;
+}
+
+static const struct fdt_match hsm_andes_atcsmu_match[] = {
+	{ .compatible = "andestech,atcsmu-hsm" },
+	{ },
+};
+
+const struct fdt_driver fdt_hsm_andes_atcsmu = {
+	.match_table = hsm_andes_atcsmu_match,
+	.init = hsm_andes_atcsmu_probe,
+};
diff --git a/lib/utils/hsm/objects.mk b/lib/utils/hsm/objects.mk
index 0d0054494f18..f76af03c5c0a 100644
--- a/lib/utils/hsm/objects.mk
+++ b/lib/utils/hsm/objects.mk
@@ -7,6 +7,9 @@
 #   Anup Patel <apatel@ventanamicro.com>
 #
 
+carray-fdt_early_drivers-$(CONFIG_FDT_HSM_ANDES_ATCSMU) += fdt_hsm_andes_atcsmu
+libsbiutils-objs-$(CONFIG_FDT_HSM_ANDES_ATCSMU) += hsm/fdt_hsm_andes_atcsmu.o
+
 carray-fdt_early_drivers-$(CONFIG_FDT_HSM_RPMI) += fdt_hsm_rpmi
 libsbiutils-objs-$(CONFIG_FDT_HSM_RPMI) += hsm/fdt_hsm_rpmi.o
 
@@ -14,4 +17,4 @@ carray-fdt_early_drivers-$(CONFIG_FDT_HSM_SPACEMIT) += fdt_hsm_spacemit
 libsbiutils-objs-$(CONFIG_FDT_HSM_SPACEMIT) += hsm/fdt_hsm_spacemit.o
 
 carray-fdt_early_drivers-$(CONFIG_FDT_HSM_SIFIVE_TMC0) += fdt_hsm_sifive_tmc0
-libsbiutils-objs-$(CONFIG_FDT_HSM_SIFIVE_TMC0) += hsm/fdt_hsm_sifive_tmc0.o
\ No newline at end of file
+libsbiutils-objs-$(CONFIG_FDT_HSM_SIFIVE_TMC0) += hsm/fdt_hsm_sifive_tmc0.o
diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index 68e667163b5d..4835921f4b90 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -11,7 +11,7 @@ if FDT_RESET
 
 config FDT_RESET_ATCWDT200
 	bool "Andes WDT FDT reset driver"
-	depends on SYS_ATCSMU
+	depends on FDT_HSM_ANDES_ATCSMU
 	default n
 
 config FDT_RESET_GPIO
diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
index 2304582a9513..5dad8ac96d48 100644
--- a/lib/utils/reset/fdt_reset_atcwdt200.c
+++ b/lib/utils/reset/fdt_reset_atcwdt200.c
@@ -1,10 +1,7 @@
 /*
  * SPDX-License-Identifier: BSD-2-Clause
  *
- * Copyright (c) 2022 Andes Technology Corporation
- *
- * Authors:
- *   Yu Chien Peter Lin <peterlin@andestech.com>
+ * Copyright (c) 2025 Andes Technology Corporation
  */
 
 #include <libfdt.h>
@@ -15,7 +12,7 @@
 #include <sbi/sbi_system.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/sys/atcsmu.h>
+#include <sbi_utils/hsm/fdt_hsm_andes_atcsmu.h>
 
 #define ATCWDT200_WP_NUM 0x5aa5
 #define WREN_REG 0x18
@@ -41,8 +38,9 @@
 #define CLK_PCLK (1 << 1)
 #define WDT_EN (1 << 0)
 
+#define AE350_FLASH_BASE 0x80000000
+
 static volatile char *wdt_addr = NULL;
-static struct smu_data smu = { 0 };
 
 static int ae350_system_reset_check(u32 type, u32 reason)
 {
@@ -59,7 +57,7 @@ static int ae350_system_reset_check(u32 type, u32 reason)
 static void ae350_system_reset(u32 type, u32 reason)
 {
 	sbi_for_each_hartindex(i)
-		if (smu_set_reset_vector(&smu, FLASH_BASE, i))
+		if (atcsmu_set_reset_vector(AE350_FLASH_BASE, i))
 			goto fail;
 
 	/* Program WDT control register  */
@@ -88,16 +86,6 @@ static int atcwdt200_reset_init(const void *fdt, int nodeoff,
 		return SBI_ENODEV;
 
 	wdt_addr = (volatile char *)(unsigned long)reg_addr;
-
-	/*
-	 * The reset device requires smu to program the reset
-	 * vector for each hart.
-	 */
-	if (fdt_parse_compat_addr(fdt, &reg_addr, "andestech,atcsmu"))
-		return SBI_ENODEV;
-
-	smu.addr = (unsigned long)reg_addr;
-
 	sbi_system_reset_add_device(&atcwdt200_reset);
 
 	return 0;
diff --git a/lib/utils/sys/Kconfig b/lib/utils/sys/Kconfig
index a22191cd7c26..fc388665524d 100644
--- a/lib/utils/sys/Kconfig
+++ b/lib/utils/sys/Kconfig
@@ -2,10 +2,6 @@
 
 menu "System Device Support"
 
-config SYS_ATCSMU
-	bool "Andes System Management Unit (SMU) support"
-	default n
-
 config SYS_HTIF
 	bool "Host transfere interface (HTIF) support"
 	default n
diff --git a/lib/utils/sys/atcsmu.c b/lib/utils/sys/atcsmu.c
deleted file mode 100644
index 2cba0eb73e7e..000000000000
--- a/lib/utils/sys/atcsmu.c
+++ /dev/null
@@ -1,89 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-3-Clause
- *
- * Copyright (c) 2023 Andes Technology Corporation
- *
- * Authors:
- *   Yu Chien Peter Lin <peterlin@andestech.com>
- */
-
-#include <sbi_utils/sys/atcsmu.h>
-#include <sbi/riscv_io.h>
-#include <sbi/sbi_console.h>
-#include <sbi/sbi_error.h>
-#include <sbi/sbi_bitops.h>
-
-inline int smu_set_wakeup_events(struct smu_data *smu, u32 events, u32 hartid)
-{
-	if (smu) {
-		writel(events, (void *)(smu->addr + PCSm_WE_OFFSET(hartid)));
-		return 0;
-	} else
-		return SBI_EINVAL;
-}
-
-inline bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode,
-				   u32 hartid)
-{
-	u32 pcs_cfg;
-
-	if (!smu) {
-		sbi_printf("%s(): Failed to access smu_data\n", __func__);
-		return false;
-	}
-
-	pcs_cfg = readl((void *)(smu->addr + PCSm_CFG_OFFSET(hartid)));
-
-	switch (sleep_mode) {
-	case LIGHTSLEEP_MODE:
-		if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_LIGHT_SLEEP) == 0) {
-			sbi_printf("SMU: hart%d (PCS%d) does not support light sleep mode\n",
-				   hartid, hartid + 3);
-			return false;
-		}
-		break;
-	case DEEPSLEEP_MODE:
-		if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_DEEP_SLEEP) == 0) {
-			sbi_printf("SMU: hart%d (PCS%d) does not support deep sleep mode\n",
-				   hartid, hartid + 3);
-			return false;
-		}
-		break;
-	}
-
-	return true;
-}
-
-inline int smu_set_command(struct smu_data *smu, u32 pcs_ctl, u32 hartid)
-{
-	if (smu) {
-		writel(pcs_ctl, (void *)(smu->addr + PCSm_CTL_OFFSET(hartid)));
-		return 0;
-	} else
-		return SBI_EINVAL;
-}
-
-inline int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr,
-				u32 hartid)
-{
-	u32 vec_lo, vec_hi;
-	u64 reset_vector;
-
-	if (!smu)
-		return SBI_EINVAL;
-
-	writel(wakeup_addr, (void *)(smu->addr + HARTn_RESET_VEC_LO(hartid)));
-	writel((u64)wakeup_addr >> 32,
-	       (void *)(smu->addr + HARTn_RESET_VEC_HI(hartid)));
-
-	vec_lo = readl((void *)(smu->addr + HARTn_RESET_VEC_LO(hartid)));
-	vec_hi = readl((void *)(smu->addr + HARTn_RESET_VEC_HI(hartid)));
-	reset_vector = ((u64)vec_hi << 32) | vec_lo;
-
-	if (reset_vector != (u64)wakeup_addr) {
-		sbi_printf("hart%d (PCS%d): Failed to program the reset vector.\n",
-			   hartid, hartid + 3);
-		return SBI_EFAIL;
-	} else
-		return 0;
-}
diff --git a/lib/utils/sys/objects.mk b/lib/utils/sys/objects.mk
index 409d7e8c7ef6..d9c67077a3a6 100644
--- a/lib/utils/sys/objects.mk
+++ b/lib/utils/sys/objects.mk
@@ -8,4 +8,3 @@
 #
 
 libsbiutils-objs-$(CONFIG_SYS_HTIF) += sys/htif.o
-libsbiutils-objs-$(CONFIG_SYS_ATCSMU) += sys/atcsmu.o
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 716fab42a7b7..0c11fbd2c29f 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -36,7 +36,6 @@ config PLATFORM_ALLWINNER_D1
 
 config PLATFORM_ANDES_AE350
 	bool "Andes AE350 support"
-	select SYS_ATCSMU
 	select ANDES_PMU
 	select ANDES_PMA
 	default n
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 0808065745af..fa3f03685bba 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -1,121 +1,25 @@
 /*
  * SPDX-License-Identifier: BSD-2-Clause
  *
- * Copyright (c) 2022 Andes Technology Corporation
- *
- * Authors:
- *   Yu Chien Peter Lin <peterlin@andestech.com>
+ * Copyright (c) 2025 Andes Technology Corporation
  */
 
-#include <platform_override.h>
-#include <andes/andes_pmu.h>
-#include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/fdt/fdt_fixup.h>
-#include <sbi_utils/sys/atcsmu.h>
-#include <sbi/riscv_asm.h>
-#include <sbi/sbi_bitops.h>
-#include <sbi/sbi_error.h>
-#include <sbi/sbi_hsm.h>
-#include <sbi/sbi_ipi.h>
-#include <sbi/sbi_init.h>
 #include <andes/andes.h>
+#include <andes/andes_pmu.h>
 #include <andes/andes_sbi.h>
+#include <platform_override.h>
+#include <sbi_utils/fdt/fdt_helper.h>
 
-static struct smu_data smu = { 0 };
-extern void __ae350_enable_coherency_warmboot(void);
-extern void __ae350_disable_coherency(void);
-
-static int ae350_hart_start(u32 hartid, ulong saddr)
-{
-	u32 hartindex = sbi_hartid_to_hartindex(hartid);
-
-	/*
-	 * Don't send wakeup command when:
-	 * 1) boot-time
-	 * 2) the target hart is non-sleepable 25-series hart0
-	 */
-	if (!sbi_init_count(hartindex) || (is_andes(25) && hartid == 0))
-		return sbi_ipi_raw_send(hartindex, false);
-
-	/* Write wakeup command to the sleep hart */
-	smu_set_command(&smu, WAKEUP_CMD, hartid);
-
-	return 0;
-}
-
-static int ae350_hart_stop(void)
-{
-	int rc;
-	u32 hartid = current_hartid();
-
-	/**
-	 * For Andes AX25MP, the hart0 shares power domain with
-	 * L2-cache, instead of turning it off, it should fall
-	 * through and jump to warmboot_addr.
-	 */
-	if (is_andes(25) && hartid == 0)
-		return SBI_ENOTSUPP;
-
-	if (!smu_support_sleep_mode(&smu, DEEPSLEEP_MODE, hartid))
-		return SBI_ENOTSUPP;
-
-	/**
-	 * disable all events, the current hart will be
-	 * woken up from reset vector when other hart
-	 * writes its PCS (power control slot) control
-	 * register
-	 */
-	smu_set_wakeup_events(&smu, 0x0, hartid);
-	smu_set_command(&smu, DEEP_SLEEP_CMD, hartid);
-
-	rc = smu_set_reset_vector(&smu,
-				  (ulong)__ae350_enable_coherency_warmboot,
-				  hartid);
-	if (rc)
-		goto fail;
-
-	__ae350_disable_coherency();
-
-	wfi();
-
-fail:
-	/* It should never reach here */
-	sbi_hart_hang();
-	return 0;
-}
-
-static const struct sbi_hsm_device andes_smu = {
-	.name	      = "andes_smu",
-	.hart_start   = ae350_hart_start,
-	.hart_stop    = ae350_hart_stop,
-};
-
-static void ae350_hsm_device_init(const void *fdt)
-{
-	int rc;
-
-	rc = fdt_parse_compat_addr(fdt, (uint64_t *)&smu.addr,
-				   "andestech,atcsmu");
-
-	if (!rc) {
-		sbi_hsm_set_device(&andes_smu);
-	}
-}
+extern void _start_warm(void);
 
-static int ae350_final_init(bool cold_boot)
+void ae350_enable_coherency_warmboot(void)
 {
-	if (cold_boot) {
-		const void *fdt = fdt_get_address();
-
-		ae350_hsm_device_init(fdt);
-	}
-
-	return generic_final_init(cold_boot);
+	ae350_enable_coherency();
+	_start_warm();
 }
 
 static int ae350_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
-	generic_platform_ops.final_init = ae350_final_init;
 	generic_platform_ops.extensions_init = andes_pmu_extensions_init;
 	generic_platform_ops.pmu_init = andes_pmu_init;
 	generic_platform_ops.vendor_ext_provider = andes_sbi_vendor_ext_provider;
diff --git a/platform/generic/andes/objects.mk b/platform/generic/andes/objects.mk
index f85ad48162b2..660546c312fe 100644
--- a/platform/generic/andes/objects.mk
+++ b/platform/generic/andes/objects.mk
@@ -3,7 +3,7 @@
 #
 
 carray-platform_override_modules-$(CONFIG_PLATFORM_ANDES_AE350) += andes_ae350
-platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o andes/sleep.o
+platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o
 
 carray-platform_override_modules-$(CONFIG_PLATFORM_ANDES_QILAI) += andes_qilai
 platform-objs-$(CONFIG_PLATFORM_ANDES_QILAI) += andes/qilai.o
diff --git a/platform/generic/andes/sleep.S b/platform/generic/andes/sleep.S
deleted file mode 100644
index 361aff3a6024..000000000000
--- a/platform/generic/andes/sleep.S
+++ /dev/null
@@ -1,70 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2023 Andes Technology Corporation
- *
- * Authors:
- *   Yu Chien Peter Lin <peterlin@andestech.com>
- */
-
-#include <sbi/riscv_encoding.h>
-#include <sbi/riscv_asm.h>
-#include <andes/andes.h>
-
-	.section .text, "ax", %progbits
-	.align 3
-	.global __ae350_disable_coherency
-__ae350_disable_coherency:
-	/* flush d-cache */
-	csrw	CSR_MCCTLCOMMAND, 0x6
-	/* disable i/d-cache */
-	csrc	CSR_MCACHE_CTL, 0x3
-	/* disable d-cache coherency */
-	lui	t1, 0x80
-	csrc	CSR_MCACHE_CTL, t1
-	/*
-	 * wait for mcache_ctl.DC_COHSTA to be cleared,
-	 * the bit is hard-wired 0 on platforms w/o CM
-	 * (Coherence Manager)
-	 */
-check_cm_disabled:
-	csrr	t1, CSR_MCACHE_CTL
-	srli	t1, t1, 20
-	andi	t1, t1, 0x1
-	bnez	t1, check_cm_disabled
-
-	ret
-
-	.section .text, "ax", %progbits
-	.align 3
-	.global __ae350_enable_coherency
-__ae350_enable_coherency:
-	/* enable d-cache coherency */
-	lui		t1, 0x80
-	csrs	CSR_MCACHE_CTL, t1
-	/*
-	 * mcache_ctl.DC_COHEN is hard-wired 0 on platforms
-	 * w/o CM support
-	 */
-	csrr	t1, CSR_MCACHE_CTL
-	srli	t1, t1, 19
-	andi	t1, t1, 0x1
-	beqz	t1, enable_L1_cache
-	/* wait for mcache_ctl.DC_COHSTA to be set */
-check_cm_enabled:
-	csrr	t1, CSR_MCACHE_CTL
-	srli	t1, t1, 20
-	andi	t1, t1, 0x1
-	beqz	t1, check_cm_enabled
-enable_L1_cache:
-	/* enable i/d-cache */
-	csrs	CSR_MCACHE_CTL, 0x3
-
-	ret
-
-	.section .text, "ax", %progbits
-	.align 3
-	.global __ae350_enable_coherency_warmboot
-__ae350_enable_coherency_warmboot:
-	call ra, __ae350_enable_coherency
-	j _start_warm
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index aab1560f2399..d85da930edbc 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -23,6 +23,7 @@ CONFIG_FDT_GPIO_DESIGNWARE=y
 CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_GPIO_STARFIVE=y
 CONFIG_FDT_HSM=y
+CONFIG_FDT_HSM_ANDES_ATCSMU=y
 CONFIG_FDT_HSM_RPMI=y
 CONFIG_FDT_HSM_SIFIVE_TMC0=y
 CONFIG_FDT_I2C=y
diff --git a/platform/generic/include/andes/andes.h b/platform/generic/include/andes/andes.h
index bfedf034c902..1b5893925c10 100644
--- a/platform/generic/include/andes/andes.h
+++ b/platform/generic/include/andes/andes.h
@@ -6,6 +6,9 @@
 #ifndef _RISCV_ANDES_H
 #define _RISCV_ANDES_H
 
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_scratch.h>
+
 /* Memory and Miscellaneous Registers */
 #define CSR_MCACHE_CTL		0x7ca
 #define CSR_MCCTLCOMMAND	0x7cc
@@ -43,13 +46,23 @@
 #define MMSC_IOCP_OFFSET		47
 #define MMSC_IOCP_MASK			(1ULL << MMSC_IOCP_OFFSET)
 
+#define MCACHE_CTL_IC_EN_MASK		BIT(0)
+#define MCACHE_CTL_DC_EN_MASK		BIT(1)
 #define MCACHE_CTL_CCTL_SUEN_OFFSET	8
 #define MCACHE_CTL_CCTL_SUEN_MASK	(1 << MCACHE_CTL_CCTL_SUEN_OFFSET)
+#define MCACHE_CTL_DC_COHEN_MASK	BIT(19)
+#define MCACHE_CTL_DC_COHSTA_MASK	BIT(20)
 
 /* Performance monitor */
 #define MMSC_CFG_PMNDS_MASK		(1 << 15)
 #define MIP_PMOVI			(1 << 18)
 
+/* Cache control commands */
+#define MCCTLCOMMAND_L1D_WBINVAL_ALL	6
+
+/* AE350 platform specific sleep types */
+#define SBI_SUSP_AE350_LIGHT_SLEEP	SBI_SUSP_PLATFORM_SLEEP_START
+
 #ifndef __ASSEMBLER__
 
 #define is_andes(series)				\
@@ -67,4 +80,53 @@
 
 #endif /* __ASSEMBLER__ */
 
+void ae350_enable_coherency_warmboot(void);
+
+/*
+ * On Andes 4X-series CPUs, disabling the L1 data cache causes the CPU to fetch
+ * data directly from RAM. However, L1 cache flushes write data back to the
+ * Last Level Cache (LLC). This discrepancy can lead to return address
+ * corruption on the stack. To prevent this, the following functions must
+ * be inlined.
+ */
+static inline void ae350_disable_coherency(void)
+{
+	/*
+	 * To disable cache coherency of a core in AE350 platform, follow below steps:
+	 *
+	 * 1) Disable I/D-Cache
+	 * 2) Write back and invalidate D-Cache
+	 * 3) Disable D-Cache coherency
+	 * 4) Wait for D-Cache disengaged from the coherence management
+	 */
+	csr_clear(CSR_MCACHE_CTL, MCACHE_CTL_IC_EN_MASK | MCACHE_CTL_DC_EN_MASK);
+	csr_write(CSR_MCCTLCOMMAND, MCCTLCOMMAND_L1D_WBINVAL_ALL);
+	csr_clear(CSR_MCACHE_CTL, MCACHE_CTL_DC_COHEN_MASK);
+	while (csr_read(CSR_MCACHE_CTL) & MCACHE_CTL_DC_COHSTA_MASK)
+		;
+}
+
+static inline void ae350_enable_coherency(void)
+{
+	/*
+	 * To enable cache coherency of a core in AE350 platform, follow below steps:
+	 *
+	 * 1) Enable D-Cache coherency
+	 * 2) Wait for D-Cache engaging in the coherence management
+	 * 3) Enable I/D-Cache
+	 */
+	csr_set(CSR_MCACHE_CTL, MCACHE_CTL_DC_COHEN_MASK);
+
+	/*
+	 * mcache_ctl.DC_COHEN is hardwired to 0 if there is no coherence
+	 * manager. In such situation, just enable the I/D-Cache to prevent
+	 * permanently being stuck in the while loop.
+	 */
+	if (csr_read(CSR_MCACHE_CTL) & MCACHE_CTL_DC_COHEN_MASK)
+		while (!(csr_read(CSR_MCACHE_CTL) & MCACHE_CTL_DC_COHSTA_MASK))
+			;
+
+	csr_set(CSR_MCACHE_CTL, MCACHE_CTL_IC_EN_MASK | MCACHE_CTL_DC_EN_MASK);
+}
+
 #endif /* _RISCV_ANDES_H */
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
