Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EF0D4A5F4
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGJxchIxeX2V7XqWjG9se4ycLlB5zks4i9Qp+s9twfw=; b=tJ7a/8MYeT3bUY
	UK+0QuB0RFgXQx+RkS9I8fc7SW8h8zWmS1l8bgAxfN3rKYqTk8vjjlNkldII2+CbJ9sng2hEOB8Zj
	08FdYbZWzfC7RibhLcd/OAWA0BoQnu+Ze3NnOCNAgjbl6BTvwGoqRRSPEVP1PGBQ7GJ74XcGls4de
	+5ograMAkaYwBzfJ9KKrJLF330DJp714R4e/lqzUFF0mvw5xAKCadFyEQDYEOmcOZ0NW4ue0qF/f8
	BOIq9X6HdSzEaInAf3tt9znc/M7plXbPgLElv6wGIcg20o/qfhU8zdVLZcOcHjSD5QEepUQTAijtO
	rStbS3ZC/wRMdosDgkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6y-0000000HT1Y-2OtT;
	Sun, 18 Jan 2026 11:38:28 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6p-0000000HSog-2dnI
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736299; x=1800272299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cAhEMz5W+gC2lQKP8zo+HDiIXpEWmsh8/7XpbvHuJDY=;
  b=maA1mHK1Aynns3liPfRZJ3j85bFeBpE3l+to3tAWFqVuAo0lzNM/0iC6
   u3EyoRJ/6IBjfcAb/ZkmLG6Y11bXndVYyrurt4VqoexzeFcpEVMAl5rE/
   07piGrfg0ybQ9wpTxT8jIS34+aX298Vw1a4ASEGxV6lDnvJITaQrmhkZI
   DJF8M06/UGlyU5oH/ZP6FHHokDFgvH7pm9KkCH6lcibLplzOTNenV0pB1
   wZaxo3cL0fegHVZMW4r8Iofl+yfLaotmJCyeSjviJis+vcGGap0nj2T+k
   YqBIxjTqRkRSMzMIZbQn5WK6SEUmhVTJuqf5lAtldPeiArI1ZY5Z2lTGc
   w==;
X-CSE-ConnectionGUID: C0UG/omOTfCFFCT6BjWzvw==
X-CSE-MsgGUID: SX5ABxu2ShGCCG675ZI3BA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:16 +0200
X-CSE-ConnectionGUID: HSTeqmQLTk6jJrkoJTaPZQ==
X-CSE-MsgGUID: +KeLaAVBTji+UTd/nd03EA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:11 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:14 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 10/20] platform: generic: mips eyeq7h: power up clusters
 with OLB
Date: Sun, 18 Jan 2026 13:37:52 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-10-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033819_993103_A389B1E4 
X-CRM114-Status: UNSURE (   9.05  )
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

In the eyeq7h platform, there's extra power control for the CPU
clusters. To enable cluster, it should be powered up using this OLB
registers prior to accessing any cluster management registers

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/eyeq7h.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 6b495601a1dd614acefc7fab250fc710da84bf02..d70ffa1b3b750754ae60cfef21f012dc4f0484ed 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -18,6 +18,20 @@
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
@@ -35,11 +49,39 @@
 
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
