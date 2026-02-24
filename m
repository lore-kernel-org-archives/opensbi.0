Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59760EFB7E5
	for <opensbi@archiver.kernel.org>; Tue, 24 Feb 2026 03:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIDzyOTQnzIJ6YU5MZ64uJYjwF+WC0hWI68wDKX3ePo=; b=AUnGQ3rGDlQ+Lg
	8nZbhF/wRKz7c9Hkm9ChS0nPwTBSafuZaZIDxqInL1i5Plw+gAEeeBoqkxiXRMgGSg3sL17GOMCku
	Yr82d0an4xnVfpuUST5aflAjl9xLlWM+nTtdHWGie4O7Qsgb3d6YqPj//mdERNL+OLvL46WamcjXt
	ETyM1InVduRzrTDPC9JtvtaVivy1jHC8mqNpjHwc5BbEXwOax1oVnd4CWx4V9AHniu7Seo+mTedba
	tTRKp7nzlSw0g+Y9CtRR5OeDAPg2HP0/Uf5cPVzrWYLls/uNg9BC3NM5/lMloh/cjLcV2wbBqbcti
	aYnyn89U0wkgk4c9TF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuivl-00000001Omr-1tSF;
	Tue, 24 Feb 2026 03:17:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuivj-00000001OlU-0xtr
	for opensbi@lists.infradead.org;
	Tue, 24 Feb 2026 03:17:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4376de3f128so3558198f8f.0
        for <opensbi@lists.infradead.org>; Mon, 23 Feb 2026 19:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771903065; x=1772507865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rDPnsccOLmgyf9I+bakqM5GVCoDaXtVbPxYNCWq0Gw=;
        b=XAhQxBccC2A4QcRDuJw0URYuwTzX3wyAdq0X0rgznkWeaRgjaH38ZkUgD2Rlk3H6jB
         DrEhp9cnQG1CiX4vQc1qD6xv2gehV88Fnn+gyq+EVQHfIDCyJ2p0djkhMK1zTAwgw73N
         mZWcyISGCSaI3Kovi1RK49ha0WrPMQANN/D7/XnuvXodpCzI25hBt7hKj849B9O02har
         lghTzPnl5cForFmlK6VNtkLe0pm+V6yEOlExF7fuYGhxXaLI8844VCoSkTVKe0rPLUsE
         CkhZTEBjXb1cLvRCvq/wX1Mdb1Gn37G8HX5p6HEr4G6Scj75+km3dbsOMMCLWRwTFh/u
         UQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771903065; x=1772507865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rDPnsccOLmgyf9I+bakqM5GVCoDaXtVbPxYNCWq0Gw=;
        b=KtoMimNjbr8uY4GCOW9MPCgm8KEhR1LelsJ5yBFAHqCqy4FUJXOAwHsQbrm2kqEUGN
         JMxIh39xWVTlEaL3yu2cSHHuekQHsXOMQOVScaMA21nbBWU3R1lTsjXy7F9nhaR5CQDH
         ycOBK9LzaQFUFN9hzE0TpSJSpl+aJjXK2u+D64vR8iu9tgX4psMWP7k0lWsVGuowlSv/
         GqOYZaFMuSCgFoe6LKu25aimjP4qHtv3BmcKz/qmTUOR8Pouv42IV9CHpnOFupRDEec4
         7IjRqT2qeFT4KxCFxWzHSDsktKiCtVXGRymkIPnbE8wnAduUCRjyb4pOvgSHEseshUlM
         S1fA==
X-Gm-Message-State: AOJu0Yx9ldeYFq9pqEClXAroM6X8klJOMYXhCVMT3b7w2KbqWrnK+Z3C
	gVsAOlsZB623ctt/dQlHUHlIrKjSWuB/gRLDop+x7kobZvfTqkVgikDA8DBVAmDfs33eGfqbBNz
	aeoDfWtm0mphUAXxfbhwti+ueR3wfOx/OKbd1ZJyR8zGEQR1hxx2s69D8ZBKFVMqtpRGNIev/rN
	VifpYFHNHg+7VJCvM844WmCIOeHFHTa+q5DM22cCLIPFDHEBLU
X-Gm-Gg: ATEYQzyyjYIpJmMnDOCARAEcjMASugRbTIZDwYGe3dqbzbljeFxgnEulQ9Q4QoV2bH8
	BNxiW+GkRpTsQ+93Izk2eXZkXwZGi2WInBII9XQbfFKtd9gzsDQvIHFg2hKkrYx6HclzApr3AV3
	C5ZTUcCJlK2w2T2F1vOnQnxBm+rJZpsUepEbN9H8L+zERKgwA4nGbCYVq3DaR4mejQwVJU5a67A
	jV61FIwYiaMyFcTphx1rISd/4dbd1mkIqKSVQL0mvJdSehwSDUWSd57NCEioltn4dcztpyLhBOO
	nLO+vO1FkrD+gfvkP2IQXLSDmkuh5iT+T+sIFTjMe4WcGy/gsNSrWvEv6WHTKKSco5GsXsxBYfR
	tBT+XJTHQTpbFhNFO1NB/Flg8Vo0VfLY5yxu418evcD65qa0oOlGC0u8p1tVgBn2Sl9kdU9CXA4
	PeajrZRDl0GY9BMVhmHId6Hs4NJPOl1vRt5PHUPq+2wS7jOyE=
X-Received: by 2002:a05:6000:402b:b0:435:975a:131c with SMTP id ffacd0b85a97d-4396f17e214mr17878011f8f.36.1771903065187;
        Mon, 23 Feb 2026 19:17:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm22907889f8f.23.2026.02.23.19.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 19:17:44 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 2/3] lib: sbi_init: Call hart init before platform early init
Date: Tue, 24 Feb 2026 11:17:32 +0800
Message-ID: <20260224031733.3817148-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260224031733.3817148-1-peter.lin@sifive.com>
References: <20260224031733.3817148-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_191747_274033_9B088E9E 
X-CRM114-Status: UNSURE (   8.41  )
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

To allow the platform early_init hook to use the
sbi_hart_has_extension() helper, reorder the
initialization sequence to call sbi_hart_init()
prior to sbi_platform_early_init() during both
cold and warm boot paths.

Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5259064b1..aed2b96f8 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -265,11 +265,11 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 */
 	wake_coldboot_harts(scratch);
 
-	rc = sbi_platform_early_init(plat, true);
+	rc = sbi_hart_init(scratch, true);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, true);
+	rc = sbi_platform_early_init(plat, true);
 	if (rc)
 		sbi_hart_hang();
 
@@ -424,11 +424,11 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_platform_early_init(plat, false);
+	rc = sbi_hart_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, false);
+	rc = sbi_platform_early_init(plat, false);
 	if (rc)
 		sbi_hart_hang();
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
