Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885EDEA4FD1
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maKWuGm4RJ5A/ZeLGOYEPlMFq4eV4OsaXQ8p14sgFVg=; b=DFccQV2ScrIwCl
	MtagMujNZJrBehLGTD6tnJP7yuLxe8qcU+lRUCAhkEjqhrq6CHy4orv1CR+HZyJNZlepbK2A5+NS5
	51l1rZWpuHsXS7FAiM0NAVdh0hx6N0JIfjFFTUGbwD4OYPv8hLp6oUFjF5QZ3tQwvleYQPLuBkrAP
	wbszSf6wIJ7S/BHztLwSafEnR3ji5kkXJL5vO4GetdMS9kwMY+7jg/i7g15+RV9p4/3O/VveWzGOs
	2Le5Qq5Z6re1CPgpVilanIsq/Op3Or9/KNZWvN57IEgo4JA6qYn2wsWFPi2UCTMLr3uJErAhVJ5tH
	KGzSr+loITvOZaWLH45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLT-00000000VcK-0Njl;
	Mon, 23 Feb 2026 14:55:35 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLO-00000000VVL-3D1C
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858530; x=1803394530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NaVxmc7hQzAt9NncN1a65lqlJl1PkcJckvIaDdtK3y4=;
  b=LoHDs/4G3Fvy0pC9Y9Y/0e9HZtVipkreVQ8fY2yNRt9gM1WFvP3Nh/Ae
   WTp8QhH19JTfXrrPLFVt5sSAWqYVjThZAa41Dj9CMTSQFvVE7QI6aLtoF
   UZojIG1ebKslqnsbsaRsT+6XtFPYnS0ciAvWD5ML7zznb50LkbfP6WYE9
   ivDRrI6jO5knJJCKvvb73dcCvIUuu5ciCtb+a6InXcGbVyYjkfuAnQ1P8
   HKs9rLZ2KwkceJwxD1qGo5ibwmqreU7OiQZHrutFvpJhGKn/8Aj3UZa92
   Wh8UFczLS6TAlP+r0QvW+cl324WO7g5tdSXsNwvT5COG/VPvDG6lB4g3O
   w==;
X-CSE-ConnectionGUID: kDdIFLQGQgWB85VrgMn8og==
X-CSE-MsgGUID: idg8/2eqS9S/D9In/WfRAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:27 +0200
X-CSE-ConnectionGUID: 8B5iq6LDSce8FqEm/PlV3w==
X-CSE-MsgGUID: bgtySSBuRMiMej30pmFcyw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:06 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:25 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 04/23] platform: generic: mips p8700: reserve memory for
 M-mode peripherals
Date: Mon, 23 Feb 2026 16:54:43 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-4-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065531_075192_1117F6F3 
X-CRM114-Status: GOOD (  12.31  )
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
