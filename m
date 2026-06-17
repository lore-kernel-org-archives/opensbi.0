Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB706CD98F2
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fnygn5E12FSJwSO67P+dVasM4Fm0eBuGjVJmHDi8IwM=; b=GxDt6mYiNxGIwP
	5YF2T3KabrpTn+Bz0IQOL/pAsnbsbQdkslgqBgf5+zObQPH3wMiH09MbUXRc1xneUSQAo3BfK9ekP
	LtZLIjiaM+qq3DWV8e3MQkTg2JtwpVCbYIe4GRzW0by4lcMy93TNpKuo0b42wsqGPoGdO1U8sVZst
	uf29VmqKyEImdbfpLu4VJaYyN1l8trynpQkOsp/3HkMVIZxsgjKX3V+e4qU0D0HeLogIcFgpezSIJ
	BdBZIBOnq3BqOY6BnUEZtnMPgXLd8YSlXFIDc8EQ9sIT6VWWbQQ4GKtV3pUBuxtzAq2BOvTyApe55
	omsDicabCc6RzJdbOBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvC1-00000000B5a-46fV;
	Wed, 17 Jun 2026 18:40:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvBz-00000000B38-1bdb
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 18:40:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHd9cE329955
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AQOXN66vHnI
	L6yDspHXin1VToNThC/CEsAjK3ki99xM=; b=dFAG6I19LN1Nj4DNJhYh7YG+RQU
	SMEYqBxQU7e5gFgb6dTKWavfn/GHTQS4ptVILo0eCKmf7MVadrSYxcv7+X1VfQ/w
	P35MqChYB5QQHqX5ipqpb/UBBebu31P6L5b5zP3tsP3BLBoOrqFuzsXiOFNbgwnP
	NpWzfPNgN0oZG27K+tePmjEdL+DHgcqNJapdFiOCXdnXFGvbmkuZlIYTCEEyIEJY
	tXLtZzkHVQXdwLZ7qa1gI15dZ6rIGuj/XaivEvAvQaNpDAyqpsMlBvXmcJ1w+nC3
	8xTSIr6U9wXGnpV0W8dUrE4gGBxtDDln4x17/TloK509Fl87N2OV3IrSrwg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vhetp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:50 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HIen9o006807;
	Wed, 17 Jun 2026 18:40:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4euhn9rtas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65HIenqc006792
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 65HIennv006782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 18:40:49 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 3115424E83; Wed, 17 Jun 2026 11:40:49 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 6/6] lib: sbi_irqchip: fix MSI EIID gap and tail allocation logic in register_msi
Date: Wed, 17 Jun 2026 11:40:38 -0700
Message-ID: <20260617184047.70388-7-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com>
References: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: FckpWCojilQO3Fk1RA_bIaadE9yQua06
X-Proofpoint-GUID: FckpWCojilQO3Fk1RA_bIaadE9yQua06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE4MCBTYWx0ZWRfX1Xo8IHvp6+mI
 KW//H4bk/PBEmcZPGMy8c2Q6bU4cU+JY6RfWvGj/Fx6+jIzg3o7zLNIDoPNPqrvdVOiLSsPfkeZ
 d4SFcHI6scjH2KN6Nv6fnuJ942BSx1Vr60pEM3GH41t0bNkEZVGcxKzWKkV7BfOZHa77xVU+voG
 UBs6OkD2aQOlUAHQySkIUDQwyoyzITGUXa4yZ9fXqtgnYBZCz6eUuh4hxdzLyjaAT9Az49PfRCG
 WI8SBsXC0S3HLReWnE/OmWRfbemBwmYFINbb5WG/hCEQghj2J9R5+xR7XIXzoikXe9VBwzPaYFI
 cqd7WEz4CJ220U9PktgtfOflKFo/0i5cObOpcwYldH814oe1/cw5Q+n7eAgolCIhkdINKs1XhfN
 w+IDMCQl1Pb/L15Ru210cpjT2PhyHu6aK+A0QGnW+dvU+sD/0JD8IKxOioiGuNuTM3pzoWir4yE
 2AOBmtMCOmo11eW4yOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE4MCBTYWx0ZWRfX7o5XIKt9uhzX
 U32aCGuXdBbnFIIyZDmkguN8oi5pi2JkfRJXMJsTN/I2kdxXQZfK2Q35OVzEekPsiWLNGNrKq/a
 v2+POVJDgb/fIwUKmRsp7w65zUZBReE=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a32ea32 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=GfAy4FA1evO29GI99tgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_114051_424511_64715F84 
X-CRM114-Status: GOOD (  15.36  )
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

Fix sbi_irqchip_register_msi() that prevented contiguous EIID allocation:

- Gap check condition was inverted: the original `h->first_hwirq -
  hwirq < num_hwirq` incorrectly set `found = true` when the gap was
  too small to fit num_hwirq entries. Correct to `>= num_hwirq` so
  allocation only proceeds when sufficient space exists between
  registered handlers.

- Tail-space check `!found && !hwirq` never triggered after iteration
  Replace with `(chip->num_hwirq - hwirq) >= num_hwirq` to correctly
  allocate if handler list is empty.

Fixes: 79e63bc8348d ("irqchip: add sbi_irqchip_register_msi support")

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 lib/sbi/sbi_irqchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 49fa4806..a4480751 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -354,7 +354,7 @@ int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
 		if (h->first_hwirq <= hwirq && hwirq < (h->first_hwirq + h->num_hwirq)) {
 			hwirq = h->first_hwirq + h->num_hwirq;
 		} else if (hwirq < h->first_hwirq) {
-			if (h->first_hwirq - hwirq < num_hwirq) {
+			if (h->first_hwirq - hwirq >= num_hwirq) {
 				found = true;
 				break;
 			} else {
@@ -362,7 +362,7 @@ int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
 			}
 		}
 	}
-	if (!found && !hwirq)
+	if (!found && (chip->num_hwirq - hwirq) >= num_hwirq)
 		found = true;
 	if (!found)
 		return SBI_ENOSPC;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
