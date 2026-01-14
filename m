Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9811BD31A33
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPnv4wbSElheJQVIk7eFSnhY4XSCQ1ANA8V8JjWaTN4=; b=237RIaccCoj+PM
	TRTfNzCZl9Lt47bpqXx26g0IpUArksRAqb1YXIykA5AbJ3CqKJuEP16Kae3jmwGT6WCiI3Q/AOqZh
	HePrwbQL6G8OhY+CmZHlhim5UEyuUpFQcKTXbq7gi2tPhS1fWB2jnE0A2195i0omR+zkwtllYNPlU
	0IBNQtpvwVLhhqndlf+9GeRXaPmGEqxe+1bE2IVAmwgnXu1feWWPpxRwYzWOGT7iXw16Mz2GO3i5o
	6p1xib5O8SJlyb96Z87OCBuIHTYfYyFe1nVg/IK/KB0ylQo39DguUYmVz1dW0D4ChoqIRjzGOoy7w
	4PfJflcBD+YBhcjOtj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBF-00000008YOO-3OZF;
	Wed, 14 Jan 2026 09:28:45 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBD-00000008YMh-0193
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382922; x=1799918922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oI2fO3pTG4Y9UOgW3+qGNG1kqwxNQ+SUh7cdcs6f21o=;
  b=UVJGnihObG2JckSwDA45xIkOTYHJKuYO8toG4KKVod7bHKdG8iMAjXAD
   cunr5EI9KlSTXgGKEBQdpmhi+Kyc3+YFHDI8SjgJonnJQwS5ZS6QIcQZX
   jRIRUG4ZDPkSWJ3L04QTQSK30cEG1hH2TiZNx5g06Pjy7s9l4KUZzKBBk
   voo+G5aimKTmxEjppWOUk8wZhvg1MTTUle1/fedTHSizklpHLo7ZzqrPL
   wk5D4d61geBz1L1gLmg7nGErba+NVEbDMAvpiwrEWH4mhKGN/H/yqGsfX
   62UFYk1NMxkj9/D2XjEfvUOSx+mPJWFByvk9YD/OcmQxXMbaIMnGQl9ve
   w==;
X-CSE-ConnectionGUID: IKWDQWRxSOa9djxPvOgmbg==
X-CSE-MsgGUID: I+Fpf0ZnRSyw47IxgesIYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:29 +0200
X-CSE-ConnectionGUID: qNRkS3KoQH+NVbdsON5ygQ==
X-CSE-MsgGUID: li1542k5SMGyE38VU3LzEg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces01_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:16 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:28 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 07/22] platform: generic: mips p8700: faster core boot
Date: Wed, 14 Jan 2026 11:21:03 +0200
Message-ID: <20260114092118.1315581-8-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012843_313839_ED53831A 
X-CRM114-Status: GOOD (  14.54  )
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

When powering up cores, wait for power up to complete
using tight loop. This saves 10ms delay observed for every core

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/p8700.c | 53 ++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index b4aef5fa7e36..329a84b4ddec 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -62,10 +62,24 @@ static void power_up_other_cluster(u32 hartid)
 	sbi_printf("ERROR: Fail to power up cluster %u\n", cl);
 }
 
+
+struct mips_boot_params {
+	u32 hartid;
+	bool local_p;
+	u32 target_state;
+};
+
+static bool mips_hart_reached_state(void *arg)
+{
+	struct mips_boot_params *p = arg;
+	u32 stat = read_cpc_co_stat_conf(p->hartid, p->local_p);
+
+	stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
+	return stat == p->target_state;
+}
+
 static int mips_hart_start(u32 hartid, ulong saddr)
 {
-	unsigned int stat;
-	unsigned int timeout;
 	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
 
 	/* Hart 0 is the boot hart, and we don't use the CPC cmd to start.  */
@@ -76,6 +90,14 @@ static int mips_hart_start(u32 hartid, ulong saddr)
 	write_gcr_co_reset_base(hartid, (unsigned long)mips_warm_boot, local_p);
 
 	if (cpu_hart(hartid) == 0) {
+		unsigned int const timeout_ms = 10;
+		bool booted;
+		struct mips_boot_params p = {
+			.hartid = hartid,
+			.local_p = local_p,
+			.target_state = CPC_Cx_STAT_CONF_SEQ_STATE_U6,
+		};
+
 		/* Ensure its coherency is disabled */
 		write_gcr_co_coherence(hartid, 0, local_p);
 
@@ -85,28 +107,13 @@ static int mips_hart_start(u32 hartid, ulong saddr)
 		/* Reset cluster cl core co hart 0 */
 		write_cpc_co_cmd(hartid, CPC_Cx_CMD_RESET, local_p);
 
-		timeout = 100;
-		while (true) {
-			stat = read_cpc_co_stat_conf(hartid, local_p);
-			stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
-			if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U6)
-				break;
-
-			/* Delay a little while before we start warning */
-			if (timeout) {
-				sbi_timer_mdelay(10);
-				timeout--;
-			}
-			else {
-				sbi_printf("Waiting for cluster %u core %u hart %u to start... STAT_CONF=0x%x\n",
-					   cpu_cluster(hartid),
-					   cpu_core(hartid), cpu_hart(hartid),
-					   stat);
-				break;
-			}
+		booted = sbi_timer_waitms_until(mips_hart_reached_state, &p, timeout_ms);
+		if (!booted) {
+			sbi_printf("ERROR: failed to boot hart 0x%x in %d ms\n",
+				   hartid, timeout_ms);
+			return -SBI_ETIMEDOUT;
 		}
-	}
-	else {
+	} else {
 		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid), local_p);
 	}
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
