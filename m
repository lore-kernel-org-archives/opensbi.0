Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A17C5B572
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 01:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfBvYuPhC2qlAtGrjuDiE3jSPvKoL4gJZuLfFTmYsN8=; b=x1Xdr1GR9E0NAH
	P7vfRnzUL6KvhbB7NXafDNtQjhHFVbBO5ufOsfFoReBIzdBjt19/TwzbPlGh25Zkn9EHLeqwp1HY3
	3FBNYrv0665X/k5k6v+3OoDPBXyxZJTLi3pPe7keE/1l+XDzRduorRoDfOJesBSXUm/3DiwVTy4Eq
	Q36ZO1++nShOWd5sYpkbYHI6IjM+cKakflUu/cjhC+ZHeCQYn+K8NHMxvHXRXg6k16vldv5bR3QPe
	W/yPLwSargSnHkrpP92jML6YwRrLxEh+ARMLpfL3dW/BS7fwSDprvCMygDrCEFH42XiUdKWsMocGL
	aONxTjPn/iAnWXf1fEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pw-000000072mB-2EWe;
	Tue, 18 Aug 2026 01:15:04 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pt-000000072gZ-0iSA
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 01:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787015675;
	bh=M2UNJydfbsH8LercVXovVVo2n8PDUPkoZOVrJ83mfLI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=iBVDjoB9+hpJlDh5mS/OwDhc6oOiY3xYwPCpbw4OgZGfIDedVvxJM2f9KgYeao1Ul
	 CEEQtBH5pRDI4LQO1zPQB8qUp60etiuhyVFevgYIcCHkJDSjyGbZv1atjsjjUzymgk
	 flnYIG4U+rkx+17QdJzVR2YVlDy5njs8ZQ9WrLYI=
X-QQ-mid: esmtpsz16t1787015674t261a7bfd
X-QQ-Originating-IP: zLuzNqXD6oiQw5xv50P0k7czGlhBia3utmvApJN5hp0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Aug 2026 09:14:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8082339385725724324
EX-QQ-RecipientCnt: 5
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Aug 2026 09:14:07 +0800
Subject: [PATCH v2 4/5] platform: generic: spacemit: k1: refactor platform
 support
MIME-Version: 1.0
Message-Id: <20260818-spacemit-k3-v2-4-84cb7773a481@linux.spacemit.com>
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
In-Reply-To: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14348;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=f2PAAW/yVbmnrCoA7zEf1DNQzZgV4WXv7j7FGV6FRvs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnNG5+yCU1t/JP/fs3ZPEHblvIsqyszhRe7L3bd/rE0S
 /IGS1tERykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwETsaxn+50kUejUX9X6ZPlln
 4Svu0vWh1iIcu0MVq/+6rFD4mDfpOcM/qxkmp9ctaAozrtsg6Xvpy/qdjo9UTW1+PGKrO/Rq2t6
 lzAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mom5ezI3X1cDfY0uIQhSG4/e/hUj1753CReBSbLJ44uDIJiLvT1i8Kab
	YEcwzfvjaapWyfEpffBqT5Uj15HNIA7B2WLpY1xnNa8I+l2iZeZce78a1d9fUTB2dl0qZ8H
	fLw/VzQ8cJpTHIWpmbx6/qIvWeavQBYlI/3vdu+J30ak4j0UXh53JZblldNx750DDabzjao
	dVUJ1hzkWmMer/IyNkpj0upi9kCgLonTnM7cjP2VhqAqZVHiy9GID3hO2QVZogrAnks+TDK
	aLpIv8RjE6wm+LNb1a1oFQ2JNDjeHfvDQzmz0vy6eOsyr0WgMnD0vQnncqJqPghdOUIR7na
	6SGdYfp1wcjZAMlYqmeVE2qzm0QsjFxtPaQJRkG1xNMdQD3ckUJpjJeQnK06jOiR2YoRTIi
	q8hHHiS5favBi0RxJEFiipGtAbrDpIiwVRaJDWnolnbwhth3ePJTvaZbsroyaQRgrDBIt9Z
	rxp0WORsTDji+2JKbJbGzZU3NNbq5SRROAK5ykf0o1RJdfT/IUQT9QwszUsWbRmfAwLgAGn
	wxs/YYd685OmqCXk/Uc8PaTLqfyl7qceIkw2SvHIXdRKlnIILhtvIIidEnK9pPg9fne1Nw+
	sgCw1CWKquWLr+OioQowgqm+T2I3d5UUMIEcS8zXG7YR5daj1B4/q4eA4baNM8C2r6d1vet
	XqMazQ5T8lzg1OCbMOSPhzFh3F+ujEn2e+3zi1UBNargYaT+03ps1PJpF7H8mrnZJBSHyLr
	7RPGWwEAIoGSiqcOm0F9pVmAUq98WzkfW1tt32RHPP1F6VUSt4CAGY69ZtUlLv8XkAwFwtX
	8pDWX92vnARXmApxXWdr9CBGTxsB1FVL4Yc+INUXw5HX4JG/s/NCKVR13MllXSv6eKlfg2P
	zjpUC7fHhUvApawgKoe6Uhn3XyLagRwltTvBGvo76MgWtSvZSU+LIsJUrGM3rAKhUAcSP4g
	/QafN/UqfC1p+z4rC87CkfmOrZZdbBBI2C1OsIWXgpfuvVw4dbc98uwKOFvPhSat1JugETQ
	/3OZO9Fr+vgg0X5X+ADzEPzUhHOt491gDGRyeGjWRfbEJFe+rlZYlVBM4uEs0DwDaer4yfF
	tY7k80cyP4IEELS7r7VSQybJGUPe1rEkg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_181501_726522_5A848917 
X-CRM114-Status: GOOD (  19.81  )
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
 lib/utils/hsm/fdt_hsm_spacemit.c             |  5 +-
 platform/generic/Kconfig                     |  4 ++
 platform/generic/include/spacemit/common.h   | 86 +++++++++++++++++++++++++
 platform/generic/include/spacemit/k1.h       | 94 +++++-----------------------
 platform/generic/include/spacemit/spacemit.h | 14 +++++
 platform/generic/spacemit/k1.c               | 33 ++--------
 platform/generic/spacemit/objects.mk         |  1 +
 platform/generic/spacemit/spacemit.c         | 36 +++++++++++
 8 files changed, 167 insertions(+), 106 deletions(-)

diff --git a/lib/utils/hsm/fdt_hsm_spacemit.c b/lib/utils/hsm/fdt_hsm_spacemit.c
index 99c52335..a7045569 100644
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
