Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2812EA4FD0
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVy2BE9ArYxL8frzZbpJC4M3m0vSi4U8MSWHpoSmEyI=; b=4woQ6SQas1q1PF
	ghybMuEFrw22RZELVSlerI2G8X+4x6m+iQ5gQQ1FacSDcVJ/DjbLzMEYS5ACbdj0Accl/DP11H2H2
	hKC+ra4d2fcGgYIUjHwKg2BnlmwZ0e2iYibO0l8Zo485370Suf8V7MD3Ruaw8zDvTd3CbhbBaYSBC
	M3iCLg/dc6lP+92Jf6nZD3FMGnrZCTIZ5VZR8abqxx4eq5Mg0Z8i9HEHAvQFRba0gc+N9rA3NBIpR
	NbeEwa5gQ9PxAZ57uMIpeUv3rxbjDc1VYmuUHvOUXwJBmCMx3BcvrMwMOaXmQY8smXs8ZumzBDMOj
	O1V3NbLfTfeAQegGnZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLd-00000000Vuo-15gu;
	Mon, 23 Feb 2026 14:55:45 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLa-00000000VVL-1Znu
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858542; x=1803394542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZAfKaG7zp4m2KyIvvqyWJKVOcxE4Q4Hz8tAyFa0n3DY=;
  b=QwBC5e099e/iFJ1IQlEbnC8/gL21tssbovW1y1SNGH4YO/0kW7/aYQzM
   C6lwqgxsAlJVflRY7t4FJ5QSen4jDvbPmFj/LI3B1J+z6W0Y9dZGyMGpv
   eQ1ACdoeKQFN+72dFSl0ukGfkWp89YIx3gnrZv9wXM8SB4OvOph+GvFeW
   1KiI/aqQTtMiRvrbB0O4XOFIkthI6LwWj5woD9SroHiB7qFaJ7ygKTP5a
   cwOO96gydKt73QUJ9I7jJEnlZoQy++CBD+DLY8zXuPJHFW8ygjm5JyEZ4
   s4PvyZcy1oy1Ljs4DPNC7Latt51H8055rhzCT6K4dbNAv0c9Qu+6cAtsP
   g==;
X-CSE-ConnectionGUID: ZuIz/U3nQlaiL3pKRXRY+A==
X-CSE-MsgGUID: iSGXba+ZTnSMYfUtdOGc6w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:41 +0200
X-CSE-ConnectionGUID: iDSRDruQQP6E7GxjtYxwGw==
X-CSE-MsgGUID: N3OR22npT+Cx1AC6aLAh2Q==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:23 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:40 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 18/23] platform: generic: mips eyeq7h: synchronize
 timers across clusters
Date: Mon, 23 Feb 2026 16:54:57 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-18-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065542_693716_23568F7D 
X-CRM114-Status: GOOD (  11.08  )
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

Use eyeq7 specific method to synchronously restart architectural
mtimer and eyeq7h specific high-resolution timer with common
hardware trigger. This ensures all timers are precisely in sync

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/mips-cm.h |  1 +
 platform/generic/include/mips/p8700.h   |  5 +++++
 platform/generic/mips/eyeq7h.c          | 17 +++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/platform/generic/include/mips/mips-cm.h b/platform/generic/include/mips/mips-cm.h
index 84f8619b4a1bf2183e70ea151fb447e1c7bffe94..d61cf104b885d0b970713617ef07614825ff01a8 100644
--- a/platform/generic/include/mips/mips-cm.h
+++ b/platform/generic/include/mips/mips-cm.h
@@ -76,6 +76,7 @@ CPC_CX_ACCESSOR_RW(32, CPC_Cx_STAT_CONF, stat_conf)
 	CPS_ACCESSOR_RW(cpc, sz, CPC_OFFSET + (off), name)
 
 CPC_ACCESSOR_RW(32, CPC_PWRUP_CTL, pwrup_ctl)
+CPC_ACCESSOR_RW(64, CPC_TIMECTL, timectl)
 CPC_ACCESSOR_RW(64, CPC_HRTIME, hrtime)
 CPC_ACCESSOR_RW(32, CPC_CM_STAT_CONF, cm_stat_conf)
 
diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 4530fdf06fd91a3f1f8a2e0ae3c1db2d8f0bec69..0675635565589105594c231505be8b094ca4a25a 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -147,6 +147,11 @@ extern const struct p8700_cm_info *p8700_cm_info;
 
 /* CPC Block offsets */
 #define CPC_PWRUP_CTL		0x0030
+#define CPC_TIMECTL		0x0058
+#define TIMECTL_HARMED		BIT(3)
+#define TIMECTL_HSTOP		BIT(2)
+#define TIMECTL_MARMED		BIT(1)
+#define TIMECTL_MSTOP		BIT(0)
 #define CPC_HRTIME		0x0090
 #define CPC_CM_STAT_CONF	0x1008
 
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 58636ffb336f79668b1ecfae1b8251026f323e74..281848e79e664eaae42d69c0f0c7b6fcd4dd48b6 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -44,6 +44,9 @@
 #define TSTCSR_MIPS12_PRESENT	GENMASK(3, 2)
 #define TSTCSR_ACC_PRESENT	GENMASK(5, 4)
 
+#define OLB_WEST_CFG		0x68
+#define WEST_CFG_MIPS_MTIME_START	BIT(8)
+
 /* Use in nascent init - not have DTB yet */
 #define DRAM_ADDRESS		0x800000000UL
 #define DRAM_SIZE		0x800000000UL
@@ -243,6 +246,20 @@ static void eyeq7h_init_clusters(void)
 		eyeq7h_power_up_other_cluster(INSERT_FIELD(0, P8700_HARTID_CLUSTER, i));
 	}
 	eyeq7h_active_clusters = num_clusters;
+	/**
+	 * sync timers in all clusters. EQ7 have counters restart pins for clusters
+	 * connected to the OLB.
+	 * Stop/arm all counters, then restart all at once
+	 */
+	for (int i = 0; i < num_clusters; i++) {
+		write_cpc_timectl(INSERT_FIELD(0, P8700_HARTID_CLUSTER, i),
+				  TIMECTL_HARMED | TIMECTL_HSTOP | TIMECTL_MARMED | TIMECTL_MSTOP);
+	}
+	{
+		u32 cfg = readl((void*)OLB_WEST + OLB_WEST_CFG);
+
+		writel(cfg | WEST_CFG_MIPS_MTIME_START, (void*)OLB_WEST + OLB_WEST_CFG);
+	}
 }
 
 static int eyeq7h_early_init(bool cold_boot)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
