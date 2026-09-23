Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AFDC98309
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpT2WCQJpJayoceBW9GgPYojq4gtSYv48PuR3Vpg2QU=; b=YiZlaebe1+pkM+
	qgOiVphjZgtJ8i7hxXnJ/UXheiWpxuhvGKTbXjRyWKwtmRR4k6uf6xdw1MGY6TH54J8eUVSp9kgxc
	/3TLhy+cZoGKkCVTeiUjVR1dY+z8e4WFkys4DZvAAl5bFjB2AOuphvxJDx3jE/T2+qwp73OWWHpkX
	0Jr2gE65/U4KPGUEU31BAcTURKr5Ie7w20ifEGD2C+DUUaffjJ3Y/y04JzbPSgHWiJUMx5MXvC/r4
	6YkHkmjaXJVvzUpmwudDZ2W6KjxMJJ3sPB7FdW0mANmMDDjJnVqfBqqKMyNyWgS2O95iEtf0TRJ/t
	OkFmi3/xcv0603Pa7Qgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Das-0000000728v-1Llv;
	Wed, 23 Sep 2026 03:24:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Daf-0000000721f-09TT
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N39rTl2033218;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lW2GwZMPGZI
	4eymc4rsHwSE5MXjuS9FDVGYxOO8faiQ=; b=TEIoAnOSBHd957XEeXURJf/tt9J
	r/h1Cru98g4UevfqtDXZUQCLu9J/+oChbJYlXHfVmwb2Ddd6bNnn8bvdG8uranvM
	XEyB+zDZBspWLg2H24jmyVrRhyL5cBdoybls+871KUfRAYiubOUnamIElb+hQySb
	4FqC/JmdRHOzUayDNr8Jtv1+/308Ec+27tz/htxdcdPOfPheRxACjHcpiNWs2oB+
	Hb2GZBcMXBbUGDp5WY1vZYBoeN1A0G5+IAu08AP7137Q1V6+/Y6zhU/rsXyBf0e1
	4W8oqniNTp6YN2nW8O5wI6IaonecrYOhaG+e5oMGH/7ker9xDHWuQ0kqKhQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c27qv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2wi016045;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O2MY015971
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:02 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1C6EC24943; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 08/11] lib: sbi_domain: Allow adding memrange to a particular domain from drivers
Date: Wed, 23 Sep 2026 08:53:56 +0530
Message-ID: <20260923032359.4041876-9-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXyPqWaQ76vHd6
 /DcLh3kMFV38hc86d306Mw5G5bK1EghI+NP+txgwbmtudv6q9IWwQ8Kxvs38+oeHIMlkyK6R/Wn
 VBI0+PpbQkvzegKF9kf0Z1nDpMbxQJjy3Efz9MEMI0hZO0C0j8OmIHEb/dTgeeaaeLdgvj9686e
 jHT6wzreJlt1LZyJqe3Nj0wP2BtT2cmkbhOtzAHSkXhjDTGCiwktzuDJJY/sobvTKYutvQKCDmn
 LMMX/nFFKpA/5E90ccwaUURCUeDHHJ6lWLn95WPHowApPuw0Yf3iBJU/yK8Vn2slF/PTX5QRgyQ
 Tzm82FjaVUpWeq4F/ZKCQmMTL6ZExUehsLd8saujixNWhCiR+9pmmBeYUPWSV/+WE090pu1lpFj
 jVSY3Uyp8TzmKHZP2a07dg8U8S73qAcn4LHDYO0DGjnuxSPEyjDPU+tYiwVaeXG8MTO2OJirSi+
 EoYod2AgSNgcDIqxTWQ==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=9wAviArqdt_6W86cLqQA:9
X-Proofpoint-ORIG-GUID: WOEb91GmFjud8k-E9fDh4cTgPtwvOjpq
X-Proofpoint-GUID: WOEb91GmFjud8k-E9fDh4cTgPtwvOjpq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXygmZC0rVZ+uY
 2gFX0vMCEHIFTtbzj6RLT1yf47TvZv6BV6BfW9zZSaezOMb1ZRByfxPmI+wqDHAss9DgzR8Soz0
 gMl6h+CTtqaa8kIjBbArADwxe0+0Nmw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202413_557338_21C14FE3 
X-CRM114-Status: GOOD (  18.24  )
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

Currently, memregions of non-root domain only populated at domain creation
time which not flexible for drivers which create domain specific resources
(such as MPXY channels). Add new sbi_domain_add_memrange() function which
allows adding memrange to any domain at boot time.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_domain.h | 23 +++++++++++++++++++++--
 lib/sbi/sbi_domain.c     | 35 ++++++++++++++++++-----------------
 2 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 5e5b2227..d530f939 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -345,6 +345,22 @@ void sbi_domain_dump_all(const char *suffix);
  */
 int sbi_domain_register(struct sbi_domain *dom);
 
+/**
+ * Add a memory range with its flags to a domain
+ * @param dom pointer to domain
+ * @param addr start physical address of memory range
+ * @param size physical size of memory range
+ * @param align alignment of memory region
+ * @param region_flags memory range flags
+ *
+ * @return 0 on success
+ * @return SBI_EALREADY if memory region conflicts with the existing one
+ * @return SBI_EINVAL otherwise
+ */
+int sbi_domain_add_memrange(struct sbi_domain *dom,
+			    unsigned long addr, unsigned long size,
+			    unsigned long align, unsigned long region_flags);
+
 /**
  * Add a memory range with its flags to the root domain
  * @param addr start physical address of memory range
@@ -356,8 +372,11 @@ int sbi_domain_register(struct sbi_domain *dom);
  * @return SBI_EALREADY if memory region conflicts with the existing one
  * @return SBI_EINVAL otherwise
  */
-int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
-			   unsigned long align, unsigned long region_flags);
+static inline int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
+					  unsigned long align, unsigned long region_flags)
+{
+	return sbi_domain_add_memrange(&root, addr, size, align, region_flags);
+}
 
 /** Startup non-root domains */
 int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid);
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index c28eeba6..1c95b0fc 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -722,16 +722,16 @@ int sbi_domain_register(struct sbi_domain *dom)
 	return 0;
 }
 
-static int root_add_memregion(const struct sbi_domain_memregion *reg)
+static int add_memregion(struct sbi_domain *dom, const struct sbi_domain_memregion *reg)
 {
 	int rc;
 	bool reg_merged;
 	struct sbi_domain_memregion *nreg, *nreg1;
-	int root_memregs_count = sbi_domain_used_memregions(&root);
+	int memregs_count = sbi_domain_used_memregions(dom);
 
 	/* Sanity checks */
 	if (!reg || domain_finalized ||
-	    (SBI_DOMAIN_MEMREGION_MAX <= root_memregs_count))
+	    (SBI_DOMAIN_MEMREGION_MAX <= memregs_count))
 		return SBI_EINVAL;
 
 	/* Check whether compatible region exists for the new one */
@@ -741,25 +741,25 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 	}
 
 	/* Append the memregion to root memregions */
-	nreg = &root.regions[root_memregs_count];
+	nreg = &dom->regions[memregs_count];
 	sbi_memcpy(nreg, reg, sizeof(*reg));
-	root_memregs_count++;
-	root.regions[root_memregs_count].order = 0;
+	memregs_count++;
+	dom->regions[memregs_count].order = 0;
 
-	/* Sort and optimize root regions */
+	/* Sort and optimize regions */
 	do {
-		/* Sanitize the root domain so that memregions are sorted */
-		rc = sanitize_domain(&root);
+		/* Sanitize the domain so that memregions are sorted */
+		rc = sanitize_domain(dom);
 		if (rc) {
 			sbi_printf("%s: sanity checks failed for"
 				   " %s (error %d)\n", __func__,
-				   root.name, rc);
+				   dom->name, rc);
 			return rc;
 		}
 
 		/* Merge consecutive memregions with same order and flags */
 		reg_merged = false;
-		sbi_domain_for_each_memregion(&root, nreg) {
+		sbi_domain_for_each_memregion(dom, nreg) {
 			nreg1 = nreg + 1;
 			if (!nreg1->order)
 				continue;
@@ -768,12 +768,12 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 			    (nreg->base + BIT(nreg->order)) == nreg1->base &&
 			    nreg->order == nreg1->order &&
 			    nreg->flags == nreg1->flags) {
-				int i1 = nreg1 - root.regions;
+				int i1 = nreg1 - dom->regions;
 				nreg->order++;
 				sbi_memmove(nreg1, nreg1 + 1,
-					    sizeof(*nreg1) * (root_memregs_count - i1));
+					    sizeof(*nreg1) * (memregs_count - i1));
 				reg_merged = true;
-				root_memregs_count--;
+				memregs_count--;
 			}
 		}
 	} while (reg_merged);
@@ -781,8 +781,9 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 	return 0;
 }
 
-int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
-			   unsigned long align, unsigned long region_flags)
+int sbi_domain_add_memrange(struct sbi_domain *dom,
+			    unsigned long addr, unsigned long size,
+			    unsigned long align, unsigned long region_flags)
 {
 	int rc;
 	unsigned long pos, end, rsize;
@@ -799,7 +800,7 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 				(end - pos) : align;
 
 		sbi_domain_memregion_init(pos, rsize, region_flags, &reg);
-		rc = root_add_memregion(&reg);
+		rc = add_memregion(dom, &reg);
 		if (rc)
 			return rc;
 		pos += rsize;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
