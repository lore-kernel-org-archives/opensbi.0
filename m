Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54CDD3B7E2
	for <opensbi@archiver.kernel.org>; Mon,  8 Dec 2025 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2gKa1KXAbEEl+bXciAKLnhEFdiAWqrLOA8Qx/iU9EGE=; b=YymQ0j3/KfUz9o
	r8XRl8eYTbJpBu8hAYHXxPwL7OHkqf/D2L3LNNngVCQ8oIncDi/IlM1SWIgDHK8GslskEqrzr2xzC
	mNDdwkC9xn4xKdyfpZ0PduazhswWmAKDtnoVEuS9npx2Wo08TuWVq64q5PhGThRU/6a2KeWmjt9V3
	3HfOJD1hcGMRAPupWgFI/ynXiM5oTSTLlMrGm82iLLw4mLJiCkzr6iwpEJoftyNnOzHihLlN1dima
	uUXCzytXlYqWwdwHLYvojpbQH8EMTqFHSyiSqzdNTQdmvf/kN/dYP8/Ed2WOCDERrgxIqV28qeJSy
	dTc7qBHhGcT4U/SGgt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXns-0000000CuPz-2jtM;
	Mon, 08 Dec 2025 09:45:12 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXnq-0000000CuPV-0kPW
	for opensbi@lists.infradead.org;
	Mon, 08 Dec 2025 09:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1765187110; x=1796723110;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JJySkQBW4dCkJ3bkSP7r9vYHKaPPQ4nkgr6hUqEcmRA=;
  b=jeisybxkwnu6VlIzw4bUXXR8TInkZlXywQ4Q2Sv7WItf2GY0cqCODhcX
   IN5Yb+sSWJdXpwPm/y8Msczo3ztJZ3bYGV/CWn76dsFbiyWmtw7EDIKyE
   cisqfdABV/xJPjLE5gw5jgC4FpeH/6WesTiNIMFPJlzn2aAcuJ4ipEDa5
   g5L2QwRNdYjZr31WKkwr56/q6OhPvmdz/u8IFcjwqJC/yfJqedoD7cByD
   dCX7oOi8pa7jvjunM1Lw/KsTF7l4No3hpPhpJZCnutF20/rALj5QjEu6G
   qkbBg0+Lum+pc74QHD/0V40+yak1OF7Yhk2O9dCJFWquXlFuTHUKw9bpZ
   w==;
X-CSE-ConnectionGUID: ewkkJbrGRAG+HiFJdlyMwA==
X-CSE-MsgGUID: NRWsYZ+VTbuYNFoZVRM+LA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:45:07 +0200
X-CSE-ConnectionGUID: zpHO3cjDRkGnnZZTwZ/Img==
X-CSE-MsgGUID: lk+ZOKwWQHKZ4fuH8AXeDA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 08 Dec 2025 11:46:08 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 08 Dec 2025 11:45:06 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: opensbi@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH] lib/sbi: optimize domain memory regions copying
Date: Mon,  8 Dec 2025 11:45:04 +0200
Message-ID: <20251208094504.1254011-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_014510_522127_352FD642 
X-CRM114-Status: GOOD (  10.12  )
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
 lib/sbi/sbi_domain.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 99f453f9e5ac..f6753b06ebdc 100644
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
@@ -741,12 +733,9 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 			    (nreg->base + BIT(nreg->order)) == nreg1->base &&
 			    nreg->order == nreg1->order &&
 			    nreg->flags == nreg1->flags) {
+				int i1 = nreg1 - dom->regions;
 				nreg->order++;
-				while (nreg1->order) {
-					nreg2 = nreg1 + 1;
-					sbi_memcpy(nreg1, nreg2, sizeof(*nreg1));
-					nreg1++;
-				}
+				sbi_memmove(nreg1, nreg1 + 1, sizeof(*nreg1) * (count - i1));
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
