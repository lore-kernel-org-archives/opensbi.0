Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D469C44529
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 21:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eDiQ4p7nE0JUE6lhZv2iq1IVbRhGtjyf3y11INZkSo=; b=D3/8HspHriAnFE
	LuH82BrA6GRpOpub/lyjLYwzo1rA/r+rww5dFDJ7F69oDxgG6w0R+QIXdxjiDFdLkIp3xyFEltsLa
	AQ3v5DunRA8axlUic37bkOhPOwOuXMljtaFzAJynMGtYB7Ha5Q/ol68D8Rprk2fpnG+skrnEEsWGf
	x9NW36yG5GkI8ibhgOZxJtKKUMpFwFBEGmHr1audBL4a6qgb7Vk1nyttybHzjebbuKlP8LmEd7W2C
	AfXjEZKEZwu34Cg6ZULtCDSFLbi0ytGnYxY7+iEwh80OUe9EeqgvKKBnuHmUa4tbeBFcQ94ApnYDd
	7qgYQ6PvuGfeSTgDrmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDT-00000007umL-2nNy;
	Mon, 20 Jul 2026 21:07:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDQ-00000007ukU-1My5
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 21:07:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTmAO3753620;
	Mon, 20 Jul 2026 21:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yQiJz5btWSX
	kTQsjMt9UqPMM/e7MLG+qHXQdwaN4b98=; b=pjmU48dyKQAS9pmNionkI5ZYFqo
	qKNsqop42rBmAjr5ZDFH33X5kK7Ywy3eHsRd4yyt6jhP0pdpk2zrAE64Wc3HlMH+
	0LKESpK/2lN0wQKw/RkJN9QGncQRfBKWk3AhAD33zGZtVkd8GlNvonWGn+c5oxUk
	GM+6x7rzihWGwcqhPAGSsNf6Nd2wsC2O/mm9dTYewNIRtVzD82wbCu51V9epoINr
	O/m1ZRfeYoGQ1ETl1Gjz7bCQYSFtivRNm86V2VuJDiZt2pB60DLr2XutvGXcL28S
	uCGKJaPghsDSidC/XLbY9m45t35CI3gcr1a4bjZywRFyCT5qohjCks5VdEw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5rwds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:55 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KL6O6M025038;
	Mon, 20 Jul 2026 21:07:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fh85yrvy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:54 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KL7sTU027393;
	Mon, 20 Jul 2026 21:07:54 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 66KL7rmX027390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:54 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 36EAB24DFB; Mon, 20 Jul 2026 14:07:53 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH v4 6/6] lib: sbi_irqchip: fix MSI EIID gap and tail allocation logic in register_msi
Date: Mon, 20 Jul 2026 14:07:46 -0700
Message-ID: <20260720210748.2893688-7-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
References: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfXzdHIgLvQLz0L
 QEEYXX/YknQI9zD9o1kEMXKPdf1wN+tZX0S956Nes43tWYWF3cY+kudNPdHmI0nwaVXy+yCPIRu
 92ScKzhVzkfb8Uo/IDmgmuflWiGgmmKc1x/4ZoL+Mj5BZTx/sB63aphCMiuWLAV7rLRZJhQI8ho
 TMEzH+jRF56Ys6m9NGv/MMJ56Tc0ViTxcS5ymzk7ageT8YWNZPUm+eUso6yhffHEph8u2ySb+LE
 WmKbXBCIND1RhTRApEf0o4znyz0bhKHESlbLCmoHxt7XE2YNaUX19z6nlqP4IgV983uhyYcQxom
 0suvTIBtlVz+7vYVqH04mFG5ajDhX/4HQiTrLCPxaqcN8UGQOmzrrlGNRI4HlebPu+W+iep+xxf
 v1N8If1L3pc1vquYBPvVQZqnCN7xNV5rXipzfepxJAzsk1dcbsyr5PLDQqOVWsHYNSqbp+XJWGe
 ty7PkNAlJbDXGmrTteg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX+fZGOkaM5Kcg
 5+Jf63jtrewmcZFJb7kBvf/0wg4YyfAFq5LnD4QRDZ/zwqAOuXXuQ20mY5QIyWtHzcQcP9E/8oB
 KNnps7qhkpWrXWPXoOU8o6cE/GCzfZ8=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5e8e2b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=GfAy4FA1evO29GI99tgA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: c2C8vhbyvfgxh48WthDqHDynvsn7hKSg
X-Proofpoint-ORIG-GUID: c2C8vhbyvfgxh48WthDqHDynvsn7hKSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_140757_403934_ACAFDEC8 
X-CRM114-Status: GOOD (  14.66  )
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
index 9d14c39e..07e4b0f5 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -369,7 +369,7 @@ int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
 		if (h->first_hwirq <= hwirq && hwirq < (h->first_hwirq + h->num_hwirq)) {
 			hwirq = h->first_hwirq + h->num_hwirq;
 		} else if (hwirq < h->first_hwirq) {
-			if (h->first_hwirq - hwirq < num_hwirq) {
+			if (h->first_hwirq - hwirq >= num_hwirq) {
 				found = true;
 				break;
 			} else {
@@ -377,7 +377,7 @@ int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
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
