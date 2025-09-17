Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C7BCAC598
	for <opensbi@archiver.kernel.org>; Wed, 17 Sep 2025 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C8ZDGHeGJlckm3NYc0avFSkwkRIWdXXXdhx+La/Sm2Y=; b=St2rsaG5BzSsKD
	wJ2/pLEtSasuNW9ZonsLXYt8nYveHspUXmYmSoZTVVlU3ZX7Wet68q1dYU3D/g5LPR05QiLa4mViF
	0URmeZfzowwcu2LJr9d/lL4LS8wrMq+RNguu2IWoNKEvraWeqJu/zLjYHftaEE9CidUoZZTzMNxOx
	Yik9JhPvMdBIvlDZw1kYedilnm2hMfFjFgRYYgmaqgK4LEeY5gvnfRUCWe4Ka75zggBLii4Ku90+1
	QG6xzLC6xH4jvPHk5l4KOQ9SLeXN8x0Yg8ZP+lNgs1SuRW/WmDjYMBdZEOobPTQIgWPt0BLk/nhJ9
	TcQccmZAW2UDdZRpPvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypm7-0000000B2kn-3yUC;
	Wed, 17 Sep 2025 10:52:35 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypm5-0000000B2kL-0c5a
	for opensbi@lists.infradead.org;
	Wed, 17 Sep 2025 10:52:34 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7723cf6e4b6so5010302b3a.3
        for <opensbi@lists.infradead.org>; Wed, 17 Sep 2025 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1758106352; x=1758711152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYbgX6Y2F/izR2sap/LxkkFIQNAXOXzkjOXgGZV1fLk=;
        b=hrqYdjL5MUPflf4YYNr6/kPH3TRZI+2vWfIP5vBRDr8n6VBJ315fJWtYVDzeJzyyDd
         Il+lxglj4U9N3fCKDsJ4P5gGk6eZqe5v937LyN8Fh+tQLKviAGGKphgt8XCxxaLswrbt
         1CR4prfpXy3aPlw33NhHw15UXxWPNHot6qq0QEPHZK9GNe+iQOeDMoCsD3F6K2UR6x4L
         4eUPMV4mnjH6R8Yb8I2d0JoB6d6tNpigtBKKKodVo7XDwszVG2wyYHeAU427iqaLCTDr
         5EE2mCZFdsWp/4l/5/lh8pdx1pg+TFQWRPRpIP0DHineUGcRKiChYl9OrQbOdUh0jM4l
         ilDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758106352; x=1758711152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYbgX6Y2F/izR2sap/LxkkFIQNAXOXzkjOXgGZV1fLk=;
        b=J9l1YKOrB7uae6K9TTzZT4fdWJQeUMQC0qIWSjQAEJ+YdKXBdJ5Qm0Ej18bjaMjsvi
         4Ta02wo9MzRDWW6iWAbpi2DUEqOEpy/ASdLl2jMjYAsL83nwpDlRja+ihQQHeZZU27WS
         QDK0bCYeo4qb5cySQ8ziJSJYhrjxNaa+uvWjb+X13hhmbg9LwPJvePchMh53tsJjaXDx
         WB2mi1HTYh4zUBTk4j3Yr99CrTX6Tdl57ONMdPyX0cdPAYZ0tQGWOqEg6bu+ituYUi6m
         5z8o0QgGhpCop517MeTkrO5uK1ZnqM6eKXMX35NzZAnovMP1BXBN5y5qatlkJxnf/zGB
         /WHw==
X-Gm-Message-State: AOJu0Yw/llioq5IqkgLh0r49AwImX0EUmb57tfWIGPxP57ylY3IE0zXg
	u5K5saA3GsCrLXRkKYfSr+rC1wktJKVoKWaQlOBqXJ5iMQJw1jtUNzNrRGfuRyfgBMQYAdDNRnN
	9CVrpAwLuvqMmIBD71EOAc2EZ4KDJ1w3+ZMZ542b78ZVmz9wRnnleMvUJf7R15zvU0RJX3YlTEI
	i3y4TwzLlcbovilCJEtIlcBi44Owg/2KbSPlEovm5GJblWy2381XbGhw==
X-Gm-Gg: ASbGncvel1xhqKlwg3MElhjvpkElPNJCEIKija5pMHaI6OQ9HWlrrudA2nXkQsSVKVL
	R+36ZTa1xrfdca2ISYD0ephn8cSPn5rj7qp/yBNO/UtqBOAR2S4Ps/tXL0nshTPsiogjlHwLFp5
	LyxXtKm5D8mrNjaca1lGiwizlJXTe9mziOW5m1kVIGkeZ/ZdM9sp3UHHqAd7YhEx2khelkRESuk
	K7Er+0XY4qsp/TJ3H5ciHvbqU6c/Q3uA/btLEXMtwhJ34DRlCtaeEUG8AukqaLZ62qnLSJ9cG6U
	Qj65NEwVkoH0W+FKcn+aLcON8mi0iKGVOR8ZXyKGcoG+R+eSF6wnPJijCGIht3EP12b0T+EeL3u
	omKIE9EwS+0/YQSb92ku1G4l4NLtsJXvdNJb2ckSucKe+sdvVBsNx
X-Google-Smtp-Source: AGHT+IH+jTqRP52FfJE0XW1zdmVSMWiE/bVXQYf5IAHZ76iVo9iQCMTw431mgn0163OuK+OPCzPudg==
X-Received: by 2002:a05:6a20:9153:b0:259:287b:65e2 with SMTP id adf61e73a8af0-27a9b172ef9mr2389218637.27.1758106351764;
        Wed, 17 Sep 2025 03:52:31 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ac02de2bsm14124443a12.17.2025.09.17.03.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:52:31 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: opensbi@lists.infradead.org
Cc: vincent.chen@sifive.com,
	nick.hu@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH 1/1] lib: utils/timer: mtimer: Add SiFive CLINT v2 support
Date: Wed, 17 Sep 2025 18:52:24 +0800
Message-ID: <20250917105224.78291-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_035233_197493_F83EE297 
X-CRM114-Status: UNSURE (   8.81  )
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

The SiFive CLINT v2 is the HRT that supports the Zicntr extension. It
is incompatible with the SiFive CLINT v0 due to differences in their
control methods.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Co-developed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 lib/utils/timer/fdt_timer_mtimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 224534d89c5d..e1fd051964bf 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -155,6 +155,7 @@ static const struct timer_mtimer_quirks thead_aclint_quirks = {
 static const struct fdt_match timer_mtimer_match[] = {
 	{ .compatible = "riscv,clint0", .data = &sifive_clint_quirks },
 	{ .compatible = "sifive,clint0", .data = &sifive_clint_quirks },
+	{ .compatible = "sifive,clint2", .data = &sifive_clint_quirks },
 	{ .compatible = "thead,c900-clint", .data = &thead_clint_quirks },
 	{ .compatible = "thead,c900-aclint-mtimer",
 	  .data = &thead_aclint_quirks },
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
