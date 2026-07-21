Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CD2C4452D
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 21:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4e6gXl51B/wYppmQN41KA3EvHyoQZxHkGH4juG9NUxY=; b=ZD42eq5tN1HYVN
	fPTJw5VNolDnN9MqAonoQvv/mNLDZsKb8kz7F5Tl2GO+YE4gFmd0/oG+wvr5IkPPPG289XeE98wGp
	tFR+kfRkYwAdTP7OaTEFFuzVI6EZ7W/kGcIe4sL33vK8AGAkYZoW+LaaUaupvi5rnS0RnRBtoUGf8
	AjVzk2f9/yPBLKzqiFKF5pDWzl/X0MOgRkeevpijo1fSkeQQmY3akg9AZZC4RzsgAL1jdyuQwujGC
	SoDj3IsoxJnjBI38UEkPGMkzIKl0/k32CBkhFp4KcDUzj4W/vTcINKKrHlCoZ+yh21MAqphBggc2U
	DtuUzTTKiyYRe3vA3sWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKP-0000000ATVg-2Kt5;
	Tue, 21 Jul 2026 21:48:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKM-0000000ATTj-2xd5
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 21:48:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlPOj2392044
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hoIlkdXzu5r
	zaItK235ZshLneIE5JNK0d3EO/fHpzAQ=; b=F0mi5g2mgQ+q1o9FB9s6I8czc+g
	UdgK9hLsyGsvnUaECsYi1csfAt4pqO5TiCD26KTOErpbV7zrIwekFk9xVC8HePmZ
	aVUQRUlycaw9Y2EO6vsmcx+37P26At+PMLKObpxl6eQrfzDu4Q82z5Az8BD4yO10
	C5YnFt1KVVh5WhOZOg5PFx4G8vwJSgtM7E0y143KgvGAU9ISjNFdb6S+3c390mdr
	fwiRCRu6OEY1qzyudpJn4Vu03c54RmB6XP6oRfuTVLjbLBdg+YW4nsb7J4uUXk3/
	9JoGVrncfUGv//OsWvZawmnan1b1i7OHRsykZ6HYTIN9/5PcIt1XS/vrn5A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fs1y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:48:37 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66LLmaNj021797;
	Tue, 21 Jul 2026 21:48:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj6ju8gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:48:36 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LLmaXo021788
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:48:36 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 66LLmZvc021768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:36 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 8AF8424E1D; Tue, 21 Jul 2026 14:48:35 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v5 5/6] lib: utils/irqchip/imsic: track IRQ enable state and restore EIE on warm init
Date: Tue, 21 Jul 2026 14:48:29 -0700
Message-ID: <20260721214833.687361-6-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
References: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: PI2WxK1btfcZQxO7lZdeRcRcdmZl3Yw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfX+DENdky0/izw
 yZipHW6ndM+sCbVwTfEhfV+my1myFJa63zldh+jgX1/ocgFjdImGBmZop6g2f4GhXEW8/KuHdlm
 xX56pobHEzm3yu/8OSk1RTH/gpLYRHfLwgmHUkQ63HTp3ugm+dE2QJtsWmSi6mIiN8UVSAtFQ4g
 GM27stlr/VVeEF6rwtdrFcSx8b7u+7KRCgIcnGCKcG7PXqlmhrl1rRyp62/dmPrxSXW00GjQKe5
 CLcUlFJLz8SoFGQSiWy00tWLS+KTJ0fNF/DH/z2SNkWUnZ2NJFx/GXpiQ/M4QcAIC2+KJBkqPhn
 4SYW4g2hAKRIhmkoIQus5fKRuIUq2raYToPD+Ds2PP1eOjIJybHIDZIHqoaYRwMVM+eJtvqTA9V
 GrmUyZ09yba6iHM3l3n2il73tk2UvkiuIkQwVBYYmB9GrchCuer8FbG6YENhjM5JHWdezq8P3YW
 DilvXz2GMWgsPznKEIg==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5fe935 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=BZdgoSmlrKO2RibLiLQA:9
X-Proofpoint-ORIG-GUID: PI2WxK1btfcZQxO7lZdeRcRcdmZl3Yw7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfX1F2NMm7f5oOY
 34+3XN+DZKQ3reFZ/KsxfzX0FYIKVIi8Z83cwT97huv3S8gpgYWNcYEbbdJAh/jxCJK4VW0FGKC
 YRDF3Jb7WyYH8ZvO3ozcUOe7INZ0zX0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_144838_755327_E48CA523 
X-CRM114-Status: GOOD (  20.91  )
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

Add an irq_state field to struct sbi_irqchip_hwirq_data with a single
IRQ_ENABLED flag (bit 0) to track whether a hardware interrupt has been
enabled via the irqchip framework. Set IRQ_ENABLED in
sbi_irqchip_unmask_hwirq() when the unmask callback is invoked.

Add sbi_irqchip_get_irq_state() as a private inline accessor and expose
sbi_irqchip_is_irq_enabled() as a public API for drivers to query the
enabled state of a hardware interrupt by chip pointer and hwirq number.

Refactor imsic_local_eix_update() to operate on a single interrupt ID
instead of a base+count range, simplifying the CSR bit manipulation to
a direct BIT(id) write without the inner loop. Update all call sites
accordingly.

Use sbi_irqchip_is_irq_enabled() in imsic_warm_irqchip_init() to
restore per-EIID EIE CSR state on warm boot and HSM resume based on
the saved irq_state, replacing the previous blanket disable of all
interrupts. This ensures that EIIDs enabled during hotplug/warminit
cycle are correctly re-enabled on the resuming hart without requiring
software to re-register or re-unmask each interrupt.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h |  4 +++
 lib/sbi/sbi_irqchip.c     | 36 +++++++++++++++++++++++++
 lib/utils/irqchip/imsic.c | 55 ++++++++++++++++++---------------------
 3 files changed, 66 insertions(+), 29 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index ea012635..f3ae9a13 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -168,4 +168,8 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
 /** Exit interrupt controllers */
 void sbi_irqchip_exit(struct sbi_scratch *scratch);
 
+/** Check if the interrupt is enabled */
+bool sbi_irqchip_is_hwirq_enabled(struct sbi_irqchip_device *chip,
+					       u32 hwirq);
+
 #endif
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 12d4e272..d5f47a05 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -20,6 +20,11 @@ struct sbi_irqchip_hwirq_data {
 	/** raw hardware interrupt handler */
 	int (*raw_handler)(struct sbi_irqchip_device *chip, u32 hwirq);
 
+#define IRQ_ENABLED	BIT(0)
+	/** interrupt state
+	 * bit 0 - 1: enabled, 0: disabled */
+	u32 irq_state;
+
 	/** target hart index */
 	u32 hart_index;
 
@@ -80,23 +85,54 @@ int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
 	return data->raw_handler(chip, hwirq);
 }
 
+static inline u32 sbi_irqchip_get_irq_state(struct sbi_irqchip_device *chip,
+					     u32 hwirq)
+{
+	if (!chip || !chip->hwirqs || hwirq >= chip->num_hwirq)
+		return 0;
+
+	return chip->hwirqs[hwirq].irq_state;
+}
+
+bool sbi_irqchip_is_hwirq_enabled(struct sbi_irqchip_device *chip,
+					       u32 hwirq)
+{
+	return !!(sbi_irqchip_get_irq_state(chip, hwirq) & IRQ_ENABLED);
+}
+
 int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
 {
+	struct sbi_irqchip_hwirq_data *data;
+
 	if (!chip || chip->num_hwirq <= hwirq)
 		return SBI_EINVAL;
 
+	data = &chip->hwirqs[hwirq];
+	if (sbi_irqchip_is_hwirq_enabled(chip, hwirq) == true)
+		return SBI_EALREADY;
+
 	if (chip->hwirq_unmask)
 		chip->hwirq_unmask(chip, hwirq);
+
+	data->irq_state |= IRQ_ENABLED;
 	return 0;
 }
 
 int sbi_irqchip_mask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
 {
+	struct sbi_irqchip_hwirq_data *data;
+
 	if (!chip || chip->num_hwirq <= hwirq)
 		return SBI_EINVAL;
 
+	if (sbi_irqchip_is_hwirq_enabled(chip, hwirq) == false)
+		return SBI_EALREADY;
+
 	if (chip->hwirq_mask)
 		chip->hwirq_mask(chip, hwirq);
+
+	data = &chip->hwirqs[hwirq];
+	data->irq_state &= ~IRQ_ENABLED;
 	return 0;
 }
 
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 40bffcc0..82a74f43 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -225,29 +225,20 @@ static struct sbi_ipi_device imsic_ipi_device = {
 	.ipi_send	= imsic_ipi_send
 };
 
-static void imsic_local_eix_update(unsigned long base_id,
-				   unsigned long num_id, bool pend, bool val)
+static void imsic_local_eix_update(unsigned long id,
+				   bool pend, bool val)
 {
-	unsigned long i, isel, ireg;
-	unsigned long id = base_id, last_id = base_id + num_id;
-
-	while (id < last_id) {
-		isel = id / __riscv_xlen;
-		isel *= __riscv_xlen / IMSIC_EIPx_BITS;
-		isel += (pend) ? IMSIC_EIP0 : IMSIC_EIE0;
-
-		ireg = 0;
-		for (i = id & (__riscv_xlen - 1);
-		     (id < last_id) && (i < __riscv_xlen); i++) {
-			ireg |= BIT(i);
-			id++;
-		}
+	unsigned long isel, ireg = 0;
 
-		if (val)
-			imsic_csr_set(isel, ireg);
-		else
-			imsic_csr_clear(isel, ireg);
-	}
+	isel = id / __riscv_xlen;
+	isel *= __riscv_xlen / IMSIC_EIPx_BITS;
+	isel += (pend) ? IMSIC_EIP0 : IMSIC_EIE0;
+	ireg |= BIT(id);
+
+	if (val)
+		imsic_csr_set(isel, ireg);
+	else
+		imsic_csr_clear(isel, ireg);
 }
 
 void imsic_local_irqchip_init(void)
@@ -275,13 +266,14 @@ void imsic_local_irqchip_init(void)
 	imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_ENABLE_EIDELIVERY);
 
 	/* Enable IPI */
-	imsic_local_eix_update(IMSIC_IPI_ID, 1, false, true);
+	imsic_local_eix_update(IMSIC_IPI_ID, false, true);
 }
 
 static int imsic_warm_irqchip_init(struct sbi_irqchip_device *dev)
 {
 	struct imsic_data *imsic;
 	struct imsic_data *hart_imsic;
+	int i;
 
 	imsic = container_of(dev, struct imsic_data, irqchip);
 	hart_imsic = imsic_get_data(current_hartindex());
@@ -291,11 +283,16 @@ static int imsic_warm_irqchip_init(struct sbi_irqchip_device *dev)
 		!hart_imsic->targets_mmode)
 		return SBI_EINVAL;
 
-	/* Disable all interrupts */
-	imsic_local_eix_update(1, imsic->num_ids, false, false);
+	/* enable interrutps based on the irq state */
+	for (i = 1; i < imsic->num_ids; i++) {
+		if (sbi_irqchip_is_hwirq_enabled(&imsic->irqchip, i) == true)
+			imsic_local_eix_update(i, true, true);
+		else
+			imsic_local_eix_update(i, false, false);
+	}
 
 	/* Clear IPI pending */
-	imsic_local_eix_update(IMSIC_IPI_ID, 1, true, false);
+	imsic_local_eix_update(IMSIC_IPI_ID, true, false);
 
 	/* Local IMSIC initialization */
 	imsic_local_irqchip_init();
@@ -395,8 +392,8 @@ static void imsic_hwirq_cleanup(struct sbi_irqchip_device *chip, u32 hwirq)
 	if (!imsic || !imsic->targets_mmode)
 		return;
 
-	imsic_local_eix_update(hwirq, 1, false, false);
-	imsic_local_eix_update(hwirq, 1, true, false);
+	imsic_local_eix_update(hwirq, false, false);
+	imsic_local_eix_update(hwirq, true, false);
 }
 
 static void imsic_hwirq_eoi(struct sbi_irqchip_device *chip, u32 hwirq)
@@ -535,7 +532,7 @@ static void imsic_hwirq_mask(struct sbi_irqchip_device *chip, u32 hwirq)
 	if (!imsic || !imsic->targets_mmode)
 		return;
 
-	imsic_local_eix_update(hwirq, 1, false, false);
+	imsic_local_eix_update(hwirq, false, false);
 }
 
 static void imsic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
@@ -552,7 +549,7 @@ static void imsic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
 	if (!hwirq || hwirq == IMSIC_IPI_ID)
 		return;
 
-	imsic_local_eix_update(hwirq, 1, false, true);
+	imsic_local_eix_update(hwirq, false, true);
 }
 
 static struct sbi_irqchip_device imsic_device = {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
