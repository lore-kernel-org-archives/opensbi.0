Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59745CAC5A5
	for <opensbi@archiver.kernel.org>; Thu, 25 Sep 2025 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7gv2Z8R+NK/Cc4jABl9UuzzYCrKcMxMBg+IRN50XjY=; b=HK0kO01ZP7CTDK
	FK1Y1wRY+Q/iObIPTN5A85x3n7w5Cs/OGoD9z8tL0U2a0iXz0YdsXHCUE4HdXy8mAyAgZLAge/4Qf
	WGmrsFOSsXmylD7oW+406NOszcVH9ScpBnLwqvb5INO8soHmE8HFZbXcN8slpv6jZHMZyBbZwr7Lt
	3cEO/GCbfziV0PISPIYJcH493RSSQYTFLnWjeeDf+xtwlQNOVjfQxvcrAmjziRBJ/5eA0reJMTyYC
	SSG3yPYipDI+i6gqoGP3/Y/jPoiEI5CW+wcfw/8VStuhpts5zKQH7qxVVhl2R6dCnvJlgHcHwLv9x
	64npirExfaiOHHhKyWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ibY-00000007nTb-3xUa;
	Thu, 25 Sep 2025 09:49:36 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ibW-00000007nFs-2Mij
	for opensbi@lists.infradead.org;
	Thu, 25 Sep 2025 09:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758793750;
	bh=tcwV+Or7coEFZHoha7MCWCUKdEc/ZZtnTupSCe0x5Sw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kYKZHlk2DPAEPRrwmRWEi+jNs+mR76lhZ1Y8XbafgWAosYZtu0rBd9msWZRZ6hEMj
	 57xffP7pRjM5zznvJtd4IecU+BF15bkX/Z64Wu19KyviqIx900e3H/B0L61PUcZ7in
	 KfhQcTJXpN2ocqve/nsOES/Fo8plhB/6533ktAVI=
X-QQ-mid: zesmtpgz6t1758793748t3c47d836
X-QQ-Originating-IP: Qwtk994iAftRVgaN8jKV5saBTrUo3b7qvoIdZbYM+1w=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 17:49:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7779745711338170505
EX-QQ-RecipientCnt: 3
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 17:48:56 +0800
Subject: [PATCH v3 2/3] platform: spacemit: Add HSM driver
MIME-Version: 1.0
Message-Id: <20250925-smt-k1-8-cores-v3-2-0885a8a70f8e@linux.spacemit.com>
References: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
In-Reply-To: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758793743; l=5667;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=PeaAGzvuFenQgofoQ4n1cA06VWD0QV9qcdUX8jlO3lY=;
 b=k+s3CBtA97F0w8RY2hWzEp73AFv76nqdJQclB1BNj+wRptEaqGcS4IOzUrZ5vpbXwWi1YhT/T
 Yuli/lD3m6IDq8EkZcMqe+We392tlQ/4qprWF2NbIZhyij8NMXeP3la
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ML7i0LizeUgXfvTytlUn6Ec+olbXGeKhbBgS1vUiimkvSzPD65m/AvsM
	bQ1OJxuOEppFEkq5pZWruU/DmvLLTznpdH3MFgH+3I43mhX4m/VzZnJ1NZz2lw4oRwe0S4l
	7K8cZFNgCXUaq7FDmtFHsCV6XuPkXmcJh3Nv5+hrbIu5N1csx61jwpswY9QptHhIWiJGIe4
	BcuEW+yPCUbEb64R4Z0j73HWHmLJzIml+QsS8zvv9GmjgemjDx5/CFw00h34cEciCyYovXU
	ImPaQ3hU6L66AeCEEy2ZZCIcHA28mx/CgwUmN9HdaTY/r+AK9qePFiYpL+XcpHKacthY0tK
	hZLbBLtQFIwuYrKq3gSNRofQl1DGeDRiVzZ6kn9mrtRWFJdHGM/G7FAhEWYfSlIm616zdKn
	LmJIMTcvRENAzF1XlHSbY5UjphPSpIY1DoBv5GMH7ODJSlopuiP1+GgFznVJ+/ei2t8QX9x
	QaaoDCcYcp4rxgnP5ybWPj9XeFrDTvb4wXFktk/Zv0vNI8xBPmJLNKeE4NV1D6Kbv1OS2OO
	OGYVkuRtwOKLEZQEMxv9tryTBF5P826QaRWwYnMmrL7MekCQnnx+lRXOL97sOyI1l5f0v9D
	dX+Yd8LQFv3KHNP3pNF5MoRcd6nGF0N0oZ/W51eeB/gHqQEWR/p92fnTd+f3a0bEeQYEcYa
	QgTeMHWWqlhqM78EmCEdWcPDiguI18GUxDJMD6689vMg0xJK1VDAAwZxpb91n0mQHU6T9P9
	99XLQll3vAdqrvbhAO5eDbJq9IgqOSXYi03Zg8DHDbqTOXR/F5pAGy3OBSMiVzvQmqwtMIL
	5we3/jBE2UnVneSvslZQFA4qe9R3j7cF39KDrrdfD6R4U2RNnwswcxTAkipTlKzmH9hC22k
	nVrdK4OfKYJDHlu4Vl5Wz09AjWoPVrLn0xYq/S7vLF6wuv7J7y5XPsaptLxY/+SseYTVzbE
	P0g/UdcfWEBdvSZeEYpdtmXNzDLFGJh/4Y4cIdL7AcLuXoZZUjAxp/hQihgX3bGy6NK94Gr
	lDr+2bftDDKe1BlwyqEMu/TeSLq7aKDhDTXJvRbXKyqfvs+Ugf7iG7hYn5LV8KWr5PU6Tvd
	mvP0LKLqYW9PeY8WI22AdN715+pc7gCcr1q64Bpl+hxZIBvuz3CADKuMZNa3mEiM9rl3xaP
	IfaEIxrnRrbCmtkPIMNuN0jT7OQqWhwmiaf0
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_024934_893533_B721D5D1 
X-CRM114-Status: GOOD (  16.33  )
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

Add code to bring up all 8 cores during OpenSBI initialization so
that the Linux kernel can detect and use all cores properly.

Co-authored-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
---
 lib/utils/hsm/Kconfig            |   4 ++
 lib/utils/hsm/fdt_hsm_spacemit.c | 140 +++++++++++++++++++++++++++++++++++++++
 lib/utils/hsm/objects.mk         |   3 +
 platform/generic/Kconfig         |   1 +
 4 files changed, 148 insertions(+)

diff --git a/lib/utils/hsm/Kconfig b/lib/utils/hsm/Kconfig
index 1ad7958fb582a3ee561dfaec4afd738054b58906..1384a5fafeb861e6e08e2ab44958337b80d8e862 100644
--- a/lib/utils/hsm/Kconfig
+++ b/lib/utils/hsm/Kconfig
@@ -14,6 +14,10 @@ config FDT_HSM_RPMI
 	depends on FDT_MAILBOX && RPMI_MAILBOX
 	default n
 
+config FDT_HSM_SPACEMIT
+	bool "FDT SPACEMIT HSM driver"
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/hsm/fdt_hsm_spacemit.c b/lib/utils/hsm/fdt_hsm_spacemit.c
new file mode 100644
index 0000000000000000000000000000000000000000..12381d6058fb1a4b9b9c07b4684fffffff4bd0b6
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm_spacemit.c
@@ -0,0 +1,140 @@
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
+static const u64 cpu_wakeup_reg[] = {
+	PMU_AP_CORE0_WAKEUP,
+	PMU_AP_CORE1_WAKEUP,
+	PMU_AP_CORE2_WAKEUP,
+	PMU_AP_CORE3_WAKEUP,
+	PMU_AP_CORE4_WAKEUP,
+	PMU_AP_CORE5_WAKEUP,
+	PMU_AP_CORE6_WAKEUP,
+	PMU_AP_CORE7_WAKEUP,
+};
+
+static const u64 cpu_idle_reg[] = {
+	PMU_AP_CORE0_IDLE_CFG,
+	PMU_AP_CORE1_IDLE_CFG,
+	PMU_AP_CORE2_IDLE_CFG,
+	PMU_AP_CORE3_IDLE_CFG,
+	PMU_AP_CORE4_IDLE_CFG,
+	PMU_AP_CORE5_IDLE_CFG,
+	PMU_AP_CORE6_IDLE_CFG,
+	PMU_AP_CORE7_IDLE_CFG,
+};
+
+static inline void spacemit_set_cpu_power(u32 hartid, bool enable)
+{
+	unsigned int value;
+	unsigned int *cpu_idle_base = (unsigned int *)cpu_idle_reg[hartid];
+
+	value = readl(cpu_idle_base);
+
+	if (enable)
+		value &= ~PMU_AP_IDLE_PWRDOWN_MASK;
+	else
+		value |= PMU_AP_IDLE_PWRDOWN_MASK;
+
+	writel(value, cpu_idle_base);
+}
+
+static void spacemit_wakeup_cpu(u32 mpidr)
+{
+	unsigned int *cpu_reset_base;
+	unsigned int cur_hartid = current_hartid();
+
+	cpu_reset_base = (unsigned int *)cpu_wakeup_reg[cur_hartid];
+
+	writel(1 << mpidr, cpu_reset_base);
+}
+
+static void spacemit_assert_cpu(void)
+{
+	spacemit_set_cpu_power(current_hartid(), false);
+}
+
+static void spacemit_deassert_cpu(unsigned int hartid)
+{
+	spacemit_set_cpu_power(hartid, true);
+}
+
+/* Start (or power-up) the given hart */
+static int spacemit_hart_start(unsigned int hartid, unsigned long saddr)
+{
+	spacemit_deassert_cpu(hartid);
+	spacemit_wakeup_cpu(hartid);
+
+	return 0;
+}
+
+/*
+ * Stop (or power-down) the current hart from running. This call
+ * doesn't expect to return if success.
+ */
+static int spacemit_hart_stop(void)
+{
+	csr_write(CSR_STIMECMP, GENMASK_ULL(63, 0));
+	csr_clear(CSR_MIE, MIP_SSIP | MIP_MSIP | MIP_STIP | MIP_MTIP | MIP_SEIP | MIP_MEIP);
+
+	/* disable data preftch */
+	csr_clear(CSR_MSETUP, MSETUP_PFE);
+	asm volatile ("fence iorw, iorw");
+
+	/* flush local dcache */
+	csr_write(CSR_MRAOP, MRAOP_ICACHE_INVALID);
+	asm volatile ("fence iorw, iorw");
+
+	/* disable dcache */
+	csr_clear(CSR_MSETUP, MSETUP_DE);
+	asm volatile ("fence iorw, iorw");
+
+	/*
+	 * Core4-7 do not have dedicated bits in ML2SETUP;
+	 * instead, they reuse the same bits as core0-3.
+	 *
+	 * Thereforspacemit_deassert_cpue, use modulo with PLATFORM_MAX_CPUS_PER_CLUSTER
+	 * to select the proper bit.
+	 */
+	csr_clear(CSR_ML2SETUP, 1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
+	asm volatile ("fence iorw, iorw");
+
+	spacemit_assert_cpu();
+
+	wfi();
+
+	return SBI_ENOTSUPP;
+}
+
+static const struct sbi_hsm_device spacemit_hsm_ops = {
+	.name		= "spacemit-hsm",
+	.hart_start	= spacemit_hart_start,
+	.hart_stop	= spacemit_hart_stop,
+};
+
+static int k1_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	sbi_hsm_set_device(&spacemit_hsm_ops);
+
+	return 0;
+}
+
+static const struct fdt_match k1_match[] = {
+	{ .compatible = "spacemit,k1" },
+	{ },
+};
+
+const struct fdt_driver fdt_hsm_k1 = {
+	.match_table = k1_match,
+	.init = k1_probe,
+};
diff --git a/lib/utils/hsm/objects.mk b/lib/utils/hsm/objects.mk
index c13d81f78dd69ceb37cf83b19b10bc95c3dcfaff..6c15741bb2a02098e1ba6d9750ef68c082fce0c6 100644
--- a/lib/utils/hsm/objects.mk
+++ b/lib/utils/hsm/objects.mk
@@ -9,3 +9,6 @@
 
 carray-fdt_early_drivers-$(CONFIG_FDT_HSM_RPMI) += fdt_hsm_rpmi
 libsbiutils-objs-$(CONFIG_FDT_HSM_RPMI) += hsm/fdt_hsm_rpmi.o
+
+carray-fdt_early_drivers-$(CONFIG_FDT_HSM_SPACEMIT) += fdt_hsm_spacemit
+libsbiutils-objs-$(CONFIG_FDT_HSM_SPACEMIT) += hsm/fdt_hsm_spacemit.o
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index d0835126287ef080a44e30140b49c022695efd17..292c9d39c3e88cd00c2405dff919e105c2bb6aa8 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -78,6 +78,7 @@ config PLATFORM_MIPS_P8700
 
 config PLATFORM_SPACEMIT_K1
 	bool "Spacemit K1 support"
+	select FDT_HSM_SPACEMIT
 	default n
 
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"

-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
