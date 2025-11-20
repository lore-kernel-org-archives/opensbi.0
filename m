Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6007FCF857A
	for <opensbi@archiver.kernel.org>; Thu, 20 Nov 2025 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7YNtpA/ktNV0JJxT/ArbJSHuSC0u7ez50fzdO9EUUw=; b=iLzI0exsQcmg1F
	XzdtmdByCmX7KqjACJxLtzgoF7e07BOHr7p5AHWaf4iQNf5MpApWLesR14imlhQwNKUZ1HCweL+7h
	4fx39GZgTuRiG3A4E5Wi26fBbHdh77Rzj8pHlSqBzIUup6J6Q3iC9jm5vI+ve4avj+3wY6dvUVISb
	koGxrRd+dtEzoXABHflMPf3sEHchwch3IxWLXLUDZA5hfOkNmZbfOXnCuahZYRWUqumngInW6xHK1
	BshwafkVnMpHME6O0DD1LZ5iRR4aIUyZu9euHnUGA/6GSYRIvnoBSwT0ym4g/UXNSnExRA8mKI5qz
	wy8X7nhpX9RXCCSXxqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM15j-00000006Qpd-2wVF;
	Thu, 20 Nov 2025 09:36:39 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM15i-00000006Qoc-1dKM
	for opensbi@lists.infradead.org;
	Thu, 20 Nov 2025 09:36:39 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso966102a91.2
        for <opensbi@lists.infradead.org>; Thu, 20 Nov 2025 01:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763631397; x=1764236197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zlc3EAsY5u1isasCJgs8wxe554opuQCGBkNjb2Te5z4=;
        b=m5lqF88ZHB86AHvbB/VttrZDJEPcZkO0+Wr48iP7ZNnOUKKb9iEkZ4Yv1O118GbcqW
         VvJiowLlfH7YbdMPw/o03ddiOVV+QLRnGA/UV3j0/eDnJtWHp//jRFpPOgm53oRMRE0h
         cEsNAWLGzhTlKkqG463rlKq+tK+Prss7+phaD3s+DqfWdUZpGlWFuJu3zMMmIVZddu8B
         gHKrKEA9XHwbNpa4LUXVg6UeCZscsOJp7KtghZypBSvJ/k8FgYbJVY8SNxemFbCVb3a7
         ALitd8CjWEJI5LP28BEmFhdTnYcjAUBsa4quAsIYZUcvx2YP/2Op/ZBjfA6JXV0QPOaw
         MOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631397; x=1764236197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zlc3EAsY5u1isasCJgs8wxe554opuQCGBkNjb2Te5z4=;
        b=w5mILid+JYlCHg+PEVda2cstrn0AonNAR1SMrzVtBUKSlHeb5W21iodVxMgIgx7vTQ
         nCx6FsvyqRHrkXXcJ7kwBZBf7wd+Dn6E+zbuN3rQ4SBUUvLcqWuxtegn/BYT182tP3zB
         K8U3iJc4iLyXAZ5a3hC/b87+l8xJ+eVVsnoGOYrDkNrwpqmzXoo9ELL54rGzfep5xHH8
         x+lbZtmu4n8Owp6EvbJtUylh1Nn/YtsZ/cgbiaApAk5RhK9aoVUjQAqR5IwDslmlXIx3
         n5as0Dby3cxUvsgpshLyWZJKEelEsznOxiYitsRIdsslCNdlXQeN+SZzCKfnekLJ3ZhX
         9iUQ==
X-Gm-Message-State: AOJu0YzV3YTFDNO9rV8K9MQY7BFbtbADMc9GIuAMwyVqIrAF0Iwg7Gvi
	4szZlXoUpQ8isk1Wof4N0/WC/HcFnrIt2zWe1yn/eK2FaVWypG/TSroHaPU33NYq
X-Gm-Gg: ASbGncsOUciTrTpxTlPzd8r916vd0ms791V3dbgJGgVbFeBgNWWZR4+t0N9KHcddbrZ
	uDclV9AiR5NCToFGXWoYvtlJEz16hMV0aYAE9Bd93y3+DJZ70HwA0V1d3lusvWLo/b4TPP69E88
	nLEq3/0p1RzuxDCVJPNHfvyUFTn6w8gVH7wH4P9ZmnyuoKwO19yFOPmsq12zEEs2nNk3qTfb9OW
	IVP6Gg+PB9pRRqUBoFm1k2q2fLDNNs9TCaLepc48AWiRFJcluZtv1rRBQKNYmcLEJbhOAeCQdVf
	Gbpq588b25YAycac4cydd+aG8BQkI8JIirhGjbv639dXEMBSPaWMHUEpIK/xfNJXNvz/W2taowB
	W+dxB2fUjFos4/0a1O4QU40hLQ2WCp6LL8hwtFDrnWLEgJy2nHFQHmXTuiqLB3V4VjQDDDftITS
	4k3OaOoy5HibT9
X-Google-Smtp-Source: AGHT+IH8L7XEO+H7JXD/DWJ0m+PHmjzT9R4tOtiTwHJZhxX4E998/4Erxl+XBd9hy3SxpKIWNbYaZg==
X-Received: by 2002:a17:90b:388d:b0:330:82b1:ef76 with SMTP id 98e67ed59e1d1-3472852fc91mr2352895a91.28.1763631397116;
        Thu, 20 Nov 2025 01:36:37 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34726696b52sm2019042a91.1.2025.11.20.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:36:36 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v3 3/4] include: sbi_domain: make is_region_subset public
Date: Thu, 20 Nov 2025 01:34:39 -0800
Message-Id: <20251120093440.4533-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120093440.4533-1-ganboing@gmail.com>
References: <20251120093440.4533-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_013638_428316_6FC2D1D4 
X-CRM114-Status: GOOD (  12.33  )
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

The helper function is renamed as sbi_domain_memregion_is_subset,
and made public in header file.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_domain.h | 22 ++++++++++++++++++++++
 lib/sbi/sbi_domain.c     | 23 +++--------------------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 3360e090..c8a6da99 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -164,6 +164,25 @@ struct sbi_domain_memregion {
 	unsigned long flags;
 };
 
+/** Check if regionA is sub-region of regionB */
+static inline bool sbi_domain_memregion_is_subset(
+				const struct sbi_domain_memregion *regA,
+				const struct sbi_domain_memregion *regB)
+{
+	ulong regA_start = regA->base;
+	ulong regA_end = regA->base + (BIT(regA->order) - 1);
+	ulong regB_start = regB->base;
+	ulong regB_end = regB->base + (BIT(regB->order) - 1);
+
+	if ((regB_start <= regA_start) &&
+	    (regA_start < regB_end) &&
+	    (regB_start < regA_end) &&
+	    (regA_end <= regB_end))
+		return true;
+
+	return false;
+}
+
 /** Representation of OpenSBI domain */
 struct sbi_domain {
 	/** Node in linked list of domains */
@@ -222,6 +241,9 @@ extern struct sbi_dlist domain_list;
 #define sbi_domain_for_each_memregion(__d, __r) \
 	for ((__r) = (__d)->regions; (__r)->order; (__r)++)
 
+#define sbi_domain_for_each_memregion_idx(__d, __r, __i) \
+	for ((__r) = (__d)->regions, (__i) = 0; (__r)->order; (__r)++, (__i)++)
+
 /**
  * Check whether given HART is assigned to specified domain
  * @param dom pointer to domain
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index afda7365..9692a123 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -281,29 +281,12 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
 	return true;
 }
 
-/** Check if regionA is sub-region of regionB */
-static bool is_region_subset(const struct sbi_domain_memregion *regA,
-			     const struct sbi_domain_memregion *regB)
-{
-	ulong regA_start = regA->base;
-	ulong regA_end = regA->base + (BIT(regA->order) - 1);
-	ulong regB_start = regB->base;
-	ulong regB_end = regB->base + (BIT(regB->order) - 1);
-
-	if ((regB_start <= regA_start) &&
-	    (regA_start < regB_end) &&
-	    (regB_start < regA_end) &&
-	    (regA_end <= regB_end))
-		return true;
-
-	return false;
-}
-
 /** Check if regionA can be replaced by regionB */
 static bool is_region_compatible(const struct sbi_domain_memregion *regA,
 				 const struct sbi_domain_memregion *regB)
 {
-	if (is_region_subset(regA, regB) && regA->flags == regB->flags)
+	if (sbi_domain_memregion_is_subset(regA, regB) &&
+	    regA->flags == regB->flags)
 		return true;
 
 	return false;
@@ -363,7 +346,7 @@ static const struct sbi_domain_memregion *find_next_subset_region(
 
 	sbi_domain_for_each_memregion(dom, sreg) {
 		if (sreg == reg || (sreg->base <= addr) ||
-		    !is_region_subset(sreg, reg))
+		    !sbi_domain_memregion_is_subset(sreg, reg))
 			continue;
 
 		if (!ret || (sreg->base < ret->base) ||
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
