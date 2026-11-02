Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A260A2603
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 03:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bwywChI+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=dc8uLqLu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iht/ejXmd39VfurYUN3xGEdKSMsMBvez5BU5zhuP6Gs=; b=bwywChI+mEzqZM+2lJ45hyzLT1
	3zk+HAil72p9u3p2NL5qM9/GOEhXnEXu4+PDR4/pWlbLpRH8ViGYGY3bpWSyI2R7TzFvSyxvG9NJO
	mIq0XzHgQD06pr51QKGSduofezbf0rO4sBi8sOeYPGHPJemNbih1eEVnAFDc1adaR7phondo++90s
	JHPWpXtxJs5Mfdaf50dmBLo+c8+qXOzxw+W1exbgky6wMia3POeLgYr068wHS7psePXn6ioN+aURB
	oTNwm6ddEfLk+xGjKhqP8HmC7NcRPpQKbsYT6HirhAL6uyS+lGiPHMjFKQNjXmGotzwj7lqiKfNiX
	IcP5jMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1J-0000000FTE4-33P7;
	Mon, 02 Nov 2026 03:47:41 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1F-0000000FTCC-4AW9
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 03:47:39 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2822960c88.1
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 19:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793591257; x=1794196057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zp/N6fRKBcgHV4VV0qiUuxb802BAQObQM0yTeQtetLg=;
        b=dc8uLqLupYvzYkGZg/g5egidUrYTZsbo89lTr2JAKr/r2/ZxABHPszqiCUVHvDc6hg
         66o63AJryixKmZhhcfeD7Xfx7pgWIPzEXJXyBB4xb69IOYiLxZcFB+U0B63v62KwNAPU
         pgutAyJg+PhXFLFWK90ZoUeHtt2xIvroLINFJyoWbTnslxhjinyJf0so2M0/Y9gYBPCs
         tuwioK1651hBOC4DMVAPrCQ5oANS+DxzdUg4PFJxX6JtemTL7GPjqZeUpbT35037gVJG
         hDdOYQjqPzu35VAdt254utqsViDzaX2n0o+nWcRAM4PRHWnO0T4rmhwE8DuLkTWqj4/P
         Bdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591257; x=1794196057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zp/N6fRKBcgHV4VV0qiUuxb802BAQObQM0yTeQtetLg=;
        b=O/7K5h+ipfPy69PSEbWGfirIqWK29LseR7q5MxQ2x/lxAaG4T6TTvPABrrI5SomMMH
         IkJWZNLGrOd/XEmfWEGVqwN/rTPSIaDCuyu12Ii9D0aKOqavOPdx7tyQdMhvzLdQG77x
         SNcgBb75pInt0S1S1r4WEYsciOtFcUSE2IthHitdjni8ABEojQ5yufkgQYMHw/ukAYTk
         VsNbaFuNQgpo2KYnDvUJMHNQgwJonCDqgmoVrJnFfAIZJdzKqe+dinDmlHq0D7+wNJBp
         x5ubAuxH7bfMH1dtnhlAKz+YoFHX2/X97I6mbPAdXtWyF4vFP1Gb9Okr4E6ZNgMR8RWL
         NATg==
X-Gm-Message-State: AFq9FYK+T2ENJ1An0lhmauKE742/MuoN+fqQsoJfbPefJ5tmrpybYNJN
	aSXgxi+QVWIX6YTR0OYT0aGefibVngA/w8uMPgWfPgksrPYvxI+dpr9Lb5xXW8mj1Ys=
X-Gm-Gg: AYBFou2j86y+IGCgl87ofgCTelFeA2/pBwxv7EOb/HA7tYeyuqLX+mtur8vNvQ+T2SZ
	2sZwKLlFkCuQW9XM2URtNREPM0ESvoFbiHKl14StaGxBk1rMsMv5tLviztmZtHfvHTR+cYDF58H
	EELLBDUo5cgDRIWZrnzKzMRE6Uv4DjIGhLGGJLVYChbScLbgHUqQ8r3sc9LMJ/9GmF5O4drUT6o
	k82GeoX3zxyNaTBnS2DwfQ99kFubatG073CFcwRj9l6z05HqqAbpvSiMQkv7w68nL3htNC4kp5n
	H+TkGQC/0wZjAUciKmZjYYE+dWqBAHN8HscwUsR44Y6c1uqir3Upml3YUUkwbszuj4kjJJC4Dhg
	RhhFTC5oniBb9UnlDCLC+yd/65tYLBMe6NscgkdowGdJu4NKpTG43m3YN8VX6lmy2IteWWXwvpk
	caw44H4pikqzMvJstXgkbYtyWBE+kcabHgqOa3XlyEfFGcLkKjR8OSfFztsygMGv0srbFyrFwiv
	yk5c+5qGQNTlL72zj2qQkK5hQDfDsaC/TMbVuMg9SFsPUv4cX6Ln4xDvFjyfH3PMJgpGvNXMrMb
	KCGaZFbKhDIxORnUJIUEyN0kpIUX7B8rdyYxRI0Yq1g5WNIXo8356/7a4315EilcpG98NvLGav0
	E5Aa+Sfghl+Y5DqnVmsu4yt3iRY4=
X-Received: by 2002:a05:7022:b059:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1ac5bbba381mr14109371c88.12.1793591256833;
        Sun, 01 Nov 2026 19:47:36 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm30308670eec.12.2026.11.01.19.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:47:36 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Sun, 01 Nov 2026 19:47:16 -0800
Subject: [PATCH 2/5] lib: utils/mailbox: Unlink mailbox channel before
 freeing it
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261101-dev-nickh-msysmsi-dev-upstream-v1-2-117b2e075be0@sifive.com>
References: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
In-Reply-To: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, greentime.hu@sifive.com, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194738_039405_0CE9D18F 
X-CRM114-Status: GOOD (  11.07  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both mbox_controller_free_chan() and mbox_controller_remove() call the
controller's free_chan() callback before removing the channel from the
controller's channel list. The callback may free the memory backing the
channel (e.g. rpmi_shmem_mbox_free_chan() frees the enclosing
struct rpmi_srvgrp_chan), so the following sbi_list_del() then writes
to freed memory through chan->node.

Remove the channel from the list first and only then call free_chan().

Fixes: ad846a7cb8cd ("lib: utils/mailbox: Add generic mailbox library")
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 lib/utils/mailbox/mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/mailbox/mailbox.c b/lib/utils/mailbox/mailbox.c
index b3f7e8b9..a617cc5d 100644
--- a/lib/utils/mailbox/mailbox.c
+++ b/lib/utils/mailbox/mailbox.c
@@ -51,9 +51,9 @@ void mbox_controller_remove(struct mbox_controller *mbox)
 	while (!sbi_list_empty(&mbox->chan_list)) {
 		chan = sbi_list_first_entry(&mbox->chan_list,
 					    struct mbox_chan, node);
+		sbi_list_del(&chan->node);
 		if (mbox->free_chan)
 			mbox->free_chan(mbox, chan);
-		sbi_list_del(&chan->node);
 	}
 
 	sbi_list_del(&mbox->node);
@@ -90,9 +90,9 @@ void mbox_controller_free_chan(struct mbox_chan *chan)
 	if (!chan || !chan->mbox)
 		return;
 
+	sbi_list_del(&chan->node);
 	if (chan->mbox->free_chan)
 		chan->mbox->free_chan(chan->mbox, chan);
-	sbi_list_del(&chan->node);
 }
 
 int mbox_chan_xfer(struct mbox_chan *chan, struct mbox_xfer *xfer)

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
