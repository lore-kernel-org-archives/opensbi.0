Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1DBCD98E3
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39IiilgAd/YTaB1Sp70Gy9yg2cC4syeqKMse2moOiz0=; b=wiBoMKTgUCxzgO
	4FkR21DSH9DZGICEs4tulBfumeIlYQR7/kMl/mXxIfxruo7w6qBLo9DyjhgpG8OXDve08nOs6KRvH
	IKyHymwbbmwTxyoUPrDh0mYLxLlztwSZy9wiVYj0VAiACBKbD88EPqyM5UvBSbg3r3DAd00EvBoMa
	A6FkerP79AEmk9lpf3E2CkadygrxTj6p+CaIIkbf4ujb4wjKXmb7pv/fsMF2zMjQVVzIo7tBOWisr
	eggb+nurlAOISjaAaccYh4hqdqbYYJ9ERv6rAz6+K6hMea45yoUyVGbmV1bfqb4RLy6aAuJYfDRHq
	sMZWXcLTyBBmz25V/1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxh-0000000EdYp-2rvG;
	Mon, 15 Jun 2026 17:19:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxd-0000000EdVD-0mRy
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 17:18:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhZtt430566
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g3IATuwtf/S
	mBO7ggYioHAbIdyJ2CTogTCC/geYkCTw=; b=Nzd5IQ8q6XtY1ITU8QzA3VQqpgU
	iYPi6Jqb+MkSCrFa+IXKWmSQrgM+yNWVAnptcL/qhNFyeujCZ/YoB5qt2iaa01us
	J5X5CSOsAjB666EQyRNMKsgtnADdrWvNbFc+b4GvvafVMMpdhmrcxs4W6E7bCfj6
	j59l/pXHNy6N3of9ay45d8I5TEzXPdkQuKV7xwAO5yaEgYKOcV2JryVS8BG0Ifoh
	zQHcjQYWyV/iBZOWeXzrg03dYnckbu4igME9bGIh10KQsqE20nYoUYghKsonvOdi
	Qxl2KNVQcUUSZC0xRuMfOB6lZL1WzTTyQBA7vaRsIoyh4ZvK5dxaWQ1NqVA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd9yx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65FHItEu005230;
	Mon, 15 Jun 2026 17:18:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4es09je7ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65FHItKd005221
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 65FHIskd005217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id BBA5424EB3; Mon, 15 Jun 2026 10:18:54 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH 5/7] lib: utils/irqchip/imsic: track IRQ enable state and restore EIE on warm init
Date: Mon, 15 Jun 2026 10:18:50 -0700
Message-ID: <20260615171852.447545-6-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
References: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: vslGgG8LckI4giZJv-q8RrJmg4NSZn2p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX5spAqQ4y/2ZW
 +/3TOOv9mNM0QoamYrAGrN6Re6sDOgOA5wKYum+fjSSa8b11Bln+HfvUDqh8b9F8c1q3wXAX94t
 JwjtBh55F5mgWXjtdWcc1JkYDHsH154=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a3033ff cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=CweEwS-LRipKv9jIAnsA:9
X-Proofpoint-ORIG-GUID: vslGgG8LckI4giZJv-q8RrJmg4NSZn2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX8220tweKnEwo
 tmy2/AGTWxDJECkjkl6ja/hHrp6vdDXOrCzOqhuHE4UGDfQtW7sdeA3xAwU6yhpG7p4PEwgS7+U
 z4L6tbjs4/+sswzSNyvEc3H8NqFOV4daA+9a/zgwDKt+uSOB1G2FiS5TBNmupCKmjxXeA8Hg2C1
 6aSdHNL9Mm6Ad9o2n05IBPlgrQzcp2s5eiuvjhVOEoa4Go7O3gYJ8oMHWmTI+ZImQ0KTd8otHOV
 IvtZEzcpyL8ymiRqGl9U7lL1guhRMKoQX8npv2S8PvzF7shzBXZm2D1u/jRW/OlvMjVymHLBIZc
 ovUcyy7ofEqzbiWFJjr9vQVPWtOXhqkagTMoQ6pyw0x9ghdasFRjgMFdLlC+MCdfJg4iOjWKRsY
 jzhZKn5H5aIXBmnRNfK5s4pO4qmHsSkv/zVm0cHAW5MhChDK4hA4CR5sPL9bk3/ZEvVN83rjxA0
 xQM8fGcaUjnur3W6sKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_101857_229247_32A516E1 
X-CRM114-Status: GOOD (  21.31  )
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
 lib/sbi/sbi_irqchip.c     | 25 ++++++++++++++++++
 lib/utils/irqchip/imsic.c | 55 ++++++++++++++++++---------------------
 3 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index a695ecc5..afcbf59c 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -163,4 +163,8 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
 /** Exit interrupt controllers */
 void sbi_irqchip_exit(struct sbi_scratch *scratch);
 
+/** Check if the interrupt is enabled */
+bool sbi_irqchip_is_irq_enabled(struct sbi_irqchip_device *chip,
+					       u32 hwirq);
+
 #endif
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 6d0df02e..49fa4806 100644
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
 };
@@ -52,6 +57,21 @@ struct sbi_irqchip_hart_data {
 static unsigned long irqchip_hart_data_off;
 static SBI_LIST_HEAD(irqchip_list);
 
+static inline u32 sbi_irqchip_get_irq_state(struct sbi_irqchip_device *chip,
+					     u32 hwirq)
+{
+	if (!chip || !chip->hwirqs || hwirq >= chip->num_hwirq)
+		return 0;
+
+	return chip->hwirqs[hwirq].irq_state;
+}
+
+bool sbi_irqchip_is_irq_enabled(struct sbi_irqchip_device *chip,
+					       u32 hwirq)
+{
+	return !!(sbi_irqchip_get_irq_state(chip, hwirq) & IRQ_ENABLED);
+}
+
 int sbi_irqchip_process(void)
 {
 	struct sbi_irqchip_hart_data *hd;
@@ -79,11 +99,16 @@ int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
 
 int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
 {
+	struct sbi_irqchip_hwirq_data *data;
+
 	if (!chip || chip->num_hwirq <= hwirq)
 		return SBI_EINVAL;
 
 	if (chip->hwirq_unmask)
 		chip->hwirq_unmask(chip, hwirq);
+
+	data = &chip->hwirqs[hwirq];
+	data->irq_state = data->irq_state | IRQ_ENABLED;
 	return 0;
 }
 
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 5d628901..6ca43bc7 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -223,29 +223,20 @@ static struct sbi_ipi_device imsic_ipi_device = {
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
@@ -273,13 +264,14 @@ void imsic_local_irqchip_init(void)
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
@@ -289,11 +281,16 @@ static int imsic_warm_irqchip_init(struct sbi_irqchip_device *dev)
 		!hart_imsic->targets_mmode)
 		return SBI_EINVAL;
 
-	/* Disable all interrupts */
-	imsic_local_eix_update(1, imsic->num_ids, false, false);
+	/* enable interrutps based on the irq state */
+	for (i = 1; i < imsic->num_ids; i++) {
+		if (sbi_irqchip_is_irq_enabled(&imsic->irqchip, i) == true)
+			imsic_local_eix_update(i, true, true);
+		else
+			imsic_local_eix_update(i, false, false);
+	}
 
 	/* Clear IPI pending */
-	imsic_local_eix_update(IMSIC_IPI_ID, 1, true, false);
+	imsic_local_eix_update(IMSIC_IPI_ID, true, false);
 
 	/* Local IMSIC initialization */
 	imsic_local_irqchip_init();
@@ -393,8 +390,8 @@ static void imsic_hwirq_cleanup(struct sbi_irqchip_device *chip, u32 hwirq)
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
 
 	sbi_printf("imsic_hwirq_unmask: hart=%lu eiid=%u\n",
 		   (unsigned long)current_hartindex(), hwirq);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
