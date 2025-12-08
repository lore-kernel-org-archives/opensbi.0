Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638EED3B7E2
	for <opensbi@archiver.kernel.org>; Mon,  8 Dec 2025 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gninjM3bM4tJ1JfZLVqN2VYQLtU3nF93bu+hq0uyW0k=; b=mZNjOkyH8sVmF+
	2s0uz4s0c41DTsX+t9+Af4xqcSD1Jq/V4u8eo2CbP9JgkVk3rAfQMltfrxQFCQObjq2lAbGvu8oRk
	X/E5tcv8rI5qt4FPo6uxqlDQ/ba7TPvZqzCPSk/YJ1Lj1iAKrbxs5vX664o3Ws/fRODQRJm0l2fSm
	mP+4WlHin2nuxMwc61CyAs1WCVICztHRHOvwL3GQChEmfxixo1ljuCAZ2zmW7FeNkBg6eiGfU7DnQ
	jKJslfO1XchcQI/Kb3HlMLvnMhcZNg1QbFgB9uVHV9371HnLHe+p78IFSZ9AGmGifEySDY6HczjZe
	AlXbyVRnIcJGp9eytaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSamx-0000000D687-0yZf;
	Mon, 08 Dec 2025 12:56:27 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSamu-0000000D67O-0UqU
	for opensbi@lists.infradead.org;
	Mon, 08 Dec 2025 12:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1765198583; x=1796734583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i2KIPOlBpRbI4o74NMFmEngfLDJ8iQztyu7yIniJPeA=;
  b=CyD3kJWEfC8A+ykQSuV63qxVzpl1Ksb6Ndz58oQr+GZPlempK8zOSUBm
   byPws1GHDW2EgnA7srgnOeI6ZgoCfx3vDmr2vHKe7zzgGL3TGbB75ooHS
   ttzhIBwHhK+Xc0GCQJrZYeC1cIsR1WcquvvCjPlMVl04oGoNaT9SvIau9
   sJItiUzU0Lrd4xauLjHpheKSsyneTJGScXOhgH0J0QvSWy4bs8onUeu3U
   cqwmRr4+KKrYMPUc00FEmHMvfzVPNG6lWLDdDI1HUaRI2piHcUURJFNZa
   B4VHGcBrg2hW0sk3NgpgTycAynF31Y1XZBI2b+AzBlGJXO7SrIEbjQP/D
   Q==;
X-CSE-ConnectionGUID: 2KP+W0SbS0iDzMrCcVu1kg==
X-CSE-MsgGUID: ZhaOD1B+TEmFG4oI/XlsVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 14:56:20 +0200
X-CSE-ConnectionGUID: X0z7twG0Qta/55GqhQqb3g==
X-CSE-MsgGUID: ltYW8yzRQgKUfiQzSUHFgg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 08 Dec 2025 14:57:19 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 08 Dec 2025 14:56:19 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com
Cc: anup@brainfault.org,
	inochiama@outlook.com,
	opensbi@lists.infradead.org
Subject: [PATCH v2] lib/sbi: optimize domain memory regions copying
Date: Mon,  8 Dec 2025 14:56:17 +0200
Message-ID: <20251208125617.2557594-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251208094504.1254011-1-vladimir.kondratiev@mobileye.com>
References: <20251208094504.1254011-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_045624_607686_BFB477B7 
X-CRM114-Status: GOOD (  11.22  )
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

There are 2 locations where memory regions moved in a bulk,
but this implemented in a region-by region move or even swap.

Use more effective way. Note, last entry, dom->regions[count], always
exists and is empty, copying it replaces clear_region()

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/sbi/sbi_domain.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 99f453f9e5ac..c5cf656e92b7 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -362,11 +362,6 @@ static void swap_region(struct sbi_domain_memregion* reg1,
 	sbi_memcpy(reg2, &treg, sizeof(treg));
 }
 
-static void clear_region(struct sbi_domain_memregion* reg)
-{
-	sbi_memset(reg, 0x0, sizeof(*reg));
-}
-
 static int sbi_domain_used_memregions(const struct sbi_domain *dom)
 {
 	int count = 0;
@@ -454,10 +449,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 
 		/* find a region is superset of reg, remove reg */
 		if (is_covered) {
-			for (j = i; j < (count - 1); j++)
-				swap_region(&dom->regions[j],
-					    &dom->regions[j + 1]);
-			clear_region(&dom->regions[count - 1]);
+			sbi_memmove(reg, reg + 1, sizeof(*reg) * (count - i));
 			count--;
 		} else
 			i++;
@@ -699,7 +691,7 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 {
 	int rc;
 	bool reg_merged;
-	struct sbi_domain_memregion *nreg, *nreg1, *nreg2;
+	struct sbi_domain_memregion *nreg, *nreg1;
 	int root_memregs_count = sbi_domain_used_memregions(&root);
 
 	/* Sanity checks */
@@ -741,12 +733,10 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 			    (nreg->base + BIT(nreg->order)) == nreg1->base &&
 			    nreg->order == nreg1->order &&
 			    nreg->flags == nreg1->flags) {
+				int i1 = nreg1 - root.regions;
 				nreg->order++;
-				while (nreg1->order) {
-					nreg2 = nreg1 + 1;
-					sbi_memcpy(nreg1, nreg2, sizeof(*nreg1));
-					nreg1++;
-				}
+				sbi_memmove(nreg1, nreg1 + 1,
+					    sizeof(*nreg1) * (root_memregs_count - i1));
 				reg_merged = true;
 				root_memregs_count--;
 			}

base-commit: de376252f4f3e3df4998bd14893cb687821b4102
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
