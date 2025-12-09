Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF1BD3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5j2q2Uwr0x8ZTnIMzq8NRul7JJYwVoBAqe+91PGuzNI=; b=lzeHtI4TdyfmUU
	dFknpwWDK3HVgWpHQwAs96svkqjvU6OBa9yPpRTWxZRkiPHlKtFFtoJwHht+n6TX769rQDbA+/1nH
	9CJJjuxdrjfpAQZjrkLCHyVuPCRK2vYdX93ecxAamTJ6R8zJGCIWiZPNEH46IYewF+7gTcPr1y6nu
	mlK9MgGtrsY49aA8RHjdlsDpIadtdupu3ncsp6ubgfKd1V+U+Bibw7d3RIvT7vmkP3yfkKiDlrtq3
	AUGWqkdo2cHWU8ulZh+90J3BLLVA7vE+0R6frlLkEfdo2Ug1F8iqE8+dHtZL53pFMMY3cj9sUAgTo
	F5Q1MauUSEkSpDudgZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSutu-0000000E6V3-399Y;
	Tue, 09 Dec 2025 10:24:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSuts-0000000E6TF-084e
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 10:24:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29568d93e87so48987475ad.2
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 02:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765275895; x=1765880695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77WF8ReYk6udH0tPuFB3R06Ze5J9PPVbyexVdCI90K8=;
        b=FRVzQyq1bdWchSQuLsizV7sY83Rf0QAKRGlNQhIRtEA0HGN8IKpo8DfbCz4hVsfOp4
         9wzYHqV00pP850LGc3iHwesTt/OSPfVK5c18TTeOFBWOAzOr7hde/WzrZ7FIsyxv2mPY
         1lnMFHAwcw9M3vKl62zkpHvvo4XjYIkr5w9Z3EyCJQC0rPHelJ5D6C3JvESds1NMIiq8
         BEDVz1b7r4Zc53nVhZyV0zU0S1JN7v5bRb0w0ZczOSeeMNtgdfsirD5b7JP5joTXWgBE
         KtVFNl0Iq1NfJqL07aiYX2hbtr1rFKkBpQDb61w+aqgCZLs0n9lZHJr7VK+PPLeY5PPa
         X4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765275895; x=1765880695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=77WF8ReYk6udH0tPuFB3R06Ze5J9PPVbyexVdCI90K8=;
        b=RvM5FIyPWGybEu9L1sqsrMpajbOua1ai0QgQDf85kqlN+SYdqoIb7CEplMgPzGxD2h
         8mVyisHGGgqbn432j8KJGRfqiYw4x2fmHVEtYDS9FXwcmqsAnK8cDveOYHtxZwSL7GCW
         aPqB/a4blfoBGzwZfkntTuneF2MA5+zzHLB0rsu69rJDdced0iICXsSTDN6oQntd+Z0M
         FP09pj4q+MXAEef6CmhYTeM1dQFWYvHMYieNcznN4CIpY1nP18Pow6l8zn8C2gSiVqdi
         ACv9uoUI6PBkgSSPgbN7eiLWP+bsz7KcBPeObJ250nS43gVnl9xnmAUSK2APIS2zYnij
         Iszw==
X-Gm-Message-State: AOJu0YzOEZd3MbCGFvFHhO5ymiY/jLNSRgmjV3k82TNkAoTdTuxclia6
	M7DXMLEx357ZAa5afI/9Fdk6QCCsqwSI1cWKmi07+O3YL3h+M27ejwuuECG00mlw
X-Gm-Gg: AY/fxX7/fSwJhkFgdR4d+xyIhMcEY+7n/lAIPqV56b4O9bP0htVF+klGxf+cPv/KjIs
	gskO6K8Ykvet40rvhuXKQLna1hXs/V+ZWQB0m7glgkM3VL8wts7ot9Q4WaBqGTTnqjGOOzqlo0Z
	aMVHW9YXfL5Y+xU4tPCOrCP8WBo/44enFO/7+SidcWImJ6q0kCpzhV9rgwmp7XPNV0mHAT0Xml3
	MHkaatnEbwEtEZ0EmVwWVUtoE3lOXAx5T6fLoF7qeqeQkFZFZnkGtTlGIMA3kTC8fhJPRvGHOIq
	44WW03/43azjkYOrqyulTdmNDHEnjZGpFZW7SKwpKUJgoRtK9nmIn7yKkSMZ3SooI294VBxcxRX
	qLkPb9gMp3Frn1AbNGpLcWNX1XJTR4EUjlCnAwclnQqE4yl/mwcDHvdYOT72sdIHHgLPWAj+P7c
	E8/f5LGwmR+ocK
X-Google-Smtp-Source: AGHT+IG//KBimBMnxDPJL3GQ9ibfNK7PvlXJSm3noUTV6zP46ufFiJPX9VtVUcPqLYP21uBAzLt/1Q==
X-Received: by 2002:a17:902:da2d:b0:29d:9b3c:4fc9 with SMTP id d9443c01a7336-29df641f4e8mr77477495ad.57.1765275894920;
        Tue, 09 Dec 2025 02:24:54 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49ca1esm149302135ad.2.2025.12.09.02.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:24:54 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v4 3/5] lib: sbi_domain: make is_region_subset public
Date: Tue,  9 Dec 2025 02:22:44 -0800
Message-Id: <20251209102246.1161-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209102246.1161-1-ganboing@gmail.com>
References: <20251209102246.1161-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_022456_069036_DD05B5D5 
X-CRM114-Status: GOOD (  12.22  )
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
index 1bc64922..8a0a8fe2 100644
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
