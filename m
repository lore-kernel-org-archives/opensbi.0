Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C6D31A35
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPH+G0N+BIKuYrv83GqkLpXYhPiUrLq2vYPNVznUAbk=; b=HYp+o/0kGLAARx
	DU9D6C4+QjBmu8hO/YtenOW1tmL5U0ejWoBsqM9j1sfuBrTF73nAubYwZIQodS5NKzjCz8y+kc8Jj
	P94Z6kq8ZqCwHd2QsStzGu7nKUK4SFVywbgDHlu2HZO0ht7kReo633in84Jl9BNMvWkiSrwY5jdoJ
	9AU2nBsKWX1iGmxIgUc0QHzhcBaMVJrsYzy34HVDkIdpArqsi4runLTT4oYPP/hK8bWTdsCVxgbhp
	MBZoiGvFuu2jv04zbj3n++NETYclaypIkHNc/ENRcMo/NA6gQQ4Pm+ZjEvrf2wSjaiT9rceivvlnY
	cGw5YNEvkxcQEIUMOyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBM-00000008YTk-3m6u;
	Wed, 14 Jan 2026 09:28:52 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBI-00000008YPE-2I4p
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382928; x=1799918928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OJy22t9kJ5sLLWM7l3jYnrc5ARmyVOJgnMq5OZVNrew=;
  b=FgEgebC1wHE7ABQTW8kMBY56S1UVgxrlyCkUgzO24QQ4e8G0KwgeTUe0
   ICB/VUbl0lFSdzy8C/BDbxzLNJozwkBRXHE7i1mmWRc08Qmze7RjpDEtR
   MtAq/OQKoHr/OIVLORL0wiERnxt6t2M7LJdamZl1DEiRR8afzyldm9A9r
   DQWFwqYQAUDDNPQcgGMRMF8zKvDwu9q0/YXS1NpuhJ/sHgw8EUUKY0s9j
   cI3j9g6gG1fvCwomtMaxsaJ/XohSxelvPr9p+YC+R0GeRB4rmxlb50L8o
   7jFJXOUy+xtxAkSJdc1ic6dfKF/uF4em7fZB4NAbyXawJ2fr9A+YWsqN8
   Q==;
X-CSE-ConnectionGUID: DT3BXtSOQS6/IJHKl1UGIg==
X-CSE-MsgGUID: WWCKCu9RSfG8ATd8yzEI8w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:42 +0200
X-CSE-ConnectionGUID: tb1p26eDRK2faWjX4WKoiQ==
X-CSE-MsgGUID: 67ZVBkI8QHSi8k4zh+wLrA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:31 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:40 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 19/22] platform: generic: mips p8700: synchronize hi-res timers
Date: Wed, 14 Jan 2026 11:21:15 +0200
Message-ID: <20260114092118.1315581-20-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012849_592907_D3F2BFA9 
X-CRM114-Status: GOOD (  13.06  )
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

There's high-resolution (1GHz) timer found in the p8700 cluster.
This timer used for precise time measurement by platform specific
software.

Synchronize this proprietary timers to reference in cluster 0.
Procedure borrowed from the aclint mtimer.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/mips-cm.h |  1 +
 platform/generic/include/mips/p8700.h   |  1 +
 platform/generic/mips/p8700.c           | 18 +++++++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/platform/generic/include/mips/mips-cm.h b/platform/generic/include/mips/mips-cm.h
index b3e056e8f9a6..84f8619b4a1b 100644
--- a/platform/generic/include/mips/mips-cm.h
+++ b/platform/generic/include/mips/mips-cm.h
@@ -76,6 +76,7 @@ CPC_CX_ACCESSOR_RW(32, CPC_Cx_STAT_CONF, stat_conf)
 	CPS_ACCESSOR_RW(cpc, sz, CPC_OFFSET + (off), name)
 
 CPC_ACCESSOR_RW(32, CPC_PWRUP_CTL, pwrup_ctl)
+CPC_ACCESSOR_RW(64, CPC_HRTIME, hrtime)
 CPC_ACCESSOR_RW(32, CPC_CM_STAT_CONF, cm_stat_conf)
 
 #endif
diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 169181642716..4530fdf06fd9 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -147,6 +147,7 @@ extern const struct p8700_cm_info *p8700_cm_info;
 
 /* CPC Block offsets */
 #define CPC_PWRUP_CTL		0x0030
+#define CPC_HRTIME		0x0090
 #define CPC_CM_STAT_CONF	0x1008
 
 #define CPC_OFF_LOCAL		0x2000
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 8258cd882532..46d3d446cae3 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -37,6 +37,19 @@ void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 	csr_write_num(pmacfg_csr, pmacfg);
 }
 
+static void mips_p8700_sync_hrtimer(unsigned int cl)
+{
+	u64 v1, v2, mv, delta;
+	volatile u64 *my_timer = (volatile u64 *)(p8700_cm_info->gcr_base[cl] + CPC_OFFSET + CPC_HRTIME);
+	volatile u64 *ref_timer = (volatile u64 *)(p8700_cm_info->gcr_base[0] + CPC_OFFSET + CPC_HRTIME);
+
+	v1 = readq_relaxed(my_timer);
+	mv = readq_relaxed(ref_timer);
+	v2 = readq_relaxed(my_timer);
+	delta = mv - ((v1 / 2) + (v2 / 2));
+	writeq_relaxed(readq_relaxed(my_timer) + delta, my_timer);
+}
+
 void mips_p8700_power_up_other_cluster(u32 hartid)
 {
 	unsigned int cl = cpu_cluster(hartid);
@@ -49,8 +62,11 @@ void mips_p8700_power_up_other_cluster(u32 hartid)
 		u32 stat = read_cpc_cm_stat_conf(hartid);
 
 		stat = EXTRACT_FIELD(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
-		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5)
+		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5) {
+			if (cl) // sync high-res timer to cluster 0
+				mips_p8700_sync_hrtimer(cl);
 			return;
+		}
 		cpu_relax();
 	}
 	sbi_printf("ERROR: Fail to power up cluster %u\n", cl);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
