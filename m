Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA0A60A2604
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 03:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FPkK9GGV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=d3emDqZR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cSXFgyiZPEqh9Nc7v/seHaJTgLoGMHEvTf0yZDzczS0=; b=FPkK9GGVKW/wYnzSVtdBEkjXCw
	jxuHTqzjvhob5mDe9bQYFsKpNq0tR68DVJNvDjptoacnFuZEg782sQKfFRvsGX6E8qTFCJEVK70N6
	hv79B9DcNis4rt1/Knf5VU4wPvWxaPmg/BK7FHdG/Ut9gvomj4mLWaBpTtSa2odcxXpjBbFI8fSoX
	8L5tCiH6CHeXY4PmOFN3kwzdgcDaxKVKtDGQyZyiy6Nza/dm/gxDibOpgxkCPOtu5kIHrQ3bjEpnG
	nlD41Pnd8ecswjanj/M++XRoGj87SVjkfgYrNcMcX0P77F57WKkrwlhJ2Ksplp+jYKRm4ihKuHe3J
	YfgD7e7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1J-0000000FTEP-3sEc;
	Mon, 02 Nov 2026 03:47:41 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNj1H-0000000FTCu-1sZG
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 03:47:40 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-35c76e9614aso3640014eec.0
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 19:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793591258; x=1794196058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9V36ZLOct/eaXAmVVF1HHBNmvf6Ss5/+aas4SuUDoDI=;
        b=d3emDqZRIq5zcOGkeG5IAoj4x4jqmt65vSUMpUeA3MDLWTESbLgZMKkhiZgIfiy4LG
         vhUSvXS5YrS8TbMwukOgqvRvTQXgz+9LnGLD3x2S2xaVrmDw8B3fnIGg2t+DcnWyL6my
         WmaWuPQeomfJ5QqIFnuOyHf8WzCXkkC7xuSvKmZSQ/SDV03VBbUOe3gxOYF7pLldylne
         kv3bvtek9Y8Elz4xiEcS8wY8zNvbHEpye/6itVv7nX0rFwZ3Vg8/+mU+CoI04ndXaCxC
         jUHNepPR1fv6DVIL5BoPvAWyWYzTITHcpWm9rwpSkukCrPyByeBQOg4qqJOstv5UO0ky
         4MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591258; x=1794196058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9V36ZLOct/eaXAmVVF1HHBNmvf6Ss5/+aas4SuUDoDI=;
        b=Bfa4Y0rWSPWk5f6wtXM39XkPflGf4mQll3oIAjfUEzKTfl0EjBUZkoRNxzMv1ZXNyQ
         gylxmqzvB//vSmwcHLlbkzbOZGkRgBNsgDjDa3nSlT/oX67ml+MvLtVPl3uFwNSbUNsF
         Y2KSMVAuYw0OO044zV1V6WYe4KmGJFvFIbQ50mYSZAWhcQez2zEVzFvrE79VkCMV7Br6
         sNO2eR6/fQWyzYpNdttgEy8es7FVcO8dR2ziXMLkwfNDgzPBQA7r5uX6gzCXLTkjzZH+
         Et1KpHebrb1x0vwO0iDd1aFOUyIOqjcFbqAxetcBoCU5DcKvX4RsI3VlVAYWskjV3xvU
         ckWA==
X-Gm-Message-State: APuU4Z+K2z9Xa+3beF/GSu50LR3Q9m0tRz5KyncQCdRQOjq2LerFd4p3
	7n9cAMhjIvqRgAy/nnSZGJRa9Vg0cQygCORYdXxQhl7O3Cqe2QzLNppjIl9JNtXT1Fo=
X-Gm-Gg: AYBFou3PA1+3/FcoURg/Jmhzm9UPNEDBLCTGzncXV5Zyg3J9rOWcSQZKtcTyyxGYmaz
	prVE+Wm7nAoJaMX48fg0pOGSwjLUmtRLOGF8RawcGBJ5DjcCHjEqItdhro0dJonIoYYVxJy5V8A
	7+cXKd74nPGYq9DWr95EKqM6tubCxV5ro3vfqN08KA6102CcSrrVYIZI1no1RyHZO05bZkBShRP
	EfhpNep0B5xcA/2Nh9z58cwnyduUHk2TejAoY+E8ej3RrckjVuAv/cAC3tD2nJEyva6Hd6GIvO4
	I3VyUq27j+DddRalyf/Ws7p5CsATuTMoqhBrJ0MUpI6z//fGhCFa1/IzifICAiCpLG2z+AU7yBe
	bkm0BXt7sooG/sZzAeMkyrIQy5y33jiQi75UNEQpU/KoX0A/4KMO/pmbryLpCb5tAHDDho+wAM9
	D89rcpVX6tTGbHgO82dlbOt5jD4rOw4jZeBG6B/HsVcuXeE2I2KhWRpn3dlvpwPpZoEe9MKXiRV
	iGf9jMmS8jpBBYCxiPZ5xVAIoWOqkMXvZ9awJQ6tG411a/7Kid0Ki2RSjLR2BSHyCNyZ4WSAuKE
	KCB3KdyIQtZumMF/oXBWlyoxqeogSOQSVpPWL2gCGDqLJ7tYd1oZ9mGGlH3IdnA/6xikzDs2vdJ
	qFeE+erfgJP+lx6+GPFFiTA5MidQ=
X-Received: by 2002:a05:693c:69cd:b0:34d:96cb:d75e with SMTP id 5a478bee46e88-36a423bed39mr14472203eec.27.1793591258340;
        Sun, 01 Nov 2026 19:47:38 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm30308670eec.12.2026.11.01.19.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:47:37 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Sun, 01 Nov 2026 19:47:18 -0800
Subject: [PATCH 4/5] lib: utils/irqchip/imsic: Fail MSI programming on
 compose error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261101-dev-nickh-msysmsi-dev-upstream-v1-4-117b2e075be0@sifive.com>
References: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
In-Reply-To: <20261101-dev-nickh-msysmsi-dev-upstream-v1-0-117b2e075be0@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, greentime.hu@sifive.com, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194739_512158_6824E962 
X-CRM114-Status: GOOD (  13.60  )
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

If imsic_compose_msi_msg() fails, imsic_program_msi() only prints
an error and still passes the message to sbi_irqchip_write_msi().
Since the message is not initialized, the MSI controller may be
programmed with uninitialized stack data and end up writing MSIs
to an arbitrary address. Even if the child driver drops the message,
success is still reported, so sbi_irqchip_set_affinity() records a
hart_index that does not match the hardware.

Return the compose error so that the irqchip framework can roll back
the handler registration or keep the previous affinity. Also
zero-initialize the message so it is never passed on uninitialized.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 lib/utils/irqchip/imsic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index f6da9f7e..708e6754 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -454,7 +454,7 @@ static int imsic_program_msi(struct sbi_irqchip_device *chip,
 		      u32 eiid, u32 hart_index)
 {
 	struct imsic_data *imsic;
-	struct sbi_irqchip_msi_msg msg;
+	struct sbi_irqchip_msi_msg msg = {0};
 	int rc;
 
 	if (!chip)
@@ -470,6 +470,7 @@ static int imsic_program_msi(struct sbi_irqchip_device *chip,
 				__func__,
 				(unsigned long)eiid,
 				(unsigned long)hart_index, rc);
+		return rc;
 	}
 
 	rc = sbi_irqchip_write_msi(chip, eiid, &msg);

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
