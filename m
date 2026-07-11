Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEC1C44501
	for <opensbi@archiver.kernel.org>; Sat, 11 Jul 2026 20:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSabe1QZleRIc/xSFh008o/emAALZDffsWYMiufQdek=; b=ODgO6di6rhxWgv
	/qmplvDBJggBC9QGj3cErGz5Kfn4NEHgsXRQjY4EU5VknuHBJZ9rLTJDfviFiOxM31N8cjLrwrgnu
	2pqUUZ3e72PoyqTQ8mRBpBXP5Jmdn3MfbuUs5CdmDq0+D+en0U17JJgncxp8F+2BTh2CdQXVysfh4
	nLC2gFefwNd+YPdgKdqxhEA4CPJasi8u7+2RvztSiECHe4b6XxRDy/46Bfr30GdSG0Yia8lh2Qu9y
	UiFwn5YZZDRy859jQBHqLE31/W/AkCgwjNLE8I/fHdOtB8dgczNdC6wkXspopuHy0kjFQoSW8Qbw6
	ASrBPaJ1AET01ZCRirxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wie5d-00000006qku-2rf7;
	Sat, 11 Jul 2026 20:14:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wie5Z-00000006qhl-0LkV
	for opensbi@lists.infradead.org;
	Sat, 11 Jul 2026 20:14:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHo0W8333935
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ce1Tpp/y3kt
	Id3AmWlNR+PXs/EnpYga8BOaDi9IoXOk=; b=fdqS0Y1zh7nmoJrDL811aeptqv3
	kGKHoHlnq8HIl0zXeebGnW8wtZPutlylOW5rpU+yctUgT5Lvxk4aNEz0LJTCwMh6
	lL1LLTxAdsq1hh4dLS7HJVStxkAr7L49dE8JcKevk8MwfAtMV+9lNJUlvTCYhVp/
	+EAksjI3K8oiOEeJbfi7VTJ1Kq522NH0sZM9x6tmljCLcncck8M3/Q4dJEWR/0So
	f9nWtlXA8OADhsP/0iSZTyBzTJyCFvY32LM/84Ao77+KXf9sgKbmvXJwOBUlh9n8
	89CL/HwN84VThWfrEI5sWU90OraJ9qgy33yTnxYmTByjXbWU/tvD/6O4NJQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecghhub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:16 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66BKEFBk020593;
	Sat, 11 Jul 2026 20:14:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4fbewjcvku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:14 +0000 (GMT)
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66BKEE7u020588
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:14 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 66BKEEF2020583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 20:14:14 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 9B3F420B95; Sat, 11 Jul 2026 13:14:14 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v3 3/6] lib: utils/irqchip/imsic: embed sbi_irqchip_device in imsic data
Date: Sat, 11 Jul 2026 13:14:03 -0700
Message-ID: <20260711201413.2931099-4-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com>
References: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDIwNiBTYWx0ZWRfX45izcvnK5xSR
 q4+yjmRAzpKUkKXbO9o3qSUpy3WBkbHHgAwfX+A0jy7pv9g0YH1GA2DkCP6yOq66x6CrT56ES6W
 sQuGw/G7+evnVSc/JYt2ck1J1SoWTRo=
X-Proofpoint-ORIG-GUID: oKJgEje8r_LXvvDuWESGoDdjOEvz20Ak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDIwNiBTYWx0ZWRfXwr0SSGfqieFq
 S1zWxTM9JJI7Wtjq43mXGomxNwXWkDOCfMrQFg4iPRECO7L4B2RQXeriYsm/H67MHqaKv19kt+f
 R7iDZ11qHgQYFO6RpdUeJxryVkNR8e5eckJ/ZFwM4FMdGI5bB+Zbk01je00FcVROycdn5Z6v1rH
 z66Sy2cLPvbE9ynqrH+w8eXDIDsgIlLT1vJOV7Jp3IEo8AQk6Rg3HR7d/RoNfxJ6txkB+F+/3oJ
 ogqoOZYAvo1tPrmw42IpClIfG71DZ5KdQEPj1n2MjvSTtz+gZz9cG662MWQvjC84u+id/HbhSKX
 MVQknl2rMVASCXfkmACOwYuvfXRQmoBmkxF3AOsI18wvvYzXJPC1AuOXPq3WByS4AzVpX74KThX
 e8hZjFz6rSRHFRd6cXZvl2OPdY9qTB9tHqzOZbEkzo1/czTf8qt1Dp4wBJiIV5NHU6YtPG1S688
 SZVfO1Kkjt36mk3e6Iw==
X-Proofpoint-GUID: oKJgEje8r_LXvvDuWESGoDdjOEvz20Ak
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a52a418 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=HHyHBDg7fDviSX9V8OAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_131417_238198_768A2CFD 
X-CRM114-Status: GOOD (  16.85  )
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
index 88dd3cfb..ffb62d35 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -12,6 +12,7 @@
 #define __IRQCHIP_IMSIC_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_irqchip.h>
 
 #define IMSIC_MMIO_PAGE_SHIFT		12
 #define IMSIC_MMIO_PAGE_SZ		(1UL << IMSIC_MMIO_PAGE_SHIFT)
@@ -24,6 +25,7 @@ struct imsic_regs {
 };
 
 struct imsic_data {
+	struct sbi_irqchip_device irqchip;
 	u32 unique_id;
 	bool targets_mmode;
 	u32 guest_index_bits;
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
