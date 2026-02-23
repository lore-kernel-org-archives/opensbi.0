Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A36EA4FC7
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqVflsQx0OtaSVbAIxtutmvtLqb1mJkoXado6GMN2uY=; b=uUxkrhctROjXfP
	VzUXNcs+FIyDxq5b+zojIcocVuCheJa4Ce7N9z8pCEzlkdr1MskaF8X8s5Kk/2zkVIRTYJQYgxc+W
	3mtMNV8c5vfMbWWGREIYrVOFavAXAz+DH4V1gzQO0GMyQ4YZi+b+UrPtfmwtbWvxT1DVadEQPCzoG
	/fkdg7aYBDtXluTNQV8n47pIJVE3ZepV6CloElyoqfWCweFJvykX3+2yAGMXK1oRIPuZF4tSTvj9o
	hqmVoAMDYNdmjfstwW4XzaDma96MwyRDoOrbdBV3ttxJxBQfjWjeMMFVwwZjI0cmGFN+MO4tdn/Zx
	ZVxrHV/MxdXc5jIRdgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLW-00000000Vj4-2xfI;
	Mon, 23 Feb 2026 14:55:38 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLT-00000000Vat-02ew
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858533; x=1803394533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xvbw0q/H8WsQlVEI1Uu59xfA4MI02X6kevufadjp5Eo=;
  b=QxCUn9/COJV1a8HXOi1Dy3Iz4OngpzLCPP2QADTUHftHue2wzqVDJypB
   i65ostpQ8izp/YFGlH6DosLCx1lfIAuexw6ERR0WwjU8tnpceII6edg+r
   h2yDz4K9t348SwqD2GQ6x7GG4SfaTbzu7EYrKumJNNIPnamkSlZ1xZCnV
   FAW5umLotTG3XfrX5H7zgPqtupHDL639ooLRuF4lUZTsOO/A07b8RRuY2
   A+TnAZ79MJDNLMtl1uKSNJxkAdeVBMDazTa71B0T9piSKJx7Dr6pkzupA
   sayayOO0IQxeau8p55OFgvRMRslQrdp36Gacraka6nAv0YwJjjPRtVRQw
   g==;
X-CSE-ConnectionGUID: qI7r+ZoDSMW1Btie+JMykQ==
X-CSE-MsgGUID: OxSPkdSqQOGEFlOmt+2z6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:31 +0200
X-CSE-ConnectionGUID: khqxQ9jRQVyrsmShSqyV4A==
X-CSE-MsgGUID: 5hycmhG1Tua2SJd0aO6vBg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:05 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:32 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 10/23] platform: generic: mips: add P8700 based "eyeq7h" and "boston"
Date: Mon, 23 Feb 2026 16:54:49 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-10-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065535_491406_4734ADA2 
X-CRM114-Status: GOOD (  27.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Refactor MIPS P8700 support, convert P8700 into a "CPU" and add
2 platforms using this CPU:
- "boston" - FPGA platform developed by MIPS
- "eyeq7h" - automotive platform by Mobileye

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/Kconfig              |  16 +-
 platform/generic/configs/defconfig    |   3 +-
 platform/generic/include/mips/board.h |  18 --
 platform/generic/include/mips/p8700.h |  23 ++-
 platform/generic/mips/boston.c        | 168 +++++++++++++++++++
 platform/generic/mips/eyeq7h.c        | 306 ++++++++++++++++++++++++++++++++++
 platform/generic/mips/objects.mk      |   7 +-
 platform/generic/mips/p8700.c         | 208 +----------------------
 8 files changed, 523 insertions(+), 226 deletions(-)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 0c11fbd2c29fec2959f1e73737870b55361fa4ed..2627998a0b5bfdbb9c95c2b60098d039aca9ba95 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -91,15 +91,23 @@ config PLATFORM_THEAD
 	select THEAD_C9XX_PMU
 	default n
 
-config PLATFORM_MIPS_P8700
-	bool "MIPS P8700 support"
-	default n
-
 config PLATFORM_SPACEMIT_K1
 	bool "Spacemit K1 support"
 	select FDT_HSM_SPACEMIT
 	default n
 
+config CPU_MIPS_P8700
+	bool
+	default n
+
+config PLATFORM_MIPS_P8700_EYEQ7H
+	select CPU_MIPS_P8700
+	bool "EyeQ7H"
+
+config PLATFORM_MIPS_P8700_BOSTON
+	select CPU_MIPS_P8700
+	bool "Boston"
+
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/eswin/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 727c5f4abfd0b7e99d51bfcb419d213fe7960cd7..346058f5a7bf48d864ccbd70937f9498344763d6 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -10,7 +10,8 @@ CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
-CONFIG_PLATFORM_MIPS_P8700=y
+CONFIG_PLATFORM_MIPS_P8700_EYEQ7H=y
+CONFIG_PLATFORM_MIPS_P8700_BOSTON=y
 CONFIG_PLATFORM_SPACEMIT_K1=y
 CONFIG_FDT_CACHE=y
 CONFIG_FDT_CACHE_ANDES_LLCACHE=y
diff --git a/platform/generic/include/mips/board.h b/platform/generic/include/mips/board.h
deleted file mode 100644
index b72d77d6c906662bcf97df67a2a3fb5ebc973f20..0000000000000000000000000000000000000000
--- a/platform/generic/include/mips/board.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2025 MIPS
- *
- */
-
-#ifndef __BOARD_H__
-#define __BOARD_H__
-
-/* Please review all defines to change for your board. */
-
-/* Use in cps-vec.S */
-#define DRAM_ADDRESS		0x80000000
-#define DRAM_SIZE		0x80000000
-#define DRAM_PMP_ADDR		((DRAM_ADDRESS >> 2) | ((DRAM_SIZE - 1) >> 3))
-
-#endif
diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 8281e5e6cef289fd02458f468f06256fc196937c..5facd38af39fe0bc9d6de18a6c7423396e828873 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -8,8 +8,6 @@
 #ifndef __P8700_H__
 #define __P8700_H__
 
-#include <mips/board.h>
-
 /** Coherence manager information
  *
  * @num_cm: Number of coherence manager
@@ -97,6 +95,17 @@ extern const struct p8700_cm_info *p8700_cm_info;
 /* GCR Block offsets */
 #define GCR_OFF_LOCAL		0x2000
 
+#define GCR_GLOBAL_CONFIG	0x0000
+#define GCR_GC_NUM_CORES	GENMASK(7, 0)
+#define GCR_GC_NUM_IOCUS	GENMASK(11, 8)
+#define GCR_GC_NUM_MMIOS	GENMASK(19, 16)
+#define GCR_GC_NUM_AUX		GENMASK(22, 20)
+#define GCR_GC_NUM_CLUSTERS	GENMASK(29, 23)
+#define GCR_GC_HAS_ITU		BIT(31)
+#define GCR_GC_CL_ID		GENMASK(39, 32)
+#define GCR_GC_HAS_DBU		BIT(40)
+#define GCR_GC_NOC		GENMASK(43, 41)
+
 #define GCR_BASE_OFFSET		0x0008
 #define GCR_CORE_COH_EN		0x00f8
 #define GCR_CORE_COH_EN_EN	(0x1 << 0)
@@ -122,4 +131,14 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define CPC_Cx_STAT_CONF_SEQ_STATE_U5	6
 #define CPC_Cx_STAT_CONF_SEQ_STATE_U6	7
 
+extern const struct p8700_cm_info *p8700_cm_info;
+void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
+			unsigned long prot, unsigned long addr,
+			unsigned long log2len);
+void mips_p8700_power_up_other_cluster(u32 hartid);
+int mips_p8700_hart_start(u32 hartid, ulong saddr);
+int mips_p8700_hart_stop(void);
+struct fdt_match;
+int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match);
+
 #endif
diff --git a/platform/generic/mips/boston.c b/platform/generic/mips/boston.c
new file mode 100644
index 0000000000000000000000000000000000000000..86e14c1eea7e629f70b118be326dc1de1f099f30
--- /dev/null
+++ b/platform/generic/mips/boston.c
@@ -0,0 +1,168 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#include <platform_override.h>
+#include <sbi/riscv_barrier.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_timer.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <mips/p8700.h>
+#include <mips/mips-cm.h>
+
+/* Use in nascent init - not have DTB yet */
+#define DRAM_ADDRESS		0x80000000
+#define DRAM_SIZE		0x80000000
+#define DRAM_PMP_ADDR		((DRAM_ADDRESS >> 2) | ((DRAM_SIZE - 1) >> 3))
+
+static const struct sbi_hsm_device mips_hsm = {
+	.name		= "mips_hsm",
+	.hart_start	= mips_p8700_hart_start,
+	.hart_stop	= mips_p8700_hart_stop,
+};
+
+static int boston_final_init(bool cold_boot)
+{
+	if (cold_boot)
+		sbi_hsm_set_device(&mips_hsm);
+
+	return generic_final_init(cold_boot);
+}
+
+static int boston_early_init(bool cold_boot)
+{
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
+	if (cold_boot) {
+		unsigned long cm_base = p8700_cm_info->gcr_base[0];
+
+		/* For the CPC mtime region, the minimum size is 0x10000. */
+		rc = sbi_domain_root_add_memrange(cm_base, SIZE_FOR_CPC_MTIME,
+						  P8700_ALIGN,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+
+		/* For the APLIC and ACLINT m-mode region */
+		rc = sbi_domain_root_add_memrange(cm_base + AIA_OFFSET, SIZE_FOR_AIA_M_MODE,
+						  P8700_ALIGN,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+
+	}
+
+	return 0;
+}
+
+static int boston_nascent_init(void)
+{
+	u64 hartid = current_hartid();
+	unsigned long cm_base = p8700_cm_info->gcr_base[0];
+	int i;
+
+	/* Coherence enable for every core */
+	if (cpu_hart(hartid) == 0) {
+		cm_base += (cpu_core(hartid) << CM_BASE_CORE_SHIFT);
+		__raw_writeq(GCR_CORE_COH_EN_EN,
+			     (void *)(cm_base + GCR_OFF_LOCAL +
+				      GCR_CORE_COH_EN));
+		mb();
+	}
+
+	/* Set up pmp for DRAM */
+	csr_write(CSR_PMPADDR14, DRAM_PMP_ADDR);
+	/* All from 0x0 */
+	csr_write(CSR_PMPADDR15, 0x1fffffffffffffff);
+	csr_write(CSR_PMPCFG2, ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<56)|
+		  ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<48));
+	/* Set cacheable for pmp6, uncacheable for pmp7 */
+	csr_write(CSR_MIPSPMACFG2, ((u64)CCA_CACHE_DISABLE << 56)|
+		  ((u64)CCA_CACHE_ENABLE << 48));
+	/* Reset pmpcfg0 */
+	csr_write(CSR_PMPCFG0, 0);
+	/* Reset pmacfg0 */
+	csr_write(CSR_MIPSPMACFG0, 0);
+	mb();
+
+	/* Per cluster set up */
+	if (cpu_core(hartid) == 0 && cpu_hart(hartid) == 0) {
+		/* Enable L2 prefetch */
+		__raw_writel(0xfffff110,
+			     (void *)(cm_base + L2_PFT_CONTROL_OFFSET));
+		__raw_writel(0x15ff,
+			     (void *)(cm_base + L2_PFT_CONTROL_B_OFFSET));
+	}
+
+	/* Per core set up */
+	if (cpu_hart(hartid) == 0) {
+		/* Enable load pair, store pair, and HTW */
+		csr_clear(CSR_MIPSCONFIG7, (1<<12)|(1<<13)|(1<<7));
+
+		/* Disable noRFO, misaligned load/store */
+		csr_set(CSR_MIPSCONFIG7, (1<<25)|(1<<9));
+
+		/* Enable L1-D$ Prefetch */
+		csr_write(CSR_MIPSCONFIG11, 0xff);
+
+		for (i = 0; i < 8; i++) {
+			csr_set(CSR_MIPSCONFIG8, 4 + 0x100 * i);
+			csr_set(CSR_MIPSCONFIG9, 8);
+			mb();
+			RISCV_FENCE_I;
+		}
+	}
+
+	/* Per hart set up */
+	/* Enable AMO and RDTIME illegal instruction exceptions. */
+	csr_set(CSR_MIPSCONFIG6, (1<<2)|(1<<1));
+
+	return 0;
+}
+
+static int boston_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	int rc = mips_p8700_platform_init(fdt, nodeoff, match);
+
+	if (rc)
+		return rc;
+	generic_platform_ops.early_init = boston_early_init;
+	generic_platform_ops.final_init = boston_final_init;
+	generic_platform_ops.nascent_init = boston_nascent_init;
+	generic_platform_ops.pmp_set = mips_p8700_pmp_set;
+
+	return 0;
+}
+
+static unsigned long boston_gcr_base[] = {
+	0x16100000,
+};
+
+static struct p8700_cm_info boston_cm_info = {
+	.num_cm = array_size(boston_gcr_base),
+	.gcr_base = boston_gcr_base,
+};
+
+static const struct fdt_match boston_match[] = {
+	{ .compatible = "mips,p8700", .data = &boston_cm_info },
+	{ },
+};
+
+const struct fdt_driver mips_p8700_boston = {
+	.match_table = boston_match,
+	.init = boston_platform_init,
+};
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
new file mode 100644
index 0000000000000000000000000000000000000000..4e20a4d09efd5e05c323a2ca25813b8ef54aba99
--- /dev/null
+++ b/platform/generic/mips/eyeq7h.c
@@ -0,0 +1,306 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Mobileye
+ *
+ */
+
+#include <platform_override.h>
+#include <sbi/riscv_barrier.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_timer.h>
+#include <sbi/sbi_hart_pmp.h>
+#include <sbi/riscv_io.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <mips/p8700.h>
+#include <mips/mips-cm.h>
+
+#define OLB_WEST		0x48600000
+#define OLB_WEST_TSTCSR		0x60
+#define TSTCSR_PALLADIUM	BIT(0)
+#define TSTCSR_DDR_STUB		BIT(1)
+#define TSTCSR_MIPS12_PRESENT	GENMASK(3, 2)
+#define TSTCSR_ACC_PRESENT	GENMASK(5, 4)
+
+/* Use in nascent init - not have DTB yet */
+#define DRAM_ADDRESS		0x800000000UL
+#define DRAM_SIZE		0x800000000UL
+#define DRAM_PMP_ADDR		((DRAM_ADDRESS >> 2) | ((DRAM_SIZE - 1) >> 3))
+
+#define MMIO_BASE 0x00000000
+#define MMIO_SIZE 0x80000000
+
+static int eyeq7h_active_clusters = 1;
+
+static void eyeq7h_power_up_other_cluster(u32 hartid)
+{
+	unsigned int cl = cpu_cluster(hartid);
+	unsigned long cm_base = p8700_cm_info->gcr_base[cl];
+
+	/* remap local cluster address to its global address */
+	writeq(cm_base, (void*)cm_base + GCR_BASE_OFFSET);
+	wmb();
+	mips_p8700_power_up_other_cluster(hartid);
+}
+
+static int hart_start(u32 hartid, ulong saddr)
+{
+	if (cpu_cluster(hartid) >= eyeq7h_active_clusters) {
+		sbi_printf("Requested CPU 0x%x in inactive/nonexistent cluster\n", hartid);
+		return SBI_EINVALID_ADDR;
+	}
+
+	return mips_p8700_hart_start(hartid, saddr);
+}
+
+static const struct sbi_hsm_device eyeq7h_hsm = {
+	.name		= "eyeq7h_hsm",
+	.hart_start	= hart_start,
+	.hart_stop	= mips_p8700_hart_stop,
+};
+
+static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain *dom)
+{
+	struct sbi_domain_memregion *reg;
+
+	sbi_domain_for_each_memregion(dom, reg) {}
+	return --reg;
+}
+
+static int eyeq7h_final_init(bool cold_boot)
+{
+	if (!cold_boot)
+		return 0;
+
+	sbi_hsm_set_device(&eyeq7h_hsm);
+
+	return generic_final_init(cold_boot);
+}
+
+/**
+ * There's 2 sources of information what clusters are present:
+ * - GCR_CONFIG register from the cluster 0 GCR
+ * - TSTCSR_MIPS12_PRESENT from the TSTCSR reg in OLB_WEST
+ * check that both indicates presence of clusters
+ */
+static void eyeq7h_init_clusters(void)
+{
+	unsigned long cm_base = p8700_cm_info->gcr_base[0];
+	u64 gcr_config = readq((void*)cm_base + GCR_GLOBAL_CONFIG);
+	int num_clusters = EXTRACT_FIELD(gcr_config, GCR_GC_NUM_CLUSTERS);
+	u32 tstcsr = readl((void*)OLB_WEST + OLB_WEST_TSTCSR);
+	u32 mips12_present = EXTRACT_FIELD(tstcsr, TSTCSR_MIPS12_PRESENT);
+	/**
+	 * total clusters, by mips[12] encoding.
+	 * Don't support only mips2 present, consider as 1 total cluster
+	 */
+	static const int olb_clusters[4] = {1, 2, 1, 3};
+	int num_olb_clusters = olb_clusters[mips12_present];
+	static const char YN[2] = {'N', 'Y'};
+
+	sbi_dprintf("GCR_CONFIG reports %d clusters\n", num_clusters);
+	sbi_dprintf("OLB indicates %d clusters, mips[12] = [%c%c]\n",
+		    num_olb_clusters,
+		    YN[mips12_present & BIT(0)],
+		    YN[mips12_present >> 1 & BIT(0)]);
+	if (num_clusters > num_olb_clusters)
+		num_clusters = num_olb_clusters;
+	sbi_dprintf("Use %d clusters\n", num_clusters);
+	/* Power up other clusters in the platform. */
+	for (int i = 1; i < num_clusters; i++) {
+		eyeq7h_power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
+	}
+	eyeq7h_active_clusters = num_clusters;
+}
+
+static int eyeq7h_early_init(bool cold_boot)
+{
+	int rc;
+	unsigned long cm_base;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
+	if (!cold_boot)
+		return 0;
+
+	cm_base = p8700_cm_info->gcr_base[0];
+	sbi_dprintf("Remap Cluster %d CM 0x%lx -> 0x%lx\n", 0,
+		    readq((void*)cm_base + GCR_BASE_OFFSET),
+		    cm_base);
+	writeq(cm_base, (void*)cm_base + GCR_BASE_OFFSET);
+	wmb();
+	eyeq7h_init_clusters();
+/**
+ * Memory map:
+ * 0x00_20080000  0x00_20100000   M:IRW- S:---- GCR local access (CM_BASE)
+ * 0x00_40000000  0x00_70000000   M:IRW- S:IRW- Peripherals
+ *   0x00_48700000  0x00_48780000 M:IRW- S:---- GCR cluster 0
+ *   0x00_67480000  0x00_67500000 M:IRW- S:---- GCR cluster 1
+ *   0x00_67500000  0x00_67580000 M:IRW- S:---- GCR cluster 2
+ *   0x00_67800000  0x00_67900000 M:IRW- S:---- Ncore
+ * 0x00_70000000  0x00_80000000   M:---- S:IRW- PCI32 BARs, NOT USED - 32-bit mode
+ * 0x01_00000000  0x08_00000000   M:---- S:IRW- PCI64 BARs, NOT USED - PCI2PCI
+ * 0x08_00000000  0x10_00000000   M:---- S:-RWX DDR64
+ * 0x10_00000000  0x20_00000000   M:---- S:IRW- PCI64 BARs
+ */
+
+	for (int i = 0; i < p8700_cm_info->num_cm; i++) {
+		unsigned long cm_base = p8700_cm_info->gcr_base[i];
+
+		/* CM and MTIMER */
+		rc = sbi_domain_root_add_memrange(cm_base, SIZE_FOR_CPC_MTIME,
+						  SIZE_FOR_CPC_MTIME,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+
+		/* For the APLIC and ACLINT m-mode region */
+		rc = sbi_domain_root_add_memrange(cm_base + AIA_OFFSET, SIZE_FOR_AIA_M_MODE,
+						  SIZE_FOR_AIA_M_MODE,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+	}
+	/* the rest of MMIO - shared with S-mode */
+	rc = sbi_domain_root_add_memrange(MMIO_BASE, MMIO_SIZE, MMIO_SIZE,
+					  SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW);
+	if (rc)
+		return rc;
+	/* PCIE BARs - MMIO S-mode */
+	rc = sbi_domain_root_add_memrange(0x1000000000UL, 0x1000000000UL, 0x1000000000UL,
+					  SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_SU_READABLE |
+					  SBI_DOMAIN_MEMREGION_SU_WRITABLE);
+
+	return 0;
+}
+
+static int eyeq7h_nascent_init(void)
+{
+	unsigned hartid = current_hartid();
+	unsigned cl = cpu_cluster(hartid);
+	unsigned long cm_base = p8700_cm_info->gcr_base[cl];
+	int i;
+
+	/* Coherence enable for every core */
+	if (cpu_hart(hartid) == 0) {
+		cm_base += (cpu_core(hartid) << CM_BASE_CORE_SHIFT);
+		__raw_writeq(GCR_CORE_COH_EN_EN,
+			     (void *)(cm_base + GCR_OFF_LOCAL +
+				      GCR_CORE_COH_EN));
+		mb();
+	}
+
+	/**
+	 * Boot code set PMP14 and PMP15 to allow basic cacheable and uncacheable
+	 * access.
+	 * To avoid hang during PMP count detection, set up PMP13 same as PMP14
+	 * Point is, PMP count detection procedure tries to write every PMP
+	 * entry with maximum allowed value, then return original value.
+	 * If memory covered only by PMP14, when it is written, next instruction
+	 * fetch will fail. Use PMP13 as a back-up for PMP14. When PMP13 tested,
+	 * PMP14 will serve the memory access; when PMP14 tested, PMP13 will
+	 * provide memory access
+	 */
+	/* Set up pmp for DRAM */
+	csr_write(CSR_PMPADDR13, DRAM_PMP_ADDR);
+	csr_write(CSR_PMPADDR14, DRAM_PMP_ADDR);
+	/*
+	 * FIXME: for unknown reason if I copy PMP14 to PMP13 using
+	 * csr_write(CSR_PMPADDR13, csr_read(CSR_PMPADDR14));
+	 * instead of writing as above, system hangs on late Linux boot
+	 */
+	/* All from 0x0 */
+	csr_write(CSR_PMPADDR15, 0x1fffffffffffffff);
+	csr_write(CSR_PMPCFG2, ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<56) |
+		  ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<48) |
+		  ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<40));
+	/* Set cacheable for pmp13/pmp14, uncacheable for pmp15 */
+	csr_write(CSR_MIPSPMACFG2, ((u64)CCA_CACHE_DISABLE << 56) |
+		  ((u64)CCA_CACHE_ENABLE << 48) |
+		  ((u64)CCA_CACHE_ENABLE << 40));
+	/* Reset pmpcfg0 */
+	csr_write(CSR_PMPCFG0, 0);
+	/* Reset pmacfg0 */
+	csr_write(CSR_MIPSPMACFG0, 0);
+	mb();
+
+	/* Per cluster set up */
+	if (cpu_core(hartid) == 0 && cpu_hart(hartid) == 0) {
+		/* Enable L2 prefetch */
+		__raw_writel(0xfffff110,
+			     (void *)(cm_base + L2_PFT_CONTROL_OFFSET));
+		__raw_writel(0x15ff,
+			     (void *)(cm_base + L2_PFT_CONTROL_B_OFFSET));
+	}
+
+	/* Per core set up */
+	if (cpu_hart(hartid) == 0) {
+		/* Enable load pair, store pair, and HTW */
+		csr_clear(CSR_MIPSCONFIG7, (1<<12)|(1<<13)|(1<<7));
+
+		/* Disable noRFO, misaligned load/store */
+		csr_set(CSR_MIPSCONFIG7, (1<<25)|(1<<9));
+
+		/* Enable L1-D$ Prefetch */
+		csr_write(CSR_MIPSCONFIG11, 0xff);
+
+		for (i = 0; i < 8; i++) {
+			csr_set(CSR_MIPSCONFIG8, 4 + 0x100 * i);
+			csr_set(CSR_MIPSCONFIG9, 8);
+			mb();
+			RISCV_FENCE_I;
+		}
+	}
+
+	/* Per hart set up */
+	/* Enable AMO and RDTIME illegal instruction exceptions. */
+	csr_set(CSR_MIPSCONFIG6, (1<<2)|(1<<1));
+
+	return 0;
+}
+
+static int eyeq7h_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	int rc = mips_p8700_platform_init(fdt, nodeoff, match);
+
+	if (rc)
+		return rc;
+	generic_platform_ops.early_init = eyeq7h_early_init;
+	generic_platform_ops.final_init = eyeq7h_final_init;
+	generic_platform_ops.nascent_init = eyeq7h_nascent_init;
+	generic_platform_ops.pmp_set = mips_p8700_pmp_set;
+
+	return 0;
+}
+
+static unsigned long eyeq7h_gcr_base[] = {
+	0x48700000,
+	0x67480000,
+	0x67500000,
+};
+
+static struct p8700_cm_info eyeq7h_cm_info = {
+	.num_cm = array_size(eyeq7h_gcr_base),
+	.gcr_base = eyeq7h_gcr_base,
+};
+
+static const struct fdt_match eyeq7h_match[] = {
+	{ .compatible = "mobileye,eyeq7h", .data = &eyeq7h_cm_info },
+	{ },
+};
+
+const struct fdt_driver mips_p8700_eyeq7h = {
+	.match_table = eyeq7h_match,
+	.init = eyeq7h_platform_init,
+};
diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
index a08c4c632997548732e81a11b4c6b034eeef1b38..14524aadc12f9ae67ee69b9a3cd98711e0585b7a 100644
--- a/platform/generic/mips/objects.mk
+++ b/platform/generic/mips/objects.mk
@@ -3,6 +3,9 @@
 #
 
 ifeq ($(PLATFORM_RISCV_XLEN), 64)
-carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700) += mips_p8700
-platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o mips/mips_warm_boot.o
+carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700_EYEQ7H) += mips_p8700_eyeq7h
+carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700_BOSTON) += mips_p8700_boston
+platform-objs-$(CONFIG_CPU_MIPS_P8700) += mips/p8700.o mips/mips_warm_boot.o
+platform-objs-$(CONFIG_PLATFORM_MIPS_P8700_EYEQ7H) += mips/eyeq7h.o
+platform-objs-$(CONFIG_PLATFORM_MIPS_P8700_BOSTON) += mips/boston.o
 endif
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 5129d08926c91bc8ad4c8894f8b8d68007c5021b..c1f2ac7f6474701bf1594bf5f1880cfee2dfc4c6 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -5,27 +5,20 @@
  *
  */
 
-#include <platform_override.h>
-#include <sbi/riscv_barrier.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_timer.h>
-#include <sbi/riscv_io.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
 
 const struct p8700_cm_info *p8700_cm_info;
 
-extern void mips_warm_boot(void);
-#define MMIO_BASE 0x00000000
-#define MMIO_SIZE 0x80000000
-
-static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
-			       unsigned long prot, unsigned long addr,
-			       unsigned long log2len)
+void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
+			unsigned long prot, unsigned long addr,
+			unsigned long log2len)
 {
 	int pmacfg_csr, pmacfg_shift;
 	unsigned long cfgmask;
@@ -43,14 +36,10 @@ static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 	csr_write_num(pmacfg_csr, pmacfg);
 }
 
-static void power_up_other_cluster(u32 hartid)
+void mips_p8700_power_up_other_cluster(u32 hartid)
 {
 	unsigned int cl = cpu_cluster(hartid);
-	unsigned long cm_base = p8700_cm_info->gcr_base[cl];
 
-	/* remap local cluster address to its global address */
-	writeq(cm_base, (void*)cm_base + GCR_BASE_OFFSET);
-	wmb();
 	/* Power up CM in cluster */
 	write_cpc_pwrup_ctl(hartid, 1);
 
@@ -66,6 +55,7 @@ static void power_up_other_cluster(u32 hartid)
 	sbi_printf("ERROR: Fail to power up cluster %u\n", cl);
 }
 
+extern void mips_warm_boot(void);
 
 struct mips_boot_params {
 	u32 hartid;
@@ -81,7 +71,7 @@ static bool mips_hart_reached_state(void *arg)
 	return stat == p->target_state;
 }
 
-static int mips_hart_start(u32 hartid, ulong saddr)
+int mips_p8700_hart_start(u32 hartid, ulong saddr)
 {
 	/* Hart 0 is the boot hart, and we don't use the CPC cmd to start.  */
 	if (hartid == 0)
@@ -120,7 +110,7 @@ static int mips_hart_start(u32 hartid, ulong saddr)
 	return 0;
 }
 
-static int mips_hart_stop()
+int mips_p8700_hart_stop()
 {
 	u32 hartid = current_hartid();
 
@@ -133,163 +123,7 @@ static int mips_hart_stop()
 	return 0;
 }
 
-static const struct sbi_hsm_device mips_hsm = {
-	.name		= "mips_hsm",
-	.hart_start	= mips_hart_start,
-	.hart_stop	= mips_hart_stop,
-};
-
-static int mips_p8700_final_init(bool cold_boot)
-{
-	if (cold_boot)
-		sbi_hsm_set_device(&mips_hsm);
-
-	return generic_final_init(cold_boot);
-}
-
-static int mips_p8700_early_init(bool cold_boot)
-{
-	int rc;
-	int i;
-
-	rc = generic_early_init(cold_boot);
-	if (rc)
-		return rc;
-
-	if (!cold_boot)
-		return 0;
-
-	{ /* cluster 0 - only remap, already up */
-		unsigned long cm_base = p8700_cm_info->gcr_base[0];
-
-		sbi_dprintf("Remap Cluster %d CM 0x%lx -> 0x%lx\n", 0,
-			    readq((void*)cm_base + GCR_BASE_OFFSET),
-			    cm_base);
-		writeq(cm_base, (void*)cm_base + GCR_BASE_OFFSET);
-		wmb();
-	}
-	/* Power up other clusters in the platform. */
-	for (i = 1; i < p8700_cm_info->num_cm; i++) {
-		power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
-	}
-
-/**
- * Memory map:
- * 0x00_20080000  0x00_20100000   M:IRW- S:---- GCR local access (CM_BASE)
- * 0x00_40000000  0x00_70000000   M:IRW- S:IRW- Peripherals
- *   0x00_48700000  0x00_48780000 M:IRW- S:---- GCR cluster 0
- *   0x00_67480000  0x00_67500000 M:IRW- S:---- GCR cluster 1
- *   0x00_67500000  0x00_67580000 M:IRW- S:---- GCR cluster 2
- *   0x00_67800000  0x00_67900000 M:IRW- S:---- Ncore
- * 0x00_70000000  0x00_80000000   M:---- S:IRW- PCI32 BARs, NOT USED - 32-bit mode
- * 0x01_00000000  0x08_00000000   M:---- S:IRW- PCI64 BARs, NOT USED - PCI2PCI
- * 0x08_00000000  0x10_00000000   M:---- S:-RWX DDR64
- * 0x10_00000000  0x20_00000000   M:---- S:IRW- PCI64 BARs
- */
-
-	for (i = 0; i < p8700_cm_info->num_cm; i++) {
-		unsigned long cm_base = p8700_cm_info->gcr_base[i];
-
-		/* CM and MTIMER */
-		rc = sbi_domain_root_add_memrange(cm_base, SIZE_FOR_CPC_MTIME,
-						  SIZE_FOR_CPC_MTIME,
-						  (SBI_DOMAIN_MEMREGION_MMIO |
-						   SBI_DOMAIN_MEMREGION_M_READABLE |
-						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-		if (rc)
-			return rc;
-
-		/* For the APLIC and ACLINT m-mode region */
-		rc = sbi_domain_root_add_memrange(cm_base + AIA_OFFSET, SIZE_FOR_AIA_M_MODE,
-						  SIZE_FOR_AIA_M_MODE,
-						  (SBI_DOMAIN_MEMREGION_MMIO |
-						   SBI_DOMAIN_MEMREGION_M_READABLE |
-						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-		if (rc)
-			return rc;
-	}
-	/* the rest of MMIO - shared with S-mode */
-	rc = sbi_domain_root_add_memrange(MMIO_BASE, MMIO_SIZE, MMIO_SIZE,
-					  SBI_DOMAIN_MEMREGION_MMIO |
-					  SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW);
-	if (rc)
-		return rc;
-	/* PCIE BARs - MMIO S-mode */
-	rc = sbi_domain_root_add_memrange(0x1000000000UL, 0x1000000000UL, 0x1000000000UL,
-					  SBI_DOMAIN_MEMREGION_MMIO |
-					  SBI_DOMAIN_MEMREGION_SU_READABLE |
-					  SBI_DOMAIN_MEMREGION_SU_WRITABLE);
-
-	return 0;
-}
-
-static int mips_p8700_nascent_init(void)
-{
-	u64 hartid = current_hartid();
-	int cl = cpu_cluster(hartid);
-	u64 cm_base = p8700_cm_info->gcr_base[cl];
-	int i;
-
-	/* Coherence enable for every core */
-	if (cpu_hart(hartid) == 0) {
-		cm_base += (cpu_core(hartid) << CM_BASE_CORE_SHIFT);
-		__raw_writeq(GCR_CORE_COH_EN_EN,
-			     (void *)(cm_base + GCR_OFF_LOCAL +
-				      GCR_CORE_COH_EN));
-		mb();
-	}
-
-	/* Set up pmp for DRAM */
-	csr_write(CSR_PMPADDR14, DRAM_PMP_ADDR);
-	/* All from 0x0 */
-	csr_write(CSR_PMPADDR15, 0x1fffffffffffffff);
-	csr_write(CSR_PMPCFG2, ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<56)|
-		  ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<48));
-	/* Set cacheable for pmp6, uncacheable for pmp7 */
-	csr_write(CSR_MIPSPMACFG2, ((u64)CCA_CACHE_DISABLE << 56)|
-		  ((u64)CCA_CACHE_ENABLE << 48));
-	/* Reset pmpcfg0 */
-	csr_write(CSR_PMPCFG0, 0);
-	/* Reset pmacfg0 */
-	csr_write(CSR_MIPSPMACFG0, 0);
-	mb();
-
-	/* Per cluster set up */
-	if (cpu_core(hartid) == 0 && cpu_hart(hartid) == 0) {
-		/* Enable L2 prefetch */
-		__raw_writel(0xfffff110,
-			     (void *)(cm_base + L2_PFT_CONTROL_OFFSET));
-		__raw_writel(0x15ff,
-			     (void *)(cm_base + L2_PFT_CONTROL_B_OFFSET));
-	}
-
-	/* Per core set up */
-	if (cpu_hart(hartid) == 0) {
-		/* Enable load pair, store pair, and HTW */
-		csr_clear(CSR_MIPSCONFIG7, (1<<12)|(1<<13)|(1<<7));
-
-		/* Disable noRFO, misaligned load/store */
-		csr_set(CSR_MIPSCONFIG7, (1<<25)|(1<<9));
-
-		/* Enable L1-D$ Prefetch */
-		csr_write(CSR_MIPSCONFIG11, 0xff);
-
-		for (i = 0; i < 8; i++) {
-			csr_set(CSR_MIPSCONFIG8, 4 + 0x100 * i);
-			csr_set(CSR_MIPSCONFIG9, 8);
-			mb();
-			RISCV_FENCE_I;
-		}
-	}
-
-	/* Per hart set up */
-	/* Enable AMO and RDTIME illegal instruction exceptions. */
-	csr_set(CSR_MIPSCONFIG6, (1<<2)|(1<<1));
-
-	return 0;
-}
-
-static int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	const struct p8700_cm_info *data = match->data;
 
@@ -299,29 +133,5 @@ static int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct f
 	}
 
 	p8700_cm_info = data;
-	generic_platform_ops.early_init = mips_p8700_early_init;
-	generic_platform_ops.final_init = mips_p8700_final_init;
-	generic_platform_ops.nascent_init = mips_p8700_nascent_init;
-	generic_platform_ops.pmp_set = mips_p8700_pmp_set;
-
-	return 0;
+	return SBI_OK;
 }
-
-static unsigned long mips_p8700_gcr_base[] = {
-	0x16100000,
-};
-
-static struct p8700_cm_info mips_p8700_cm_info = {
-	.num_cm = array_size(mips_p8700_gcr_base),
-	.gcr_base = mips_p8700_gcr_base,
-};
-
-static const struct fdt_match mips_p8700_match[] = {
-	{ .compatible = "mips,p8700", .data = &mips_p8700_cm_info },
-	{ },
-};
-
-const struct fdt_driver mips_p8700 = {
-	.match_table = mips_p8700_match,
-	.init = mips_p8700_platform_init,
-};

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
