Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E337EA4FCB
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvVTn3V+FFX2VnIZ/uadTeatMM042dL+lqG8WougqZo=; b=stbcpenVwvwN9b
	Hg9xUoEMT/2JxER+Bsjpc4Uv2UVCS3eAqG8TXmUa1sC3fLuZyBLlX7oqQPSohPQz0jRQITRE5fH1b
	q9nGlZSyurvFzCAXbXsl6lpwW0L2pR8O+CPezbFqpG+G838VL+ne7p8BVNjAJ3C6oz+g8tI3ucG5v
	f9qX3afSREtEpM8qYPpfZNcD85aj9QiF+ADwE1VLjrFyRcE0cnWjaInkIG+76tM0vJACFXS6D3vJh
	HtzrnOqUYCSDFjZBkLvyVr5iSFmxG/f5uxNC8miUji3uAzdFSkmGsg7ybP7GRe/FFqBoFVCnd2MqP
	yqxoAU9vaJ1t5Rp33XuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLO-00000000VXk-2rMO;
	Mon, 23 Feb 2026 14:55:30 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLL-00000000VVR-2psd
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858525; x=1803394525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UACG73j7mxKnE9LwIRguej042PZAC1d3JwrOfOJbDmo=;
  b=EOjwlaW5Lrf4t+AWxeL5PslbJZ7Q/cgzq2G5AIRbu6+YC1LUzU5/5YKQ
   yZh7ZWMYDjdaqF/04zpsQ9el1BnG1N0M7kVG/hbvvzBh9/2LF0C5Z/m9k
   rnuW2hsW0c3P3kjnXRVZwIlQJ7h/PZGvD73W3bLHkgNh+Vj23beLquztQ
   QDp1/QHCYg5Wo6kXc2S23q7cDV9UiCtAaFs0og/vnXzujE7vSuvrt4o2w
   4JHF50e3ZcAQCJr2wtJj5B1OHVenNwjTC9clDq0TO5baLSkG0x0sad3ov
   0e9SChxPayvKCfBhxjAwzPRuqEjHEkeG+teWihW+/hN+lGeBSen6CjU4i
   w==;
X-CSE-ConnectionGUID: qI7r+ZoDSMW1Btie+JMykQ==
X-CSE-MsgGUID: F4YnXo6WSHi5buQ2zH0c5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:22 +0200
X-CSE-ConnectionGUID: RFuuH05lSVOqc0gk6LlrHg==
X-CSE-MsgGUID: 0ZoIw+iqQLKOk373wvwyCw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 23 Feb 2026 16:57:56 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:22 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 01/23] lib: sbi: print hartid in hex
Date: Mon, 23 Feb 2026 16:54:40 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-1-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065528_058798_334F20B5 
X-CRM114-Status: GOOD (  11.21  )
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

Hartid is better represented by hex number since it is likely
a combination of bits representing various elements in the
platform hierarchy

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/sbi/sbi_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 4f458ac0f56169d47598a8d0b93140bf0d2f8974..7030848dca1af58ed120de13a8c0deaa378af8dc 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -541,7 +541,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 	sbi_printf("Domain%d HARTs       %s: ", dom->index, suffix);
 	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
 		j = sbi_hartindex_to_hartid(i);
-		sbi_printf("%s%d%s", (k++) ? "," : "",
+		sbi_printf("%s0x%x%s", (k++) ? "," : "",
 			   j, sbi_domain_is_assigned_hart(dom, i) ? "*" : "");
 	}
 	sbi_printf("\n");

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
