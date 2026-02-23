Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542FCEA4FD2
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAx2M8QMm7mMR4HxjOJlPboM7PUPx1hQlJFUXoXZqKQ=; b=uk8q1qZc3AtMrI
	Kts28GeupGl+rfv+V6rvajJ//I8qiUWX1nZoQkmb0+k38obKYkYSlPrEpUVg5Sv6TpqFdLU2uH19n
	n1OtB0c0o/iGJR3eC4Fsehkc1GjQTxS98ufDHqW6KSfURrLDrY/2djj62scZART5fy04Inur21RY3
	MshiGU0ciMxzRiIR/aiPppUIVEJ/WEFOgjSkZHGi2cbO/qD9YJYrecAfZ3h3zjGs3G5+M2o//503F
	IEg2CIYZxauKrvYvmyDzHVuILrEIyl+Sjb0C5Q5DR1vDkBVjy9OinBfna4xOs4i1e3tjLGxBBy+YL
	vfu/p/d9OkNUhO0LdM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLe-00000000Vw2-03ZR;
	Mon, 23 Feb 2026 14:55:46 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLa-00000000Vow-3s83
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858540; x=1803394540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+ooDNXfzpihGb+pUaGxwUehq0gIGOWNhwE5XVpk804k=;
  b=LLgsGPzovickL5AJoVbKB+RpnUQZvF/6P5t5UqD271EtfdeL+8ZoxOO8
   3WJUUB4dgCeZ4WNXtZwMRwOrAy1hWZ2WViMG8C21irbjbm7+JLsbF+18L
   cgyT4nzof0H+xQ9wx6nCtuvqv0p88gJAnXYMaRB6T+1n6kFRG2W8oXiQ4
   U7gLMkJGKfcJzOVZQsvi9xkavmOwWSvaD62PCjhw7KPTAum6zb+VuCYC6
   WJ6JOE2kIVcKf9kRlrvGC0sqPidVYVgO/wVUi/NgrBO54UxKBkwQhpbUg
   MC3VB6vk+zsGdUW5UeFv7mNiIRAO34bqNyxnM6xFcnSfX52XADCYM6Xb7
   Q==;
X-CSE-ConnectionGUID: 5r1ggCDsQQyE79R8E3l/aw==
X-CSE-MsgGUID: FXrziT2ZSGmrzfvmbuEuZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:39 +0200
X-CSE-ConnectionGUID: lY5xC77STy+T/61FszTQ2w==
X-CSE-MsgGUID: KxCVXwReSS2FBBymzqQSSg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:19 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:39 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 17/23] platform: generic: mips p8700: synchronize hi-res
 timers
Date: Mon, 23 Feb 2026 16:54:56 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-17-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065543_247024_83F67EB7 
X-CRM114-Status: UNSURE (   9.52  )
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
index b3e056e8f9a64b9a44cfc43e505d9a8b698c49fa..84f8619b4a1bf2183e70ea151fb447e1c7bffe94 100644
--- a/platform/generic/include/mips/mips-cm.h
+++ b/platform/generic/include/mips/mips-cm.h
@@ -76,6 +76,7 @@ CPC_CX_ACCESSOR_RW(32, CPC_Cx_STAT_CONF, stat_conf)
 	CPS_ACCESSOR_RW(cpc, sz, CPC_OFFSET + (off), name)
 
 CPC_ACCESSOR_RW(32, CPC_PWRUP_CTL, pwrup_ctl)
+CPC_ACCESSOR_RW(64, CPC_HRTIME, hrtime)
 CPC_ACCESSOR_RW(32, CPC_CM_STAT_CONF, cm_stat_conf)
 
 #endif
diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index 169181642716a2dea4b417db910895bd1960a5ec..4530fdf06fd91a3f1f8a2e0ae3c1db2d8f0bec69 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -147,6 +147,7 @@ extern const struct p8700_cm_info *p8700_cm_info;
 
 /* CPC Block offsets */
 #define CPC_PWRUP_CTL		0x0030
+#define CPC_HRTIME		0x0090
 #define CPC_CM_STAT_CONF	0x1008
 
 #define CPC_OFF_LOCAL		0x2000
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index a0884f211ca121a13f0f17f31319934527cd4209..ffc8520f7c5a2c4cf7574291dd49c8acd4f0623a 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -36,6 +36,19 @@ void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
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
@@ -48,8 +61,11 @@ void mips_p8700_power_up_other_cluster(u32 hartid)
 		u32 stat = read_cpc_cm_stat_conf(hartid);
 
 		stat = EXTRACT_FIELD(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
-		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5)
+		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5) {
+			if (cl) /* sync high-res timer to cluster 0 */
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
