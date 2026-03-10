Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1565DFD4F16
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 18:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tvu1eBzi8CnONjjmLIftGxr1BY9rf5zN17bdkKrG2Kk=; b=bKPP+a3iawwbPA
	oO5hIQYMFQIsT8pf+3EOc2Fkeqed/juhzWiy+/jFigJyYMx9hQQhahMX0pL85f//x5dNTScV8IRbH
	RXvLH4F/fX9YZzdavKl+GyTHenRuDGy1JIZ4hzdGFOYzs2HvugPPpfvdL2gxyjBX0sVwjItbtxheP
	Hy2XVXEoTeZXbc6zVCaaFQHaYn7omoW9ZeG5Z8bWNWH5ZRZv7szxJ3Jx93xBO9Ar3DaiMS2MtpoYT
	2F2afVuXIEMhK6OUlrmpr/IyvLYz0CRQSoBwcOebgLCzg35iNU7jMwtCctt1SYmnQL+r3OqFjEh0d
	fy5j7dm2fN5+eH8Wx8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01ta-0000000A58Q-32nW;
	Tue, 10 Mar 2026 18:33:30 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tX-0000000A560-3mPF
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 18:33:29 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2b8095668ebso910820eec.2
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1773167606; x=1773772406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/2HtEtiKpIzI1Bd3m76mm7E6chchFSRMuMQKlU/TFQ=;
        b=Vfe5xaBKJWfqc0/jJ2Vq0M3YTCVJGVYqBtgShCxBRZkdsxU7GFZIbqnv/z1olWYA54
         DfGp81INfPCoMNGjuMA6KWqaXzuWp94zioGecGmRQy9x7xz9SpBxsfmtIAGamKmRrzm8
         8yS9kZVUo5lIuHL87+h8PWduOt+yhkv68sZtUKOqAuCiYMC7/OXBNcCYX/64EJFLv03V
         ToecO0b3PZBsY3sh3vaRD3rWjCJb5HJ46esjZBcpO1m9wj5YlD/ZiVjmakNJbkiGzOii
         6tfMvMXyLPkKxYqBWKMUctDSV2DpnCLgVeLv9utqyq+vNnubIrNJYh14F2Nya+8MJKM4
         BvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167606; x=1773772406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d/2HtEtiKpIzI1Bd3m76mm7E6chchFSRMuMQKlU/TFQ=;
        b=ZaBwhmpAWYu+dqZUg0lPeILHtxWkKGrs8TwSiopOqvPOZbo394tEDqRcYg6mSm7yKT
         lAROT93CNE75HIK1SnkDx8otA1OIsRjqbnH+p4hRfiiQL3qD9A6zuChxFLWaAqipRf1O
         5Tp9qXzynySlyIYSN83y9/EPEGhvXzZOTnsz6gmgAGGzIqsuSzLvQwiNnL4sM7BMaIRk
         tQmeqOAZ0Prmt3qNhQqFtqjFbPxRhS3Klj1ZL6P9gfh94qf1gpBkG3sd3DNvBdNdMzSs
         De3OqXHyD2SNx76ZHiClW0fHDrdOIAUQ4OG1mm269de4R4mg4T5tQktMOuaakqVyi81Z
         FJow==
X-Gm-Message-State: AOJu0YwO3fYdFMf+p5dTX5VVqNYBYTZp3AmtsD4dhJUrI/yRPBFA9D16
	zciUz99VBXwRX8Du+MSMrC7PrsUd6LNuqIoNBo3w1P/oqHL2TvUzqv5BE5jSzrwi0Ka/TMvUB/P
	7q/dRMUk=
X-Gm-Gg: ATEYQzz4zvdqm73DcO4H+5ve130PsDgCI2KkV/IrGjpLZCGvavx4SlPfeQCp4sE5fsZ
	20QwLEH9h55EO8BzZ4uiRCbC16aHyVwqI7oaSt4FxJ4AAi3jBCiMi1v3AtrLLuF3mwEtWz2nEAu
	uFdS4CPXuTVIhodi2KytuLqKPWMfFCTWocbcHLY3cmclQE8jOJQeSfz/d/HZG1o11FNtDUKQwwX
	PFJeAq4dLUP+y9RDShkR3RjSLRQDmyrD0EqcQZ8GE47asFnjQG3UxFSytjpqgLuJYAqDMkh4gr8
	xAyYANVC+DVzD3u+W6tOPU9AkpLhkRRA9+/cVR4khEFjE8ePckt/ZycrTHmgZOrJdhYEG+oUgd9
	WVKfLM0zwpKfNZvRpmY8JGMFOZtVuF8uv3tx33aDoohexWPt/Q5NuVBWV0ZCqttcY6EO626SWag
	+04g77CUUKY3wvO6qQTUvQSB/YgLE=
X-Received: by 2002:a05:7300:af06:b0:2b7:e929:856b with SMTP id 5a478bee46e88-2be4e0f0d27mr2999638eec.5.1773167606451;
        Tue, 10 Mar 2026 11:33:26 -0700 (PDT)
Received: from localhost ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa3fsm14123015eec.24.2026.03.10.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:33:26 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Google-Original-From: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@oss.tenstorrent.com,
	Evgeny Voevodin <evvoevod@tenstorrent.com>
Subject: [PATCH 3/7] firmware: Add RNMI/RNME handler infrastructure
Date: Tue, 10 Mar 2026 18:31:51 +0000
Message-ID: <20260310183155.2186463-4-evvoevod@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113327_953028_B4458FF0 
X-CRM114-Status: GOOD (  17.65  )
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

From: Evgeny Voevodin <evvoevod@tenstorrent.com>

Implement basic Resumable NMI (RNMI) and Resumable NMI Exception (RNME) handler
support for the RISC-V Smrnmi extension.

The RNME handler allows platforms to optionally handle exceptions occurring with
MNSTATUS.NMIE=0. If a platform provides an rnme_handler callback and
successfully handles the exception, execution is resumed. Otherwise, the
exception is treated as a critical failure requiring immediate halt with
diagnostic output.

The RNMI handler reuses the generic trap context structure but stores MN* CSR
values (MNEPC, MNSTATUS, MNCAUSE) into the corresponding generic fields
(mepc, mstatus, cause) for compatibility with existing trap infrastructure.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 firmware/fw_base.S         | 156 +++++++++++++++++++++++++++++++++++++
 include/sbi/sbi_platform.h |   9 +++
 include/sbi/sbi_trap.h     |   4 +
 lib/sbi/sbi_trap.c         |  70 +++++++++++++++++
 4 files changed, 239 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index cdb15429..727fc17f 100644
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
 
+.macro	TRAP_CALL_C_RNME_ROUTINE
+	/* Call C routine */
+	add	a0, sp, zero
+	call	sbi_rnme_handler
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
@@ -724,6 +814,72 @@ _trap_handler_hyp:
 
 	mret
 
+	.section .entry, "ax", %progbits
+	.align 3
+	.globl _rnmi_handler
+_rnmi_handler:
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
+	/* Call platform RNMI handler (returns tcntx in a0) */
+	add	 a0, sp, zero
+	call sbi_rnmi_handler
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
+	.section .entry, "ax", %progbits
+	.align 3
+	.globl _rnme_handler
+_rnme_handler:
+	/*
+	 * When SMRNMI extension is present, handles exceptions that occur while
+	 * NMIE=0
+	 * This can happen during early boot or during NMI handling
+	 */
+
+	/*
+	 * Save context using regular M-mode trap CSRs
+	 * RNME is a normal M-mode trap that happens when NMIE=0
+	 * Uses MSCRATCH/TMP0 (not MNSCRATCH/TMP1) to avoid conflict with NMI handler
+	 */
+	TRAP_SAVE_AND_SETUP_SP_T0
+	TRAP_SAVE_MEPC_MSTATUS 0
+	TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0
+	TRAP_SAVE_INFO 0 0
+
+	/* Call platform RNME exception handler (returns tcntx in a0) */
+	TRAP_CALL_C_RNME_ROUTINE
+
+	/* Restore context using regular M-mode trap CSRs */
+	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
+
+	TRAP_RESTORE_MEPC_MSTATUS 0
+
+	TRAP_RESTORE_A0_T0
+
+	/* mret - return from exception */
+	mret
+
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _reset_regs
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index e65d9877..b67a5647 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -149,6 +149,15 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+
+	/** platform specific Smrnmi exception handler.
+	 *  Returns SBI_SUCCESS on success, error code if exception cannot be
+	 *  handled. */
+	int (*rnme_handler)(struct sbi_trap_context *tcntx);
+
+	/** platform specific Smrnmi NMI handler.
+	 *  Returns SBI_SUCCESS on success, error code if NMI cannot be handled. */
+	int (*rnmi_handler)(struct sbi_trap_context *tcntx);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 731a0c98..a69c0fe3 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -289,6 +289,10 @@ static inline void sbi_trap_set_context(struct sbi_scratch *scratch,
 
 struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx);
 
+struct sbi_trap_context *sbi_rnme_handler(struct sbi_trap_context *tcntx);
+
+struct sbi_trap_context *sbi_rnmi_handler(struct sbi_trap_context *tcntx);
+
 #endif
 
 #endif
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f41db4d1..5f950009 100644
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
@@ -375,3 +376,72 @@ trap_done:
 	sbi_trap_set_context(scratch, tcntx->prev_context);
 	return tcntx;
 }
+
+/**
+* Resumable NMI Exception (RNME) handler
+*
+* Called when exception occurs with MNSTATUS.NMIE=0.
+*
+* @param tcntx Trap context (saved on NMI stack)
+* @return Never returns - always hangs
+*/
+struct sbi_trap_context *sbi_rnme_handler(struct sbi_trap_context *tcntx)
+{
+	int rc;
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
+
+	/* Call platform-specific exception handler if registered */
+	if (ops && ops->rnme_handler) {
+		rc = ops->rnme_handler(tcntx);
+		if (!rc) {
+			/* Platform handler indicated success on handling an exception */
+			return tcntx;
+		}
+	}
+
+	/* Print diagnostics and hang */
+	sbi_trap_error("critical: exception with NMIE=0 (RNME)", SBI_EFAIL, tcntx);
+
+	/* sbi_trap_error() never returns, but satisfy compiler */
+	sbi_hart_hang();
+	return tcntx;
+}
+
+/**
+ * Default Resumable NMI (RNMI) handler
+ *
+ * This function is called from the _rnmi_handler assembly code.
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
+struct sbi_trap_context *sbi_rnmi_handler(struct sbi_trap_context *tcntx)
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
