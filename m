Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4899CA5FED
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQArDWSVj9AmHh183sLBNFQD4w50BX2iCreI7AqXPVg=; b=vF1P5X9xXwuklm
	qR542olRVzWpLx5phL9SI61VMyz2kx/740r9vPFcCs0gTTSDm1Y247g7s/IZe2gyeEx2vlnihcpSP
	IExksbXIdPR2JW4NOZ0ROCE24h7l0Ulyea9/npEhXeeo2NB/z+T4rvI0f+X6wj8iroePljh7S4W5n
	UPS7lRag/U2JeHY7/f3vUbhcT2Fep1UWF9zR/VOMNEXaH1N9zG814tcwZ5TthPsop5uUiRsCKbvql
	zVCrG2vCLC+D/lSfuZgAVYeP9u/7U52wjIbO0rbZBXwEKNRY5DSZsKCeAHndOL8Detg4gHhTCLW/v
	7QMCmwH/wBUq2zdeS/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR72-0000000HT6F-2SKC;
	Sun, 18 Jan 2026 11:38:32 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6t-0000000HSsx-14Go
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736303; x=1800272303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=en4q5LItON6OlcbHhIshtiOHGc6O8wy14GU4nOVAqxo=;
  b=kfoSucjzhF4gvY94B/mxu6L0p+coKkAVhJKkBUDN+4GxapzDjVvNIxrc
   ucoyotHYr0Kq1DGT8RGthQsbERsxGZA3ta8mrrcqH1HJ8D3jzqzR9Jskl
   kVzrGdxTpeiaWaabXyxUIKrtUOV8s0ne84rTuOySvkNPEkwzMutBbfNGO
   bLvwnTsjk1+yIZpbUrW5mBTHFg4f2oPtLNrbcgewMTFgOlJw2EePu//mM
   IdyyGYE76GXeCvANDUUlzToU7DMvz2OXhv97oMSPDtGzQz9zN95bFAqiV
   dyL6Mq7O4pH//T+4hTpurmyC7c2ZkBJ0jxDgh03axSJNvBVsfagnwg/9o
   A==;
X-CSE-ConnectionGUID: pGyy4ODBQxyFdhw0aArWHw==
X-CSE-MsgGUID: 66MI6X7eRge1QodbPlIYPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:20 +0200
X-CSE-ConnectionGUID: oh857mdBRfyXuinc1yj2vA==
X-CSE-MsgGUID: g6brjbBqSGqsT5hKcySpWA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:06 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:19 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 14/20] platform: generic: mips p8700: CPU clusters
 memranges
Date: Sun, 18 Jan 2026 13:37:56 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-14-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033823_594577_0326D560 
X-CRM114-Status: GOOD (  13.21  )
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

Reserve memory regions for CPU clusters according to P8700
cluster memory layout.

There's a set of components in the CPU cluster according to [1]

[1] https://mips.com/wp-content/uploads/2025/11/P8700-F_Programmers_Reference_Manual-TM.pdf

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h |  1 +
 platform/generic/mips/boston.c        | 26 +++---------------
 platform/generic/mips/eyeq7h.c        | 25 +++--------------
 platform/generic/mips/p8700.c         | 51 +++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 44 deletions(-)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index ad7353f8a64a5194e7e933efd8e1276fb8c6f458..4cda183ec0a22a90d13242473641ce3e6d896a6b 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -192,6 +192,7 @@ struct p8700_cache_info {
 
 void mips_p8700_cache_info(struct p8700_cache_info *l1d, struct p8700_cache_info *l1i,
 			   struct p8700_cache_info *l2);
+int mips_p8700_add_memranges(void);
 struct fdt_match;
 int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match);
 
diff --git a/platform/generic/mips/boston.c b/platform/generic/mips/boston.c
index 86e14c1eea7e629f70b118be326dc1de1f099f30..ece60a7e5e5272bd767cacd9a65346b6a4e686f8 100644
--- a/platform/generic/mips/boston.c
+++ b/platform/generic/mips/boston.c
@@ -43,30 +43,12 @@ static int boston_early_init(bool cold_boot)
 	if (rc)
 		return rc;
 
-	if (cold_boot) {
-		unsigned long cm_base = p8700_cm_info->gcr_base[0];
-
-		/* For the CPC mtime region, the minimum size is 0x10000. */
-		rc = sbi_domain_root_add_memrange(cm_base, SIZE_FOR_CPC_MTIME,
-						  P8700_ALIGN,
-						  (SBI_DOMAIN_MEMREGION_MMIO |
-						   SBI_DOMAIN_MEMREGION_M_READABLE |
-						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-		if (rc)
-			return rc;
-
-		/* For the APLIC and ACLINT m-mode region */
-		rc = sbi_domain_root_add_memrange(cm_base + AIA_OFFSET, SIZE_FOR_AIA_M_MODE,
-						  P8700_ALIGN,
-						  (SBI_DOMAIN_MEMREGION_MMIO |
-						   SBI_DOMAIN_MEMREGION_M_READABLE |
-						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-		if (rc)
-			return rc;
+	if (!cold_boot)
+		return 0;
 
-	}
+	rc = mips_p8700_add_memranges();
 
-	return 0;
+	return rc;
 }
 
 static int boston_nascent_init(void)
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 17d010847ba0a5ccb2bf0a8dae7210f50ea49545..52fdadda4764def0a5015b2dc03f3a5450e64acb 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -275,28 +275,9 @@ static int eyeq7h_early_init(bool cold_boot)
  * 0x08_00000000  0x10_00000000   M:---- S:-RWX DDR64
  * 0x10_00000000  0x20_00000000   M:---- S:IRW- PCI64 BARs
  */
-
-	for (int i = 0; i < p8700_cm_info->num_cm; i++) {
-		unsigned long cm_base = p8700_cm_info->gcr_base[i];
-
-		/* CM and MTIMER */
-		rc = sbi_domain_root_add_memrange(cm_base, SIZE_FOR_CPC_MTIME,
-						  SIZE_FOR_CPC_MTIME,
-						  (SBI_DOMAIN_MEMREGION_MMIO |
-						   SBI_DOMAIN_MEMREGION_M_READABLE |
-						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-		if (rc)
-			return rc;
-
-		/* For the APLIC and ACLINT m-mode region */
-		rc = sbi_domain_root_add_memrange(cm_base + AIA_OFFSET, SIZE_FOR_AIA_M_MODE,
-						  SIZE_FOR_AIA_M_MODE,
-						  (SBI_DOMAIN_MEMREGION_MMIO |
-						   SBI_DOMAIN_MEMREGION_M_READABLE |
-						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-		if (rc)
-			return rc;
-	}
+	rc = mips_p8700_add_memranges();
+	if (rc)
+		return rc;
 	/* the rest of MMIO - shared with S-mode */
 	rc = sbi_domain_root_add_memrange(MMIO_BASE, MMIO_SIZE, MMIO_SIZE,
 					  SBI_DOMAIN_MEMREGION_MMIO |
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 4e693bc0046e0ba0d52d9e3aaafc88be8416145c..c2f41ee7b066c488757c3e4187962ec10e9c0966 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -168,6 +168,57 @@ void mips_p8700_cache_info(struct p8700_cache_info *l1d, struct p8700_cache_info
 	}
 }
 
+/**
+ * See CPU cluster memory map in the table below
+ * To save PMP regions, group areas with M mode access, marked (1) and (2)
+ *
+ * GCR_BASE offset   |   |   | Block Name   | Description
+ * 0x00000 - 0x01FFF | M | ^ | GCR.Global   | Per-cluster CM registers.
+ * 0x02000 - 0x05FFF | M | | | GCR.Core     | Per-core CM registers.
+ * 0x06000 - 0x07FFF | - |(1)| Reserved.
+ * 0x08000 - 0x09FFF | M | | | CPC.Global   | Per-cluster CPC registers.
+ * 0x0A000 - 0x0EFFF | M | | | CPC.Core     | Per-core/Per-device CPC registers.
+ * 0x0F000 - 0x0FFFF | - | v | Reserved.
+ * 0x10000 - 0x1FFFF | S |   | uGCR         | Reserved for user defined CM registers.
+ * 0x20000 - 0x3EFFF | - |   | Reserved.
+ * 0x3F000 - 0x3F0FF | ? |   | FDC.Global   | FDC.Global registers.
+ * 0x3F100 - 0x3FFFF | ? |   | TRF.Global   | TRF.Global registers
+ * 0x40000 - 0x4BFFF | M | ^ | APLIC.M      | APLIC Machine registers.
+ * 0x4C000 - 0x4CFFF | M |(2)| APLIC.custom | APLIC custom registers.
+ * 0x4D000 - 0x4FFFF | - | | | Reserved.
+ * 0x50000 - 0x5FFFF | M | v | ACLINT.M     | ACLINT Machine registers.
+ * 0x60000 - 0x6BFFF | S |   | APLIC.S      | APLIC Supervisor registers.
+ * 0x6C000 - 0x6FFFF | S |   | ACLINT.S     | ACLINT Supervisor registers.
+ * 0x70000 - 0x7EFFF | - |   | Reserved.
+ * 0x7F000 - 0x7FFFF | S |   | GCR.U        | User Mode GCRs.
+ */
+int mips_p8700_add_memranges(void)
+{
+	int rc = SBI_OK;
+	for (int i = 0; i < p8700_cm_info->num_cm; i++) {
+		unsigned long cm_base = p8700_cm_info->gcr_base[i];
+
+		/* CM and MTIMER */
+		rc = sbi_domain_root_add_memrange(cm_base, SIZE_FOR_CPC_MTIME,
+						  SIZE_FOR_CPC_MTIME,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+
+		/* For the APLIC and ACLINT m-mode region */
+		rc = sbi_domain_root_add_memrange(cm_base + AIA_OFFSET, SIZE_FOR_AIA_M_MODE,
+						  SIZE_FOR_AIA_M_MODE,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+	}
+	return rc;
+}
+
 int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	const struct p8700_cm_info *data = match->data;

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
