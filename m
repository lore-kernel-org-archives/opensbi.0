Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB15FC43458
	for <opensbi@archiver.kernel.org>; Sat, 11 Jul 2026 20:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFk128qXuOdzagso9Ff7HpbSieldN7UnGX3TDNpXRzA=; b=mvoYupJFvyNuCK
	O2y+Zyh6TeCg+v9Fl0dssptDY2MK5Yi4/yrTVu1cnF95z37ADvmnaXZbn5tkvQl98TRoV9l3UyC0B
	Y37wsfofXu+bwJzaczj8Qu2SzhJ3twI/DqxkCbuSI4bmk+rRwN00X4o17YvW4Zs3h2OBjurmkdfJa
	UaHw98W3PiZ7EYbYa/3VbLDeU31KBs+BBW1shgEoh7mgSBYykvxmXWCjBnvUNJZfaHFF1g16KDkeB
	SqBbFG8WrPArCFxI23bM7JkrHlNjQv0BUKM1rO3WYPrNVfuCmC2Eb1ZvkD/Fi0eRFB/dyKR3/XbRh
	WzryQyezHLIdRnCu7VXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wie5b-00000006qk9-1JBB;
	Sat, 11 Jul 2026 20:14:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wie5Y-00000006qhk-36bE
	for opensbi@lists.infradead.org;
	Sat, 11 Jul 2026 20:14:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BJF1cY379534
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WDMTMBBkV4k
	jCazDSnGuHU4L3BQRfLPCFY5rYD/QIyk=; b=cXH3GfiBP5X6LX/4b0GspHzYmC9
	XFY3iWTrnGONmJSChjY0xNgqG0TwWJ8Y//qMAwD7stWKDibM7ZEuInaRDhMzTvKw
	6Grk2cDT2qDtEeY6hGpfT3FspMp7zOmXJOpgQuQUHgG6nr5LFN1Tas1cyzdXd/cX
	XVE6ysYv/jsIycNDy8JEwXfOg9elCEtC7iRGZmpSuYkSJUBRKOfIeu9dNsePmH/f
	ugGdszNEJ40bDrgGGm/yVA6nU8jx+LRxgtJXelMql+Tq5+I99JMG1o8ou83N2mGU
	bjBn59zfSmixP0e0o4/AzlvAsjjufmI/wiuJZPJjKpe+EnLMwWRHqqpexwQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekchfuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:15 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66BKEF12015372;
	Sat, 11 Jul 2026 20:14:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4fbewhcymx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:15 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66BKEELi015341
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:15 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 66BKEEWl015352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 20:14:15 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id A7FD620BBE; Sat, 11 Jul 2026 13:14:14 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v3 6/6] lib: sbi_irqchip: fix MSI EIID gap and tail allocation logic in register_msi
Date: Sat, 11 Jul 2026 13:14:06 -0700
Message-ID: <20260711201413.2931099-7-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com>
References: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDIwNiBTYWx0ZWRfXyhvXiq37BJKL
 gk4kBEEukpnG6e6/o0DXN3LGjCUKYOmpeqRdxTYiCj86si6V8UWV1E2OATFawLdhFmkv4fO6oJU
 Y8RtBEZA2d6Wy/EFQ89WCuv6h3oxmGASrbPescGK9wTkh6K0E/yAsAhcGVK0kMiV7Ij6DS1zGXk
 7LSWb55BBznt92Zk/1IYZuwd4Nl8M3E5AA6qmR++OeapxDAuNHW7k6zVqrP3ajhmA70fRhvEyq4
 IEWJI19Ar5Eq3+PgqVsKqLyxNoEvPP+e8YGTPIX8D2w+xQa1szrRTk7aF6tznRcMS/5oRoGTuq3
 Y9KRU9WczJWEK+OOA1oQHuf5GKAbKTz82JTIH3KzHhRZ3F/UAvRzLcqwoJ5c65FLqRHAGdXyNai
 amEATGtKWD7Ctz1PNB3FbK1VQxHp+1/c4N/Jg6RNfVh+/sGPjmMmOU4M2xy7izSZPucPRttoGMa
 vfdqxOo8IjiIZ1gfO/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDIwNiBTYWx0ZWRfXw8CTJZ1EkqGQ
 m8Hh/rsKR42T9CHUMV6XJoa/Ekvsjqa7xj4IzoB3OgJfPqBsPuIXkM/k9l7IaapvCEJAD4O+ktb
 3ypv7YtFAJV8U8wa5Ffh1v6eCXJM6eI=
X-Proofpoint-GUID: Fl-thYdShCN_Ab9iMGdVqVtfHu4SCoLZ
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a52a417 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=GfAy4FA1evO29GI99tgA:9
X-Proofpoint-ORIG-GUID: Fl-thYdShCN_Ab9iMGdVqVtfHu4SCoLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_131416_786056_2CA79FE1 
X-CRM114-Status: GOOD (  15.40  )
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
index d124c194..941f4514 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -362,7 +362,7 @@ int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
 		if (h->first_hwirq <= hwirq && hwirq < (h->first_hwirq + h->num_hwirq)) {
 			hwirq = h->first_hwirq + h->num_hwirq;
 		} else if (hwirq < h->first_hwirq) {
-			if (h->first_hwirq - hwirq < num_hwirq) {
+			if (h->first_hwirq - hwirq >= num_hwirq) {
 				found = true;
 				break;
 			} else {
@@ -370,7 +370,7 @@ int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
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
