Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9F1C9832F
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/evHGS7jUiEFVCjsiy5871cblA/LatR4HM2GPzgHnVs=; b=OB3n4jvhi+4VdV
	HiAVuqWb8G/RiN71vzsGKqKV0xu00rQqW1oUVE5nrNShFCNwLMY3DVfxWN93dx2HBCDaKCp4MposZ
	9G3MRjdu5/RrKCQj9hXwuJtybr1BbkI6Cpq/wipUjkfB+Zf25fCDEl3gXQ5oGl7TWLKZpAn7ZYmZB
	af3UHQrGOk9Ie97HiMngJt60MgGH0/4ew3tt25lMASCCPYvpPXDXbbTLZrTAXeWNWp2H7t36/NZ+N
	S8VzjfFM5ChylYxejk9Gwf8xPVFxCWCtQNevWJihr7B6ot67f/Gr8Yeo0VvZcJqAIHR1sabSamacQ
	dpbZPNBR/LeUhAFjoe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR76-0000000HTB1-2GyT;
	Sun, 18 Jan 2026 11:38:36 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6w-0000000HSxX-0HWl
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736306; x=1800272306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qBzRsFrUVun9A4O/B4/WKXp1dpyLbNyCpOc+thMFV34=;
  b=XVnzSQtCpflZ/FgHGTTD0xAKv7cAPtwe28uiK0nleKPGECBvZ1YaqhLC
   4/kpomAUBpxNYT/n2BO8SJjGNLDNyQGRjwJD7FKv+Nrta9Wk87ya2pt4q
   PWSbqmIE8wB0JGOTCUe53YHHBSBmew5v5xiNqqkcCpVEVveBLvuN8kgJx
   QpnnqjsS16yrS58rWCoCbbgUFhM8/Es+qEihg97E6c2fSyOaT4/kGjHMk
   seoPyt5X2Zrq6+F6QFw2fh/14A2NqHeRN4WJqPtIc9AWu1e5YGCzLrrS0
   E3+pkdAFRZPqsxawb1hEbHuMVOvoFeP7gdtDSRy7n8fqnbEec3zk+iAGz
   g==;
X-CSE-ConnectionGUID: pGyy4ODBQxyFdhw0aArWHw==
X-CSE-MsgGUID: 7qbwYt/MQPio0C+VGviDOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:24 +0200
X-CSE-ConnectionGUID: 7kQJebrrSlujc6y1D0EVTQ==
X-CSE-MsgGUID: Dk6V73JhQbW8OzfjYJjFdw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 18 Jan 2026 13:40:11 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:23 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 17/20] platform: generic: mips eyeq7h: synchronize
 timers across clusters
Date: Sun, 18 Jan 2026 13:37:59 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-17-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033827_126452_A5DD1B2A 
X-CRM114-Status: GOOD (  11.28  )
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
index e58b010f0c97f34e9e1e07a2ee984516abfeb1d8..fb4cccc2bf4de4914b650e3934fa04418e594e58 100644
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
@@ -241,6 +244,20 @@ static void eyeq7h_init_clusters(void)
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
