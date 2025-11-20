Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7B2CF8579
	for <opensbi@archiver.kernel.org>; Thu, 20 Nov 2025 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mc6jc0N/TffxEQrRYxZ0O8qVrkXnhoK1rCowpAYtci8=; b=P3sZAC/W4N7LUy
	H7YFXF8aKVhMRIuv0cGPDFSN4x/8/wU+n6YFMLSzUuVULl+FyetcbUZmxF9eZzcSwvf831HhSKD6D
	jcO9CZMPBTLgQjmdXlDL+kXaXx4hqUuHzwfFuiKfKC7hPkaAiobdNfZx2QTCsibv/E/x5Kqux9cnl
	+f9uTCR/06wltvCcDgeMbv9U3lyLbn2zh1/E5YXoTv5yWzaBG0oCnU3wO8UiaS+BbO33euQk7AL5u
	8at3OIpTcGIyOYWZi8wpaCB0YFwoe4Ynl4AzutxreSDAkiPGcrXC/st2ICbOn/nG8rHg87j1exUO2
	ioDieledEesKqalsNGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM15j-00000006Qp7-0jz7;
	Thu, 20 Nov 2025 09:36:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM15h-00000006Qnv-0pMs
	for opensbi@lists.infradead.org;
	Thu, 20 Nov 2025 09:36:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-297e239baecso15590445ad.1
        for <opensbi@lists.infradead.org>; Thu, 20 Nov 2025 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763631396; x=1764236196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiC2toBW1A3nq7r//SmnOLP7jgWgVXrMzFIrcuSgieU=;
        b=e4pCR8inuDNnXdo075AluyWRuohXtCggx1ZMDV5mOM0SaSiAYKpVEyUb43616c01kd
         qo4B+cZWYrv/aJpGP6I030wlTboFjOaTtpkyR5zkZ4tWPDDyKxwdaeSwOzLkmcmIbiQW
         pVeCKdr0foXk3HpFVw1kUoEtbLMp3PUwRCOxbNMq4KKjD9dRYRl2NBNIZw/uf7m2Pg/G
         MtrV6B9E6WDNipuZ00c2ZJDz+UvjwaXAtkZU+zfV6J58bIQBgrb1q8TPiSGz7Zqwjm3c
         Ht1TdiU+rg2dECiOPx4SU1nRGc/iUDuo7C5JjELUTNYhIyKFWofrYsREtp71SY4Q7rgl
         6ZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631396; x=1764236196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uiC2toBW1A3nq7r//SmnOLP7jgWgVXrMzFIrcuSgieU=;
        b=ArHxJTPRCAiHXFIG8IK6MAwgpcUqSDcCZl9bLTiQ4gieoL3o60CCJTVGcbUfyv36qi
         WEbHjBtUW/anPRHJ5+OVOZOc09MszRI7Imln98JtsV0zfCdscPLSVgGl2UoDji2kwILW
         hEHEcFckg/97UV4J3DxKnDP9DOke+xXMDL9Lf8QuJYz71qZVVFjuLhNc43HvE94xKr+S
         BWXrFa/xBksViKK6Yotuxjt6sJu9CdSRUaqIYwsgYjZulHPf3ZPvhSlKhYvlGY4v5LL3
         dAt6SpF30rrCm5e2rQMdy8rEGE1W0TlOsy2HGIMnsp6wqsM/3oemBBT22m9gAkfS2YQU
         MdTw==
X-Gm-Message-State: AOJu0YwtSAbpQI7HkbEOvw/9d2qqnXW2SkadzTNMvtNq10v7SDDUgOAr
	7mlIxcdgrMXHSi4lQQMu/B0t9lRSFK7TlR0L695mUj4TZLemOW4WeDIDAzImCl1Y
X-Gm-Gg: ASbGncsUg3qd6/phVCeDaOnQnN0jTs7ELxNhzRwQcjZEz/lbbfTKNFexXIieD4QOxyp
	zT0NQaHh20mnbVJ+xMpn/egXAb+f/M/+InudxBroc8YZZzp14pbIrG9VViZZ+gNv0OXmP2de05b
	tQW7T/OVzpPYYIe2vWkvTT2mHL+cV53hjOQSIOTAPbPvZwnnTFgxZfS44JX0wIrSRLnVSPu0o0Q
	WynvDCUVSj9HOb2zNT//3Q+BcOhX1CmFIecM/7WJaj7SLmln+QI89IO6syYdwjkux7pNg3RUHMI
	HHXEyJpPwOLH+DNv4JTkhuKmxU8ySdm/rnBX9fDXGVg6pyOK8twrVrY5fWv1YL+OWmQPInLPgB5
	1TkiqEdYUNQgIb1ILy8q0oEOVrlHePZz7np9UWTJ4InvMR1DYDfZbZsZPRmhJZWP2S8JIKcmtPK
	Ts24egwTq1TEWI
X-Google-Smtp-Source: AGHT+IGzxacio9dn8i4sMXFPgzqJ0y75BYG1Zgn3KB5FtApSEMYqnKeC7IX0kwjPdpUQRgDv3G7iFg==
X-Received: by 2002:a17:902:cf4c:b0:295:6117:c597 with SMTP id d9443c01a7336-29b5e2cdb65mr25228845ad.5.1763631395901;
        Thu, 20 Nov 2025 01:36:35 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34726696b52sm2019042a91.1.2025.11.20.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:36:34 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v3 2/4] lib: sbi: give platform choice of using single memregion to cover OpenSBI
Date: Thu, 20 Nov 2025 01:34:38 -0800
Message-Id: <20251120093440.4533-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120093440.4533-1-ganboing@gmail.com>
References: <20251120093440.4533-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_013637_238244_E7CC4F70 
X-CRM114-Status: GOOD (  15.10  )
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

By default the OpenSBI itself is covered by 2 memregions for RX/RW
sections. This is required by platforms with Smepmp to enforce
proper permissions in M mode. Note: M-mode only regions can't
have RWX permissions with Smepmp. Platforms with traditional PMPs
won't be able to benefit from it, as both regions are effectively
RWX in M mode, but usually it's harmless to so. Now we provide
these platforms with an option to disable this logic. It saves 1
PMP entry. For platforms really in short of PMPs, it does make a
difference.

Note: Platform requesting single OpenSBI memregion must be using
      traditional (old) PMP. We expect the platform code to do
      the right thing.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_platform.h | 21 +++++++++++++++++++++
 lib/sbi/sbi_domain.c       | 36 ++++++++++++++++++++++++------------
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index a53e1797..f414514f 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -76,6 +76,9 @@ struct sbi_platform_operations {
 	/* Check if specified HART is allowed to do cold boot */
 	bool (*cold_boot_allowed)(u32 hartid);
 
+	/* Check if platform requires single firmware region */
+	bool (*single_fw_region)(void);
+
 	/* Platform nascent initialization */
 	int (*nascent_init)(void);
 
@@ -359,6 +362,24 @@ static inline bool sbi_platform_cold_boot_allowed(
 	return true;
 }
 
+/**
+ * Check whether platform requires single firmware region
+ *
+ * Note: Single firmware region only works with legacy PMP because with
+ * Smepmp M-mode only regions can't have RWX permissions.
+ *
+ * @param plat pointer to struct sbi_platform
+ *
+ * @return true if single firmware region required and false otherwise
+ */
+static inline bool sbi_platform_single_fw_region(
+					const struct sbi_platform *plat)
+{
+	if (plat && sbi_platform_ops(plat)->single_fw_region)
+		return sbi_platform_ops(plat)->single_fw_region();
+	return false;
+}
+
 /**
  * Nascent (very early) initialization for current HART
  *
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 32e4c882..afda7365 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -925,18 +925,30 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	root.possible_harts = root_hmask;
 
 	/* Root domain firmware memory region */
-	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
-				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
-				   SBI_DOMAIN_MEMREGION_FW),
-				  &root_memregs[root_memregs_count++]);
-
-	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
-				  (scratch->fw_size - scratch->fw_rw_offset),
-				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_WRITABLE |
-				   SBI_DOMAIN_MEMREGION_FW),
-				  &root_memregs[root_memregs_count++]);
+	if (sbi_platform_single_fw_region(sbi_platform_ptr(scratch))) {
+		sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
+					  (SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+					   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
+					   SBI_DOMAIN_MEMREGION_FW),
+					  &root_memregs[root_memregs_count++]);
+	} else {
+		sbi_domain_memregion_init(scratch->fw_start,
+					  scratch->fw_rw_offset,
+					  (SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
+					   SBI_DOMAIN_MEMREGION_FW),
+					  &root_memregs[root_memregs_count++]);
+
+		sbi_domain_memregion_init((scratch->fw_start +
+					   scratch->fw_rw_offset),
+					  (scratch->fw_size -
+					   scratch->fw_rw_offset),
+					  (SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+					   SBI_DOMAIN_MEMREGION_FW),
+					  &root_memregs[root_memregs_count++]);
+	}
 
 	root.fw_region_inited = true;
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
