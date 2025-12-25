Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D15E7AD42
	for <opensbi@archiver.kernel.org>; Thu, 25 Dec 2025 11:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WLBpAAeEK0CSSPMPZYmf+17zv/xLnL9E//NWaz3ef2Q=; b=2M4VT/PzFSTjLS
	NOkubPCHEVnZoF/42DyVnqmenKQf8HTly/ZY5GnJ9GiAPhKWWqznB51jrFLVsJnTtDnWHuNpnCnHb
	aaPusRrUR6FFtBO/RDdI1eLIFn/ZztvS953EZ5dVIntYV4rjLr/voRGWzpnLT+joOvk/NwZCPT83Z
	MSLJLB8X3JjS9cpPmAKrbABWGRdShE3EpShxmj1u2aoMX43D8evuk4CB9soCwqI67Pm0K5B/Ac+lT
	aXllDP+5Png+RabNF8JNQTsFAbQiaIKHyxOydtXD2tZ1WiowALdfDqI4bl/HCfvTEgEO6TlfFQAa2
	Acd+J9j4wuu89uz6AwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYjMk-00000000MGH-3IHo;
	Thu, 25 Dec 2025 11:18:46 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYjMg-00000000MFS-0QSc
	for opensbi@lists.infradead.org;
	Thu, 25 Dec 2025 11:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1766661522; x=1798197522;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BDWHhtC12VGSMDVfCZG/Q/zgds7X6eQVgEwYq9r7tSI=;
  b=CnM+a2B3xbA6EU6altKZbEDgUbCo9yyUpvZmEcqV/EzczqXifNUztiD0
   z2f5LGDkkjlvjJrP5slvYYKPZdnkkqYMJEyphycDjx+BMQ11Qf4fQM/Sj
   F+j/KS6ES7Aj8uwd6+dH5r+9ELrMjeiTo7FFi5JNuRollDA0u/FRXrKQF
   MTEq5sN2/Wj9eSJdyo6cgN11Kb31f8M+NS9e/VYHtqR1TIwDtXCitWVu2
   ih7fP4usgJsrkrVCmxc+ZRX8h5y/OVkRDjvhSsLfQ0rnW+ZFIzrHZRh7A
   Q2z5d2d8mf47Z30ljKyQJVg8zYGwXZDWyRqaZHrOb9lElzpd+PdugBWRB
   g==;
X-CSE-ConnectionGUID: LYmiA06aSJWkn3GmfUlxBw==
X-CSE-MsgGUID: wMn4gq6GSHCZ2IHO5j+UAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 13:18:37 +0200
X-CSE-ConnectionGUID: cQkvZTdHQaK1Qjt+JSswAA==
X-CSE-MsgGUID: TurSVgZdQPe656etkZnxkw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces01_data.me-corp.lan with SMTP; 25 Dec 2025 13:19:57 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 25 Dec 2025 13:18:35 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	opensbi@lists.infradead.org
Subject: [PATCH] atomics: fix AMO test macros
Date: Thu, 25 Dec 2025 13:18:22 +0200
Message-ID: <20251225111826.4048400-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_031842_650109_F0AD8B1C 
X-CRM114-Status: GOOD (  11.87  )
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

[1] https://github.com/riscv-non-isa/riscv-c-api-doc

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 firmware/fw_base.S            | 2 +-
 firmware/payloads/test_head.S | 2 +-
 lib/sbi/riscv_atomic.c        | 8 ++++----
 lib/sbi/riscv_locks.c         | 2 +-
 lib/sbi/sbi_illegal_atomic.c  | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 5300ecf22e0c..9fbe2b870974 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -59,7 +59,7 @@ _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
 	lla	a6, _boot_lottery
 	li	a7, BOOT_LOTTERY_ACQUIRED
-#ifdef __riscv_atomic
+#ifdef __riscv_zaamo
 	amoswap.w a6, a7, (a6)
 	bnez	a6, _wait_for_boot_hart
 #elif __riscv_zalrsc
diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
index 070ce8aa98be..aa20a13f4b89 100644
--- a/firmware/payloads/test_head.S
+++ b/firmware/payloads/test_head.S
@@ -30,7 +30,7 @@ _start:
 	/* Pick one hart to run the main boot sequence */
 	lla	a3, _hart_lottery
 	li	a2, 1
-#ifdef __riscv_atomic
+#ifdef __riscv_zaamo
 	amoadd.w a3, a2, (a3)
 #elif __riscv_zalrsc
 _sc_fail:
diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
index df16a2eb159e..7935ca9c642c 100644
--- a/lib/sbi/riscv_atomic.c
+++ b/lib/sbi/riscv_atomic.c
@@ -12,8 +12,8 @@
 #include <sbi/riscv_atomic.h>
 #include <sbi/riscv_barrier.h>
 
-#if !defined(__riscv_atomic) && !defined(__riscv_zalrsc)
-#error "opensbi strongly relies on the A extension of RISC-V"
+#if !defined(__riscv_zaamo) && !defined(__riscv_zalrsc)
+#error "opensbi strongly relies on the zaamo or zalrsc extension of RISC-V"
 #endif
 
 long atomic_read(atomic_t *atom)
@@ -31,7 +31,7 @@ void atomic_write(atomic_t *atom, long value)
 
 long atomic_add_return(atomic_t *atom, long value)
 {
-#ifdef __riscv_atomic
+#ifdef __riscv_zaamo
 	long ret;
 #if __SIZEOF_LONG__ == 4
 	__asm__ __volatile__("	amoadd.w.aqrl  %1, %2, %0"
@@ -75,7 +75,7 @@ long atomic_sub_return(atomic_t *atom, long value)
 	return atomic_add_return(atom, -value);
 }
 
-#ifdef __riscv_atomic
+#ifdef __riscv_zaamo
 #define __axchg(ptr, new, size)							\
 	({									\
 		__typeof__(ptr) __ptr = (ptr);					\
diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
index 41e8fabd08be..2e4789365962 100644
--- a/lib/sbi/riscv_locks.c
+++ b/lib/sbi/riscv_locks.c
@@ -53,7 +53,7 @@ void spin_lock(spinlock_t *lock)
 
 	__asm__ __volatile__(
 		/* Atomically increment the next ticket. */
-#ifdef __riscv_atomic
+#ifdef __riscv_zaamo
 		"	amoadd.w.aqrl	%0, %4, %3\n"
 #elif __riscv_zalrsc
 		"3:	lr.w.aqrl	%0, %3\n"
diff --git a/lib/sbi/sbi_illegal_atomic.c b/lib/sbi/sbi_illegal_atomic.c
index 8fd6c5575bfb..12bc438c87c0 100644
--- a/lib/sbi/sbi_illegal_atomic.c
+++ b/lib/sbi/sbi_illegal_atomic.c
@@ -11,11 +11,11 @@
 #include <sbi/sbi_illegal_atomic.h>
 #include <sbi/sbi_illegal_insn.h>
 
-#if !defined(__riscv_atomic) && !defined(__riscv_zalrsc)
-#error "opensbi strongly relies on the A extension of RISC-V"
+#if !defined(__riscv_zaamo) && !defined(__riscv_zalrsc)
+#error "opensbi strongly relies on the AMO or LR/SC extension of RISC-V"
 #endif
 
-#ifdef __riscv_atomic
+#ifdef __riscv_zaamo
 
 int sbi_illegal_atomic(ulong insn, struct sbi_trap_regs *regs)
 {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
