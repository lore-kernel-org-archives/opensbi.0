Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CECACC6B2D
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkRu5pPuKLESE5VXp/81QGIF3FBSmzh6m7JMHL+1s2M=; b=nMfkngHGC9zOwW
	7dRj0+nVFB5yFoaszg2fbMgowJX63kiuzLhFxiWYZSxifzkwOT0U2WtDLDmX6ABZ2DKwO7RbPEMuA
	n2EvERVpHkYZm62A0vL4fNjw3/05YLmk9RV6zImqKzJLC+/QuGRdyA0PGACnXCq0N24d2G/V/CzJ1
	sbQweM0N7wLQxdeRgN81iaFESYNBBtjHGJNh4+QwLA/l3ubKFcbq7XLl5IZdnBU58wayFmXLriAxN
	2/xP0N+F/1AsuSsPt9K1dNBeNclN6Gcq8Uut/QjuUm05z7reRvh/zsiY3CMRj8F84RWJqu1hU0h95
	Tg2qIzI4J7LYbotsrHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCS-0000000FLR7-2ZtM;
	Wed, 14 Oct 2026 11:31:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCQ-0000000FLOL-0uiT
	for opensbi@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cyEhkUZiehan0JDiqsNdV1kcc+hp8W6RksLAKn/tXTI=; b=UKJFdPuamw8lOAOojUuV7wiihA
	GzdpBCN36fgOd5wiGz4nuLMpRHGJmMGV/Kmm9gOKaAhqNymIa4LC40v86wePA/1x9POMW6p9d05KN
	FkwEBuhPVp6WXimgNvBP4Gv9BSaIyaMxx3WS3M5kZGrLMZCh5YNy21WBlZHLSWV1kQyQtL1w1c3pf
	/s16nDLu2ISnvPItTBPrCQV1PV9jmEwqq1Lkyb9NHG+dM7JVLZyzUYXdfC7aeDA4iT0JAiO+x3Jc9
	ZlX1rl03klLpvjKFEIdXpDauH1wnIyReeCmVZ5pJZAJI0om1ev273kJg9itPxvECCmXnCwPH/BCER
	6svANu2w==;
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxCN-0000000Ggxv-187f
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:31:08 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-170135e43c7so1319615c88.0
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977464; x=1792582264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyEhkUZiehan0JDiqsNdV1kcc+hp8W6RksLAKn/tXTI=;
        b=ckY6fdZm2m9Gubexk78Z8O0nwxW/IjyKbcxF0Iw9hl00IgTYK3791zNIxIVLC5gp4p
         oYJDpnSVM0QmSp84jJT6FPijhzN9Eyt8ClTx+/2f68IM0s5iGbg3BHWydtyjEMJJRgcQ
         7c4hfry+Gir3UBqkBffGeK0xd0zBT80y5jwUYLIPq9KiEq9/5WAp7TQ/qOtGjrth5rUP
         FMtzbz/YQMhhGnPuJutApTToL4cWfdxw0+XWWLoTrm/NFnIhGW3QOZRGKdU5XOBX04/O
         K02xYN1r6ZWimy/dERv1eU6tUxNuK+4961P1n257ILHR6f3ySkQMywpy97uvXWgx+1WT
         QkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977464; x=1792582264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyEhkUZiehan0JDiqsNdV1kcc+hp8W6RksLAKn/tXTI=;
        b=eZPOulQaEsc5DyNYu/B10eY3ppwQU6BUhZP/7Xyo4wi2721YH28BWD1+czlgKg1cDr
         A0xCm9qapOGXjKTVRfCuKk9lYHIC7Y/6yqwuxUiXwi2cPwV+uu5C1Thct+gUoQYqiqKP
         8FW4y/sQE3GEGs0+LzlI/kclRJ3sTehaVVbGfGjgKuWdj0pZglSZvR8/4+9LRbyRwYZn
         57k4ZYLXcBy41IoeOB3gGxH+rKjLDICzsg165Xd2prKElxO4OyLFoXg8zLCCb53xSlB8
         QLoIlBUxJcEEupukiph+Zb+vWT3Qrttu6XStlyoGzPy4XcKdrvADFrcyQxUhcsjaOLlP
         1ocw==
X-Gm-Message-State: AFq9FYKJE5oB7EMflJp7cI0R+l8uZ4trm8+XUwcs/eT4Lw6mEbpqBhte
	OXNZ9aFKxHNVT8vfWY53stoxLUPB1g3hAOdoByMMhz2vTpPsloy48pTR93R8LpXH0TkTJKAwgph
	YnWA2MdXjglWdj6YAls0NDdsekBdHotp4V+N6Vtt0HfqlPbX4j3o4ZT7l3JlaD4caR5Sa9ZRTRu
	QTSnVvblEY/8PDiN0hrRhVuLWzT+y6K5E3ocKoZaoYt1nWH1juvquULBA=
X-Gm-Gg: AYBFou2S2XShJmytrpLEj8JQ5JLod+RLtzvCq/nzzvXCep4JAXvAv4ih6BaMwDf5Shl
	n/qM1PAO4TfdkvSuLxQdtPWG9B2z2jO8eO7stul7ArjqfEvnoZoXkV27Wkt8HIBsJ3BeccrZ6Nl
	GhtbepWNJIakaExL83i5iYy6ChBx35GFsyH+Sf3icTUCHyq4wO3h4wI1PiKGPqxM69F99T/u1lb
	yoq1ReD7kBM1JStsUkkQ4BZmG8uCMgFEEFI+VvKpcClzWiLTDgdXZ1Hbl9OeTTTlcC5iplvGr6F
	35dhgmBg1rQmYswWDbu3pXXlwmeU34zsqNs6H+wSXvehquG65Z/7mGOm+SNKHatevpI4oCEv3yp
	FE+RqJclDRIsT1UWg/EipWwszROweDjb8F704W0B6i7FeBWmF7X+JSl3hPL+iHeYQ/AXs4QtSg9
	/L3lmLfxp9zQnX77hN8KX4vc4ZIw6mHJnY2Nl5iVTKynUwbqsiuhwkCNbGbIYCxupZ3PCABFsJk
	vFS3f91roRXDhL16N6F
X-Received: by 2002:a05:701b:2411:b0:165:aced:1fde with SMTP id a92af1059eb24-16a4f2527efmr21305046c88.0.1791977463573;
        Wed, 14 Oct 2026 04:31:03 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm71207996c88.18.2026.10.14.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:31:03 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v3 1/7] lib utils/fdt: Drop fdt_parse_max_enabled_hart_id()
Date: Wed, 14 Oct 2026 04:30:18 -0700
Message-ID: <20261014113100.2192229-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014113100.2192229-1-samuel.holland@sifive.com>
References: <20261014113100.2192229-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_123107_466512_01F31BC5 
X-CRM114-Status: UNSURE (   9.26  )
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

This function is not used anywhere.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 include/sbi_utils/fdt/fdt_helper.h |  2 --
 lib/utils/fdt/fdt_helper.c         | 31 ------------------------------
 2 files changed, 33 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 75a564d1..1246ab69 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -48,8 +48,6 @@ bool fdt_node_is_enabled(const void *fdt, int nodeoff);
 
 int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
 
-int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
-
 int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *cbom_block_size);
 
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 747ba028..f78ea39e 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -274,37 +274,6 @@ int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long *cb
 	return 0;
 }
 
-int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid)
-{
-	u32 hartid;
-	int err, cpu_offset, cpus_offset;
-
-	if (!fdt)
-		return SBI_EINVAL;
-	if (!max_hartid)
-		return 0;
-
-	*max_hartid = 0;
-
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
-
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
-			continue;
-
-		if (hartid > *max_hartid)
-			*max_hartid = hartid;
-	}
-
-	return 0;
-}
-
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
 {
 	const fdt32_t *val;
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
