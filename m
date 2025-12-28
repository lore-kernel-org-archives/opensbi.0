Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23972E784BE
	for <opensbi@archiver.kernel.org>; Sun, 28 Dec 2025 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNOqh+1KdrnjliLudj7NlfeBf6JOf/BLm3chXOL+vwA=; b=LvW5GWNZ7g1qtP
	SUbdxH+qbt3vnZmvygtt6lb+qpG8/DKMOV5lhVqmZLHWYhy7qCPKwVnfKAOBvlmgccoRhbPdyRSS3
	i3qHlHJcv7O+66dBdp6HdnU/kUv0q0tZHgTWliTUFWRTYtfGIrednwKw+fhU9s1jNa1twBrJ1sa2k
	LOWCBJI9NU/reAG+WZY9cQM0blzKe8yB/Xobh23XvYkI9NQHVic2BhIvr+RNaIsYBBbYf1RU/YWrW
	wruNVul0nVIm+rFGcv2gRhw02/tYy7x4QUAs5EXIEuiQodal071F5jb40ppmIHCni7yKi0ZTQzNZr
	78xRf71El6UcgirioDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZlHb-00000002ZlS-09z6;
	Sun, 28 Dec 2025 07:33:43 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZlHW-00000002Zl3-2JJt
	for opensbi@lists.infradead.org;
	Sun, 28 Dec 2025 07:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1766907218; x=1798443218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AR6KBAsW9MNQfqkAwq/0o7LCQQniqmonopVp7a7bUBs=;
  b=YfHl4HGDJ7+Y5Ar8WLf2xPLHajLzXJmroaHxHSrjmfb2EPpk2kCGRoyj
   FEMYCn0IF3KKJ812mKyDgWjpdr9M5gBLk+1ckSeNZZ6G3pD/z+yGUtgxy
   W+0WV1du8P2G5sLlmTA5dWJyC+fiTYYr+OHWU1w1UAqELjTm/kms2C4RN
   ZzzhIMrAbqhF4NHzF8/KEW0Wj+kLdQXox80aXk1ijOB/b8HZ05we9MuGg
   D2JTmFrLca4l981ZNtWOxU1ybM4gUUgVPL7isxVpEMdV/X5PkusBXKEfj
   CNNPad/ZDJWAl5VfEDCX+TGCU8R1WRW42MLQ1KChh4G2m9DTej4DH01/U
   A==;
X-CSE-ConnectionGUID: WegDAhtaQhOgFuNe8U20Xw==
X-CSE-MsgGUID: HjcuXokuQoGioRXP8Xjfqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 09:33:32 +0200
X-CSE-ConnectionGUID: iLI/wNFVR2uWRyUeCOS0kA==
X-CSE-MsgGUID: gKHLaHD7S/SwQ4yRTBfxzg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 28 Dec 2025 09:34:57 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 28 Dec 2025 09:33:31 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org,
	vladimir.kondratiev@mobileye.com,
	Xiang W <wxjstz@126.com>
Subject: [PATCH v2] atomics: fix AMO test macros
Date: Sun, 28 Dec 2025 09:33:21 +0200
Message-ID: <20251228073321.1533844-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <CAAhSdy1WfBK=0rdY23NysLANsix_XoOYz1nedrgMqeHZPN0VXA@mail.gmail.com>
References: <CAAhSdy1WfBK=0rdY23NysLANsix_XoOYz1nedrgMqeHZPN0VXA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_233339_075668_C35ACE50 
X-CRM114-Status: GOOD (  13.54  )
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

The "RISC-V C API" [1] defines architecture extension test macros
says naming rule for the test macros is __riscv_<ext_name>,
where <ext_name> is all lower-case.
3 extensions dealing with atomics implementation,
"zaamo" consists of AMO instructions, "zalrsc" - LR/SC,
"a" extension means both "zaamo" and "zalrsc"
Test macros are __riscv_a, __riscv_zaamo and __riscv_zalrsc.
Alternative to the __riscv_a macro name, __riscv_atomic, is deprecated.

Use correct test macro __riscv_zaamo for the AMO variant of atomics.
It used to be __riscv_atomic that is both deprecated and incorrect
because it tests for the "a" extension; i.e. both "zaamo" and "zalrsc"
If ISA enables only zaamo but not zalrsc, code as it was would not compile.

Older toolchains may have neither __riscv_zaamo nor __riscv_zalrsc, so
query __riscv_atomic - it should be treated as both __riscv_zaamo and
__riscv_zalrsc, in all present cases __riscv_zaamo is more favorable
so take is as alternative for __riscv_zaamo

[1] https://github.com/riscv-non-isa/riscv-c-api-doc

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 firmware/fw_base.S            |  4 ++--
 firmware/payloads/test_head.S |  4 ++--
 lib/sbi/riscv_atomic.c        | 16 ++++++++--------
 lib/sbi/riscv_locks.c         |  6 +++---
 lib/sbi/sbi_illegal_atomic.c  |  8 ++++----
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 5300ecf22e0c..bce9e2268424 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -59,10 +59,10 @@ _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
 	lla	a6, _boot_lottery
 	li	a7, BOOT_LOTTERY_ACQUIRED
-#ifdef __riscv_atomic
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	amoswap.w a6, a7, (a6)
 	bnez	a6, _wait_for_boot_hart
-#elif __riscv_zalrsc
+#elif defined(__riscv_zalrsc)
 _sc_fail:
 	lr.w	t0, (a6)
 	sc.w	t1, a7, (a6)
diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
index 070ce8aa98be..9a87e56fcf5d 100644
--- a/firmware/payloads/test_head.S
+++ b/firmware/payloads/test_head.S
@@ -30,9 +30,9 @@ _start:
 	/* Pick one hart to run the main boot sequence */
 	lla	a3, _hart_lottery
 	li	a2, 1
-#ifdef __riscv_atomic
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	amoadd.w a3, a2, (a3)
-#elif __riscv_zalrsc
+#elif defined(__riscv_zalrsc)
 _sc_fail:
 	lr.w	t0, (a3)
 	addw	t1, t0, a2
diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
index df16a2eb159e..a7756a00c35c 100644
--- a/lib/sbi/riscv_atomic.c
+++ b/lib/sbi/riscv_atomic.c
@@ -12,8 +12,8 @@
 #include <sbi/riscv_atomic.h>
 #include <sbi/riscv_barrier.h>
 
-#if !defined(__riscv_atomic) && !defined(__riscv_zalrsc)
-#error "opensbi strongly relies on the A extension of RISC-V"
+#if !defined(__riscv_atomic) && !defined(__riscv_zaamo) && !defined(__riscv_zalrsc)
+#error "opensbi strongly relies on the zaamo or zalrsc extension of RISC-V"
 #endif
 
 long atomic_read(atomic_t *atom)
@@ -31,7 +31,7 @@ void atomic_write(atomic_t *atom, long value)
 
 long atomic_add_return(atomic_t *atom, long value)
 {
-#ifdef __riscv_atomic
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	long ret;
 #if __SIZEOF_LONG__ == 4
 	__asm__ __volatile__("	amoadd.w.aqrl  %1, %2, %0"
@@ -44,7 +44,7 @@ long atomic_add_return(atomic_t *atom, long value)
 			     : "r"(value)
 			     : "memory");
 #endif
-#elif __riscv_zalrsc
+#elif defined(__riscv_zalrsc)
 	long ret, temp;
 #if __SIZEOF_LONG__ == 4
 	__asm__ __volatile__("1:lr.w.aqrl	%1,%0\n"
@@ -64,7 +64,7 @@ long atomic_add_return(atomic_t *atom, long value)
 			     : "memory");
 #endif
 #else
-#error "need a or zalrsc"
+#error "need a/zaamo or zalrsc"
 #endif
 
 	return ret + value;
@@ -75,7 +75,7 @@ long atomic_sub_return(atomic_t *atom, long value)
 	return atomic_add_return(atom, -value);
 }
 
-#ifdef __riscv_atomic
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define __axchg(ptr, new, size)							\
 	({									\
 		__typeof__(ptr) __ptr = (ptr);					\
@@ -101,7 +101,7 @@ long atomic_sub_return(atomic_t *atom, long value)
 		}								\
 		__ret;								\
 	})
-#elif __riscv_zalrsc
+#elif defined(__riscv_zalrsc)
 #define __axchg(ptr, new, size)							\
 	({									\
 		__typeof__(ptr) __ptr = (ptr);					\
@@ -132,7 +132,7 @@ long atomic_sub_return(atomic_t *atom, long value)
 		__ret;								\
 	})
 #else
-#error "need a or zalrsc"
+#error "need a/zaamo or zalrsc"
 #endif
 
 #define axchg(ptr, x)								\
diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
index 41e8fabd08be..02ecb4e4189b 100644
--- a/lib/sbi/riscv_locks.c
+++ b/lib/sbi/riscv_locks.c
@@ -53,15 +53,15 @@ void spin_lock(spinlock_t *lock)
 
 	__asm__ __volatile__(
 		/* Atomically increment the next ticket. */
-#ifdef __riscv_atomic
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 		"	amoadd.w.aqrl	%0, %4, %3\n"
-#elif __riscv_zalrsc
+#elif defined(__riscv_zalrsc)
 		"3:	lr.w.aqrl	%0, %3\n"
 		"	addw	%1, %0, %4\n"
 		"	sc.w.aqrl	%1, %1, %3\n"
 		"	bnez	%1, 3b\n"
 #else
-#error "need a or zalrsc"
+#error "need a/zaamo or zalrsc"
 #endif
 
 		/* Did we get the lock? */
diff --git a/lib/sbi/sbi_illegal_atomic.c b/lib/sbi/sbi_illegal_atomic.c
index 8fd6c5575bfb..dd4ea2ed34c1 100644
--- a/lib/sbi/sbi_illegal_atomic.c
+++ b/lib/sbi/sbi_illegal_atomic.c
@@ -11,18 +11,18 @@
 #include <sbi/sbi_illegal_atomic.h>
 #include <sbi/sbi_illegal_insn.h>
 
-#if !defined(__riscv_atomic) && !defined(__riscv_zalrsc)
-#error "opensbi strongly relies on the A extension of RISC-V"
+#if !defined(__riscv_atomic) && !defined(__riscv_zaamo) && !defined(__riscv_zalrsc)
+#error "opensbi strongly relies on the zaamo or zalrsc extension of RISC-V"
 #endif
 
-#ifdef __riscv_atomic
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 
 int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
 {
 	return truly_illegal_insn(insn, regs);
 }
 
-#elif __riscv_zalrsc
+#elif defined(__riscv_zalrsc)
 
 #define DEFINE_UNPRIVILEGED_LR_FUNCTION(type, aqrl, insn)			\
 	static type lr_##type##aqrl(const type *addr,				\
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
