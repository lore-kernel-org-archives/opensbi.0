Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095D1D31A30
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tF/ekxTYzeWOwV9f6gwUmLp/JmlFKWJufX/y+rvzb4=; b=HdSkJvHEyXQa7r
	FrsyrcirIVGCi6zV2ItO1eyXEcvEfBu2oEdI/8htm7J+U74/ZtVKBlgrbJ9hg0NzPE582nAk+2m6/
	Ggk1y7LcBXfx7k9Ts4qK4mo+OwXwUPsTcD8xjW8EbbCrInWuajg5LJOJ1UGUxEhutsx+c4Kxhgpgf
	9gdLx4G+8dwh6wdgi7RUAFtXaz3zqrWjdvkzGFfpMOPy6wr1UlT+EqQnzbpKhX+StpNlgsl+kwhbu
	uud+Gxq53uKYSM+L1GBNuuIXwlBJphNFMCzdNz/HKdK6LVYuuf48uw+gN0gYfgBfUQNuMyrhBUnOx
	JO/ZtIMgL3TxnDqPXXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4V-00000008Vwl-0xUO;
	Wed, 14 Jan 2026 09:21:47 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4P-00000008Vcr-19jM
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382501; x=1799918501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4hfgjgPuUhTycFeKjrbWL2+EiR+twR8Z+fY/3dbcBk8=;
  b=IIYR8CM6qGHELqBraJ6RLPdjkumqMUl5t8D+2JvG7YwZu5M+awIiZncC
   l6fVdo8wPTdvz8zXFoTXY2eKQL4IqWcZUcpvrL1Y038g/Cuzk79gwkzun
   Q7egcXrgEjTV6SNSNjgvRF60l5K+QqEb6mXwN5uALEV+YtQimAsBmjWAQ
   aDa72PY8+4vF5yA1R914JvWg+qWEl5RgJfgTZQL/wlhF2EZxmFToCLX2F
   gXkzs/+NTbYcgBtiaJ7W8hhpR+/uNqlPb8hE9rvU2V6ydEx1YnTIY35aQ
   dYdtlkNDJxrTgt64U2YANekheoLhxFFJS2tNizqERGHIiXFwb7O84HyJy
   w==;
X-CSE-ConnectionGUID: Fi5jE+wlQrK2V2arXC2B4A==
X-CSE-MsgGUID: SDC8dcAZR0ukulplN/ikww==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:40 +0200
X-CSE-ConnectionGUID: uVTxfYtOT7+ZA7Y6plgg0A==
X-CSE-MsgGUID: FYRTpUwGQbqNsmjCcQPqPA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 14 Jan 2026 11:23:25 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:39 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 18/22] platform: generic: mips p8700: use SBI bitfield manipulator macros
Date: Wed, 14 Jan 2026 11:21:14 +0200
Message-ID: <20260114092118.1315581-19-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012141_630740_AB789A8C 
X-CRM114-Status: GOOD (  13.55  )
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
 platform/generic/include/mips/p8700.h | 49 ++++++++++-----------------
 platform/generic/mips/eyeq7h.c        |  2 +-
 platform/generic/mips/p8700.c         |  4 +--
 3 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 4cda183ec0a2..169181642716 100644
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
index 0cdb93ba0fe7..b4b03bf95eb3 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -292,7 +292,7 @@ static void eyeq7h_init_clusters(void)
 	sbi_dprintf("Use %d clusters\n", num_clusters);
 	/* Power up other clusters in the platform. */
 	for (int i = 1; i < num_clusters; i++) {
-		eyeq7h_power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
+		eyeq7h_power_up_other_cluster(INSERT_FIELD(0, P8700_HARTID_CLUSTER, i));
 	}
 	eyeq7h_active_clusters = num_clusters;
 }
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 01826b1e308a..8258cd882532 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -48,7 +48,7 @@ void mips_p8700_power_up_other_cluster(u32 hartid)
 	for (int i = 100; i > 0; i--) {
 		u32 stat = read_cpc_cm_stat_conf(hartid);
 
-		stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
+		stat = EXTRACT_FIELD(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
 		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5)
 			return;
 		cpu_relax();
@@ -68,7 +68,7 @@ static bool mips_hart_reached_state(void *arg)
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
