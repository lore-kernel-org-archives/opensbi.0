Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A1BD31A31
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DM7k2K/R2gMwoBFjckzsmBp46/XCtPhksoVmQuyfkE8=; b=k1F8XlQFg8U+E9
	c869raA6y4BQ9uVxIBbaZTJPbsVLrToB+WHxk9VTmrPOSfy95IkUiGkxbk5n8U9Nt8tXCUdxAwjOc
	Rw5WbI8ong5iHlKjs8JXNMNxnc+LMTamdbftZznzAr+r26fW/zkFiN6c2Gf3dmOgq+I4EzgLvj3bG
	VnqNfL71qfQZAMgZ0cSmJ5EPDIL9uPjV8bd9OAh4Lme7UQi0ra+Jvpy8xYv7b3Eq1F8p8ySIFiR9x
	DtQLHSFHum8fEpn2afuQKSqO5xXLGn8V4SF1hwXVBNzjgQBg5s7mCEw0yfCqAnHr3OGkUhQrwK1Kn
	qlwqdOsk3Zz81uvMJlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4N-00000008Vn6-2HPm;
	Wed, 14 Jan 2026 09:21:39 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4J-00000008Vdu-24Wu
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382495; x=1799918495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JDeRXy1TGafCCsU6aFaccZN5UL/B4v4bkdm6NtioNH4=;
  b=FW5nl6pr5heaIlXXjUrHP2XddFbN5ds00p1MdXo/4sFY7YOk7oOrmAuH
   aMl1oKMv45LDpeGTeiu0QyDxacIII8qZJwTFMN9O8Kum/+MjvyCKhmIqi
   yoK1PdWSefxhBMlTU8rGhhB6O39aE8sSCBMqjvgaOgOlun0uuN8qqvWbk
   C6xIXBG786eCvlxVrUAmbB/c4ncQLTnoFtIWOja2K4EDcqafpiIQzuddp
   C8TQ0DOnp2YDQCCupby9Imgq0tbfCE+PSwiYG+5HBN8PdTgdUIlf6/BLp
   FLLEJHow+wL1v6szHqOokMw0BLjxNN6yjLYENLeSLoASY6EaG8AqGEbbd
   w==;
X-CSE-ConnectionGUID: z46RAvKCTcWX/fTP+QsvEg==
X-CSE-MsgGUID: PZqBXzibR7ebs04hbHMbfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:26 +0200
X-CSE-ConnectionGUID: MY9+IIZQSkqdJlJOYkb0/Q==
X-CSE-MsgGUID: ZZGRECIkT+ePk63vHAjZ+w==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:08 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:25 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 05/22] platform: generic: mips p8700: fix powering up other cluster
Date: Wed, 14 Jan 2026 11:21:01 +0200
Message-ID: <20260114092118.1315581-6-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012135_865081_7A17BDF2 
X-CRM114-Status: GOOD (  14.42  )
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
index 2ba412a057a8..1fb6ece3ab68 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_hart_pmp.h>
+#include <sbi/riscv_barrier.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
@@ -44,32 +45,22 @@ static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 
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
