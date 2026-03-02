Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C818EB363C
	for <opensbi@archiver.kernel.org>; Mon,  2 Mar 2026 22:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WCXF1pXX1CiwrkciuHuFesLrhmKPada8+fnEyAVzhbE=; b=dI15CVurDgDhsT
	3LrhSMBVu1IMudBFWVGi1CLvnSY4P/3FB0WvhXH55tkE8HB1fBkwnH86h9vU0Y9SSs91jA6xMHfKd
	+XGo0ctsh80X0Kad1inzwnhl2mnEdudXkta7FD5veuHdZ7O3ETzdi1IKIzFXbNSlIHgZ0CB6rSGta
	krlnnC31ocyO31BI4qSJYqdiPiBr1B5YTcMyMnZ2DUX7uLGOUReBirXvO+STqyOefq7Zvnwa6PWby
	BD8t90jmdxTo5DQak0LqsjQDvwNe/hqI2BcpXG5f7Drw0UzMLQwoioZpghd0GR20FcDpPmHgGPu/i
	WHCTTVHepEtOdDxmMuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCAK-0000000E9dM-1FZY;
	Mon, 02 Mar 2026 22:55:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCAI-0000000E9ct-1sLu
	for opensbi@lists.infradead.org;
	Mon, 02 Mar 2026 22:55:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D251600AE;
	Mon,  2 Mar 2026 22:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50C15C19423;
	Mon,  2 Mar 2026 22:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492101;
	bh=70kzUSl1YLF+LGjmubxwLToPnR9OfjfSavZ6UfOJeZw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ix8HDEBYAYm0P8qe9WNgML9KJ9UuLH5axjdZkq/0ocBaFmhOiwDOG9BV0096Sv9lD
	 EjL/gSZCvDHNDonSDhRiPyvbs/BmtPIS45FXkaNh2EBbVXaUxUrfkmFg72njbtYXHg
	 01xKfc3oQJy9x133PUvwtHkkqO6dIGH96s4QoxVCuuxqpnXqoEKwOkVxYDNwuYSxDR
	 Zq9uzpu9hZ5wGKDbnKd70YCBSYjAu1o/lb60J/+NJMYQjW79ZsVxmwCtcbskXXNhDk
	 lRVyYwIKyllESISP0ArYkiof7uakOkATZ1xXMl7hsWzzcwjjsUOxq+WMocmyGHG2R0
	 3h4znsaOFvSDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47895EB362E;
	Mon,  2 Mar 2026 22:55:01 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Mon, 02 Mar 2026 14:54:58 -0800
Subject: [PATCH] lib: sbi: fix sse_event_inject() status setting
MIME-Version: 1.0
Message-Id: <20260302-event_inject_fix-v1-1-e88952b03aa4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSwqAMBDFriKztjDWL15FRLQ+dVxUaaUI4t0tL
 hNIHvJwAk9t8pBDEC+HjZClCZlttCuUzJFJs644Z60QYK9B7A5zDYvcai6zpp5QMNhQzE6HqP9
 l17/vByKMl8diAAAA
X-Change-ID: 20260302-event_inject_fix-d5187be40e0c
To: opensbi@lists.infradead.org
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772492100; l=1034;
 i=thecharlesjenkins@gmail.com; s=20260127; h=from:subject:message-id;
 bh=5cQq/4MtY0zcB4kfK5DIAgxBYsz16twf7sjEqwkkdJc=;
 b=Mcbf2V9yibMLP1prRj1vX7ulz8TcTraQuBeuYyM7AHtwZ3MJxJASyd4/TgygLjDECGL9fgGxQ
 RdNEYDlypg4BMeTU66AnVL2WN65gErPeCLHBtgU829YP+cMSf07nyy8
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=4AzEw2rmBYSzmHkYTjITwPc2sWIvqjw/Fu3GnQmSMTI=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/20260127
 with auth_id=619
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

sse_event_inject() currently sets all status bits to 1 except for
SBI_SSE_ATTR_STATUS_PENDING_OFFSET which it sets to zero. Instead of
overwriting all the values of the status bits, sse_event_inject() is
only expected to clear SBI_SSE_ATTR_STATUS_PENDING_OFFSET. Fix
sse_event_inject() to only do the clearing.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 lib/sbi/sbi_sse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index a14754f8..818afb87 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -548,7 +548,7 @@ static void sse_event_inject(struct sbi_sse_event *e,
 
 	sse_event_set_state(e, SBI_SSE_STATE_RUNNING);
 
-	e->attrs.status = ~BIT(SBI_SSE_ATTR_STATUS_PENDING_OFFSET);
+	e->attrs.status &= ~BIT(SBI_SSE_ATTR_STATUS_PENDING_OFFSET);
 
 	i_ctx->a6 = regs->a6;
 	i_ctx->a7 = regs->a7;

---
base-commit: 8d1c21b38752301fc6c727eece45c15c663649b0
change-id: 20260302-event_inject_fix-d5187be40e0c

- Charlie



-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
