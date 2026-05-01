Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A993CD3430
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdb8/kh2oPViJ5EqvR0W8qY93j9q0DkoODozfCUm4Rw=; b=lfEKO8uArji+7z
	WWIiJd3ixilUKlt9rzVsFpIa4R1KwAxTFobQFGt6mW0GaQEgXqwk8Y9lSJuktfiAoo/xcXwLvry67
	znYXr0vIbuXidvC2qvhcTgBQ52PfqK6v0Lo915uSwNkjII1FN/OCJqztg7jng90Nnhy/O7lc4quzu
	z6XJFezjy7ljwSXFiJNX3FTSdku9bRM4xFmGkSiwyBr3EifGRSkQh2GRMwjoC9LnlAcryCQ2k+lJq
	5GxwrK9rxSiy/I7Sif0NVauZSWB6DUe3lHEqalb/HjW9zgs2B6o+yYdTQtVTM2/fUkYKmiYJ3oIhx
	VJrVnr4wii4BO6Mf0jAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE8-00000007grA-0qaj;
	Fri, 01 May 2026 21:16:48 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE5-00000007gp8-3wTm
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 21:16:47 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2d89bbca7b5so82565eec.3
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 14:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1777670205; x=1778275005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evtpahHgey/LViSW9orNGKIgfTTrmbI9FkmZnQYePjk=;
        b=M6LWSVBWW17x0cg8Xny99MPbW7Kyw232D8gHfXjU4KDND3lt7UnmakZM71S5mN+1aP
         WK0FFYzl9JiE1PAisUYl21jLLtF31Of06d1RNlsd9qrwSqWin5Y0b08yQI8iEGN5stHv
         lT733g6JGv07+k5pQosZei2YnrBptrywUOoZ0whlXVyKCYO9bYZNeinUdoxCsC+v6LSz
         1o4468HvNYSi0/fP7SUU182kXPSBsQh8RGIaFNs1WJ9pnhR4TQtsTGYU6mrPp7xuLkaL
         p+cJIh1427V9EZAEumUoiif9/4lQPHwyff29dJ9I4dVrHbeiW2+XNHPhx0ULSyn4hLLE
         MJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670205; x=1778275005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=evtpahHgey/LViSW9orNGKIgfTTrmbI9FkmZnQYePjk=;
        b=H2niJSioXU0oLT8THzyTwLsnPDShcKX3WdtHeCykDzkAXQMphVuTuplIuWhDudN7oL
         U6xIKwIJdVqfo0BHd+KHCqjDhf89EiZrd48M6mr01hopyVoXMwWI8WgEhyz5kcMEsyJC
         NcGTLs+RB4c0oW4zzIH+qjikpGbI+Pfqa/qfnVUS7wPAQ0Z9XNGqSYYh0JE7naLcOF2/
         XgsTsb3nKXMMOJJZ06vd6Kvy4d02z+z4tGLArrcs9QrpgdDr4fX22zhxggsjzslykv1J
         8Mlb67n/ScrTR9mEMEOFNnJZGcWK+M7ZuHj3qj3Bkq9dnJbtdWHeWkxqDXz0JFSmF71N
         GOCg==
X-Gm-Message-State: AOJu0YwQ80Jl2qttu6IIr7qsDZstN/vDPkiThYNeJW+tw3z9wmSG6ddM
	AQukVATs0MlgE14pBgj76X2daqqLzcJyX7+uEKuUMvuSzp5WNrZsC2NhtclMxpX0Idd3MWOBqwJ
	5cznM
X-Gm-Gg: AeBDievJepUsvNndz0jAnxTL1EJfvS4yXhgxaW4/ANXcCZRagZJ5gBsfMn7ZpNSG2pH
	GYRgLj5/gzVhCqY7gSF0mOdN/5HdMRsFhEPBTtpGtuZibjKfxtNemYn+hEolcyF916+41jMY9W+
	1CM7kBbmt7Hk0hwieP/Md9UEi74znWYd+D59dm8EQkBd6XRmHNr/K1HvchMPHxPLDkj/tsYK+/e
	SmoPQ6wMAoAaBj255lE0o6JN5csH83I7+9GnmA9N/gGllDtIhEh63Ix4/EQOgKlnI74whnBBj2l
	soYjNamlFWHwRp/hlSqwVBhWg+Nik4xIM5umCm4i7ZxyATZCVwgmywvVSBxBi/hLD8z+mjap1HE
	HAOFhn26kidF4vIejM5GqaBDTaFtjp2pvniyHzJku1wbfPZhJqxtzFxHg1WlzK4DmcoeLimxscY
	DW9uMe0IP36op04FoX4DqSsiFnMASueDXWQ863jaHreCXgMCpGKwR4Sj64excR
X-Received: by 2002:a05:7300:6c29:b0:2dd:5641:ef0 with SMTP id 5a478bee46e88-2efba176588mr183748eec.6.1777670204698;
        Fri, 01 May 2026 14:16:44 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2casm5879308eec.14.2026.05.01.14.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 14:16:44 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v2 4/5] lib: sbi: Create a spot to place Smrnmi detection before traps and after DT is ready
Date: Fri,  1 May 2026 21:16:26 +0000
Message-ID: <20260501211627.3293126-5-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
References: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_141645_982930_04B7E69E 
X-CRM114-Status: GOOD (  16.58  )
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

Since Smrnmi is detected from the device tree, move
sbi_platform_extensions_init() before trap-based feature detection so
the extension is known when the next commit acts on it.

The Zkr seed-CSR access can trap if Zkr is not implemented. On Smrnmi
platforms NMIE=0 by default after reset, which routes that trap to
NMEVEC rather than MTVEC. Until Smrnmi handlers are installed and
NMIE=1, no NMEVEC handler is in place, so an early-boot trap there
would crash. Refactor the inline seed loop in fw_base.S into a
callable __stack_chk_guard_init function and invoke it from
init_coldboot() after sbi_hart_init() returns; the next commit makes
sbi_hart_init() install Smrnmi handlers and set NMIE=1, so by the time
__stack_chk_guard_init runs the trap path is safe.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 firmware/fw_base.S | 64 +++++++++++++++++++++++++++++-----------------
 lib/sbi/sbi_hart.c | 16 +++++++-----
 lib/sbi/sbi_init.c | 10 ++++++++
 3 files changed, 60 insertions(+), 30 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 043de7d7..ebecfecc 100644
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
@@ -895,6 +871,46 @@ __stack_chk_fail:
 	la	a0, .Lstack_corrupt_msg
 	call	sbi_panic
 
+	/*
+	 * Initialize __stack_chk_guard from the Zkr seed CSR. Called from C
+	 * after Smrnmi has been enabled (NMIE=1), so that a missing-Zkr
+	 * illegal-instruction trap is delivered to MTVEC normally and is
+	 * caught by our temporary MTVEC redirect below.
+	 */
+	.align 3
+	.globl __stack_chk_guard_init
+	.type __stack_chk_guard_init, %function
+__stack_chk_guard_init:
+	/* Save current MTVEC so we can restore it on return */
+	csrr	t6, CSR_MTVEC
+
+	/* Redirect MTVEC to local skip target for Zkr-not-supported case */
+	lla	t0, 1f
+	csrw	CSR_MTVEC, t0
+
+	li	t0, 0
+	li	t3, SEED_OPTS_ES16
+	li	t4, SEED_ENTROPY_MASK
+	li	t5, __SIZEOF_POINTER__
+2:
+	csrrw	t1, CSR_SEED, x0
+	li	t2, SEED_OPTS_MASK
+	and	t2, t2, t1
+	bgtu	t2, t3, 1f
+	bltu	t2, t3, 2b
+	and	t1, t1, t4
+	slli	t0, t0, 16
+	or	t0, t0, t1
+	addi	t5, t5, -2
+	bgtz	t5, 2b
+	lla	t1, __stack_chk_guard
+	REG_S	t0, 0(t1)
+	j	1f
+	.align 3
+1:
+	csrw	CSR_MTVEC, t6
+	ret
+
 	/* Initial value of the stack guard variable */
 	.section .data
 	.align 3
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4aefb759..781161e5 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -522,6 +522,16 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	hfeatures->mhpm_mask = 0;
 	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
 
+	/*
+	 * Parse device tree extensions early, before any trap-based checks.
+	 * Needed to detect Smrnmi and install NMI handlers before CSR probes
+	 * that may trigger traps.
+	 */
+	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
+					  hfeatures);
+	if (rc)
+		return rc;
+
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
 	if (!trap.cause) {						  \
@@ -676,12 +686,6 @@ __pmp_skip:
 
 #undef __check_csr_existence
 
-	/* Let platform populate extensions */
-	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
-					  hfeatures);
-	if (rc)
-		return rc;
-
 	/* Zicntr should only be detected using traps */
 	__sbi_hart_update_extension(hfeatures, SBI_HART_EXT_ZICNTR,
 			    sbi_hart_has_csr(scratch, SBI_HART_CSR_CYCLE) &&
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index aae035e1..644f62cb 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -36,6 +36,8 @@
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
 
+extern void __stack_chk_guard_init(void);
+
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
 	"  / __ \\                  / ____|  _ \\_   _|\n"  \
@@ -269,6 +271,14 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	/*
+	 * Initialize stack-guard canary now that hart_detect_features()
+	 * has enabled Smrnmi (NMIE=1). Done from a __noreturn function so
+	 * the canary mutation doesn't trip our own exit check. The asm
+	 * helper saves and restores MTVEC around its operation.
+	 */
+	__stack_chk_guard_init();
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
