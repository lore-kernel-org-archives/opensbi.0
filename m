Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2C6EA4FCE
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lN7hhLR+ydmHx0v0i3J/rIPN8Qt1WOFZzulHM7D/fMM=; b=YNNmPrt8fj8ZoV
	wXkNf1JVyOoxPvO65LTcCe3Wz6oTF6SpWLT9bKewI5foJqEqatp+xdUXm+1MvpRdoWPTNkb/hN2Qg
	ISxfGjWNFnelnLY6oE9ooDXk+5FskhfPCeVZXkfeCcE/5glP6zR/8RaNhYrHlG7bBmL9+cza6u+FR
	eZdl+wbm1SZdtTLcODYZ086F9X7AwOU3k9s3L2c5iwEWNvItUrYB9aq8K7bZitmwSan89xxjiRuog
	HV4juPT84QbmHWSU2SnBY9JobyhxCo9DJnqC5Pl131wSv1hPt5hBv8iIGygvaSAM3jMX987A0ylGa
	mQ4n6orT4hEzpqdGG7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLT-00000000Vcp-1hjN;
	Mon, 23 Feb 2026 14:55:35 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLP-00000000VWP-1KTD
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858531; x=1803394531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1ERAlNNyseq0sH9Qa+5hK9TT1hWDwS0OhRZUS5y5rlw=;
  b=jYUcAcltcL94+NABoQyqAgEbbpQ0e2bHwfpTVQ9uGJ6vTeJET1frrdzZ
   VtLlRvddAjgKqoeFnnFcQWTAMupYnFANn0jPja6VUEeakRrnOFttDat7Y
   tMy3x0Mhka1FVwcxKxNGPqT5gWx9gaLSiWShabIxU+9zSz1E1K0BKUMan
   1opqrRuZeWdFLNgYT1XhaSNwhWET9N9p4EGDU0iChGGy+kvmlySSqyzuo
   ZsWKuUCQjGbIK2cj9hoK3AsvwhpsVvMC0vr+J3+z5wz67L03TDivUc3ot
   APPjFTNmwdraXXelPfQNvtc3ZP0m6UliCrxPA93ic3yRHu0q/wM+tGFwd
   w==;
X-CSE-ConnectionGUID: kDdIFLQGQgWB85VrgMn8og==
X-CSE-MsgGUID: NFQ6WAQLQkKwK1M8KegRQg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:27 +0200
X-CSE-ConnectionGUID: i8KfhiKWRU2OjTeixCTiYg==
X-CSE-MsgGUID: kTtaRManQDWcd/93i7iw1g==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:07 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:26 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 05/23] platform: generic: mips p8700: fix powering up
 other cluster
Date: Mon, 23 Feb 2026 16:54:44 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-5-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065531_624566_A290D799 
X-CRM114-Status: GOOD (  10.71  )
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

While powering up cluster, only indication is bit in cluster
power control.

It used to wait for CORE0 in that cluster reach U5 state
(non-coherent execution), this won't happen when only CM
powered up without booting any core

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/p8700.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 07cea604a4157bc77f968ae7ccb9a361a17972a7..48fce1d8b50d168e84bb4f4fb6eb5d43c99a20ec 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_timer.h>
+#include <sbi/riscv_barrier.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
@@ -42,32 +43,22 @@ static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 
 static void power_up_other_cluster(u32 hartid)
 {
-	unsigned int stat;
-	unsigned int timeout;
-	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
+	unsigned int cl = cpu_cluster(hartid);
+	bool local_p = (cpu_cluster(current_hartid()) == cl);
 
-	/* Power up cluster cl core 0 hart 0 */
+	/* Power up CM in cluster */
 	write_cpc_pwrup_ctl(hartid, 1, local_p);
 
 	/* Wait for the CM to start up */
-	timeout = 100;
-	while (true) {
-		stat = read_cpc_cm_stat_conf(hartid, local_p);
+	for (int i = 100; i > 0; i--) {
+		u32 stat = read_cpc_cm_stat_conf(hartid, local_p);
+
 		stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
 		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5)
-			break;
-
-		/* Delay a little while before we start warning */
-		if (timeout) {
-			sbi_dprintf("Delay a little while before we start warning\n");
-			timeout--;
-		}
-		else {
-			sbi_printf("Waiting for cluster %u CM to power up... STAT_CONF=0x%x\n",
-				   cpu_cluster(hartid), stat);
-			break;
-		}
+			return;
+		cpu_relax();
 	}
+	sbi_printf("ERROR: Fail to power up cluster %u\n", cl);
 }
 
 static int mips_hart_start(u32 hartid, ulong saddr)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
