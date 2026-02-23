Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33103EA4FCB
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVhJ66LONMs0sPuOR8BLsu+JQYarJkeA3om6GppOdpw=; b=GRda3qwy+zuS6M
	AMkugOAnobKw37m+62GRMrcvIe24/zSc8AIS5CkrRUgdDD78IQImXc9bDXbXdajFUEmTtNxJ6gPLp
	Xh+toVmL62Ce47J5Hmh/mekEb+oXgSLwNw2y/JSN204XtyUSYwlQy5gg87vZ/GW+/K0s4xb6neQ/g
	qFc+qhQMFV70OsrAI/8F2Ov6HprkhyZiD2TtNz8bpa1zIHBL6k7oKL8kSJZI+qCH5KelDrWPftPSY
	toVK5V7amuBnsz/d7zpSBbFoysYljvW90YnjIbGO5/d4HMpjgvzmDmVULfSdrdhws9Jt3w/CjBtlm
	9jxBkltaix25QGlwqoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLa-00000000Vqg-46Od;
	Mon, 23 Feb 2026 14:55:42 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLX-00000000VVR-1HhH
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858537; x=1803394537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QLi8G+HUFT1mD3CqjbXeSsuDqkpe05CWjv5sGdaGXFg=;
  b=Dwz8gksXMx9K3BFr83iaLKj6/pkUeh8jkRqaS/pi4vzVO0ZTlXFGUnVF
   Lv4/yBAncXeNG0v7u0A6dn64J0rpvNj1vP/OaFY7UWz7dt7+uYLalICAv
   wyivf97elu4JjUTKYhNX6e9nZMl6KH685OVPnC9F7pyQ3XHHexxxwuPEr
   hSIbfpWQ7t1WLw0zYxl1NJcdbU8zfmJr5cfCgDpZ32u9DJv216oSj0TP0
   MIG7985tDKXrGe64G5XIeGVuY0f5gfXjf5UfqDcsh3KP1QbHMfWr4p6En
   nrucT4LM54Cv5olbsER5J74yHeKKTAq4AFyf2LOSrBIxnG9NWbBMZvVJ9
   w==;
X-CSE-ConnectionGUID: qI7r+ZoDSMW1Btie+JMykQ==
X-CSE-MsgGUID: 8+szSEiFTJSD/7ATwupSgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:36 +0200
X-CSE-ConnectionGUID: JsHR9RJRS5eg5gNA2BNy4Q==
X-CSE-MsgGUID: 8ckJAfmdT9uk8Fnk6HtcQQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:11 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:37 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 15/23] platform: generic: mips p8700: CPU clusters
 memranges
Date: Mon, 23 Feb 2026 16:54:54 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-15-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065539_622716_88840839 
X-CRM114-Status: GOOD (  13.02  )
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
index 816ac6f57c836bef0785c298aa918536d75cd6da..c6e688e2b2498ec157fc743a6c454996ac7ad356 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -277,28 +277,9 @@ static int eyeq7h_early_init(bool cold_boot)
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
