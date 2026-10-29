Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0672D606A31E
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MbOATr2p;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TyDw2B0l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5ziD82Xmn24nfQjZuhh44S0NVRMRaGkyuc4f4Wf+7wE=; b=MbOATr2pSQu/4hoGjx7Ti5WOhs
	5Bj/Ic+kRC2io96dyQHtnq4mT/C8co+cc6cnFPpIfDoz8ZW5RJXKWuWZPiWWrG8T/psIlDwADLQY1
	SiY+SXMWVeyElmZHa4ym988LnUEDWJuwubo7KmD215GEmnGsv22y22WvZ7h5HW16an7s7SeJkEE1e
	qy+r0TphFM2AauVLY67VGQBx+wmBiPGkpvwubjSibdP2a9ZCGML0Q20ZxzgslIGsxB5pm5WoJcAvM
	zOYvepaisbtV+CsTtqSeZYg4Iaj8vMdChxKpzL3338DqcK0L4Lgiqd9Ds7O+14XbAvVYPyCPAsYpg
	Wcw1E17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXm-00000009iK6-1YfW;
	Thu, 29 Oct 2026 15:59:58 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXj-00000009iHM-3THQ
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 15:59:57 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-53664b4860bso25715561cf.1
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289594; x=1793894394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88ANDKxRYku3hwg9pkR3BHCQ5Jq6DJr1f47jG54acqc=;
        b=TyDw2B0lYTIAZk/bZDDoX9or8kMePDjGHdehaEsHq1WhX6enhUEsW6QsFnLZbtrn9I
         Dc47xohccyEcXIaP7zvSgqkLjxVH9vswFbtUlMj2f1A7/W3fJDImT1FtVX8ul+uVQNrd
         F66T6AkdoXO9OhWzKUdayffIGfvV8eq6Lpj00eTe9h4+yArxWmk56iQjxU/0msya5a0l
         1FiKcznm0E3cd6wpECRuWKDjzvbcnKsd9aAVjMjV8qyv6VxyBQDHPLYNyXfaE/C99Bfd
         UrokbEhN7HnttVWQhaFF1b+r6NcN22TdT6+v3sJJC7RQavIKrxmMEbh9LL31z7iQLORX
         SJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289594; x=1793894394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=88ANDKxRYku3hwg9pkR3BHCQ5Jq6DJr1f47jG54acqc=;
        b=I/rO+s8w2FQbasZgKd28TX9Unbg3kqwocnhHzV/Jxb5arsieKZWzZAA14gW7sVYHGU
         d1DHTBBxa8xSJ2GeUM89J/Tm73ZyAzZ9Mvl/ple02wBZjJwZENrueKmusHzm7V2OJdHz
         3UPYLdco2KczJpH5va93RBqz+5Tf0rOL3U0SkaceVym3HqSK0OaSeiFlYsF4VnRzFrRI
         02/2WiIyvFof4LENLB60qCtHLKGAIeMnjy9zKXD9+gXG1fJrLKbBrHovhYK3vZNlCB9a
         /nUIVdstxvScLCXFPm5kTMF3y+NC+gQdW6w75b2i0YPArneyoZoff10t65mr7wrAhMj0
         yRmw==
X-Gm-Message-State: AFq9FYLEghCA7pavH/yRRzlkl2LSvKQYPaeb2vPgWapg5jsvABQg4wIK
	ViPn+xZq20wZhKGvaCKJpi/xlaMNkgbCP0ECyl+QV25mwr7sRzMeuUuUA6O1+Q==
X-Gm-Gg: AYBFou3yqnuvc2gvYRHmNxSa4JSPHeJPrrDy2wuOf2qlV+/jzFZwyAq3HudoAStgqkf
	957FH1k4Y7OMy9EeGENivl3UYfbt4sKqm+vFke+bu62vZdL0ENUnsQpXPIH/sJX/MBQxNwdxs8W
	1/Y9qVfarEMjFj+TrPpKj/XLLxAhR3gNFnZBi2AIOoKTLUx71Ni0SNrtkOysonqCdECrpX27+o/
	+4XjQq58iUNNtqaEvygXe3mL1bdPqmAzIqQ/rlPMIvD0Tn3ktc7oiBg9KktD6T0Qw6gAPnXlALY
	dUFphG6C/dRv1+YOyapnnqszxSbBS/csb9DDtvZzVJQXY6rXZHKyHlDcfKC40SkjwW6JoBycTqY
	NiEl/Kn4fiDbA8LwBi3VULkXBnOqDJarcSJ5AygvQAk/reaiy9xYg7/uRgApQsY88I85iPmhLQV
	C5HrdgIhzZ/R8v1dus3uHHwuBH02TwLyz238QIF7Ely1LoV2JVF14SEfHs2Twpp5Uhi2Y9V38fb
	DlK4oUWA4x2EBPPSGrNEMehjFVqenexJ45Ft2po5RQFvHLCmYYW4myiYy+7JpDFTJVbLPdLHkxr
	1gm3kzJ5ZkW0dhYFs6mKU6mLw2TgcGuRifa7Du1ZoezTPuwgii/8tSZ5RtAxkX3LK9guxMqwASD
	po9v2ya8zqs7YAQ==
X-Received: by 2002:a05:622a:4d07:b0:536:6047:5223 with SMTP id d75a77b69052e-53fcc5ca98dmr89460471cf.49.1793289593744;
        Thu, 29 Oct 2026 08:59:53 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:59:53 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 04/12] lib: sbi: domain: support VIRQ couriering domain context switch
Date: Thu, 29 Oct 2026 11:59:21 -0400
Message-Id: <20261029155929.586597-5-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_085955_923372_0C1D43EC 
X-CRM114-Status: GOOD (  25.45  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raymond Mao <raymond.mao@riscstar.com>

Prerequisite adaptations for introducing VIRQ couriering domain
context switch.

MIDELEG:
- Save/restore MIDELEG in domain contexts and initialize per-domain
  defaults.

SEIP notification:
- Add virq_seip_notify flag, and use it to enable SEIP delegation
  for SEIP-notify domains.
- Add smode_notify_pending and helper function to store the S-mode
  notification status, and use it as a flag to fire the pending
  notification after domain context switch.

Return domain context switch:
- Add sbi_domain_context_exit_to_prev() to return to the previous
  domain without scanning for another candidate.
- Introduce per-hart deferred return flags and APIs to request/consume
  them.
- Perform the actual return-to-prev at the end of sbi_trap_handler()
  to avoid corrupting mepc during ecall handling.

Additionally, fix return domain-switch issues:
- When a domain switch occurs inside sbi_trap_handler(), return the
  switched-to trap context from scratch instead of the original trap
  entry context. This prevents the trap restore path from resuming with
  stale state from the previous domain.
- When returning to an S-mode target domain, copy the restored
  CSR_SSTATUS SIE/SPIE/SPP bits into trap_ctx->regs.mstatus. The final
  trap exit writes CSR_MSTATUS from the trap context, so stale mstatus
  bits can otherwise clear S-mode interrupt enable and leave a pending
  SEIP undelivered.
- Keep SEPC independent of the M-mode trap frame's MEPC and preserve
  the updated trap frame instead of replacing its return state with
  live CSRs. This prevents a resumed domain from repeating an ECALL
  whose result and advanced return PC have already been recorded.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_domain.h         |   2 +
 include/sbi/sbi_domain_context.h |  24 ++++++
 lib/sbi/sbi_domain_context.c     | 130 ++++++++++++++++++++++++++++++-
 lib/sbi/sbi_trap.c               |  11 +++
 4 files changed, 166 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 1f773e41..31cbe01e 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -219,6 +219,8 @@ struct sbi_domain {
 	bool system_suspend_allowed;
 	/** Identifies whether to include the firmware region */
 	bool fw_region_inited;
+	/** Whether to notify S-mode for VIRQ couriering */
+	bool virq_seip_notify;
 };
 
 /** The root domain instance */
diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
index 31a3a7f8..88450fcb 100644
--- a/include/sbi/sbi_domain_context.h
+++ b/include/sbi/sbi_domain_context.h
@@ -28,6 +28,30 @@ int sbi_domain_context_enter(struct sbi_domain *dom);
  */
 int sbi_domain_context_exit(void);
 
+/**
+ * Exit the current domain context and return to the previous context
+ * if one exists. This will not attempt to start other domains.
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_domain_context_exit_to_prev(void);
+
+void sbi_domain_context_request_return_to_prev(void);
+bool sbi_domain_context_need_return_to_prev(void);
+void sbi_domain_context_mark_switched(void);
+bool sbi_domain_context_consume_switched(void);
+
+/**
+ * Mark a pending S-mode notification for a target domain context.
+ *
+ * @param dom pointer to domain
+ * @param hartindex hart index
+ *
+ * @return true if notification was already pending, false otherwise
+ */
+bool sbi_domain_context_pending_notify_smode(struct sbi_domain *dom,
+					     u32 hartindex);
+
 /**
  * Initialize domain context support
  *
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 987ac7fa..fe7c3ede 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_domain.h>
@@ -44,6 +45,8 @@ struct hart_context {
 	unsigned long sip;
 	/** Supervisor address translation and protection register */
 	unsigned long satp;
+	/** Machine interrupt delegation register */
+	unsigned long mideleg;
 	/** Counter-enable register */
 	unsigned long scounteren;
 	/** Supervisor environment configuration register */
@@ -62,9 +65,13 @@ struct hart_context {
 	struct hart_context *prev_ctx;
 	/** Is context initialized and runnable */
 	bool initialized;
+	/** Pending S-mode notification to deliver after switch */
+	bool smode_notify_pending;
 };
 
 static struct sbi_domain_state dcstate;
+static unsigned long sbi_domain_defer_return_mask;
+static unsigned long sbi_domain_switched_mask;
 
 static inline struct hart_context *hart_context_get(struct sbi_domain *dom,
 						    u32 hartindex)
@@ -120,6 +127,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 
 	current_dom = ctx->dom;
 	target_dom = dom_ctx->dom;
+
 	/* Assign current hart to target domain */
 	spin_lock(&current_dom->assigned_harts_lock);
 	sbi_hartmask_clear_hartindex(hartindex, &current_dom->assigned_harts);
@@ -131,7 +139,12 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	sbi_hartmask_set_hartindex(hartindex, &target_dom->assigned_harts);
 	spin_unlock(&target_dom->assigned_harts_lock);
 
-	/* Save current CSR context and restore target domain's CSR context */
+	/*
+	 * Save current CSR context and restore target domain's CSR context.
+	 *
+	 * SEPC is the S-mode trap return PC, independent of the M-mode trap
+	 * frame's MEPC. Preserve it even when switching from an S-mode handler.
+	 */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
 	ctx->sie	= csr_swap(CSR_SIE, dom_ctx->sie);
 	ctx->stvec	= csr_swap(CSR_STVEC, dom_ctx->stvec);
@@ -141,6 +154,8 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	ctx->stval	= csr_swap(CSR_STVAL, dom_ctx->stval);
 	ctx->sip	= csr_swap(CSR_SIP, dom_ctx->sip);
 	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
+	if (misa_extension('S'))
+		ctx->mideleg = csr_swap(CSR_MIDELEG, dom_ctx->mideleg);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
@@ -163,8 +178,27 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
+	/* ECALL/SSE handlers may have updated the frame beyond the live CSRs. */
 	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
 	sbi_memcpy(trap_ctx, &dom_ctx->trap_ctx, sizeof(*trap_ctx));
+	if (target_dom->next_mode == PRV_S) {
+		trap_ctx->regs.mstatus &= ~MSTATUS_MPP;
+		trap_ctx->regs.mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
+		trap_ctx->regs.mstatus &= ~(SSTATUS_SIE | SSTATUS_SPIE |
+					    SSTATUS_SPP);
+		trap_ctx->regs.mstatus |= csr_read(CSR_SSTATUS) &
+					  (SSTATUS_SIE | SSTATUS_SPIE |
+					   SSTATUS_SPP);
+	}
+	/* Keep CSR_MEPC aligned with the active trap context */
+	csr_write(CSR_MEPC, trap_ctx->regs.mepc);
+
+	/* Deliver pending S-mode notification after switching context */
+	if (dom_ctx->smode_notify_pending) {
+		if (!sbi_irqchip_notify_smode_get())
+			sbi_irqchip_notify_smode_set();
+		dom_ctx->smode_notify_pending = false;
+	}
 
 	/*
 	 * Re-configure PMP settings for the new domain
@@ -190,6 +224,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		else
 			sbi_hsm_hart_stop(scratch, true);
 	}
+	sbi_domain_context_mark_switched();
 	return 0;
 }
 
@@ -222,6 +257,19 @@ static int hart_context_init(u32 hartindex)
 
 		/* Bind context and domain */
 		ctx->dom = dom;
+		/*
+		 * Default MIDELEG policy: root domain keeps SEI delegated;
+		 * non-root domains keep SEI delegated only when VIRQ uses
+		 * mip.SEIP for notification.
+		 */
+		if (misa_extension('S')) {
+			unsigned long mideleg = csr_read(CSR_MIDELEG);
+
+			if (dom == &root || dom->virq_seip_notify)
+				ctx->mideleg = mideleg | MIP_SEIP;
+			else
+				ctx->mideleg = mideleg & ~MIP_SEIP;
+		}
 		hart_context_set(dom, hartindex, ctx);
 	}
 
@@ -320,6 +368,86 @@ int sbi_domain_context_exit(void)
 	return switch_to_next_domain_context(ctx, dom_ctx);
 }
 
+int sbi_domain_context_exit_to_prev(void)
+{
+	struct hart_context *ctx = hart_context_thishart_get();
+	struct hart_context *dom_ctx;
+
+	if (!ctx)
+		return SBI_EINVAL;
+
+	dom_ctx = ctx->prev_ctx;
+	if (!dom_ctx)
+		return SBI_ENOENT;
+
+	/*
+	 * Returning to a previous domain implies it has already executed,
+	 * so its context is runnable even if not marked initialized.
+	 */
+	dom_ctx->initialized = true;
+
+	/* Clear prev context to avoid unintended re-entry */
+	ctx->prev_ctx = NULL;
+
+	return switch_to_next_domain_context(ctx, dom_ctx);
+}
+
+void sbi_domain_context_request_return_to_prev(void)
+{
+	sbi_domain_defer_return_mask |= (1UL << current_hartindex());
+}
+
+bool sbi_domain_context_need_return_to_prev(void)
+{
+	u32 hartindex = current_hartindex();
+	bool need = !!(sbi_domain_defer_return_mask & (1UL << hartindex));
+
+	if (need)
+		sbi_domain_defer_return_mask &= ~(1UL << hartindex);
+
+	return need;
+}
+
+void sbi_domain_context_mark_switched(void)
+{
+	sbi_domain_switched_mask |= (1UL << current_hartindex());
+}
+
+bool sbi_domain_context_consume_switched(void)
+{
+	u32 hartindex = current_hartindex();
+	bool switched = !!(sbi_domain_switched_mask & (1UL << hartindex));
+
+	if (switched)
+		sbi_domain_switched_mask &= ~(1UL << hartindex);
+
+	return switched;
+}
+
+bool sbi_domain_context_pending_notify_smode(struct sbi_domain *dom,
+					      u32 hartindex)
+{
+	struct hart_context *ctx;
+	bool already;
+
+	if (!dom)
+		return false;
+
+	ctx = hart_context_get(dom, hartindex);
+	if (!ctx) {
+		if (hart_context_init(hartindex))
+			return false;
+		ctx = hart_context_get(dom, hartindex);
+		if (!ctx)
+			return false;
+	}
+
+	already = ctx->smode_notify_pending;
+	ctx->smode_notify_pending = true;
+
+	return already;
+}
+
 int sbi_domain_context_init(void)
 {
 	/**
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 16774fd2..00905497 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -25,6 +25,7 @@
 #include <sbi/sbi_sse.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_domain_context.h>
 
 static void sbi_trap_error_one(const struct sbi_trap_context *tcntx,
 			       const char *prefix, u32 hartid, u32 depth)
@@ -373,6 +374,16 @@ trap_done:
 	if (sbi_mstatus_prev_mode(regs->mstatus) != PRV_M)
 		sbi_sse_process_pending_events(regs);
 
+	if (sbi_domain_context_need_return_to_prev())
+		sbi_domain_context_exit_to_prev();
+
+	if (sbi_domain_context_consume_switched()) {
+		struct sbi_trap_context *newctx = sbi_trap_get_context(scratch);
+
+		sbi_trap_set_context(scratch, newctx->prev_context);
+		return newctx;
+	}
+
 	sbi_trap_set_context(scratch, tcntx->prev_context);
 	return tcntx;
 }
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
