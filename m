Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D9FCCFA18
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kh7qzhjjgIhQ+5DiG6bjtuntFNPvrBDUotAkKw7HCrg=; b=JXXlVw/8O03nfE
	Tdl/T2nXdfammnoDDCf/br1Z0yoBuTV+z+YMOqBgKvA9TceK1yP0aZGAIgtk069s7XCs/M37ucIqr
	0d2g4zdm/+Fy8xjsHizyC+Q37ypbbV13Y5CNuEBLgYj9KIH1DlhMZm87r9BIcxfMpaBoeX3P0CeU4
	jPs712N5YjAOHCBgLvzqJGmopcuKm3/TYYJtzvW5ntCJ95aRNqrPIEqUbWQXU9uBnp+zom/4N+D4C
	ffZTS3a6KIq24fGUjzR76lWkVNthsrj2/HR9fRXSrdLrl0cXu9R05Eoiyo3eWehBKiTejJxg1Tehd
	ZvvrT2pQ6yLsP2h6Rbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkaE-00000006pnh-0yVo;
	Tue, 11 Nov 2025 09:22:38 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIka9-00000006pn1-0rGm
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 09:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1762852953; x=1794388953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e5znNxeVTfdDPrQ7Y2hNs2KsYdHFkfZTQw/Wqex27ws=;
  b=CqNRIzj2S80IxEGrESc2+TDSE4kvt74tPvxTyjDs6zon30F0zb1e3mn7
   TfOUWCmB2cRGmeefEMPpTA+eaLMNqBVj5Ng8hRPK2flXwoxSbuikOIEy9
   5eL6xne1z3jdlbk38s1WHQ6ecBFZcpiAam0ItDG4DCKi09B66WCu76Nyb
   TajR1gyHBt3cLcvVGWQawkViJzQKjZwnJmHOm4Ta8Nv78p7V+pdMZYhWC
   iELMIWqtNAP8VerqCL/NySPGcu7hBAepbSwNKJrqXS1UpITwVElAQH+Vx
   eZcjr47ZbuTVxu419MC/KaXseyDq6REtSI3FeQ2tCEUjyiO/OXLcwyspL
   g==;
X-CSE-ConnectionGUID: 8/mMVghuQ8i04GL/ZmcHeQ==
X-CSE-MsgGUID: iZkGy8XRSoy9kJ2ljul5sQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:22:28 +0200
X-CSE-ConnectionGUID: AbWjF6ywTHyxt4pAaMlsqQ==
X-CSE-MsgGUID: nSslvonST3G9kKeq4YoVrA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 11 Nov 2025 11:22:53 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 11 Nov 2025 11:22:27 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	opensbi@lists.infradead.org
Subject: [PATCH] lib/sbi: fix covered regions handling in sanitize_domain()
Date: Tue, 11 Nov 2025 11:22:22 +0200
Message-ID: <20251111092224.825282-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_012233_707888_E2E4DCB8 
X-CRM114-Status: GOOD (  13.55  )
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

Fixing: commit 3b03cdd60ce5 ("lib: sbi: Add regions merging when sanitizing domain region")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/sbi/sbi_domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 8cf5fcfe4926..955bf59f877e 100644
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
