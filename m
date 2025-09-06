Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3496CCA1012
	for <opensbi@archiver.kernel.org>; Sat,  6 Sep 2025 05:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4VNkmkqlw9r+D9f23N+ZE5wzxeZ36wc/lPAHkToTejU=; b=nTirPGir698DC0
	Kb4cwRE4silbvk3Lypswy8SWkC8nQBPd2ZkHG89cbroJVq07zZYkkb49xr6Q8CU6eH0SRUdD7r/K7
	aLYsPigzBrJr5V8ReJ697cItyV3cIGoCvMCxE6vFBx9UmxEkAEVWPyQrPxuUzE4lWHLIB8+Eyxu15
	iwUxmbCKKRFSUUoXdxBjEk5WuR3sfdYaMU1b6ra3pMluUs0f6q9j8wLHQESW6r78br6IuiOqR4Y1l
	ojuTVHmLy9GUTaFKaFByoEP0eOczw8uFE5pd4XvkzmYGA4s9aqENCk9Moulm6oznfT8bsTGDgl2s/
	7LtwECmsDteAi0YsnkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uulbY-00000006qYQ-2ALp;
	Sat, 06 Sep 2025 05:36:52 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uulbV-00000006qWo-2Mak
	for opensbi@lists.infradead.org;
	Sat, 06 Sep 2025 05:36:51 +0000
Received: from LT03.fritz.box (ip-005-147-080-091.um06.pools.vodafone-ip.de [5.147.80.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 757EB415ED;
	Sat,  6 Sep 2025 05:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1757137005;
	bh=w5qixZoHj4tymGFWLs+fmUQOBI7sCCv+aDCT3fwaCsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=QnAA7ftj45v22w+sY/USqqew/FsluxT9tBvbdD2HdBkKT44PZDrH488q0jhJYr0oV
	 HCxnuBNv90zNpiy33XxDhQkTuwKj4CbMJM5cGqNEZ9pEhV76Aqy3Ho32Q9yV0ot+sa
	 hBUq/UaExS3r0qcmHUdGj5HJ0HGUxyPaH2TFjYdKE5YS6NIZ3UBOQPhpOANbGaVAWb
	 a/U1FI+meJPcXYgcUS04F9tU9b8Ws/d8lPbQB971uuNWlkyj1E0ZejzhiXKnDIgRXu
	 vezDSpSgc7xcvcIufrZdoGb8gNJnCROP2IeDTOp4ZOPeVuxaM+V2xRxGZEhE9HDNkB
	 yBDMcXUdHorBw==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] platform: starfive: jh7110: Add starfive,jh7110s compatible
Date: Sat,  6 Sep 2025 07:36:38 +0200
Message-ID: <20250906053638.69671-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_223649_929197_80F6FB64 
X-CRM114-Status: UNSURE (   8.33  )
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

From: Hal Feng <hal.feng@starfivetech.com>

Add support for VisionFive 2 Lite board.

Link: https://github.com/hal-feng/opensbi/commit/b7e46979a4feb293070094835ba4058b5e55d707
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 platform/generic/starfive/jh7110.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index dcd6306b..dc9a2864 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -308,6 +308,7 @@ static void starfive_jh7110_fw_init(void *fdt, const struct fdt_match *match)
 
 static const struct fdt_match starfive_jh7110_match[] = {
 	{ .compatible = "starfive,jh7110" },
+	{ .compatible = "starfive,jh7110s" },
 	{ },
 };
 
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
