Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07707D65C47
	for <opensbi@archiver.kernel.org>; Wed, 17 Dec 2025 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDrcKfp1Glv66Kba3YO5J/9AtCXKnzdl9UmHWflSgm4=; b=rLWJbwDycxemHt
	Pb+VD2JiWWum3s9er6GZxwqjNcjUSazxuc9/FWtKABo2S8FO7YWgVF2v8iw7WByYMXp3lM7e9yVE4
	sHRk0FssivlPvHcaHeHjNuCcHNh9ebb/QdneDlAosORJyaIraC4btsiK4mSu+jcuwacAPsRdAZp6s
	0C9oLTSr3dtzEHpQmwrC8DjuB4X4H7dLjLSz9hP1c4nf9oE5+oSmFuSJ1lK0gvwbdIrUFNXUOHHnO
	1piuKXQd+6/vEF4abF5c++IbCFHgVqGr0rCKKZBqrH/Nz7SfmVNzu0psknsX1bo/CkURDGAdxYIrC
	tifDPHh5I3x8GSs9Nucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrd9-00000006r2P-1vSo;
	Wed, 17 Dec 2025 13:31:51 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrd7-00000006r0v-2pvU
	for opensbi@lists.infradead.org;
	Wed, 17 Dec 2025 13:31:50 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso6195194b3a.2
        for <opensbi@lists.infradead.org>; Wed, 17 Dec 2025 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765978308; x=1766583108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS6fr295rnB03QlLF4FFCRn93r6tgVyY+q9nK0dZSto=;
        b=V+8si3DgYbHVVasaw7FLCBKTqCtoBGRvD65gzIVOv2NpOlLlP48W1rNR61abUTg9yA
         gFtRIIU2RoX9sEAOKPx942Yp5FwEpNpzgkE5xWASQsBmx1FiZRJ/PPKnkbDhKof5M8Ut
         4UmkTZQ7DmkVfmJ381Ykv4ec/P5Fq5afck47qWUWWwQIqIV3RslPucMN2gw6umFsRyVV
         HYHQjrop3KfRkDVj3VeO8hBJGoXD6rrt2A22sS8Z8wUrBmuUUE4lnchOH53hAbXt0AZ3
         TTB6qbNR64suQQ7Lja2jj3tJ4b8omTLisutwJSa/vT3dGojQDdgKplgcti0NqOzpJDJ9
         i41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978308; x=1766583108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xS6fr295rnB03QlLF4FFCRn93r6tgVyY+q9nK0dZSto=;
        b=wfUIEz7uspfPRMr75kUS8DE9AJU2V0940Uw1ZyTO8671yx8NWEBPc8c8Sm2oHkOj7n
         q14PCp9u3GN4p1nQ06kw4vB/TxTX2OqVjrbCaHKPqdhy8kdPmTjOV1+5EKSRE7nuulFP
         pygB3B4tk8nAjkoSYc1Mb585X1B6mjFoSxlrgNJ5u9g0N07ePJU6V7lr28G0K0WfJeNk
         O6AdmEsCXN5J6Ef6vNjzGCumtZ/J0ksS74yaZf9i14HUrBbcYJCAdlSc0Fk9w/i+fXyg
         xY3c90QuxHEiOo1BR5TW9btp8I9pDIliEn585GeWt9IfQDubv/SxqxkOZTowVvq59t8v
         5xKQ==
X-Gm-Message-State: AOJu0YxnVcwdrBW5DaJJuwcRERfdn1ptYAB4JbNJJkdrSIaQ79Kytvsm
	QbFphVMU9GvsbBeHz8H35HxAozKk02/cALP5JuXpRbe+V52uSokB/murz0iu4w==
X-Gm-Gg: AY/fxX7le5rNAX+bP77fojy0kapdGzI6Z7afrpUjDR0lt4C2oSzo/cZR7rkADgdRY46
	5WhOOS9iyD+Bk8Iu8rg0CNAf6Q7kfZn/yS5Jbh71BkvEKfIYbuLqqWsD8dJFuHnKsONmKQXS86i
	oGVaStkdx+awnAK4JbV/yijkTRl7/48vmBdSCESNQBmg8RnCwZ44YQl1Oe+LLNbCgbT+DW5P7ZE
	flKUbpdCwnRfnxYct5CFMXljXcFPgiad2latXovNfd69R/LQGaC6FfqlqXejzG0zzp0p3TzF+vA
	YOlrMk6zjYn7y6axTmfXC9enTiO6ODEU85ef/PpreFL04ewSXZvnkNn8qRf1bhnN6GCGYpP+kph
	Atl2OdJOEojjZcLwwPJDgzUJoml875o0d42TQcas+jk+de0shIM2JFljqyQbp6I4livHCvsGX4+
	P0TFNf9hxU9zLD
X-Google-Smtp-Source: AGHT+IG0oe4IE6F1NyD2xsj+SwXOcC09if0Hw/eBm7BAYumyBUczHH03BzLJzx5Un2kjC+EUiczEyA==
X-Received: by 2002:aa7:8dcf:0:b0:7f6:fd3b:caa6 with SMTP id d2e1a72fcca58-7f6fd3bcb09mr10604853b3a.19.1765978308237;
        Wed, 17 Dec 2025 05:31:48 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc1c4ef2sm2809104b3a.65.2025.12.17.05.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:31:47 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v5 3/7] lib: sbi_domain: make is_region_subset public
Date: Wed, 17 Dec 2025 05:29:55 -0800
Message-Id: <20251217132959.545197-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217132959.545197-1-ganboing@gmail.com>
References: <20251217132959.545197-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_053149_721372_82C70697 
X-CRM114-Status: GOOD (  12.01  )
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

Also add a convenient helper of sbi_domain_for_each_memregion_idx.

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
index 74cc1e3f..a19bf25b 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -285,29 +285,12 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
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
@@ -367,7 +350,7 @@ static const struct sbi_domain_memregion *find_next_subset_region(
 
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
