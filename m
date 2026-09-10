Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3668C88E40
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4g35eEwIDAc+f1qXDSPRD0x3xqEYSeOF7Tm8uC3OnUc=; b=OkIe07jr9unJuo
	viZauwO/HJMEkpZE2LifWTL5fGwRDi2vey9jZkZUEPFLxMgxbQ4dsugjZLMxPh9cCDFfQPyWRrR2R
	aC3qEajYETikLrtwkvkYdPMKUHR2d31SQjI/zEFRXKL69Y2NLApoq1g9fHJ7iJQTS5BL5oRP1u8lD
	IEOzealClc5ktqIr6LuylE+Ci5NmWB5YpFj6zurRbPCyIGPpd6ZO9hCBNbHpe+ghaIG3oZIrGq7L7
	qJL5PvNFDwKahH9v6ciLoMa93XifQqsHZI38x4Z4JBKrJDbA4Ni7V5SIC2zZ6z9DzKIk9lToYeWJy
	8Ni3m5wKcinNpoPNz6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fLx-0000000EXyn-2bTb;
	Thu, 10 Sep 2026 14:02:13 +0000
Received: from bg5.exmail.qq.com ([43.154.209.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fLu-0000000EXxf-3wf5
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789048890;
	bh=Gj2L7cTDOUQh/Vg/8t28p1oJt8cSVWURtDkjeDpzFW8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=DxIFsfihCJOhdf7OeXWI4LJHbYR4yuqsWHLSQXIeJjGiPeZ5LhnewDl34cLGWTQz/
	 PsfUA9qX63CkKKKY7SEE7B7XX54mUDlGu045lOQHIxEqfpxJMqhm5/C/BTZD0hqwtO
	 kLA+iwwYah0Auyuaoy3l8eE8xwZBIdKpvLumNSYE=
X-QQ-mid: esmtpgz12t1789048888t19b09932
X-QQ-Originating-IP: 0iVkkxdeFOoEI2VGjf81ggv3Dt/8jf7ZVPTERccZ3bs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 22:01:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15427855349410153229
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 10 Sep 2026 22:00:02 +0800
Subject: [PATCH v4 1/6] lib: sbi: select expected trap handler per hart
MIME-Version: 1.0
Message-Id: <20260910-spacemit-k3-v4-1-0793b62329f6@linux.spacemit.com>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
In-Reply-To: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Alvin Chang <alvinga@andestech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10042;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Z71YD0odaDXDesOGfupQL31kuVGpJK37jrCccoFK/To=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmLdmi+SNVdoaPfVellXvpw3Ybr+V8tn2YrszS5vmVV3
 6itfY+to5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCKPwxgZpv36OHtS1Erdix9s
 DELZ317MX+a82/LGwrWt/Ka1u3/caWBkOLvZPiIr34rNaUFp6KafAlL3OnqDDHWLH4hVymw7sXI
 LGwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M9rkkqim1ZkGcSOvVfprDVjgsaW42pv9DgycoN4ou/5uYpwoHPqfAvFw
	cCc4z2G9ozH9kCkseWViT6CHhQ6qPZF/NKQ0PoDP/a4l7/QOlr8YfQaQxlC/66Ne792tveQ
	gdSVHatxmecTIZzYl5uBdahULl+odYFeStjMXO1Iual+UVgH7Hk3RR3fV8ei4EV+y/Jj5zg
	UMm8zjOAYIU3Nnq9I9CZ+OibCffU4lytdnkJBAsDOvz7Wm9R6PB04rzWOlQQRESIFB5hrqg
	5CBdooeLs1+px1Let57LisoNhjsNzAlxw1J/FfCQdiGgcqGIJ0c78szTmfwvOZ/J2l0LaLI
	yUITLuzicdyf4dlKWnjTes23WewcB+DxRhCgX+ogxCxqUNmwGpxfPGeA50VDs1uS3nyx3Ru
	9rwrzWO0uX73KwcXyWm2SJasSuUJiUJKNHsNi5zY6vO/X5R4y1V616I2dm9C9mM1Y2ROwTI
	dlN9VJ/+0v4WEEhpGcRpz/oTPfuN4zfbFFtGRg6JcTlnSEJnf7wKG2/PCDw1wP9/0lTANrJ
	ZvweeZV++DHs/XzhDsJx8+KUoll439VbivDNf36scJ+O5SyB9mDFyYhhbALtF0qIuX5BJSo
	lC68KwRt1+9toxP0Lni0+tHDWAseyPKI3Nel+TwaHjPI60cKVumB+Mv7/DUaHhK0f1IPYWK
	+cX2pBlIQuuKnmRG2BH2q+fbfjxs70jJ4lenh3WfSjaF5xTt6c1eDZtWU0+fDOQ5iGpG229
	rFoamMX/CSL3MIudvMn3HRLDYXDPux+TxRTZKVE3Xu1bBUDKdNBKMMfs6d4VgAwepj+j46T
	aaJ32enikgaz4oBuwRhQtZaHR/LYe6J+qPTP+1dkXZssfEIKm4PCh/28vdOzAP9qz7AyE4+
	sHUfdFGGG6JnfbkJj3sau6JgRjToo14DGfqVKNbL4YNfI1/sovrE7fWmi9fKyRKyFUXLAui
	9NJdiJ/a/VGevNZsr4Ym38In4JJvRAAmVBM4FGRicmig2Tg1R1YDO2zN79RybMDUlcVuidA
	cf6SoOxDEtrP3MyKSIFqoXSV+O1wJD8BVPtn+pXHePsd3SajnDt2UNBTxBd21qdQufymqxH
	QwlDqFSkWT/FOPR1vgZ7yjvmjioyY8pAl4hpWu52ltZKDlezhuQlWLa7HKozjjKDOsjLh7i
	fuSKN6N80N1otWZ+n6x4/N+kw2r+6dwwrEc/z40nJLgq1ezGvPJ6fmVEPaD8aHX54j7b
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_070211_361329_3EBB1ABB 
X-CRM114-Status: GOOD (  16.57  )
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

The expected trap handler is selected once by the cold boot hart. This
breaks heterogeneous systems where the cold boot hart implements H but
another hart does not, because the H-aware handler accesses mtval2 and
mtinst.

Select the handler from each hart's MISA at entry to sbi_init(), before
platform hooks can probe CSRs, and store its address in that hart's
scratch space. Load the address directly at each use. This avoids an
accessor call and its stack-protector instrumentation in the CSR probing
and unprivileged memory access paths.

Align scratch allocations after the enlarged fixed scratch area so that
the new field preserves the allocator's cache-line alignment guarantee.

Fixes: 1de66d170e71 ("lib: Optimize unpriv load/store implementation")
Reported-by: Bo Gan <ganboing@gmail.com>
Link: https://lore.kernel.org/r/e702f291-dde8-4b99-a65e-182d2b847720@gmail.com
Suggested-by: Bo Gan <ganboing@gmail.com>
Link: https://lore.kernel.org/r/20260831022156.2060561-1-alvinga@andestech.com
Cc: Alvin Chang <alvinga@andestech.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/sbi/sbi_csr_detect.h | 4 ++--
 include/sbi/sbi_hart.h       | 5 ++++-
 include/sbi/sbi_scratch.h    | 7 ++++++-
 lib/sbi/sbi_hart.c           | 8 --------
 lib/sbi/sbi_illegal_atomic.c | 4 ++--
 lib/sbi/sbi_init.c           | 7 +++++++
 lib/sbi/sbi_scratch.c        | 4 ++++
 lib/sbi/sbi_unpriv.c         | 6 +++---
 8 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/include/sbi/sbi_csr_detect.h b/include/sbi/sbi_csr_detect.h
index 097c31c8..31e50db9 100644
--- a/include/sbi/sbi_csr_detect.h
+++ b/include/sbi/sbi_csr_detect.h
@@ -16,9 +16,9 @@
 
 #define csr_read_allowed(csr_num, trap)					\
 	({								\
+	register ulong mtvec = sbi_hart_expected_trap_addr();		\
 	register ulong tinfo asm("a3") = (ulong)trap;			\
 	register ulong ttmp asm("a4");					\
-	register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
 	register ulong ret = 0;						\
 	((struct sbi_trap_info *)(trap))->cause = 0;			\
 	asm volatile(							\
@@ -35,9 +35,9 @@
 
 #define csr_write_allowed(csr_num, trap, value)				\
 	({								\
+	register ulong mtvec = sbi_hart_expected_trap_addr();		\
 	register ulong tinfo asm("a3") = (ulong)trap;			\
 	register ulong ttmp asm("a4");					\
-	register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
 	((struct sbi_trap_info *)(trap))->cause = 0;			\
 	asm volatile(							\
 		"add %[ttmp], %[tinfo], zero\n"				\
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..f0a4be61 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_scratch.h>
 
 /** Possible privileged specification versions of a hart */
 enum sbi_hart_priv_versions {
@@ -135,7 +136,9 @@ struct sbi_scratch;
 int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
 
-extern void (*sbi_hart_expected_trap)(void);
+/* Keep the load free of function calls, including stack-protector code. */
+#define sbi_hart_expected_trap_addr() \
+	(sbi_scratch_thishart_ptr()->expected_trap)
 
 unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
 void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 06097c8a..20e7dcd0 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -46,8 +46,10 @@
 #define SBI_SCRATCH_OPTIONS_OFFSET		(14 * __SIZEOF_POINTER__)
 /** Offset of hartindex member in sbi_scratch */
 #define SBI_SCRATCH_HARTINDEX_OFFSET		(15 * __SIZEOF_POINTER__)
+/** Offset of expected_trap member in sbi_scratch */
+#define SBI_SCRATCH_EXPECTED_TRAP_OFFSET		(16 * __SIZEOF_POINTER__)
 /** Offset of extra space in sbi_scratch */
-#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(16 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(17 * __SIZEOF_POINTER__)
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
 
@@ -91,6 +93,8 @@ struct sbi_scratch {
 	unsigned long options;
 	/** Index of the hart */
 	unsigned long hartindex;
+	/** Address of the expected trap handler for this HART */
+	unsigned long expected_trap;
 };
 
 /**
@@ -113,6 +117,7 @@ assert_member_offset(struct sbi_scratch, tmp0, SBI_SCRATCH_TMP0_OFFSET);
 assert_member_offset(struct sbi_scratch, tmp1, SBI_SCRATCH_TMP1_OFFSET);
 assert_member_offset(struct sbi_scratch, options, SBI_SCRATCH_OPTIONS_OFFSET);
 assert_member_offset(struct sbi_scratch, hartindex, SBI_SCRATCH_HARTINDEX_OFFSET);
+assert_member_offset(struct sbi_scratch, expected_trap, SBI_SCRATCH_EXPECTED_TRAP_OFFSET);
 
 /** Possible options for OpenSBI library */
 enum sbi_scratch_options {
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..61c5f945 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -22,11 +22,6 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
 
-extern void __sbi_expected_trap(void);
-extern void __sbi_expected_trap_hext(void);
-
-void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
-
 unsigned long hart_features_offset;
 
 static void mstatus_init(struct sbi_scratch *scratch)
@@ -712,9 +707,6 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 	csr_write(CSR_MIP, 0);
 
 	if (cold_boot) {
-		if (misa_extension('H'))
-			sbi_hart_expected_trap = &__sbi_expected_trap_hext;
-
 		hart_features_offset = sbi_scratch_alloc_offset(
 					sizeof(struct sbi_hart_features));
 		if (!hart_features_offset)
diff --git a/lib/sbi/sbi_illegal_atomic.c b/lib/sbi/sbi_illegal_atomic.c
index 977a9ad0..30f5118e 100644
--- a/lib/sbi/sbi_illegal_atomic.c
+++ b/lib/sbi/sbi_illegal_atomic.c
@@ -30,7 +30,7 @@ int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
 	{									\
 		register ulong tinfo asm("a3");					\
 		register ulong mstatus = 0;					\
-		register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
+		register ulong mtvec = sbi_hart_expected_trap_addr();		\
 		type ret = 0;							\
 		trap->cause = 0;						\
 		asm volatile(							\
@@ -57,7 +57,7 @@ int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
 	{									\
 		register ulong tinfo asm("a3");					\
 		register ulong mstatus = 0;					\
-		register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
+		register ulong mtvec = sbi_hart_expected_trap_addr();		\
 		type ret = 0;							\
 		trap->cause = 0;						\
 		asm volatile(							\
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 9bb1a37e..76b4fd91 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -36,6 +36,9 @@
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
 
+extern void __sbi_expected_trap(void);
+extern void __sbi_expected_trap_hext(void);
+
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
 	"  / __ \\                  / ____|  _ \\_   _|\n"  \
@@ -585,6 +588,10 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 	u32 hartid			= current_hartid();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
+	/* Platform hooks may probe CSRs before sbi_hart_init(). */
+	scratch->expected_trap = misa_extension('H') ?
+		(ulong)&__sbi_expected_trap_hext : (ulong)&__sbi_expected_trap;
+
 	switch (scratch->next_mode) {
 	case PRV_M:
 		next_mode_supported = true;
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index bb14a1a2..88ef1547 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -97,6 +97,10 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
 
 	spin_lock(&extra_lock);
 
+	/* The fixed scratch fields need not end on a cache-line boundary. */
+	extra_offset = (extra_offset + scratch_alloc_align - 1) &
+		       ~(scratch_alloc_align - 1);
+
 	if (SBI_SCRATCH_SIZE < (extra_offset + size))
 		goto done;
 
diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
index 60becedc..1550d111 100644
--- a/lib/sbi/sbi_unpriv.c
+++ b/lib/sbi/sbi_unpriv.c
@@ -33,9 +33,9 @@ union sbi_unpriv_data {
 	type sbi_load_##type(const type *addr,                                \
 			     struct sbi_trap_info *trap)                      \
 	{                                                                     \
+		register ulong mtvec = sbi_hart_expected_trap_addr();         \
 		register ulong tinfo asm("a3") = (ulong)trap;                 \
 		register ulong mstatus = 0;                                   \
-		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
 		type ret = 0;                                                 \
 		trap->cause = 0;                                              \
 		asm volatile(                                                 \
@@ -58,9 +58,9 @@ union sbi_unpriv_data {
 	void sbi_store_##type(type *addr, type val,                           \
 			      struct sbi_trap_info *trap)                     \
 	{                                                                     \
+		register ulong mtvec = sbi_hart_expected_trap_addr();         \
 		register ulong tinfo asm("a3") = (ulong)trap;                 \
 		register ulong mstatus = 0;                                   \
-		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
 		trap->cause = 0;                                              \
 		asm volatile(                                                 \
 			"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"      \
@@ -207,7 +207,7 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
 	register ulong tinfo asm("a3");
 	register ulong ttmp asm("a4");
 	register ulong mstatus = 0;
-	register ulong mtvec = (ulong)sbi_hart_expected_trap;
+	register ulong mtvec = sbi_hart_expected_trap_addr();
 	ulong insn = 0;
 
 	trap->cause = 0;

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
