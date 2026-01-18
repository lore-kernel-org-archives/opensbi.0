Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215AFCA5FED
	for <opensbi@archiver.kernel.org>; Sun, 18 Jan 2026 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvVTn3V+FFX2VnIZ/uadTeatMM042dL+lqG8WougqZo=; b=RkA3NvMPO0labU
	gyrLNNUxxrvdu8EzbzCPTFkjV9zpXqmLwyzhUwb3qyLhfllKCjStg1bxqaK1RECihm+93z3EylkHc
	mlFAc6SFcFJhzbnPS5Cs+351CHgWVhPxMYLuI1iX1fIqxEjWxfBMc8rcj6B+c7Tf5g5NtIkJggKdQ
	F/eCdXxpQsyL4THrAB4lfDUjmm5us0IWaFnfQ6/mkA/t4qsOD8RTbuokxJ2stskT2CSH8/0aG+VCa
	O/VulqF6lji9XqJM4C3VDMbgHK8GLkzuvc8rQKYvfq70cgW43b68HZTDA0RFh3YD77j28KrDKdFqa
	KTp/Td0m2NBZx1PZNFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6l-0000000HSqC-0MZn;
	Sun, 18 Jan 2026 11:38:15 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhR6i-0000000HSog-27ja
	for opensbi@lists.infradead.org;
	Sun, 18 Jan 2026 11:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768736292; x=1800272292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UACG73j7mxKnE9LwIRguej042PZAC1d3JwrOfOJbDmo=;
  b=WXXNzBowaOO0AVapkzdjPf0Xq16EDgwX2Loa9kpPOBXXzHknR1KdpQFN
   IpW3Hl22mQlVG5bYnApg3tRmr0yQO4LqK0aV+LdPEsPPZ76X2oUd4Oj4g
   xfa5A2AopOzB0Zx05FOzfJDoqGAvVOOeN0FqAahLNpX6RBXGn82loUG2m
   fceVamPgFc4reEst6h4Big07+J4w2Rw+Sh48K7NPjLXx3oFYQlghdvHJz
   J4XTD8B+EGs8ZETmv9Ak2JJhyUEP4HFxDReSfVn5MvT8W7vEuB7ac1XWE
   NNoUL5mYu548fI5pdd/0YSD6fsGE/5IH+9pwfpcgxgFKKDVILFelqpI7y
   w==;
X-CSE-ConnectionGUID: mJl/ZFTTRemUf5dsypgi7g==
X-CSE-MsgGUID: kQWj5OvuSkWbGWu/WV5VrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:38:07 +0200
X-CSE-ConnectionGUID: smT/PvLxRvSI/uf+KWy93A==
X-CSE-MsgGUID: jqxSLs2NQp6EBV0pONFS/w==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 18 Jan 2026 13:39:53 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 18 Jan 2026 13:38:05 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: vladimir.kondratiev@mobileye.com,
	anup@brainfault.org
Cc: benoit.monin@bootlin.com,
	cfu@mips.com,
	opensbi@lists.infradead.org,
	cc=cfu@mips.com
Subject: [PATCH v2 01/20] lib: sbi: print hartid in hex
Date: Sun, 18 Jan 2026 13:37:43 +0200
Message-ID: <20260118-for-upstream-eyeq7h-v2-1-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_033812_844054_80F94F83 
X-CRM114-Status: GOOD (  11.32  )
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
