Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A635FD6ACE4
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDrcKfp1Glv66Kba3YO5J/9AtCXKnzdl9UmHWflSgm4=; b=r7a6YG8n7IqT1w
	E7Au6/UjVkhjDzX7blO9ckU4wZfZ2bUbyj4Gi9VmMH9ud6pUkXkgowmYGLaxS/mF6MpqGyErKqGhS
	oKjpcyjP6OTcKoDVBSP6RyILByQrAcw3x10CzQZrOl/XASEdMpQivUmGwotm6EbEtV8Kx+Eu/IYIy
	nGgZUi29YW2sObnzcztkX5FGO5T4/64daGuBvxbXUPAn8lkeyNxz2cTDc+qSEgD1iFzEUStnwJtVF
	giOKq0oBxIo079baLJuhjdNwmq+Zn3Uc3FaCPoKA2sQmPWUN42ts1TY6eim43i9ZSp5wbC2F2sU+I
	q51rAvlkWjc6iLRomyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBV1-00000008Fhj-0d3g;
	Thu, 18 Dec 2025 10:44:47 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBUz-00000008FgL-1Boa
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 10:44:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7f1243792f2so347203b3a.1
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054684; x=1766659484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS6fr295rnB03QlLF4FFCRn93r6tgVyY+q9nK0dZSto=;
        b=RyQNVE00/w0O8r01W20XDqEJ2b7Wh9AkU82gK55NXBkIx6zFKKx8rD6Utw7mtCCq7O
         jdM8Y8ZybhE1/C7eqQEnExUXeKJtnsgfxOm4mIc1lG6jEYGbQoZ4v9SUe1B5S/8n399m
         Fri0p9VRp5ins6katHCBF6S097b4I5lrtU/o85OUm45l2BTNamXYFngWlLuaEroVkmH7
         +i/bv2X4/G/hgZi1ujzJePq3Zvm4eJpR/cBP9gBEUnOp6m+T8Bj+op1jKv0sivgfY1Rz
         WLvcmFJNzk+KPrxPXZOuf0byCgKShjJSH2ExnlkQyQ3f5ZlUtugreBtzb2q4r42mb9+c
         muIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054684; x=1766659484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xS6fr295rnB03QlLF4FFCRn93r6tgVyY+q9nK0dZSto=;
        b=lzflX4hyGaf0iBxHzsvsC4OReGhkoYiby+/8IQGRdqewjO6wALOQ53Kt6nvHEARlUk
         AOFSCSpeInOgN0/HmcQulTANUkjSvBhJnJtOY+HN3DxU51ea5hbpzIw3MsqvJXvWKofj
         sEtvFTRhJ7ZQFjRHYlpWN1zGtBeOJT7ZPN5a0ux+XT0M+bcPXU0pI81N1ZNKVNPTXvKJ
         UOhHA4ai/HSErx0O1y/LPW/TK9O/7qz9oaujcX01FUCDl63eickp7U520XpLZOOt3KmB
         wC6chTMV0b82bn4GDSYKb2mO93XfZ3JWCfVKgRDzTBs8NxMKaN3g2Y6GSQOT7aFkl2fp
         qnVA==
X-Gm-Message-State: AOJu0Yw2uwkZIpzyzKSyi+vHXjgXH/tyqny0I2oayb4MBsk/mlNVwrLU
	ma4+WijxPmZ6K6pvylNBgpcs7Oj4XCNJrBfzzdrPZ9wlGsvtpU1PIycb0wLC6g==
X-Gm-Gg: AY/fxX54XEFS6oYkoBFdTZ+7WGpXFwED4vlDpAwAHjsVkLIsmr14gMcYW2Ur3aatIbA
	/iV3ipFTGd/ltsbrIUheecnQ1IbT8oQAFJMc6Y1UM5n21vVDcdgbqBR4E65q/pz3qn248iRiInk
	RtQTRo80rY/DmglPITtg3kBibxGpbP7YBUyYISZlFzOZizW/LhsXSCM+jxl1p4RtSh+/lE3sEry
	Ay+7s33QBc0DnuO9acaaOQ5kS2PuVjtSJlFlnK3nvOLQkXwym5pIIQIhFPO0+6999O1FNsNQh2W
	JvyrJ970tw8pqNMIZuLDTck7yaNhi/0/eIADSr3e+wbg197pEPid6k53manLEZOvVDuLgg6Dpu5
	EwetOKHvMy5LeragHSKFqQcJ3ClZQRYaUwFuMDmj4Qr9sziRJGphA+pRLoz/uP1yUVSE2qVRbbu
	gfMyKkuRnMU5Lu
X-Google-Smtp-Source: AGHT+IHIXvPz8w0j4b4pKhC5GmhR0j9vH+QD5NIqI+okl4PsLXnf9037tX/q5g4dzHCcpxYsZ1NbFw==
X-Received: by 2002:a05:6a00:8016:b0:7aa:8397:7754 with SMTP id d2e1a72fcca58-7f6675432d3mr19233415b3a.2.1766054683656;
        Thu, 18 Dec 2025 02:44:43 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe11d3e004sm2264795b3a.15.2025.12.18.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:44:42 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v6 3/7] lib: sbi_domain: make is_region_subset public
Date: Thu, 18 Dec 2025 02:42:39 -0800
Message-Id: <20251218104243.562667-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218104243.562667-1-ganboing@gmail.com>
References: <20251218104243.562667-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024445_511098_E528A40D 
X-CRM114-Status: GOOD (  12.07  )
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
