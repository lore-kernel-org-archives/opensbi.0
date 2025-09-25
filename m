Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B44CAC5B5
	for <opensbi@archiver.kernel.org>; Thu, 25 Sep 2025 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPFpjli8fDgObV1X39qxDyfiNQQMJxc104CWhz2Zw7A=; b=VW2JghxkPZMaXk
	2rv2/5+eCXrCHiG5KHV5EeIP8blS2GIrjLY0tngxbggBYYWyK81Qgem82JdcTYo/k9jcvnF9NT3dF
	dulQqlsaZcBxhkZpniPi9McOd/xJZAbTijTJAgYfhuTeONSp3vfiMzoImY/noVXjYRu7b9dOutp2K
	1DMbqh82gUbwDaJNHtnYr/Vpi9OE6wjoFSdPAeUKKkZyG+vESedu+Y6F83VCxbsCCMmAu/dmIzG0B
	eyEfZ9tk5vMfabkOtu6NsNMxDocrhzI1NvR2nn4M0iH2duO+S9yhQKeSOHiNH9ZuY+muJM0mXnRah
	Uzxd7OD7LS8eYsARf3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iba-00000007nUg-0vxG;
	Thu, 25 Sep 2025 09:49:38 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ibW-00000007nFW-3BTx
	for opensbi@lists.infradead.org;
	Thu, 25 Sep 2025 09:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758793747;
	bh=2TEPBvKmOITrLTAcJvBWm2Y1V32k7qFt9QwIFzshv0A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SiRqRJOaYUWuRZB5sMtiFxAQAxKUu24vGPu9FoFs/KqDdaTZ218RuXVv4PJR0gkvB
	 Tbf5KDF8I1lUAc6/5UB3htRSaftuTaU0lHvMtcvKthhiUI7mXi8HgauxP34lBchMGx
	 s6CTULv8vM/uKuHvKki1fFA38kmPI3SfwEHTKu40=
X-QQ-mid: zesmtpgz5t1758793746t7f200e6a
X-QQ-Originating-IP: i9bar8tMA/suS+/Tq3b16ZjWdkiopDZjdMX1yBj2YHM=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 17:49:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2780574812523460409
EX-QQ-RecipientCnt: 3
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 17:48:55 +0800
Subject: [PATCH v3 1/3] platform: generic: spacemit: add K1
MIME-Version: 1.0
Message-Id: <20250925-smt-k1-8-cores-v3-1-0885a8a70f8e@linux.spacemit.com>
References: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
In-Reply-To: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758793743; l=8700;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Un+HNk+3y9WDbKRU8z7Rp3friMihthWe3fFFpfpNcNo=;
 b=IbZ1q13kLP3set4BGNNbNpVPCERI16HNeUuC2jyBvxchr6O9eAUx0lfKrWPSsLEbQaItiuS4/
 Qi1BeNOCvczCwskOUiLBk61dEAOIlS3ai8DgBt4St0cNhiwlIbT/F7X
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Na7SaAtv46unXgyXKmxcPlLePIoLZb9Sjs73Vaf4CVKk3gI2Epy8GuBq
	x8NSVZJ8meTna4s4EvBSa3bf7HTThDTVojUO6MkXYNYtfays47JmG3Q5ZRNl+y0PbdwW/A5
	d5LQ4awplRpL+ooqUhZear8j5qH95khs4+UlOX6Q1pUN7rBefi0r7JWXPCG1a4WYByS1ZhJ
	T/tosHUyNAwH7gThWk3i2D1bFjVy7Tq9WkRcNBA13xA7ZXOEhh6KfQAtjwkeqITnrbKXLXh
	jNR8oAunM+IJ91/VZvyjgbcuW5R11UwaXePIofss81Oo8FyN20qrZ7/upuJn6adVUloLih6
	VQ7/jia47ugrTbu1MOjUjhSEmQ0Neaguzx1d0cDdvTOfPOxkvX1oUuxG2yLgBgzvzttz90V
	qBD2DMIesO9nJjv/lLGAE+lpXVtISwxILx06St7DA0GVyxuPmsY/+mnwPC2iIm6kFXBjvVR
	auXonhIsssiXhqvAhy1/X/exIQKJd9OsXL860O3KmSr4W4I7QbrFSTEBCaE04DgVQqjVB0p
	S/K9713pa34t2mGnhKDw6z8w9Nkn8gwcAFWDCz5yybSv/HwBUmxi3JPWbVcfGJch57KzylP
	M/2ualPjrJBYrn0Ihn+jkMr0ce2FoNqPlNUaVeaHBivpNIj3mfHfb888FtGE142MMTY6/Pa
	obGicozGzQ2HQPzD6cWEW7Yi3IRiihDAsDD+yVA/4G3XULxay4QqFPrcycAU0zoOtfDmQli
	gExMLopBgqe3Id7gfEBgkPJ4EAmbFlTHwuolzPk4gWUhRd3P5hNvWwNc1JT9HCbtwuEb2uW
	7gAHDu1SQT+1D2ddAR0K7h/12S+iuvYnDcwESG9Rjc9iPLgdUuI3SOuCjEJlv3WgSP5wL9M
	SAk0JecYlAWXpooZAIQaStDDRp8oSrG0HxNQt13OTxO3yOIu1Kf3yz/xZhzqY3z7ZMtv12m
	qM0ppa7Qapuh7jQAPgHCaLlgQKp2A45AQx9jRrIVGANcY1S+j23NEctNavoM4ESZhrzeq2V
	TU5KAwFItEl9ucBj5UmXlbGB88mXo37WVpTuTlAUNBcUKlBi7AGBO4GtuIRzXOgxWexE3/b
	wWsaI4p5UZAXr975Q9l5xsSDOMMt3gSRb8tzXJl1jps
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_024935_236974_A6B7178B 
X-CRM114-Status: GOOD (  19.48  )
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

From: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>

Add initial platform support for the SpacemiT K1 SoC, including
early/final init hooks, cold boot handling, and CCI-550 snoop/DVM
enablement.

Co-authored-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
---
 platform/generic/Kconfig               |   4 ++
 platform/generic/include/spacemit/k1.h |  98 +++++++++++++++++++++++++++
 platform/generic/spacemit/k1.c         | 119 +++++++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 7559a4bd8ccfcf7e0e7366141f632f5f5e13bd98..d0835126287ef080a44e30140b49c022695efd17 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -76,6 +76,10 @@ config PLATFORM_MIPS_P8700
 	bool "MIPS P8700 support"
 	default n
 
+config PLATFORM_SPACEMIT_K1
+	bool "Spacemit K1 support"
+	default n
+
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
 
diff --git a/platform/generic/include/spacemit/k1.h b/platform/generic/include/spacemit/k1.h
new file mode 100644
index 0000000000000000000000000000000000000000..bd666346564698e04e69029de73eae863ac45d19
--- /dev/null
+++ b/platform/generic/include/spacemit/k1.h
@@ -0,0 +1,98 @@
+#ifndef __RISCV_SPACEMIT_K1_H__
+#define __RISCV_SPACEMIT_K1_H__
+
+#define CSR_MSETUP				0x7c0
+#define CSR_MHCR				0x7c1
+#define CSR_MRAOP				0x7c2
+#define CSR_MHINT				0x7c5
+#define CSR_ML2SETUP				0x7f0
+
+/* decache enable */
+#define MSETUP_DE				BIT(0)
+/* icache enable */
+#define MSETUP_IE				BIT(1)
+/* branch prediction enable */
+#define MSETUP_BPE				BIT(4)
+/* prefetch functionality enable */
+#define MSETUP_PFE				BIT(5)
+/* misaligned memory access enable */
+#define MSETUP_MME				BIT(6)
+/* ECC enable */
+#define MSETUP_ECCE				BIT(16)
+
+/* icache invalidation */
+#define MRAOP_ICACHE_INVALID			GENMASK(1, 0)
+
+#define PMU_AP_BASE				0xd4282800
+
+#define PMU_AP_CORE0_WAKEUP_OFFSET		(PMU_AP_BASE + 0x12c)
+#define PMU_AP_CORE4_WAKEUP_OFFSET		(PMU_AP_BASE + 0x324)
+#define PMU_AP_CLUSTER0_WAKEUP_OFFSET(index)	(PMU_AP_CORE0_WAKEUP_OFFSET + index * 4)
+#define PMU_AP_CLUSTER1_WAKEUP_OFFSET(index)	(PMU_AP_CORE4_WAKEUP_OFFSET + index * 4)
+
+#define PMU_AP_CORE0_IDLE_CFG_OFFSET		(PMU_AP_BASE + 0x124)
+#define PMU_AP_CORE4_IDLE_CFG_OFFSET		(PMU_AP_BASE + 0x304)
+#define PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(index)	(PMU_AP_CORE0_IDLE_CFG_OFFSET + index * 4)
+#define PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(index)	(PMU_AP_CORE4_IDLE_CFG_OFFSET + index * 4)
+
+#define PMU_AP_CORE0_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(0)
+#define PMU_AP_CORE1_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(1)
+#define PMU_AP_CORE2_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(2)
+#define PMU_AP_CORE3_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(3)
+#define PMU_AP_CORE4_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(0)
+#define PMU_AP_CORE5_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(1)
+#define PMU_AP_CORE6_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(2)
+#define PMU_AP_CORE7_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(3)
+
+#define PMU_AP_CORE0_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(0)
+#define PMU_AP_CORE1_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(1)
+#define PMU_AP_CORE2_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(2)
+#define PMU_AP_CORE3_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(3)
+#define PMU_AP_CORE4_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(0)
+#define PMU_AP_CORE5_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(1)
+#define PMU_AP_CORE6_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(2)
+#define PMU_AP_CORE7_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(3)
+
+/* power down */
+#define PMU_AP_IDLE_PWRDWN			BIT(0)
+/* sram power down */
+#define PMU_AP_IDLE_SRAM_PWRDWN			BIT(1)
+/* enable wake up the memory controller */
+#define PMU_AP_IDLE_WAKE_MCE			BIT(3)
+/* disable memory controller software req */
+#define PMU_AP_IDLE_MC_SW_REQ			BIT(4)
+
+#define PMU_AP_IDLE_PWRDOWN_MASK		(PMU_AP_IDLE_PWRDWN | PMU_AP_IDLE_SRAM_PWRDWN | \
+						 PMU_AP_IDLE_WAKE_MCE | PMU_AP_IDLE_MC_SW_REQ)
+/* cci */
+#define C0_RVBADDR_LO_ADDR			0xd4282db0
+#define C0_RVBADDR_HI_ADDR			0xd4282db4
+#define C1_RVBADDR_LO_ADDR			0xd4282eb0
+#define C1_RVBADDR_HI_ADDR			0xd4282c04
+
+#define CCI_550_PLATFORM_CCI_ADDR		0xd8500000
+
+/* relative to cci base */
+#define CCI_550_STATUS				0x000c
+/* status register bits */
+#define CCI_550_STATUS_CHANGE_PENDING		BIT(0)
+
+/* slave interface registers */
+#define CCI_550_SLAVE_IFACE0_OFFSET		0x1000
+#define CCI_550_SLAVE_IFACE_OFFSET(idx)		(CCI_550_SLAVE_IFACE0_OFFSET + ((0x1000) * (idx)))
+
+/* relative to slave interface base */
+#define CCI_550_SNOOP_CTRL			0x0000
+/* snoop control register bits */
+#define CCI_550_SNOOP_CTRL_ENABLE_SNOOPS	BIT(0)
+#define CCI_550_SNOOP_CTRL_ENABLE_DVMS		BIT(1)
+
+/* clusters and CPU mapping */
+#define PLATFORM_MAX_CPUS			8
+#define PLATFORM_MAX_CPUS_PER_CLUSTER		4
+#define CPU_TO_CLUSTER(cpu)			((cpu) / PLATFORM_MAX_CPUS_PER_CLUSTER)
+
+#define PLAT_CCI_CLUSTER0_IFACE_IX		0
+#define PLAT_CCI_CLUSTER1_IFACE_IX		1
+
+#endif
diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
new file mode 100644
index 0000000000000000000000000000000000000000..296365e9c4a7993a3a3560d17aeeeda71520c2b6
--- /dev/null
+++ b/platform/generic/spacemit/k1.c
@@ -0,0 +1,119 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+#include <platform_override.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_hsm.h>
+#include <spacemit/k1.h>
+
+/* only use 0-1 cluster in SpacemiT K1 */
+static const int cci_map[] = {
+	PLAT_CCI_CLUSTER0_IFACE_IX,
+	PLAT_CCI_CLUSTER1_IFACE_IX,
+};
+
+static void cci_enable_snoop_dvm_reqs(unsigned int master_id)
+{
+	int slave_if_id = cci_map[master_id];
+
+	/*
+	 * Enable Snoops and DVM messages, no need for Read/Modify/Write as
+	 * rest of bits are write ignore
+	 */
+	writel(CCI_550_SNOOP_CTRL_ENABLE_DVMS | CCI_550_SNOOP_CTRL_ENABLE_SNOOPS,
+	       (void *)(u64)CCI_550_PLATFORM_CCI_ADDR +
+	       CCI_550_SLAVE_IFACE_OFFSET(slave_if_id) + CCI_550_SNOOP_CTRL);
+
+	/*
+	 * Wait for the completion of the write to the Snoop Control Register
+	 * before testing the change_pending bit
+	 */
+	mb();
+
+	/* Wait for the dust to settle down */
+	while ((readl((void *)(u64)CCI_550_PLATFORM_CCI_ADDR + CCI_550_STATUS) &
+	       CCI_550_STATUS_CHANGE_PENDING))
+		;
+}
+
+static void spacemit_k1_pre_init(void)
+{
+	unsigned int clusterid, cluster_enabled = 0;
+	struct sbi_scratch *scratch;
+	int i;
+
+	scratch = sbi_scratch_thishart_ptr();
+
+	writel(scratch->warmboot_addr, (unsigned int *)C0_RVBADDR_LO_ADDR);
+	writel(scratch->warmboot_addr >> 32, (unsigned int *)C0_RVBADDR_HI_ADDR);
+
+	writel(scratch->warmboot_addr, (unsigned int *)C1_RVBADDR_LO_ADDR);
+	writel(scratch->warmboot_addr >> 32, (unsigned int *)C1_RVBADDR_HI_ADDR);
+
+	for (i = 0; i < PLATFORM_MAX_CPUS; i++) {
+		clusterid = CPU_TO_CLUSTER(i);
+
+		if (!(cluster_enabled & (1 << clusterid))) {
+			cluster_enabled |= 1 << clusterid;
+			cci_enable_snoop_dvm_reqs(clusterid);
+		}
+	}
+}
+
+/*
+ * Platform early initialization.
+ */
+static int spacemit_k1_early_init(bool cold_boot)
+{
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
+	csr_set(CSR_MSETUP, MSETUP_DE | MSETUP_IE | MSETUP_BPE |
+		MSETUP_PFE | MSETUP_MME | MSETUP_ECCE);
+
+	if (cold_boot)
+		spacemit_k1_pre_init();
+
+	return 0;
+}
+
+static int spacemit_k1_final_init(bool cold_boot)
+{
+	return generic_final_init(cold_boot);
+}
+
+static bool spacemit_cold_boot_allowed(u32 hartid)
+{
+	csr_set(CSR_ML2SETUP, 1 << (hartid % PLATFORM_MAX_CPUS_PER_CLUSTER));
+
+	return !hartid;
+}
+
+static int spacemit_k1_platform_init(const void *fdt, int nodeoff,
+				     const struct fdt_match *match)
+{
+	generic_platform_ops.early_init = spacemit_k1_early_init;
+	generic_platform_ops.final_init = spacemit_k1_final_init;
+	generic_platform_ops.cold_boot_allowed = spacemit_cold_boot_allowed;
+
+	return 0;
+}
+
+static const struct fdt_match spacemit_k1_match[] = {
+	{ .compatible = "spacemit,k1" },
+	{ /* sentinel */ }
+};
+
+const struct fdt_driver spacemit_k1 = {
+	.match_table = spacemit_k1_match,
+	.init = spacemit_k1_platform_init,
+};

-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
