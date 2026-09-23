Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3185CC9830B
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aWrW20e7j8Q9eb0e9kczACo/BxSXPTnz0TdhhrBcTg=; b=E4OKQekXkV8Cfn
	NE5dG9otEmTWO66xzgTGaZ6+8fBQzrQAmL4tcEbMw+RYR1Pi1ZAHHfVakptVzQlz52ZHJ5CuahiKP
	y4x0dCVK61vnKzwhzqU780UQJIYP4JDVogFET53UrsBYxP0Zb3Cygm5LWPW76A4wFECa1YJYKdDIv
	yYUH3lvpRv1Y5g71Kj0Fi2xN/g0fjP6p3tGdDhWUoOFIm5SeXh9yq1eAfgiEPkTK5ApnLMOTpu0q/
	KjVBuImESMJTX2x8OhJbI2J39yXNzjm41X3p1+NMdH28rIEKfWopZWfaZRj9PudIey7T2yMvxGZCT
	EFbIQ/BtolEPFnfTP1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dam-0000000725C-32pC;
	Wed, 23 Sep 2026 03:24:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Daf-0000000721V-0H5m
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN7wwJ1402170;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JYLBZbOd9u5
	zlO/K593ZSl4CpQvOLXphDpInWtQTg00=; b=lNYhfsBTnvC92JjOWKaXevfb5DH
	kPfDcApF6yyEySkiakpk2rAjr72m8HP6C14NJJHtWkGxrp/CqLXGslEL+9oFOvcF
	VQIihfVdMiEU7wJZhaIjqZQRGo3x6Wqpvo7+YdENYZRa3UJVb3Y1iLZY8k/fVbtQ
	LeVluLEoen81AZuzC58DDbxA53BHnLmEFUUYSU4uhClO/aVKSK1YtaFe33sy6IuC
	hV/OzY1mCqlEM1C3erJsAfFJgTuS+cm++IERM/nqjKlojVRZJvxtajBVgcxkS3zD
	kmpP6ujLJ0Ll1Z2SvBkKpS9KDDTLVtOOOzTHdWBE2dsdUzXWzPGVkFIEWiQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3318reh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2nu015890;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O2Pk015969
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:02 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1FCF72495F; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 09/11] lib: utils/mpxy: Add domain parameter to setup_group() callback
Date: Wed, 23 Sep 2026 08:53:57 +0530
Message-ID: <20260923032359.4041876-10-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: U54bdgQ6F5aOLsAr7m3M38cXY0F59tFN
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=O-_jF1v_tPhktfd4wPYA:9
X-Proofpoint-ORIG-GUID: U54bdgQ6F5aOLsAr7m3M38cXY0F59tFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXx2kJshWFGE5m
 i4gC2+foDCTXdTIT50em6ruL7iHQpyVkqer8LqUwMwegOYYunY7gxdIAfwTe4jtQyxua5zdMVye
 1sW2Hu8nx4rlx5aXj6I8aQrsAZ059G2nyk4mJblkiwG8tSoZZTpDmQUfWweMp9YYZB8O475qh76
 vRqHnbAfUssP2u0NNs3nmiD/FECcIqy/qXJTqd5+uEJ36NMXQBkHAxJ/fo8+ZHXcahUiPx3jK3C
 06PouaED8bP5ncwg1z8A68t90cE0pqsZ1X/HH8fgJV8hKUGyVh3fjtHaxmKy5P4cQURbckl4nEY
 EI03eqH0eHIM0oY0wTYkqakC0cGD9eKw5AqHNdmAYMouUilCRKOfA+R6gQmjXGMrlZrla6lBh4q
 95cDoK8YuUpikkM8rs6n07KUfr4dsGyUKE8/Hui8DiQksnli6HBX9VIxnp7axYfeHiA9BwliYhh
 W0tWwvJnbIx5A13TyxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX/BNP1RFjgAav
 nraRJ/MSDgrkmSTrqCMUUYYseXgzyl5Wd83kh/alGxRBgtD4EU317oRJ/5W2RzQN2nECBDsly4S
 iUDPg/ULdkXWEj7W8LNmX4nmsJfJkqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202413_558579_6F3E8A6F 
X-CRM114-Status: GOOD (  15.68  )
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

The MPXY channels can be domain specific so the setup_group() callback
must know which domain the MPXY RPMI instance is associated with.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h | 1 +
 lib/utils/mpxy/fdt_mpxy_rpmi.c         | 2 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c      | 6 +++---
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c  | 1 +
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
index ae7e537a..7193a5fe 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
@@ -41,6 +41,7 @@ struct mpxy_rpmi_data {
 
 	/** Setup RPMI service group context for MPXY */
 	int (*setup_group)(void **context, struct mbox_chan *chan,
+			   struct sbi_domain *dom,
 			   const struct mpxy_rpmi_data *data);
 
 	/** Cleanup RPMI service group context for MPXY */
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
index c0493ecb..69fd608a 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -286,7 +286,7 @@ static int __mpxy_rpmi_init(const struct mpxy_rpmi_data *data,
 
 	/* Setup RPMI service group context */
 	if (data->setup_group) {
-		rc = data->setup_group(&rmb->group_context, chan, data);
+		rc = data->setup_group(&rmb->group_context, chan, dom, data);
 		if (rc)
 			goto fail_free_client;
 	}
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
index 0263a105..57e6707e 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
@@ -39,6 +39,7 @@ static struct mpxy_rpmi_service_data mm_srvcdata[] = {
 };
 
 static int mpxy_rpmi_mm_setup(void **context, struct mbox_chan *chan,
+			      struct sbi_domain *dom,
 			      const struct mpxy_rpmi_data *data)
 {
 	unsigned long mm_region_addr = 0;
@@ -63,9 +64,8 @@ static int mpxy_rpmi_mm_setup(void **context, struct mbox_chan *chan,
 	mm_region_size = rsp.mma.shmem_size;
 	mm_region_flags = SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW;
 
-	rc = sbi_domain_root_add_memrange(mm_region_addr, mm_region_size,
-					  PAGE_SIZE, mm_region_flags);
-	return rc;
+	return sbi_domain_add_memrange(dom, mm_region_addr, mm_region_size,
+				       PAGE_SIZE, mm_region_flags);
 }
 
 static int mpxy_rpmi_mm_xfer(void *context, struct mbox_chan *chan,
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
index f7c3c3db..6268a437 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
@@ -85,6 +85,7 @@ static void mpxy_rpmi_sysmsi_cleanup(void *context)
 }
 
 static int mpxy_rpmi_sysmsi_setup(void **context, struct mbox_chan *chan,
+				  struct sbi_domain *dom,
 				  const struct mpxy_rpmi_data *data)
 {
 	struct rpmi_sysmsi_get_msi_attributes_resp gmaresp;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
