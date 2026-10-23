Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E172606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 03:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZN2JBFs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=RayFjvJb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JAmlP8+vHBeCstdPmiXxtG+OqK5Ogk74gXyZ5sEx4tw=; b=dZN2JBFsVRBe7eMezow7VkmLMB
	sW0hfw3P7rk3ZxApl4VgPDiaKzAlDtkIvLT//YIJl/U23eko6E98Rs5YGgn5MrHixHt8eDszUKZMQ
	Dk0auJk340l5f7DdQgEB36ehKnR5C57FQHVDLFmMia6MyhJgTvdly0uNZHCKqmW6zf6vCl4K/sRwZ
	2KoCTxadfjfsiqnoGLPbzPCQG0i6wIo9Etg3le3eCb4a1nPRCtH7RqVHlJ82u5AyyGRCLzp8M7fj0
	fBnSKWQyM58/X9tYSJdS4pgwzmvk9/Hv3I688/qh/vQfdqT/Zmz91MSPpTeA1ArHw8yNGyFg6bFhg
	YtN9x3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6EJ-0000000FRZI-40MW;
	Fri, 23 Oct 2026 03:46:07 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6EG-0000000FRYU-1R7Z
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 03:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792727105;
	bh=tc24JJXkM3MxdHb8xCBSM0osbkWbu4tm3dAfyIkUVbs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=RayFjvJbI5e4SaOCO9x1+CrEGJbC37WNO+ewCwWzkGMEKNAwQT38/BWAtclfJdOvT
	 q2IHeeH2Mnea/xHbyd2gAsz92MwB7uuQ/8OJ3DEVurMr/9g6OQSg+gYuz58l358NXE
	 0Fj2nCo92TXX+EAHbFAGaj2Y6wEgfAHQ6dwtxOz0=
X-QQ-mid: esmtpgz16t1792727099t732f9adb
X-QQ-Originating-IP: /R5oSncePt5DfLZ5ORre8bCWlawanksA+12WakENsrU=
Received: from = ( [183.48.246.89])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:44:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2167279151076700464
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 23 Oct 2026 11:44:41 +0800
Subject: [PATCH v5 1/6] lib: sbi: select expected trap handler per hart
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-spacemit-k3-v5-1-c5ddfc72caa4@linux.spacemit.com>
References: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
In-Reply-To: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Alvin Chang <alvinga@andestech.com>, E Shattow <e@freeshell.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10081;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=RutGLzgXGYlYwwmAwh7C4mTuxXuh3oST72Hq7RlewrQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFm3bmg/LmK48//Py6LZuU02ryZ98LE7NvVx6c0jq/8se
 O/s+o7HpqOUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiFScY/icurfHYm7p6slzF
 U6EGwaZXpy4c2tl3WEHibKz8Ktt3jfcZ/sc+f/v4pYuX7cToLR3nputrPnte4zG5dO/z/aUpLxw
 06ngB
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mp9DoNiQyQ7K6aurlP7h2h3ElMY7JGQ0f/w+hNqL+VdO4i+q0JhccGMg
	xE4H6BMjnZYEq08gOopZLjlr/iJiDq1EqbEo3Py4Dz6yIkKKdUzS4Y9qbLPOV8X2Zb2Icpq
	5qtvNi+JCGPaWvo8f83tt1u8+ohGaoLzG0RUX9ZCbonSUuPH5WljYcjk2y94tbS9gwbwITA
	oApXceBXzoBajA2/3eUmG68tzOo6YMHfhMsMELSTLlqB7KpqLXYfbuHVpG4ElGcIk2E1iVJ
	yhKSqcqcWsksuFt5ze0gKB4Dktl91WOTqr3MvdKKBokKvH2DZasxbbMiBKNQq/SBRo35Y1Y
	4gKY6t+8xjPniXcVYNc7mATVZAtighWrGUbZycPqoiAee5dpyVzIXrmZBz7gYtM/NZqKN3c
	LdUMpxwL7ligMwQJNudGIcTBc8XypWEINwYwyZU2q3IHIncaL7sD9WnX+/awt7CzrA88h4L
	8DW+S6CAJ1MpbxKqPHs8N2Yi+mXKnets8Ac9Dxz9uK5d+sup/HYjpDtPl7FKgft9lY7+xKD
	hr8AcY12x/Nmg9N28U+Un52TGmhWewLN+IY46/PkxghevcBUhRv/Zw0ed8xOnLiwTt5mBZn
	EC5iDdEyAwXcR6/hiU440J+kJJ5DcZUwdxSS6HivIg5lSEfmPNTWA6do66yS81QWcY3PD6K
	xAwyXN1ClbYLeWVdPhtswybn8WkIXIxKkAlptPz2dI5tEGwd0+b6x15HVmhqz67KIhWQTET
	X/ZFv++x5Q9tXg3raNhZHgjgvMsDF1lXaxCqofFU7rQOI637e0qownhMsWZ3clvRT83ApPk
	r/Kh8Uz7LuGEpW5XT1XvXajyho/zm8MkHxlxuT7aPCHzpN/jTwJwRZMV54l64l0nlVQ3FUf
	4pe70k6jN1AiV7vXIpsMYkF9CQ5Ax85cduj1aCvBPkp3B+bTvnQgQgLBUHkai4Pk9CXxYZg
	jBAl694tgj4hXv+dRBfPSU9rdtg/M2EGW1a2SZKEZASYWxE7OiyvMj7PCfshWPTg6AQMmKT
	c1Ghfjys+C+doZjnc5/pvJhcot4nxDLkv+fvrM5zgjgbqZttpZCEI583GJu96t/Iz+ZUaPs
	y1YE6ktceLE8j1JRBg9UxUI2q+Ue3MjLVQVE9azG+JN433zj/2NDt0EkvQ9cE6Vm3pSdQXv
	IXFNiapReV2p6YmvxLS1sV1jbidpMH8ndfqZyHDGe2MmE7PD6iVj9ejKkAREpCDnCut5Qg2
	BhrYKshtpHqPBZmYagvN9J2utmAZj
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_204605_171736_3EFD18A6 
X-CRM114-Status: GOOD (  16.26  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Cc: Alvin Chang <alvinga@andestech.com>
Link: https://lore.kernel.org/r/20260831022156.2060561-1-alvinga@andestech.com
Tested-by: E Shattow <e@freeshell.de>
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
