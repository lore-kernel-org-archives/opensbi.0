Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF46FCD3446
	for <opensbi@archiver.kernel.org>; Thu,  7 May 2026 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4D3bSH6Q/QsQG4LiHLpnwKdwLiJgEW9rkwG/khWzu7I=; b=F2+7pUJ6+PmoZe
	lMWz/NQJpujqshGCtyxwGFkdXhxQGZqgWFW4Al4xrdl2f4xsARH8FOKpM8YG+3KfOOPpsTDKMqjvu
	E9v+USgLppaJGsQsHF3IwLli4UVtvBr/GvC/06XWlvf51zullUHqQpVU6GuNh2o9AJqs0UL/JrrxK
	1tJy0WS9EUtYUTXVi6KQ8M1KyFF7/xGViBgqsy+Zy3Vg1EEBFSuvl8O+LHjVcM5DLuSHLz4mFmqf0
	eHfnZ402bKpxkPKo3aHpWgOPzCvIlSOt/HMKAz4CMEfhKVsCO6Ldt7ViHnwiBs2pR0G0/e+7V5MuV
	jr2IkWKPlc5eyFVzH3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39P-00000004YTs-1hMl;
	Thu, 07 May 2026 18:08:43 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39J-00000004YQN-2VpN
	for opensbi@lists.infradead.org;
	Thu, 07 May 2026 18:08:42 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1324053d600so72721c88.0
        for <opensbi@lists.infradead.org>; Thu, 07 May 2026 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1778177317; x=1778782117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g1xEIwxBANHcBUcF/nE8ldZCr6OzqBld1tp1S5iJXo=;
        b=RsAfB+PC54mw6FOIKG9iJEm+41/BEx6oVG8J3DfBmPbk5ACS2elrWKUC1ovSMrAyoz
         P447EGoJROMdE2HL3pb/lO2twL11ma9sMoCFf6klgA7NC3wMmM/aX/MfPRwbmhgM6+m+
         SdqqL2HDyIa3GCMXeIo7+3J14pvrJzavfo1nMaTNqvj4Qup9snJsGNSAkBA1szDtQ1F9
         xQ6HWG1GcgL0xlDWGvR8nbTucrDyS0bze4kNRChXnYvA7wIZ+bepp4OVC69dZuGaMQUq
         h+0yWl59fW9ep7cQayIJdguzqBKLzpkRUOCufFU8y511w/PpsWPslnhNHaav+RkXOG01
         fkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177317; x=1778782117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1g1xEIwxBANHcBUcF/nE8ldZCr6OzqBld1tp1S5iJXo=;
        b=Uwq34wA0ek4C/15v8goqz+j31jkdDbwNcaLPYIzIHwqwvowyAjL0gyOm7idsh0eb0r
         HXawoYchsmUC7AJD6UBHmimQyvaTHSQ3k0iKrQuGc6XhTnsdP6TEmkaJMtNAvhTjJ986
         NCfwNNtPkz+y1X6llVBHBtlkkv+oelHM/zV2h75PS2KvCWJ56LFxh15mJX7K2kMXPnQ8
         p1S4fZihcdmLZwqotpo5SMOAE2x//V6hlU6bJZV8CA5e9Rbjj0/GtkVuGe7ZZfatOOZP
         2TD6eZG0q/oa2wBsiV3TSOsLjqpa6Ho7uHgJHs8G1Sd2Fce+WESCIT9JJkpn4CAi9Muf
         bepQ==
X-Gm-Message-State: AOJu0Yy42Jmj5rqTCNIWhky3mxP7Mynf45n3Yrij9wWixEdFx9qRoxbg
	4wHByw6y/+FRqzVIm9ORoF2cSXRdw+X0kDGGgPfAJgq1i2qx5cBMdAvniajfmY1TRa5lN1MoVBK
	nWqbZ
X-Gm-Gg: Acq92OF++wIIBE0/0I0GrQrVz+Yo3PbI+O/VP91s1px1I1haxL3YWBW1wd0YKB9AuHO
	tQr1LcxO+U2t7cnyXgTXgXLUubQBtNXe8bU1oJe5YvEEycLOhJhBPTR19yo2vI4ctO9EnXyQdu5
	wS99mKn85Wer14RgUytgRMpii6HfN/Y5DLzwHC7+XH2nHBUg2ABvKD7YfYgq/GkBPTKijEoLoXR
	xn8vatmCx4RHVrVyvr3ROlbnbIlJkWgGDTrDFbskG0rvGbQD+H4a94dI0s/i3SX95Fa2HxmBgpR
	oT2lY8vkteXIgR6F5bMIhp+2aFQzMM+aYDJ2YDD8ijh58lo2Pm5OGa5IYOOjxAeQVCIwOayZE8o
	QlZVcIB/79pyJpk7uu2viwl8So/TzN0q8WRG7X4aXABS2Or+/Lym8RxFTvKIZF5jd9Wxebgz9kn
	nqYv17vmCrxexHEohmJC+2aODeeO60809Qjm+wt6gSQrJfp+P7eA==
X-Received: by 2002:a05:693c:3015:b0:2d9:2896:2794 with SMTP id 5a478bee46e88-2f54c77cb34mr1962600eec.7.1778177316519;
        Thu, 07 May 2026 11:08:36 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82b5636besm78285eec.2.2026.05.07.11.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:08:36 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v3 5/6] lib: sbi: Move Zkr entropy initialization from fw_base.S to init_coldboot
Date: Thu,  7 May 2026 18:08:06 +0000
Message-ID: <acd52b0f3468758bc5f09e6a45662341b31d4d87.1778176768.git.evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778176768.git.evvoevod@tenstorrent.com>
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_110838_969390_4D4BBBCD 
X-CRM114-Status: GOOD (  13.73  )
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

Current placement of entropy initialization via Zkr extension requires a
trap-based mechanism to handle absent Zkr extension case. In presence of
Smrnmi extension no trap-based mechanisms should be used before Smrnmi is
detected and enabled otherwise trap will jump to undefined location.
Move stack guard initialization into init_coldboot function body after
device tree has been parsed so we know if Zkr extension is implemented by
the platform which helps to avoid trap-based discovery.
init_coldboot() is a safe place to initialize entropy because it doesn't
return so no check of __stack_chk_guard against value on entry
will be done.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 firmware/fw_base.S | 32 --------------------------------
 lib/sbi/sbi_init.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 043de7d7..5d6540d7 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -107,30 +107,6 @@ _bss_zero:
 	add	s4, s4, __SIZEOF_POINTER__
 	blt	s4, s5, _bss_zero
 
-	/* Trying to initialize the stack guard via the Zkr extension */
-	lla	t0, __stack_chk_guard_done
-	csrw	CSR_MTVEC, t0
-	li	t0, 0
-	li	t3, SEED_OPTS_ES16
-	li	t4, SEED_ENTROPY_MASK
-	li	t5, __SIZEOF_POINTER__
-__stack_chk_guard_loop:
-	csrrw	t1, CSR_SEED, x0
-	li	t2, SEED_OPTS_MASK
-	and	t2, t2, t1
-	bgtu	t2, t3, __stack_chk_guard_done
-	bltu	t2, t3, __stack_chk_guard_loop
-	and	t1, t1, t4
-	slli	t0, t0, 16
-	or	t0, t0, t1
-	addi	t5, t5, -2
-	bgtz	t5, __stack_chk_guard_loop
-	lla	t1, __stack_chk_guard
-	REG_S	t0, 0(t1)
-	j	__stack_chk_guard_done
-	.align 3
-__stack_chk_guard_done:
-
 	/* Setup temporary trap handler */
 	lla	s4, _start_hang
 	csrw	CSR_MTVEC, s4
@@ -895,14 +871,6 @@ __stack_chk_fail:
 	la	a0, .Lstack_corrupt_msg
 	call	sbi_panic
 
-	/* Initial value of the stack guard variable */
-	.section .data
-	.align 3
-	.globl __stack_chk_guard
-	.type __stack_chk_guard, %object
-__stack_chk_guard:
-	RISCV_PTR	0x95B5FF5A
-
 #ifdef FW_FDT_PATH
 	.section .rodata
 	.align 4
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index aae035e1..b248e73f 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -218,6 +218,8 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch)
 	__smp_store_release(&coldboot_done, 1);
 }
 
+unsigned long __stack_chk_guard = 0x95B5FF5A;
+
 static unsigned long entry_count_offset;
 static unsigned long init_count_offset;
 
@@ -269,6 +271,35 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	/*
+	 * Initialize stack guard via Zkr entropy source if Zkr is
+	 * implemented according to device tree. Writing new seed value
+	 * to __stack_chk_guard is safe here because function doesn't
+	 * return and no check against value on entry will be done.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZKR)) {
+		unsigned long guard_val = 0;
+		int chunks = sizeof(unsigned long) / sizeof(uint16_t);
+		bool res = true;
+
+		while (chunks) {
+			unsigned long seed = csr_swap(CSR_SEED, 0);
+			unsigned long opst = seed & SEED_OPTS_MASK;
+
+			if (opst == SEED_OPTS_DEAD) {
+				res = false;
+				break;
+			}
+			if (opst == SEED_OPTS_ES16) {
+				guard_val = (guard_val << 16) | (seed & SEED_ENTROPY_MASK);
+				chunks--;
+			}
+			continue;
+		}
+		if (res)
+			__stack_chk_guard = guard_val;
+	}
+
 	rc = sbi_timer_init(scratch, true);
 	if (rc)
 		sbi_hart_hang();
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
