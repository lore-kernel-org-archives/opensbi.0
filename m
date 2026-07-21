Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DECDC44539
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 21:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9776OvDluB8N03ZJQ34O4Oz0V6YuIeCc1xaKG5wLCo=; b=f/vS9ZtwAJuqTb
	wJ+3axTDPX5LDSdnEtZy+XK31sg29LtJ5d0f0g/5yn84DerGvH5zB+ZkX1z4FP2328Z2WVRW7XRA2
	xpgADyBrqS7Vyv1MwFVb7VKRyoKhxwFLiw9I3RjF3eObuMDPV4UWu1Gb6kWRtzxlcBetl9SptKdlI
	ukdDQP5djrsW3rq0w346ZCyDLb4X+Nt/yIkZnzwwBE3wZ6epmGAlmr3QQAerIx1l0VtVhAJsBySac
	k+dQ+QPgxjxtHk0kC68Lh+c74ibPt1V5XHYHHI344g2hurJ9ot5Vo/WyGnrauX/wt+yiLNHFY/Bh5
	G24I82E2/BhTSG0b8QhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKV-0000000ATYT-3MZQ;
	Tue, 21 Jul 2026 21:48:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKN-0000000ATTo-1jg2
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 21:48:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKmEeg2952774;
	Tue, 21 Jul 2026 21:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h4WG6bTl68W
	WFMAzzmljvCwbGK5yJP8c+mpGUH3VEE0=; b=M6ofWgqv7zKplgVGK/Owgncf9Kg
	IGd73eX38AS0xKCJYNnG170vZEXa/zMEOcWR9u2qwPw82tysdaaFqEUbY3y+WM0q
	N6imIprNGY++4e5zJjR2CuaHew/0BhdJqLr7SZsHqINQla1b3BCVSdOd64NujWxQ
	Cw6TqWX7dG1IUX5Xsfo2jz2VzbTh3BSN6fiW6L9eGk4XN+Eg7hsdGq+GE7Vws3SV
	Wl2+YoHPcGQzJAOUdWN1R2Xn64FWEO3HZqHJmEOwA6/ct8nedyeukt/Qi/7Xao8w
	6hBXzC9hTwD7E6o6Nj51cb3zBra5b6UqtWFH7BC+EPuHZ4WbckORJP3/QlA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d913b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:37 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66LLmaDZ019672;
	Tue, 21 Jul 2026 21:48:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4fhw8n2df4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:35 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LLmZ01019666;
	Tue, 21 Jul 2026 21:48:35 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 66LLmZAj019661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:35 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 8055022193; Tue, 21 Jul 2026 14:48:35 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH v5 3/6] lib: utils/irqchip/imsic: embed sbi_irqchip_device in imsic data
Date: Tue, 21 Jul 2026 14:48:27 -0700
Message-ID: <20260721214833.687361-4-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
References: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfXytPCN5o99+DL
 37QMHe75V0/3A30J+wfPIU/7T/S/YGtpkaacaZy6O+CSJWMoyO9MRhKvTFgbnjdB2WDPTvv2Tox
 5aCHwu5iKM2Gcm7uB3SOga8d9eQUkLw=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a5fe935 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=OVHPlXXDASHD0RnhrCUA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfXyODVlWouahHQ
 YrOlm7eCN71eHnbY+C+YQX9sePQfK1W8anTyrTspHZYDTo2iNRKoVs+p81JwzAv4KdowOCGu9Dp
 /te74V499gXPYKDuNcaJy8FxuXxKBJiiO7pjk/7ZqJkVu+sTMlKMtcgCiNoDUS3WeLlrjYWLs5F
 cVEWP2HpMhzyGx2XGVb4QrJdX1HLjWNYmRVE2mt86syi/Z7uJxZJ5AsTsJM+PSdm9xp+DcbEmSP
 r4LU5sYIoGEJ5PiX+Hr/8MXGNgxamiIkeutbbyzFRG59cUi5jQSdcSJWQr6ghN3OZ2nFLNwJ1Fv
 a/Wa5R+rQ087dbtQgsN3JbxqRXy4IJ/nd2uv+ntDOxkEK4MBSxOrQRSaYhFp/S9aEjMWQx4Cgbn
 E/qz2tfkWSOlJQNfOqJ5p+EygKDFnRLRYmOGWKz5OHkLJ9gtrHIUI5rR612t2e7IUhfZLvsfB5a
 6QKZEXLQwSlkYtX3sBQ==
X-Proofpoint-GUID: jwDXVBdHLKwiGxK6wb5VOQrNAg7MEXHP
X-Proofpoint-ORIG-GUID: jwDXVBdHLKwiGxK6wb5VOQrNAg7MEXHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_144839_561048_76970CE0 
X-CRM114-Status: GOOD (  15.79  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
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
