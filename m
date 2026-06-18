Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE3FCD98ED
	for <opensbi@archiver.kernel.org>; Thu, 18 Jun 2026 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k+UnWf59OqlL8ij5U+XAerEGONsRPjLaLlgzNsMlId4=; b=IqeA8k6dnSdu6w
	r0ZBrLLlBWv6WgMp7Z4l7bJgfgCyegMr1dW0hsjCeFX1vzXSNZItLFZ5g8JYlu7lZNe3zqdMWA6tF
	SFfYeFbVVwZuDxWQEt17QjuQ3bcxGg6EncaxzGfZuG1keIRUf+ObH0TDArytJck0fsThyq8jhw70e
	vf+aLBd63ZAzbVuY0PHfTwSyY37O+iMAKYMNor3OH6qwj2SOs6V+8n+APtUgjS8FKc5F80CuRVwvY
	HbHFDB1qGIQJWLkbTjHJMMGJXaDCwX2PzDvIu9+LyuCXuvzPzIQ1gNdcGPIKdc5ZjMQ6BaqHebtCZ
	0SBsaKieck8MfZCJUfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waA8F-0000000172M-1p4u;
	Thu, 18 Jun 2026 10:37:59 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waA7e-0000000170e-2pII
	for opensbi@lists.infradead.org;
	Thu, 18 Jun 2026 10:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1781779043; x=1813315043;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2v9Tt/w83jpcam+WJQMrGmHJ05zu3UbFgS6Q1KDbNDk=;
  b=moSN8FYS7YxYyWsmdmnx6NYssXu5qcZqZJZgHCV8s6GwX2yLjvaPl9wV
   rSKUQVfmL8OV6eVTkuhVu0bxbLAMEU6epRzfVMj6F63prb48HeUjwvxfx
   XEgqcHE3kk7iNh+moHeN7Cbo2uPbEv9nL1MpMmKzRPVxcFjvyeeY5LVWK
   kSnxyJlqTgVXP36gW7/l8jEYbnq4mVIlhgHmOHPbwk7+51bo0xcbcjXBO
   NeudzF9R8CjJzWHT6kQErbmtLZmqcFv3EaGBk0ZOmDM/ew4WPbv18BuXW
   B1OfoI23HNTpYIMqV5AVSxFfs4OYyBBuyO7dqo1uoMKTj4qWaK9rmfhmW
   w==;
X-CSE-ConnectionGUID: eCOss8orQJqlVeYlskt3PA==
X-CSE-MsgGUID: lICulz+iQ9mQKnXJLoSUCA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 13:37:19 +0300
X-CSE-ConnectionGUID: xVMv+BT5Q2+eCDeyHwff1g==
X-CSE-MsgGUID: k28VY3cLRoSNzPdKCYNoxw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 18 Jun 2026 13:42:19 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 18 Jun 2026 13:37:16 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	chao-ying.fu@globalfoundries.com
Cc: opensbi@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH] platform: generic: mips eyeq7h: fix boot with JTAG
Date: Thu, 18 Jun 2026 13:37:13 +0300
Message-ID: <20260618103713.2588984-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_033723_319215_4D66A6A1 
X-CRM114-Status: GOOD (  10.25  )
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

When JTAG is connected, internal logic leads to the bit
MIPS_CTL0_DBG_RST_DASRT (for the debug unit) stay high and this
prevents normal cluster power-up.

Force proper power-on reset value prior to power-up sequence.
Hold this value for about 10 usec

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/eyeq7h.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 242cbb3ce327..30af096c14f4 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -73,7 +73,13 @@ static void eyeq7h_powerup_olb(u32 hartid)
 	/* Get the MIPS_CM_CTL0 address */
 	cmd = (volatile void *)(MIPS_OLB_ADDR[cl] + MIPS_CM_CTL0);
 
-	temp = readl(cmd);
+	/* set reset value. Value may be wrong after JTAG debug session */
+	temp = MIPS_CTL0_CACHE_HW_INIT_INHIBIT |
+	       INSERT_FIELD(0, MIPS_CTL0_DBU_COLD_PWR_UP, 2) |
+	       MIPS_CTL0_DBU_PWR_UP | MIPS_CTL0_CM_PWR_UP;
+	writel(temp, cmd);
+	wmb();
+	sbi_timer_udelay(10);
 	/* Enable HW cache init */
 	temp = temp & ~MIPS_CTL0_CACHE_HW_INIT_INHIBIT;
 	/* deassert reset */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
