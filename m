Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DA9C61DB9
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5UG/9LDBQABi3DeNqZ+rFjR3pdtvzdiP4C9C99kbIE=; b=LOaYMupf1+3M+K
	O0dAJc+1EZl6ddnIVrtBk8R/vvYRjScNS4qHZGXuTJVNKyrQ1AIisGvTGNndgsVqSWnhkht94axVH
	pXPVm+56k7zO1bCq+auX7jpaOpT5EAkorJjjFe8hFC0saVO/ugHJXPSQrx0ewqyfefaqJSn/gUTqX
	0GzliJfEofKNhMkVFItEzbTShuS1y5APY6efk0aJ1TIVF0VgjdcBuf1SHdgqwaDYGksGMCbejSPCH
	lub1S0yFRvVAWe0XvK0zBO6z8hD0q1KR6HygWoL1+6dC/HXzHl56MSWoj573+0otMKk4iKu7z0OMm
	9fetXGmNT199x1Qs1+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHz-00000003jNH-0615;
	Thu, 27 Aug 2026 09:20:51 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHw-00000003jGN-1iTf
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 09:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787822402;
	bh=Xx/5ajFGP7qIlOIa7fRzcn6GBWuFzUv4y/HMXZz8AVo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=D22TGB7d/ASDj//CVaoAx53sdvoFqPjAOTcGndP7XFBDjIwwVnJqPxNlT+ApfjUn2
	 aWGWGzXsm2u+CdykTPj/eEfJCIqvdGEtfZqDBkigKborbIxyEOK9kecz3Oj/Piknul
	 aqq4VruYp+nzQ3hc9s9Gl4V3yIzKzRuz3tss33SQ=
X-QQ-mid: esmtpgz10t1787822397te83433bb
X-QQ-Originating-IP: oF+YfWXL9/lgW0hFINNu7NPv6aslP+1MER1sPlzcCXY=
Received: from = ( [183.48.244.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 17:19:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6692813601542871560
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 27 Aug 2026 17:19:22 +0800
Subject: [PATCH v3 4/5] platform: generic: spacemit: k1: refactor platform
 support
MIME-Version: 1.0
Message-Id: <20260827-spacemit-k3-v3-4-5d8dbb68539d@linux.spacemit.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
In-Reply-To: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15129;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=ikHNXupmAMt03x3ODGF/E4NamiEuwgYrJuJZRUxOKM8=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGqQASShZkwHnjEvf20Lv5WCSMGBJdyCm1wLUdUBUpU8KPw9L
 oh1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmqQASQACgkQmAnvgPkzNC88KwD9FOlE
 jlpGM1oXCBa7wX8iT7zmuncgC+MxMAYLxmdW87UA/ibrkY1jdyeg9pk/z7DckHWaEVg8hwx4GxT
 hOdvT8eMP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NqEoO4JFgyuDe/52MRp8HlNXfaVGy6y8uqyA3GxxslkWypgY5J6E9n1n
	fXcf6QZNXlE5jFsKQAQQDI0okX5D9/o/Au27q8pISk82naLBvFaE6ZdqfP+3Q6tdc6XArKf
	xCznbrd99prprRCzvT0UwkCBxvfTBE5e7+V9wdhjRmuJ3GnTd2wW93X7TsAinCyPgLP+mg3
	OLzSmHTluIUSu4uyuYh/h1W5CQnpLzg7zaKrP13AbIUmm4C61gq/o60n/benbpBJ5fQixsS
	/Y+XPP2efOpkHRYThpn8j1Mqd4pLEvGJBBd078sABK3K/vFNCaWUc//MFuypBOHf92HA71F
	UKLJHHRG3sImr8tx6y+PZYXrE3//qL0R+ViuFPdsq5NBnA+ZYumTVwDJu5IkjAlrr6RKUr/
	GKbcbkbB/gbXhJ6zskvJUvVYfmKEGnwnLOuV1ryC/oguRpUZtcXUG7BH2yvrS8bzGyR70YX
	JdwWDl8Z79AtDdIRJAKwUNfqkGhuunfehNhqNvVfFhlUFk69t1e1BTbxQKIwFYJ4/mlEGVb
	AgjEpfrrs4+pb/OiFg9MotoSFHJeGy2QWUnQQxNPjwL2g8E81oE6EcmKc+aGEiPrZxNbOLZ
	K3ijXEdEjw8WYO9Xu1nFBFgUKPWJ4AePRXpf0dwmBooL5XuZQTJa5gmqwwh3i2kASaK3+b3
	HSsE4hS3+kNYhNQODRagFWSWgCur6nszUedfWV8tARvcPCqrk1fflUd40ZI6r78bDvHPauI
	XOlzBNUKlRHySTtnI27J6f2vX42SVK05Sivd9uf1ToIGc7WssrY9x3Pf/XRSG9jvAlTT+LM
	L9gMUeoAB67jCp9dzJaFkhZWu0ACgewspO8uZ89+5wAf5eCOmmCSkdehu0kdkcn2+x5WZVy
	FTufEgy1JQ0wa0KhgJjTdstHYmbxuwV36CcGW7IMAblNo46IqSneAPghofxksfcgHZ0H+S2
	P8A1TC/svkGG7vk8BrzkUxTR0+iAXp9bV/7+8qXGigN7reaLQa7LsqqdBjHML9liyFnvb7t
	nKwFDYDYFhM465G9R51B9EVDdnxb5zRePJdf3obU9YcU9L9VwUwXyWFh146DIGNMV1PR4gn
	EgtTArBAO1Irbt1AVpcOM+WIg8o2RN1ra8pFccxeolQ
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_022048_855357_080814AF 
X-CRM114-Status: GOOD (  18.35  )
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

K3 shares cache-control CSRs, PMU idle fields, cluster sizing, and the
CCI-550 programming sequence with K1. Keeping these definitions and the
CCI helper in K1-specific files would either duplicate them or make K3
depend on K1 support.

Add a hidden PLATFORM_SPACEMIT option and move the shared definitions to
spacemit/common.h. Move cci_enable_snoop_dvm_reqs() to spacemit.c while
keeping each SoC's CCI topology and boot flow in its own platform driver.

Rename the PMU idle fields to match the K1 and K3 User Manuals. Keep the
K1 power-down mask at 0x1b, so K1 power-management behavior remains
unchanged. Keep the K1 HSM implementation K1-specific and switch it to
the shared definitions.

This is a non-functional refactoring that prepares the common support
used by K3.

Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Co-developed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 lib/utils/hsm/fdt_hsm_spacemit.c             | 10 +--
 platform/generic/Kconfig                     |  4 ++
 platform/generic/include/spacemit/common.h   | 86 +++++++++++++++++++++++++
 platform/generic/include/spacemit/k1.h       | 94 +++++-----------------------
 platform/generic/include/spacemit/spacemit.h | 14 +++++
 platform/generic/spacemit/k1.c               | 33 ++--------
 platform/generic/spacemit/objects.mk         |  1 +
 platform/generic/spacemit/spacemit.c         | 36 +++++++++++
 8 files changed, 169 insertions(+), 109 deletions(-)

diff --git a/lib/utils/hsm/fdt_hsm_spacemit.c b/lib/utils/hsm/fdt_hsm_spacemit.c
index 99c52335..6348f6a3 100644
--- a/lib/utils/hsm/fdt_hsm_spacemit.c
+++ b/lib/utils/hsm/fdt_hsm_spacemit.c
@@ -10,6 +10,7 @@
 #include <platform_override.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_hsm.h>
+#include <spacemit/common.h>
 #include <spacemit/k1.h>
 
 static const u64 cpu_wakeup_reg[] = {
@@ -42,9 +43,9 @@ static inline void spacemit_set_cpu_power(u32 hartid, bool enable)
 	value = readl(cpu_idle_base);
 
 	if (enable)
-		value &= ~PMU_AP_IDLE_PWRDOWN_MASK;
+		value &= ~PMU_AP_IDLE_PWRDOWN_K1_MASK;
 	else
-		value |= PMU_AP_IDLE_PWRDOWN_MASK;
+		value |= PMU_AP_IDLE_PWRDOWN_K1_MASK;
 
 	writel(value, cpu_idle_base);
 }
@@ -87,7 +88,7 @@ static int spacemit_hart_stop(void)
 	csr_write(CSR_STIMECMP, GENMASK_ULL(63, 0));
 	csr_clear(CSR_MIE, MIP_SSIP | MIP_MSIP | MIP_STIP | MIP_MTIP | MIP_SEIP | MIP_MEIP);
 
-	/* disable data preftch */
+	/* disable data prefetch */
 	csr_clear(CSR_MSETUP, MSETUP_PFE);
 	asm volatile ("fence iorw, iorw");
 
@@ -102,8 +103,7 @@ static int spacemit_hart_stop(void)
 	/*
 	 * Core4-7 do not have dedicated bits in ML2SETUP;
 	 * instead, they reuse the same bits as core0-3.
-	 *
-	 * Thereforspacemit_deassert_cpue, use modulo with PLATFORM_MAX_CPUS_PER_CLUSTER
+	 * Therefore, use modulo with PLATFORM_MAX_CPUS_PER_CLUSTER
 	 * to select the proper bit.
 	 */
 	csr_clear(CSR_ML2SETUP, 1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index d594b140..958610d3 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -100,9 +100,13 @@ config PLATFORM_THEAD
 	select THEAD_C9XX_PMU
 	default n
 
+config PLATFORM_SPACEMIT
+	bool
+
 config PLATFORM_SPACEMIT_K1
 	bool "Spacemit K1 support"
 	select FDT_HSM_SPACEMIT
+	select PLATFORM_SPACEMIT
 	default n
 
 config CPU_MIPS_P8700
diff --git a/platform/generic/include/spacemit/common.h b/platform/generic/include/spacemit/common.h
new file mode 100644
index 00000000..317bb3e9
--- /dev/null
+++ b/platform/generic/include/spacemit/common.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2025 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+#ifndef __RISCV_SPACEMIT_COMMON_H__
+#define __RISCV_SPACEMIT_COMMON_H__
+
+#include <sbi/sbi_bitops.h>
+
+#define CSR_MSETUP				0x7c0
+#define CSR_ML2SETUP				0x7f0
+
+/* dcache enable */
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
+#define PMU_AP_BASE				0xd4282800
+
+#define PMU_AP_CORE0_WAKEUP			(PMU_AP_BASE + 0x12c)
+#define PMU_AP_CORE1_WAKEUP			(PMU_AP_BASE + 0x130)
+#define PMU_AP_CORE2_WAKEUP			(PMU_AP_BASE + 0x134)
+#define PMU_AP_CORE3_WAKEUP			(PMU_AP_BASE + 0x138)
+#define PMU_AP_CORE4_WAKEUP			(PMU_AP_BASE + 0x324)
+#define PMU_AP_CORE5_WAKEUP			(PMU_AP_BASE + 0x328)
+#define PMU_AP_CORE6_WAKEUP			(PMU_AP_BASE + 0x32c)
+#define PMU_AP_CORE7_WAKEUP			(PMU_AP_BASE + 0x330)
+
+#define PMU_AP_CORE0_IDLE_CFG			(PMU_AP_BASE + 0x124)
+#define PMU_AP_CORE1_IDLE_CFG			(PMU_AP_BASE + 0x128)
+#define PMU_AP_CORE2_IDLE_CFG			(PMU_AP_BASE + 0x160)
+#define PMU_AP_CORE3_IDLE_CFG			(PMU_AP_BASE + 0x164)
+#define PMU_AP_CORE4_IDLE_CFG			(PMU_AP_BASE + 0x304)
+#define PMU_AP_CORE5_IDLE_CFG			(PMU_AP_BASE + 0x308)
+#define PMU_AP_CORE6_IDLE_CFG			(PMU_AP_BASE + 0x30c)
+#define PMU_AP_CORE7_IDLE_CFG			(PMU_AP_BASE + 0x310)
+
+/* boot entry for X100 clusters (C0, C1) */
+#define C0_RVBADDR_LO_ADDR			0xd4282db0
+#define C0_RVBADDR_HI_ADDR			0xd4282db4
+#define C1_RVBADDR_LO_ADDR			0xd4282eb0
+#define C1_RVBADDR_HI_ADDR			0xd4282eb4
+
+/* CCI-550 base and slave interface layout */
+#define CCI_550_PLATFORM_CCI_ADDR		0xd8500000
+#define CCI_550_STATUS				0x000c
+#define CCI_550_STATUS_CHANGE_PENDING		BIT(0)
+#define CCI_550_SLAVE_IFACE0_OFFSET		0x1000
+#define CCI_550_SLAVE_IFACE_OFFSET(idx)		\
+		(CCI_550_SLAVE_IFACE0_OFFSET + ((0x1000) * (idx)))
+#define CCI_550_SNOOP_CTRL			0x0000
+#define CCI_550_SNOOP_CTRL_ENABLE_SNOOPS	BIT(0)
+#define CCI_550_SNOOP_CTRL_ENABLE_DVMS		BIT(1)
+
+/*
+ * PMU AP per-core idle control register bits (PMU_AP_COREn_IDLE_CFG).
+ * Bit definitions are identical in K1 and K3 User Manuals.
+ * These replace the original ad-hoc names from k1.h (which incorrectly
+ * called bit 1 SRAM_PWRDWN, bit 3 WAKE_MCE, and bit 4 MC_SW_REQ).
+ */
+/* bit 0: CORE_IDLE - gate core clock externally when core enters WFI */
+#define PMU_AP_IDLE_CORE_IDLE			BIT(0)
+/* bit 1: CORE_PWRDWN - power off core on WFI (requires CORE_IDLE set) */
+#define PMU_AP_IDLE_CORE_PWRDWN			BIT(1)
+/* bit 2: Core L1 SRAM Power Down - reserved/not used in K1 and K3 */
+#define PMU_AP_IDLE_CORE_L1_SRAM_PWRDWN		BIT(2)
+/* bit 3: MASK_GIC_NIRQ_TO_CORE - mask nIRQ from GIC, auto-cleared by HW on power-down entry */
+#define PMU_AP_IDLE_MASK_GIC_NIRQ		BIT(3)
+/* bit 4: MASK_GIC_NFIQ_TO_CORE - mask nFIQ from GIC, auto-cleared by HW on power-down entry */
+#define PMU_AP_IDLE_MASK_GIC_NFIQ		BIT(4)
+
+#define PLATFORM_MAX_CPUS_PER_CLUSTER		4
+
+#endif /* __RISCV_SPACEMIT_COMMON_H__ */
diff --git a/platform/generic/include/spacemit/k1.h b/platform/generic/include/spacemit/k1.h
index ac727b04..662b42e5 100644
--- a/platform/generic/include/spacemit/k1.h
+++ b/platform/generic/include/spacemit/k1.h
@@ -1,88 +1,28 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2025 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
 #ifndef __RISCV_SPACEMIT_K1_H__
 #define __RISCV_SPACEMIT_K1_H__
 
-#define CSR_MSETUP				0x7c0
-#define CSR_MHCR				0x7c1
-#define CSR_MRAOP				0x7c2
-#define CSR_MHINT				0x7c5
-#define CSR_ML2SETUP				0x7f0
+#include <spacemit/common.h>
 
-/* decache enable */
-#define MSETUP_DE				BIT(0)
-/* icache enable */
-#define MSETUP_IE				BIT(1)
-/* branch prediction enable */
-#define MSETUP_BPE				BIT(4)
-/* prefetch functionality enable */
-#define MSETUP_PFE				BIT(5)
-/* misaligned memory access enable */
-#define MSETUP_MME				BIT(6)
-/* ECC enable */
-#define MSETUP_ECCE				BIT(16)
+#define CSR_MRAOP				0x7c2
 
-/* cache flush */
 #define MRAOP_CACHE_FLUSH			GENMASK(1, 0)
 
-#define PMU_AP_BASE				0xd4282800
-
-#define PMU_AP_CORE0_WAKEUP			(PMU_AP_BASE + 0x12c)
-#define PMU_AP_CORE1_WAKEUP			(PMU_AP_BASE + 0x130)
-#define PMU_AP_CORE2_WAKEUP			(PMU_AP_BASE + 0x134)
-#define PMU_AP_CORE3_WAKEUP			(PMU_AP_BASE + 0x138)
-#define PMU_AP_CORE4_WAKEUP			(PMU_AP_BASE + 0x324)
-#define PMU_AP_CORE5_WAKEUP			(PMU_AP_BASE + 0x328)
-#define PMU_AP_CORE6_WAKEUP			(PMU_AP_BASE + 0x32c)
-#define PMU_AP_CORE7_WAKEUP			(PMU_AP_BASE + 0x330)
-
-#define PMU_AP_CORE0_IDLE_CFG			(PMU_AP_BASE + 0x124)
-#define PMU_AP_CORE1_IDLE_CFG			(PMU_AP_BASE + 0x128)
-#define PMU_AP_CORE2_IDLE_CFG			(PMU_AP_BASE + 0x160)
-#define PMU_AP_CORE3_IDLE_CFG			(PMU_AP_BASE + 0x164)
-#define PMU_AP_CORE4_IDLE_CFG			(PMU_AP_BASE + 0x304)
-#define PMU_AP_CORE5_IDLE_CFG			(PMU_AP_BASE + 0x308)
-#define PMU_AP_CORE6_IDLE_CFG			(PMU_AP_BASE + 0x30c)
-#define PMU_AP_CORE7_IDLE_CFG			(PMU_AP_BASE + 0x310)
-
-/* power down */
-#define PMU_AP_IDLE_PWRDWN			BIT(0)
-/* sram power down */
-#define PMU_AP_IDLE_SRAM_PWRDWN			BIT(1)
-/* enable wake up the memory controller */
-#define PMU_AP_IDLE_WAKE_MCE			BIT(3)
-/* disable memory controller software req */
-#define PMU_AP_IDLE_MC_SW_REQ			BIT(4)
-
-#define PMU_AP_IDLE_PWRDOWN_MASK		(PMU_AP_IDLE_PWRDWN | PMU_AP_IDLE_SRAM_PWRDWN | \
-						 PMU_AP_IDLE_WAKE_MCE | PMU_AP_IDLE_MC_SW_REQ)
-/* cci */
-#define C0_RVBADDR_LO_ADDR			0xd4282db0
-#define C0_RVBADDR_HI_ADDR			0xd4282db4
-#define C1_RVBADDR_LO_ADDR			0xd4282eb0
-#define C1_RVBADDR_HI_ADDR			0xd4282eb4
-
-#define CCI_550_PLATFORM_CCI_ADDR		0xd8500000
-
-/* relative to cci base */
-#define CCI_550_STATUS				0x000c
-/* status register bits */
-#define CCI_550_STATUS_CHANGE_PENDING		BIT(0)
-
-/* slave interface registers */
-#define CCI_550_SLAVE_IFACE0_OFFSET		0x1000
-#define CCI_550_SLAVE_IFACE_OFFSET(idx)		(CCI_550_SLAVE_IFACE0_OFFSET + ((0x1000) * (idx)))
-
-/* relative to slave interface base */
-#define CCI_550_SNOOP_CTRL			0x0000
-/* snoop control register bits */
-#define CCI_550_SNOOP_CTRL_ENABLE_SNOOPS	BIT(0)
-#define CCI_550_SNOOP_CTRL_ENABLE_DVMS		BIT(1)
+#define PMU_AP_IDLE_PWRDOWN_K1_MASK		(PMU_AP_IDLE_CORE_IDLE |	\
+						 PMU_AP_IDLE_CORE_PWRDWN |	\
+						 PMU_AP_IDLE_MASK_GIC_NIRQ |	\
+						 PMU_AP_IDLE_MASK_GIC_NFIQ)
 
-/* clusters and CPU mapping */
-#define PLATFORM_MAX_CPUS			8
-#define PLATFORM_MAX_CPUS_PER_CLUSTER		4
 #define CPU_TO_CLUSTER(cpu)			((cpu) / PLATFORM_MAX_CPUS_PER_CLUSTER)
 
-#define PLAT_CCI_CLUSTER0_IFACE_IX		0
-#define PLAT_CCI_CLUSTER1_IFACE_IX		1
+#define PLAT_CCI_K1_CLUSTER0_IFACE_IX		0
+#define PLAT_CCI_K1_CLUSTER1_IFACE_IX		1
 
-#endif
+#endif /* __RISCV_SPACEMIT_K1_H__ */
diff --git a/platform/generic/include/spacemit/spacemit.h b/platform/generic/include/spacemit/spacemit.h
new file mode 100644
index 00000000..671cfd05
--- /dev/null
+++ b/platform/generic/include/spacemit/spacemit.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2025 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+#ifndef __RISCV_SPACEMIT_H__
+#define __RISCV_SPACEMIT_H__
+
+void cci_enable_snoop_dvm_reqs(const int *cci_map, unsigned int master_id);
+
+#endif
diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
index 19a9b27c..323239e0 100644
--- a/platform/generic/spacemit/k1.c
+++ b/platform/generic/spacemit/k1.c
@@ -12,37 +12,16 @@
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_hsm.h>
 #include <spacemit/k1.h>
+#include <spacemit/spacemit.h>
+
+#define PLATFORM_MAX_CPUS			8
 
 /* only use 0-1 cluster in SpacemiT K1 */
 static const int cci_map[] = {
-	PLAT_CCI_CLUSTER0_IFACE_IX,
-	PLAT_CCI_CLUSTER1_IFACE_IX,
+	PLAT_CCI_K1_CLUSTER0_IFACE_IX,
+	PLAT_CCI_K1_CLUSTER1_IFACE_IX,
 };
 
-static void cci_enable_snoop_dvm_reqs(unsigned int master_id)
-{
-	int slave_if_id = cci_map[master_id];
-
-	/*
-	 * Enable Snoops and DVM messages, no need for Read/Modify/Write as
-	 * rest of bits are write ignore
-	 */
-	writel(CCI_550_SNOOP_CTRL_ENABLE_DVMS | CCI_550_SNOOP_CTRL_ENABLE_SNOOPS,
-	       (void *)(u64)CCI_550_PLATFORM_CCI_ADDR +
-	       CCI_550_SLAVE_IFACE_OFFSET(slave_if_id) + CCI_550_SNOOP_CTRL);
-
-	/*
-	 * Wait for the completion of the write to the Snoop Control Register
-	 * before testing the change_pending bit
-	 */
-	mb();
-
-	/* Wait for the dust to settle down */
-	while ((readl((void *)(u64)CCI_550_PLATFORM_CCI_ADDR + CCI_550_STATUS) &
-	       CCI_550_STATUS_CHANGE_PENDING))
-		;
-}
-
 static void spacemit_k1_pre_init(void)
 {
 	unsigned int clusterid, cluster_enabled = 0;
@@ -62,7 +41,7 @@ static void spacemit_k1_pre_init(void)
 
 		if (!(cluster_enabled & (1 << clusterid))) {
 			cluster_enabled |= 1 << clusterid;
-			cci_enable_snoop_dvm_reqs(clusterid);
+			cci_enable_snoop_dvm_reqs(cci_map, clusterid);
 		}
 	}
 }
diff --git a/platform/generic/spacemit/objects.mk b/platform/generic/spacemit/objects.mk
index dcb37867..8309ad1f 100644
--- a/platform/generic/spacemit/objects.mk
+++ b/platform/generic/spacemit/objects.mk
@@ -2,5 +2,6 @@
 # SPDX-License-Identifier: BSD-2-Clause
 #
 
+platform-objs-$(CONFIG_PLATFORM_SPACEMIT) += spacemit/spacemit.o
 carray-platform_override_modules-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit_k1
 platform-objs-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit/k1.o
diff --git a/platform/generic/spacemit/spacemit.c b/platform/generic/spacemit/spacemit.c
new file mode 100644
index 00000000..a215c1ad
--- /dev/null
+++ b/platform/generic/spacemit/spacemit.c
@@ -0,0 +1,36 @@
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
+#include <spacemit/common.h>
+
+void cci_enable_snoop_dvm_reqs(const int *cci_map, unsigned int master_id)
+{
+	int slave_if_id = cci_map[master_id];
+
+	/*
+	 * Enable Snoops and DVM messages, no need for Read/Modify/Write as
+	 * rest of bits are write ignore
+	 */
+	writel(CCI_550_SNOOP_CTRL_ENABLE_DVMS | CCI_550_SNOOP_CTRL_ENABLE_SNOOPS,
+	       (void *)(unsigned long)CCI_550_PLATFORM_CCI_ADDR +
+	       CCI_550_SLAVE_IFACE_OFFSET(slave_if_id) + CCI_550_SNOOP_CTRL);
+
+	/*
+	 * Wait for the completion of the write to the Snoop Control Register
+	 * before testing the change_pending bit
+	 */
+	mb();
+
+	/* Wait for the dust to settle down */
+	while (readl((void *)(unsigned long)CCI_550_PLATFORM_CCI_ADDR + CCI_550_STATUS) &
+	       CCI_550_STATUS_CHANGE_PENDING)
+		;
+}

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
