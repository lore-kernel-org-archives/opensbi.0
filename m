Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BB3D31A38
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNAGLOkffKFKZyPGcW6idsA58gUhZ9SjW0JwHT5dQTo=; b=P0JDqK8bD2+j1B
	eD/OP4bgAiAAyg4A9QZkta7F0XdTPIx0FIfGm0P8Xgx/4ZdwzJ9WyqVrUzKd15Ir6eL/22kZF+RAg
	kMds6aSwTdb4zFKL6OfmBZvmD2GO0CxIbCN30zXdvz0VsBdAG5enWWB+bJ7Dm+twYLqHGL7rpnBuA
	tChpRsYHO61TmpO4cbp3Tkz9urnxG/DpfeWTn+/wiK0X7/OuWJSQEICU3A+eaKW5n8z1A5BzTyMhX
	ocJmZcAEkM9KZQ3TSFm37UscHmU4EyI40ICmKbWxKVLVhpkc6JlwIbZ+GZGjhwBTYos5iSF1tl5Ev
	FzotPWdFDDwhowThwcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBx-00000008Yjq-0Hul;
	Wed, 14 Jan 2026 09:29:29 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBu-00000008Yfi-1Aaq
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382966; x=1799918966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FjXq+oJBuvkPR5f+TNPyemXaP0QWSOPCXlOB5FxBqhk=;
  b=o65gak8bghuuwZx4tEUR94qgZBS1hXKvsKxU2j3FMh2ElWw8rT+LJC/H
   NX46iEW10YEJfCaR52260gFDzbbhZjpSpjz2ijvnRag+SnSb2CLuH7IAt
   qe5fV2wmIaMaKjryx7CVBwc59m7N6ytF34ybBVyJ39ifRSoBc7qPYGtP3
   cwEczyK/FLK+2dE2X/KQ5LevdKCuLcgF3GP1sduvFVOyXsvDRpRS9nAUd
   ZigmZ6DoZQSJA0vHUJ6tGIK7CkpdWAJx6vBydIt7gNh77+98SIHR2WR0T
   6EISup2C8odWZXIjJpiiBawNNX7QrvTh730hFJaAmIWSfqULWU64DkBkB
   A==;
X-CSE-ConnectionGUID: 9UgBfyUxS0KYVXB9i5JBMA==
X-CSE-MsgGUID: gmBV8hfbRt2I3zhBd/bTCQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:35 +0200
X-CSE-ConnectionGUID: vpLmZIZDSeKsNqwOj8c2dA==
X-CSE-MsgGUID: MhpYCypGROK7Vmo/hFw7Vw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:16 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:34 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 13/22] platform: generic: mips eyeq7h: power up clusters with OLB
Date: Wed, 14 Jan 2026 11:21:09 +0200
Message-ID: <20260114092118.1315581-14-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012926_643992_A0591DAD 
X-CRM114-Status: GOOD (  12.12  )
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

In the eyeq7h platform, there's extra power control for the CPU
clusters. To enable cluster, it should be powered up using this OLB
registers prior to accessing any cluster management registers

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/eyeq7h.c | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index f4b6b940ee41..9bc3b1e7a108 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -19,6 +19,20 @@
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
 
+#define MIPS_OLB1		0x67046000
+#define MIPS_OLB2		0x67047000
+#define MIPS_CM_CTL0		(0x14)
+#define MIPS_CTL0_CM_PWR_UP	BIT(0)
+#define MIPS_CTL0_DBU_PWR_UP	BIT(1)
+#define MIPS_CTL0_CM_RST_HOLD	BIT(2)
+#define MIPS_CTL0_DBU_RST_HOLD	BIT(3)
+#define MIPS_CTL0_DBU_COLD_PWR_UP	GENMASK(5, 4) // after cold rst: 00 - pwr down, 01 -clk off
+#define MIPS_CTL0_PARITY_EN	BIT(6)
+#define MIPS_CTL0_DBG_RST_DASRT	BIT(7)
+#define MIPS_CTL0_CACHE_HW_INIT_INHIBIT	BIT(16)
+#define MIPS_CTL0_SW_RESET_N	BIT(17)
+#define MIPS_CTL0_CORE_CLK_STS(n)	BIT(28 + (n)) // n = 0..3
+
 #define OLB_WEST		0x48600000
 #define OLB_WEST_TSTCSR		0x60
 #define TSTCSR_PALLADIUM	BIT(0)
@@ -36,11 +50,39 @@
 
 static int eyeq7h_active_clusters = 1;
 
+static long MIPS_OLB_ADDR[3] = {0, MIPS_OLB1, MIPS_OLB2};
+
+static void eyeq7h_powerup_olb(u32 hartid)
+{
+	int cl = cpu_cluster(hartid);
+	volatile void *cmd;
+	u32 temp;
+
+	if (cl < 1 || cl >= p8700_cm_info->num_cm || cl >= array_size(MIPS_OLB_ADDR))
+		return;
+
+	/* Get the MIPS_CM_CTL0 address */
+	cmd = (volatile void *)(MIPS_OLB_ADDR[cl] + MIPS_CM_CTL0);
+
+	temp = readl(cmd);
+	/* Enable HW cache init */
+	temp = temp & ~MIPS_CTL0_CACHE_HW_INIT_INHIBIT;
+	/* deassert reset */
+	temp = temp | MIPS_CTL0_SW_RESET_N;
+	writel(temp, cmd);
+	wmb();
+	// TODO: using CPU clock ready as reset complete indication, is it correct?
+	while(!(readl(cmd) & MIPS_CTL0_CORE_CLK_STS(0)))
+			cpu_relax();
+}
+
 static void eyeq7h_power_up_other_cluster(u32 hartid)
 {
 	unsigned int cl = cpu_cluster(hartid);
 	unsigned long cm_base = p8700_cm_info->gcr_base[cl];
 
+	/* Power up MIPS OLB */
+	eyeq7h_powerup_olb(hartid);
 	/* remap local cluster address to its global address */
 	writeq(cm_base, (void*)cm_base + GCR_BASE_OFFSET);
 	wmb();
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
