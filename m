Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C494ECA5FEC
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lN7hhLR+ydmHx0v0i3J/rIPN8Qt1WOFZzulHM7D/fMM=; b=iH6hcE2+6GGxL4
	55JwCmbWscTY4mOFQpliwt6thNM/fqVAm/Jngs/60+UcwoSx+R+//u3qY2miFSVAhZpyOULzLEDVb
	yUjbjxlVz4em2z3MJr2v4EUbY9Fi/KyHeoJqeWS2mUkgw5xmgZwN4aOF9Y3e+TTkeWQGdkNCMHMVk
	HcS4MJC4h6goipRFZOuLBpLbCAO/O3zpdYkHzcvfxtT631D07RdGH0xsZw+L/mKifovetPg5fGLdD
	jrqHdzjfeRtVskF7co4gp9j0rRINjaqNivOT0aaw19g+2eWqGvujD2pmA2hGtgKwm0VSfBx5X3RGw
	Hje9XjwTGPl/9ySZee0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6l-0000000HSql-3vg9;
	Sun, 18 Jan 2026 11:38:18 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6i-0000000HSou-35iM
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736292; x=1800272292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1ERAlNNyseq0sH9Qa+5hK9TT1hWDwS0OhRZUS5y5rlw=;
  b=RX2GoyQ63Qrsn+F5mNsEzZMDJTqIl9bRkiW5j7nrAQxJsPlbshP+u+C+
   Ktm+bRnQR5aBaK8oVrqD+ecs2VNnPCjZdLE9AgZhuebMvVyYnITjLHhkJ
   9z2uMmQZ0GXbAKTc2s2XJUXcnbME1aZCNX3tVLjnDn1L2/bKj9nwCEXDD
   c3YMbD6ZmA3rNR49GIZhE5mminjtTWLNyEnSG+rvoOhh6U16g+1tC+hl6
   APJ3AV4lTegH4PPilzlwfiwcgonv495G/9+xukRxzJOvSCF3scqtMwTIK
   h23b7TPTWT8jGhkFmhNayHBw/iiAcWbH5oFpkizWoakrTDCfzcq+NJE0s
   Q==;
X-CSE-ConnectionGUID: jesx3HWBTBa07iaw9MlIGQ==
X-CSE-MsgGUID: pqcwR6uwSNSVCVgqFrlaBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:09 +0200
X-CSE-ConnectionGUID: 5qC219aZRoq8xudn9AU7gg==
X-CSE-MsgGUID: TePpmDLXSnS2+XZl/DuDjw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 18 Jan 2026 13:39:59 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:08 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 04/20] platform: generic: mips p8700: fix powering up
 other cluster
Date: Sun, 18 Jan 2026 13:37:46 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-4-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033813_132515_BE95037B 
X-CRM114-Status: GOOD (  10.90  )
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
