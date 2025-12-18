Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BDCD6ACE2
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzUDw+bMDT59Fug23avqMGOTXFowKyqxK/vy02WZF/Y=; b=sIcFp3AvxR0wvP
	RvtTnTMVFZR71o/0iD48GZAmDFNkHL69ZJ/8bC7fXpLpFa2eebq67iTrNHYF5Wdr7hWKxQjJ0gWpC
	fElfDVqCg13y5hS1lntsrX+PLNuH7Yl8nnqRvhZU9UxIsP1R4E3zfU/hpPR6vSZQSV7qa49SFOQVl
	iD37qbKwWFSNq1z5eKHVZ8YAkQw5IyJWRw2KNhyAn6ZowWWq8Uvgg+SfWuItrFIdhyI2Lt43r+EZz
	s4r5AVd8/ecRh4KbVKvqORpjisJV9nEyfL8oriKTMkSndcjS6ptqTFCE8d46b7QKR+EBv1/6oGEjZ
	Q+w4aOvGmTD0bdMJOCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBV0-00000008Fha-3TIN;
	Thu, 18 Dec 2025 10:44:46 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBUx-00000008Ffe-3ULW
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 10:44:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso551545b3a.1
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 02:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054682; x=1766659482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLqiYGeyjnoGN73zOcEqpTcaaxyhihIkzIsJb/2ZsyA=;
        b=F2Scu2UGLYNEWuklpETmfwYdj1y98lzG57AfGMvVYwOuOpRpbUluOPEdj/FFwAz7Kq
         BX5V2PrbiWsYGTrGBRRdgNI8xPyzlzhRkVRezSDQdVq1m2z7jT/BklyDjpnLH7mSEyP2
         R3gYimyaHh8LyTMf7aVjGXqFw4iIBvlfgx5zH4MI9gbOweUWBcdUkJ7rDL1l+CFNU9FX
         h+qvhk+KOb30rvGXSfAM44sx2kHf16PZk4VczuNssRBQlUKT80BOgey6FAfQxcY61mTX
         ebHYy21Hxae+0SsohQ/nBVESt/gyXwPX7LhT8+NwMYO2NX8HNsBXfL3DwNgznZ+/K8+D
         Bj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054682; x=1766659482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLqiYGeyjnoGN73zOcEqpTcaaxyhihIkzIsJb/2ZsyA=;
        b=b95BmSwI4MWTYaqpWAddRcVU6aqIhSRzqI/dxyoYC/RjuIIWouFpaX9a9l1IHxbgFt
         JNJ4wUwRZnDSjI0ZiG0yc3hku+zPVtiG+KBS0jJqEqovXwBfMVORC8b5V8RE76SEUSy8
         P2+u/hptga8TYQl90jpJ1wjv8VwbdYexvivakZh6YVSZOUjvHOezg5DOBQvKEbVfbD5/
         GeCH8dtO9jwD4YX7XQ9sMKWm+rFvkROxrjdkciBM1IJkbuRSx4ygsm67HhDh/hxeBRZp
         wysBuAS2NW9X9LapgaZUqwEo60020JKpAvNpm0kL5/XL1hTgcM2d1PEUdp/NnsrsOfih
         5b6g==
X-Gm-Message-State: AOJu0Yxt91Vg4ierbJU0riwdJvoX7/U9S+TIzl2PsN2s+xfc3wCimj46
	SFgMJdbRd9lKRYJU/kv2C16wKvz102JnFMokfpAPuO0uevmB1FqFd7wY6G1K0Q==
X-Gm-Gg: AY/fxX61KWQZ1gzTKDZf5bd/iNPHJ3OOEaVRAybfrEG4uNPL3FmidF5yI7qKHVzAHnm
	C6UQ1UIJgqN2O4rR71JMBMFcWhL8FQXKQQJpYjDQEl5IjY8YP/CaB7LKQYuHJjnANGcKC7aSBaL
	7RmIX65HuYV4zUniDF32S7jLHdUwsFErkUoX+VPFhmI/ENkP4sz8P/Bym6ti57sIsHSzFhh5Se3
	XGSK3+go/t7OF84lp1LAPyQAMIsopYiBuYaQmSc6I99ZX+uw9OW4TqF/FT4FL4oBtVYiY5J3Exo
	3GMSy8sjDq6K6lZwmxERO7LF3KVsJIyUI/jHghO2H9WwSRO4Az3cFkC0HDn8HrBCoIXHuepcmQv
	tMb6qh0ceeyyu1pD48aw/I4LW+LGRDe55UPBob9CyExHe5hhPFSBzZl9cyZg33SZza0mylpF+Z6
	VCxcBWq1DTFHkS
X-Google-Smtp-Source: AGHT+IETBVtLYIa8pbqtYKWq7FXq1NXF56NIRRV9SgU2tOdoNi7JBeeVo0ICXAfyUKKfaYqE9pQF3A==
X-Received: by 2002:a05:6a00:340b:b0:7f1:4:66b with SMTP id d2e1a72fcca58-7f6692aae7cmr19097512b3a.44.1766054682321;
        Thu, 18 Dec 2025 02:44:42 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe11d3e004sm2264795b3a.15.2025.12.18.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:44:41 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v6 2/7] lib: sbi_domain: add sbi_domain_get_oldpmp_flags
Date: Thu, 18 Dec 2025 02:42:38 -0800
Message-Id: <20251218104243.562667-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218104243.562667-1-ganboing@gmail.com>
References: <20251218104243.562667-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024443_874834_C6FB5C26 
X-CRM114-Status: GOOD (  12.14  )
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
