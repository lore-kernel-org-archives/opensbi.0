Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B12CD13D2
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XeF62DrnqKCVYF46Xun9+MAG0kkRBFvv82Z/68yWyo=; b=ZMe9uT0aqMNxp7
	hhM53bmVYZbVVuIMG5AJY2NZEHgCOalrPDQ85yiwW16mONSR3OM7mwBqTnl7RZhF39ots+F41jYaT
	thGwMSir0ARgd1OOzfcdiPPgKJ2XGKYOV4yJwjEu686Uu2uwQiWIyy1fM/sANlPvMtC1rhOF1dzeY
	euHkamsDotqaN6UsTWINDfPKVVjR+xTtUt+zuGnyBO9+v5/gDCOngwijKBRJxc1f9R+EShZI7Jlb6
	qaNFpL+eqVCCVJ7a+MCUYqxNqFJcbwlun20nbbWtACH1zmaMgs6jqHwAHReqhSx3WTgzjMgzNgeZ+
	BS+Evw7B+gsG2rrWRzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYW-00000005BkD-1086;
	Thu, 30 Apr 2026 10:23:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYU-00000005Bjv-3SX6
	for opensbi@bombadil.infradead.org;
	Thu, 30 Apr 2026 10:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8BgGYh3OdD8cFpgNoQy0g+rCyOpzePwhfsUs3zFLRGw=; b=CqvDW4pfBfxHuszPn+vXeVWk4k
	+jodopOc6SYgoMjDpXTyJNZKg2d04r4tXhChKLMbEhs7ybXH5gwjLSHd40KmrdvGZIHoakmS2wHSs
	RM+aH+9q1zLR4eBCAi6UKPgm1zyUINofa8eadjvVowqkbzbacgjN7gEqgwpqxHnFEwTVvcoDvffbQ
	e0KNbBXqoeBlYfNgyYPAQNE9ttF6tpMJJ+ThQKE6MZRjDK1oX2xinen1DPfXyERz6xCGkZ4n01Rnp
	VZH91BmDB8MhPsH+9zpWc3VTcfMv3YSDmUVfa1fflTp+9D3mHEHgF+fmBuhcm0YxlNHUZRLQwPYB3
	e4t0+nIw==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYR-000000077NN-27jo
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 10:23:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso452510a91.2
        for <opensbi@lists.infradead.org>; Thu, 30 Apr 2026 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777544613; x=1778149413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BgGYh3OdD8cFpgNoQy0g+rCyOpzePwhfsUs3zFLRGw=;
        b=DU7NktAZ4U8te3/EOkTWPOf1tgcw0Jx0uY0bTB8mITb+uXmH0OBE7w9OgftuUJ3y6T
         ClVHVgTNjGfUt2OxDIqHfZXtUoro75VA8tis+4U9QgOy5FmOc8RrrJ8YTNW3UiINeqe7
         Y5IeBYtDM8pgS4GwIYdh3uwciqZE1mWTwj7Yf7kNDflQm3rHOaJt4NBL5JLYdyf/cUMf
         4B1vVp1nwG71CWSOSbu14JjxYEEHvnz60x4r5i5EaFhfQK3NcDzk6tJxlmLf/4iNVO9U
         pjGVhXX+aXcxN2XZUDg5+08/T7cPp19nEvtXPMo/g4CtXCR5gWBtC2/op5vvP7qEB2OX
         KC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777544613; x=1778149413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8BgGYh3OdD8cFpgNoQy0g+rCyOpzePwhfsUs3zFLRGw=;
        b=Rs2NsBaKnu6bOJNkV8XHqsLt5agezVzkP81f+GPfMeGE2YeXXxdV4GOJKrgSm2ZI1x
         /w36PLEUGB541FGLimQ82EGLUKKeUbWWTeBTVtUUa+FNjC7gUh9+riZ7D0+R0CxTnNI3
         cZpRiLi4x2OLhuzuuUhXpZccMsjPBXAIpMGWL8EIJwN3MrAnS0jzxQakHbY/7O/q77g0
         /rhnZJs6f/QI1BJuQxqnF+eny0M91G8VNt7N5sEeUYDOlV0xqZ7bM7Heedve1HZm/Vjq
         6s/d/4i6JPHEbUCeXWdVEUQS6309W1cG1QVNCeiN0Ji25lRiWyaPwxBpxIJlUWWl8rzk
         eeRQ==
X-Gm-Message-State: AOJu0YyoD9w74UtB25giA+U18DoZrakzs97ejPrTaRQpuNJF3ABQmmaB
	ckj7tP701JKEZkpYk/pqt5Rfe0/UBrQvexjXfARuUI4c6rdbcU/a9z5pi6rdtgz+lmTeECMmGkD
	ILNXT
X-Gm-Gg: AeBDiesojavcVxOKX30PP0Mjlaj6m7e9fM9YNM1hoi5ItStOHvxvexp7CG9TwYRXeB/
	koMjS76pox3P3btD0j/NCul4EVdKMMxf8WrSCrMiwOaC4pw20cjDfy/FsJ/22JksbqNLqsGOprv
	mSNHgIx+haJWLTfR1r99JRIA0wwmC5xPXZmIZI4c0LmdOAOhlzZXj5HINc64b0h22jM8untNBzt
	Hq/mgIoEOqCTMhWW2pvVLlS7aQcSVIjZlDcsRQGz+ohhcmMHQ+CB0b0zDrMjyTxiGCCgZ6wENX7
	yyj6fFcYZTl3G+c5BEauUzRfx+NrICj2Ugb0Efqd4SgdnN87uhaQyYSIxKk9zW+zrGFaD1RDx5V
	Sl0WeupAG7VQ/YY+GmlJHjQEz3qVCQQBHNlnFwYZt0G244vMYAl2ZtmqxysbI3e6DLmu3Ot6jRX
	tbxdFboKSQjFS9+SO7/f/HkTOw+mybHPj5vNsj6XbBSUz8oWWu6lQM+BhfLJ4KxdYYvRjNg9u4F
	EuZd/6iRQ==
X-Received: by 2002:a17:90b:4c87:b0:35a:1762:92fc with SMTP id 98e67ed59e1d1-364c30ff6e9mr2462447a91.26.1777544613385;
        Thu, 30 Apr 2026 03:23:33 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dbeb2db0sm321070a91.10.2026.04.30.03.23.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 03:23:32 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: opensbi@lists.infradead.org
Cc: cleger@rivosinc.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH 1/2] lib: sbi: sse: fix KVM context corruption
Date: Thu, 30 Apr 2026 18:23:12 +0800
Message-ID: <20260430102313.95249-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260430102313.95249-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260430102313.95249-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_112335_831320_1B87D376 
X-CRM114-Status: GOOD (  15.62  )
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

SSE injection builds a synthetic S-mode context to enter the registered
S-mode handler. If the interrupted context belongs to KVM guest
execution, OpenSBI must not let that synthetic context overwrite the
virtualization state needed to resume the interrupted context.

KVM Context Corruption happens because the old complete path rebuilt
hstatus SPV/SPVP from interrupted flags and derived MPV from
handler-visible hstatus. However, this is insufficient on
virtualization-enabled systems: hstatus carries more H-mode state, and
MPV must come from the state captured before OpenSBI prepares the
synthetic handler-entry context. Reconstructing these values from
handler-visible state can corrupt the KVM resume context.

Save the complete hstatus value and the interrupted MPV state in
OpenSBI's private SSE resume state before constructing the handler
context. The state is stored in sbi_sse_event because it should persist
from injection to completion, but it must not be part of the ABI-visible
SSE attributes that the S-mode handler can update.

This is the OpenSBI side of the KVM context corruption fix. The related
Linux side should preserve the kernel stvec in do_sse() to help protect
the virtualization context.

Link: https://lore.kernel.org/r/9290f53d-3545-4299-9781-c1c558f71158@rivosinc.com
Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 lib/sbi/sbi_sse.c | 53 ++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 818afb87..0544449d 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -70,6 +70,19 @@ struct sse_ipi_inject_data {
 	uint32_t event_id;
 };
 
+/*
+ * OpenSBI-private state used to resume the interrupted context after the SSE
+ * event handler completes. Keep this separate from SSE attributes: S-mode can
+ * update attributes before completion, while these fields preserve
+ * M-mode-owned state.
+ */
+struct sse_resume_state {
+	/* Complete hstatus value, used to restore H-mode virtualization state. */
+	unsigned long hstatus;
+	/* MPV bit from mstatus/mstatusH, used to restore virtualization state. */
+	bool prev_virt;
+};
+
 struct sbi_sse_event_attrs {
 	unsigned long status;
 	unsigned long prio;
@@ -100,6 +113,7 @@ assert_field_offset(interrupted.a7, SBI_SSE_ATTR_INTERRUPTED_A7);
 
 struct sbi_sse_event {
 	struct sbi_sse_event_attrs attrs;
+	struct sse_resume_state resume;
 	uint32_t event_id;
 	u32 hartindex;
 	struct sse_event_info *info;
@@ -545,6 +559,7 @@ static void sse_event_inject(struct sbi_sse_event *e,
 			     struct sbi_trap_regs *regs)
 {
 	struct sse_interrupted_state *i_ctx = &e->attrs.interrupted;
+	struct sse_resume_state *r_ctx = &e->resume;
 
 	sse_event_set_state(e, SBI_SSE_STATE_RUNNING);
 
@@ -552,9 +567,10 @@ static void sse_event_inject(struct sbi_sse_event *e,
 
 	i_ctx->a6 = regs->a6;
 	i_ctx->a7 = regs->a7;
-	i_ctx->flags = sse_interrupted_flags(regs->mstatus);
 	i_ctx->sepc = csr_read(CSR_SEPC);
 
+	r_ctx->prev_virt = sbi_regs_from_virt(regs);
+
 	regs->mstatus &= ~(MSTATUS_SPP | SSTATUS_SPIE);
 	if (regs->mstatus & MSTATUS_MPP)
 		regs->mstatus |= MSTATUS_SPP;
@@ -563,22 +579,24 @@ static void sse_event_inject(struct sbi_sse_event *e,
 
 	if (misa_extension('H')) {
 		unsigned long hstatus = csr_read(CSR_HSTATUS);
+		unsigned long prev_mode = (regs->mstatus & MSTATUS_MPP) >>
+					  MSTATUS_MPP_SHIFT;
 
-#if __riscv_xlen == 64
-		if (regs->mstatus & MSTATUS_MPV)
-#elif __riscv_xlen == 32
-		if (regs->mstatusH & MSTATUSH_MPV)
-#else
-#error "Unexpected __riscv_xlen"
-#endif
+		r_ctx->hstatus = hstatus;
+
+		if (r_ctx->prev_virt)
 			hstatus |= HSTATUS_SPV;
+		else
+			hstatus &= ~HSTATUS_SPV;
 
 		hstatus &= ~HSTATUS_SPVP;
-		if (hstatus & HSTATUS_SPV && regs->mstatus & SSTATUS_SPP)
-				hstatus |= HSTATUS_SPVP;
+		if ((hstatus & HSTATUS_SPV) && prev_mode == PRV_S)
+			hstatus |= HSTATUS_SPVP;
 
 		csr_write(CSR_HSTATUS, hstatus);
 	}
+
+	i_ctx->flags = sse_interrupted_flags(regs->mstatus);
 	csr_write(CSR_SEPC, regs->mepc);
 
 	/* Setup entry context */
@@ -608,6 +626,7 @@ static void sse_event_resume(struct sbi_sse_event *e,
 			     struct sbi_trap_regs *regs)
 {
 	struct sse_interrupted_state *i_ctx = &e->attrs.interrupted;
+	struct sse_resume_state *r_ctx = &e->resume;
 
 	regs->mepc = csr_read(CSR_SEPC);
 
@@ -616,26 +635,18 @@ static void sse_event_resume(struct sbi_sse_event *e,
 		regs->mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
 
 	if (misa_extension('H')) {
-		unsigned long hstatus = csr_read(CSR_HSTATUS);
 #if __riscv_xlen == 64
 		regs->mstatus &= ~MSTATUS_MPV;
-		if (hstatus & HSTATUS_SPV)
+		if (r_ctx->prev_virt)
 			regs->mstatus |= MSTATUS_MPV;
 #elif __riscv_xlen == 32
 		regs->mstatusH &= ~MSTATUSH_MPV;
-		if (hstatus & HSTATUS_SPV)
+		if (r_ctx->prev_virt)
 			regs->mstatusH |= MSTATUSH_MPV;
 #else
 #error "Unexpected __riscv_xlen"
 #endif
-		hstatus &= ~(HSTATUS_SPV | HSTATUS_SPVP);
-		if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV)
-			hstatus |= HSTATUS_SPV;
-
-		if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP)
-			hstatus |= HSTATUS_SPVP;
-
-		csr_write(CSR_HSTATUS, hstatus);
+		csr_write(CSR_HSTATUS, r_ctx->hstatus);
 	}
 
 	regs->mstatus &= ~MSTATUS_SIE;
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
