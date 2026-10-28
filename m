Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D70606A31A
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hOEOV1Jz;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=g/dv9xkK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QXhPDlO3w5PrtD8rXT9ZV5HCYLgWnzzdG3MFow3PcRA=; b=hOEOV1JzuRsETcv6yX0KHfLfkL
	PLLo0a224PlFZuIxp3kOZcPZ1/c8JEY8UFzULVAlcFYMH8zGKH1cch70qP7aiWhCblUqVXbYjmQ4X
	rBkTEhvMra7OPH0rIc4M+gy1Rw/C0c0FO2pWLEBBvXxBj2W5VRPDYb0dOVOKFD03thBgyxIKFJ7rb
	B/2hA/f6fYD24M+GoMvDHITvUEgjZIPvdLnwuvVrimRNV6n2Z5s08Hr8I4wFwFjCj9RYSdQzyQsBL
	buZ2EySOLqWu1EmzTSKp5PP5fXVc581mdBdXEWsaRAPxyDwcejkDH3SZrmpC0aZ3nsRgKogreQ7Dh
	+M4byXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4AS-000000078hx-0ijq;
	Wed, 28 Oct 2026 13:58:16 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4AP-000000078eD-11VP
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 13:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793195829;
	bh=+ba0+QI11jUMHhmcmRWiI17Yv+UveDCw8iNOpbcFpZE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=g/dv9xkKXxaKAM9Pa+Q/aZb8q6dp2g8jgnjvZY7pGzyIYo3zWIlJHOzqoAxGSoBpZ
	 D3ecFMdmHWTZOsy5MNQx4dvBVn1LQ2amIvpM2hU6o7P72MHJUbaqJeKnTu+RxFB439
	 qtvZBUjE17iVy/YPSCfKO6SQRkT66h35d9MV97YA=
X-QQ-mid: zesmtpgz1t1793195828ta4af58b3
X-QQ-Originating-IP: KUsX+waVbVo4jQuEDISov3LgOIarNXEDKmb0iXSUFgM=
Received: from = ( [183.48.246.227])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Oct 2026 21:57:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2322799208245542126
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 28 Oct 2026 21:43:33 +0800
Subject: [PATCH v6 4/6] platform: generic: spacemit: k1: refactor platform
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261028-spacemit-k3-v6-4-01d984f60941@linux.spacemit.com>
References: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
In-Reply-To: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 E Shattow <e@freeshell.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15148;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=lM/bnYPlXJ8oTcsXcFo388ZBfqyjdKv7goMkCQYBIGc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkP/1i/ex776c5vwbrPuqeNWNvMVGynhce+qRIU1ZfY7
 vC7aNnujlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIkYyDIy3NggMu+vx1K3Ob1v
 ZBbu9lTXUDO1n+GwIC9leniuxifD/4wMU4yWehc+f6NnI2SvZt3nyrygv+r6fY2/cx9uMpT6H/S
 GAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MoxwSzSkny+XGFd5r5kJZzSPRqDKq2/viBuFmUUsZRQ8RD95hx3vjVTH
	n7SPZZrICF7wjaxY8vE2Cm/BdR/FEqPAhEDW/mU50Hel6P43mfnwaRk1xJCfgRwbOeHMXTW
	9oPbE8t0kvLAxb+KLvJoUN78yFi2gJjNeAgr548z201RpBwECeKc27q1oa85jnckWiqBmUX
	8IzNkO8TGe1J5KZI3z+45a/NrCELsx1KYbjhoswKOCQqn5ya/1LWd8wNEZwUQJe2zqqqYcV
	TQ/wqi7pMt809QRFutdI8t1OxB9oXztvG3hQ7moOAY47CGa/itUxTBKctWrCRohJa3FYQiy
	nM5Pym4HXkeP2yPBUdZy9o1sDA57SZ1t06t7EtZnNzooSoYGEIcSiRD4Zr42eHqDtKjLhrq
	19lUjDJ7jDDiYhICpgOME/7H4I/xI6TXbM6u9RRXDXfhR64ZSG73mdX5TyBUT2Qvim9eCvo
	RRTrEuX3e59ahYnWf3cuGAnRO64LrbBmeUZlccZr5VSxRwk1Oz1iaVFPBL0Pg2+0zsF9as+
	cGqk5oOeNBuyp199zaiJJZXcjxFHg+V+udUYI0LaK/PLUxs76IIugnYBGcSW0Od2yh7wdaf
	0yzTy5IACvA+1Bx7JseXVT0tgZTh5bO+tQ9y9gR3WQgtICvL6HFQtALADqupRl45DfvWhKE
	QfDImHntpam7cRI/4O0YvhwsLKSgsl7IPTiKy6fAkkYh+RUqcwz4VSGJyFnbGllJblyN/oN
	U3cLofYRuywDHLYKcS4aAHggUWl8YuGwyFcmcp1fJulIFU+yDmIdm1RfOhijBxIFapw/LcC
	NqXH8n8cgSp/AkCqTKlm93BBmnk8ked1c9Fc6Jay/ZF6nS1DPvIFkS6kFAJCgM+TJtysEi7
	4d041+zdbLk26C43FIx0A9kEMzH+x6UAeGprEnOZGFMCTSCMhZ/+yTHZhQlKtcj6uMN201N
	GrrRhgE/56GEgMrSAO/HHyERjL0PumUtEC0uVTOadWjX2c743C5Z7echK6+DIvnTxjcSH0K
	kPvTdqtc4aQ0JUO/KQJi/fnHfF/Yev+H7FZo5pzI09VP9DW5PqxO8MlCJvW3oEHiIQn5/O5
	uotaroiKsrxdWw1GiyKLVS4ngFoUIoNkgW7LL7bVpz6fLZogOL72vnBUqe09R2PVw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065813_788128_6842E37E 
X-CRM114-Status: GOOD (  17.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Tested-by: E Shattow <e@freeshell.de>
Co-developed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 lib/utils/hsm/fdt_hsm_spacemit.c             | 10 +--
 platform/generic/Kconfig                     |  4 ++
 platform/generic/include/spacemit/common.h   | 86 +++++++++++++++++++++++++
 platform/generic/include/spacemit/k1.h       | 93 +++++-----------------------
 platform/generic/include/spacemit/spacemit.h | 14 +++++
 platform/generic/spacemit/k1.c               | 33 ++--------
 platform/generic/spacemit/objects.mk         |  1 +
 platform/generic/spacemit/spacemit.c         | 36 +++++++++++
 8 files changed, 169 insertions(+), 108 deletions(-)

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
index 8d4f5344..662b42e5 100644
--- a/platform/generic/include/spacemit/k1.h
+++ b/platform/generic/include/spacemit/k1.h
@@ -1,87 +1,28 @@
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
index 5e699f8e..6c1cecd3 100644
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
