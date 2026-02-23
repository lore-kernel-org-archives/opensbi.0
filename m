Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7902EA4FCB
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0adQBfLwDR+BM09BjlAIdoy9v6HyV8S+thkw7/ETy2U=; b=E9SLWHa9TjaMef
	x8OJb/ooio7+7s7Tf1O9J3luocwwu3QYw3m0EL/MTmPEzXUAFEWmZwlDmK4+Yg5vcgai7CJOsYYjd
	lyvnfVgWVYB8YZFI6B8aceE0MqrHoL9J/3kY5F16vsZoK8l4x1AwT2kmoZ6U6qwh7bjvPBt2OyZc3
	xgX3KRCR1mr3YxC9ppCjkrGDnn9vBmhqyqHyDedX3l3L9vGIi0oXerDYu5O503UeqEHAQuEmam5Ej
	QdWIhq8zjj5kC2ngNm0EGOQupUZkdk1ICEZr7B5AJS1OtgROO8MF3ZsUiZodB/nn5zXNcDoB3m9Da
	dUM42/lPs8vyebsz1GxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLW-00000000Vhs-0LyT;
	Mon, 23 Feb 2026 14:55:38 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLT-00000000VVR-1Pyc
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858533; x=1803394533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6IrJXQSgrCg+sBl/RAeLMxGrbllQSmdl02LRAFZhzo8=;
  b=d0xU+j2RFHA/Eea5fmUpYVGvTkWlMVU5WM8Du//N+HF8wwZtKjRw+PPl
   PGdrGOLhijLNIxpWylQmon7tSFdPb5REe1HEDBm1gyr09H5VIJfg14+xj
   zyFioI3g6SI8peG9SWzI+i77UWSrK5odhuix8ygni00218MFOPhKZ0rjE
   I/S6t4auHufU65+8zplwVVJaQkPXRSyAJD1SWZQ4blmoYOUVs8Gpyyt2I
   5UUV8M0523+CFs4WxArtPyrFQhqEyX3ZAJZxbVtI7AmPcnMDYNApHDOrl
   5aT+kBoYSidv/4LIDGzblGzuBdnCwjW2GUvmReERONAH2ypuS9uevpmVD
   w==;
X-CSE-ConnectionGUID: LqhxrzRrQHOCyLNMcEmuqQ==
X-CSE-MsgGUID: NHNnz9ehT7O6k2eoHuRhLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:32 +0200
X-CSE-ConnectionGUID: 2gOZy0TuShKxhnVRx1GZlQ==
X-CSE-MsgGUID: 0QzlbXpXThmtN7zwXv7c6A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 23 Feb 2026 16:58:09 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:33 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 11/23] platform: generic: mips eyeq7h: power up clusters
 with OLB
Date: Mon, 23 Feb 2026 16:54:50 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-11-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065535_651497_B7FD39D7 
X-CRM114-Status: UNSURE (   8.92  )
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
index 4e20a4d09efd5e05c323a2ca25813b8ef54aba99..d9c252672a3e0a6cd81cd81f72d9d68772b77fd2 100644
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
+#define MIPS_CTL0_DBU_COLD_PWR_UP	GENMASK(5, 4) /* after cold rst: 00 - pwr down, 01 -clk off */
+#define MIPS_CTL0_PARITY_EN	BIT(6)
+#define MIPS_CTL0_DBG_RST_DASRT	BIT(7)
+#define MIPS_CTL0_CACHE_HW_INIT_INHIBIT	BIT(16)
+#define MIPS_CTL0_SW_RESET_N	BIT(17)
+#define MIPS_CTL0_CORE_CLK_STS(n)	BIT(28 + (n)) /* n = 0..3 */
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
+	/* TODO: using CPU clock ready as reset complete indication, is it correct? */
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
