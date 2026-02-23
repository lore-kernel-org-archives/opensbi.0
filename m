Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC072EA4FCB
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOKh/QwUXnvGfucz295uby2UgzFqtwbtF3tEfj9NJ78=; b=outaFoJU0BOLuG
	U52hqAAwOLkoTWd+dP8Z5rQYqVpqAuspcSIBrEm8qzIqor+C1mbk9rsn+POTbiJxXfeaePBBeshKp
	kxFti+XPVjCIhCyW2B190QtArYxgXZ31B09nuOUXlnhD1dMv+IPu8YqhE6tLDNzqrCMsD7wnB0mbO
	/RJ0ZadGnvfDS+HoDnvW42BwrnKH/kXt3nI0dTDbmkitoZX24I3mf3Hk2p9NSuWCK3hYulfSXRw0m
	+rLOnwslNK3m/ydSUODHSaidQHY/+59ik8bEbOgu0WdYGrnsSKDJvWY1camj5RjRbTy679PGUeNaf
	R1nb23Y3iukCkqzx25wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLg-00000000W1J-2XWI;
	Mon, 23 Feb 2026 14:55:48 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLc-00000000VrU-2PqS
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858542; x=1803394542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=am0lrIKTexnt7ETkrEWRq2hUiO6CFhy2+F3Xa9f94NM=;
  b=gSNCmk2iLE73HGYsM7Kogok8UQdzdJKIKP5BNNs6yoQeEoJJa1ayfoPR
   UIRIWAi92KUo6QvAdO7ORkA6Vo5YFGbS4iVoSKrTW/6yWYwOoX6wjs3y9
   Y009cmZ44liffdroaf0MFPRB5gG+D4Slj9nxE2y59aapnZHZGPvcfHA+c
   54nkuLx6NSEPrKrNJgPY1WWaMuWJggkZlf86TLpH+Ydvs3N1y83oC3yd5
   bvzKwG4DxLBDzmZ+PdYPDpIBLenk7yvwPOp/WNXlTSUQ7SEM31JlSmZ6z
   svpD5LoIa9F5Bk2b71jL3vlPGbZifVZF6BKlka+I/xfNBixAWEqX9T/YS
   w==;
X-CSE-ConnectionGUID: 5r1ggCDsQQyE79R8E3l/aw==
X-CSE-MsgGUID: py7kehQWTk+92gpZKFpNoQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:40 +0200
X-CSE-ConnectionGUID: 4+WqnF2KRDqEOEU65r6Iew==
X-CSE-MsgGUID: WHDkVmpzS4ShB1HxRh17sg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:22 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:41 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 19/23] platform: generic: mips eyeq7h: fix NCORE
 registers access from clusters 1..2
Date: Mon, 23 Feb 2026 16:54:58 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-19-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065544_915409_0434BAF7 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

CPU clusters 1 and 2 cannot access NCORE registers through AUX ports.
AUX ports of clusters 1 and 2 are connected to NCORE through east port.
East port has no access to NCORE registers address space.

Re-route NCORE registers range to MEM port by re-configuring MMIO
regions in the GCR. REsulting map is as below. Mind a gap between
regions [1] and [2]; this gap covering NCORE registers now routed
to the default MEM port
Cluster 0: 4 MMIO regions
  [0] : 0x0000000000000000-0x000000001fff0000 AUX0 UC|UCA
  [1] : 0x0000000020000000-0x00000000677f0000 AUX0    ANY
  [2] : 0x0000000080000000-0x0000001fffff0000 AUX0 UC|UCA
  [3] : --disabled--
Cluster 1: 4 MMIO regions
  [0] : 0x0000000000000000-0x000000001fff0000 AUX0 UC|UCA
  [1] : 0x0000000020000000-0x00000000677f0000 AUX0    ANY
  [2] : 0x0000000080000000-0x0000001fffff0000 AUX0 UC|UCA
  [3] : --disabled--
Cluster 2: 4 MMIO regions
  [0] : 0x0000000000000000-0x000000001fff0000 AUX0 UC|UCA
  [1] : 0x0000000020000000-0x00000000677f0000 AUX0    ANY
  [2] : 0x0000000080000000-0x0000001fffff0000 AUX0 UC|UCA
  [3] : --disabled--

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h | 18 ++++++++++++++++++
 platform/generic/mips/eyeq7h.c        |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 0675635565589105594c231505be8b094ca4a25a..3752bdf2b3ddc967dae32ee449bf77e9c6d64b06 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -144,6 +144,24 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define L2SM_COP_RESULT_ABORT_OK	3
 #define L2SM_COP_RESULT_ABORT_ERROR	4
 #define GCR_L2SM_COP_PRESENT		BIT(31)
+/* MMIO regions. Actual count in GCR_GLOBAL_CONFIG.GCR_GC_NUM_MMIOS */
+#define GCR_MMIO_BOTTOM(n)		(0x700 + (n) * 0x10) /* n = 0..7 */
+#define GCR_MMIO_TOP(n)			(0x708 + (n) * 0x10) /* n = 0..7 */
+#define GCR_MMIO_ADDR			GENMASK(47, 16) /* both top and bottom */
+#define GCR_MMIO_BOTTOM_CCA		GENMASK(9, 8)
+#define GCR_MMIO_BOTTOM_FORCE_NC	BIT(6)
+/*
+ * 15:12 - reserved
+ * 11 - AUX3
+ * 10 - AUX2
+ * 9  - AUX1
+ * 8  - AUX0
+ * 7:1 - reserved
+ * 0  - Main memory port; MEM
+ */
+#define GCR_MMIO_BOTTOM_PORT		GENMASK(5, 2)
+#define GCR_MMIO_BOTTOM_DIS_RQ_LIM	BIT(1)
+#define GCR_MMIO_BOTTOM_EN		BIT(0)
 
 /* CPC Block offsets */
 #define CPC_PWRUP_CTL		0x0030
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 281848e79e664eaae42d69c0f0c7b6fcd4dd48b6..b7bffad7b1fb63a5e0e858313bca8ddc57db94c5 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -37,6 +37,7 @@
 #define OLB_ACC1		0x65000000
 #define OLB_XNN0		0x43600000
 #define OLB_XNN1		0x63600000
+#define NCORE			0x67800000
 #define OLB_WEST		0x48600000
 #define OLB_WEST_TSTCSR		0x60
 #define TSTCSR_PALLADIUM	BIT(0)
@@ -369,6 +370,12 @@ static int eyeq7h_nascent_init(void)
 			     (void *)(cm_base + L2_PFT_CONTROL_OFFSET));
 		__raw_writel(0x15ff,
 			     (void *)(cm_base + L2_PFT_CONTROL_B_OFFSET));
+		/*
+		 * Remove access to NCORE CSRs from mmio region 1
+		 * which is routed to AUX. NCORE to use default route through MEM.
+		 */
+		__raw_writeq(NCORE-1, (void *)(cm_base + GCR_MMIO_TOP(1)));
+		mb();
 	}
 
 	/* Per core set up */

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
