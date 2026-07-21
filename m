Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2552EC44537
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 21:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=666Zv9ryPtOUncvRndwvvH0qmj45jsxZktRWd2iql9o=; b=0tV1NSE06BPSRe
	yn0QLou6qXGJdKO5Wefxpf8r8tWFLe4MojH072RRe34pSm7e7ta9LSFMd722ZPodoI5hI4rsqRuc6
	YpaKYXpvivEN83UnIvGfOvGGc3cGqa+TsecLpjYapJTJe07zLSO2VYROuOAulYOMjCgWjP1UJ+Opd
	Ai8IJLqcr41uykpfJqooOcGpCC3xaHibh0q3ObSID8suis8aWdwoJuVrwnhX2zZBGSNdDUIFkHs6W
	vDMSsU1Z1/lvpi5EanW2MhOXjl9WzbmXyFVaw0BSkUZpR35nM96oaXvMt0jYcmSPMLLBpFbVoHNvx
	Q9UUo7cvdrpngcd7Ntkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKQ-0000000ATWF-3rQX;
	Tue, 21 Jul 2026 21:48:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKM-0000000ATTp-3gJr
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 21:48:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKle7B2795008;
	Tue, 21 Jul 2026 21:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CBtHAGqVsLI
	3reENVQWbYi16O16eBahB7mavKXycHxs=; b=VRxw1onlKcPi/u7RCCfVi+IT/de
	CTKljLssKw4eC5FnsLAu6v99V1g8+i7LaN7tdsfwnct5dpGhIixONX07Puwc/wZ/
	g/74fvKQrjKiwRibj0AlejZBjI39S40hTjXXkzfrtv1w1Zdik7HgiGqT8UaqI5iB
	uoRU6CqaVtAyMLs7m0An8UI847RxEYqP6mUryvGLeR8Y0XBL0ZbzzXJroaPDc4zN
	09A1z0I2qkYU5CblO7UkXZoyemjBXSSeaCzOUfoTbEH7D/RxeW/gKe3g8aW1nLFQ
	gGydG8O0J/xfMlxm/E2az4ZK8L+2zrtVfFxSgt0HzVAykruBCx42qABJ4WA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pab3ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:37 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66LLmajj015007;
	Tue, 21 Jul 2026 21:48:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4fgj5xba6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:36 +0000 (GMT)
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LLmaWg015001;
	Tue, 21 Jul 2026 21:48:36 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 66LLmZ3h014999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:36 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 8FB3424E21; Tue, 21 Jul 2026 14:48:35 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH v5 6/6] lib: sbi_irqchip: fix MSI EIID gap and tail allocation logic in register_msi
Date: Tue, 21 Jul 2026 14:48:30 -0700
Message-ID: <20260721214833.687361-7-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
References: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: aBr3EzJaGDy73_Rfc7g0TPVJ4OXq32eH
X-Proofpoint-ORIG-GUID: aBr3EzJaGDy73_Rfc7g0TPVJ4OXq32eH
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fe935 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=GfAy4FA1evO29GI99tgA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfX3jN5TQ6mySEK
 KXnO8H2HVuLiNKWZ/tp7ZNIlUZQ0/aeda7U+jj2Z5ZGkOIw/bVQp+CJL0hajvK7P/i8OcOppRGp
 clHnt698I1MTpTshvF4IOq57Khr4w7vdRiYN3xRWl6ZEEPcjpTqt/d4Kxi0iop7sPjTYaVAMud3
 H+Rxktoyz+fJLlLC3Oc92yZGMtu/i3JlKWqDQFGDnPevor9EOI+oXh0WmGOIvUf3/pGV9W3hCPg
 ZlZNTeX0nS7WaNBXkqXkFAqkphdRO0HKn/2wpG8Qpuk283bp4X+3PkajDQGU1qEbFPaRTJeWMmG
 mqIZBq6fYyfFDHJmbpTpoMSi5F1PciuIPQE+MSvU0vzLpPFv9ZPy5wATQkara6bWzOhxlpT4Fzo
 c/z8LH+jnPZzY34vQE/VLycJPjKaxYXw5suaeFTPnzh50VFTBXlshOkpjM2oXkc8qc+H9+4F9Q1
 a/6OuhD9D8kzjNmCc0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfX8dA5gGX4KWBy
 zbF8e9nRlvSQosxkYv/G3amODfX6pRyBvwuNe9KuudQHfNafZByx6vTAjcT10CaxYeAMxEA74Gq
 M4ZZvI0z6dzRUT0RxmC9K7DPIf20FFk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_144839_039615_F9161FED 
X-CRM114-Status: GOOD (  15.04  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_irqchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index d5f47a05..a5822e17 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -399,7 +399,7 @@ int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
 		if (h->first_hwirq <= hwirq && hwirq < (h->first_hwirq + h->num_hwirq)) {
 			hwirq = h->first_hwirq + h->num_hwirq;
 		} else if (hwirq < h->first_hwirq) {
-			if (h->first_hwirq - hwirq < num_hwirq) {
+			if (h->first_hwirq - hwirq >= num_hwirq) {
 				found = true;
 				break;
 			} else {
@@ -407,7 +407,7 @@ int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
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
