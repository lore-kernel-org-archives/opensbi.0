Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D204D31A2F
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIhkvJ2Pv8dRViBVCjVG4ZJGk+uS5zJiqh/PV1kpnBo=; b=Uf9RDVhy7HTQjt
	/myfASrGTK6s7op37hur6YPMTkOXVnJhlLPGjT9ejCZjMCHCTl9vpivL9UbrW33FQuh5oWMWNznmH
	ZPE/TzFDuNwxsN/NWZ6ibxgMAUmLXthD+9M3zhekX/kvFNDoTxiusOlML8xJCYSsvUTKsfiQbIr2+
	d3VpxA9WJM3xMKIyHWNjFK7SNvroJXncifsEWzvjMdEf47Gw1olgkh+ieS0E6iFGfHxukwKiD6y9Y
	5c2sKKDD8AQ6jP7auCWXYE0PVXJkDMQiNyBQjMp68G2ycHKyniAiHNM7sInO0yIBxt77tQYf91yhu
	4QB7qTIqBzpQn57GmO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4K-00000008Vkm-1pSC;
	Wed, 14 Jan 2026 09:21:36 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx4A-00000008Vdm-2dxh
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382486; x=1799918486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hWtx42Pa8csXMGRgE3pHJNeScfVUQb/BwObtBDAc/nc=;
  b=e4kTr7S8+IrkrYfri3yno4dQb23Eahf03imqxL4e6tGWHAFjQC9rGACr
   KFTQJcj9fzwlejg4skSQm489RKJpKFdE74eazJ7g+uaAyYj7ljACDqlBR
   FahvZo4EycMu4GR3XiM7RN7Tjob7OtYnQD8OFeiUrBwoVywaMlO542ZZm
   zxE4M2974MtyvbunTUAkpDjuWz+5651Z9sK4fu2uohCfZdbF2UobVpJXz
   cUw/V7+vJMyZwRgqiOGMMqTxJSkxJIqQ7HAz2OMHvTCWWfZFhVhWCsfPD
   NaKgqhTjb7sWfXrSBiPzP2U7eZeVWciE3zcjKVDgKH7ORgf9OuzVy2c3s
   Q==;
X-CSE-ConnectionGUID: z46RAvKCTcWX/fTP+QsvEg==
X-CSE-MsgGUID: cPx3pWhxQ3CqF6AkcU6zhg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:22 +0200
X-CSE-ConnectionGUID: EA4pv/CvTCGuPzKW40/grw==
X-CSE-MsgGUID: eDaajQUiQ6eqOATn1ns/Ew==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:04 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:21 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 01/22] lib: sbi: print hartid in hex
Date: Wed, 14 Jan 2026 11:20:57 +0200
Message-ID: <20260114092118.1315581-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012127_474785_CC08D20F 
X-CRM114-Status: GOOD (  11.14  )
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
index 4f458ac0f561..7030848dca1a 100644
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
