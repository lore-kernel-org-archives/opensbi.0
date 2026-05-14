Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12880CD4F25
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nw7Rsdee4EAadKqfJYIHNzi1DJztuuJsvONVjLCyZtc=; b=agdq6HAT9H0MEA
	NSUDXafuNRE8mLcT0WcOLQtD1ncY/wvB+oPM/meVTg4UNUychgKMrGqXtriKAhauH55AJjw9X4GX3
	Ozg+Ka7csZCiOOpRpdiU3iy1gl+tpl6tbPLAQUMWHba/9yb9XoMT3+Vep42A8aEvQCHvZgpRA1Lwx
	c1HT6T/nJEh3MXZM2ceS73wuyUdI10dqZlHfQAucBJn+H7JC1LRXVMS5dtxBpRnAF2Hzbr0X5QjMb
	PfElrmXlOeUbFxz3DsEa6lCg8w0VfK/VzRC1TJrvtmZFAsrCnoTIHgYkjHTWaRg60cd2V0ehAQhpB
	gwOc/Dv0+Kj/1+y9eD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0V-00000006lxY-3PzF;
	Thu, 14 May 2026 22:58:19 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0T-00000006lvm-09vz
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:18 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8b4000e51fdso86603546d6.1
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799495; x=1779404295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZofjDlsDtEkLaO21dzne2JuXWAUXaraTUHJW5dzK24=;
        b=Q2twj/Zi9GYGapGWLmVAhL6AF5Lb92YyPg+VdjaEXbPItQsEtKeG0SImTDZubPc3Ct
         qk8qSH2/kEttVe9QQNAGonJHK/G1FtOfXbtJp3MSvYXFqxcA+eqe8wsNs5WopvI8pbMl
         FTTTt/hLdKpYM8psymF3v6sfuwXeNuszWDGoyDVtlYJiiQdKAzFCLHwzPHKXSghA86Wu
         uaaC2RnckQx1myBJCitYBvR7KcP427E6tILdnINE8VzAlF716E6KFG845S/CCi+3Yt1o
         TdnW3zexHa6ZC4Na++lLjMNo6dPGpcUqhVz0q2Rs5UhrFbolKx3Vip+nqE1pUxt45oRG
         INdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799495; x=1779404295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZofjDlsDtEkLaO21dzne2JuXWAUXaraTUHJW5dzK24=;
        b=TCOETt7qdOHoeACpx2BlM2mLzVdeB/zYN7fjl7jxvgHTvwQeKrJBh8EsfAUVAT72yt
         UnpIuRflUfO6TTX9NViZT+BJciGDr39YkYbuOF68bp3GhANQ1p7l564S5APekF3UzRqc
         htIUfqWD8YKmHyul8NMZNpDjwLkvQEaNZEHv+tZPqxHMYPEbfYrikKahj/AnMFb4neIa
         P4Deslhi4RZop5iZq/qfxMSK4cIgE3w8TT/ZsCZMSTVRd7x8LPexwBM/C6BOZehTkNrw
         WlMawuwbn4YL8cjOglEmOwf7Qx8qkWhVlBhmQ04f8S7W1E77seV6cr8Ax8jadjuFG5zi
         2Ilw==
X-Gm-Message-State: AOJu0Yyn8WRUM5QfI9cbTU7RqXDTaq0TzWkt/s43EkfWf13BAx89emJj
	3nle5WWt73z4eFmRSXF8KwjFnRMioiGHrbYBDvgO0LrjDoHo4VPjk5vuEaQ/IQ==
X-Gm-Gg: Acq92OGAq+Zp1FqKj1/U/ihGQX441eSK0Wq/He+yU+pIg+NUVjxiE05+x7/dhdV0DYr
	qWAWM6SRF9LzyD1c5YQ13zMYSYVhKzy+jgcd3oaO0eF3wcRSM/iQtSoWNsI/RfuNHPk+Lb4z91f
	f8Gqi92T/eEdlJHu68nQ3SZ4/EHHBMQNe4+TvqvfMS7l6wKcppElksk+N7477/8dg26x72ZRABc
	0+VWtrLumEzBgrI5laSbXczLevngzhWkgSx7eqJ35A/+fkZw5DiuOvMdAR2+6l+dUOLxWgM7VOB
	17IaWNazgkVe+8XxWdjkWxshJPmYkrVMlk7N06SmmXJBuo3q9m+AhYWIthREsbs586G4i11/S8y
	JOXIG+cSN1Z1NJntLcZtdu/SXm3QpArDgz+QdsiQUGTXjR+BUvr0sej9bs09qR8gw+r3QDULrKx
	PLXwjG0m3ThnyB5A1CgoB32g3OumxeSGngHpJ9/JHJKZIxAK8JKmEe5Eo/PsUG2hNzYu6ho7KM1
	42RjuGvqIhfI8tLkSzVZA==
X-Received: by 2002:a05:6214:4784:b0:8c8:118e:c5fd with SMTP id 6a1803df08f44-8ca0f6cba4dmr27126156d6.48.1778799495471;
        Thu, 14 May 2026 15:58:15 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:15 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 02/10] lib: sbi: domain: adaptation for supporting VIRQ couriering domain context switch
Date: Thu, 14 May 2026 18:57:48 -0400
Message-Id: <20260514225756.2255758-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155817_113429_5AFF13D7 
X-CRM114-Status: GOOD (  24.38  )
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

Additionally, fix two return domain-switch protential issues:
- When a domain switch occurs inside sbi_trap_handler(), return the
  switched-to trap context from scratch instead of the original trap
  entry context. This prevents the trap restore path from resuming with
  stale state from the previous domain.
- When returning to an S-mode target domain, copy the restored
  CSR_SSTATUS SIE/SPIE/SPP bits into trap_ctx->regs.mstatus. The final
  trap exit writes CSR_MSTATUS from the trap context, so stale mstatus
  bits can otherwise clear S-mode interrupt enable and leave a pending
  SEIP undelivered.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_domain.h         |   2 +
 include/sbi/sbi_domain_context.h |  24 +++++
 lib/sbi/sbi_domain_context.c     | 152 ++++++++++++++++++++++++++++++-
 lib/sbi/sbi_trap.c               |  16 ++++
 4 files changed, 192 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 16edd4ce..c507023c 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -217,6 +217,8 @@ struct sbi_domain {
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
index 158f4990..ee84b2f1 100644
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
@@ -42,6 +43,8 @@ struct hart_context {
 	unsigned long sip;
 	/** Supervisor address translation and protection register */
 	unsigned long satp;
+	/** Machine interrupt delegation register */
+	unsigned long mideleg;
 	/** Counter-enable register */
 	unsigned long scounteren;
 	/** Supervisor environment configuration register */
@@ -55,9 +58,13 @@ struct hart_context {
 	struct hart_context *prev_ctx;
 	/** Is context initialized and runnable */
 	bool initialized;
+	/** Pending S-mode notification to deliver after switch */
+	bool smode_notify_pending;
 };
 
 static struct sbi_domain_data dcpriv;
+static unsigned long sbi_domain_defer_return_mask;
+static unsigned long sbi_domain_switched_mask;
 
 static inline struct hart_context *hart_context_get(struct sbi_domain *dom,
 						    u32 hartindex)
@@ -126,16 +133,32 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	sbi_hart_protection_unconfigure(scratch);
 	sbi_hart_protection_configure(scratch);
 
-	/* Save current CSR context and restore target domain's CSR context */
+	/*
+	 * Save current CSR context and restore target domain's CSR context.
+	 *
+	 * If the trap came from S-mode (MPP=S), MEPC holds the S-mode return
+	 * point. In that case, save MEPC as the SEPC for the current domain
+	 * so returning resumes correctly after a VIRQ-driven domain switch.
+	 */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
 	ctx->sie	= csr_swap(CSR_SIE, dom_ctx->sie);
 	ctx->stvec	= csr_swap(CSR_STVEC, dom_ctx->stvec);
 	ctx->sscratch	= csr_swap(CSR_SSCRATCH, dom_ctx->sscratch);
-	ctx->sepc	= csr_swap(CSR_SEPC, dom_ctx->sepc);
+	{
+		unsigned long cur_sepc = csr_read(CSR_SEPC);
+
+		if (((csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
+		     MSTATUS_MPP_SHIFT) == PRV_S)
+			cur_sepc = csr_read(CSR_MEPC);
+		ctx->sepc = cur_sepc;
+		csr_write(CSR_SEPC, dom_ctx->sepc);
+	}
 	ctx->scause	= csr_swap(CSR_SCAUSE, dom_ctx->scause);
 	ctx->stval	= csr_swap(CSR_STVAL, dom_ctx->stval);
 	ctx->sip	= csr_swap(CSR_SIP, dom_ctx->sip);
 	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
+	if (misa_extension('S'))
+		ctx->mideleg = csr_swap(CSR_MIDELEG, dom_ctx->mideleg);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
@@ -146,7 +169,38 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
 	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
+	if (((csr_read(CSR_MSTATUS) & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) ==
+	    PRV_S) {
+		/* Preserve S-mode return PC in the saved trap context */
+		ctx->trap_ctx.regs.mepc = ctx->sepc;
+	}
+	/* Ensure M-mode trap context fields are refreshed */
+	ctx->trap_ctx.regs.mepc = csr_read(CSR_MEPC);
+	ctx->trap_ctx.regs.mstatus = csr_read(CSR_MSTATUS);
 	sbi_memcpy(trap_ctx, &dom_ctx->trap_ctx, sizeof(*trap_ctx));
+	if (((csr_read(CSR_MSTATUS) & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) ==
+	    PRV_S) {
+		/* Ensure target trap context returns to its S-mode PC */
+		trap_ctx->regs.mepc = dom_ctx->sepc;
+	}
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
 
 	/* Mark current context structure initialized because context saved */
 	ctx->initialized = true;
@@ -163,6 +217,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		else
 			sbi_hsm_hart_stop(scratch, true);
 	}
+	sbi_domain_context_mark_switched();
 	return 0;
 }
 
@@ -182,6 +237,19 @@ static int hart_context_init(u32 hartindex)
 
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
 
@@ -271,6 +339,86 @@ int sbi_domain_context_exit(void)
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
index f41db4d1..79d9ca5a 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -24,6 +24,7 @@
 #include <sbi/sbi_sse.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_domain_context.h>
 
 static void sbi_trap_error_one(const struct sbi_trap_context *tcntx,
 			       const char *prefix, u32 hartid, u32 depth)
@@ -372,6 +373,21 @@ trap_done:
 	if (sbi_mstatus_prev_mode(regs->mstatus) != PRV_M)
 		sbi_sse_process_pending_events(regs);
 
+	if (sbi_domain_context_need_return_to_prev()) {
+		int rc = sbi_domain_context_exit_to_prev();
+
+		if (rc && rc != SBI_ENOENT)
+			sbi_printf("return_to_prev failed, rc=%d\n",
+				   rc);
+	}
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
