Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA75CCF9F8
	for <opensbi@archiver.kernel.org>; Wed,  5 Nov 2025 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kyXj3+8xeSuRjMCqG+mC649zLdEcTUio0N1ZY4gEzOY=; b=kI9BYrvr2OstBs
	I/Ci+iz/qCv2bTQBXpKqpvzsYVFb5t4w4BBgeXQ331T9AlhJzhkbOIdxO2Ds1/gyPsRJdFqm1KQQT
	21kfHWoHVbCUmAWTKAO1kA2mZv/G9t+Vv2xLkm29Fpfcnvc67xMQix9Aygpk633tGM3RrYqjYLtuo
	qPZCYoa757UImUoFVvtChLcL3AZ2y2gwYycjmhafcEwRKNqjRVMlPALsfATsQ3ZfeMmTD+Ai/Xiv1
	TAf/LR3LiFXEc+R1jDvy896TowQ2T6wxanHHFxHP5jbHEe67Dd0VqHX8JeP2LLFKxZpDAOJXlq/jT
	SIuZWGEp/IiE8gv9T2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbGg-0000000DWQ3-1SKO;
	Wed, 05 Nov 2025 11:01:34 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbGd-0000000DWPS-27XK
	for opensbi@lists.infradead.org;
	Wed, 05 Nov 2025 11:01:33 +0000
Received: from LT03 (unknown [93.94.208.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 51D6940844;
	Wed,  5 Nov 2025 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762340488;
	bh=CnbOxgFBq2cqElFrjFyU8bAkIW5Om2sCm3NolEXRzhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=pqqfcML7DJb1c/emTfmkx+zlz1gWfWdsnvPp9V+OfNKZVTONr8OhmF4BduH7N/9Xg
	 76Fj3aaU24zXhxkEk+Ux9BmEIU6b8Qe744uBR9A2xtc3qtHEmtwrvSMpBwZljgENdC
	 D5PGJ+yrJKOjUuySEMlozBdfG0FM0me8r+B3TMpcNTHPx7nChj7W23qtKXeuQbpSM7
	 kqDpEtStjXv2G3FwXdU0Bn0LbYQydkS4Msrx+uIYgZABzmY+h7/2YOEho2ibTlUayK
	 sMIGqlWY8miGv8k5XbLXIGD3B/h9397Huwxmdo6DL+Kbr41x0qe9LJh60OIRCd56V/
	 Twnqwg9h6ViIeL6w2fmEIqbWNvmsDMHfUwusRlNTgv8aKsWhjkkye29TY/R6M3ZXO2
	 iRB5/aC+qFvHjvLu3wwRmuJnqWM8C/9wK1caNFwp7NEyOhgiKRJoMFtPIFKbZPVKdO
	 EU6l6rGrTlKKZK+a9qkYSkQ3VUHHTzkJ/uZnp3HWpRR5cWAwb1Jz5aat5UKOuKTA6c
	 EqKVZdF4uvX0M55VVhBZJuJHG0x8I6NV6VNxF0kGhCQt6+Qfev0ektnWsG1uHRhoEC
	 Rh8VsjiHviFLBik5zUXmsjSlY8VGs3h0Tg7WIyZhOSiiRKlPGPHQp0s7MSoclsd84V
	 7BXjl5cKIM7OTAGAFrXEGXhg=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] lib: utils/irqchip: plic: context_id is signed
Date: Wed,  5 Nov 2025 12:01:21 +0100
Message-ID: <20251105110121.47130-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_030131_928732_6356605F 
X-CRM114-Status: UNSURE (   9.80  )
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

Array context_id in struct plic_data has elements of type s16.
A negative valid indicates an invalid entry.
Copying the array element to a u32 scalar hides the sign.

Use s16 as target type when copying an array element to a scalar.

Addresses-Coverity-ID: 1667176 Unsigned compared against 0
Addresses-Coverity-ID: 1667178 Logically dead code
Addresses-Coverity-ID: 1667179 Unsigned compared against 0
Addresses-Coverity-ID: 1667182 Logically dead code
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/irqchip/plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 581a41bb..7989a962 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -136,7 +136,7 @@ void plic_suspend(void)
 		return;
 
 	sbi_for_each_hartindex(h) {
-		u32 context_id = plic->context_map[h][PLIC_S_CONTEXT];
+		s16 context_id = plic->context_map[h][PLIC_S_CONTEXT];
 
 		if (context_id < 0)
 			continue;
@@ -167,7 +167,7 @@ void plic_resume(void)
 		return;
 
 	sbi_for_each_hartindex(h) {
-		u32 context_id = plic->context_map[h][PLIC_S_CONTEXT];
+		s16 context_id = plic->context_map[h][PLIC_S_CONTEXT];
 
 		if (context_id < 0)
 			continue;
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
