Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC9CFD313
	for <opensbi@archiver.kernel.org>; Mon, 24 Nov 2025 11:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=amIVdzBx3kmmiiUW6Ps0SU6yt/0/fi3eYKeB21qPN40=; b=RDuRCRafU1IkC7
	E1zabISTpN+3a4h7NAIIK7thfyjjOJ3vCsX72Odo7lLjaDbjLfs/EqAAeAXO/ALRYVjbaKNOhmZca
	7/Lk7OqZz9mInw/4sW7zXkR2DCP1Zq8uoepmqpD2Id8T1/0Vn9xFWI+6Ysue38I4f0neoVGTwGUv7
	LDM0Q5g32SMkKrlPvwhk0stgCOsSOFT13DYNReRG8SqSnDVcfXoW/3wXbKXrLwvUrA9PVgNzCTLyk
	x4Oo/1KaV2fVVBEqaOrFVNOiMxUEvKuoXQgFq/hYyNBVfysKof8XxlsjAnVGV3KtAf4NcseCh38H5
	BBNK7tUk7AuMpGSMxNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUaR-0000000BXj8-0OEG;
	Mon, 24 Nov 2025 11:18:27 +0000
Received: from sender3-op-o15.zoho.com ([136.143.184.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUaM-0000000BXiV-0rLq
	for opensbi@lists.infradead.org;
	Mon, 24 Nov 2025 11:18:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763983091; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gPmau1mYPru5O6lWn1t6bF08hmUswgpiDfczupJy6qOSvCZDwFww7t8mj79VibnW6pZsviSWOUkR4u9SVmbf1wDhW5l1m+ggdIOA/hy7RhUEwB214bxEHkeMcQ5WuwXJcPmhNEzIBjSE0PnJOPvnP6l7koMiUwbDuPm7RLGpr9k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763983091; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B5pZTIPB34MPNxItHYPtcxN2fd08qqlXYWPPhWMfeVs=; 
	b=n+rdHc5/kQlN561d8Ku54Ut9rw3lhO/pbefV7BdJMjPkktEFCxv2f6S5THFzuuah3dXpVyhUqL/R6f649BSXxOaBHRZoER8XF9pgVnbM9pH/6VWuSU6BKldvbCvyxkAXeDcE89zqqFC17uXhPm0HWQEVFYkrWz9b5LTy+nC3zCc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763983091;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=B5pZTIPB34MPNxItHYPtcxN2fd08qqlXYWPPhWMfeVs=;
	b=L9FpK+mcQr5IgwMMhFimQ7P6PZw2Lq6afDzDVelv9iDyGKg2MPwDVbX4HwgVofTv
	wzawbYej36Hr2sezQ/2QpgB/zbhMu4dVVGr6gRCpS/mV3spcbZZixod1XidXWlIBQNv
	PbVQWiJ9Ib37HVKbNnF+smFiDR+H5i9j8+cVoFA4=
Received: by mx.zohomail.com with SMTPS id 1763983088950321.2798986092489;
	Mon, 24 Nov 2025 03:18:08 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 24 Nov 2025 19:16:32 +0800
Subject: [PATCH] platform: generic: spacemit: add missing objects.mk
MIME-Version: 1.0
Message-Id: <20251124-k1-fix-v1-1-8d7e7a29379e@pigmoral.tech>
X-B4-Tracking: v=1; b=H4sIAI8+JGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMT3WxD3bTMCl0TY+PENAPDRPPEREsloOKColSgMNig6NjaWgBfoyj
 kWAAAAA==
X-Change-ID: 20251124-k1-fix-433af01a7aa9
To: opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763983083; l=958;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=r6BL0xgt54BK0eoUWR+sm6xOOGNZIGMwhxMQDFE4gj4=;
 b=mL14kHlizeayq6VLNL4xd2zE48rbTOyL/4eNWGOZaYGolG53uiSaubLtTwERrhaAxxp1WaSJk
 JUMdy+72ob9AMxKDStlnxjUbwGS4a/Ohm1OVtMewGwwojMUZSWPdY7j
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_031822_682575_63567B15 
X-CRM114-Status: UNSURE (   7.61  )
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

Add the missing objects.mk for the SpacemiT platform, required for the
K1 platform to be included in the build.

Fixes: 1f84ec2a ("platform: generic: spacemit: add K1")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 platform/generic/spacemit/objects.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/platform/generic/spacemit/objects.mk b/platform/generic/spacemit/objects.mk
new file mode 100644
index 0000000000000000000000000000000000000000..dcb37867aa661dfc559088f926cd1465bc0f7e8d
--- /dev/null
+++ b/platform/generic/spacemit/objects.mk
@@ -0,0 +1,6 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit_k1
+platform-objs-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit/k1.o

---
base-commit: fade4399d2a47a3ff9c5ecd5dd4c3cba7a4eace7
change-id: 20251124-k1-fix-433af01a7aa9

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
