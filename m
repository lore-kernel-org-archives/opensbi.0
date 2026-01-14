Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBF5D31A33
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acGb7nrLTrO43rVHV8QIWLPQ6/OcEW2MotG02OIJsgQ=; b=rELzVAVpcbTg9u
	dj/JE3PGqqSMWwNdesLHn0b7ngoR4r/v8B65mk2JPvBUC18fLyTyqT14NQ0PHjbyIzqzDJldFqJu0
	GJ60MTGFMxx0P2ByA6QbV8RQPStpdycEN73OAt/nunwqrdRfK4EZ1v0jQvU6YcFbFlU98e2PG/Ip8
	y9gsTFOwII+HY815Qx8bYrZ9C1nQOnA/Bel5eRN9uaRGiz6vwcx5CR9yTabNuJeBXd/T/FQ8wRF+0
	bF4AEpzZ20EYymguXo18Y8tbiva2vlOzm5/N0v2y64T/1ZccDU6Be4DUr39tZ1aLwGKIKQTTQwBpC
	7IdBs5d5arlu5uOAaz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxC0-00000008YnZ-2uC2;
	Wed, 14 Jan 2026 09:29:32 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBw-00000008Yfi-1bAP
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382968; x=1799918968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PxBxhPuARwyqJUNQFgIRH+oHIdsZ5HCRytHLUyeWt/Y=;
  b=Pa6UpNlO98zaBQNOuDe4PV6H0Na3+NNHWZH5L++cyqWXd/+tYp8c1UDU
   0wBm4AUVXUSJOO/KygPhI3Ppfz56pe5tQTUOYfbXbLNrZnA6I9P0hnICg
   Gy/IlAsOj499Ia57lhCkmWhM7YbIgv7Gxaa1zNqGQG0Ly9njzh/FBKA0j
   YjSYCvMFtmQQZs7erTSkIf/RCUNm6XR0zyTiw+2Ey+kZoUWZrpAuAWWqU
   qXZgQ/TVoCyh+Bsmc0BmnqjshPnkW/o5L1w9w49hn+teZ02SS7IoEk2Ho
   BN51nNoNhiOaTNPDfsK63UOv1qo+jBTj6YKttohoTzi121QsgPsfO1WwH
   A==;
X-CSE-ConnectionGUID: 9UgBfyUxS0KYVXB9i5JBMA==
X-CSE-MsgGUID: +vJ5Q+HYSweQOdWFha5SwQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:42 +0200
X-CSE-ConnectionGUID: Q5vADStHQBe1bg/0+oX06Q==
X-CSE-MsgGUID: FEMKT64KQuqVqu4QP5yc9A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:24 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:41 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 20/22] platform: generic: mips eyeq7h: synchronize timers across clusters
Date: Wed, 14 Jan 2026 11:21:16 +0200
Message-ID: <20260114092118.1315581-21-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012928_781609_FF11658F 
X-CRM114-Status: GOOD (  14.55  )
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
index 84f8619b4a1b..d61cf104b885 100644
--- a/platform/generic/include/mips/mips-cm.h
+++ b/platform/generic/include/mips/mips-cm.h
@@ -76,6 +76,7 @@ CPC_CX_ACCESSOR_RW(32, CPC_Cx_STAT_CONF, stat_conf)
 	CPS_ACCESSOR_RW(cpc, sz, CPC_OFFSET + (off), name)
 
 CPC_ACCESSOR_RW(32, CPC_PWRUP_CTL, pwrup_ctl)
+CPC_ACCESSOR_RW(64, CPC_TIMECTL, timectl)
 CPC_ACCESSOR_RW(64, CPC_HRTIME, hrtime)
 CPC_ACCESSOR_RW(32, CPC_CM_STAT_CONF, cm_stat_conf)
 
diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 4530fdf06fd9..067563556558 100644
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
index b4b03bf95eb3..2d4a81d7b335 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -45,6 +45,9 @@
 #define TSTCSR_MIPS12_PRESENT	GENMASK(3, 2)
 #define TSTCSR_ACC_PRESENT	GENMASK(5, 4)
 
+#define OLB_WEST_CFG		0x68
+#define WEST_CFG_MIPS_MTIME_START	BIT(8)
+
 /* Use in nascent init - not have DTB yet */
 #define DRAM_ADDRESS		0x800000000UL
 #define DRAM_SIZE		0x800000000UL
@@ -295,6 +298,20 @@ static void eyeq7h_init_clusters(void)
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
