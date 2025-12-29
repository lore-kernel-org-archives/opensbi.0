Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19079E8FDBE
	for <opensbi@archiver.kernel.org>; Mon, 29 Dec 2025 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJt9fU6gvpCM/nt5F0bRar5PCrneWEynMQpHxrbB5Vg=; b=yy/Mdz7+ZjG1bA
	Duz6C1+zTIKLHAmBnlL3uaFiwjgxjsu/w0qUXNNuQGloQ+kfVJy6SC8cuOf66Ku7pkL8P/Q1DH5Xc
	UNFIJ4grQHnoRHmYAFKRHrp9yr8SeAUxaFMhHf7rVBQXSoBQVtVXJ3E5+x+rO+rVcTl+gQI96MObP
	X8Hlc6Gu7KvUOqOQrf04OjULLVZG+zTQgET3/azrIkrFT9RA/3goO8A1Ltxujl4J4TDbNugn2HzZy
	sK24v6B4MolZ/CHTA8xWBQnjj5jNqlCHRLpDLthAkQyS81hjAMlUXN639GioWTFkCrReM+DNDl5HI
	5kS3aUQMx7g/YSQ+qaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7Xa-00000003Q07-0ua7;
	Mon, 29 Dec 2025 07:19:42 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XX-00000003PyI-3KxE
	for opensbi@lists.infradead.org;
	Mon, 29 Dec 2025 07:19:41 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5BT7JQB7084321
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <opensbi@lists.infradead.org>; Mon, 29 Dec 2025 15:19:26 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Dec 2025
 15:19:25 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 4/5] lib: utils/cache: add Andes last level cache controller
Date: Mon, 29 Dec 2025 15:19:13 +0800
Message-ID: <20251229071914.1451587-5-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229071914.1451587-1-ben717@andestech.com>
References: <20251229071914.1451587-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5BT7JQB7084321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_231940_209245_13CDDAB0 
X-CRM114-Status: GOOD (  24.74  )
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

Introduce a FDT-based driver for the Andes Last Level Cache (LLC)
controller to support cache maintenance operations.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h |  15 ++
 lib/utils/cache/Kconfig                      |   5 +
 lib/utils/cache/fdt_andes_llcache.c          | 166 +++++++++++++++++++
 lib/utils/cache/objects.mk                   |   3 +
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c         |  10 ++
 platform/generic/configs/defconfig           |   1 +
 6 files changed, 200 insertions(+)
 create mode 100644 lib/utils/cache/fdt_andes_llcache.c

diff --git a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
index 881d8b215060..ef851b7501b5 100644
--- a/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
+++ b/include/sbi_utils/hsm/fdt_hsm_andes_atcsmu.h
@@ -11,6 +11,8 @@
 
 /* clang-format off */
 
+#define SCRATCH_PAD_OFFSET		0x40
+
 #define RESET_VEC_LO_OFFSET		0x50
 #define RESET_VEC_HI_OFFSET		0x60
 #define RESET_VEC_8CORE_OFFSET		0x1a0
@@ -31,6 +33,9 @@
 
 #define PCS0_WE_OFFSET			0x90
 #define PCSm_WE_OFFSET(i)		((i + 3) * 0x20 + PCS0_WE_OFFSET)
+#define PCS_WAKEUP_RTC_ALARM_MASK	BIT(2)
+#define PCS_WAKEUP_UART2_MASK		BIT(9)
+#define PCS_WAKEUP_MSIP_MASK		BIT(29)
 
 #define PCS0_CTL_OFFSET			0x94
 #define PCSm_CTL_OFFSET(i)		((i + 3) * 0x20 + PCS0_CTL_OFFSET)
@@ -38,6 +43,14 @@
 #define WAKEUP_CMD			0x8
 #define DEEP_SLEEP_CMD			0xb
 
+#define PCS0_STATUS_OFFSET		0x98
+#define PCSm_STATUS_OFFSET(i)		((i + 3) * 0x20 + PCS0_STATUS_OFFSET)
+#define PD_TYPE_MASK			GENMASK(2, 0)
+#define PD_TYPE_SLEEP			2
+#define PD_STATUS_MASK			GENMASK(7, 3)
+#define PD_STATUS_LIGHT_SLEEP		0
+#define PD_STATUS_DEEP_SLEEP		0x10
+
 /* clang-format on */
 
 void atcsmu_set_wakeup_events(u32 events, u32 hartid);
@@ -45,5 +58,7 @@ bool atcsmu_support_sleep_mode(u32 sleep_type, u32 hartid);
 void atcsmu_set_command(u32 pcs_ctl, u32 hartid);
 int atcsmu_set_reset_vector(u64 wakeup_addr, u32 hartid);
 u32 atcsmu_get_sleep_type(u32 hartid);
+void atcsmu_write_scratch(u32 value);
+u32 atcsmu_read_scratch(void);
 
 #endif
diff --git a/lib/utils/cache/Kconfig b/lib/utils/cache/Kconfig
index be7d57c37d24..ea815dc4ef03 100644
--- a/lib/utils/cache/Kconfig
+++ b/lib/utils/cache/Kconfig
@@ -10,6 +10,11 @@ config FDT_CACHE
 
 if FDT_CACHE
 
+config FDT_CACHE_ANDES_LLCACHE
+	bool "Andes FDT last level cache driver"
+	depends on FDT_HSM_ANDES_ATCSMU
+	default n
+
 config FDT_CACHE_SIFIVE_CCACHE
 	bool "SiFive CCACHE FDT cache driver"
 	default n
diff --git a/lib/utils/cache/fdt_andes_llcache.c b/lib/utils/cache/fdt_andes_llcache.c
new file mode 100644
index 000000000000..b3619c8fd83d
--- /dev/null
+++ b/lib/utils/cache/fdt_andes_llcache.c
@@ -0,0 +1,166 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Andes Technology Corporation
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/cache/fdt_cache.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/hsm/fdt_hsm_andes_atcsmu.h>
+
+#define LLCACHE_REG_CFG_OFFSET		0x0
+#define LLCACHE_REG_CTRL_OFFSET		0x8
+#define LLCACHE_REG_CCTL_CMD_OFFSET	0x40
+#define LLCACHE_REG_CCTL_STATUS_OFFSET	0x80
+
+#define LLCACHE_REG_CFG_MAP_MASK	BIT(20)
+#define LLCACHE_REG_CTRL_EN_MASK	BIT(0)
+#define LLCACHE_REG_CTRL_INIT_MASK	BIT(14)
+#define LLCACHE_REG_CCTL_STATUS_MASK	GENMASK(3, 0)
+
+#define LLCACHE_WBINVAL_ALL		0x12
+
+struct andes_llcache {
+	struct cache_device dev;
+	void *base;
+	uint32_t cmd_stride;
+	uint32_t status_stride;
+	uint32_t status_core_stride;
+};
+
+#define to_llcache(_dev) container_of(_dev, struct andes_llcache, dev)
+
+static bool andes_llcache_init_done(struct andes_llcache *llcache)
+{
+	uint32_t llcache_ctrl;
+	void *ctrl_addr = (char *)llcache->base + LLCACHE_REG_CTRL_OFFSET;
+
+	llcache_ctrl = readl_relaxed(ctrl_addr);
+	return !EXTRACT_FIELD(llcache_ctrl, LLCACHE_REG_CTRL_INIT_MASK);
+}
+
+static bool andes_llcache_cctl_done(struct andes_llcache *llcache, uint32_t hartid)
+{
+	uint32_t llcache_cctl_status;
+	void *cctl_status_addr = (char *)llcache->base + LLCACHE_REG_CCTL_STATUS_OFFSET +
+				 hartid * llcache->status_stride;
+
+	llcache_cctl_status = readl_relaxed(cctl_status_addr);
+	return !EXTRACT_FIELD(llcache_cctl_status,
+			      LLCACHE_REG_CCTL_STATUS_MASK <<
+			      hartid * llcache->status_core_stride);
+}
+
+static int andes_llcache_flush_all(struct cache_device *dev)
+{
+	uint32_t hartid = current_hartid();
+	struct andes_llcache *llcache = to_llcache(dev);
+	void *cctl_cmd_addr = (char *)llcache->base + LLCACHE_REG_CCTL_CMD_OFFSET +
+			      hartid * llcache->cmd_stride;
+
+	/*
+	 * Each command register corresponds to one CPU core, so each CPU core
+	 * should only use its command registers to do the cache operation.
+	 */
+	writel(LLCACHE_WBINVAL_ALL, cctl_cmd_addr);
+
+	/* Wait for the command completion */
+	while (!andes_llcache_cctl_done(llcache, hartid))
+		;
+
+	return 0;
+}
+
+static int andes_llcache_enable(struct cache_device *dev, bool enable)
+{
+	struct andes_llcache *llcache = to_llcache(dev);
+	u32 llcache_ctrl;
+	void *ctrl_addr = (char *)llcache->base + LLCACHE_REG_CTRL_OFFSET;
+
+	/*
+	 * To properly enable the last level cache to cache both instructions
+	 * and data, apply the following sequence:
+	 *
+	 * - Write the control register with the desired value, except the
+	 *   CEN field should be set to zero. Thus, store the control register
+	 *   value with the CEN field being 0 when disabling the last level
+	 *   cache.
+	 * - Write the control register again using the same value of step 1
+	 *   with the CEN field being 1.
+	 */
+	if (enable) {
+		llcache_ctrl = atcsmu_read_scratch();
+		writel(llcache_ctrl, ctrl_addr);
+		writel(llcache_ctrl | LLCACHE_REG_CTRL_EN_MASK, ctrl_addr);
+	} else {
+		llcache_ctrl = readl(ctrl_addr);
+		atcsmu_write_scratch(llcache_ctrl & ~LLCACHE_REG_CTRL_EN_MASK);
+		writel(llcache_ctrl & ~LLCACHE_REG_CTRL_EN_MASK, ctrl_addr);
+	}
+
+	llcache_ctrl = readl(ctrl_addr);
+	return enable == EXTRACT_FIELD(llcache_ctrl, LLCACHE_REG_CTRL_EN_MASK);
+}
+
+static struct cache_ops andes_llcache_ops = {
+	.cache_flush_all = andes_llcache_flush_all,
+	.cache_enable = andes_llcache_enable,
+};
+
+static int andes_llcache_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	int rc;
+	u64 llcache_base = 0;
+	struct andes_llcache *llcache;
+	struct cache_device *dev;
+	uint32_t llcache_cfg;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &llcache_base, NULL);
+	if (rc < 0 || !llcache_base)
+		return SBI_ENODEV;
+
+	llcache = sbi_zalloc(sizeof(*llcache));
+	if (!llcache)
+		return SBI_ENOMEM;
+
+	dev = &llcache->dev;
+	dev->ops = &andes_llcache_ops;
+	rc = fdt_cache_add(fdt, nodeoff, dev);
+	if (rc) {
+		sbi_free(llcache);
+		return rc;
+	}
+
+	llcache->base = (void *)llcache_base;
+	llcache_cfg = readl_relaxed((char *)llcache->base + LLCACHE_REG_CFG_OFFSET);
+
+	/* Configurations for V1/V0 memory map */
+	if (EXTRACT_FIELD(llcache_cfg, LLCACHE_REG_CFG_MAP_MASK)) {
+		llcache->cmd_stride = 0x1000;
+		llcache->status_stride = 0x1000;
+		llcache->status_core_stride = 0;
+	} else {
+		llcache->cmd_stride = 0x10;
+		llcache->status_stride = 0x0;
+		llcache->status_core_stride = 4;
+	}
+
+	/* Wait for the hardware initialization done */
+	while (!andes_llcache_init_done(llcache))
+		;
+
+	return SBI_OK;
+}
+
+static const struct fdt_match andes_llcache_match[] = {
+	{ .compatible = "andestech,llcache" },
+	{},
+};
+
+const struct fdt_driver fdt_andes_llcache = {
+	.match_table = andes_llcache_match,
+	.init = andes_llcache_probe,
+};
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
index aa76adc2e3bc..6c9bce84903e 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -8,6 +8,9 @@ libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache.o
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache_drivers.carray.o
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cmo_helper.o
 
+carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_ANDES_LLCACHE) += fdt_andes_llcache
+libsbiutils-objs-$(CONFIG_FDT_CACHE_ANDES_LLCACHE) += cache/fdt_andes_llcache.o
+
 carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += fdt_sifive_ccache
 libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += cache/fdt_sifive_ccache.o
 
diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index 3fe931aa1816..32f6fef808c6 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -84,6 +84,16 @@ u32 atcsmu_get_sleep_type(u32 hartid)
 	return readl_relaxed((char *)atcsmu_base + PCSm_SCRATCH_OFFSET(hartid));
 }
 
+void atcsmu_write_scratch(u32 value)
+{
+	writel_relaxed(value, (char *)atcsmu_base + SCRATCH_PAD_OFFSET);
+}
+
+u32 atcsmu_read_scratch(void)
+{
+	return readl_relaxed((char *)atcsmu_base + SCRATCH_PAD_OFFSET);
+}
+
 static int ae350_hart_start(u32 hartid, ulong saddr)
 {
 	u32 hartindex = sbi_hartid_to_hartindex(hartid);
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index d85da930edbc..4b7615d6c51b 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -13,6 +13,7 @@ CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
 CONFIG_PLATFORM_SPACEMIT_K1=y
 CONFIG_FDT_CACHE=y
+CONFIG_FDT_CACHE_ANDES_LLCACHE=y
 CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
 CONFIG_FDT_CACHE_SIFIVE_EC=y
 CONFIG_FDT_CACHE_SIFIVE_PL2=y
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
