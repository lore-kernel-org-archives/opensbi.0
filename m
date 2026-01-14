Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DD2D31A2F
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaV4wKX2Qctcxd3xMhfYN9JVS7mS1m7oahRdw3H/ICs=; b=4vKxns8GSxEvTl
	W3ASV0iQK1ItpyyGYjDUqimCSZ+POBVlmfxrDdTFzmZX712JWI3ixFC7DVy3g8L43CQyVDsLX/SNQ
	4his3xTDpkVGyHyJLwJjC1LCF2GE0kGbEWGABEOq0CY7mqZWR7QVR2LXsURV6bkiOvnkkNE5fzV4R
	1AMmlYZbUuP1rfcxEf6ulnMyDjNoAdvm5yLNYKmoAsKwMpwfZUTLiLJloV/FDswvCHKzvk9CruvYH
	JhPF/9IW0F7fdLYKPqCsZY0JuEPlHOWGDdmApu5RtwAltDUcjzxi1WooZdYpJq2AhpFE8nbcMsUqi
	8gc1EL/H2cCtgBPqI6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4V-00000008VyA-3mk5;
	Wed, 14 Jan 2026 09:21:47 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4O-00000008Vdu-3CH0
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382500; x=1799918500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LDGa3f16SVKfBzlK00VRVvfJHYitBb1ZCFh5y6wxR6k=;
  b=VJbfznufNhXJ3fuCbuS5FXf9MdjL5GF3iDdRVS5VwYx+fOx6l9vcmBU/
   9shzmd0u7xuJwIl3bJPu/51tBQscaeAxEdUrOGRCRGGILQOpCxeUANstk
   /Tk9Oo9x3nhsKV1MbnYVIlSP2E5y3qw2C5aFz3yZlcTGI+xpyJhxZGHX7
   5Pp7lVCtIlt4fTVJqjeTmUNaHaPvJTvyBWcDCGQ7ftgSE3xnClVA3hnZz
   +dEA9uRgg4ztjPCSi1mdT2QvG0/h/BJJNj2m/EgucmNFExR5+Ao7ivJ4t
   02mEGB8ypQ4hwRQ0CsoBa4Qe6CiTLzRorYwfpZLHrcmTXDPLl/8htqECG
   w==;
X-CSE-ConnectionGUID: Fi5jE+wlQrK2V2arXC2B4A==
X-CSE-MsgGUID: JeCPLRjdTm6GFV+w5VnzHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:39 +0200
X-CSE-ConnectionGUID: xgRPQaOvSnOXczwdKPGc6w==
X-CSE-MsgGUID: 4GSCm+8JSuO1HFAIgXktuw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 14 Jan 2026 11:23:24 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:38 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 17/22] platform: generic: mips p8700: generic memranges init
Date: Wed, 14 Jan 2026 11:21:13 +0200
Message-ID: <20260114092118.1315581-18-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012141_108494_FD1D7C2E 
X-CRM114-Status: GOOD (  16.86  )
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
cluster memory layout

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h |  1 +
 platform/generic/mips/boston.c        | 26 +++-----------
 platform/generic/mips/eyeq7h.c        | 25 ++-----------
 platform/generic/mips/p8700.c         | 51 +++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 44 deletions(-)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index ad7353f8a64a..4cda183ec0a2 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -192,6 +192,7 @@ struct p8700_cache_info {
 
 void mips_p8700_cache_info(struct p8700_cache_info *l1d, struct p8700_cache_info *l1i,
 			   struct p8700_cache_info *l2);
+int mips_p8700_add_memranges(void);
 struct fdt_match;
 int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match);
 
diff --git a/platform/generic/mips/boston.c b/platform/generic/mips/boston.c
index 86e14c1eea7e..ece60a7e5e52 100644
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
index 9fbfd4227ba0..0cdb93ba0fe7 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -329,28 +329,9 @@ static int eyeq7h_early_init(bool cold_boot)
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
index 27dc91c62a63..01826b1e308a 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -169,6 +169,57 @@ void mips_p8700_cache_info(struct p8700_cache_info *l1d, struct p8700_cache_info
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
