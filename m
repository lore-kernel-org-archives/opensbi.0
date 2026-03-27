Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A0810BA420
	for <opensbi@archiver.kernel.org>; Fri, 27 Mar 2026 04:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=34KlsOb0eo7fv6C0JZYHKIruZ9PPnTquTGAO5Vulrbw=; b=LVUI8HSrVPAdQv
	gZi+wp0EQ1W6IlhuPKfFRCu6El/mMuCHR2HMxI9V1PnHfA7amD8XOw4cxMknHTTeld65lgEBzwL8r
	sURhOWj5+1n8U9qF5AeoC+T2VV0KhfyCh/SlzZO8nU7FDAw3zbYAI0wh+07XfftvsfzMcysZoD3c6
	R9wBSFEDcdNx88uCIxw2alHj+A56MLe6gv6L3podZoisHxmwN3aE850WNCp6tRY0Gf+WPNZbgb9XX
	/J3rgS7m1gG/pDiaubmcfSLvdPRDFSwyXd0BYCniFYwgUbpnX3+qnS/2+Ya9brN6dSDXOBNJF3zX8
	lqQVqmcHiJFTRGoc6q9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5yte-00000006f8x-14rU;
	Fri, 27 Mar 2026 04:34:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ytb-00000006f8c-0gx8
	for opensbi@lists.infradead.org;
	Fri, 27 Mar 2026 04:34:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b04d051664so14243685ad.0
        for <opensbi@lists.infradead.org>; Thu, 26 Mar 2026 21:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774586045; x=1775190845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5hnCkkE1eBZCdbfuDFjeUOLJc4q+SsRVLGypo10bKA=;
        b=V+0z3mA81IVYdz6HSry+cgXNTOSyKMUmRoJeKwJh0zT0b14CUqri9OJjpUq600GgZV
         qrSYN5ckGwpHjxCqXAECs17zOM77X57Q0zZbulCz9lu3X1PH6i7h5Xoo3i0Q/ZpGT4kb
         NUcQNw5xELg2IbEG+NA5CCfyItxSwZOYfFxkrSMsE3BuTbosFD2Vb+pTiGzSRTp1l5eS
         WDYdV+Y/EvITfQWI5/MYDgsV+2aZfF/QPiqahUf7mzOIOh57uQ7hQTbR2DkuJjEbvrYN
         mBQpSskJrQlQenON2RSMW8CBRo0U5Dmyskv3urbdJEVKiCrqcbDCoAvT04D6sQA+OWlA
         Mvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774586045; x=1775190845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5hnCkkE1eBZCdbfuDFjeUOLJc4q+SsRVLGypo10bKA=;
        b=URE73uemzF69HKCRlqJanSqeith9dLK4kwyQTNdnVs8uIGfCJUN0pBL6RUtjYhoa1N
         j0rM/WONQGprMJUkdT1Kk/XQgqizvjTPzR7NlzEJJ6Pgn6ix61TbXJPiGNbpdsc8zEik
         30M9oiTxcUybZDTIyOyASp6Y1KVjzuVmfHSGA57LScRt8vlMfS3dHnFl9Nzy7ArReKcG
         GyKYH1boBjiZkNLqGpFFg84AIEpPgCjOBO6d351d598sdqyhPcm6G6750ZLmq5fKa1Ul
         UGOjqaKp+90Ybg+/f99ITqYuDhtyl8mFP2OT7UbJ6JKn6Fuo1M9fKpXGgcNeQohwJayn
         voug==
X-Gm-Message-State: AOJu0Yzu6CC2bnUB/3lOA9jOwUjf1fweDgstlyxt3xNOeBP899HyUIP+
	2nrlI5oYDEekvv+dIhZ8xhCOFgC946sTyL/v4ycfSbaTjAq6BJIdYWGjg9cqd/Q9UVEqGgUk7mF
	/iW8J9yxKcqx6lPPAQED+RjwQzg8m8K+vSvARKtsRXat5mc3MMM3h+jJMi7lCu6an0hm315FiE1
	uq7MPaICVIuDW0VH9HJ3YlIrgQ6P2cjOIIcuOyaq92fdo3rIPw
X-Gm-Gg: ATEYQzzaIB1EydXYwF6PIZlkdfSF6L7KtyGVTnh+pK3bRdokFN4rmVg9U9XSlq5vW+v
	5LJlGSqrC+TU1yhYXBELKb6TRBGez3zLtBCdSRlY1Qzm+2hR/MiGDEhuihVHHeSt4a+QJ1MT8El
	iu6r59gKsVUlQVNY9EOiTcci/pvbLIVYwV1iFrZvsxIkps1JJgeMNBN71EkIwkA34LqmQ68TmDi
	aYYLKMwQI9w7AIkZwCMJ2SSwepvO/zOSznGB0Pj1G0LYGpCQUhkyjV/UyRtjYfQ8bFb0V2onqkn
	oD34EXIJ0P9FB5+xulJFLEUHy19td71neBPNcMc5K7BFpDonsRNABsxAJQkee+70Og4dKFPBgZE
	7fOm091p8wZyXLu7UwNGUv1+HHGF2E4F+FSBzrZrksOYxvqINUe5mVfU/wmbxGujknfE9VYs618
	5QdSPv2Vy/MJybHDlQUOaXarXDUhilu+pAARzlYxzGvMHZx6Q=
X-Received: by 2002:a17:903:240b:b0:2b0:c403:5554 with SMTP id d9443c01a7336-2b0cd9ebc73mr12883665ad.0.1774586045083;
        Thu, 26 Mar 2026 21:34:05 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc916152sm43279665ad.81.2026.03.26.21.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 21:34:04 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH] lib: utils: fdt_domain: add support for root domain region inheritance
Date: Fri, 27 Mar 2026 12:33:57 +0800
Message-ID: <20260327043357.3452008-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_213407_219273_AC0DFE44 
X-CRM114-Status: GOOD (  13.80  )
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

Add the "root-regions" property in domain device-tree nodes to
allow domains to inherit all regions from the root domain. This
simplifies configuration for domains that need access to most
root domain regions with only minor exclusions or additions.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 docs/domain_support.md     |  4 ++++
 lib/utils/fdt/fdt_domain.c | 46 +++++++++++++++++++++++---------------
 2 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 93186c4a..a88f1cfb 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -159,6 +159,10 @@ The DT properties of a domain instance DT node are as follows:
 * **possible-harts** (Optional) - The list of CPU DT node phandles for the
   the domain instance. This list represents the possible HARTs of the
   domain instance.
+* **root-regions** (Optional) - A boolean flag indicating whether this domain
+  inherits ALL memory regions from the root domain. If this property is present,
+  the domain will include with all root domain regions and then overlay with
+  regions specified in the **regions** property for additional restrictions.
 * **regions** (Optional) - The list of domain memory region DT node phandle
   and access permissions for the domain instance. Each list entry is a pair
   of DT node phandle and access permissions. The access permissions are
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index b2fa8633..45407c22 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -373,25 +373,35 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	if (err)
 		goto fail_free_all;
 
-	/*
-	 * Copy over root domain memregions which don't allow
-	 * read, write and execute from lower privilege modes.
-	 *
-	 * These root domain memregions without read, write,
-	 * and execute permissions include:
-	 * 1) firmware region protecting the firmware memory
-	 * 2) mmio regions protecting M-mode only mmio devices
-	 */
-	sbi_domain_for_each_memregion(&root, reg) {
-		if ((reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE) ||
-		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE) ||
-		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
-			continue;
-		if (preg.max_regions <= preg.region_count) {
-			err = SBI_EINVAL;
-			goto fail_free_all;
+	if (fdt_get_property(fdt, domain_offset, "root-regions", NULL)) {
+		sbi_domain_for_each_memregion(&root, reg) {
+			if (preg.max_regions <= preg.region_count) {
+				err = SBI_EINVAL;
+				goto fail_free_all;
+			}
+			memcpy(&dom->regions[preg.region_count++], reg, sizeof(*reg));
+		}
+	} else {
+		/*
+		 * Copy over root domain memregions which don't allow
+		 * read, write and execute from lower privilege modes.
+		 *
+		 * These root domain memregions without read, write,
+		 * and execute permissions include:
+		 * 1) firmware region protecting the firmware memory
+		 * 2) mmio regions protecting M-mode only mmio devices
+		 */
+		sbi_domain_for_each_memregion(&root, reg) {
+			if ((reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE) ||
+			    (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE) ||
+			    (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
+				continue;
+			if (preg.max_regions <= preg.region_count) {
+				err = SBI_EINVAL;
+				goto fail_free_all;
+			}
+			memcpy(&dom->regions[preg.region_count++], reg, sizeof(*reg));
 		}
-		memcpy(&dom->regions[preg.region_count++], reg, sizeof(*reg));
 	}
 	dom->fw_region_inited = root.fw_region_inited;
 
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
