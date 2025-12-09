Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440BED3B7F8
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ft9MtVdbTtIuxEAPWsSrFz6Lhfurw8E+T5m6JVD27h4=; b=IBJ6PKXDSvUOXj
	zHprcuHfQkwWTjsfdWqCkown7UpAUHyAogAh636hern7ZIjLZPh3Kih1rVBn6nXsMTqyQyvbkaQS1
	/0nP0crCxyz/Sm7GtV0s9GABe/wWAJkVYzIPe3iKVdVRJVqFhiJHqNTLEtC9SAgsPe726fQXNHvH1
	WbwdOu9fIaI8r62l/sXrfdpM67mz579Le39TpjqHrzhiWOo0/LdinRL4FF8w9nE5QTjOGSccDlfH5
	x5mK0cRoVh5114JXyFUMcLTmyVcuJ3XO7UbcxkudMrv4toN/Y34PQLUbzn5Mh6IcXsGvXUJVPsmPn
	Ouo3Vf0y9lGHb6jEDCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSutt-0000000E6U6-1oKI;
	Tue, 09 Dec 2025 10:24:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSutr-0000000E6Sf-0EgS
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 10:24:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29586626fbeso62871985ad.0
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 02:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765275894; x=1765880694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EkBX1LrkWqOzj6BhETMsHeTVsfb4INACbAvO34w4o8=;
        b=lns4ZgUSdFkQ6rUtDz2q95EMXkjRh+r3gfRY2VBoYkSvisg24JvFObJ1y6w3QrBSYV
         UfZbq4Wpe+cTqu/HfFyBWsfdKfQYjRRQvoytJ0QS8qcc3yqAV/as67IoexoEFnDrMXZu
         C7hxmocRzWJ9Nn51lONfr9m9iR8u6wEGmZ+A40Vw6Z/VeSVWgUx52BIvq5cwTtj7M+3/
         /ZTcaExLHQnvTUzjq13a/8pygPzOC+ovBe0TL6MNNPyTFQB6AwI6ilsUBP+5pVqQvnR4
         OdSi4fVOm3yQq922gufusnbouHWrfG1dTpsJMZTN/fFwPh8jqVoYdyL52g8Em5alTYz/
         Yn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765275894; x=1765880694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3EkBX1LrkWqOzj6BhETMsHeTVsfb4INACbAvO34w4o8=;
        b=mfTxkjnijsdVm7yr96085FhTm8nejmxlCNPA3pY7gRvY8tWVkpV1B6J24b5DObFP+m
         8mPgKLdc5d7+G/JUMSJ7fzk8NXvDuOOUy4UsvT5EipF/5HN2VvD0jSEf6tctLY19YYd1
         znT1lK41IHNDXs9Nv34YjeDW13aezWO7xn0cxGzXK5oIQlnRO/EOUfxPdZE1/jWjQpIE
         AcIVBZag/PUSw4dPqnbHokUkroIx8VoYR8ImIzvB0IqCKcmxHuRRBQdbE0aqTJE620RL
         DYI12cE9nMj87SSJriNSG7f/KaCKdVep5zd1Cb08qU5ODzgkO7kfK3CxuYqGx4zhTrMc
         a5iA==
X-Gm-Message-State: AOJu0Yw2/EpiAVaqaholZnYeHlFlT+zRPRtNYaHWb10G3Z7ATYEO+DSx
	SRFwaw/5whDFcKfc2UgKlr5/1JdE+zzHSonGgvd7YfxVMNRzdhf9nDUsWOBxXbUa
X-Gm-Gg: AY/fxX5lubwwJUkv7OVK+bzIsPFavZ74P1Rl7wjij8r6cEoc3vGq2IKFM3oSVt9tI0K
	kadhiKEYZepe+WnjXahtj2WEICzSEw8yMHQrHaKXK32bwM9IXEHjYWCcQuqP1Lb4QykYhDwRpYp
	jW4NKz6gjLgObbjHSQknJ/Tt9jVufJaW+m1xorcIIL3xyx58PBDlto/jBm65TlXuHJbPe2Kh4cn
	YG1OhF7FZQIX/oK0VPJk4VOse9wP5wvmnbvFS1UXxLmHKjyJKI7KQemgP1tjAOp1QgEnSgeBfxh
	homUjelzL0Y8MxJ6bi4Bd2MLIi2saRXny3v/TNxAXSq6F4iB6njXp2PzuKwOc/Yl4w7qlYlj1LU
	flgKXcROMXkKhHA+Zp4OUGpu9Dic5ouJLyP/ETLIiLvoj/TyHD8jwnOhjd+kVPnhqFO7YqSKGik
	ixiL+xYxSJfCfT
X-Google-Smtp-Source: AGHT+IEWqL7qJ3i2sMpt9Jaw8b6klN25Rrriw/v3o0e69epNjI1/x8SgftZCtOC6n72kdiXcxQ5OtQ==
X-Received: by 2002:a17:903:354b:b0:295:73f:90d0 with SMTP id d9443c01a7336-29df62115ffmr88492255ad.50.1765275893670;
        Tue, 09 Dec 2025 02:24:53 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49ca1esm149302135ad.2.2025.12.09.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:24:52 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v4 2/5] lib: sbi_domain: add sbi_domain_get_oldpmp_flags
Date: Tue,  9 Dec 2025 02:22:43 -0800
Message-Id: <20251209102246.1161-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209102246.1161-1-ganboing@gmail.com>
References: <20251209102246.1161-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_022455_095535_93406C73 
X-CRM114-Status: GOOD (  12.49  )
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
index 99f453f9..1bc64922 100644
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
index 08bc2cef..c9b6850a 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -271,22 +271,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
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
