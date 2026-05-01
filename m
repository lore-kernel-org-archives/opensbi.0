Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00758CD3423
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NouALa7ID8FnUY7nW66qqNU/vTiloi7sffnaiMnkpE=; b=1P4psgszabCk5F
	SC/Uck4V5yqdOdof+RYgwR1MRXvqaMrSF0ZP2yH7PNXlw72oaHr6TR7LSvF5Thi02xlWoLOfOQQQ5
	c6649eyTSl1NHlbDwrovkYYs/CSnmUbPFgz2DuUC23rQIye8zP+ylYb1YGs98H6FuQgm5MhEFeRCi
	0ymoQWvT4ewCccexfWfxAzwIIGUr75PsrOE7iAW7I+jpvuLZQr164nN0cCreXYb5tVpLXfdCEjWoV
	MzZpdtXUxduB0VOdeAN1EjzdFVNs7xSUvze4bhpyLeWpguhJCbiJoPAUHmVQgy6N978H/iBdrW4xx
	j+DpZlkXF8adlzNo4EJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE7-00000007gqq-3jJj;
	Fri, 01 May 2026 21:16:47 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE5-00000007gom-1LL0
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 21:16:46 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2e92c54ba73so253484eec.2
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 14:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1777670204; x=1778275004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMlplG3RmIZy1wU5TBqeECBoqJCA6QKBwBvjSdii0fA=;
        b=MkkFOuc8M/O/5XQYmoSSqdlqMH1/96Yr+jGnc0pmgcXlneGeyvdIuKMKZKKCzAb4oO
         dbQDlGTvoCgij12zUdqkSdF+nT24Kpz8KIOuqbbTjBuCPGslEUWOhhxxorEvZ0mhYiMg
         sMG4ebhbNR9ZxG6HG4WqKRXWXixEQ6q+ALr6MHC3nJ4WzyB+Q/tW0gqBprzHmASqMzju
         /XF4FQKUGIE3pQr8cheYeGhwBNyd1rUSJoM8tOhPWe9HaY7l+Y7iO9i204Lzn8ZYeNb3
         50ho8e0YRhxqhyxTMWgYg8ijjIAQ0ChNCdjPy6kQPPfWeF6g4ZHqMwUGdblHlkbHCnsQ
         GrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670204; x=1778275004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sMlplG3RmIZy1wU5TBqeECBoqJCA6QKBwBvjSdii0fA=;
        b=VFyt3n5E64UmJ9I5aGHLEMSUWH29bMO86QUKHUzUusp1Sx+GYgsxzNaFly9w/ZGJzW
         FMnX0X9CpOo7x8S3lspe1b1JaeV6FLDhdEllQJNqJdnn87flDpb4wcgCz6NRtLzIJ2EC
         obDIlnnwT6OqxxLMCIeSnGuYy8l07o2IBvUScDRq0FUJCfz5khbwHk4ZxXrZ7mMyCE8a
         6bOssjvbeopIKIPjDYqrYqh9kwEcAOIsiHjJWOsNFuWvSgOctmRBBb23/bh49DJ9QWRc
         X7+MBmNu/NoR4fmMS/2JsLihg3CfqWUDbyD1ns08S5ZF8yjX7DAzo5lNuCitfYhK9jnh
         67mg==
X-Gm-Message-State: AOJu0YxBSo/sSvP1LsGLYugRhmbyzEDqD7ijiypQSC/gTi3GmCBOZyQo
	fR7mt15Az8hNQ2Vpnz5tDgu3H6+QjjXml+j1VoqmXmdcvOGEZsjapxyR2wQ9fsvSSlwArGlVmt7
	pRTUU
X-Gm-Gg: AeBDieuqBQVtgJIxuE3OVSHFZSbaeidHF490jra+kYsFrLniWbb6dRNa+ue4N5TKbrp
	8KcYqgLCmhVnxEyL7gzyzC05xJBriLhYhG5PClMHJ4E4NKj9KmIiq9uPc8bCMV6B4/K68zL7TSu
	K6poVezGOgHRyXngtwcyjTOSyzAZewiqz1FJlPHE93UtW9JjVaFKkMBhh7LWABrCv4LmHUsFB+0
	J9GHpkj/zJVBLJ15939nESTqyyOkYhPTL12JUChb5G8qWPJge/J8GzLsYjUubQfXxoMoxJHNlEf
	T99O57MJeE0SalfsHvrCnxm2rkn83nqoOnUxwiLiUg2OldnHstHymmsVQpGg1JrAZKtFC6ilOWD
	4d3heZxq/D4iK0g2Ox+kon6Xcx0R95gdWU/anIlBEE6eIXABAAcY3/CEOR6w0QWdgIP0wNDTT4g
	3bajPJOR9iV8ivUkdcd1Nu9rspn8akfjZEKWrd5ECoBFdcJhxhr3V9+ycSee5V
X-Received: by 2002:a05:7300:5bac:b0:2c4:acef:291a with SMTP id 5a478bee46e88-2efb9c88feemr203438eec.4.1777670204003;
        Fri, 01 May 2026 14:16:44 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2casm5879308eec.14.2026.05.01.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 14:16:43 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v2 3/5] firmware: Add RNMI handler infrastructure
Date: Fri,  1 May 2026 21:16:25 +0000
Message-ID: <20260501211627.3293126-4-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
References: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_141645_365767_877FD9B5 
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

Implement basic Resumable NMI (RNMI) handler support for the RISC-V
Smrnmi extension.

The new _trap_rnmi_handler assembly entry point saves context using the
Smrnmi MN* CSRs (MNSCRATCH, MNEPC, MNSTATUS, MNCAUSE) and returns via
mnret. It dispatches to sbi_trap_rnmi_handler(), which optionally calls
a platform-specific ops->rnmi_handler callback for actual NMI
processing. If no platform handler is registered or it fails, the
event is reported as an unhandled NMI.

The RNMI handler reuses the generic trap context structure but stores MN*
CSR values (MNEPC, MNSTATUS, MNCAUSE) into the corresponding generic
fields (mepc, mstatus, cause) for compatibility with existing trap
infrastructure.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 firmware/fw_base.S         | 121 +++++++++++++++++++++++++++++++++++++
 include/sbi/sbi_platform.h |   4 ++
 include/sbi/sbi_trap.h     |   2 +
 lib/sbi/sbi_trap.c         |  39 ++++++++++++
 4 files changed, 166 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index cdb15429..043de7d7 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -529,6 +529,45 @@ memcmp:
 	csrrw	tp, CSR_MSCRATCH, tp
 .endm
 
+.macro	TRAP_SAVE_AND_SETUP_SP_T0_NMI
+	/* Swap TP and MNSCRATCH (for RNMI) */
+	csrrw	tp, CSR_MNSCRATCH, tp
+
+	/* Save T0 in scratch space */
+	REG_S	t0, SBI_SCRATCH_TMP1_OFFSET(tp)
+
+	/*
+	 * Set T0 to appropriate exception stack
+	 *
+	 * Came_From_M_Mode = ((MNSTATUS.MNPP < PRV_M) ? 1 : 0) - 1;
+	 * Exception_Stack = TP ^ (Came_From_M_Mode & (SP ^ TP))
+	 */
+	csrr	t0, CSR_MNSTATUS
+	srl	t0, t0, 11		/* MNPP is at bits 11-12 */
+	and	t0, t0, PRV_M
+	slti	t0, t0, PRV_M
+	add	t0, t0, -1
+	xor	sp, sp, tp
+	and	t0, t0, sp
+	xor	sp, sp, tp
+	xor	t0, tp, t0
+
+	/* Save original SP on exception stack */
+	REG_S	sp, (SBI_TRAP_REGS_OFFSET(sp) - SBI_TRAP_CONTEXT_SIZE)(t0)
+
+	/* Set SP to exception stack and make room for trap context */
+	add	sp, t0, -(SBI_TRAP_CONTEXT_SIZE)
+
+	/* Restore T0 from scratch space */
+	REG_L	t0, SBI_SCRATCH_TMP1_OFFSET(tp)
+
+	/* Save T0 on stack */
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+
+	/* Swap TP and MNSCRATCH */
+	csrrw	tp, CSR_MNSCRATCH, tp
+.endm
+
 .macro	TRAP_SAVE_MEPC_MSTATUS have_mstatush
 	/* Save MEPC and MSTATUS CSRs */
 	csrr	t0, CSR_MEPC
@@ -543,6 +582,20 @@ memcmp:
 	.endif
 .endm
 
+.macro	TRAP_SAVE_MNEPC_MNSTATUS have_mstatush
+	/*
+	 * Save MNEPC and MNSTATUS CSRs (for RNMI)
+	 * Note: Trap context structure has generic field names (mepc, mstatus),
+	 * we store MN* CSR values into these same structure fields.
+	 */
+	csrr	t0, CSR_MNEPC
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mepc)(sp)
+	csrr	t0, CSR_MNSTATUS
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mstatus)(sp)
+	/* MNSTATUSH doesn't exist in SMRNMI spec */
+	REG_S	zero, SBI_TRAP_REGS_OFFSET(mstatusH)(sp)
+.endm
+
 .macro	TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0
 	/* Save all general regisers except SP and T0 */
 	REG_S	zero, SBI_TRAP_REGS_OFFSET(zero)(sp)
@@ -606,12 +659,36 @@ memcmp:
 	CLEAR_MDT t0
 .endm
 
+.macro	TRAP_SAVE_NMI_INFO
+	/*
+	 * Save NMI trap info (MNCAUSE, no MNTVAL in spec)
+	 * Note: Trap info structure has generic field names (cause, tval, etc.),
+	 * we store MN* CSR values into these same structure fields.
+	 */
+	csrr	t0, CSR_MNCAUSE
+	REG_S	t0, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(cause))(sp)
+	/* MNTVAL doesn't exist in SMRNMI spec */
+	REG_S	zero, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(tval))(sp)
+	REG_S	zero, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(tval2))(sp)
+	REG_S	zero, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(tinst))(sp)
+	REG_S	zero, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(gva))(sp)
+
+	/* We are ready to take another trap, clear MDT */
+	CLEAR_MDT t0
+.endm
+
 .macro	TRAP_CALL_C_ROUTINE
 	/* Call C routine */
 	add	a0, sp, zero
 	call	sbi_trap_handler
 .endm
 
+.macro	TRAP_CALL_C_RNMI_ROUTINE
+	/* Call C routine */
+	add	a0, sp, zero
+	call	sbi_trap_rnmi_handler
+.endm
+
 .macro	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
 	/* Restore all general regisers except A0 and T0 */
 	REG_L	ra, SBI_TRAP_REGS_OFFSET(ra)(a0)
@@ -660,6 +737,19 @@ memcmp:
 	csrw	CSR_MEPC, t0
 .endm
 
+.macro	TRAP_RESTORE_MNEPC_MNSTATUS
+	/*
+	 * Restore MNSTATUS and MNEPC CSRs (for RNMI)
+	 * Note: Load from generic structure fields (mstatus, mepc) and
+	 * restore to NMI-specific CSRs (MNSTATUS, MNEPC).
+	 * No MNSTATUSH in SMRNMI spec.
+	 */
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
+	csrw	CSR_MNSTATUS, t0
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
+	csrw	CSR_MNEPC, t0
+.endm
+
 .macro TRAP_RESTORE_A0_T0
 	/* Restore T0 */
 	REG_L	t0, SBI_TRAP_REGS_OFFSET(t0)(a0)
@@ -724,6 +814,37 @@ _trap_handler_hyp:
 
 	mret
 
+	.section .entry, "ax", %progbits
+	.align 3
+	.globl _trap_rnmi_handler
+_trap_rnmi_handler:
+	/*
+	 * NMI interrupt handler using MN* CSRs
+	 *
+	 * Context detection via MNPP (previous privilege mode):
+	 * - If MNPP < M-mode: use exception stack (TP)
+	 * - If MNPP == M-mode: use current stack (SP)
+	 * This handles nested interrupt cases.
+	 */
+	TRAP_SAVE_AND_SETUP_SP_T0_NMI
+
+	TRAP_SAVE_MNEPC_MNSTATUS 0
+
+	TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0
+
+	TRAP_SAVE_NMI_INFO
+
+	TRAP_CALL_C_RNMI_ROUTINE
+
+	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
+
+	TRAP_RESTORE_MNEPC_MNSTATUS
+
+	TRAP_RESTORE_A0_T0
+
+	/* mnret - return from NMI (SMRNMI extension) */
+	.word 0x70200073
+
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _reset_regs
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index e65d9877..715df499 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -149,6 +149,10 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+
+	/** platform specific Smrnmi NMI handler.
+	 *  Returns SBI_SUCCESS on success, error code if NMI cannot be handled. */
+	int (*rnmi_handler)(struct sbi_trap_context *tcntx);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 731a0c98..091a2446 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -289,6 +289,8 @@ static inline void sbi_trap_set_context(struct sbi_scratch *scratch,
 
 struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx);
 
+struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx);
+
 #endif
 
 #endif
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f41db4d1..1e55b885 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -20,6 +20,7 @@
 #include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_trap_ldst.h>
 #include <sbi/sbi_pmu.h>
+#include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_sse.h>
 #include <sbi/sbi_timer.h>
@@ -375,3 +376,41 @@ trap_done:
 	sbi_trap_set_context(scratch, tcntx->prev_context);
 	return tcntx;
 }
+
+/**
+ * Default Resumable NMI (RNMI) handler
+ *
+ * This function is called from the _trap_rnmi_handler assembly code.
+ * It provides a simple wrapper that calls the platform-specific
+ * NMI handler if registered. If no handler is registered, it prints
+ * diagnostic information and hangs, similar to unhandled traps.
+ *
+ * Note: The trap context stores NMI CSR values (MNCAUSE, MNEPC, MNSTATUS)
+ * in the generic trap context fields (cause, mepc, mstatus).
+ *
+ * @param tcntx Pointer to trap context (saved on stack)
+ * @return Same trap context pointer (needed for restore macros)
+ */
+struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx)
+{
+	int rc;
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
+
+	/* Call platform-specific NMI handler if registered */
+	if (ops && ops->rnmi_handler) {
+		rc = ops->rnmi_handler(tcntx);
+		if (rc) {
+			/* Platform handler failed to handle NMI */
+			sbi_trap_error("platform NMI handler failed", rc, tcntx);
+		}
+		return tcntx;
+	}
+
+	/* No platform handler - treat as unhandled NMI */
+	sbi_trap_error("unhandled NMI (no platform rnmi_handler)",
+		       SBI_ENOTSUPP, tcntx);
+
+	/* Never returns */
+	return tcntx;
+}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
