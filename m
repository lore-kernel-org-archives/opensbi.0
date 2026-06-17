Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F349BCD98F3
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoSdiRxlIH6ce1HclvWcKzn/lEFh9fUmkp1o821G46c=; b=VEMaCxXvOlrOGv
	vJl0nV6w+TIsU9uBobBoyK2TOtfGr5WN5fsMtsvRvVPnd+rhpZZr8S5Y0Qyz9dzJtjpk5cT2b1Cb9
	3zQicX6IUK8tPypIUdksoUIcKdQVJiST1X2VKLHdQx3//5E36suTPvvB+DS5SkGnPj32+rSs95TYV
	ivvOcb4sBrlcancD5p5NmTgbHgL/pYhswFe7nfQfZ3NYuI5oEx+32jLzsNgZUVOKjcSREghhu4PZM
	KAJBevO5CfhcI/+mQZerHk9OHMlK92ReLQpyq5zgdcrpxfg9oYKWswc+jFfcbcgB9NGJZr/LKU+xR
	bpgZ+LapswxMcWvpYmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvC2-00000000B5r-1dgt;
	Wed, 17 Jun 2026 18:40:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvBz-00000000B3K-2ZuF
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 18:40:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHdxwm3261039
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9QxPJFQkaMJ
	gAW/b3NaPF78mXvT68Fe6/+SB8jrQm6Q=; b=WXIlntS/+zIjQuUzm4AYmkgLI4A
	DjpVh8csDTkSVO35Aqv9uCkw0qJYydrRa1JX/w0CICmx9GurOmiOjUMox4GassYd
	riQjvO4ysFO1Sb5XDR57UCM0rMoe3S+k1V8aPIRt0qO5QIz6TyGtqjbrMiFwePwo
	DXU1R8r8GSw1CdrHyVAqDX/vgqMBE8jpiem9OxH2UQloVyKd8feJWA4CpLzHZQK5
	PaLzus15c/CIR824B/wMxEqtXru1SJQCKvck/cQ1Oo3sFii7h6eojY0Ez7NjiZuU
	0e+5SePb4Uj/iKFWz4SJZyn/XQEqmZTpxH/45ML44t63ls5ipbdcjog/TqQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees4wdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:50 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HIen0h009973;
	Wed, 17 Jun 2026 18:40:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4eu371rydc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65HIensM009956
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 65HIemv0009949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 18:40:49 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 2514D24E49; Wed, 17 Jun 2026 11:40:49 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 3/6] lib: utils/irqchip/imsic: embed sbi_irqchip_device in imsic data
Date: Wed, 17 Jun 2026 11:40:35 -0700
Message-ID: <20260617184047.70388-4-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com>
References: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: wTLby_g9MXytMTPhb2G378yZoieH1eDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE4MCBTYWx0ZWRfX3geuXNZMTQYH
 jCdZoMn6gzqZAL4qLYmYUnrsKzMpB9b4NvCS8SEdwXO++0oq64b8dk4eQKrZAmS30kn1Y2gkEc3
 AUjlrTmfLnG0oeJWSKlt52lrTAHGGVyu7s20IL/2ldSaFiWVChT90oqEhtG+H2NYgCi5Dxz1P8f
 CNxUkOpjBVQd0bLl8xXiQl4B8m0pFZReefuDfLXtndnhSRNuy+kMXceOkEAIceOLhBzKhN7f/Gk
 7J0+fTKrg5KYKmOYomIs9hThtoeaYwtzP/nf+jD9oxcYT09HR23jNSSb+tLrx+Cb14T4ulHMsF2
 peQTccpUktQyVe87fLSPZtmJnvcPc9d+jXodEMWrRQJZiE+PsVyq3R5J3hXKNFG4GgM1vpz82A0
 xpGlITJ5EFD1Qjr1SVounGVwprFyAJaYijuXW4+50xZbwueU6n7cUg9hgUmfG0Z6vah1D2PpT2H
 REncqvUIcKLsyC2maog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE4MCBTYWx0ZWRfX/pEJNGz4ACY7
 I443HOKeQGRUbYPawlTeR/e4Idd6XFJdmQhdg8Sk4JkVhDlQlH599VSh4oXNnPQ5Fd733KXn9A3
 bepiQLo7PqLJ57PiQCq3qpj4gkOex0U=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a32ea32 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=HHyHBDg7fDviSX9V8OAA:9
X-Proofpoint-GUID: wTLby_g9MXytMTPhb2G378yZoieH1eDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_114051_763749_132DC6AB 
X-CRM114-Status: GOOD (  15.72  )
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

Embed sbi_irqchip_device in struct imsic_data to enable instance-based
irqchip registration, replacing the previous global imsic_device
singleton. Include sbi_irqchip.h from imsic.h to make the embedded
struct visible to consumers.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi_utils/irqchip/imsic.h |  2 ++
 lib/utils/irqchip/imsic.c         | 25 ++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/sbi_utils/irqchip/imsic.h b/include/sbi_utils/irqchip/imsic.h
index 88dd3cfb..1910b62a 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -12,6 +12,7 @@
 #define __IRQCHIP_IMSIC_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_irqchip.h>
 
 #define IMSIC_MMIO_PAGE_SHIFT		12
 #define IMSIC_MMIO_PAGE_SZ		(1UL << IMSIC_MMIO_PAGE_SHIFT)
@@ -25,6 +26,7 @@ struct imsic_regs {
 
 struct imsic_data {
 	u32 unique_id;
+	struct sbi_irqchip_device irqchip;
 	bool targets_mmode;
 	u32 guest_index_bits;
 	u32 hart_index_bits;
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 0e7f3e6b..2abdc8ef 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -149,8 +149,13 @@ int imsic_get_target_file(u32 hartindex)
 
 static int imsic_process_hwirqs(struct sbi_irqchip_device *chip)
 {
+	struct imsic_data *imsic;
 	ulong mirq;
 
+	imsic = container_of(chip, struct imsic_data, irqchip);
+	if (!imsic || !imsic->targets_mmode)
+		return SBI_EINVAL;
+
 	while ((mirq = csr_swap(CSR_MTOPEI, 0))) {
 		mirq = (mirq >> IMSIC_TOPEI_ID_SHIFT);
 
@@ -258,10 +263,15 @@ void imsic_local_irqchip_init(void)
 
 static int imsic_warm_irqchip_init(struct sbi_irqchip_device *dev)
 {
-	struct imsic_data *imsic = imsic_get_data(current_hartindex());
+	struct imsic_data *imsic;
+	struct imsic_data *hart_imsic;
+
+	imsic = container_of(dev, struct imsic_data, irqchip);
+	hart_imsic = imsic_get_data(current_hartindex());
 
 	/* Sanity checks */
-	if (!imsic || !imsic->targets_mmode)
+	if (!hart_imsic || hart_imsic != imsic ||
+		!hart_imsic->targets_mmode)
 		return SBI_EINVAL;
 
 	/* Disable all interrupts */
@@ -399,16 +409,17 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 	}
 
 	/* Register irqchip device */
-	imsic_device.id = imsic->unique_id;
+	imsic->irqchip = imsic_device;
+	imsic->irqchip.id = imsic->unique_id;
 	imsic_device.caps = SBI_IRQCHIP_CAPS_MSI;
-	imsic_device.num_hwirq = imsic->num_ids + 1;
-	sbi_hartmask_set_all(&imsic_device.target_harts);
-	rc = sbi_irqchip_add_device(&imsic_device);
+	imsic->irqchip.num_hwirq = imsic->num_ids + 1;
+	sbi_hartmask_set_all(&imsic->irqchip.target_harts);
+	rc = sbi_irqchip_add_device(&imsic->irqchip);
 	if (rc)
 		return rc;
 
 	/* Mark hwirq 0 and IPI hwirq as reserved */
-	rc = sbi_irqchip_register_reserved(&imsic_device, 0, IMSIC_IPI_ID + 1);
+	rc = sbi_irqchip_register_reserved(&imsic->irqchip, 0, IMSIC_IPI_ID + 1);
 	if (rc)
 		return rc;
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
