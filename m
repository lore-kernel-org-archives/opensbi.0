Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CABC5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTWTIZgy4WGbUrh9AN6DtrLiMi0VsZps4llqlFUQcKc=; b=JRZjwp8qZmVsCr
	+Jn9U6+YvwEmkn9CDLfVWeYlLrPdQlk+j79408GoSNrvXOrP5jYoGyEC7mIA/0rdA1xf9HsKdxFbQ
	9TwLtXi0tRFQXGehHpYugIQ3ncsFnp1honyQj251ZcYwFFhBu/I3hKgG2OeerkZL9gAsqP+FakiXy
	uWHa0bnhVWaQUBp7Br0PlaqDnxY+HvG6iHSHZ76p/FeVQOMR69nP0TPGkcp3KVz1qZl7kF0j68an5
	SuSFF8irpEaz2ysMIYSqZpT/A0fCb6H623oPxcnJHgBCdQtZq5+Ytkh1BTuXLQ/KJS2DtaOIXUX5l
	0pPtn1ctXXlPrbYdsQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyOO-00000006JI3-2yZc;
	Mon, 17 Aug 2026 14:32:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyOM-00000006JGD-04ad
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 14:32:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD66oH2749151;
	Mon, 17 Aug 2026 14:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vCG0NvBEVuv
	nYvl7rg+XKEAkMT0rGjG4SA1V9la7Ulg=; b=XYMZCh3XAD7mKqrNpx0hmZ9uDYK
	df2cqe3QvjWi6pkLW+E1c9N465yrilBFRpPDrV9bFjea7B+f7Yu8ERZoBGjFGBN/
	yanMm6ChrN79lCRqjc+fuQ2yJT7DcLPpAZVIebyzKqIhQ6S1Q3vn7tX4nRPYAoWO
	1lUI9q1lVASfLDYgs1K/FXbl2VfdT5Fi1MVgpD/yfmBJOSaeFLR91GW88v7hajSx
	fwU3XBNVAQV0OUldzNNxarz2wdS8Pf+CwldW6qkFfIlaNUW17GkKhOSBDsBXGpci
	AWp6ER5CnkEDkuZnQMTuUJt8R+EDLcWm1h77Cr0ilmpAjVRoKwsCwEer83Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7799d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 14:31:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HEVceH009496;
	Mon, 17 Aug 2026 14:31:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g2h6j63j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 14:31:38 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HEVcge009477;
	Mon, 17 Aug 2026 14:31:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67HEVcEO009472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 14:31:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 51BB321A0D; Mon, 17 Aug 2026 20:01:37 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 1/3] lib: sbi_domain: Check possible harts in sbi_domain_context_enter/exit()
Date: Mon, 17 Aug 2026 20:00:23 +0530
Message-ID: <20260817143025.3068512-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
References: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfX/QqgTgQHsnb7
 ISzEmLPrC+/vgX7+8QtAzazpKkTL1HlOQWGU4ayWDq07ZgoyH+KbvwBnv6kEgUiLeelTLz6ZPfx
 yuKYXC4s/IqhySqGm8iTTCERiTFnDX1JK7fUcy+7hCehj4Irci5r90tljd+Fa7LegZRHo/c+Zaa
 3g5X75OuTHRqmUMwBxiootyMzhY3l2hbOpG7X95eGVUShdXrFDSOTRzlxC2hPaZiOw83e6eRJ12
 QSH/1PL757rfrMSQK8uysMAE0oTPJPKlJq9CgEj3OvRge0YZ2dwkp6iwArla5xzElXG1aSgqiB4
 y376cAtZuatWiSk1I2D6PQK1Lgq+WVRtoRmz2lk6neR1r4q+3DXbj8p5xm2Agugcp7keVzkjGm0
 pditUo+JSMmfXIdDQKQcjDwnpZcoyYzN/w6Xz7TA+C9F3rdSgVsxwhAHKni8PxWQQMbaQCdTQIm
 /R+tj9EvGFb0r+bMxxg==
X-Proofpoint-ORIG-GUID: RBAi61vOFuQsQJmDbNPZISaKxH4C3Wpf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfX/QOEm76g/6hU
 zg2Lz6PGi4lhhOWTpTHX+vQ6Wj4FAF43yZKQONSLgSv9kVqQJt/4bix4NC5suOKmeV+Ny0TCyuv
 F2whCgjvlauGZzqZ96ukJvC6fmZzUUY=
X-Proofpoint-GUID: RBAi61vOFuQsQJmDbNPZISaKxH4C3Wpf
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a831b4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=GowCY4pPMrDu7OKEMqwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_073246_169912_C8ABC40F 
X-CRM114-Status: GOOD (  14.48  )
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

When context switching to a domain the current hart MUST be part
of the possible harts of that domain. Add appropriate checks in
sbi_domain_context_enter/exit() along these lines.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Tested-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
 lib/sbi/sbi_domain_context.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 0861d541..837ff54f 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -231,18 +231,23 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
 	int rc;
 	struct hart_context *dom_ctx;
 	struct hart_context *ctx = hart_context_thishart_get();
+	u32 hartindex = current_hartindex();
 
 	/* Target domain must not be same as the current domain */
 	if (!dom || dom == sbi_domain_thishart_ptr())
 		return SBI_EINVAL;
 
+	/* Target domain must have current hart as a possible harts */
+	if (!sbi_hartmask_test_hartindex(hartindex, dom->possible_harts))
+		return SBI_EINVAL;
+
 	/*
 	 * If it's first time to call `enter` on the current hart, no
 	 * context allocated before. Allocate context for each valid
 	 * domain on the current hart.
 	 */
 	if (!ctx) {
-		rc = hart_context_init(current_hartindex());
+		rc = hart_context_init(hartindex);
 		if (rc)
 			return rc;
 
@@ -251,7 +256,7 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
 			return SBI_EINVAL;
 	}
 
-	dom_ctx = hart_context_get(dom, current_hartindex());
+	dom_ctx = hart_context_get(dom, hartindex);
 	/* Validate the domain context existence */
 	if (!dom_ctx)
 		return SBI_EINVAL;
@@ -276,7 +281,7 @@ int sbi_domain_context_exit(void)
 	 * its context on the current hart if valid.
 	 */
 	if (!ctx) {
-		rc = hart_context_init(current_hartindex());
+		rc = hart_context_init(hartindex);
 		if (rc)
 			return rc;
 
@@ -294,6 +299,9 @@ int sbi_domain_context_exit(void)
 			if (dom == &root || dom == sbi_domain_thishart_ptr())
 				continue;
 
+			if (!sbi_hartmask_test_hartindex(hartindex, dom->possible_harts))
+				continue;
+
 			tmp = hart_context_get(dom, hartindex);
 			if (tmp && !tmp->initialized) {
 				dom_ctx = tmp;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
