Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF23C982EE
	for <opensbi@archiver.kernel.org>; Mon, 21 Sep 2026 18:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MgwWDLvfKpzpCi4OfUfvC0co6jf7wP3b9PAw2jmetcc=; b=xNyzWXSEZHrb37
	/9fO3sz0fSsVM7f5/Ws3fEAyrvO2wS6uDKHiIDWmmpR0WjJqPqxYoQ84KpFx8APXdTCcB0/iZcseL
	eZbm83LVgRwUwnFrjJiIPfj3rfrtIBlJYFJ8lZVS2Kor1yW0LbAbYcNML85hCab17mvK2T1740yCp
	GBS34tXtI7DlGNUB7H4Gps7sJCw2yxHT6pPOkF0zjuEYwSkpsiaZgCQem0S+/H176Bn8sCqFLhoJL
	A2B4R9IsXQWpSmocJ+kg5FM21FsdqQ6jqJB/cVJCaka9kOqRa4Nfg1c99DnPhfL5iefSt27NT8QLe
	87L9Z/B971XxHV5lrElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8idE-000000036CY-3kzz;
	Mon, 21 Sep 2026 18:20:48 +0000
Received: from mail-lr2-x11.google.com ([2a00:1450:4864:38::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8idC-000000036C9-1acz
	for opensbi@lists.infradead.org;
	Mon, 21 Sep 2026 18:20:47 +0000
Received: by mail-lr2-x11.google.com with SMTP id 38308e7fff4ca-3a302c06eceso24925561fa.0
        for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 11:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014844; x=1790619644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IE9m8wOsXymJ7lZFMxLuZ6GGw6PZkm8cAiX2VnoZK4I=;
        b=j1WhGtsrX4sSo2iflnQ1FMxSg/sQSsMByEno14TUzUSI5QUzdQt3Nlr+TpU/gTNw4T
         qG2/5Y9NJSCW4zo/u+qSUS7UCAKpzP3Q5lxAmTUinpH9KEbCyRkkwaVyp+4xT6+FWjPx
         qoAm83bHba7Wks73XgcZ+iRg9eW9w0J02iokv+96JbvYGUedwG8DFyQkwxLWD9a073Kz
         +6QilD4cJAB6dNYB3Bihi+po8Yq4Iic4ljgey2ATco/XnBfBFnbaPPVde4WJMlW1OUQi
         qQ4sZjh9qaw8UbhkCd+Bnyc5aN8vF8QF6gWNt90xKt/0xVORl+/m4uLNKj9QyiYG4aM1
         zC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014844; x=1790619644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE9m8wOsXymJ7lZFMxLuZ6GGw6PZkm8cAiX2VnoZK4I=;
        b=P6aRKCexVr3ERwr1hzMbJEIc8Z0bt+fDtTk1lCYkO3qpJBwUodco50ocl1sPajWzfC
         yZmS6l+ReeibJn0eLbZxon8Yyaoy+TSp68bQYFItMvhKMQuzzumqltbrvWCMTQ5L0y0A
         qv2Di4WodSC5d8dKIGqsNJA+ahYpWxUfR/U8KpCiAIjLyffuKFnt2W7LoDIngEJHPXjz
         ebQF4HzA6/klhD4nEWS1KhsP4gCpjLMao7maw83S3mFWJ5vBGg5qMmxCi1p0r+6eVTOm
         mkCiAycb+4tcFpETnKCPauVZBbGGiYIEp+uP4EeLc2qCXSJwqCI/W7m3JaTJ2p7pg+0z
         BaPw==
X-Gm-Message-State: AFuF++nQ0m9OBHXqd4fQpZYzRTaCWzUB++7EijOD5OMsYlwR7J7bf1vq
	tJ/8UOqJQQnAfKr7lb0K7wtIiBHTWt5OQCytTsfWMyQwix5gYatFndv9xdkr37v2
X-Gm-Gg: AYBFou1Iw7Ped7IPior1kyCy8j/utCngKNIlD5GxDAr7q+tydJRrBzm6rHxKRzKoS2i
	yxD/6lfh39KJMoA50t5mIdtEFWoN0ewHZThqklmEhBwsU3Wyyeu+7SdlR/o82RvzEQdT6zrOQB3
	8atcOiZxj/SKyij0CCZQDkv1XDdmk/Q/PhenbC+p+NcLnF6CjcxsMQs+9ZO8sLtx0KxwoKbKgDG
	VqOi5dVkSd2rkynJMfX+7gFYVaTwWtA1fkqJul64N17cvr2Z4o6MFVbOeIElERrlsg9bBkiwIUs
	3c8GxudLhV6VT6cSUH0w2PyKe0cyERSuReRyUNHMLIT1kW1h0uE/vt6IhMhddT6GIumfkd4MJBy
	7xbprdgf5XF8m2rs06zwm46GFegV6/LbpsnBilkfzcvWQ7ZPJVQPQZFPn0/35h3vINGcrVioGUv
	rs2LC2ezWc8Pj2DdpCO6f4r9NTodcskur+tPsF3Wk/pTmLkLzkghMT2ObKTT4t1haLG4fHETp8n
	aFdIY3Pg5sPxMHZJWnqu0EH0lXV1tK6OQ==
X-Received: by 2002:a05:6512:3b90:b0:5b6:1a7c:aa0e with SMTP id 2adb3069b0e04-5b8c197401amr3691164e87.38.1790014843651;
        Mon, 21 Sep 2026 11:20:43 -0700 (PDT)
Received: from ik5070.localdomain (85-253-25-70.ip.elisa.ee. [85.253.25.70])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5b8d41200cfsm4857e87.31.2026.09.21.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:20:42 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: opensbi@lists.infradead.org
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>
Subject: [PATCH] platform: generic: allwinner: Support the D1s as well
Date: Mon, 21 Sep 2026 21:20:17 +0300
Message-ID: <20260921182017.999610-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112046_426673_5F75CE20 
X-CRM114-Status: UNSURE (   9.20  )
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

The Allwinner D1s SoC is a stripped-down version of the D1 and D1s
boards use "allwinner,sun20i-d1s" as their root compatible string
instead of "allwinner,sun20i-d1". So, currently the sun20i override is
not selected on them.

Add the D1s compatible to the match table.

Tested on the MangoPi MQ board with the Allwinner F133-A (D1s) SoC.

Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
 platform/generic/allwinner/sun20i-d1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 4ea90158..aeec078e 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -229,6 +229,7 @@ static int sun20i_d1_platform_init(const void *fdt, int nodeoff,
 
 static const struct fdt_match sun20i_d1_match[] = {
 	{ .compatible = "allwinner,sun20i-d1" },
+	{ .compatible = "allwinner,sun20i-d1s" },
 	{ },
 };
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
