Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C156D65C4F
	for <opensbi@archiver.kernel.org>; Wed, 17 Dec 2025 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nfz38FNpAx3W/lpGmASinZqwNhtm2NxkSTFmyFE6L0=; b=RsAnE56Vl3BtKo
	cuBk6Dx5yPaVZCbuQOxZXS1hk0I8cRZy1NMuxzVPDbyl9IBv+fIfBrdp8NF0tT13k1QyJ5S6lK3Zx
	Ms1IgmvRywmUblsx4veYl/LSqi4zrcwhFdYOLJgIJrTmt8aNSkpYvtAnUaMmFIiduLbRCLxBODx/9
	swg/INa1xIu6HUABfUcafmYc4n7nVgou7jZNM1ttFGEG8X1YsGzUTjP8r7OEQV+JLi5a5ugZl8BrC
	yjTIdAEFudi6rGwggz6yC7DhjlBbASUWdGEFcDvYFOgoW7hPugk3Tev9/Mel3k9BIllog+EGUeo64
	oVrPgrNIr2pv26j/eN1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrdB-00000006r3V-4Bmd;
	Wed, 17 Dec 2025 13:31:54 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrd9-00000006r1b-0KfO
	for opensbi@lists.infradead.org;
	Wed, 17 Dec 2025 13:31:52 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6539724b3a.1
        for <opensbi@lists.infradead.org>; Wed, 17 Dec 2025 05:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765978310; x=1766583110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2hsTq8w/WzfYOcHXKGHmf3j6fEqMXj5p0XzGLliv9k=;
        b=dPk3yxbu1hur4T+dx8F9rZRo47k0Ppv0SNvgkklFsGH2Nlk71gtA73P53ZcrPrw70x
         47AQ+Zy4H7+oCIgmqT3CgCJVsiVItx8FFXMpQrJe0fRsJmJoRbcAYbqbNNsbDb5hhMkP
         N+aOuEqTDjzeJ88GQmhiIa0EghE7eh+aea4os1H48ax9Qwg1H68RrlCDy3vRx0WDEdqM
         tK3RvjmNS8HdMQ7xmTRhqOVjNyOts4PnOvi4qiDK6g7NqIAH8k/WH/rQIdozr13P5yDe
         7RDbH6fyKr2lrmf+KVgZJobdfPfOrywzQxlrMkMq4juLIG1nvaDFBiWwx8ujRwDAl7mS
         i5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978310; x=1766583110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2hsTq8w/WzfYOcHXKGHmf3j6fEqMXj5p0XzGLliv9k=;
        b=jZUbcKtNXAr1A1tJAdfYMZKJaF8o4MjxhJXOanNl6UgS1xnPW+RVuo9uIB6ZrstMcx
         Neig6cFAaPyzdg/TEEpa381+PchrbgHQylRJpGAHtOXq/sJHXoQafJqX8zkOuXQK0IUs
         FN9F7+WCKaRDEUuyKPL0tA9M+ZopXar2q/hsRHRL0n3Q1tSFzqGSCRTIEiK8ZQoKd5fK
         hrmneguQSag4xWP7l/T+bqv6ikWDrXd9gaOFaAvJ31cswPdcrYRsQm1qHkwtLzlcJ0cr
         miUHE5qBO4tbZ9E13JISt5I1CfoQl7f4o/cJK1YLEkSbOVOQB64DAAiRd1EWLfIbJ5zb
         zmVw==
X-Gm-Message-State: AOJu0Ywf1XH9uB8xrdwOa8yLi1YRLTsUoDrmdFHQrdqpmC5BpDihQfA0
	dhSoeMdpjVaFdbJgx5csAwcJ65hUDF3GDYf5EvqrCDETihjSAeyPDEEsvPaNRw==
X-Gm-Gg: AY/fxX6g7vU1R2Jz9pJ/n0fI5xKjVqUYdC0KpUfSqRWDWhJBOcoiCSviWuZUTXU7LkN
	C9nRdELDhNG9h5YM/8kEnom+0USkHbbC4LV2NMPqlMHbBpg6s3+jk8PK47qLgX2BXjaJXXW0M0o
	ZfM9fAgdTIGXclRE7NsAXV+pljmCYDxkBskldVYcO75YgjNX+4Sr+ZxTKNruMHyYwFKsCb4LnAr
	JXBfjQK/2INO/orzXvgE7+qUukY4/ULmygj3KKev+bgE4BLc1nEvJqxgH0t6IqkoaaKaELv8J7b
	USE/cjpO0jfR3OyEGS6x5KDbShQuKRBNcuTcNV0UKvfLOs33wGEk/pWCFmP5bbiN8TpF0EghfiT
	ymZRa7QLJNvWJGKbyA4rd9GM0e90fU+btXqPIW4Etz9rbxoxXZtnBBxv0tc20ynuv+pQkTaxGVz
	Fycl+P4ybcf50g
X-Google-Smtp-Source: AGHT+IEdL7xDPoKgEcAniPoGXaYqT6MMJFPWMJVvDPMa8dhixjJyHqlT9QfkqUtHT/i7caTXPpgw2g==
X-Received: by 2002:a05:6a21:6da8:b0:34f:7454:b977 with SMTP id adf61e73a8af0-369b6aae3e0mr18819648637.48.1765978309571;
        Wed, 17 Dec 2025 05:31:49 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc1c4ef2sm2809104b3a.65.2025.12.17.05.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:31:48 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v5 4/7] lib: sbi: give platform choice of using single memregion to cover OpenSBI
Date: Wed, 17 Dec 2025 05:29:56 -0800
Message-Id: <20251217132959.545197-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217132959.545197-1-ganboing@gmail.com>
References: <20251217132959.545197-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_053151_125069_6F1B69BA 
X-CRM114-Status: GOOD (  14.78  )
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
index d75c12de..e65d9877 100644
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
 
@@ -347,6 +350,24 @@ static inline bool sbi_platform_cold_boot_allowed(
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
index a19bf25b..90cbb540 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -923,18 +923,30 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
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
