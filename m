Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16C1C61DB9
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EiqQ3EUMUP4sw2uiJkdUojZ84L3JW9TEerZ1d9WlIo=; b=La7LWweGk3uRTB
	x+eQdhjILBQVAhhgqtug7/IKOWm0Gx5OEoXllTSx65dHlkTLn1qpxlNSooX/LIne3IZiYl16ud2z6
	FQrh8lMi0AfTHtx4iDgTz8mQfKx6cZobQnfRe06rMJQoFmbi2emby3A209lAbrmwCm7ERT21fmu4Y
	W63stc0C+Im4n50M4H5+AdC8lz4a50hOwIxb+CXvcG6iC7J+RDEnAYN1VjwdRK2D+qgYOvEcpqSG/
	vyE9hK/pz7NiT1xToXagKMTk7j7+PRckcrp/WDw4UlUx1h69zUeqsq9EIFzD8QpBIuy6ltLYo4xa4
	cXqu8DmH8blNwhYw+H5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHd-00000003jBq-1sAs;
	Thu, 27 Aug 2026 09:20:29 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHW-00000003j7u-2IrI
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 09:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787822391;
	bh=wVw90sfs9PlVdeDg/k4db72/SMB8hfEVBNgToxEdYis=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=jFGcmE9/eDsVD7HRsYDkkypdqDKdk99mwgK3nq0P6/F6UllUO6pG3YuMnwsNpDKVT
	 qb8gjo8x0h2yic8AVG2XM27uGQMQqVnyaIfLAwzHLZL1ZCgAGq228Xef6WLAY2Qz2W
	 x9XnGItrXfA7Qx//+eGFnecmwMq8oa2ewWRwyabU=
X-QQ-mid: zesmtpgz8t1787822385t314a74ac
X-QQ-Originating-IP: ywGuR3+rC0yRCgApzuyjOSZxn73YZWSB1nRSSGBU1z8=
Received: from = ( [183.48.244.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 17:19:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8241214424296675875
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 27 Aug 2026 17:19:19 +0800
Subject: [PATCH v3 1/5] lib: sbi: select expected trap handler per hart
MIME-Version: 1.0
Message-Id: <20260827-spacemit-k3-v3-1-5d8dbb68539d@linux.spacemit.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
In-Reply-To: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6243;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Zn1ERjI4DSngVkikJVfH+uyhx4a8vAjUwA34Rcn//NU=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkTGBXu71IqjD8c8cPE5NQJnxPmzp8vqix5K+xrtsypQ
 6/GQry5o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCJsBxkZzltIqB+rVpmXN+uV
 5If5h0+XBKTmtZXGMsrtii62XGGXy/A/1Uy/a/E8rt9af+fzu8783yH6OETW+2WlSMhXHvdv7PM
 ZAQ==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NQT7GHsdltgIT2uHjVSl3MCpL/triiMRlqBd0sCPoHz/CTy86ogOw2yT
	AtHrtfJJXkz4dGMB4C1jFn3S36dSY8FDz8Fio7k1ZYk1wljChYG4GUiGPl7+XtQxKMB/9hz
	KcZwxW63lXDa8py+N4iV8v8ogNxOIQlqb9/+BUNQnrtIjahfQ3D/yvQ1sQ879C+MQF1vfjn
	6JeYfepO5b/iY3eHcWKxPwjqkeva18S0LzfiWrxdC+6xAg4RVXjOErl3rVCTfYejuefuTOO
	W2rWKCB/4yMrhepuic/0DEaLG7cECz0RK6doyQwO/s+vw/DxkARrtzvdvlmQT7pC/PzgkSy
	CCSReV/WspRTPXyvUrquoHT9FlAg+Sp44MwJr9gtDIHVdovR8bBJIOTS9DOSYxc0w6DfeyM
	9vHya7CTSlZ4c+8+EMU+gSXB211PWJbVevFyew1nhMlJoa+fFj0jmywydC5kRBMOXy1J+us
	nS1OTEgRvszibkNmAUaxHRhpSd5OA1DeJi0PbZgnpuyEjydIsC0lVFaMP2ArPZEYlgRc7Uk
	a7Xx2ISWMqPMwn2+ir/GP+XrzHiZyVWMRXC5stUqbPW6fvKTIbmt0QDRuzDNR0BYy0BQLkZ
	p4J8vtudWRy4wCpkH5JyH77Hk9TPBn8LmDtsyzJaClgofftNmzTBIhMRiBwwjX4DCNIZPbW
	6L4SXlNwh+GefK3tqFKODDUf8fHyTuT1pJ3HCND0h8xQ17OxEuLkYcpHW4NlA5UFbMgYhxq
	flmGhcdcYfL+9dZgoJ/s371PLgOSMg+YwfR5g8xX7Ks0Rqm6GfdTB3U6S7c8bJ+1RPk3TOM
	xFEJ7p17MlnoFvR364CGWYMkELvbJO26BEL715oxFPHL/oikDznCx9LVLl/ync3IcOiwCjI
	82/59mQB67axh2yp1dcxp/EOA/PLL68qWPOfpP5x6KhGJ/k5B3h7lGzaLThz0ZmoWafIOJM
	2B02cYDiHeFQq16bu915NbiklafPouFTCeelpqEsKu9htzq0pqmu9YwEgQWCHfErUpDy1Q9
	wuF89XsggnoUGcaORdwS7mWV/Jsf0TMA4KnnAmD9delie3wNeO8jnOqe7m8DcK+ZOsL5slQ
	Mif6SU8vdR5lYxnfKfNXmshS3Ilb7byEP7oMRNepQR9
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_022023_319592_D6BD8A5F 
X-CRM114-Status: GOOD (  11.42  )
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

Select the handler from the current hart's MISA at each use so every
hart uses only the CSRs it implements.

Fixes: 1de66d170e71 ("lib: Optimize unpriv load/store implementation")
Reported-by: Bo Gan <ganboing@gmail.com>
Link: https://lore.kernel.org/r/e702f291-dde8-4b99-a65e-182d2b847720@gmail.com
Suggested-by: Bo Gan <ganboing@gmail.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_csr_detect.h | 4 ++--
 include/sbi/sbi_hart.h       | 2 +-
 lib/sbi/sbi_hart.c           | 9 +++++----
 lib/sbi/sbi_illegal_atomic.c | 4 ++--
 lib/sbi/sbi_unpriv.c         | 6 +++---
 5 files changed, 13 insertions(+), 12 deletions(-)

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
index 543393bb..6f4ee31e 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -135,7 +135,7 @@ struct sbi_scratch;
 int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
 
-extern void (*sbi_hart_expected_trap)(void);
+ulong sbi_hart_expected_trap_addr(void);
 
 unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
 void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..14e44955 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -25,7 +25,11 @@
 extern void __sbi_expected_trap(void);
 extern void __sbi_expected_trap_hext(void);
 
-void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
+ulong sbi_hart_expected_trap_addr(void)
+{
+	return misa_extension('H') ? (ulong)&__sbi_expected_trap_hext :
+				     (ulong)&__sbi_expected_trap;
+}
 
 unsigned long hart_features_offset;
 
@@ -712,9 +716,6 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
