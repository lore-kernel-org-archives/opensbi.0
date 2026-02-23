Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8F3EA4FCE
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/TFSWp1UAPnz7qNmfvM9MkSn9NPU5qXAeIlfWvzJRg=; b=0jfr8cWbIymC3R
	Hihsv5PBBJ0lYPL9Uemd5U0E4ST5Om5LxloJS3k/wPXbLrMwOmfNZcwualds5EhGsqFw/qgJmrZkw
	3vIkzEM2X3ORpL9I89K5I9GcyqH4KJPM0f/tuGQntsgkF+hv6dK3AIY+Ww9ANvLcvCpQTxGI4CMxI
	+tMxHpqzijgQxfrihnGkiGWkqN8tn5eCWrpxNpxS6ZHEJGlrcS+XaFjCrDavtpGwOFi2D4NGgPowq
	yS26+774wEgkeUMixAL2GfnRa16ouvtyyo26ipK9Dat+W7zRjtBeZT+XbBAEmdMRGjvTO3RO5j/wj
	rOUJXItKAGyjzcfvf9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLZ-00000000VoO-2S9w;
	Mon, 23 Feb 2026 14:55:41 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLW-00000000Vat-0pBo
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858536; x=1803394536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EwMphNGUVMYrZnMRzqY/QIXodzs0PKrzWFKfa8ZUYdQ=;
  b=Td2eiTn7LwXcB/3Ic7MytOPosLA7RjbcIAEJPaH8Zo9vshpFLFgE7THR
   T3PkdnPZdVOZh9O36UvMbPwO0xuiWukcat/ac4sDI6JYwuAdGz1F0pYGl
   45MLwRSqq4m+KbLgzXUVIroagkunLYYLUIamGbfmEgrCdBE3C5BdEH0I7
   So6YppY3Th2udrQnwiX7tu9UUyyJhfnXWF18ztgM1ygPbjquyPTbzmlQm
   UaFNa70kC4wp5Zmatx3uJsb4zSfGCK693WXHca0+j7QNZ4Ies8oIfNDWF
   TLnIAAJF9qvZP0UEuqS8F4Bh2NWN/KMazZY6YTnSVafnYD7PuPocT2XSl
   Q==;
X-CSE-ConnectionGUID: qI7r+ZoDSMW1Btie+JMykQ==
X-CSE-MsgGUID: laHnOD7TRUir1Ewf49Lwig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:35 +0200
X-CSE-ConnectionGUID: UfWHBo41RpSwco4A3By7uw==
X-CSE-MsgGUID: 9X8UK2WxQa61h0+3zchTIw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:10 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:36 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 14/23] platform: generic: mips p8700: cache geometry
 detection
Date: Mon, 23 Feb 2026 16:54:53 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-14-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065538_541094_5E1D0A2E 
X-CRM114-Status: GOOD (  10.56  )
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

P8700 has a read-only cache configuration registers.
Provide a CPU specific function to extract cache information.
Use this information in the eyeq7h board for informational
message

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h | 54 +++++++++++++++++++++++++++++++++++
 platform/generic/mips/eyeq7h.c        | 27 ++++++++++++++++++
 platform/generic/mips/p8700.c         | 45 +++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 5facd38af39fe0bc9d6de18a6c7423396e828873..ad7353f8a64a5194e7e933efd8e1276fb8c6f458 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -58,6 +58,14 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define CSR_MIPSCONFIG10	0x7da
 #define CSR_MIPSCONFIG11	0x7db
 
+#define MIPSCONFIG1_L2C		BIT(31)
+#define MIPSCONFIG1_IS		GENMASK(24,22)
+#define MIPSCONFIG1_IL		GENMASK(21,19)
+#define MIPSCONFIG1_IA		GENMASK(18,16)
+#define MIPSCONFIG1_DS		GENMASK(15,13)
+#define MIPSCONFIG1_DL		GENMASK(12,10)
+#define MIPSCONFIG1_DA		GENMASK(9,7)
+
 #define MIPSCONFIG5_MTW		4
 
 #define GEN_MASK(h, l)	(((1ul << ((h) + 1 - (l))) - 1) << (l))
@@ -113,6 +121,43 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define L2_PFT_CONTROL_OFFSET	0x0300
 #define L2_PFT_CONTROL_B_OFFSET	0x0308
 
+#define GCR_L2_CONFIG		0x0130
+#define GCR_L2_ASSOC		GENMASK(7, 0)
+#define GCR_L2_LINE_SIZE	GENMASK(11, 8)
+#define GCR_L2_SET_SIZE		GENMASK(15, 12)
+#define GCR_L2_BYPASS		BIT(20)
+#define GCR_L2_COP_DATA_ECC_WE	BIT(24)
+#define GCR_L2_COP_TAG_ECC_WE	BIT(25)
+#define GCR_L2_COP_LRU_WE	BIT(26)
+#define GCR_L2_REG_EXISTS	BIT(31)
+
+#define GCR_L2_TAG_ADDR		0x0600
+#define GCR_L2_TAG_STATE	0x0608
+#define GCR_L2_DATA		0x0610
+#define GCR_L2_ECC		0x0618
+
+#define GCR_L2SM_COP		0x0620
+#define GCR_L2SM_COP_CMD	GENMASK(1, 0)
+#define L2SM_COP_CMD_NOP	0
+#define L2SM_COP_CMD_START	1
+#define L2SM_COP_CMD_ABORT	3
+#define GCR_L2SM_COP_TYPE	GENMASK(4, 2)
+#define L2SM_COP_TYPE_IDX_WBINV		0
+#define L2SM_COP_TYPE_IDX_STORETAG	1
+#define L2SM_COP_TYPE_IDX_STORETAGDATA	2
+#define L2SM_COP_TYPE_HIT_INV		4
+#define L2SM_COP_TYPE_HIT_WBINV		5
+#define L2SM_COP_TYPE_HIT_WB		6
+#define L2SM_COP_TYPE_FETCHLOCK		7
+#define GCR_L2SM_COP_RUNNING		BIT(5)
+#define GCR_L2SM_COP_RESULT		GENMASK(8, 6)
+#define L2SM_COP_RESULT_DONTCARE	0
+#define L2SM_COP_RESULT_DONE_OK		1
+#define L2SM_COP_RESULT_DONE_ERROR	2
+#define L2SM_COP_RESULT_ABORT_OK	3
+#define L2SM_COP_RESULT_ABORT_ERROR	4
+#define GCR_L2SM_COP_PRESENT		BIT(31)
+
 /* CPC Block offsets */
 #define CPC_PWRUP_CTL		0x0030
 #define CPC_CM_STAT_CONF	0x1008
@@ -138,6 +183,15 @@ void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 void mips_p8700_power_up_other_cluster(u32 hartid);
 int mips_p8700_hart_start(u32 hartid, ulong saddr);
 int mips_p8700_hart_stop(void);
+
+struct p8700_cache_info {
+	u32 line;
+	u32 assoc_ways;
+	u32 sets;
+};
+
+void mips_p8700_cache_info(struct p8700_cache_info *l1d, struct p8700_cache_info *l1i,
+			   struct p8700_cache_info *l2);
 struct fdt_match;
 int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match);
 
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 5c74bc5e53923cbfda63eabeba56be39b3dea306..816ac6f57c836bef0785c298aa918536d75cd6da 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -171,6 +171,32 @@ static struct fdt_general_fixup eyeq7h_acc_clusters_fixup = {
 	.do_fixup = eyeq7h_acc_clusters_do_fixup,
 };
 
+static void eyeq7h_cache_do_fixup(struct fdt_general_fixup *f, void *fdt)
+{
+	struct p8700_cache_info l1d, l1i, l2;
+	mips_p8700_cache_info(&l1d, &l1i, &l2);
+
+	sbi_dprintf("Cache geometry:\n"
+		    "  D: %4d Kbytes line %3d bytes %2d ways %5d sets\n"
+		    "  I: %4d Kbytes line %3d bytes %2d ways %5d sets\n",
+		    l1d.assoc_ways * l1d.line * l1d.sets / 1024,
+		    l1d.line, l1d.assoc_ways, l1d.sets,
+		    l1i.assoc_ways * l1i.line * l1i.sets / 1024,
+		    l1i.line, l1i.assoc_ways, l1i.sets);
+	if (l2.line) {
+		sbi_dprintf(" L2: %4d Kbytes line %3d bytes %2d ways %5d sets\n",
+			    l2.assoc_ways * l2.line * l2.sets / 1024,
+			    l2.line, l2.assoc_ways, l2.sets);
+	} else {
+		sbi_dprintf(" L2: not present\n");
+	}
+}
+
+static struct fdt_general_fixup eyeq7h_cache_fixup = {
+	.name = "cache-fixup",
+	.do_fixup = eyeq7h_cache_do_fixup,
+};
+
 static int eyeq7h_final_init(bool cold_boot)
 {
 	if (!cold_boot)
@@ -178,6 +204,7 @@ static int eyeq7h_final_init(bool cold_boot)
 
 	sbi_hsm_set_device(&eyeq7h_hsm);
 	fdt_register_general_fixup(&eyeq7h_acc_clusters_fixup);
+	fdt_register_general_fixup(&eyeq7h_cache_fixup);
 
 	return generic_final_init(cold_boot);
 }
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index c1f2ac7f6474701bf1594bf5f1880cfee2dfc4c6..4e693bc0046e0ba0d52d9e3aaafc88be8416145c 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -123,6 +123,51 @@ int mips_p8700_hart_stop()
 	return 0;
 }
 
+void mips_p8700_cache_info(struct p8700_cache_info *l1d, struct p8700_cache_info *l1i,
+			   struct p8700_cache_info *l2)
+{
+	u32 mipsconfig1 = csr_read(CSR_MIPSCONFIG1);
+
+	if (l1d) {
+		u32 da = EXTRACT_FIELD(mipsconfig1, MIPSCONFIG1_DA);
+		u32 dl = EXTRACT_FIELD(mipsconfig1, MIPSCONFIG1_DL);
+		u32 ds = EXTRACT_FIELD(mipsconfig1, MIPSCONFIG1_DS);
+
+		l1d->line = dl ? 1 << (dl + 1) : 0;
+		l1d->assoc_ways = da +1;
+		l1d->sets = ds == 7 ? 32 : 1 << (ds + 6);
+	}
+	if (l1i) {
+		u32 ia = EXTRACT_FIELD(mipsconfig1, MIPSCONFIG1_IA);
+		u32 il = EXTRACT_FIELD(mipsconfig1, MIPSCONFIG1_IL);
+		u32 is = EXTRACT_FIELD(mipsconfig1, MIPSCONFIG1_IS);
+
+		l1i->line = il ? 1 << (il + 1) : 0;
+		l1i->assoc_ways = ia +1;
+		l1i->sets = is == 7 ? 32 : 1 << (is + 6);
+	}
+	if (l2) {
+		if (mipsconfig1 & MIPSCONFIG1_L2C) {
+			void *cm_base = (void *)p8700_cm_info->gcr_base[0];
+			u32 l2_config = readl(cm_base + GCR_L2_CONFIG);
+
+			if (l2_config & GCR_L2_REG_EXISTS) {
+				u32 l2a = EXTRACT_FIELD(l2_config, GCR_L2_ASSOC);
+				u32 l2l = EXTRACT_FIELD(l2_config, GCR_L2_LINE_SIZE);
+				u32 l2s = EXTRACT_FIELD(l2_config, GCR_L2_SET_SIZE);
+
+				l2->assoc_ways = l2a + 1;
+				l2->line = 1 << (l2l + 1);
+				l2->sets = 1 << (l2s + 6);
+				return;
+			}
+		}
+		l2->line = 0;
+		l2->assoc_ways = 0;
+		l2->sets = 0;
+	}
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
