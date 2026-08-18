Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1BCC5DF7D
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 01:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WY6J7PC2sDmQ4ElWwGPvxZGZTbuUKab/U9hPK0zfOvo=; b=AiqNLJmRPb/OH+
	wiit3m5UcDG2eEOtYo3RQ9ydSePoyj5mprVfRXekra7vkzq3FhOvsgMnWQqb9eByEs8szEhvR8/iy
	bVv5q3z2Syx7hr2bP8l4DaJeiAxCtO3YnEBS7f5oWrGuvPeQJP+tauLjNjRc6MUoLladjCdEHWEkg
	aOYukXsUI0yctcWajlSDFjKmOJ+siRdSPKBGHVtCSUZHdOAlfxmWvjuu3bu8u0cTDdv9gj75c9q+s
	RvVQ7d8vxqELFJ8hTiwnljKYlLFK6jighdSzJidw0dKb9DTLQ5heIhR/ipWkIpkqe0oG9I05CDv8m
	kF9EeAzCIaC0CEv4AiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pp-000000072iR-1Ikh;
	Tue, 18 Aug 2026 01:14:57 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pm-000000072fu-0BEv
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 01:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787015664;
	bh=fo3+kzCugFfEsGwqzurBXWNkFw2Tg6kvkCRlV+732do=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Ih9UqRmN9xgELYmeKG5n49o4w48WvtmVT2dG3IG8ZK5hSpX+yYcXd7Fm5SeWF6YoQ
	 lB0DqB37Rg9zFpMYVOHg23Z5nfymDRlE7vRSaLwkei3uFteIQZZirX65iAqio0psTe
	 DLni1KJLn7bSfBP1N5YVW+ZS1nNb+9wOD4TVf8nA=
X-QQ-mid: esmtpsz18t1787015662t6c7f75b3
X-QQ-Originating-IP: 2jTgF44K4Ye0sPvze2JHpdI0jas8mTU/ZVwNNU637Vw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Aug 2026 09:14:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16115757804145439577
EX-QQ-RecipientCnt: 5
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Aug 2026 09:14:04 +0800
Subject: [PATCH v2 1/5] lib: sbi: select expected trap handler per hart
MIME-Version: 1.0
Message-Id: <20260818-spacemit-k3-v2-1-84cb7773a481@linux.spacemit.com>
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
In-Reply-To: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6201;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=IvLQfC6mBK2SkPwKHRufy6F3zkHdSDLQ+TnI8pndQNU=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnNGx++kuzQf86xlH/t/7UnSnvYt58yEpu7oXpD9oy4e
 9m93OsdO0pZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaiZcLI0How6sfX4JrjIkd7
 VXtXRx3zi2tJ2XvrorSl64e0S/nm9xkZXl4tP7Bt6smi0vpnfMFRb16/dsgyj8/+1H7hxFdrxpS
 37AA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Me+/nm5Yq7QkPR/IwLUbiKtFWgI0bp35Fr8N40wNRtbhgu2lVymOqHNc
	ID6LAkISLM/PIp1wam83IkcymLMsRwqB88rmGABnplsRFbLmq0+po86WLv5ezPliM/hx2JA
	yryuo6Pms0oX3q/yIbHxA3jr73yyCDgh9d49uUvjy7YmvVtuyC8/JiX0FXqeRFQwWaS+Mny
	Ck62f9MbXWozTEuLqFm0i8qzflFAX1k/gTVUZOk05nFPFm/WKJM013utmgfP6lVjjLVSeIv
	1rbl/nUWsgTxQ4Z31WWhx//uGerWdAWpPatkHNHLsBhAaUC6d9ujoTxSCLqHfTBSwKzWnTY
	L6pqAQjf2/pqg2Hvcuqw4krmb3dJYiRew8NFXDdrHoW/6zj6Xzskjj5BJY2Xc71hG9uawJu
	AW9OYpie27atk66udt/f+31vRRtfHDi2orXV1JEJO+yWX9UHkmoYVFIlTEMF68N6SzFXLyu
	RkxJ4Rm8zDZ68nHLXD24XzAQOWWR8uzKhYWFjcSjASOE+HIZhf88UcbY20o5tMTOjG6qaZJ
	YL12rKc8LN964zSOLJSSUqxgJeoYdhnT3zROhlNTjubFRy3SmV65n54eBBzeC+SnMVEWZq+
	4erf9B76fA/LMXb/IECaOoUVxnSBuJebwG0hQ3/9zYOmv3RKUZNGnGPJwt1wvvhulHi4DqI
	0cKwdc6CsytAE+dft+ndzuaoS4cLPHmPF0YSqT5EBw/CoSeFUegJwlohPPcDzTQJ9CfmmLT
	d5frr48RhfAGGfiZhHz1wMOs2Q5dnI97NtvQi6bC+z9sL0uLvqx6EgDsngFozZj9ZJ8+gXi
	ysLLNeO8Rx6Z1rkHJUSJtvsk16dNwOWOysL4W5bgxrIMwCr8qdJ/J1BmaZwIP7zsh7Y/nR4
	ci4u2yA8QZ54CMZh9V1zjrwGGE9AtO4pYf5WSUSL5Hmqrqfev+HLuEM+GkaM1Qh9MCV43xE
	/p7VDkxPc2d1eI71SP2NOsKkooouIp5BttbOOXFPm+7I2xzK4Ewm4U/TjJqnpVh2xObWwjB
	ggPpBXhptnqUjqTh7+N0YZUDzsAQ+IlMAF8JuCFuteb2xvySTYa75ysAzaLV2MJTCJ+xH+R
	UB4Rwth4dIW7dm8BXFsDi3X25q8fW4eEVniSIkF3b45wCM2dAv/jdo6cWlEsfF7zA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_181454_880947_E6AFA952 
X-CRM114-Status: GOOD (  11.80  )
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
