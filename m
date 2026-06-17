Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8509DCD98E2
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VII8CkBCLnwDAKt1KTX3Dz2KqGXlxXGrRWm8LOAIYQE=; b=ym4nrpbyQBAb8B
	AmD76lrWVM6pDqMxJ9QoUvwrHcLVgcgbKncvPp1MQrN9iW62qoibz4dbPoPaVxyCKpbXmnaTGm00t
	BjI9hLgQO9e0HUF2d0DMcXyGXEfndj3KTVdhAXhI1b7dQQpQnWqgm4mpNa1K/xai1Rhi+Q/1RL/OB
	r995frdi2KSNQfrqFmC4Y67UcFjMBtDwLiUSSDpKDLsJOB1MCO3Pf3gqI5zY205LCPrUNcedPv6lF
	COuNbn5zMVTI2NZJrlrTzjyTLIN1GiaLZjO9FVrO5vP6fsCr7h0XTRc+SAB5+xvfgndsyu/OWtlGL
	UHUTazUtSe9Ba6XYznag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvC2-00000000B5h-0Ff7;
	Wed, 17 Jun 2026 18:40:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvBz-00000000B34-2HTc
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 18:40:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHd9cD329955
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v5wxV5hZHQp
	Rcuvbe9fZ5h9o3RBpVsmmOM8dlyuJU6M=; b=EI+s5wWPR7RTY73gVd8tdn2IgWf
	gNlbwlpZyjUqLAJ0jYfvaUaViEC3lHBMDlXjf3X7/AJFpDzhoO1NkV+MRxHS749S
	aXFbtBMJcmnDoygheu0YQD9it6bpIHRiw8PLLkrjgL5GODgfksDkFYYCQryElVd6
	ENXBGHSpTR4G6TvK9LNajM/327qs1koUVQU0ZhxDw3Y5IXZsqmCwduqoh8pTMzo8
	YJVcI4YYlec5RckDvxX+p4HUbOBRbV8bErQN69TIP6tH+SAwOkX2dhPnkrevubyE
	6BA0jdY1EGUM7cIZ9PeR4GGwzc6J4L7DUtiFV9JUwEu8YZswILt++32k8WQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vhetn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:50 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HIenLV006789;
	Wed, 17 Jun 2026 18:40:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4euhn9rtaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65HIen0k006777
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 65HIendU006773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 18:40:49 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 1D4A72187A; Wed, 17 Jun 2026 11:40:49 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 1/6] lib: utils/irqchip/aplic: implement direct mode irqchip callbacks
Date: Wed, 17 Jun 2026 11:40:33 -0700
Message-ID: <20260617184047.70388-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com>
References: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: EZcVGaRPXGo-pUYO7_KV0DFuQ5MLu3LX
X-Proofpoint-GUID: EZcVGaRPXGo-pUYO7_KV0DFuQ5MLu3LX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE4MCBTYWx0ZWRfX3i7xiSC8p/Sb
 8bHVoRDoRMKgreoY1qMfg30hPRyRIrT1Q+VsPmgeOU3pwrXSEzxCa/jpgd30xAd2/dAEluNtRtL
 488m9Hep2IFfUYYDdgpES/7rv+UPaUuTp/1sVp1rSfUykVWMxkkESq6+YFLTjB8hANb9TheMq/W
 kWh0srQ3fMBBOxi1iZSJjcnTVBnre/GfwqXKdRrGcOE3h1Z2smewbX3siRHFIFJphKvQYyHMF1q
 hsXBQir8CrYw3OcihpVWaxpfBZl8IgNUoV4aKeSHDzHuopz+Fray1TImMbwV749QT5b0g3QzqFQ
 QcV1nK2xMN3/tStemYFpjuRhcvz76pSsz5S2zvaE+lSkTInCXTiHp+K1CLniKqXD2BFi/t35c6M
 iC0SLy1364nABQwAH6DDajdDLMpUyweG+S0+ksARzy9Aa+pobiwMFVklc+Mq7P3bn1gfeYUA3Ft
 zNZ3PRKN//7cEhzRw6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE4MCBTYWx0ZWRfX1Ro7MKue50+z
 qBtaRfGfKmuxlKdLQsJLYhMhxE0stNBZPsXtfxx5fARm3dioQqtqa2aFBYi+Bet6UtlUzUYN4iw
 dp11Oq4vzIshN28+jRjliRU/Nodtn5o=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a32ea32 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8
 a=WodP-KnFNOtgt472zVQA:9 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_114051_581570_DC0F3D9D 
X-CRM114-Status: GOOD (  22.02  )
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

Add inline register accessors (aplic_sourcecfg_write/read,
aplic_target_write, aplic_irq_setie/clrie/clrip, aplic_idc_base/
read/write) to consolidate all MMIO access behind typed helpers
and eliminate open-coded address arithmetic throughout the driver.

Add field-packing macros APLIC_TARGET_HART_IDX, APLIC_TARGET_IPRIO,
and APLIC_TARGET_GUEST_IDX for constructing
APLIC_TARGET register values.

Add aplic_is_direct_mode() mode helper, aplic_hwirq_flags_to_sourcecfg()
to map generic hwirq flags to APLIC source modes, aplic_hwirq_is_delegated()
to detect S-mode delegated sources, aplic_find_idc_index() to map a
hart index to its IDC slot, and aplic_first_target_hart() to select
the first available IDC hart for initial interrupt targeting.

Remove aplic_writel_msicfg() and MSI register programming from
aplic_init(). Gate IDC structure initialization on aplic_is_direct_mode()
and set DOMAINCFG_IE unconditionally on init.

Implement the full sbi_irqchip callback set for direct (IDC) mode:
- warm_init: enables IDC interrupt delivery and threshold per hart
- process_hwirqs: reads TOPI and dispatches via sbi_irqchip_process_hwirq,
  skipping delegated sources
- hwirq_setup: programs sourcecfg from hwirq_flags and sets the TARGET
  register to the first available IDC hart
- hwirq_cleanup: clears IE, IP, sourcecfg, and TARGET on teardown
- hwirq_eoi: reads CLAIMI to acknowledge the interrupt on the IDC
- hwirq_set_affinity: reprograms TARGET to the specified hart index
- hwirq_mask/unmask: clears/sets IE via CLRIENUM/SETIENUM

Register the irqchip device and populate target_harts from idc_map
only when targets_mmode is set in aplic_cold_irqchip_init().

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Co-developed-by and Signed-off-by "Raymond Mao <raymond.mao@riscstar.com>"
---
 lib/utils/irqchip/aplic.c | 377 +++++++++++++++++++++++++++++++-------
 1 file changed, 308 insertions(+), 69 deletions(-)

diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 6c63620e..7ae77440 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -70,6 +70,10 @@
 	(APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
 	 APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
 
+#define APLIC_TARGET_GUEST_IDX(__gidx) \
+	((((u32)(__gidx)) & APLIC_TARGET_GUEST_IDX_MASK) << \
+	 APLIC_TARGET_GUEST_IDX_SHIFT)
+
 #define APLIC_SETIP_BASE		0x1c00
 #define APLIC_SETIPNUM			0x1cdc
 
@@ -93,6 +97,12 @@
 #define APLIC_TARGET_IPRIO_MASK	0xff
 #define APLIC_TARGET_EIID_MASK	0x7ff
 
+#define APLIC_TARGET_HART_IDX(__hidx) \
+	((((u32)(__hidx)) & APLIC_TARGET_HART_IDX_MASK) << \
+	 APLIC_TARGET_HART_IDX_SHIFT)
+#define APLIC_TARGET_IPRIO(__prio) \
+	(((u32)(__prio)) & APLIC_TARGET_IPRIO_MASK)
+
 #define APLIC_IDC_BASE			0x4000
 #define APLIC_IDC_SIZE			32
 
@@ -116,14 +126,105 @@
 #define APLIC_ENABLE_ITHRESHOLD		0
 
 static SBI_LIST_HEAD(aplic_list);
-static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
-				void *msicfgaddr, void *msicfgaddrH);
+
+static inline bool aplic_is_direct_mode(struct aplic_data *aplic)
+{
+	return aplic && aplic->num_idc;
+}
+
+static inline void aplic_sourcecfg_write(struct aplic_data *aplic,
+					 u32 hwirq, u32 val)
+{
+	writel(val, (void *)(aplic->addr + APLIC_SOURCECFG_BASE +
+			     (hwirq - 1) * sizeof(u32)));
+}
+
+static inline u32 aplic_sourcecfg_read(struct aplic_data *aplic, u32 hwirq)
+{
+	return readl((void *)(aplic->addr + APLIC_SOURCECFG_BASE +
+			      (hwirq - 1) * sizeof(u32)));
+}
+
+static inline void aplic_target_write(struct aplic_data *aplic,
+				      u32 hwirq, u32 val)
+{
+	writel(val, (void *)(aplic->addr + APLIC_TARGET_BASE +
+			     (hwirq - 1) * sizeof(u32)));
+}
+
+static inline void aplic_irq_setie(struct aplic_data *aplic, u32 hwirq)
+{
+	writel(hwirq, (void *)(aplic->addr + APLIC_SETIENUM));
+}
+
+static inline void aplic_irq_clrie(struct aplic_data *aplic, u32 hwirq)
+{
+	writel(hwirq, (void *)(aplic->addr + APLIC_CLRIENUM));
+}
+
+static inline void aplic_irq_clrip(struct aplic_data *aplic, u32 hwirq)
+{
+	writel(hwirq, (void *)(aplic->addr + APLIC_CLRIPNUM));
+}
+
+static inline void *aplic_idc_base(struct aplic_data *aplic, u32 idc_index)
+{
+	return (void *)(aplic->addr + APLIC_IDC_BASE +
+			idc_index * APLIC_IDC_SIZE);
+}
+
+static inline u32 aplic_idc_read(struct aplic_data *aplic, u32 idc_index,
+				 u32 reg)
+{
+	return readl(aplic_idc_base(aplic, idc_index) + reg);
+}
+
+static inline void aplic_idc_write(struct aplic_data *aplic, u32 idc_index,
+				   u32 reg, u32 val)
+{
+	writel(val, aplic_idc_base(aplic, idc_index) + reg);
+}
+
+static u32 aplic_hwirq_flags_to_sourcecfg(u32 hwirq_flags)
+{
+	switch (hwirq_flags & SBI_HWIRQ_FLAGS_LEVEL_SENSE_MASK) {
+	case SBI_HWIRQ_FLAGS_EDGE_RISING:
+		return APLIC_SOURCECFG_SM_EDGE_RISE;
+	case SBI_HWIRQ_FLAGS_EDGE_FALLING:
+		return APLIC_SOURCECFG_SM_EDGE_FALL;
+	case SBI_HWIRQ_FLAGS_LEVEL_HIGH:
+		return APLIC_SOURCECFG_SM_LEVEL_HIGH;
+	case SBI_HWIRQ_FLAGS_LEVEL_LOW:
+		return APLIC_SOURCECFG_SM_LEVEL_LOW;
+	default:
+		return APLIC_SOURCECFG_SM_INACTIVE;
+	}
+}
+
+static bool aplic_hwirq_is_delegated(struct aplic_data *aplic, u32 hwirq)
+{
+	u32 sourcecfg;
+
+	sourcecfg = aplic_sourcecfg_read(aplic, hwirq);
+	return !!(sourcecfg & APLIC_SOURCECFG_D);
+}
+
+static int aplic_find_idc_index(struct aplic_data *aplic, u32 hart_index)
+{
+	u32 i;
+
+	for (i = 0; i < aplic->num_idc; i++) {
+		if (aplic->idc_map[i] == hart_index)
+			return i;
+	}
+
+	return SBI_ENOENT;
+}
 
 static void aplic_init(struct aplic_data *aplic)
 {
 	struct aplic_delegate_data *deleg;
-	u32 i, j, tmp;
-	int locked;
+	u32 i, j, tmp, domaincfg;
 
 	/* Set domain configuration to 0 */
 	writel(0, (void *)(aplic->addr + APLIC_DOMAINCFG));
@@ -160,35 +261,23 @@ static void aplic_init(struct aplic_data *aplic)
 			deleg->last_irq = tmp;
 		}
 		for (j = deleg->first_irq; j <= deleg->last_irq; j++)
-			writel(APLIC_SOURCECFG_D | deleg->child_index,
-			       (void *)(aplic->addr + APLIC_SOURCECFG_BASE +
-			       (j - 1) * sizeof(u32)));
+			aplic_sourcecfg_write(aplic, j, APLIC_SOURCECFG_D | deleg->child_index);
 	}
 
 	/* Default initialization of IDC structures */
-	for (i = 0; i < aplic->num_idc; i++) {
-		writel(0, (void *)(aplic->addr + APLIC_IDC_BASE +
-				   i * APLIC_IDC_SIZE + APLIC_IDC_IDELIVERY));
-		writel(0, (void *)(aplic->addr + APLIC_IDC_BASE +
-				   i * APLIC_IDC_SIZE + APLIC_IDC_IFORCE));
-		writel(APLIC_DISABLE_ITHRESHOLD, (void *)(aplic->addr +
-						  APLIC_IDC_BASE +
-						  (i * APLIC_IDC_SIZE) +
-						  APLIC_IDC_ITHRESHOLD));
+	if (aplic_is_direct_mode(aplic)) {
+		for (i = 0; i < aplic->num_idc; i++) {
+			aplic_idc_write(aplic, i, APLIC_IDC_IDELIVERY,
+					APLIC_DISABLE_IDELIVERY);
+			aplic_idc_write(aplic, i, APLIC_IDC_IFORCE, 0);
+			aplic_idc_write(aplic, i, APLIC_IDC_ITHRESHOLD,
+					APLIC_DISABLE_ITHRESHOLD);
+		}
 	}
 
-	/* MSI configuration */
-	locked = readl((void *)(aplic->addr + APLIC_MMSICFGADDRH)) & APLIC_xMSICFGADDRH_L;
-	if (aplic->targets_mmode && aplic->has_msicfg_mmode && !locked) {
-		aplic_writel_msicfg(&aplic->msicfg_mmode,
-				    (void *)(aplic->addr + APLIC_MMSICFGADDR),
-				    (void *)(aplic->addr + APLIC_MMSICFGADDRH));
-	}
-	if (aplic->targets_mmode && aplic->has_msicfg_smode && !locked) {
-		aplic_writel_msicfg(&aplic->msicfg_smode,
-				    (void *)(aplic->addr + APLIC_SMSICFGADDR),
-				    (void *)(aplic->addr + APLIC_SMSICFGADDRH));
-	}
+	domaincfg = APLIC_DOMAINCFG_IE;
+
+	writel(domaincfg, (void *)(aplic->addr + APLIC_DOMAINCFG));
 }
 
 void aplic_reinit_all(void)
@@ -199,35 +288,6 @@ void aplic_reinit_all(void)
 		aplic_init(aplic);
 }
 
-static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
-				void *msicfgaddr, void *msicfgaddrH)
-{
-	u32 val;
-	unsigned long base_ppn;
-
-	/* Compute the MSI base PPN */
-	base_ppn = msicfg->base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
-	base_ppn &= ~APLIC_xMSICFGADDR_PPN_HART(msicfg->lhxs);
-	base_ppn &= ~APLIC_xMSICFGADDR_PPN_LHX(msicfg->lhxw, msicfg->lhxs);
-	base_ppn &= ~APLIC_xMSICFGADDR_PPN_HHX(msicfg->hhxw, msicfg->hhxs);
-
-	/* Write the lower MSI config register */
-	writel((u32)base_ppn, msicfgaddr);
-
-	/* Write the upper MSI config register */
-	val = (((u64)base_ppn) >> 32) &
-		APLIC_xMSICFGADDRH_BAPPN_MASK;
-	val |= (msicfg->lhxw & APLIC_xMSICFGADDRH_LHXW_MASK)
-		<< APLIC_xMSICFGADDRH_LHXW_SHIFT;
-	val |= (msicfg->hhxw & APLIC_xMSICFGADDRH_HHXW_MASK)
-		<< APLIC_xMSICFGADDRH_HHXW_SHIFT;
-	val |= (msicfg->lhxs & APLIC_xMSICFGADDRH_LHXS_MASK)
-		<< APLIC_xMSICFGADDRH_LHXS_SHIFT;
-	val |= (msicfg->hhxs & APLIC_xMSICFGADDRH_HHXS_MASK)
-		<< APLIC_xMSICFGADDRH_HHXS_SHIFT;
-	writel(val, msicfgaddrH);
-}
-
 static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 {
 	if (APLIC_xMSICFGADDRH_LHXS_MASK < msicfg->lhxs)
@@ -245,6 +305,180 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 	return 0;
 }
 
+static int aplic_warm_init(struct sbi_irqchip_device *chip)
+{
+	struct aplic_data *aplic;
+	u32 hart_index;
+	int idc_index;
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+
+	hart_index = current_hartindex();
+	idc_index  = aplic_find_idc_index(aplic, hart_index);
+	if (idc_index < 0)
+		return 0;
+
+	aplic_idc_write(aplic, idc_index, APLIC_IDC_ITHRESHOLD,
+			APLIC_ENABLE_ITHRESHOLD);
+	aplic_idc_write(aplic, idc_index, APLIC_IDC_IDELIVERY,
+			APLIC_ENABLE_IDELIVERY);
+
+	return 0;
+}
+
+static int aplic_process_hwirqs(struct sbi_irqchip_device *chip)
+{
+	struct aplic_data *aplic;
+	u32 hart_index, topi, hwirq;
+	int idc_index, rc = 0, tmp;
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+
+	hart_index = current_hartindex();
+	idc_index  = aplic_find_idc_index(aplic, hart_index);
+	if (idc_index < 0)
+		return 0;
+
+	while (1) {
+		topi  = aplic_idc_read(aplic, idc_index, APLIC_IDC_TOPI);
+		hwirq = (topi >> APLIC_IDC_TOPI_ID_SHIFT) &
+			APLIC_IDC_TOPI_ID_MASK;
+
+		if (!hwirq)
+			break;
+
+		if (aplic_hwirq_is_delegated(aplic, hwirq))
+			break;
+
+		tmp = sbi_irqchip_process_hwirq(chip, hwirq);
+		if (tmp)
+			rc = tmp;
+	}
+
+	return rc;
+}
+
+static int aplic_hwirq_setup(struct sbi_irqchip_device *chip,
+			     u32 hwirq, u32 hwirq_flags)
+{
+	struct aplic_data *aplic;
+	u32 sourcecfg;	
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+
+	sourcecfg = aplic_hwirq_flags_to_sourcecfg(hwirq_flags);
+	if (sourcecfg == APLIC_SOURCECFG_SM_INACTIVE) {
+		sbi_printf("aplic_hwirq_setup: unsupported flags=0x%lx hwirq=%lu\n",
+			   (unsigned long)hwirq_flags,
+			   (unsigned long)hwirq);
+		return SBI_EINVAL;
+	}
+	aplic_sourcecfg_write(aplic, hwirq, sourcecfg);
+
+	if (aplic_hwirq_is_delegated(aplic, hwirq)) {
+		sbi_printf("aplic_hwirq_setup: hwirq=%lu is delegated\n",
+			   (unsigned long)hwirq);
+		return SBI_ENOTSUPP;
+	}
+
+	aplic_irq_clrie(aplic, hwirq);
+	aplic_irq_clrip(aplic, hwirq);
+
+	return 0;
+}
+
+static void aplic_hwirq_cleanup(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *aplic;
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+	if (aplic_hwirq_is_delegated(aplic, hwirq))
+		return;
+
+	aplic_irq_clrie(aplic, hwirq);
+	aplic_irq_clrip(aplic, hwirq);
+	aplic_sourcecfg_write(aplic, hwirq, APLIC_SOURCECFG_SM_INACTIVE);
+	aplic_target_write(aplic, hwirq, APLIC_DEFAULT_PRIORITY);
+}
+
+static void aplic_hwirq_eoi(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *aplic;
+	u32 hart_index, claimi, claimed_hwirq;
+	int idc_index;
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+	hart_index = current_hartindex();
+	idc_index  = aplic_find_idc_index(aplic, hart_index);
+	if (idc_index < 0)
+		return;
+
+	claimi        = aplic_idc_read(aplic, idc_index, APLIC_IDC_CLAIMI);
+	claimed_hwirq = (claimi >> APLIC_IDC_TOPI_ID_SHIFT) &
+			APLIC_IDC_TOPI_ID_MASK;
+
+	if (claimed_hwirq && claimed_hwirq != hwirq)
+		sbi_printf("aplic_hwirq_eoi: claimed mismatch expected=%lu claimed=%lu hart=%lu idc=%lu\n",
+			   (unsigned long)hwirq,
+			   (unsigned long)claimed_hwirq,
+			   (unsigned long)hart_index,
+			   (unsigned long)idc_index);
+}
+
+static int aplic_hwirq_set_affinity(struct sbi_irqchip_device *chip,
+				    u32 hwirq, u32 hart_index)
+{
+	struct aplic_data *aplic;
+	int idc_index;
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+	if (aplic_hwirq_is_delegated(aplic, hwirq))
+		return SBI_ENOTSUPP;
+
+	idc_index = aplic_find_idc_index(aplic, hart_index);
+	if (idc_index < 0)
+		return SBI_EINVAL;
+
+	aplic_target_write(aplic, hwirq,
+			   APLIC_TARGET_HART_IDX(hart_index) |
+			   APLIC_TARGET_IPRIO(APLIC_DEFAULT_PRIORITY));
+
+	return 0;
+}
+
+static void aplic_hwirq_mask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *aplic;
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+	if (aplic_hwirq_is_delegated(aplic, hwirq))
+		return;
+
+	aplic_irq_clrie(aplic, hwirq);
+}
+
+static void aplic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *aplic;
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+	if (aplic_hwirq_is_delegated(aplic, hwirq))
+		return;
+
+	aplic_irq_setie(aplic, hwirq);
+}
+
+static struct sbi_irqchip_device aplic_irqchip_template = {
+	.warm_init		= aplic_warm_init,
+	.process_hwirqs		= aplic_process_hwirqs,
+	.hwirq_setup		= aplic_hwirq_setup,
+	.hwirq_cleanup		= aplic_hwirq_cleanup,
+	.hwirq_eoi		= aplic_hwirq_eoi,
+	.hwirq_set_affinity	= aplic_hwirq_set_affinity,
+	.hwirq_mask		= aplic_hwirq_mask,
+	.hwirq_unmask		= aplic_hwirq_unmask,
+};
+
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
@@ -297,22 +531,27 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 			return rc;
 	}
 
-	if (aplic->num_idc) {
+	if ((aplic->targets_mmode) && aplic_is_direct_mode(aplic)) {
+		aplic->irqchip		 = aplic_irqchip_template;
+		aplic->irqchip.id	 = aplic->unique_id;
+		aplic->irqchip.caps = SBI_IRQCHIP_CAPS_WIRED;
+		aplic->irqchip.num_hwirq = aplic->num_source + 1;
+
 		for (i = 0; i < aplic->num_idc; i++)
 			sbi_hartmask_set_hartindex(aplic->idc_map[i],
 						   &aplic->irqchip.target_harts);
-	} else {
-		sbi_hartmask_set_all(&aplic->irqchip.target_harts);
-	}
-
-	/* Register irqchip device */
-	aplic->irqchip.id = aplic->unique_id;
-	aplic->irqchip.caps = SBI_IRQCHIP_CAPS_WIRED;
-	aplic->irqchip.num_hwirq = aplic->num_source + 1;
-	rc = sbi_irqchip_add_device(&aplic->irqchip);
-	if (rc)
-		return rc;
 
+		rc = sbi_irqchip_add_device(&aplic->irqchip);
+		if (rc) {
+			sbi_printf("aplic_cold_irqchip_init: sbi_irqchip_add_device failed rc=%d id=%lu mode=%s target_weight=%lu\n",
+				rc,
+				(unsigned long)aplic->irqchip.id,
+				"direct",
+				(unsigned long)sbi_hartmask_weight(
+					&aplic->irqchip.target_harts));
+			return rc;
+		}
+	}
 	/* Attach to the aplic list */
 	sbi_list_add_tail(&aplic->node, &aplic_list);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
