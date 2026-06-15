Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924FECD98DA
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wf3k5oaoQSOYv4QT8ngugPAzsLqm0FAlFdkMAHWGLlY=; b=oJWcXksvZXfitg
	qKPmWbUixwUHGfQEcUm+YMMj/fXFDJ8k1ToAeDRn4i/0IHmcdQusbVEUlmCbzckSJdbdVQCpG5TpF
	7Fnd2xDUur+ZyZJjHldyJe9+OSoLNvxCIXvJXD2VGpD9NrC7dr5IKODhHrsQGiqw+S/96at0Rl4pS
	9xEcUth6y5FfUYqbln+4yZqBxgaL0wzL1Z2Fd+qnfsQMTdA9eavWhm4vW79dCjbSLwg/eT8QmbFBW
	pOOaZ0MIczsG8dMfOvuBTGMB4C1VeOzLMqZe88UhQpsTyxdySr43nujp2a/IQYMkaYOqAlS2O4dfW
	nL+fjyF3MjsL+wCfnceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxg-0000000EdXp-0TYk;
	Mon, 15 Jun 2026 17:19:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxc-0000000EdVE-2AvK
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 17:18:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhLHw3139322
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wtS4u037njY
	Zn6kr3/OcZEAb7h2x/RcKsmAc3snDw2g=; b=k1WFV3wP39n20SeNFtrRc1n/h6H
	QH2O9EzHnIb/Rr453w75HXIgkBlWUWrhwzZC8ZzeeexB01dm3RLXRzr270KLkg8v
	VUX0nLApPmLfz1bcGQY12U1OM/fnl9sbX5OTYM/mKqnoumfEMx7+bVBm5p0hEjXY
	Z9rkDzVWT1foEDDPOVfw1VvO6SZnPYOoZolOwft6i3CzVMYjUOkTjqVC9w/OeZNS
	/r5uKW1a4Cvi3l6p0YELTbRxrq03cJD/6zgU4z9e9L9UkiU9XbV05qvdoXS4alQJ
	awBzSIHgoZs3bSdRb34+FBzkfLNYWGFdX1JzzM85QhBey01a3KSY43hVVHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete982580-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:56 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65FHEZGQ004260
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4et5v70cye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65FHItdh010253
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 65FHIsmh010252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id BFE6724EF0; Mon, 15 Jun 2026 10:18:54 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Pawandeep Oza <poza@qti.qualcomm.com>
Subject: [PATCH 6/7] lib: sbi_irqchip: fix MSI EIID gap and tail allocation logic in register_msi
Date: Mon, 15 Jun 2026 10:18:51 -0700
Message-ID: <20260615171852.447545-7-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
References: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a303400 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=GfAy4FA1evO29GI99tgA:9
X-Proofpoint-GUID: O-TjzOS1ixn2jP_fVa34Km8WuW5fuFzS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfXxTYhcEqO7seI
 w6wwP69TpWsaB9NuK51CqRqxbVqREUY7WQK4U0fQ+jR1KwScNjQ4Je4cm4SgJFADcxR6w1Wadpx
 PQHFc/2zyEEi+i3vn2nB6ZNAyWx89Ss=
X-Proofpoint-ORIG-GUID: O-TjzOS1ixn2jP_fVa34Km8WuW5fuFzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfXxWe6ALmky9uE
 o8ywmnHAKcy4bxZc5bk2ttbaEHh/udu5bgqM6+4F85a+KYhXCSXE8jxi/mlHmRwbLxnhXiBlGIY
 XIRsOeBnD4axnRx2UqtJBntHyx2EfT6U+dcYlMTcXeWHvwsVepw1TgGRp24+D2Z2YV11GO4RWnS
 tzA6Ft93nD/viSOwyJWaL439/4c2x7yJSncKgl69HTHRaz86MIYHwK1DodjSBHyyPWFeveJ7xIL
 +vy9WbeHs8oY2FkyDIhKBsETSrk42VxYUcgrtueZyJ2MGMXsOgxdgvtn1YiHfkd0VCMBcoN9Xub
 TN3l4n2UcvXgg/OdOy844VCN8q7+At87qcQLzD1vuIshfEQV4WjpbxIecTbkcuneGestdGmSzhL
 92/CkWsEvpUL92JCN3CqUjPK8px+f296RMsIHsvF/b+DlEY5fge3IZO8xKUYb2a2EtIa3mZMNou
 PcjTaWRZT2tLuGk2Gtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_101856_565946_DF6D8AE2 
X-CRM114-Status: GOOD (  15.98  )
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
Signed-off-by: Pawandeep Oza <poza@qti.qualcomm.com>

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
