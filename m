Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D356BD65C49
	for <opensbi@archiver.kernel.org>; Wed, 17 Dec 2025 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzUDw+bMDT59Fug23avqMGOTXFowKyqxK/vy02WZF/Y=; b=ChtgssrtKS2yqL
	uRs7E65tdk+X8C6fMPCtmMsFHmC9anDBZLqoptZE9+9PY2TPvgsz7otNckLjR7So4t7067+qAenhP
	5YknhIDM6P3WtMuZwA3m6ajGHf18xHrnC4tMCUcFLIr09VsWvj2n9wG5WE5UMx8wP0b3ceXwfJsBR
	IC5nF/FPQMijpdOLvLxZoTOHoR0h+HuWUD8fE11wAVfEs3EIcAkocT04YdqAAMJPtsGkyPOEY9lcb
	snRy9aFuHZQFo7APO8enAT9qIu7D3UM2ViMi19nKhx2GWtJeR7ACoYvor/HXapM9niZw9uYqJLgaS
	uWHP/OCRqdKcOEJC5auA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrd9-00000006r1p-0Yz8;
	Wed, 17 Dec 2025 13:31:51 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrd6-00000006r0N-0Pa9
	for opensbi@lists.infradead.org;
	Wed, 17 Dec 2025 13:31:49 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so4164678b3a.2
        for <opensbi@lists.infradead.org>; Wed, 17 Dec 2025 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765978307; x=1766583107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLqiYGeyjnoGN73zOcEqpTcaaxyhihIkzIsJb/2ZsyA=;
        b=eINTQSnCTsHOWkuOjATnP/YFEcPd5F8dSTiMwOHTtBefxT47zV0CiGII3i3pSG/XF3
         FIFChwFwJvRjpPaRn+ZbzCjqYXw/yFLaaf5yuZZQ7UBVcR/TA2QDcPhXmkFBqHj4bQ3q
         MkZH8zwc9euuvOfsfw2zGIY0dFPNdxOusX1H68Peko+33wClhunh57rqFFWoKcjb4N0M
         JK/9HeEZvN66XKyMqfccosErjNf7i2zJwHQAjg88cMHqxtsNEh/EA0tXtiQP7GkJSzHL
         SNzXBb/Fye/C+xvkfr6/VbmHHu7+Ck6Zf8yy91UHG7Hb3LgDCSPoGkIBnzPhX9TGSQ5N
         282g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978307; x=1766583107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLqiYGeyjnoGN73zOcEqpTcaaxyhihIkzIsJb/2ZsyA=;
        b=E8BaC2NB+Fvk3A7rIJZJHdeAwC88GMoBKlYQnu8JDh/CHIaTwalx1d4Y1OgYxiyBDD
         6gpMa7ZFRsg0jMxDDbZC9j8EXUbQ+v2eUeQN9lhZwHk7FEAad4RAygE4fuKRynNQjKUm
         c6+GLe+bho+D7ATA/DEp40aceZ5q6pjy5F6E7ErL5xaTaKz3sP6TZ6eaobYPLYshnlnQ
         CyxSiDfIwoc9qF0VqyiLzuqB++E98z2ycrVLpk94BtRVfj4uUrcGpaH9gt2xpR9VIyRR
         a+gfaRtygJKbBaRfcdfRITjrIpyebbOdMVXsJ3hpq8dMucbt6BZaakxS7UHkmxIIFKwe
         EE2w==
X-Gm-Message-State: AOJu0YwRPH6sVl8e4G5im6aLwWbgNV7J5rK25cxq04t6Hn0yoWpp+fFe
	t8C5s8tOUIo/giWbLrmfYuxOckFYNm0mNsyXaGfV3yNprDeck7/LYeE7rjIN5w==
X-Gm-Gg: AY/fxX5s3IJ7774t3nRGy6M61PXpSgOuT8nTJhcORt2kKX1IVG3D3vUkqd/f8TIJn11
	YcstZD75SIriBod17ckRUnXbOyBOdubLMIYZ+2sv5STKqjNc6IuYSRC62DBTuFqF380fyOD6aYw
	FUvcZ3tqYMalPrMnq1NikvbDEDMf0Y0cAGlgzkNGe2HsrI5TTwqSPsJfMSUqQEub6ByijwKdEq9
	Z4W8WUXPqx1SJa66i4J8zdaqp7vHt9jnHtvIhJIkpp586vSiXs0d2HGF/R/kffEi2YDRbVStyEB
	FtDBZnF4YNPZpk2/yWb3tZiuZW1WvWx9ciojTg2U2BGKzR1DiECi1b4SzqABlVEkptl53v4Q4Ux
	MLnKAdYFKmazNhpjWt5ZHiNBMaYG0QYzgVnfb5zGl7IqN1qLuMc0U/lt4A79tjNhQEvkgCHhbUa
	4M62/tVrqhz77n
X-Google-Smtp-Source: AGHT+IGgrevcXYcnDoNru3jz7QKOqQj9bxaaAig2MtXbUCKV/gHHUCXqFyIl8bGVuiN1p/ehcTghVQ==
X-Received: by 2002:a05:6a00:4309:b0:7e8:4587:e8c5 with SMTP id d2e1a72fcca58-7f669c8b2c0mr16948796b3a.56.1765978306618;
        Wed, 17 Dec 2025 05:31:46 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc1c4ef2sm2809104b3a.65.2025.12.17.05.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:31:45 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v5 2/7] lib: sbi_domain: add sbi_domain_get_oldpmp_flags
Date: Wed, 17 Dec 2025 05:29:54 -0800
Message-Id: <20251217132959.545197-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217132959.545197-1-ganboing@gmail.com>
References: <20251217132959.545197-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_053148_160994_27DA0F18 
X-CRM114-Status: GOOD (  12.28  )
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

Factor out logic in `sbi_hart_oldpmp_configure` into function
`sbi_domain_get_oldpmp_flags`, analogous to `sbi_domain_get_smepmp_flags`.
Platform specific hart-protection implementation can now leverage it.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_domain.h |  7 +++++++
 lib/sbi/sbi_domain.c     | 22 ++++++++++++++++++++++
 lib/sbi/sbi_hart_pmp.c   | 17 +----------------
 3 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 1196d609..3360e090 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -253,6 +253,13 @@ void sbi_domain_memregion_init(unsigned long addr,
 				unsigned long flags,
 				struct sbi_domain_memregion *reg);
 
+/**
+ * Return the oldpmp pmpcfg LRWX encoding for the flags in @reg.
+ *
+ * @param reg pointer to memory region; its flags field encodes permissions.
+ */
+unsigned int sbi_domain_get_oldpmp_flags(struct sbi_domain_memregion *reg);
+
 /**
  * Return the Smepmp pmpcfg LRWX encoding for the flags in @reg.
  *
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 96d10c76..74cc1e3f 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -121,6 +121,28 @@ void sbi_domain_memregion_init(unsigned long addr,
 	}
 }
 
+unsigned int sbi_domain_get_oldpmp_flags(struct sbi_domain_memregion *reg)
+{
+
+	unsigned int pmp_flags = 0;
+
+	/*
+	 * If permissions are to be enforced for all modes on
+	 * this region, the lock bit should be set.
+	 */
+	if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
+		pmp_flags |= PMP_L;
+
+	if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+		pmp_flags |= PMP_R;
+	if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+		pmp_flags |= PMP_W;
+	if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+		pmp_flags |= PMP_X;
+
+	return pmp_flags;
+}
+
 unsigned int sbi_domain_get_smepmp_flags(struct sbi_domain_memregion *reg)
 {
 	unsigned int pmp_flags = 0;
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 7f970ca3..be459129 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -272,22 +272,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
 		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
 			return SBI_EFAIL;
 
-		pmp_flags = 0;
-
-		/*
-		 * If permissions are to be enforced for all modes on
-		 * this region, the lock bit should be set.
-		 */
-		if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
-			pmp_flags |= PMP_L;
-
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
-			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
-			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-			pmp_flags |= PMP_X;
-
+		pmp_flags = sbi_domain_get_oldpmp_flags(reg);
 		pmp_addr = reg->base >> PMP_SHIFT;
 		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
 			sbi_platform_pmp_set(sbi_platform_ptr(scratch),
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
