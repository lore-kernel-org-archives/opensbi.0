Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB78A606A31B
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pC5+EUWu;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=rUyFeMkd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1cYd6XEh8K33E4A+ypZg3pNBAv2u0tvsDOO8y5lxFDY=; b=pC5+EUWu6uBdnNq4DzYQEE/8IQ
	B9oVA/iV4W0ZQfWPjLsHsUe2/mDFigpqrdglB/KIKxP3Sl1NGTnkC6CU4+qA2oLZYIfjsHEg2M50T
	shHzGliLFf3hdybH5E1lDTti/fV9KdvCgwlpiiBLLgadj3wMwy8AIeLKbJ/0YNYyRLL/tSHrEJ5lq
	Zpkh2BAOMJ71+hUBgbZ4hZb9IzO/TRRCwgp/O2BGeYGRdQt6ICHDQKU3kGb8BGdCkBC0Bujrp+g56
	DG9H5k/0PHGQVgr7qCTHzsj904A7FeAyjm8hSkcXf76g/sNixLCi9uM839vtBWPw8hYIBtvOBLRfD
	IHJFxRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLegD-00000004Ks2-0sl2;
	Tue, 27 Oct 2026 10:45:21 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLegA-00000004Ko5-1yFf
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 10:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793097918; x=1824633918;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=N901Q0u3KDtzG64eOG9YNUPaGa5G60HjFtHVNbHw2a4=;
  b=rUyFeMkdoEgUWtkwzVHjjsNZ8snbn7N3/dQCOm5jsL5bSA4uuW3RweM0
   TuYckGYYQxahMPp9OKeyIr1gaKn3VEYiXNLlEZghJL9V6XG/854/l1G08
   aGh5ANE5Vxd/apk5g8F+h7ZOX5cHrpS+40H1n17MJsBEgiRBQMhR3i4Xq
   DottToHu713iNHdYzS7VHye33UENcCKneaVVSZR+DYtKedJQcAKTShyG2
   3hN7aMBxoTtgv//XoABGbNGcnMQzpeb8ojui7F7aVg2tYLBXEsY4cAk/e
   y9wuZkeSkzMCoA0NT0sVIIFSnKagh3YwSIY+UQtcrfaqnKnYRl6XsgaSm
   A==;
X-CSE-ConnectionGUID: ZO61DUcvRM+B4e2+cNDssQ==
X-CSE-MsgGUID: ASv9OL+yTT69/Ze0MFTOOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:45:12 +0200
X-CSE-ConnectionGUID: GCbS6LwFRLuUBz1O6pZlAA==
X-CSE-MsgGUID: rYxfPX0WRkiJD7y+q4rSng==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 27 Oct 2026 12:52:57 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 27 Oct 2026 12:45:11 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 27 Oct 2026 12:44:36 +0200
Subject: [PATCH 2/2] platform: generic: mips: p8700: Emulate S-mode access
 to CM PMU registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261027-p8700-cm-pmu-v1-2-580515e4bf39@mobileye.com>
References: <20261027-p8700-cm-pmu-v1-0-580515e4bf39@mobileye.com>
In-Reply-To: <20261027-p8700-cm-pmu-v1-0-580515e4bf39@mobileye.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
 Bo Gan <ganboing@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Xiang W <wxjstz@126.com>, Chao-ying Fu <icebergfu@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_034518_802056_8FA966AE 
X-CRM114-Status: GOOD (  27.83  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CM3 performance counter registers (GCR.Debug block at offset 0x900)
are used by the Linux mips_p8700_cm_pmu driver, but they share a PMP
granule with GCR registers that must stay M-mode only, so the whole GCR
block is closed to S-mode. S-mode loads and stores to it therefore trap
to M-mode as access faults.

Implement the emulate_load/emulate_store platform hooks in a new
p8700_access.c. The faulting S-mode virtual address is translated with
sbi_va_to_pa(), checked to be a naturally aligned 32 or 64-bit
access fully inside the PMU register range of one of the CM instances
described by p8700_cm_info, and then performed on behalf of S-mode.
A cheap page-offset check rejects anything outside the PMU window
before the page table walk. All other accesses are refused and
redirected to S-mode as a genuine access fault.

Add the PMU register offsets to p8700.h, mirroring the Linux driver,
and hook the emulators up for eyeq7h.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h |  34 +++++++++
 platform/generic/mips/eyeq7h.c        |   2 +
 platform/generic/mips/objects.mk      |   2 +-
 platform/generic/mips/p8700_access.c  | 126 ++++++++++++++++++++++++++++++++++
 4 files changed, 163 insertions(+), 1 deletion(-)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index e64c62e17037..95144cf81152 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -179,6 +179,22 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define GCR_MMIO_BOTTOM_DIS_RQ_LIM	BIT(1)
 #define GCR_MMIO_BOTTOM_EN		BIT(0)
 
+/*
+ * GCR.Debug performance counter (CM PMU) registers, offsets from GCR base.
+ * Keep in sync with linux/drivers/perf/mips_p8700_cm_pmu.c.
+ */
+#define GCR_PC_CTL			0x0900
+#define GCR_PC_OV			0x0920
+#define GCR_PC_EVENT			0x0930
+#define GCR_PC_CYCL			0x0980
+#define GCR_PC_QUAL0			0x0990
+#define GCR_PC_CNT0			0x0998
+#define GCR_PC_COUNTER_STRIDE		0x10
+#define GCR_PC_MAX_PROG_COUNTERS	2
+/* Range of the PMU block that S-mode is allowed to access via emulation */
+#define GCR_PMU_OFFSET			GCR_PC_CTL
+#define GCR_PMU_SIZE			0x100
+
 /* CPC Block offsets */
 #define CPC_PWRUP_CTL		0x0030
 #define CPC_TIMECTL		0x0058
@@ -224,4 +240,22 @@ int mips_p8700_add_memranges(void);
 struct fdt_match;
 int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match);
 
+/*
+ * S-mode access to CM PMU registers (p8700_access.c). The GCR block is
+ * PMP-protected from S-mode; S-mode accesses trap to M-mode and are
+ * emulated by these platform hooks for the PMU register range only.
+ */
+union sbi_ldst_data;
+struct sbi_trap_context;
+
+/** platform specific handler to fixup load fault
+ *  Refer to comments at sbi_platform_emulate_load */
+int mips_p8700_emulate_load(ulong insn, int rlen, ulong addr, union sbi_ldst_data *out_val,
+			    struct sbi_trap_context *tcntx);
+
+/** platform specific handler to fixup store fault
+ *  Refer to comments at sbi_platform_emulate_store */
+int mips_p8700_emulate_store(ulong insn, int wlen, ulong addr, union sbi_ldst_data in_val,
+			     struct sbi_trap_context *tcntx);
+
 #endif
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index f08b51972236..5cc05542ff7f 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -458,6 +458,8 @@ static int eyeq7h_platform_init(const void *fdt, int nodeoff, const struct fdt_m
 	generic_platform_ops.final_init = eyeq7h_final_init;
 	generic_platform_ops.nascent_init = eyeq7h_nascent_init;
 	generic_platform_ops.pmp_set = mips_p8700_pmp_set;
+	generic_platform_ops.emulate_load = mips_p8700_emulate_load;
+	generic_platform_ops.emulate_store = mips_p8700_emulate_store;
 
 	return 0;
 }
diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
index 14524aadc12f..77278d434720 100644
--- a/platform/generic/mips/objects.mk
+++ b/platform/generic/mips/objects.mk
@@ -5,7 +5,7 @@
 ifeq ($(PLATFORM_RISCV_XLEN), 64)
 carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700_EYEQ7H) += mips_p8700_eyeq7h
 carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700_BOSTON) += mips_p8700_boston
-platform-objs-$(CONFIG_CPU_MIPS_P8700) += mips/p8700.o mips/mips_warm_boot.o
+platform-objs-$(CONFIG_CPU_MIPS_P8700) += mips/p8700.o mips/p8700_access.o mips/mips_warm_boot.o
 platform-objs-$(CONFIG_PLATFORM_MIPS_P8700_EYEQ7H) += mips/eyeq7h.o
 platform-objs-$(CONFIG_PLATFORM_MIPS_P8700_BOSTON) += mips/boston.o
 endif
diff --git a/platform/generic/mips/p8700_access.c b/platform/generic/mips/p8700_access.c
new file mode 100644
index 000000000000..004d21f45552
--- /dev/null
+++ b/platform/generic/mips/p8700_access.c
@@ -0,0 +1,126 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Mobileye
+ *
+ * S-mode access to selected CM (GCR) registers.
+ *
+ * The CM PMU registers share a PMP granule with M-mode only GCR registers,
+ * so the whole GCR block is closed for S-mode by PMP. S-mode loads/stores
+ * to it trap into M-mode as access faults, and sbi_trap_ldst.c forwards
+ * them here. We translate the faulting S-mode virtual address to a
+ * physical address, check that it falls in the PMU register range of one
+ * of the CM instances and, if so, perform the access on behalf of S-mode.
+ * Anything else is rejected and redirected to S-mode as a real fault.
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap_ldst.h>
+#include <sbi/sbi_unpriv.h>
+#include <mips/p8700.h>
+
+/**
+ * Check whether an access of @len bytes at physical address @pa is an
+ * access to the CM PMU registers of one of the CM instances.
+ */
+static bool p8700_smode_reg_allowed(ulong pa, int len)
+{
+	unsigned int i;
+	ulong off;
+
+	if (!p8700_cm_info)
+		return false;
+
+	/* Only naturally aligned 32/64-bit accesses, as the PMU driver does */
+	if ((len != 4 && len != 8) || (pa & (len - 1)))
+		return false;
+
+	for (i = 0; i < p8700_cm_info->num_cm; i++) {
+		if (pa < p8700_cm_info->gcr_base[i])
+			continue;
+		off = pa - p8700_cm_info->gcr_base[i];
+		if (off >= GCR_PMU_OFFSET && off + len <= GCR_PMU_OFFSET + GCR_PMU_SIZE)
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * Fast reject: the page offset is translation invariant, so if it cannot
+ * be a PMU register there is no point in walking the page tables.
+ */
+static bool p8700_page_off_may_be_pmu(ulong va)
+{
+	ulong off = va & ~PAGE_MASK;
+
+	return off >= GCR_PMU_OFFSET && off < GCR_PMU_OFFSET + GCR_PMU_SIZE;
+}
+
+int mips_p8700_emulate_load(ulong insn, int rlen, ulong addr,
+			    union sbi_ldst_data *out_val,
+			    struct sbi_trap_context *tcntx)
+{
+	ulong pa;
+	int rc;
+
+	/* rlen == 0 is a vector/custom instruction; not supported */
+	if (!rlen)
+		return SBI_ENOTSUPP;
+	if (!p8700_page_off_may_be_pmu(addr))
+		return SBI_EDENIED;
+
+	rc = sbi_va_to_pa(&tcntx->regs, addr, &pa);
+	if (rc)
+		return rc;
+	if (!p8700_smode_reg_allowed(pa, rlen))
+		return SBI_EDENIED;
+
+	switch (rlen) {
+	case 4:
+		out_val->data_u32 = readl_relaxed((void *)pa);
+		break;
+	case 8:
+		out_val->data_u64 = readq_relaxed((void *)pa);
+		break;
+	default:
+		return SBI_ENOTSUPP;
+	}
+
+	/* >0: caller writes rd from out_val and advances mepc */
+	return 1;
+}
+
+int mips_p8700_emulate_store(ulong insn, int wlen, ulong addr,
+			     union sbi_ldst_data in_val,
+			     struct sbi_trap_context *tcntx)
+{
+	ulong pa;
+	int rc;
+
+	if (!wlen)
+		return SBI_ENOTSUPP;
+	if (!p8700_page_off_may_be_pmu(addr))
+		return SBI_EDENIED;
+
+	rc = sbi_va_to_pa(&tcntx->regs, addr, &pa);
+	if (rc)
+		return rc;
+	if (!p8700_smode_reg_allowed(pa, wlen))
+		return SBI_EDENIED;
+
+	switch (wlen) {
+	case 4:
+		writel_relaxed(in_val.data_u32, (void *)pa);
+		break;
+	case 8:
+		writeq_relaxed(in_val.data_u64, (void *)pa);
+		break;
+	default:
+		return SBI_ENOTSUPP;
+	}
+
+	/* >0: caller advances mepc */
+	return 1;
+}

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
