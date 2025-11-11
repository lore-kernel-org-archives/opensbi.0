Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4868CD1297
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7EAjmpiJqenbHxvczE1J7z+QX5etBLr2UTMHiPGNK0=; b=BRhb2t6/Or9lBc
	mF155LcUnMaPsC1mmCHmMPsGNWX7iYac0ySSvqSidaZ12mtRcIC8fSZJhlbQhv6av+gfRgOn15x4h
	b+puaApI+p9aPKU+y0O84dm2xeCjOaOhj4Z8mJrTPkD2jTlF0EuDCFWCBXfFbW+xTOdQbLs4382EP
	o5anNXi/B/VYiiFkHOkzuhBCbfVimckuU6AkphABtOCLKj1TiGmlQ3Zczpi4hxB7Ygf19vrlvd5QU
	hwLqkBplQZbM6nGuCqhYEGhhXjUeykVm38OETAFA4w7K8AylMhAergb07xVexsISuqyI8scNOpWLy
	HSV9oxkSK6JLH97N3qiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqf-00000006ymq-2VnM;
	Tue, 11 Nov 2025 10:43:41 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqd-00000006ykN-1fA5
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 10:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1762857819; x=1794393819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xSjW1sS0L2PeB1iTdmNO6+4R1mQN2P0ErZ5HJyN2ifE=;
  b=iTZtVWpZoX1+SSIy5zgdZPC6/xZsIvmqeIBZcuu1KkpQzrka2SIY8yad
   q3v1WN/PfaTlxyki3YyTfoMef1ubM+bZTVFKESdqDDz2GmRbsJ0vmuKsf
   J6V7aI1Uv/ABhtWLvHp+AMQcDiAhSeosNpuB+Gp4vnGzqHBRH1ZLbUHIB
   ul1QepgQDvgjiP4iqihMAw43/RYwZSYkgcrdEC2LoJL7kneGuRL8QsIOc
   cE8qX8TaC4RO+Dmlfnp6vKaSWNgf8VElfN6QJOTa+3fbqerqgiAZYpoEA
   XksKfee1xZ58QmK4fFAz3fbNFL62MplqTNFBpNn7XXFQKFL6FZOkbgAeE
   w==;
X-CSE-ConnectionGUID: JMEkLOD6Qt+s4ddn3WeIxA==
X-CSE-MsgGUID: +Q4W0WJOQCC9FkrmqYfgyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 12:43:36 +0200
X-CSE-ConnectionGUID: ByqYVHmITReLautsijEV+w==
X-CSE-MsgGUID: lDjwRHjtS7O3yWhoRDqYGQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 11 Nov 2025 12:44:00 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 11 Nov 2025 12:43:33 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org,
	inochiama@outlook.com
Cc: vladimir.kondratiev@mobileye.com,
	opensbi@lists.infradead.org
Subject: [PATCH v2 2/2] lib/sbi: get rid of static variable to hold root memregions count
Date: Tue, 11 Nov 2025 12:43:27 +0200
Message-ID: <20251111104327.1170919-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251111104327.1170919-1-vladimir.kondratiev@mobileye.com>
References: <20251111092224.825282-1-vladimir.kondratiev@mobileye.com>
 <20251111104327.1170919-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_024339_701615_404E96B5 
X-CRM114-Status: GOOD (  15.15  )
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

Calculate number of used memory regions if needed.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/sbi/sbi_domain.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 039da39ecd6c..9fabfc105710 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -25,7 +25,6 @@ static u32 domain_count = 0;
 static bool domain_finalized = false;
 
 #define ROOT_REGION_MAX	32
-static u32 root_memregs_count = 0;
 
 struct sbi_domain root = {
 	.name = "root",
@@ -281,6 +280,17 @@ static void clear_region(struct sbi_domain_memregion* reg)
 	sbi_memset(reg, 0x0, sizeof(*reg));
 }
 
+static int sbi_domain_used_memregions(const struct sbi_domain *dom)
+{
+	int count = 0;
+	struct sbi_domain_memregion *reg;
+
+	sbi_domain_for_each_memregion(dom, reg)
+		count++;
+
+	return count;
+}
+
 static int sanitize_domain(struct sbi_domain *dom)
 {
 	u32 i, j, count;
@@ -319,9 +329,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 	}
 
 	/* Count memory regions */
-	count = 0;
-	sbi_domain_for_each_memregion(dom, reg)
-		count++;
+	count = sbi_domain_used_memregions(dom);
 
 	/* Check presence of firmware regions */
 	if (!dom->fw_region_inited) {
@@ -364,7 +372,6 @@ static int sanitize_domain(struct sbi_domain *dom)
 					    &dom->regions[j + 1]);
 			clear_region(&dom->regions[count - 1]);
 			count--;
-			root_memregs_count--;
 		} else
 			i++;
 	}
@@ -604,10 +611,12 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 	int rc;
 	bool reg_merged;
 	struct sbi_domain_memregion *nreg, *nreg1, *nreg2;
+	struct sbi_domain *dom = &root;
+	int count = sbi_domain_used_memregions(dom);
 
 	/* Sanity checks */
 	if (!reg || domain_finalized || !root.regions ||
-	    (ROOT_REGION_MAX <= root_memregs_count))
+	    (ROOT_REGION_MAX <= count))
 		return SBI_EINVAL;
 
 	/* Check whether compatible region exists for the new one */
@@ -617,10 +626,10 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 	}
 
 	/* Append the memregion to root memregions */
-	nreg = &root.regions[root_memregs_count];
+	nreg = &root.regions[count];
 	sbi_memcpy(nreg, reg, sizeof(*reg));
-	root_memregs_count++;
-	root.regions[root_memregs_count].order = 0;
+	count++;
+	root.regions[count].order = 0;
 
 	/* Sort and optimize root regions */
 	do {
@@ -651,7 +660,7 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 					nreg1++;
 				}
 				reg_merged = true;
-				root_memregs_count--;
+				count--;
 			}
 		}
 	} while (reg_merged);
@@ -777,6 +786,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	int rc;
 	struct sbi_hartmask *root_hmask;
 	struct sbi_domain_memregion *root_memregs;
+	int count = 0;
 
 	SBI_INIT_LIST_HEAD(&domain_list);
 
@@ -822,13 +832,13 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
 				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE),
-				  &root_memregs[root_memregs_count++]);
+				  &root_memregs[count++]);
 
 	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
 				  (scratch->fw_size - scratch->fw_rw_offset),
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
 				   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-				  &root_memregs[root_memregs_count++]);
+				  &root_memregs[count++]);
 
 	root.fw_region_inited = true;
 
@@ -843,10 +853,10 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 				  (SBI_DOMAIN_MEMREGION_SU_READABLE |
 				   SBI_DOMAIN_MEMREGION_SU_WRITABLE |
 				   SBI_DOMAIN_MEMREGION_SU_EXECUTABLE),
-				  &root_memregs[root_memregs_count++]);
+				  &root_memregs[count++]);
 
 	/* Root domain memory region end */
-	root_memregs[root_memregs_count].order = 0;
+	root_memregs[count].order = 0;
 
 	/* Root domain boot HART id is same as coldboot HART id */
 	root.boot_hartid = cold_hartid;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
