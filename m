Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3AB60A2603
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 03:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yBmrrOTf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=dTxXjYJ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jagN+sR4kGtgQAgrtTiwSh6ToEPlgNs9Z7zjKmAPHQE=; b=yBmrrOTfycyR1Z2On+LjqfSr6R
	rI4m7RHKYj3BaMfkXZh92+bOtMfXH5Ob3I51HwkH0aDeucccRSU3kADdiIZODTKRBmgfl9nXCQb+/
	cK1f0xZR25+BhTlPWQFMfr8sil142bCvh7baJIC9pRqixpm4ipQrhItJUduUbUnIYWTuCsKIPExri
	FJuObI+VVcaStOlmNLZnE7yyk+8EydSB99jyt5SqxRrahTQpNK9MopznKvMotQ4QrT/exwzXpyHcY
	o5AvfzdM04dqA2balIgHk2Cu9DQTKlXHAP2ojuh91+Mfj6AC0n6iEPYphxk9sF+qq+pK1kO9xRiTQ
	Fqxgh2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1J-0000000FTEB-3QI5;
	Mon, 02 Nov 2026 03:47:41 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1G-0000000FTCT-20mj
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 03:47:39 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-3535a54bed9so3877715eec.1
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 19:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793591258; x=1794196058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSOIrl8iJK9lhOOQVkbS6GmGtntrkcopi1H6cDfOaF4=;
        b=dTxXjYJ2dDHWzEfx5uQowhQioXXljbd179gPHeH4WfSPKp0122S0IMHHnPBRlW50La
         5jE6tIj7J/+QICPKayEZrf3R6qt5Hmk032HNJujdrLFmVWzgpTXbwqTAZ90M8Iwhbfhf
         3qx3EtDwL6NfcsFdUMgXKKWmEgcC7b6vPPI/SevbzBqoAdxj/xeUyQ4XZARcoAYEHA8Z
         GAf4Tg/z31e/06y7YC+hBeNsKn13QgEk+Upfts0z3Kjd+h6yE/CRSp6C7+LeXUHIt5en
         LA+hM4AtkkPl83SiojZR8EnVMDYt5pqW7sjdQ1BYtlo1gKJ9nXUYbu3f0ZMo53Lwi4o2
         LlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591258; x=1794196058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSOIrl8iJK9lhOOQVkbS6GmGtntrkcopi1H6cDfOaF4=;
        b=Gb0fWxIX5vltNzShFiMQR1U9uidTnzJ3Ewd/BmHGx8fmLpEo3qaNdJrvOfocaGJ1KW
         0BLJEV7EU88nHUdy1HQcZVgE+veYHLgvmZDFkr+CwGJwVxjX5Ryn5dXeFEtOxBCdx1bR
         FS5YCZNJofakVwCBh4sheVsaXJlS/uM7rtFluF3Fh/9IR5NwMsVLlvXqBqG86EAkNhu5
         c0aVx0+fycadIMWB2p0Ldw8GAq2OD3fdbNm1Dt97qg/4o1wDFt6dmEzmLBQFlg/FayxW
         TtjyfIkcJ2v4FAFwwyxp+/AMOypWu0lc01f1Rd0oHitv5rFq4YqNu+az/1GKXf+qpuCn
         NNaQ==
X-Gm-Message-State: APuU4Z+/FeFU6QzIXmYEigBIfXXV1Z5/Y2HveeKhMS2zzN5dzG13c20F
	aOAp5pv2oL71qojiBPhZE8pdImdld1bw9FS2eBIGJYqWck7a9N0ncdgB6KEh/hkNz80=
X-Gm-Gg: AYBFou02bqFbr3KOzmBF+LDwjwzW2DHfNq6fmdsNbKC/WpoN3fqukzz/xVn9s8S9XPR
	vgVULTFjTOU9OqEN2gwCiUXr7+eyNfxswe5kCjikrHVweElekhQraKM8YcPOdsqLjKwgW8r7Cyl
	QrI7YHkBCLZlOR08LSRUNVD8y67E/0RP1KQwTNAaS2Vy0NBfaWrkWHIJ6rbqEB0cRmqI1/93x82
	vKDUz3QJb3tCFR2ZaErJiV55RRcL1ORivkPlp7V4anZ2I7H7p91uw2O3oGm/VR2g4l/p/DI3+Mi
	3mEJJE6NZ9ZvANY3hGGswNL/RZY1Ner30pVhTwnGGbxGytf2VdCOx3lxMu9luKxVESKKBQp6RG1
	W7K3ABK2dok/33/93w38OcIQ1bOuqGmkESMH4ZJ2H+Z/seuFekxq1BWDmlw0XY2Ot9FdaeC9YLw
	TiuTk+3T/u+14DIobE3R6XiQ1O3JcKlSeFmw5EuDxJHLRni5FCYtrB4NKdtZcBjm+q5BipqPVyR
	mrHwNMEjZO0DWjrnqbJbhVDZN5xJlkkPY9t/VSf4ZSu4SxkavpWx/QpjKq4U1hKUFVlMy428dsI
	slpd0hx22fFTWcj/6cHtXq0LkSDcBpeyHs51Pk6xZ7PYdo3Ns40lsi69zwVdLD2K7Lar1h14NJx
	KOx5BLAf/ywhHVlxMCSAKP9YIpRs=
X-Received: by 2002:a05:7300:fe41:b0:36a:158e:f917 with SMTP id 5a478bee46e88-36a42401999mr13638391eec.6.1793591257631;
        Sun, 01 Nov 2026 19:47:37 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm30308670eec.12.2026.11.01.19.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:47:37 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Sun, 01 Nov 2026 19:47:17 -0800
Subject: [PATCH 3/5] lib: utils/mailbox: Reference count mailbox channels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261101-dev-nickh-msysmsi-dev-upstream-v1-3-117b2e075be0@sifive.com>
References: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
In-Reply-To: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, greentime.hu@sifive.com, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194738_526017_DD865DDB 
X-CRM114-Status: GOOD (  14.18  )
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

mbox_controller_request_chan() returns the already allocated channel
when another client requests the same channel arguments, so a single
struct mbox_chan can be shared by multiple mailbox clients (for example
the RPMI system MSI irqchip driver and the MPXY RPMI system MSI driver
both using the SYSMSI service group channel).

However, mbox_controller_free_chan() unconditionally releases the
channel, so one client freeing the channel on its error path leaves
the other clients with a dangling pointer.

Add a reference count to struct mbox_chan which is set to one when the
channel is created, incremented whenever an existing channel is handed
out again, and decremented by mbox_controller_free_chan(). The channel
is only unlinked and released once the last reference is dropped.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi_utils/mailbox/mailbox.h |  5 +++++
 lib/utils/mailbox/mailbox.c         | 10 ++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/sbi_utils/mailbox/mailbox.h b/include/sbi_utils/mailbox/mailbox.h
index 46fd8770..2a906aa2 100644
--- a/include/sbi_utils/mailbox/mailbox.h
+++ b/include/sbi_utils/mailbox/mailbox.h
@@ -26,6 +26,11 @@ struct mbox_chan {
 	 */
 #define MBOX_CHAN_MAX_ARGS	2
 	u32 chan_args[MBOX_CHAN_MAX_ARGS];
+	/**
+	 * Number of users holding this channel. Managed by
+	 * mbox_controller_request_chan() and mbox_controller_free_chan().
+	 */
+	u32 ref_count;
 };
 
 #define to_mbox_chan(__node)	\
diff --git a/lib/utils/mailbox/mailbox.c b/lib/utils/mailbox/mailbox.c
index a617cc5d..c8ac1f62 100644
--- a/lib/utils/mailbox/mailbox.c
+++ b/lib/utils/mailbox/mailbox.c
@@ -71,8 +71,10 @@ struct mbox_chan *mbox_controller_request_chan(struct mbox_controller *mbox,
 	sbi_list_for_each(pos, &mbox->chan_list) {
 		ret = to_mbox_chan(pos);
 		if (!sbi_memcmp(ret->chan_args, chan_args,
-				sizeof(ret->chan_args)))
+				sizeof(ret->chan_args))) {
+			ret->ref_count++;
 			return ret;
+		}
 	}
 
 	ret = mbox->request_chan(mbox, chan_args);
@@ -81,13 +83,17 @@ struct mbox_chan *mbox_controller_request_chan(struct mbox_controller *mbox,
 
 	ret->mbox = mbox;
 	sbi_memcpy(ret->chan_args, chan_args, sizeof(ret->chan_args));
+	ret->ref_count = 1;
 	sbi_list_add(&ret->node, &mbox->chan_list);
 	return ret;
 }
 
 void mbox_controller_free_chan(struct mbox_chan *chan)
 {
-	if (!chan || !chan->mbox)
+	if (!chan || !chan->mbox || !chan->ref_count)
+		return;
+
+	if (--chan->ref_count)
 		return;
 
 	sbi_list_del(&chan->node);

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
