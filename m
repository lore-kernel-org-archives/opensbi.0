Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10906FD0066
	for <opensbi@archiver.kernel.org>; Sun,  1 Mar 2026 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=goDdqo4AcPIwgjuURM5LbGbOl0EeKlF8xjGkKE+D9zQ=; b=25ebU740JlAriK
	QDYhzOhGF1r+Pkg3bhsSGTRBSxWJIvY46T+/wMbmk/66BQjRJv0Pdx4lCYKd1Iv63zdvunpRUNYjW
	cssoE8tiDbG0/aQ2XI5o/s+7OY/dj/KGv6TMjz1UehHiM7aUYkfgp1HhtbCTlo206cLAbKm7JKpqw
	qFKyG8cbdu6wDAQIMpdb91RD4bs4Q74BaRmPuQVa5GUPnNAcZAEm5Oscjzckbx7TuYo0nyDmhGJ1J
	acyTM1Y15uGexQR5QfPc4JGx1fUPEment2rBF5WLB7Cp0VmMGveR9XRA2kNPXlee+uJzeOubMYeY/
	X/samVhvVpR8CjSzMdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhYM-0000000BZFQ-28tX;
	Sun, 01 Mar 2026 14:13:50 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhYJ-0000000BZEq-32r9
	for opensbi@lists.infradead.org;
	Sun, 01 Mar 2026 14:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1772374427; x=1803910427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DhD4uEoPoI8dqr5IyyHfHDFTy4ORANv7twfv85omGLw=;
  b=IpkUpx9IPiMP5wBJHsKytapg+ITzPGQoon+cOPsrdS8T/GYHGGGXnMo7
   ei7nVIG+xaXo7Avx4jOWygnSIQ3U2RpG5kjHjpUChqFaSsPAb6+4UK0Vg
   VPMNfrp/mhxfobjdQHUSDzMMpKIgIA7dnSZc5FPtUJN2s0rww4wvg0S4m
   y37gaatR/tJxArpdOGNGODDzoKX+cg0IazZoDQ47vKUvMcbjuW/fwD2si
   qwWzcpW6iKZwraKkn8Vl0hQ2E1hi6kisvJDDUnKxsxWL3wSTSFl3a44Tp
   lKUrMRSCF/wnhFpxu9IW4p56F+VUNnlFo6qbYvb3h0ZXCWtL3G5owAIVM
   A==;
X-CSE-ConnectionGUID: Ayw/3PF/QFaYxRa758q00g==
X-CSE-MsgGUID: O4LAvSZzTni2z2jlcy8Bag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 16:13:42 +0200
X-CSE-ConnectionGUID: sUdd+Z++R66l4Lfa2ck0dQ==
X-CSE-MsgGUID: qWboiuC8TA2LOvWZdS7p7w==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 01 Mar 2026 16:16:31 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 01 Mar 2026 16:13:41 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	conor@kernel.org,
	chao-ying.fu@globalfoundries.com
Cc: opensbi@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH] platform: generic: mips boston: update "compatible"
Date: Sun,  1 Mar 2026 16:13:32 +0200
Message-ID: <20260301141332.2941601-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_061348_258693_B1EF1779 
X-CRM114-Status: GOOD (  10.96  )
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

Use a platform-specific compatible to avoid clashing
with CPU compatible

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/mips/boston.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/mips/boston.c b/platform/generic/mips/boston.c
index ece60a7e5e52..87cb328dc4e3 100644
--- a/platform/generic/mips/boston.c
+++ b/platform/generic/mips/boston.c
@@ -140,7 +140,7 @@ static struct p8700_cm_info boston_cm_info = {
 };
 
 static const struct fdt_match boston_match[] = {
-	{ .compatible = "mips,p8700", .data = &boston_cm_info },
+	{ .compatible = "mips,p8700-boston", .data = &boston_cm_info },
 	{ },
 };
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
