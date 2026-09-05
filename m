Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD78C624DB
	for <opensbi@archiver.kernel.org>; Sat,  5 Sep 2026 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHKLfEs4wp+fxEKozXslQsVFpWriicet7fHrPvJuo7E=; b=cCFnNluHLQXeiD
	nbbTs0cVZdfFvcfxRjL4lIHXgo4mhSdM20hsgyQyx2BfMOu2ei2zAjVwHwMA6Hx3gdj0BaLP7Ds2k
	8ia38yNZQESaCwaCI2j3UFt/r9oUf+Eu8GAg5ipgZ0Z4gLVknqHtUb17gQL/XDvtdjVpfy4RhVg5A
	0nm0nUZ6HArKNdnCmgD/DU33hnjOrrLNdxvUOXOH/GGxgVuHmPAlqDd03umLP8DYTFt22irumba7x
	zKMuRfGdnrqKTZi8vzFTHF3xKyzf6PsoILGETpxXMUYO+HQUvi7VRh0HFy8NWZirZsQia0wMFmxNR
	G+zT9RXVnH3DyJMQNIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qHQ-000000045cx-2onw;
	Sat, 05 Sep 2026 13:18:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qHO-000000045bn-34IP
	for opensbi@lists.infradead.org;
	Sat, 05 Sep 2026 13:17:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BVw4c1560241;
	Sat, 5 Sep 2026 13:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xEeq43+xv+x
	97sl2q7YhumS5nRQepiG7PmsC7eEXMfI=; b=eeEHOHtn5ZKR7hKHeZ9RDlAIUg/
	+9330+fyXckkemn+PbeSKubWKojPeFghlK/AR20cgRol9J1oNXV5t9gZKc0c3+Ew
	SmCSKnBPnB4ccriRU4AFJnfIZcQrfxq59mrcNA08u+yU0GatfFeEs4ivfLmFvw6J
	JaMl9uDZlz2NlJBYndltmhGkAq3+bxiy+W+zGN/9S66MJbfWPD1RSQhyBBafi/g8
	GI6BYbXClJKISuUGLcEglpT24u9ra7dSAswtq4o3TW85v1qeZMKcxykhUoxmNU+9
	Ds+nhqlthpPHeuWYHDz7tDGiUlSxxwEG+Hnwkr0EDpEMoawm9Hts20BgIaA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca0veb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 13:17:53 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 685DHoLC4173914;
	Sat, 5 Sep 2026 13:17:50 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 685DHoic4173889
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 13:17:50 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 54AC4216ED; Sat,  5 Sep 2026 18:47:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v3 1/3] lib: sbi_domain: Check possible harts in sbi_domain_context_enter/exit()
Date: Sat,  5 Sep 2026 18:47:46 +0530
Message-ID: <20260905131748.922920-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
References: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: JdL26RY4dk-A_-0sVl_MZqVyOyF6tSLj
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9c1682 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pFyQfRViAAAA:8
 a=97N8L7JTGbelO1o8ISgA:9 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: JdL26RY4dk-A_-0sVl_MZqVyOyF6tSLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE0NCBTYWx0ZWRfX0pYkplRdQvq2
 WEWgMHeBubuNaT5tkeFHhsYPISfurTjphqcXCMwhcB0pL6zE4cI8IJQVbXt2/5mFtSFxDvjuWb+
 Rf9jkb+0fB96oQqy/cenP/Ai6TFJp6+Mh+ZA690hNEpwh4RqEeIlWoNXCbtKWGM/oYxohcHHUke
 lXYkw9ZmMRG1o3BUHA+mSpM9Upf4PLx5wJ3fT82yq4XUUHx76tTRyQHYJBj65lh0WVRsuCJOe77
 n4ZigmmKsCmirRBGmLHgOkKDEZzG9vcg5ntO8dcZSnGWWDuBPatZbeuKnnPJy/8xRFzLUO3rOco
 YgJms8Roa6SZrZjlpL9PRLvUsus9yp8eluTk17kUAca/fR1MRd+k/8SkwzOF9k67xht2DncVHoH
 rowJeKDI1JGLxoiPdKqTu73jvU4kQq3HIbODwnbJfR5R93vDiLVN923/0ssQOv3J/00wNKnPlgE
 zGjGGWzEps5b0PpU0rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE0NCBTYWx0ZWRfX8Z1UbR/XJGgh
 asidJV2tb9eej+ruqvfNepMNBgulFZh/sYCDTKcak8X/r/sLDPeuyfVW497+7aNwsbtscIM9Qcx
 B2CY5HAyukbujvj3wW+UrOw/k3nAJMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_061758_776919_CACB4E74 
X-CRM114-Status: GOOD (  14.40  )
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
Reviewed-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_domain_context.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 37cbe175..316368ea 100644
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
