Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEB3C9832F
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zV5w7XhMNjCBfOlonyOXw2qNlrQWgtaAs+SctO3KkU=; b=h1KEFamJDjrAqx
	PcEiIum9Ql4RHYCq1nBk7ZUsojzuqOKFY2AfRTYY6ABDtA84hWmcnnmbCw6/mjF3FPm1IWAYOFQyk
	NI5scBO89QBtZpXdRVJSRjug/YTqk0v+Ja6LhwcEK4dNIvBcp0pB07/SdzwxIkXFTaG5zQ0BgtxWQ
	KVDq5xIcxC6NpFtOhiBZw9IhAXEZ9bsbMhpobZ7RR7/oFT/1qhX8eJnQ0Qc4fvT3NPCQRkhLm623/
	SjCd7sAoYQOCpHHyDGBpCNX8RYZOFxK9O2xdQ5Ty1dT9qRKQEM9mU5L2gp+s8oXioD7z67uvyxkIP
	mbC3vVRLGXeVkfvpgWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR73-0000000HT70-26QA;
	Sun, 18 Jan 2026 11:38:33 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6u-0000000HSxE-3zwe
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736304; x=1800272304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QVpYsats+J6mLbkVzlbyGsniG249aURbfv68mvL1nhE=;
  b=bO/FD9i7neQCHvsUfouisiR1vkbyOicQzDH3DMp030vioiIRicYQis4v
   RaUM8LQjf8EqP3wa7a10RtpzhJ5zMx7xOVaEHGj2VtBNZW7G2Utf48z2n
   lQuM/e9jfBBRpI5g/bhtzQri5xfasVSg83PmlXmVAjbAtVhLUeKrrbrdW
   ToyhLQ9b+wT9T0X/Fz4WTE7fk77AQ0ikRUwDFP0Udwngr4YgtBAKZ0MwO
   9lJR0BW4r9UGMv3mPml8cPsa5oepW9lxSI8TrtTltwoVWosLwZUK4nmKf
   LY86TUmtgLSsWilmsrv7HcT5FKmtIhLbpCO5WmQkl8eqeHym5P4Zr4afF
   Q==;
X-CSE-ConnectionGUID: m8vnIJx0SeypkFAWIKxldA==
X-CSE-MsgGUID: llCJrOUMSZmqkXsicIRfgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:23 +0200
X-CSE-ConnectionGUID: ppdt4MfjRKCwVagrySGWxA==
X-CSE-MsgGUID: 7IM5dEq5QHO5YN9/86spxA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:17 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:20 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 15/20] platform: generic: mips p8700: use SBI bitfield
 manipulator macros
Date: Sun, 18 Jan 2026 13:37:57 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-15-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033825_316475_946F81D7 
X-CRM114-Status: UNSURE (   9.41  )
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
index 52fdadda4764def0a5015b2dc03f3a5450e64acb..e58b010f0c97f34e9e1e07a2ee984516abfeb1d8 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -238,7 +238,7 @@ static void eyeq7h_init_clusters(void)
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
