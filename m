Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088ABEA4FD2
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgjkYLTsKxoDH/svXbVS63c0kYam5FwdeF9Yu75hM3I=; b=g7OTObdXk7nNy9
	HAQyolq/mkRUOlIsaMMevjggkjMpGihShAxt9POFcTU/8t2/KhJaozB/gIGg1GKweBwPyBBpo8AaH
	Lj2MjNrh8tN0j1d8chXXWASZbj7jUXafBFfHAY0/4m8qj8yguN3CpQ4hLjnZuHsHBY8VWH7QRhTKy
	cR5p1xeXqR8y8Uclz417bvxg/vGgqbKyylVkKxLhHwK0It0LXKd7ZpEOPUA+wPUYWgIT5mKtI28EE
	dzqKssqNiXpFyX/rRVLorgr4TP5pg+pihBomCYuxqBwBoGCOX85wnp7jUFeONhpfW2H6NwrlM63wC
	u1jIEjWc0DmdYLHoTzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLS-00000000Vbx-3Ocj;
	Mon, 23 Feb 2026 14:55:34 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLO-00000000VVR-1GHs
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858528; x=1803394528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LS09FvaxagTyY/N0H+CXl3LIeSoMu6IaFUnFsxtKOZ8=;
  b=Nr1UgAAtVR/esb9sZGBZRYnP7sR/Q29OkdIihvQ2kyOn4eTmbKkYD60P
   nCfOGx8tZe154dtZvmjgEMjXAlFWtxIoLrOSuoeUMMuzml1w1TzhqkoMj
   X6a9OQf3aIbreKpHSisJNs+COE1PaL26tuMM8QCOils3GgiyggeflAF92
   +x09qjWqsPIb+6MS1R5En4/Z0RgTtFEZhH9BArfX64A70W0PJMz6DPx7F
   ywPxW3paC2T37IKxhRoe8g2WbXYKHHA1uftNUH+GjKp08Eyspv0x/idrT
   syWULvEy4QhgmkEKrntBR8kOuLJY6Gr8zegA3rbvLy4oXSUQEhG1/nLoA
   g==;
X-CSE-ConnectionGUID: qI7r+ZoDSMW1Btie+JMykQ==
X-CSE-MsgGUID: kllw4rHUSRmVVACtgM9/zQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:27 +0200
X-CSE-ConnectionGUID: SC9fI9pxQMKsBtodmC+vHQ==
X-CSE-MsgGUID: AIggaKdxT/WhicgdaElAcA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:01 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:28 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 06/23] platform: generic: mips p8700: faster core boot
Date: Mon, 23 Feb 2026 16:54:45 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-6-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065530_608005_38089BC7 
X-CRM114-Status: GOOD (  10.61  )
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
