Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA5FCCFA13
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMqL/qs6ae34wPKVtcJ086BCnywCpoIOjGzMUONhNbg=; b=ex0RDlm6RXjRGr
	uddNgTuj6JIomvx2doCB1znN4pVimFoj16lUp3omp4a2LRAqNAuUwmg7SPkrFIXj0T2fjb4e6JyMW
	QJB+x2Pm5Daqpsvf4+ix5wNe4HvXg658EFB5cIUdkLrrmb/SW0Acg8yWaOxsH2qqKVSAbp2FGCW2L
	VmTGQ7pKgHFPMe88a9yBbehviF0ZOcrNgLFvePbd4RTsMMemr9I2Y0g3Md9QmRFFBwLNnTelbVbzX
	qiKLk1Ab7XhV1S7bzbJiz849QOCE1aZR4ix2hGf1DyAm3dRkIwEdaDrRuDLlLM2UaqVlcat12Rirp
	7nT1gsCjzLmeNI+4e3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYc-00000005BmH-03pF;
	Thu, 30 Apr 2026 10:23:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYZ-00000005BlA-3RC5
	for opensbi@bombadil.infradead.org;
	Thu, 30 Apr 2026 10:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=he20OQGYvGMGwKnsBxzw0zcRCXJmNL6lIQg+SZsxBgU=; b=pZm3KS4sfq320Kaq3SBBezX66N
	LBWtlKJOZ7MGxRqIkK+jizLWApgvj7H2TiBFntEaPwRlcwbzLKy05+VN8n8qFVLoHDEpaF2fI6Idj
	sgAEm01Q00OB8FxphyCSN+MVd5TJngK/TK2Nc58N7ZaIPPyQ66tIWFnvzKUC0tnbHdWpY6nU0gBvi
	KYTC4Tmt9geOnpzGYG+1G+88kIyhPE7xbrrSAx75ybfyuB1ScVnZw5fM1CivT3CMyvLaW3xAQ9va1
	T2hPhVfrnaRzy0UyEaLuWrnIA9QXByUT0+34BfMGQzgXLRmOvHUCYgpS9VPML28JKeqk2l4qX7R3S
	Von+UaOw==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYW-000000077Nj-2BwR
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 10:23:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso704745a91.3
        for <opensbi@lists.infradead.org>; Thu, 30 Apr 2026 03:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777544618; x=1778149418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=he20OQGYvGMGwKnsBxzw0zcRCXJmNL6lIQg+SZsxBgU=;
        b=D0tKY8jF31tN2s4XSOdzo/ILarr+sTQORfjGrv1WqdsS5eab++7NiMod6lnx5OZiYZ
         eegiwRGNXpSM1QK7Sw+IpPjVSq8wqYSMf5WjlvbdrUAT8F3OvQEmCkZP3regs/OdIv1j
         QeBZCnYIO4fqLEVCLDhpt7U1f8RSwVH48fd3slgL/fnG3OKzS9SPIoKdTaVv6RaCCW0i
         GVCLuNCdEASJn+U/3GkeuDtSnufeKDTV5Skg34jaUUmGqUSsBK2ULuPpjbtn/R9Nofml
         vG26DWPwgnt/I0FI4S/QypWAjXi+IAX1HfunT1gD1w1u0BHPBPWoty6tQXgcBnWJt6bX
         Zfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777544618; x=1778149418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=he20OQGYvGMGwKnsBxzw0zcRCXJmNL6lIQg+SZsxBgU=;
        b=ecYSZJaCqS/Krpsw5e8zneUe+6ikyROXsd5uGCG7ThJN7/Sa/vsBJLck6UNNYMzG3M
         8HToJqg1bHW34RbZ1AH7YWyOZyNxynpUn1VLLU07/Sd4CPukFHvawS1T/lrINc/unfPL
         oUXWhhwnEJA5tpN0gGbu/7tGrJhvmaLZBwqbM1nYbcxJuoeNgy1trztFRNtYTB0tTmpV
         vPmEKM+NFRGBJdia+jOEZsA13NMOWdYc0UZUDomYcaFoj+bhJXRPwmUrL30nLnFE5Csm
         gNE9LXrZDocqCK1UVAEecyCCJq34Zp6rec2eeVFu10XnfSJp0NcGcZ1lOE05C25NlH+H
         jGeA==
X-Gm-Message-State: AOJu0YyDCojla1uC/cR1hFeg9I1G98MKTxBgcdfVz247w54JP7nSOeXx
	0hYy6LBdlp30bS3gXfCKPaJ75mAaLZ3c4Dvx7g8Xjx7RSRpGhUB/qu52kH8Lvmg6PX7jvAD7Vd/
	8gw6M
X-Gm-Gg: AeBDievg93i1+spTzvTxaqepyJGvyASqCMBfwGb2rdVh3iyRbiL7rM/mHZgU5MX9mN7
	DiJtr9sK6ObdfGh3RK8tqu6Hdy7TM6ISG3v6cEx6gx9r3/8I48u6n1bNCS72QlxLMOyN9h+4uzm
	H3jr/qyyRB5zac+5DDn+CRx16MmuVMzAch9Rh2YuwS26T0Gk8bC1VzEl2krYjZw3AKBiGrdHyLP
	VnXhZb2V3GhBK1z2EhP/gR1mEFXQMws9whH8JovGBYozT9U6Ngb69tluBXEDQhULrHq6KHEuXhr
	T2CK7sQcLk/4apKd5Nbq91MDnUvT8tbX7EX2pAnwMeKGsGG9lMkvKmEay6y8PEU7l3fjhaZ2xt7
	Tu1nzHypoWC89Hv98MZrXD23AJ+1KnjOliZcoUo+hwZFLPQ6ic21zB4eiJ0F+o/IKKXxPmLSLKH
	UKjbc8bTX2qBDgTj+eJ1k3K+iLMyXp8wSOTm16gEDe+rmzPhnIYbn4pHsmLPtkv/3zmOIe0gvDw
	cpWQE5iWQ==
X-Received: by 2002:a17:90b:5890:b0:35e:5aa5:ae38 with SMTP id 98e67ed59e1d1-364c2f59166mr2469962a91.9.1777544618057;
        Thu, 30 Apr 2026 03:23:38 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dbeb2db0sm321070a91.10.2026.04.30.03.23.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 03:23:37 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: opensbi@lists.infradead.org
Cc: cleger@rivosinc.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH 2/2] lib: sbi: sse: fix SSE handler sstatus leakage
Date: Thu, 30 Apr 2026 18:23:13 +0800
Message-ID: <20260430102313.95249-3-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260430102313.95249-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260430102313.95249-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_112340_910278_7A6AC208 
X-CRM114-Status: GOOD (  13.22  )
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

SSE can interrupt kernel execution at any point and run a complex
handler. PMU-SSE is a real-world example: its handler runs the
perf overflow path, and `perf top` repeatedly enters the SSE handler and
completion paths when PMU-SSE is enabled. Any synthetic handler status
that leaks into the SSE-interrupted context is therefore quickly exposed.

SSE injection rewrites SIE, SPIE and SPP to enter the registered S-mode
handler. The old completion path reconstructed SIE from the handler trap
state and restored SPIE/SPP from the interrupted attributes instead of
restoring the S-mode status bits that were interrupted by the event.

That makes SIE/SPIE/SPP handler-contaminated resume state. The resulting
SSE handler sstatus leakage can make PMU-SSE perf top resume with
mismatched privilege and interrupt state, causing an "environment call
from U-mode" panic. This was reproducible on the previous version with
stress tests like `perf top` or `perf record -a`.

Save the interrupted SIE/SPIE/SPP bits in private SSE resume state before
constructing the handler context and restore them when the handler
completes. Keep using the interrupted SPP attribute to select the final
mret privilege level.

Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 lib/sbi/sbi_sse.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 0544449d..1c1a0e80 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -77,12 +77,17 @@ struct sse_ipi_inject_data {
  * M-mode-owned state.
  */
 struct sse_resume_state {
+	/* SIE/SPIE/SPP bits from mstatus, used to restore S-mode state. */
+	unsigned long sstatus_bits;
 	/* Complete hstatus value, used to restore H-mode virtualization state. */
 	unsigned long hstatus;
 	/* MPV bit from mstatus/mstatusH, used to restore virtualization state. */
 	bool prev_virt;
 };
 
+#define SSE_RESUME_SSTATUS_MASK \
+	(SSTATUS_SIE | SSTATUS_SPIE | SSTATUS_SPP)
+
 struct sbi_sse_event_attrs {
 	unsigned long status;
 	unsigned long prio;
@@ -568,6 +573,7 @@ static void sse_event_inject(struct sbi_sse_event *e,
 	i_ctx->a6 = regs->a6;
 	i_ctx->a7 = regs->a7;
 	i_ctx->sepc = csr_read(CSR_SEPC);
+	r_ctx->sstatus_bits = regs->mstatus & SSE_RESUME_SSTATUS_MASK;
 
 	r_ctx->prev_virt = sbi_regs_from_virt(regs);
 
@@ -631,7 +637,7 @@ static void sse_event_resume(struct sbi_sse_event *e,
 	regs->mepc = csr_read(CSR_SEPC);
 
 	regs->mstatus &= ~MSTATUS_MPP;
-	if (regs->mstatus & MSTATUS_SPP)
+	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP)
 		regs->mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
 
 	if (misa_extension('H')) {
@@ -649,17 +655,8 @@ static void sse_event_resume(struct sbi_sse_event *e,
 		csr_write(CSR_HSTATUS, r_ctx->hstatus);
 	}
 
-	regs->mstatus &= ~MSTATUS_SIE;
-	if (regs->mstatus & MSTATUS_SPIE)
-		regs->mstatus |= MSTATUS_SIE;
-
-	regs->mstatus &= ~MSTATUS_SPIE;
-	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE)
-		regs->mstatus |= MSTATUS_SPIE;
-
-	regs->mstatus &= ~MSTATUS_SPP;
-	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP)
-		regs->mstatus |= MSTATUS_SPP;
+	regs->mstatus &= ~SSE_RESUME_SSTATUS_MASK;
+	regs->mstatus |= r_ctx->sstatus_bits;
 
 	regs->mstatus &= ~MSTATUS_SPELP;
 	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP)
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
