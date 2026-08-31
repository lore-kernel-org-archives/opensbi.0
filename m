Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5990AC61DD3
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 20:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1IXs9QGyOF5tAcgAHTkm0vjwCncvdleiV87crCYeoU=; b=KCrckqhw6+ZpL9
	wHqWWLOqcZqmgtsMCKrAP4eQjvg+v9C1Q9ZBfXwM+gXxpcdk6UxZemcocHmWIj9FHo9G1HIVBobqi
	MYGK787iGdcqDocW2VMHKXi7iCfT9ZazW5vnlBMdDE5QzenJuLaf9C9gFfh497rBXzTxKDaL8Uqdq
	Wh0L6UsiLaAK9j5+7EVbLJa+reEoJfVbAs+jjw+/zfczILvOp258lG2arvL3eDDPUOMwM3+ZL7Yej
	Btt42zfdc5t+o+76GIVvVpeYzR7pIEgKMH0pg2vf0btVigiLXc8gIGla27i8g77+BftBJTDmwdnAl
	CcjV3Yrbmb9nb8OYP2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18JS-0000000AQ7r-443i;
	Mon, 31 Aug 2026 20:09:02 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18JQ-0000000AQ6c-12w6
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 20:09:01 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6CF3E3F676
	for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788206937;
	bh=RzVS33qQNfFe57GzYBMF2AvzaEPOKByu0gz7ft0Uuso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=qdOZXQJfnzBwBXIMSMFo0oS4P02RqWVS93e88qqHsULVjEN4Z88EQ+J1TwWufENv8
	 lk46DbivX4y5fCwXnnzhFByo6qSi5zONWvwTrjxL3YHboHTW8lkhkErcfxND3mI+M+
	 W3iY9yrEMc93afNJv8Gs5C2FrxMkLirs59L1PgALe806H8Fw457VxUrLidOrVQS0k7
	 zXrE9Y40ha9CgQZUhrgRD2keKO3l+bhU/DLYkY3iqPoBbqV2+MhUFVWt0o4ZeAPK3Y
	 8umL2Ag3SX6ghB8Nd3rfUSpdG1//ILVMuaCVnRz8ziDDuQFJ9tS2piFkBBhXp/b4yo
	 e3t3q92PcwUTZjWFx3dfxbUOr+WkeH93fgIXMP9iBxQI2dAF+0jKRrw+1d0z/grgMj
	 b54SGyFICwwBFbUVrh78fZVLNT4pSxPV9nDAEthfwB257rVFMgTr4GfNGfl/o/wrEb
	 CpQjH5WZo+4RkLtd0OVoNru2eUvnHtBF/g+fvGInrZFemZxywcbB/E2V+spRjmloNG
	 JiO4DpDyyFqUdZwmUENvhvHcnw4B/cBNn80azvFPN5jJq0IeyVUV/R8C4id3lC21Av
	 shRYTsSOUTBZ82FJ2lh1UqE/tU5dcjJHW2Z4qIzvoaWLT3/OV89vm/hT1R6pvs1Mp1
	 5EPwV+NRSz/X1uohwlwLLcG8=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cd55ee2f7so13957555e9.0
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 13:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206937; x=1788811737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzVS33qQNfFe57GzYBMF2AvzaEPOKByu0gz7ft0Uuso=;
        b=gpNDjdRC2Xc6EBnSa3Fd0Y6W77cDLqsucpfeWwC+N1S4O7MZGzdYXguhPFWT3xpMoy
         APMW4X33BiqoLXM3O1pin3Ya2yanty+NeyIQ6PdcfPwMQxxmc7RKpSW3z2cl3AIfjN0a
         ySUOD9lS/ujzg5q8c32g19EbUBeUF5yeJ0hzBFRT1szKW17TYsCHwfcQ09xUjtyC0gJ3
         c/K42uVnvboiw/nsxzMlwnUvB1gYG97WxaAihVqUttDah/qdB81YKBBAUF6b4oFdfUYV
         gp4SlFNjlET0YiJYkHb4wsmzQjWvYcJr/hXcumNCnLE1VifoStn7OP1AjfmRLGfmYNec
         /6UQ==
X-Gm-Message-State: AFuF++mwvPlbXfdAveOoWMwb0d7JAJ3jALnNI7QfsywVoHO8iAPSZi9v
	PRrMXk5hyRHYP0Avu1jnEj2Otk5UBr96s5ET+XkUc/+Hm9Bs/57mcIVOK3GLIs6sqzvSA0YPeRv
	pQonO6wGpXkSAT86n2mt1o3aHILR4IR73wIxB3onGuXqge4xSA8Y57mGVVMRWeNI6GTIFd2NIoD
	CxR7+jv0fpUZcyigE=
X-Gm-Gg: AR+sD13v/+XkJvqJf0ThgO2OjuYyHoeuPjeQtfiwc1p0LVTlHxzilRtg8c6y28w7eLB
	XdgeRk2/9RhhiQXIQkxqTgJ8smf3fxINtCFoQP0P/1JDYcYmmExt/BXrP5Jd+cBqFg5rpHdHvZA
	BuSp9gf06hPGvX8ABY9R1znsmVOv7Qdb43vSaC+2xlsi3Hz6P9PDfboD3xUEa5GAs0EjxHxQ8tv
	kl4rgS3pIDz7yNxepPvf4GAkAvHJZXoX+W+tIqe+r+hVI0tO1KgeTXy6KvxfPu1j4Ytcnldew7f
	RWaIV8Cxtc+Q1MQfyh5wPhmok5he5AuJkkEkMjiAEp4TAQeZz0B5FeAey73at88wz10Fg7lucE8
	EyyPvM33paV5dBgjlh7cfr5bhOKeoARwe8w==
X-Received: by 2002:a05:600c:6207:b0:49c:d28f:2cd6 with SMTP id 5b1f17b1804b1-49cd28f2e19mr263855605e9.12.1788206936988;
        Mon, 31 Aug 2026 13:08:56 -0700 (PDT)
X-Received: by 2002:a05:600c:6207:b0:49c:d28f:2cd6 with SMTP id 5b1f17b1804b1-49cd28f2e19mr263855005e9.12.1788206936662;
        Mon, 31 Aug 2026 13:08:56 -0700 (PDT)
Received: from k6.lan (141.175.65.37.rev.sfr.net. [37.65.175.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1e3a9sm15515825e9.15.2026.08.31.13.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:08:56 -0700 (PDT)
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
To: opensbi@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com,
	xianbin.zhu@linux.spacemit.com,
	anup@brainfault.org,
	ganboing@gmail.com,
	samuel.holland@sifive.com,
	heinrich.schuchardt@canonical.com,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: [PATCH 1/3] platform: generic: spacemit: k3: de-vote cluster power-downs and ungate DMASYS before CCI enable
Date: Mon, 31 Aug 2026 22:07:50 +0200
Message-ID: <20260831200832.404000-2-valentin.haudiquet@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831200832.404000-1-valentin.haudiquet@canonical.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
 <20260831200832.404000-1-valentin.haudiquet@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_130900_435845_2B8AF070 
X-CRM114-Status: GOOD (  17.88  )
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

The v3 patch enables CCI-550 snoop/DVM requests for all seven slave
interfaces before de-voting cluster power-downs.  Clusters that are
still voted for power-down cause the CCI status change-pending
busy-wait to hang indefinitely when snoop/DVM is enabled on their
slave interfaces.

De-vote power-down for all four clusters and the boot hart's core
BEFORE enabling CCI.  Also deassert DMASYS reset and enable its clock
before CCI: the DMA engine sits behind the AIDMA CCI slave interface,
and if DMASYS is held in reset the CCI busy-wait hangs when enabling
snoop/DVM on that interface.

Add DMASYS_RESET and DMASYS_CLK_EN register definitions to k3.h.

Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
---
 platform/generic/include/spacemit/k3.h |  5 +++
 platform/generic/spacemit/k3.c         | 50 ++++++++++++++++++++++----
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/platform/generic/include/spacemit/k3.h b/platform/generic/include/spacemit/k3.h
index f444d064..ed1637b9 100644
--- a/platform/generic/include/spacemit/k3.h
+++ b/platform/generic/include/spacemit/k3.h
@@ -124,4 +124,9 @@
 #define PLAT_CCI_K3_CLUSTER3_0_IFACE_IX	5
 #define PLAT_CCI_K3_CLUSTER3_1_IFACE_IX	6
 
+/* DMASYS reset and clock enable */
+#define DMASYS_RESET				(0xd8440000 + 0x22c)
+#define DMASYS_CLK_EN				(0xd8440000 + 0x234)
+#define DMASYS_RESET_DEASSERT			BIT(0)
+#define DMASYS_CLK_EN_BIT			BIT(0)
 #endif /* __RISCV_SPACEMIT_K3_H__ */
diff --git a/platform/generic/spacemit/k3.c b/platform/generic/spacemit/k3.c
index 967d09bf..12c991b6 100644
--- a/platform/generic/spacemit/k3.c
+++ b/platform/generic/spacemit/k3.c
@@ -56,14 +56,39 @@ static void spacemit_k3_hart_init(u32 hartid)
 	}
 }
 
-/* The boot hart is already running, so it is never started by the HSM. */
-static void spacemit_k3_keep_boot_hart_powered(void)
+/*
+ * De-vote power-down for all four clusters.  This must happen BEFORE
+ * CCI snoop/DVM enable: clusters still in power-down vote cause the
+ * CCI busy-wait to hang when enabling snoop/DVM on their slave interfaces.
+ */
+static void spacemit_k3_keep_all_clusters_powered(void)
 {
 	u32 value;
+	int i;
 
-	value = readl((void *)(unsigned long)PMU_CX_CAPMP_IDLE_CFG0);
-	value &= ~CLUSTER_PWR_DOWN_VALUE;
-	writel(value, (void *)(unsigned long)PMU_CX_CAPMP_IDLE_CFG0);
+	static const u32 cluster_idle_regs[] = {
+		PMU_CX_CAPMP_IDLE_CFG0,   /* cluster 0 (harts 0-3)  */
+		PMU_CX_CAPMP_IDLE_CFG4,   /* cluster 1 (harts 4-7)  */
+		PMU_CX_CAPMP_IDLE_CFG8,   /* cluster 2 (harts 8-11) */
+		PMU_CX_CAPMP_IDLE_CFG12,  /* cluster 3 (harts 12-15) */
+	};
+
+	for (i = 0; i < 4; i++) {
+		value = readl((void *)(unsigned long)cluster_idle_regs[i]);
+		value &= ~CLUSTER_PWR_DOWN_VALUE;
+		writel(value, (void *)(unsigned long)cluster_idle_regs[i]);
+	}
+}
+
+/*
+ * De-vote the boot hart's core-level power-down.  The cluster-level
+ * de-vote for cluster 0 is already done by keep_all_clusters_powered();
+ * this clears the per-core idle config so the boot hart is never
+ * powered down by the PMU.
+ */
+static void spacemit_k3_keep_boot_hart_powered(void)
+{
+	u32 value;
 
 	value = readl((void *)(unsigned long)PMU_AP_CORE0_IDLE_CFG);
 	value &= ~PMU_AP_IDLE_PWRDOWN_K3_MASK;
@@ -88,10 +113,21 @@ static void spacemit_k3_pre_init(void)
 	writel((u32)entry, (void *)(unsigned long)C3_RVBADDR_LO_ADDR);
 	writel((u32)(entry >> 32), (void *)(unsigned long)C3_RVBADDR_HI_ADDR);
 
+	/* De-vote all cluster power-downs BEFORE CCI enable. */
+	spacemit_k3_keep_all_clusters_powered();
+	spacemit_k3_keep_boot_hart_powered();
+
+	/*
+	 * Deassert DMASYS reset and enable its clock before CCI: the DMA
+	 * engine sits behind the AIDMA CCI slave interface.  If DMASYS is
+	 * held in reset or its clock is gated, the CCI busy-wait hangs when
+	 * enabling snoop/DVM on that interface.
+	 */
+	writel(DMASYS_RESET_DEASSERT, (void *)(unsigned long)DMASYS_RESET);
+	writel(DMASYS_CLK_EN_BIT, (void *)(unsigned long)DMASYS_CLK_EN);
+
 	for (i = 0; i < array_size(cci_map); i++)
 		cci_enable_snoop_dvm_reqs(cci_map, i);
-
-	spacemit_k3_keep_boot_hart_powered();
 }
 
 static int spacemit_k3_early_init(bool cold_boot)
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
