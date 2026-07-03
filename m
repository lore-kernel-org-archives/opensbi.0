Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3269BC43458
	for <opensbi@archiver.kernel.org>; Fri,  3 Jul 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:
	Subject:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kM8lJfsM7MzATXy8wdkN/m5P6LbGbOI27ZUQXI+YHAQ=; b=Qa99M5AUa3hbeW
	BHsp/xjpLO8etUZexpRVRTmAfBlxGaJWRj5mNzm/UKxLjWAAYmZGD06CTQgp18XYtvNQM/rHCK84O
	PVNcoR6rcwRXmIY9OgZtAHxFoYpw9R+9uql95qktgkLBuQe8r3Y/6n+tyc5FBdA+ctQdzJ8GW+QMy
	myqlzRXw7Gi+/LoiCkvQ8bb7pw2uyHd8nCkDYkie+rfqNolgSBTZGyNyUr0OSqv8G516mOzrgtEH2
	tqyRw3qTZS2rOQuvMEjB2+pGjT2rDeq6tJMPphM4QCeveerK8yS+F8GLpGNdaREjSE/FzQoe0IJHx
	y6DpkaCzjXwmXf+yGURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZAc-00000006M6G-1sgM;
	Fri, 03 Jul 2026 08:22:46 +0000
Received: from mail.ingenic.com ([106.37.171.196] helo=spam.ingenic.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZAZ-00000006M4x-06A9
	for opensbi@lists.infradead.org;
	Fri, 03 Jul 2026 08:22:44 +0000
Received: from localhost ([60.173.195.77])
	(authenticated bits=0)
	by spam.ingenic.com with ESMTPA id 6638MGiI078674
	for <opensbi@lists.infradead.org>; Fri, 3 Jul 2026 16:22:18 +0800 (+08)
	(envelope-from bin.yao@ingenic.com)
To: opensbi@lists.infradead.org
Subject: [Question] Possible tlb_sync hang when remote SFENCE.VMA races with HSM hart_stop
From: bin.yao@ingenic.com
Date: $(date -R)
Message-ID: <codex-opensbi-rfence-hsm-$(date +%s)@ingenic.com>
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: spam.ingenic.com 6638MGiI078674
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_012243_372330_5E23B6C3 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

Hello OpenSBI maintainers,

We are seeing a hang during aging/stress testing and would like to check whether our analysis is correct.

Environment:
- OpenSBI base version: v1.8.1
- Base commit in our tree: 74434f255873d74e56cc50aa762d1caf24c099f8
- Downstream tree with platform-specific HSM hart_stop support
- Platform: downstream Ingenic platform

Observed symptom:
When one hart executes remote SFENCE.VMA while another hart is stopping, the sender can spin forever in tlb_sync() waiting for a completion that never arrives.

Our current understanding of the race is:

1. The source hart calls sbi_tlb_request() and then sbi_ipi_send_many().
2. sbi_ipi_send_many() builds the target mask using sbi_hsm_hart_interruptible_mask(), so a target hart can still be selected while it is in SBI_HSM_STATE_STARTED.
3. Before the source completes the send path, the target hart can execute sbi_hsm_hart_stop() and transition from STARTED to STOP_PENDING.
4. The source still queues the TLB request in tlb_update() and increments its local tlb_sync counter.
5. That counter is decremented only when the target hart later runs tlb_entry_process().
6. If the target hart has already passed the point in the stop path where pending IPIs are drained, the queued TLB request is never processed, so the source remains in tlb_sync() forever.

So this looks like a race between:
- the interruptible-mask snapshot in sbi_ipi_send_many(), and
- the STARTED -> STOP_PENDING transition in sbi_hsm_hart_stop()

In other words, tlb_sync itself does not appear to be wrong; the problem seems to be that a hart can be counted as a target, but then stop before it can process the queued TLB request.

To make the window easier to hit during debugging, we temporarily added an artificial delay in sbi_ipi_send_many() in our downstream tree. However, our understanding is that the delay only increases the reproduction probability, and the race exists in principle even without that modification.

Questions:
1. Does the analysis above look correct?
2. Is this race already known?
3. Is there an existing or preferred way to serialize remote rfence/IPI send against hart_stop?
4. Could this be related to issue #402 ("Lifelock condition under high load with many TLB shootdowns"), or is it better treated as a separate issue?

If useful, I can also send a minimal timeline or a proposed fix.

Thanks,
Bin Yao
Ingenic

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
