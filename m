Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB8CC44508
	for <opensbi@archiver.kernel.org>; Sat, 11 Jul 2026 20:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFUp0uS2o5tplhbSi4u8oaG5EE0bJym8sk29erW3l2I=; b=LGS8bJJZrBBJZg
	Ex9+nZEeFVC8QMpwDnPBWO144xUsKwJJtAPJHkgeImwr0QhkIvWoTDE767v6+0TrsrhbsfB3j+KPn
	/KPLRFTi2Jlc21Dv6NWmTpRphRCq/4dTCHqPoS444iqio9CMLUh3p9/KBmj/5Mj+TP/fDZvjkMMQ9
	LnAfw7KnJV60xY38aAitwv6Z22rP1fJsXLOnkHeypuGVaMvtgyz2+DW8pT4WtH3QrgFrFTVVUvJfz
	f+q8jT3K5Gq/abjUPvSFTRH8MgDvRNCxUbDQiD0UdB8UD3IntuiF1r2stz+NQayR/BAfLHpU6JjCv
	sRdYkGE9rWWJT7YBxIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wie5d-00000006ql2-3Mcl;
	Sat, 11 Jul 2026 20:14:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wie5Z-00000006qhp-135O
	for opensbi@lists.infradead.org;
	Sat, 11 Jul 2026 20:14:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHnt9C240444
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4JKjRSETzGf
	tQMwuoEFGz65JWsxeZMFGkHquAgnNxJc=; b=OnaQS4dH/e5sr3bkJ+NcGFbNfX/
	nq4DuGg7ns7RS3w6ocVDM3+/0Z5F/w9aiO9LclRQrjpqi4c8K3lpxQEcgfL14ojP
	7DnaWNkJ/SlrWv/Gyu0KP5Fy2mEAS5+Y0k054l1IR1+YoDsi7dD5W75Eu1JbxUgT
	N7bAAszDycqesUo7zaSuz1Rbu9fdLKIEQpKtuNbrEy+sX4Belw9c8WUNoWjV1Qy1
	lznIFgKskb4pumCWtn/7QisYFNOIkBABiDWdwrsB6XdJSVpEqIilLKEgFL3ozu+z
	rj8HiF0E7vWwOkXFrMucOB4g7mijAhsadrEM6R4493clbYcseVPdVMga8hg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe911hmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:16 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66BKEFxN015225;
	Sat, 11 Jul 2026 20:14:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewhcynk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:15 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66BKEFWB015215
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:15 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 66BKEEPl015208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 20:14:15 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id A403520B99; Sat, 11 Jul 2026 13:14:14 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v3 5/6] lib: utils/irqchip/imsic: track IRQ enable state and restore EIE on warm init
Date: Sat, 11 Jul 2026 13:14:05 -0700
Message-ID: <20260711201413.2931099-6-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com>
References: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a52a418 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=xftSsUJEpljlaYBSxc8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDIwNiBTYWx0ZWRfX3hCn9dszuPDL
 7DXnxIICOirBysQsIL2aOF4pm0oe/QTgJf9dOOMMl2HZDmA0GYA3IpKaTpucCM+W8Xwx4SCoRT1
 LVtg4UA4ZomC+GwCUi8WX6ZAUpR3sAY=
X-Proofpoint-GUID: rqVV6X-5JoAEsrD5vR13m9ttCQygiaoS
X-Proofpoint-ORIG-GUID: rqVV6X-5JoAEsrD5vR13m9ttCQygiaoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDIwNiBTYWx0ZWRfXxP1sbNhRyR0R
 3Cw4GePDaKsN38m97nj+D2WeLyLtOPPkap01vJ8VCEgxXu7b40juyFL8Sd1F35AR0r5X6ZskmqV
 87k4B+qqbWA2ew2PEuRbH46AJODgvjENUcwCo1yOMI6dFrGOQ5Odf8lZ2b1lrPLnwEB7CEZGRxI
 uk3NbsDorxHusfT1osCfHYWYrTZj7jb6bHspjEfRJldM7gYlxbbDMI/pDVoGARibk5dftfUFfrt
 2CwXzd/yK5bOpTxWZWD3mdbHLZR34DAU8O3v/+/mTFoMXgccgdos9v8h1QzGyorfLApw8vu45/3
 ioHbQYv4nOAjkfSVoR4wYrOzJVLEYOYYYEDougQtvzDWDy0DO6/uMQpRo7dCB5uAa/q/T3cA0Gw
 WBAvbN2+LyqbM9qSKNGkumlwS1oOPzzDf6Ail3zagYM75fOM5lkAsKbB0UcYBUgEo7+fb8VF1IF
 Jtg2CYiqqasmOlvmtLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_131417_405040_DEC13A1F 
X-CRM114-Status: GOOD (  21.95  )
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
index e778d747..14b79cbf 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -162,4 +162,8 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
 /** Exit interrupt controllers */
 void sbi_irqchip_exit(struct sbi_scratch *scratch);
 
+/** Check if the interrupt is enabled */
+bool sbi_irqchip_is_irq_enabled(struct sbi_irqchip_device *chip,
+					       u32 hwirq);
+
 #endif
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 6d0df02e..d124c194 100644
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
@@ -79,21 +99,34 @@ int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
 
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
index d7080565..0b19599a 100644
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
@@ -533,7 +530,7 @@ static void imsic_hwirq_mask(struct sbi_irqchip_device *chip, u32 hwirq)
 	if (!imsic || !imsic->targets_mmode)
 		return;
 
-	imsic_local_eix_update(hwirq, 1, false, false);
+	imsic_local_eix_update(hwirq, false, false);
 }
 
 static void imsic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
@@ -550,7 +547,7 @@ static void imsic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
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
