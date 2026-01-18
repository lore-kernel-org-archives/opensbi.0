Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D28CA5FF0
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maKWuGm4RJ5A/ZeLGOYEPlMFq4eV4OsaXQ8p14sgFVg=; b=W+LrKzEcsadvT2
	V5y4FK4n/quL7EJNFmoUTa3KNw4s0NrgYrZglLTanAz9+465t78LOTMR1Z66Aw+X+o0yP59eFVHR8
	hGnAOwhfKlxfhQxM3j2otbjv2u+9+43PY1DLqIbwgbstV7AY06o8ndWBqarQnIk7ErNTb8ZYqMapb
	LcL2uMNZ0C/h7l57DjZaNbVsA7NCFESpLlEPhXDMojYQk0IbRaCAfmDCssq/wKsEkEZdXNwlfBnIG
	Ra/TklIpkxTV12GptzAecq+14NtsFq7dgFI7Xmn8mu0+HfxvdR9uAbR4MvRPgcxNhTvjCo106jMlN
	1wDvyGSjOD/QDHNEpoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6q-0000000HStS-1b4y;
	Sun, 18 Jan 2026 11:38:20 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6i-0000000HSoh-2sPB
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736292; x=1800272292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NaVxmc7hQzAt9NncN1a65lqlJl1PkcJckvIaDdtK3y4=;
  b=MjQ4gV34Po3OuuAM6b9o+JRwwOGOHf8HtnB2pjATuFBj2Vb6YTxvaK0E
   JSgb160c9KBnVkGrlgJjj7U02+cwT9FfvgmnCiBZLGWzy592bEQUE8j/H
   Brn6yREiOLw1qCAMyNw8izUFLG+EEe6T3ko0gqHYTE56Yp7BK/wLpD2Ya
   cSbS0zjt8A5pJXAyvrcIfigS4g5oHqXyHdaLVTwZ8AoHGieprt3+HmowN
   HJo7V2Lbm7Pvo10ualcMbVm/RmEz46BWY/QXDOwpHDqLvLksAWIZd1Asl
   ACL/kIchi1Co9xTWcvzi0McV9j8TvBMpkWdeNf2scfSotPzbpVz5NrMKW
   w==;
X-CSE-ConnectionGUID: jesx3HWBTBa07iaw9MlIGQ==
X-CSE-MsgGUID: LRpt1GtfTiKFQeFmsZV29Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:08 +0200
X-CSE-ConnectionGUID: QKMUtbgtQ+a8uH0wFMqBOQ==
X-CSE-MsgGUID: zd5t11IOT+CbWdhSNbiXrw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 18 Jan 2026 13:39:58 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:07 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 03/20] platform: generic: mips p8700: reserve memory for
 M-mode peripherals
Date: Sun, 18 Jan 2026 13:37:45 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-3-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033813_126200_BF6DDEE3 
X-CRM114-Status: GOOD (  12.40  )
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

Reserve memory upfront in large well aligned chunks,
to avoid problem with PMP granularity that is
64Kbytes for the p8700 CPU

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/p8700.c | 97 ++++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 37 deletions(-)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index a25610a1165058f5eb7d5b871371ea309e1a8293..07cea604a4157bc77f968ae7ccb9a361a17972a7 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -17,6 +17,8 @@
 #include <mips/mips-cm.h>
 
 extern void mips_warm_boot(void);
+#define MMIO_BASE 0x00000000
+#define MMIO_SIZE 0x80000000
 
 static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 			       unsigned long prot, unsigned long addr,
@@ -38,7 +40,6 @@ static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 	csr_write_num(pmacfg_csr, pmacfg);
 }
 
-#if CLUSTERS_IN_PLATFORM > 1
 static void power_up_other_cluster(u32 hartid)
 {
 	unsigned int stat;
@@ -68,7 +69,6 @@ static void power_up_other_cluster(u32 hartid)
 		}
 	}
 }
-#endif
 
 static int mips_hart_start(u32 hartid, ulong saddr)
 {
@@ -152,23 +152,57 @@ static int mips_p8700_final_init(bool cold_boot)
 static int mips_p8700_early_init(bool cold_boot)
 {
 	int rc;
+	int i;
 
 	rc = generic_early_init(cold_boot);
 	if (rc)
 		return rc;
 
-	if (cold_boot) {
-#if CLUSTERS_IN_PLATFORM > 1
-		int i;
-		/* Power up other clusters in the platform. */
-		for (i = 1; i < CLUSTERS_IN_PLATFORM; i++) {
-			power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
-		}
-#endif
+	if (!cold_boot)
+		return 0;
+
+	/* Power up other clusters in the platform. */
+	for (i = 1; i < CLUSTERS_IN_PLATFORM; i++) {
+		power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
+	}
+
+/**
+ * Memory map:
+ * 0x00_20080000  0x00_20100000   M:IRW- S:---- GCR local access (CM_BASE)
+ * 0x00_40000000  0x00_70000000   M:IRW- S:IRW- Peripherals
+ *   0x00_48700000  0x00_48780000 M:IRW- S:---- GCR cluster 0
+ *   0x00_67480000  0x00_67500000 M:IRW- S:---- GCR cluster 1
+ *   0x00_67500000  0x00_67580000 M:IRW- S:---- GCR cluster 2
+ *   0x00_67800000  0x00_67900000 M:IRW- S:---- Ncore
+ * 0x00_70000000  0x00_80000000   M:---- S:IRW- PCI32 BARs, NOT USED - 32-bit mode
+ * 0x01_00000000  0x08_00000000   M:---- S:IRW- PCI64 BARs, NOT USED - PCI2PCI
+ * 0x08_00000000  0x10_00000000   M:---- S:-RWX DDR64
+ * 0x10_00000000  0x20_00000000   M:---- S:IRW- PCI64 BARs
+ */
+	/* CM and MTIMER */
+	rc = sbi_domain_root_add_memrange(CM_BASE, SIZE_FOR_CPC_MTIME,
+					  SIZE_FOR_CPC_MTIME,
+					  (SBI_DOMAIN_MEMREGION_MMIO |
+					   SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+	if (rc)
+		return rc;
 
-		/* For the CPC mtime region, the minimum size is 0x10000. */
-		rc = sbi_domain_root_add_memrange(CM_BASE, SIZE_FOR_CPC_MTIME,
-						  P8700_ALIGN,
+	/* M-mode APLIC and ACLINT */
+	rc = sbi_domain_root_add_memrange(AIA_BASE, SIZE_FOR_AIA_M_MODE,
+					  SIZE_FOR_AIA_M_MODE,
+					  (SBI_DOMAIN_MEMREGION_MMIO |
+					   SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+	if (rc)
+		return rc;
+
+	for (i = 0; i < CLUSTERS_IN_PLATFORM; i++) {
+		unsigned long cm_base = GLOBAL_CM_BASE[i];
+
+		/* CM and MTIMER */
+		rc = sbi_domain_root_add_memrange(cm_base, SIZE_FOR_CPC_MTIME,
+						  SIZE_FOR_CPC_MTIME,
 						  (SBI_DOMAIN_MEMREGION_MMIO |
 						   SBI_DOMAIN_MEMREGION_M_READABLE |
 						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
@@ -176,36 +210,25 @@ static int mips_p8700_early_init(bool cold_boot)
 			return rc;
 
 		/* For the APLIC and ACLINT m-mode region */
-		rc = sbi_domain_root_add_memrange(AIA_BASE, SIZE_FOR_AIA_M_MODE,
-						  P8700_ALIGN,
+		rc = sbi_domain_root_add_memrange(cm_base + AIA_BASE - CM_BASE, SIZE_FOR_AIA_M_MODE,
+						  SIZE_FOR_AIA_M_MODE,
 						  (SBI_DOMAIN_MEMREGION_MMIO |
 						   SBI_DOMAIN_MEMREGION_M_READABLE |
 						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
-
-#if CLUSTERS_IN_PLATFORM > 1
-		for (i = 0; i < CLUSTERS_IN_PLATFORM; i++) {
-			/* For the CPC mtime region, the minimum size is 0x10000. */
-			rc = sbi_domain_root_add_memrange(GLOBAL_CM_BASE[i], SIZE_FOR_CPC_MTIME,
-							  P8700_ALIGN,
-							  (SBI_DOMAIN_MEMREGION_MMIO |
-							   SBI_DOMAIN_MEMREGION_M_READABLE |
-							   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-			if (rc)
-				return rc;
-
-			/* For the APLIC and ACLINT m-mode region */
-			rc = sbi_domain_root_add_memrange(AIA_BASE - CM_BASE + GLOBAL_CM_BASE[i], SIZE_FOR_AIA_M_MODE,
-							  P8700_ALIGN,
-							  (SBI_DOMAIN_MEMREGION_MMIO |
-							   SBI_DOMAIN_MEMREGION_M_READABLE |
-							   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-			if (rc)
-				return rc;
-		}
-#endif
 	}
+	/* the rest of MMIO - shared with S-mode */
+	rc = sbi_domain_root_add_memrange(MMIO_BASE, MMIO_SIZE, MMIO_SIZE,
+					  SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW);
+	if (rc)
+		return rc;
+	/* PCIE BARs - MMIO S-mode */
+	rc = sbi_domain_root_add_memrange(0x1000000000UL, 0x1000000000UL, 0x1000000000UL,
+					  SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_SU_READABLE |
+					  SBI_DOMAIN_MEMREGION_SU_WRITABLE);
 
 	return 0;
 }

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
