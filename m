Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49E606A31C
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sqP72GV7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=l2A17vAP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s4bQnxWZ+BEJ1bUwr7FKlzom2T3XhCq37wIkrilRlMk=; b=sqP72GV7RRG/zA+FQmfzihnFXC
	9FoNlmv3UfZwAMWH2xcdfeBK5Q0Ce94/mUuAKv9FtL4r/S/7FLnNui6ForKF6+nNnzNi7pRzlHz9f
	GM2j5AHGnecoyZ5rFvyEhfTDXZAFy2MxqGul/OyXd1nBmr0U9l3kqJcVMKPT9F3SfmzjcY9bvHqzp
	UPaDx0svmgXvb7iularp4Z1XCILvMJeyf3wS7O9bbQXKRoLkDTh9NysQayMR7FzlCi7+XT7dv+AbO
	4rasKUKzZu84YmfBBIMgxkczzEfRPzLPwW5mZt+eeiVFLLDAh3J1Zd50GU9YOlBUpMGEh7GZFM7hw
	ZVtGz5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Dl-00000006zeQ-1O9E;
	Wed, 28 Oct 2026 12:57:37 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Df-00000006zcC-3rwI
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 12:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793192191;
	bh=XhprDyrsDBSP2EFEvvWPrdtuT+0Si9H3ZOfjs+zk+ak=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=l2A17vAPsxqOkFoVJjUhwsWtrYi17W1svfJiVr/JMV7gGCEVo8rVkrcBhJ8ffF+n7
	 PZXeL0/5qWjb6JMDSjAIKY+s7W40y/yZusKpcaA9RHj2jj/qFKjMxwU8E5LvSVmgg/
	 if9E8xNjQAKTWfLq0MRyMcEf8sM8bCbNdiCLtWJE=
X-QQ-mid: zesmtpgz6t1793192190t801fe0bf
X-QQ-Originating-IP: dNdkx0ymFqVZO4fjjjU88Lq8IXR4neqsE/0dnFkeKoY=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Oct 2026 20:56:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12734307496663784987
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 28 Oct 2026 20:56:04 +0800
Subject: [PATCH v6 1/6] lib: sbi: select expected trap handler per hart
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261028-spacemit-k3-v6-1-01d984f60941@linux.spacemit.com>
References: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
In-Reply-To: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Alvin Chang <alvinga@andestech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8774;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=gcrezX0MylOh+7GRc5XQpSrg2oRqPzBG/9qBJNhVJfs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkPP7wTm/C9a+Kkmm2GKVZ2h3ab5befWnbfRum23c9VD
 DuNgtZc6ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZiI7x6Gv9J/N/5m7lM5J9m8
 dO2ToAoxhgChO1ZnZc6Xufbkb2C594HhfwyfSbvcrA17LJQj2TodO/t2JzSKObBP8G+9d+qAeAc
 3BwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MBRMLNfpTR4XBkC0abMFkXfo7+mcmOYVJcJA7ms+pJD3vQ1KZRmvlyRV
	zsYKcSRQZH7zBeLACOncSUxVi9ec1ztjlpUh5Jq1NmMRqJSoF3AvnArrhgem184xG2pd5Y5
	glZ4QS0309LPbtZPdOibxQvapEJdsxMmzqYCJtZXlSeWYe3Dj90wGXhlK1T6ZUJCUi1Lh1s
	3UU7kgof24/7wH4ukB33DcoDngJRqid4eU0P43BBs8UNA/7i3nf5KWcW84bUBOpqoSsADKE
	illt+8/v4EuxDfe5DQH/6bD/AsucdVpwdZcicDBoDeBMsz2IiYnZ8dRoSpWxVmY7dcS7Ka/
	nWG+6VSSXSLqlLvR3J9/rQSl5WaDqkIUgluErNbPRRU1PJqYhLtxR/4yXctfWFT8pcrJ1pI
	dVFVnVnqysOSNWc9kQEnxalnJHwublkk3KQ1usUGlHQ2beyzTo2EuLawWeTHMWForAUgnGI
	pWnjH4WIw5SzaMB99SH/5DvBYajevdoGkep6D0JDlcjH0Flo5L+WT8yFDNE3d2h9N3/uG8Q
	lKqUKbr7YXqVwqbga0ACRY5gdVQPn5ckdHRzC/aMJRCtcvt7jjTzUGOuCRa5F225bOhsOml
	O59dyQfWqfLE+oBsjC4JzA9jkjD4s9DQWEEQY9wdEJnM+23ohqC2oFXPGS/6NGuBqgdXuHO
	3hLC9nP69fzQqloxIzdt+9cm03IKQwYSybjejigjPTwaKJyaSOYWNeZ2ReRKrHp/eltvtZf
	qNiK0Mqh3hW4kYU0hwRzbWwGn1dTbTwDa/QRCJB4XDrWpn5St/E3Cwk/IyDL65ekH4NKMoD
	zNOuLlYcrMc3bJrvaTnkyPUI++3fLvhAVJSpaEWkPUHnEH5/4GD+1wkhXQRPBixqUVH5jD3
	oAS2SGaH7YGlV3jY2T56vU/ctrJUzQzmeM7awVffzWxZCYdNT0MbX0NJ9OtQbt3+YHcvk+d
	rAjU954Fkg7jJW91A/zAKmALI9gXoTD+pQAfGs04e79WhIQtjSTNyNhvo6dAXD+pf0oxjYV
	QbN5TJ591uItRTLo50TDwBK1AmHWIAkqHidmKp0Smv0mn8OBkhbyA+0o5e3SwvbO6IUWxu+
	mqPbOlrmBHvwdhs7zW79qpUnSoh5dF1ISeCqWflGSRcnW9B9GwygxEbCVa1SXcDQoGip3FT
	/h8szUHDa3vjimI=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_055732_686771_A4E9192E 
X-CRM114-Status: GOOD (  16.57  )
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

The expected trap handler is selected once by the cold boot hart. This
breaks heterogeneous systems where the cold boot hart implements H but
another hart does not, because the H-aware handler accesses mtval2 and
mtinst.

Store the handler in each hart's feature data and select it from that
hart's MISA before feature detection. Load the address without function
calls, avoiding stack-protector instrumentation in the CSR probing and
unprivileged memory access paths.

Early M-mode CSR probes, such as those in the IMSIC nascent hook, can run
before hart feature data is ready. Use the non-H handler until the current
hart's handler has been initialized, and publish the feature-data offset
only after every hart's storage has been cleared. This leaves the fixed
scratch layout and allocator unchanged.

Fixes: 1de66d170e71 ("lib: Optimize unpriv load/store implementation")
Reported-by: Bo Gan <ganboing@gmail.com>
Link: https://lore.kernel.org/r/e702f291-dde8-4b99-a65e-182d2b847720@gmail.com
Suggested-by: Bo Gan <ganboing@gmail.com>
Cc: Alvin Chang <alvinga@andestech.com>
Link: https://lore.kernel.org/r/20260831022156.2060561-1-alvinga@andestech.com
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/sbi/sbi_csr_detect.h |  4 ++--
 include/sbi/sbi_hart.h       | 22 +++++++++++++++++++++-
 lib/sbi/sbi_hart.c           | 17 ++++++++---------
 lib/sbi/sbi_illegal_atomic.c |  4 ++--
 lib/sbi/sbi_unpriv.c         |  6 +++---
 5 files changed, 36 insertions(+), 17 deletions(-)

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
index 543393bb..e504696d 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -10,8 +10,10 @@
 #ifndef __SBI_HART_H__
 #define __SBI_HART_H__
 
+#include <sbi/riscv_barrier.h>
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_scratch.h>
 
 /** Possible privileged specification versions of a hart */
 enum sbi_hart_priv_versions {
@@ -125,6 +127,7 @@ struct sbi_hart_features {
 	unsigned int pmp_log2gran;
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
+	unsigned long expected_trap;
 };
 
 extern unsigned long hart_features_offset;
@@ -135,7 +138,24 @@ struct sbi_scratch;
 int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
 
-extern void (*sbi_hart_expected_trap)(void);
+extern void __sbi_expected_trap(void);
+
+/*
+ * Keep the load free of function calls, including stack-protector code.
+ * Early CSR probes can use the non-H handler before hart features are ready.
+ */
+#define sbi_hart_expected_trap_addr()					\
+({									\
+	unsigned long __offset = __smp_load_acquire(&hart_features_offset); \
+	unsigned long __addr = (unsigned long)&__sbi_expected_trap;		\
+	if (__offset) {							\
+		struct sbi_hart_features *__features =			\
+			sbi_scratch_thishart_offset_ptr(__offset);	\
+		if (__features->expected_trap)				\
+			__addr = __features->expected_trap;		\
+	}								\
+	__addr;								\
+})
 
 unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
 void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..81350c64 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -22,11 +22,8 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
 
-extern void __sbi_expected_trap(void);
 extern void __sbi_expected_trap_hext(void);
 
-void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
-
 unsigned long hart_features_offset;
 
 static void mstatus_init(struct sbi_scratch *scratch)
@@ -474,6 +471,9 @@ static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 	unsigned long val, oldval;
 	int rc;
 
+	hfeatures->expected_trap = misa_extension('H') ?
+		(ulong)&__sbi_expected_trap_hext : (ulong)&__sbi_expected_trap;
+
 	/* If hart features already detected then do nothing */
 	if (hfeatures->detected)
 		return 0;
@@ -703,6 +703,7 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 {
+	unsigned long offset;
 	int rc;
 
 	/*
@@ -712,13 +713,11 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 	csr_write(CSR_MIP, 0);
 
 	if (cold_boot) {
-		if (misa_extension('H'))
-			sbi_hart_expected_trap = &__sbi_expected_trap_hext;
-
-		hart_features_offset = sbi_scratch_alloc_offset(
-					sizeof(struct sbi_hart_features));
-		if (!hart_features_offset)
+		offset = sbi_scratch_alloc_offset(sizeof(struct sbi_hart_features));
+		if (!offset)
 			return SBI_ENOMEM;
+		/* Publish only after every hart's feature storage is zeroed. */
+		__smp_store_release(&hart_features_offset, offset);
 	}
 
 	rc = hart_detect_features(scratch, cold_boot);
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
