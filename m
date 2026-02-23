Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F68EA4FD1
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhwVuBuFewvVQ5nRNZ4HxmhynToy3GaSWt7FcKOsONY=; b=lLPLX2iFUEEJU/
	9BPHV5VCQp/rBhobj04SfylSgk9+rXpk4xyNJ/w9ku3+ORMYEM18u8oYc07tdqwn7K4XV1LgtpXN6
	3SdGCOdRWadOHHnqnwG07Tvg6TXZ8NzQw99MHuOzH+mR17NGpkHf4AOScOeJtciGwYvEvGGrrMEtP
	pYipxbyMETZNTPhVqEOz5ih5LSE/IgQ1MjmdS6qxGqfK7oFRms/14PXZfAljO1mI9qY/nefnuQbVi
	P6pE23tFpU3W3iC8oTrnoSViz2BeMDEhrZs5MhEWNtLCI4n2NLxuGFfUpGfXeDD1f0ALRGkloCBm/
	cIq63msJNMTt9sBYsz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLb-00000000VrW-1tp8;
	Mon, 23 Feb 2026 14:55:43 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLY-00000000VVL-1Gh5
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858540; x=1803394540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+DALDbqLUvXl50Xgdgwv4mnxkDYo4bi4ydMq+lNylmY=;
  b=ARiWA9itxVxjdsQ/WY52zgq4q+s0TJKCXj3XShF1rnAojzy+FveHoOIG
   B/XSaDzXD3QDo7nWRcD1wrDKMAR5pGbBIeqkmWHK6ZIBOeFDGCt/t+tk9
   lDFPWOOaqLKVYOGacWROdzkP6WsZpn9f0zPxXVp2+HS4ClxRN3dwuxxEs
   J8bVIAvp+FKPIV/H/QuPk70IxmlO8aCoEt5QDlTnF+YbIu3WXL44+jC38
   lXql5IYZg/HHiBKao/IyOJJucfY7Jm/syMCRlnpO11vIXl/zHUTvPivwX
   oTc4old96g2WlK4HUiVMkK5dnHSB+QYs8CQQI4Lnh8lrsVIxOMqpJNmMn
   w==;
X-CSE-ConnectionGUID: ZuIz/U3nQlaiL3pKRXRY+A==
X-CSE-MsgGUID: LhgA1wU6SDePC0UJJPU8Pg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:39 +0200
X-CSE-ConnectionGUID: 6Yj9Z6qwSbSil5EJSvT1XA==
X-CSE-MsgGUID: D1YwjUflQ8i3pcmYlfaPvA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:21 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:38 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 16/23] platform: generic: mips p8700: use SBI bitfield
 manipulator macros
Date: Mon, 23 Feb 2026 16:54:55 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-16-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065540_611965_954CB60B 
X-CRM114-Status: UNSURE (   9.21  )
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

Switch to GENMASK, EXTRACT_BITFIELD, INSERT_BITFIELD

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h | 49 +++++++++++++----------------------
 platform/generic/mips/eyeq7h.c        |  2 +-
 platform/generic/mips/p8700.c         |  4 +--
 3 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 4cda183ec0a22a90d13242473641ce3e6d896a6b..169181642716a2dea4b417db910895bd1960a5ec 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -21,16 +21,16 @@ struct p8700_cm_info {
 extern const struct p8700_cm_info *p8700_cm_info;
 
 /* PMA */
-#define CSR_MIPSPMACFG0	0x7e0
-#define CSR_MIPSPMACFG1	0x7e1
-#define CSR_MIPSPMACFG2	0x7e2
-#define CSR_MIPSPMACFG3	0x7e3
-#define CSR_MIPSPMACFG4	0x7e4
-#define CSR_MIPSPMACFG5	0x7e5
-#define CSR_MIPSPMACFG6	0x7e6
-#define CSR_MIPSPMACFG7	0x7e7
-#define CSR_MIPSPMACFG8	0x7e8
-#define CSR_MIPSPMACFG9	0x7e9
+#define CSR_MIPSPMACFG0		0x7e0
+#define CSR_MIPSPMACFG1		0x7e1
+#define CSR_MIPSPMACFG2		0x7e2
+#define CSR_MIPSPMACFG3		0x7e3
+#define CSR_MIPSPMACFG4		0x7e4
+#define CSR_MIPSPMACFG5		0x7e5
+#define CSR_MIPSPMACFG6		0x7e6
+#define CSR_MIPSPMACFG7		0x7e7
+#define CSR_MIPSPMACFG8		0x7e8
+#define CSR_MIPSPMACFG9		0x7e9
 #define CSR_MIPSPMACFG10	0x7ea
 #define CSR_MIPSPMACFG11	0x7eb
 #define CSR_MIPSPMACFG12	0x7ec
@@ -68,26 +68,13 @@ extern const struct p8700_cm_info *p8700_cm_info;
 
 #define MIPSCONFIG5_MTW		4
 
-#define GEN_MASK(h, l)	(((1ul << ((h) + 1 - (l))) - 1) << (l))
-#define EXT(val, mask)	(((val) & (mask)) >> (__builtin_ffs(mask) - 1))
-
-/*
- * We allocate the number of bits to encode clusters, cores, and harts
- * from the original mhartid to a new dense index.
- */
-#define NUM_OF_BITS_FOR_CLUSTERS	4
-#define NUM_OF_BITS_FOR_CORES		12
-#define NUM_OF_BITS_FOR_HARTS		4
-
-/* To get the field from new/hashed mhartid */
-#define NEW_CLUSTER_SHIFT	(NUM_OF_BITS_FOR_CORES + NUM_OF_BITS_FOR_HARTS)
-#define NEW_CLUSTER_MASK	((1 << NUM_OF_BITS_FOR_CLUSTERS) - 1)
-#define NEW_CORE_SHIFT		NUM_OF_BITS_FOR_HARTS
-#define NEW_CORE_MASK		((1 << NUM_OF_BITS_FOR_CORES) - 1)
-#define NEW_HART_MASK		((1 << NUM_OF_BITS_FOR_HARTS) - 1)
-#define cpu_cluster(i)		(((i) >> NEW_CLUSTER_SHIFT) & NEW_CLUSTER_MASK)
-#define cpu_core(i)		(((i) >> NEW_CORE_SHIFT) & NEW_CORE_MASK)
-#define cpu_hart(i)		((i) & NEW_HART_MASK)
+/* mhartID structure */
+#define P8700_HARTID_CLUSTER	GENMASK(19, 16)
+#define P8700_HARTID_CORE	GENMASK(11, 4)
+#define P8700_HARTID_HART	GENMASK(3, 0)
+#define cpu_cluster(i)		EXTRACT_FIELD(i, P8700_HARTID_CLUSTER)
+#define cpu_core(i)		EXTRACT_FIELD(i, P8700_HARTID_CORE)
+#define cpu_hart(i)		EXTRACT_FIELD(i, P8700_HARTID_HART)
 
 #define CPC_OFFSET		(0x8000)
 
@@ -172,7 +159,7 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define CPC_Cx_CMD_RESET	0x4
 
 #define CPC_Cx_STAT_CONF	0x0008
-#define CPC_Cx_STAT_CONF_SEQ_STATE	GEN_MASK(22, 19)
+#define CPC_Cx_STAT_CONF_SEQ_STATE	GENMASK(22, 19)
 #define CPC_Cx_STAT_CONF_SEQ_STATE_U5	6
 #define CPC_Cx_STAT_CONF_SEQ_STATE_U6	7
 
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index c6e688e2b2498ec157fc743a6c454996ac7ad356..58636ffb336f79668b1ecfae1b8251026f323e74 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -240,7 +240,7 @@ static void eyeq7h_init_clusters(void)
 	sbi_dprintf("Use %d clusters\n", num_clusters);
 	/* Power up other clusters in the platform. */
 	for (int i = 1; i < num_clusters; i++) {
-		eyeq7h_power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
+		eyeq7h_power_up_other_cluster(INSERT_FIELD(0, P8700_HARTID_CLUSTER, i));
 	}
 	eyeq7h_active_clusters = num_clusters;
 }
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index c2f41ee7b066c488757c3e4187962ec10e9c0966..a0884f211ca121a13f0f17f31319934527cd4209 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -47,7 +47,7 @@ void mips_p8700_power_up_other_cluster(u32 hartid)
 	for (int i = 100; i > 0; i--) {
 		u32 stat = read_cpc_cm_stat_conf(hartid);
 
-		stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
+		stat = EXTRACT_FIELD(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
 		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5)
 			return;
 		cpu_relax();
@@ -67,7 +67,7 @@ static bool mips_hart_reached_state(void *arg)
 	struct mips_boot_params *p = arg;
 	u32 stat = read_cpc_co_stat_conf(p->hartid);
 
-	stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
+	stat = EXTRACT_FIELD(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
 	return stat == p->target_state;
 }
 

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
