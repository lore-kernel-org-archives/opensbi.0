Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9261BC624A4
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7scL5rX1OuQWY+BQpy+AIAfxinDcpHsuCZ4I1i6K3EU=; b=e5heOg9o7NNpCv
	x9CYiGLXdO54EvR2hX4hZO8VRGAcmePS/cCmCR2eyRFkbXx4nuaVYwjHkUvTkVMih5Dw2m69fWrV+
	YCyiiHqF4leqtnHmtfYM22eyxHumocO8FIKup/UNyJn95gbLM5qBZMieeUh1bDZiHIiwu9wnbPJny
	WdForLmFWii4knsM+WmqZ8CPgcnbmikKWOpnpL/b5fTAnDjPt2ngEkFTyET04boY4Fh9zByDYaiKS
	EW73zeGK+GXBRgkJFuqDGV1c6C+MgJgmNDYUS3tjb73fMmc7TEnCfy5opASMJDxgpdJC96bVyjYh0
	iNz9vNAm4HG6tcoBmK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18JT-0000000AQ7x-0CWl;
	Mon, 31 Aug 2026 20:09:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18JQ-0000000AQ6m-481S
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 20:09:02 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 836933F618
	for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 20:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788206939;
	bh=qDiZ6fXW/gOnCtd3eJy2Qc8MI4av75arumLlewOIXvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Ey4/hIxQ0g+c7SfKL0vsqr49KbBh0HT7EKCaViaJ0KrBpzS7iKAEAAx/w6E9MhCo6
	 3yVBPVE5fblnK6OO+Dyu5xmb8uFaO/nA6SsFGXThZdhiZpf4gFUUXKyVs2JVcDJyyR
	 WFIAnbW+x+D5tBLtzYHso9+N9u2qbc4M4wzNFE+uVqP98LTS7bR+RY/EILtN9V6BIC
	 Zb9jpis9/Ham1RHgaplVDmTZ54j9geklXMV4/qBHN5Ev3kjty7ekyE1SbIz4WotL5A
	 pHSuo0qnVdpWm2jbVirN5KGEXaDJfksRzPOi+LgpyGM+KYGPW+mH1ehIEjzekgVG41
	 nPi/eHAF/Yx/YvP7KyrN8zEk/mV2ebZkC78p64HCz7Z+rE558kZohx4Nl8pah92CO5
	 cwzSZ8cwCduQF5LLgBkxez7WN3ddKWgyTeFh5VNomTY1P0HX2wbxJT2HW8ILQias2l
	 opzMJiMfSld/QWS1I9ZFNoTweX4/LPg+Z5AoVUtducRmB5tHJYHFGCGD2lkGzRQI6c
	 czl9wSIQ4703T7lqDt8QLtbqB5yaoFOIWgnF+vKVS2MmgXHjTrbLugZDgBV+eGfWKw
	 Q6xkk4WKHwuGrJFWJh8FFa3txyVhn4JDVoY7uOaDvi6El6ejwAOKtBAams9ucSHIfz
	 SP0LaKeH4KKFddg04j+4R1Ow=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cd74fc1aaso8587225e9.1
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 13:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206939; x=1788811739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDiZ6fXW/gOnCtd3eJy2Qc8MI4av75arumLlewOIXvQ=;
        b=pj/4IAYblxeh3IVaEpsOn6gAHAnUA0L+reY899rum1qHlEOaFB89R7yR8yrxZyUPQP
         qOVIHMRUZYPxV3ElxFiGLTFyTozchptanQW/QTByyz6a6kNJOTdm/JflCmzGlp4AT82Q
         JS8TVqlk4qkTQZlun7ytw01goxGEfrmsjRDWnKdh6XxzwRk+p6NS2SUpkeMsUzx175cy
         3bHjBIHk6MAXO+VkPt4c8TcWbwr3t7becuODMCYj2cLhhYp608Ql9C/n+CI3EKoiqUbp
         8gaKVNr5SuTZDanNLcVw0d7KasWD0VVI9wRK/O8jsXCxzQres8hdWaTqEgmQJ/nY65KL
         YR2w==
X-Gm-Message-State: AFuF++mUCo9mc2OxUZxWnxziyJPNHIPv6kTMmjbAA1m/KFnRepr5SWwC
	sCT/LG99ia4w48rvGz1QHLM7vq+wVFy+KkkdJeqkux6WARDQuHMhgnLu+RoS7GImlEtYpLWq375
	bYuCVM1q2V+EVZzJK8ylp9wPsxtRS8tzsGszo7+tOB3g3XDcW2gq+jSVV2hnnCaZhZdaLWdz1br
	koMlYJ1R9yAIeoVT0=
X-Gm-Gg: AR+sD13829YnIUakNU3MQwPq6PGTsWUiM/JqIqUaWKiql2s3wka37IWTkZSJSGgdA+h
	u3+poS9C2x3g78fg0t8UD+9kaIori7xGqWKi1itB1Tx6vfpBv5/NJxLoJtUR4DfyMxZDhWIVKbZ
	zpYRUOi6qkG+kz0ljCmtvtplaO1fhKQPw7ZVExIV9XRh+4248cz3VGxVDEb9aaTnoRgdXk1b8mR
	3Cfw8j/B53FhwEQs22/mPIdv+1Qdbfa1E//qAS1/0Ghy3Oaz7FlRyfut8JdUNUvZHmzbrfB3zX9
	O2kXPG9MByFb3381ywqTA6Nc6UiLTKWYyRPLRvswvViWS7pNhAQQ+YIE9dbXDQrnX+MrcMADDpu
	rdM/CKGVJ7y2j8MfSzx1JMpF5AQf9v1Wbsw==
X-Received: by 2002:a05:600c:1d0c:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49b91c3e67fmr408761915e9.9.1788206939188;
        Mon, 31 Aug 2026 13:08:59 -0700 (PDT)
X-Received: by 2002:a05:600c:1d0c:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49b91c3e67fmr408761505e9.9.1788206938900;
        Mon, 31 Aug 2026 13:08:58 -0700 (PDT)
Received: from k6.lan (141.175.65.37.rev.sfr.net. [37.65.175.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1e3a9sm15515825e9.15.2026.08.31.13.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:08:58 -0700 (PDT)
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
To: opensbi@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com,
	xianbin.zhu@linux.spacemit.com,
	anup@brainfault.org,
	ganboing@gmail.com,
	samuel.holland@sifive.com,
	heinrich.schuchardt@canonical.com,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: [PATCH 2/3] platform: generic: spacemit: k3: override cold_boot_allowed for hart 0 only
Date: Mon, 31 Aug 2026 22:07:51 +0200
Message-ID: <20260831200832.404000-3-valentin.haudiquet@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831200832.404000-1-valentin.haudiquet@canonical.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
 <20260831200832.404000-1-valentin.haudiquet@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_130901_156342_EDBDB28B 
X-CRM114-Status: GOOD (  10.63  )
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

Only hart 0 is powered at reset on K3.  Without overriding
cold_boot_allowed, the generic default checks a DTB hart mask which may
allow non-hart-0 harts to attempt cold boot, breaking the coldboot
lottery on a platform where only one hart is running.

Add spacemit_k3_cold_boot_allowed() returning true only for hart 0,
matching K1's pattern.

Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
---
 platform/generic/spacemit/k3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/platform/generic/spacemit/k3.c b/platform/generic/spacemit/k3.c
index 12c991b6..f134427d 100644
--- a/platform/generic/spacemit/k3.c
+++ b/platform/generic/spacemit/k3.c
@@ -138,11 +138,17 @@ static int spacemit_k3_early_init(bool cold_boot)
 	return generic_early_init(cold_boot);
 }
 
+static bool spacemit_k3_cold_boot_allowed(u32 hartid)
+{
+	return !hartid;
+}
+
 static int spacemit_k3_platform_init(const void *fdt, int nodeoff,
 				     const struct fdt_match *match)
 {
 	spacemit_k3_hart_init(current_hartid());
 	generic_platform_ops.early_init = spacemit_k3_early_init;
+	generic_platform_ops.cold_boot_allowed = spacemit_k3_cold_boot_allowed;
 
 	return 0;
 }
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
