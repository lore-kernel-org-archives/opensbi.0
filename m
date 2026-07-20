Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970B2C44531
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 21:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/vF/H8rY1FiRDcY7bpDlDcZnocdJX5k9x02xJjrh+8=; b=wTJoHPpglqep7R
	FQSUofInDIEw+9heORY6NKe/MjNru0l5f6LGzdmUNzcSikFg0wpBCe4KncDeIGedhrRMXOHI9nkS2
	vZD0SoDAxFNVTf73aXichhgacFdzZgzZurnnKSL9PdVNWA0mAXBrOZjkjnZpN4xCpiyv49P1zXTUJ
	qtQ5LolJtel1mSXv/nMB5S5X22qwMxpMtmDBfB/o6QjxFaZJw2bKgeadAoUpcL/NgO5AZ7q/SaXw6
	H5mFg1q2Py3gkHeBN/3XuQu1NbgtU1oi3aTcR6cIZaxUAvYpWEfC72vo7q98KGtUEvoXpqSlyS2vD
	2qnL2NhUc5X0VPDaw2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDW-00000007uoE-3X7A;
	Mon, 20 Jul 2026 21:08:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDQ-00000007ukR-2qnD
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 21:08:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTtU23638015
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UtmLpn+XKxA
	2D6svFtkiPCmbjS04r+J4psHcpY28lns=; b=FF6kNy5dZUh6ZMs7JCmyQosl49L
	80s9SPpmms+C0xArJclDKEWQjlExREi8kXdhhQbH5htTZgriaAAlf6KxMw/Vr1SQ
	Ypi+KhayhKAS1tSSJ4W0qfL60EKtW1lh07+7SHetJVwSfVcU7vAp/n8PnbJO4YJl
	hydy8dwZSKzsdlojoxJ5tzzyE78qHC5jLMPONjaVraof0l+lFdj98o7PBc4mk2LO
	ndAEAayjEl8yhTv/ODTdOgA+pdABAxpcWfrx9DhWwjsseDgEKHqdmRvzCAcP8uCe
	uQRglWIk46zYEzZRgCYcRf1wbIMCd+K5ezhB2trRlzckJBzCW5mVXxf66Sg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgytvex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:55 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KL6LlS028282
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4fgj4d817m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:53 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KL7rnB030359
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:53 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 66KL7rQw030358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:53 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 32C3023E9D; Mon, 20 Jul 2026 14:07:53 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v4 5/6] lib: utils/irqchip/imsic: track IRQ enable state and restore EIE on warm init
Date: Mon, 20 Jul 2026 14:07:45 -0700
Message-ID: <20260720210748.2893688-6-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
References: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX/jztpqbec1AW
 Ju1tI4K3RyPnMi5YGslfoPHCYap1xkqLhs7ZNR+Jakpn4ZrBzPafBEmhcBMNfp1AADyYRmHN9da
 um0osorvvLJsnV95wPSZU25RvZGQucU=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e8e2b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=BZdgoSmlrKO2RibLiLQA:9
X-Proofpoint-ORIG-GUID: wrX499Er7grYgka6hFptptOJWeST3Rkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX/BSe04noiaY3
 Rf4ABpyVOGL85fCJok6VSvffoHBq2Gzuu5fIYOEfjOxn1VRxHGGxkhly85AvqNeIwWlTgBuzd6U
 J5YxC/Jb21HKDeK2IyhGGRxxnUxvgbICL4DAWiCgkb3lp9B0JVpmGKq/U2f7sRYE7iQm73lkTOy
 8urWANZxrZRSt8vO+aku8uy0f+xHcoLuEVSaV94o9M5JG+L5upYnVvOImaAlz1J4dxLWEYna7/+
 iT4+i0Abcsazbfwu16e+H7FM6m8MHNwmTZSIfLc54TainaK4NxpzRKeJ1HLdaOVvaEu/jYU6C1s
 eVFv+OavYatgmT6O54JvCDGg33pXN3n60uFZl0NyWlIhYQhxGCuwbDyWkdSThcuqf1KuTF0Mx/+
 OneM1o1cHBj2jDGfUZ5LVA+9v0dSUBVsyaQv/Dis8qQ6D1WDBRgITz8BlS8N1m15dEQ940ANcqp
 pKVvWZkZ5KiFazkXIDQ==
X-Proofpoint-GUID: wrX499Er7grYgka6hFptptOJWeST3Rkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_140757_474951_C060D786 
X-CRM114-Status: GOOD (  21.85  )
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
 lib/sbi/sbi_irqchip.c     | 33 +++++++++++++++++++++++
 lib/utils/irqchip/imsic.c | 55 ++++++++++++++++++---------------------
 3 files changed, 63 insertions(+), 29 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 7f6c763c..4fd5f780 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -165,4 +165,8 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
 /** Exit interrupt controllers */
 void sbi_irqchip_exit(struct sbi_scratch *scratch);
 
+/** Check if the interrupt is enabled */
+bool sbi_irqchip_is_hwirq_enabled(struct sbi_irqchip_device *chip,
+					       u32 hwirq);
+
 #endif
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 8923d2a2..9d14c39e 100644
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
@@ -77,23 +82,51 @@ int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
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
+	if (data->irq_state & IRQ_ENABLED)
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
