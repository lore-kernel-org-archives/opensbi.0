Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BA6C54F54
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QdlxXmhNQFt99xqUeR0xzrYj2TojY5EHl9dU9W2g7Qo=; b=xyBFh/cE4Bd8k+
	HVPk+VRE76MnyRBNJX4PKBUz6RJJHwychvyYw4zWEW2+RHZR+h6/G9AhATYMI2YBB7vDfI1UjykYv
	bihMWzC5CAgI5gqm3hA3WQMRy/O4cxZg+o4AelJiA+kt1tg7IUyBuUV5O1sWyrtWEeKvWitqBpEqz
	8Q36Zuzl3a1z7ZpryOryD0fEWyzZHOR21IFYZBocWk4lbl1koTeEnQQvDB9AU6N5W3Y5btPhu3vs9
	jPGsHMRiCKSQ02gBHWTxjqIuoLLLBk2AB92BLjU0pWhV0lTkuF+Ry9dOAaC6PKERz30+eoHY6raPJ
	NdQ4E9DzbXXPOyniALBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphVr-0000000BwXd-3qMy;
	Fri, 31 Jul 2026 07:18:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphVn-0000000BwWb-1vfq
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 07:18:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc73e322dbso5452725ad.1
        for <opensbi@lists.infradead.org>; Fri, 31 Jul 2026 00:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1785482310; x=1786087110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIRWQlGtp9X0En+LknZ0jVGDKi76zpsYPN+tDYmDadQ=;
        b=RqzbctfWUvFmZa6cke6R5UKXS9LaTuoH8LCtUVUefM+EqdwdKy1xWRvMyORHiMpLJ6
         vXC4L3LycGnSpJ+hNrjhhXRiNSsSwuJ1Ex58iXVXsyIgEV6/nI7dtxQYtnk6JqKjlYyw
         nc6rqtgPEzg3/buSpPoWcB35GydrNUO+Ui2hlWAQboGnfMNb0UPmiKHRiVCGwIz0a3SN
         mTA8Tz6A4hUYsZnqMGrzXRRAz4BK5BOgCmZ5qjiMKQoGVN2D8HMgj98LqMK4e2iaxp2C
         HL+roQdcG+0nYx6+t+UC8LlGgwe92DFaBYKFxSX+KPuzwJer5CzoVzBDBwvlfaWuEa67
         Ynhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785482310; x=1786087110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIRWQlGtp9X0En+LknZ0jVGDKi76zpsYPN+tDYmDadQ=;
        b=eABrEin3E738PTY/NrUiP76wAUvI6fzobI/MZ3DqMuYJv5jgh9ueHXuk+9qCw6PjAP
         d8yPRXQrvzDOPRoe1intH0MwdF/FbpcvFBdJv6c3be2ve4Yd5y0zt+sGwZpZ+r+MCFzG
         dtgShqQFLeKlqnt0yPfohcSrxN2sClpPbXIqG+2kJrbEuHFsJFRzDjIdz45fUFb4/m1F
         79tdk9kooyieA+QR/NHYHMbid6ZXSr/F560ctiUEo/s56O6xPLEFTeOIXkq3LnVaRqMA
         nfLHc/y3ND9bG68HEd79BErtbBuuZs39Sk0n+YhWEgmI4UK2tPVEzUXKtm/egWycqY9r
         b11w==
X-Gm-Message-State: AOJu0YyM5BWj3RknZx2TWQcFeEb5krmW2MNY0/xsx0XXZNQ6HJ2JbQSQ
	Vllkshm/1UEIvihnVk3aH6QM2vjpYh8or7adLgSvT5T4moSeRq4IOWoMmX9brTNpYBRZGTKlmSx
	FNZXpbxpUgQ==
X-Gm-Gg: AR+sD13st5SUsjLN/0dwQKNuCXWtJcp4TwvEYCgeNgtwLTemqlCx2IRZCE3OSK3qPmL
	6o9BeTuwkjOXybXaA7bqxQiblDFkr/Pupa7Ft7a7d7ew2NkFab+HO03b+oXXI32o04+cOYxxCxR
	YWOEDn+C1ZFu7nmi7NFok50AbMCMdlZ0KU+d1TrcWL01WEbqFl3YCHoUJ8Bz1hQB3HuDuuTaAKm
	fLArZdK+CbuO2e5FIG8QPWa64UQS2faviqfhJMKG3r7NEJn5dKqIMxsDOo1RLWDc62eLi5we26i
	6EnWOu/yegbzI9s878/vvG/RUFOnwX/vc7i/RKw2z0XvFKxXnCjsUkL1HufQ5EknI/FKAq/JNYV
	r4GFiTnDNblKeTLQ+ZmJIaIltXdP/sZADGiWs0zGIp2gMov/J6Y5KgUQ6d3UUByvGnL3dcYLqhj
	nS/VOrXbE2MfU93y+2A/UVrJXiBrJbLebyneWFZp/cAMkhhhdoOVgrR1v/j7p3HagxD4snyqhX6
	+1cwiAbsGnxUmSHn8X0hsX4pVKDWwrqovUaSl4Y0jbXLOc4b3dyGi0KunsaZxllaiUrJdLU3cXQ
	mbhmwWg=
X-Received: by 2002:a17:902:da90:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2d046ed7f7cmr9807645ad.42.1785482310480;
        Fri, 31 Jul 2026 00:18:30 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net (109.197.124.34.bc.googleusercontent.com. [34.124.197.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae68cf7sm1692405ad.31.2026.07.31.00.18.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 00:18:29 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	himanshu.chauhan@oss.qualcomm.com,
	thecharlesjenkins@gmail.com,
	cleger@rivosinc.com
Subject: [PATCH] lib: sbi: sse: clear SPV for non-virtualized events
Date: Fri, 31 Jul 2026 15:18:20 +0800
Message-ID: <20260731071820.7318-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_001831_873646_D73F84D3 
X-CRM114-Status: GOOD (  10.58  )
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

SSE injection sets hstatus.SPV to the virtualization state of the
interrupted context before entering the supervisor handler. This patch
completes that existing requirement and does not change the SSE ABI.

The existing code sets SPV when the interrupted context is virtualized,
but leaves it unchanged otherwise. A stale SPV value can therefore make
an event that interrupted host execution appear to have interrupted a
guest. Event completion can then resume with virtualization enabled.

Clear SPV when the interrupted context is not virtualized so the
handler-visible state matches the interrupted context. This also lets
supervisor software, such as the Linux PMU and perf code, reliably tell
whether an SSE interrupted host or virtualized execution.

Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 lib/sbi/sbi_sse.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 818afb87..68e4fab4 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -563,15 +563,10 @@ static void sse_event_inject(struct sbi_sse_event *e,
 
 	if (misa_extension('H')) {
 		unsigned long hstatus = csr_read(CSR_HSTATUS);
-
-#if __riscv_xlen == 64
-		if (regs->mstatus & MSTATUS_MPV)
-#elif __riscv_xlen == 32
-		if (regs->mstatusH & MSTATUSH_MPV)
-#else
-#error "Unexpected __riscv_xlen"
-#endif
+		if (sbi_regs_from_virt(regs))
 			hstatus |= HSTATUS_SPV;
+		else
+			hstatus &= ~HSTATUS_SPV;
 
 		hstatus &= ~HSTATUS_SPVP;
 		if (hstatus & HSTATUS_SPV && regs->mstatus & SSTATUS_SPP)
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
