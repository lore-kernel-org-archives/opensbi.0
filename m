Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD2BCA5FE1
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgjkYLTsKxoDH/svXbVS63c0kYam5FwdeF9Yu75hM3I=; b=Vi47PI51Xt+Kmf
	nzwRPT+BanWkiGEkUh1H4SS8ZWj5Q4j0Zl6hJtr1YY+h5jbo+/pkpdUYIYni7k5Opf11DZY5Sxp7C
	T8uJYoFHQd1Zi0/yAjHkak1Fb1f2NfumYMlnko69WEsbWgZtzKXlB1LluK3h4zf0EgW5hsfDKmZKr
	bButnub/KqeZM1fF05Z/CnpiYvAWfja1uyMu841TGMKMomd4Cs1PeUar7IsNXqOaX5fvfj+Il8FH3
	OHz+sa0nbes0Wl9oBjb9DxtSqa7E1VG4lyLzHukdEqVu4PnU/ymkRx48cEDYKQIUuRuidB/GOCoFQ
	rlo72TBxW7Ywh299bIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6s-0000000HSve-3HTI;
	Sun, 18 Jan 2026 11:38:22 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6l-0000000HSoX-0TrT
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736295; x=1800272295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LS09FvaxagTyY/N0H+CXl3LIeSoMu6IaFUnFsxtKOZ8=;
  b=iQYsdJuwvBOrDxEzTqkdEJ7rmtnreIY592a54Rln0XWDjqD1JDSiOlgK
   cm8W5YgWL+2oXGg9fBjWg6ixkfMqDKR++LYZeYTOKeaosYw8As7ohpSn4
   HEJ2yIhuvUxbvJ8EMwJ2D+w0JKvnf9bqMxqrDwyjtCA0np3uUqap7l4fh
   JxOqhDzGwLpv7cu9FhziiOZV1E6PJYz6RZ0PeTBcTzsSR+7i4F/h7lL34
   QuuNsyh/J3Cq/a1cG1PyJt1omMUioffUGEmSdjiduR/6Jsq2doAvujh87
   Unpily0bBM0+QLtlvKK4kWmSa0WDWolLPYOavlrx5oyT3Uj/b4WWq8NSS
   g==;
X-CSE-ConnectionGUID: jesx3HWBTBa07iaw9MlIGQ==
X-CSE-MsgGUID: 7Nb4rFWCT8uUTR1uPgUDlQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:10 +0200
X-CSE-ConnectionGUID: CAR4f3kpSfCtXe5bP0eEXg==
X-CSE-MsgGUID: xt+7cXfzRvKU1SaJaFkGdQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 18 Jan 2026 13:40:00 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:09 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 05/20] platform: generic: mips p8700: faster core boot
Date: Sun, 18 Jan 2026 13:37:47 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-5-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033815_790965_0229E786 
X-CRM114-Status: GOOD (  10.81  )
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
 platform/generic/mips/p8700.c | 53 ++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 48fce1d8b50d168e84bb4f4fb6eb5d43c99a20ec..33b80dc1230559073113f5ca2d5e1a07dba20ff6 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -61,10 +61,24 @@ static void power_up_other_cluster(u32 hartid)
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
@@ -75,6 +89,14 @@ static int mips_hart_start(u32 hartid, ulong saddr)
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
 
@@ -84,28 +106,13 @@ static int mips_hart_start(u32 hartid, ulong saddr)
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
