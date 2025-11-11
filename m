Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3C9CCFA1A
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+MEj+sT98Sk9BQxPB89I65ryOpUicr9NZFOHYr2atE=; b=PM8CFO0fMBb0pr
	L2/cMnhuJoqVekXOz442r6rCuHg9O/5ESqXzXSqt2anENRTMgxgR1mhwzobYyA7ZnV6yR6YdBS4TA
	iMi3nVfLQkpGDjqQbiuqzWvSrFr5gCMIJvQzWOlk4QkEdFSay31tLCWQU50y69gyDxT/fokZbypDp
	u/Ir6sLoRC2GOGkasVrK480YyE+h3blyjPh4+0zfevDIIBMiHOqmdb64WsZSLQX/VoAKmfeVCP+pK
	JnZVUSFnAXicEC/e1WPK4RbUtdX/QU2iHtK44HSiIEx4OB2ZjutAWyZYQ9dJcIBh0lHKxL3vVY3Hr
	W9uBhLugOY5SOLsTAp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqf-00000006yme-1BuW;
	Tue, 11 Nov 2025 10:43:41 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqc-00000006ykt-2OHj
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 10:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1762857818; x=1794393818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KhPAxconexlvr8djlgM3x0yDhB1eEIJK39SO+EF1Dug=;
  b=fNA3zrBtPpjQVmonY1sfq82ghbacEZyarMhe73yE8ERyeBOvWUXUym7E
   +ZfTR3c8gQw03wBzYE/UEqpHBGzRRjYSC/ksENOzklXbYsNvO52z+GuTJ
   hUd1SV/YFoz1U5Ep8sJYrp+7svenVbhL1xqBi+ZcvIheWnTSAIBZ65Wag
   QtqI8XWLJ4auV9LlLoeJADHfg8iPFlsbnLBuTRQEld5aJTGouw8bv+cd1
   xNteHaTqo+8nSbIaN894CcVB3pGqk/2B9WYTrlE6bFo2Q1gMxmpQ6edEn
   3qEPBnDQ311uhHpvLsAryYy/B2QZObCjn6VbQ9nVMV3HsoVv3rTN3Fk+x
   Q==;
X-CSE-ConnectionGUID: IV7VEXvZTbqtuXPHu8hCjg==
X-CSE-MsgGUID: sx0X5HUCSsKX39eazx3kXw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 12:43:34 +0200
X-CSE-ConnectionGUID: SiXUDfYgQkSkvBhwF7Zlqw==
X-CSE-MsgGUID: NWBTCgoOSPqYScMBQ0mruQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 11 Nov 2025 12:43:59 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 11 Nov 2025 12:43:32 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org,
	inochiama@outlook.com
Cc: vladimir.kondratiev@mobileye.com,
	opensbi@lists.infradead.org
Subject: [PATCH v2 1/2] lib/sbi: fix covered regions handling in sanitize_domain()
Date: Tue, 11 Nov 2025 12:43:26 +0200
Message-ID: <20251111104327.1170919-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251111104327.1170919-1-vladimir.kondratiev@mobileye.com>
References: <20251111092224.825282-1-vladimir.kondratiev@mobileye.com>
 <20251111104327.1170919-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_024338_880175_C255573A 
X-CRM114-Status: GOOD (  14.35  )
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

In the sanitize_domain, code that checks for the case when one
memory region covered by the other, was never executed. Quote:

	/* Sort the memory regions */
	for (i = 0; i < (count - 1); i++) {
<skip>
	}

       /* Remove covered regions */
       while(i < (count - 1)) {

Here "while" loop never executed because condition "i < (count - 1)"
is always false after the "for" loop just above.

In addition, when clearing region, "root_memregs_count"
should be adjusted as well, otherwise code that adds memory region
in the "root_add_memregion" will use wrong position:

	/* Append the memregion to root memregions */
	nreg = &root.regions[root_memregs_count];

empty entry will be created in the middle of regions array, new
regions will be added after this empty entry while sanitizing code
will stop when reaching empty entry.

Fixes: 3b03cdd60ce5 ("lib: sbi: Add regions merging when sanitizing domain region")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/sbi/sbi_domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 8cf5fcfe4926..039da39ecd6c 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -344,7 +344,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 	}
 
 	/* Remove covered regions */
-	while(i < (count - 1)) {
+	for (i = 0; i < (count - 1);) {
 		is_covered = false;
 		reg = &dom->regions[i];
 
@@ -364,6 +364,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 					    &dom->regions[j + 1]);
 			clear_region(&dom->regions[count - 1]);
 			count--;
+			root_memregs_count--;
 		} else
 			i++;
 	}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
