Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797571098789
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrzLvZ3tPejgKD1lB6izs1262owGFHQ8BI4C0wVLSL8=; b=Z/F2sasOjTN59K
	/sRx2a4g59y5GPghKvi34GXMJD2D/UhRDyr4RyaYRFPl0Kq2CypX1EdATMSUHV9i0qbJBYxxaJWAp
	Y0Ze+zmqicbepn8K50Hro9xtAKzw4vBOiaEuLnpYtCQHMio5Ecj24haZkfhWRK388hVAUVGoW+Q40
	MKZU65JvungMP11VUzUaRl6FY6uPIxE/tkVUj3TF6d0UvNskc0OZfQzMBexZKVSDPs81DvRgxG9kl
	etFAnwSke9aYqzeyzvImDpNJVM6Dy44mN4LZwN7+AjFOj7rVd3J7sNr6JeydTsLS6C+7RyMbk/WEd
	+yd5sVH05gpd5CaIdjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alb-0000000Cvq7-464x;
	Fri, 20 Mar 2026 14:23:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alY-0000000Cvnx-40SH
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:23:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so16491295e9.1
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774016635; x=1774621435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBjRf+GOlsXGHOh6Aq+/py8V4fSbGmbTARa/rthxU9c=;
        b=Y3LMAMn6+6oNavs9hSMeDTDj8cjLWowx3oLd4dItD7sTmVzjWEarg3pf+SLDA5RKy3
         JJlOScwPhLAG7zP2M4X3hChtNHznPp9s6XjwcyXlmod/A4LOwWioZkNzbsP5UH+pZKtN
         krVS8c7fgnZXmYa61ALxwtkmD7RUNScaTUsX/9FBhwhKnGfYSxQUMmFTCKtaENUwGaHM
         EO6NriDvY2nib1OPsMxmCkHb13WnreYkegnPxH3ACSU/z//Wwit6vU1LG+POi2kvIDi0
         EmsFxxzj96hJ5BUeXOmwKuSif6mXTROKhscUzerOJc/5hrXawMETk9M6R17C+y2BUV0V
         Fe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016635; x=1774621435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBjRf+GOlsXGHOh6Aq+/py8V4fSbGmbTARa/rthxU9c=;
        b=IuJIwAOPpgtf1vj4k2juJIS6zSPsySgJGtCoChus4lemBicVk4Y+tU1MEHhxPUEYXr
         gf5kfjjwO5bWF9qzAz1LVglTOcn0H2SkHPwQHYEs55R0Z1vazVdYA84GnC5Iy8/vGmqW
         jmtMZmKptjXiUHu7IO5NCCOCBleI1sXxNEx1KeDnSTweHK8hMlVyuU1adYtmYrq3K6Y2
         jo+j8uboDMOd7MVhxyX7BW1aqV5U1qltML08nyP0NgWl1aF5kuVXzg7w/0fS+bzCqVyx
         20+Kcjk1FsfbZme8iXoa+d1hYSR1KikCy29GLettYoqDApA9cbSJTpV3rBvfHFHZngNA
         BACA==
X-Gm-Message-State: AOJu0YxV7f9HtOgfFOvWbhlrkpOVsYj/m1oRRT3J7qPA4I6sR+R/r7nM
	lGQucyNDJu+G0+VhaesJiF4vwDiVQ1F28z0BLXEEgEcrUamihc7VIJLU5fExcQgsdbtbEjGrwWf
	ynHGCDH4=
X-Gm-Gg: ATEYQzwlzif7/OtKU+rzlrvQCSerXW1jgmqXlGhoGbbn+JalPCmh1E9ctB6XLLmjRVp
	/nXmuOnC+PSC/yaEfEJfqSAuThvP19xmtx4WtfvQPz0gsQ/kTbvP0cHiBwjGbdDMcsIJddjO3E3
	e19vwfQUTeX8Mk1nJgD655ltZxkNi8oo7WSFZAyD8Vx0IX7m6icwDrnPnLtwlc7l8uAU76jyn5J
	aVSepuZXfPv1KQB3pBYC6fE0MEfKhHS7V7WHAWx1nPdgJTswKuYmUoEyht6qtSydHUiJfHvO+di
	i0ia0floG95zzvohKab8pXozQJ1ZqHyuNBqWe3ZGamUV07FQ0NsgTEua8yX9IUf29vA1wpA7Pxx
	qVq753rdbfYB0ckkJuYdCtVkRH29HOnkrxm5Ccz95+K2+obnE5qJRIPTzUcSraRPVCmwAZeCC8G
	sC5jT7eR3E96ElwihB4PNmXDHJKCnMkSXch0Dpv5kkF0eXkQuKvBiNIOX/jnWq6dUpVdc=
X-Received: by 2002:a05:600c:474f:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-486fedab2edmr49785355e9.6.1774016634716;
        Fri, 20 Mar 2026 07:23:54 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d923fsm108445265e9.1.2026.03.20.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:23:54 -0700 (PDT)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 1/4] lib: sbi: domain: ensure boot_hartid is assigned
Date: Fri, 20 Mar 2026 14:23:46 +0000
Message-ID: <20260320142349.72980-2-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320142349.72980-1-dave.patel@riscstar.com>
References: <20260320142349.72980-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_072357_009974_0104C5A6 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

When boot_hartid points to a hart that is not in the domain's assigned
hartmask (e.g. due to cold boot hart differences), the domain startup
can skip starting the intended boot hart, leading to intermittent Linux
boot failures. Scan the assigned hartmask and pick the first available
hartid to guarantee a valid boot target.
---
 lib/sbi/sbi_domain.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 4e8d2045..498a1d56 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -804,6 +804,30 @@ int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid)
 
 	/* Startup boot HART of domains */
 	sbi_domain_for_each(dom) {
+		u32 boot_hartindex = sbi_hartid_to_hartindex(dom->boot_hartid);
+		bool boot_assigned = false;
+
+		if (sbi_hartindex_valid(boot_hartindex)) {
+			spin_lock(&dom->assigned_harts_lock);
+			boot_assigned = sbi_hartmask_test_hartindex(
+				boot_hartindex, &dom->assigned_harts);
+			spin_unlock(&dom->assigned_harts_lock);
+		}
+
+		if (!boot_assigned) {
+			u32 new_hartid = -1U;
+
+			spin_lock(&dom->assigned_harts_lock);
+			sbi_hartmask_for_each_hartindex(dhart, &dom->assigned_harts) {
+				new_hartid = sbi_hartindex_to_hartid(dhart);
+				break;
+			}
+			spin_unlock(&dom->assigned_harts_lock);
+
+			if (new_hartid != -1U)
+				dom->boot_hartid = new_hartid;
+		}
+
 		/* Domain boot HART index */
 		dhart = sbi_hartid_to_hartindex(dom->boot_hartid);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
