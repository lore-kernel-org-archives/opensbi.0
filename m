Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE960CD98E4
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoSdiRxlIH6ce1HclvWcKzn/lEFh9fUmkp1o821G46c=; b=jTNTH/FsZmZKIV
	DQAjt17zNpuzRB4OBxOoxGVuOJ80Iez7S1veR+T3Gb/YstBL2VPMxy1KXDCl/l6MtQybWC/rLADOU
	/U1gFi6tdLwaWEfVgWfdAOrZnXbXoUf2OcIHL9jO6dY/SEV7fnCEe1DZQG1vzleBZ8FbvszfEN1lv
	1ztphNm0D+SxUyT8CHiNnZFhqUxrUj7bzS5Qg2PFHCEbwWRXwQnKWqfe/d8r7mPcBpRp0XGw9l2wU
	ykiU+30YfI3cYEjqyrbqnnNq9pExN2pdU6z50ozqCBcmqWmXqDB3gGwZluXJijuGdH3J5gJUEOlgK
	MeRTGOeZDBQzsj67OkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxh-0000000EdYN-1tmC;
	Mon, 15 Jun 2026 17:19:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxd-0000000EdVC-03iD
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 17:18:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhPt4414048
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9QxPJFQkaMJ
	gAW/b3NaPF78mXvT68Fe6/+SB8jrQm6Q=; b=DB9bIt4aookh1+1KAfb0Y4rCyMQ
	nNupH79S7bkqFG06Euh1l8zUCVYTn/mN7zrjZ8ZCl4+0C4I9lgGuym7MPYLLvcBU
	NAxnMn+d+qbrhHPucRpusU/pIsfS6r38UtF7cXh+tlFVBBvdv6Ps+3olPe+/1uDa
	W4lCKZlnVSAGaqtBTe0LXgoBI4oJVSC0dg7tV3YBYIN8qc+ZWkXJ1UTsDhyynXba
	C1OqpTztmCSxx/rTTNZLa7gKlrhsMH4FnnuZ02ivQ/An7BVDGWbbCxTruiVb9eRW
	UeIfBxokHdxtrUoXHcEelt4SBDGcplHxS/+J572XfcBaoXQSk+vEYJGoCuA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter01yu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65FHItGi014672;
	Mon, 15 Jun 2026 17:18:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4etk129hhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65FHIsNn014652
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:54 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 65FHIs8U014649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 17:18:54 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id B34CC24E58; Mon, 15 Jun 2026 10:18:54 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH 3/7] lib: utils/irqchip/imsic: embed sbi_irqchip_device in imsic data
Date: Mon, 15 Jun 2026 10:18:48 -0700
Message-ID: <20260615171852.447545-4-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
References: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Q9duZeq7VVG2jpXcEJp5ZLlu_8pZ6aCF
X-Proofpoint-GUID: Q9duZeq7VVG2jpXcEJp5ZLlu_8pZ6aCF
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a3033ff cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=HHyHBDg7fDviSX9V8OAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX43/bhq67NvfS
 7iKzJyJ0tpQxWbIgR23oV//FxdD0IxdvNDFHblv/X6Lz3T6ZiNa9zVArCjDHIjJxJTuRLCxSued
 v6mdIIElSr587JT0u3l7O8B7iTGeC7b376idP4+u2dazakY+zHHSfD7yv2LyMJB8pt/dl6f6zOY
 JS0YxKGTNZHev8D2FnDxpx+FgFITqyhV/5wk9pq4a35NkgdC1+5W8pODrzZMaQoGegy3qmxjEzC
 p1/x2Lz0WYbwiiXGVfsNXBQ/UFfDbvH50TIidr7kAS1T48o9/ArGi4bAXiwRJLm37+mGWY7zHqM
 2SJwaNPoo0Yl6EipAQJX7XePbDPLzVkDeEKFdv73+bnu+vLFVucrJv8y+fRbPfW24lnSBLb2Esv
 r2Zm1cYo9m4474BfdD0JhjtLyQ8BayKKJGGPkrJmg/PQVPsAJ5RIaYjAI8cu8DE9vFyYtUzzEYs
 XsESv95TlFukG4Y5jog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX2aK4VRnMfV84
 eEsEjyUG1com7fIewZLuzTEiUKfQpAeXDh9vz4WN5L0KAhL4NKYDsRE0VxFokHSt0AMs09woqh+
 b5FmgVls3pHW0i/pZKq0ojM40hNEKlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_101857_057507_AA356012 
X-CRM114-Status: GOOD (  16.52  )
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
