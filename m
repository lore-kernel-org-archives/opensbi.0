Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C07C83F03
	for <opensbi@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qW60I1LuZuyRHOXohuwD6x6O1I3Idn/8RoPUV1qjIY0=; b=AtEpaD1yzdzFS4
	s3YxlLqEQC8IQc7e8ZQPb+sCnay6VDfZ7EK3JK2+6uVtIbZzOLslKwVIDhtd2BypcF7p1xXYA9KKI
	YpDxhsIYx37jht+f2amPIrOB+QpSXI32a/W68ms6tTWLpFDGcA+WJH4LhOvTBtOnoh0aSR3x680dP
	CXZlk6RY9n7pI7JAQoo5YYJonCmHVEEIFGf9SwoydxPSVZtpHM9P4esVNaVzpIY07nFj5JdTE7/3Z
	aFlL69MlhnYM0wiTl+ziDkJ5vrLHr9ncjIEEjVzLzoxGHW2bnJEN/8lu0fYpjZWUjrEEujzeUP2LN
	S64rbtpq69cELUMK6QXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzf-0000000CTMX-3VzR;
	Thu, 03 Jul 2025 20:57:19 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLjo-0000000Bne6-3oNy
	for opensbi@lists.infradead.org;
	Thu, 03 Jul 2025 15:20:39 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 563FKC8W014166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 23:20:12 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 3 Jul 2025
 23:20:12 +0800
From: Alvin Chang <alvinga@andestech.com>
To: <opensbi@lists.infradead.org>
CC: <anup@brainfault.org>, <peter.lin@sifive.com>, <wxjstz@126.com>,
        "Alvin
 Chang" <alvinga@andestech.com>
Subject: [PATCH v3 1/2] lib: sbi: Remove redundant call to sbi_hart_expected_trap_addr()
Date: Thu, 3 Jul 2025 23:19:56 +0800
Message-ID: <20250703151957.2545958-2-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703151957.2545958-1-alvinga@andestech.com>
References: <20250703151957.2545958-1-alvinga@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 563FKC8W014166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_082037_457223_CF051D5D 
X-CRM114-Status: GOOD (  10.79  )
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

The variable "sbi_hart_expected_trap" has already been extern variable.
Therefore, the program can directly refer to it instead of calling
sbi_hart_expected_trap_addr().

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
 include/sbi/sbi_csr_detect.h | 4 ++--
 include/sbi/sbi_hart.h       | 4 ----
 lib/sbi/sbi_illegal_atomic.c | 4 ++--
 lib/sbi/sbi_unpriv.c         | 6 +++---
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/sbi/sbi_csr_detect.h b/include/sbi/sbi_csr_detect.h
index 89ba294..097c31c 100644
--- a/include/sbi/sbi_csr_detect.h
+++ b/include/sbi/sbi_csr_detect.h
@@ -18,7 +18,7 @@
 	({								\
 	register ulong tinfo asm("a3") = (ulong)trap;			\
 	register ulong ttmp asm("a4");					\
-	register ulong mtvec = sbi_hart_expected_trap_addr();		\
+	register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
 	register ulong ret = 0;						\
 	((struct sbi_trap_info *)(trap))->cause = 0;			\
 	asm volatile(							\
@@ -37,7 +37,7 @@
 	({								\
 	register ulong tinfo asm("a3") = (ulong)trap;			\
 	register ulong ttmp asm("a4");					\
-	register ulong mtvec = sbi_hart_expected_trap_addr();		\
+	register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
 	((struct sbi_trap_info *)(trap))->cause = 0;			\
 	asm volatile(							\
 		"add %[ttmp], %[tinfo], zero\n"				\
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index dfbe8e4..82b19dc 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -134,10 +134,6 @@ int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
 
 extern void (*sbi_hart_expected_trap)(void);
-static inline ulong sbi_hart_expected_trap_addr(void)
-{
-	return (ulong)sbi_hart_expected_trap;
-}
 
 unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
 void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_illegal_atomic.c b/lib/sbi/sbi_illegal_atomic.c
index 2161b23..8fd6c55 100644
--- a/lib/sbi/sbi_illegal_atomic.c
+++ b/lib/sbi/sbi_illegal_atomic.c
@@ -30,7 +30,7 @@ int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
 	{									\
 		register ulong tinfo asm("a3");					\
 		register ulong mstatus = 0;					\
-		register ulong mtvec = sbi_hart_expected_trap_addr();		\
+		register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
 		type ret = 0;							\
 		trap->cause = 0;						\
 		asm volatile(							\
@@ -57,7 +57,7 @@ int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
 	{									\
 		register ulong tinfo asm("a3");					\
 		register ulong mstatus = 0;					\
-		register ulong mtvec = sbi_hart_expected_trap_addr();		\
+		register ulong mtvec = (ulong)sbi_hart_expected_trap;		\
 		type ret = 0;							\
 		trap->cause = 0;						\
 		asm volatile(							\
diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
index 2a55d9d..f9bbec5 100644
--- a/lib/sbi/sbi_unpriv.c
+++ b/lib/sbi/sbi_unpriv.c
@@ -24,7 +24,7 @@
 	{                                                                     \
 		register ulong tinfo asm("a3");                               \
 		register ulong mstatus = 0;                                   \
-		register ulong mtvec = sbi_hart_expected_trap_addr();         \
+		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
 		type ret = 0;                                                 \
 		trap->cause = 0;                                              \
 		asm volatile(                                                 \
@@ -51,7 +51,7 @@
 	{                                                                     \
 		register ulong tinfo asm("a3") = (ulong)trap;                 \
 		register ulong mstatus = 0;                                   \
-		register ulong mtvec = sbi_hart_expected_trap_addr();         \
+		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
 		trap->cause = 0;                                              \
 		asm volatile(                                                 \
 			"add %[tinfo], %[taddr], zero\n"                      \
@@ -121,7 +121,7 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
 	register ulong tinfo asm("a3");
 	register ulong ttmp asm("a4");
 	register ulong mstatus = 0;
-	register ulong mtvec = sbi_hart_expected_trap_addr();
+	register ulong mtvec = (ulong)sbi_hart_expected_trap;
 	ulong insn = 0;
 
 	trap->cause = 0;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
