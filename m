Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50887C4452F
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjjlWvt0GlQYRxUpyCYunyA5y3k/bAyKL/NkyVVW7BI=; b=QR4U7pE/1+EAbH
	nCbr+pKuGcPULNBzcCM7NDjLD/8NXURub7D16uTvTRCAiFA5Cdbw8fyzlGDoCY9yfMpW8HboBAdtP
	ktpRLOHIHzMRX/VA8Xb6Rpo6Q0OSyoICiwmI/SajDOhAqAziB7cSXgQH81Qe3nhmMRX4cuXoDJMq4
	THcWqKScPBLebzapOxwV/ulGe2Ptl82TE16hSNsh0SC3zHVArd8+DpxbxetGXaCHsx1uX9dIb0kL6
	mY11t0WDBI/B8+Ayf53/wxp15rvuAA27Zeb1GzR+ddsJBvrmfpSFYS1uNVfJkeN/bJqCpwQQhe/lU
	Lnq7FXgfnPkRCrR9Bi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDV-00000007unH-2Ofm;
	Mon, 20 Jul 2026 21:08:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDQ-00000007ukT-0a1n
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 21:07:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTa2G3106556;
	Mon, 20 Jul 2026 21:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6tsL7BeDWA0
	PtAmn9JRJX7er0+yw7+6Ng+EWU7JBLAQ=; b=AAvFnw9VJIO6RlkbKljGAHvLCrE
	lQnDrUAvej0FsGi95J+4Q3DqfRY8ChWL0qlurEuMwkX2NcRoC1Z0rB4paD+zdkGg
	xxaPd2alPHS0PuPDnWY5iilcPNC/QkxPT/PKtnUq/O9oZohJYcvHvuAVdAIPvt6n
	PjQ1o+XBWutuzmbRvIkAB/SiOlutF9VTsKCHlIvrsy/eHrOb3eVD9Wm6ZHhvvQ/C
	aEeqYAXdmRqNzEU2bpW6sMrJ4GIHJQe66sXCgDnUIWixWGjEw0g3/Sy/V5bjedbq
	RRXGUZiR1Z/hhdRLcnaLi/3gOsMADNasZbmtVHl1oiZYeWqg4pmaiI4TJ5g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs532ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:54 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KL6MNl024987;
	Mon, 20 Jul 2026 21:07:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fh85yrvy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:53 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KL7rRo027384;
	Mon, 20 Jul 2026 21:07:53 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 66KL7rma027380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:53 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 20B8421BEF; Mon, 20 Jul 2026 14:07:53 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH v4 1/6] lib: utils/irqchip/aplic: implement direct mode irqchip callbacks
Date: Mon, 20 Jul 2026 14:07:41 -0700
Message-ID: <20260720210748.2893688-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
References: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX2W0kMx6MHEiL
 uD5Pt7nYuZgGpMIBvGudtoyr5Etfn5TAYDsQlmsPh4MpZJ+BMJriSTYx4cvyvY1xOFCCqhM8I6s
 R40bqoOuWh7j6Pi6XkV2+HuimstT9lM=
X-Proofpoint-GUID: uCWLi2Uqa1NK8fHiOuUrPzmxmT4Iy6B2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfXy8HVBgaW8SkY
 vzEEZusJY7RTlRmSi5FYPgROlDVZIAYcERmNDhICEXoCJQNNqEN9zI/Q1AcmUL9PS+zxkBMPxUb
 bOQJsKaS8O7ZOeFwIJz5syoogHx9vPsfWZVRClJ2C6e5bxX01ESjH1Ic8YYbcf3eX7NMwXD0EP9
 n/FtT4bR7vYHIUSMEtczBFcW0heRva0OgjpCEzOqUEuEIX21NZlSaRREZX3ZlFZS+VSTiRDzs1+
 +h4y94GD2Yx0J5XCoOtNZsbob6x6jFLJDRaQ2d64I54lHECau8uTfv8or63rwNxE5AEQu6eESOm
 hlhnGu8ggFEt1ztotCBfz19eL9zysc4hv6qjrTH4+gWUKyLQd6X8w5z/EsVBId/Itzq3ZtB2SXk
 heP/oVX/7gBLAxQ0mYkGr8Tqo/PKT2YuMu0ee9DCsGmhxFfLdKSHOGjlN2yT/63ZaQ5S4+7gewn
 BCkBXJ7Ta8upLtgpnsQ==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e8e2a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=W-_n0kkjAAAA:8
 a=zzyRTQmNerI19oTOJbUA:9 a=VOpmJXOdbJOWo2YY3GeN:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: uCWLi2Uqa1NK8fHiOuUrPzmxmT4Iy6B2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_140757_451018_F0F5C8C6 
X-CRM114-Status: GOOD (  22.17  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/utils/irqchip/aplic.c | 332 +++++++++++++++++++++++++++++++++-----
 1 file changed, 295 insertions(+), 37 deletions(-)

diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 6c63620e..efc25555 100644
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
 
@@ -119,10 +129,104 @@ static SBI_LIST_HEAD(aplic_list);
 static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
 				void *msicfgaddr, void *msicfgaddrH);
 
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
+
 static void aplic_init(struct aplic_data *aplic)
 {
 	struct aplic_delegate_data *deleg;
-	u32 i, j, tmp;
+	u32 i, j, tmp, domaincfg;
 	int locked;
 
 	/* Set domain configuration to 0 */
@@ -160,35 +264,36 @@ static void aplic_init(struct aplic_data *aplic)
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
+	} else {
+		/* MSI configuration */
+		locked = readl((void *)(aplic->addr + APLIC_MMSICFGADDRH)) & APLIC_xMSICFGADDRH_L;
+		if (aplic->targets_mmode && aplic->has_msicfg_mmode && !locked) {
+			aplic_writel_msicfg(&aplic->msicfg_mmode,
+						(void *)(aplic->addr + APLIC_MMSICFGADDR),
+						(void *)(aplic->addr + APLIC_MMSICFGADDRH));
+		}
+		if (aplic->targets_mmode && aplic->has_msicfg_smode && !locked) {
+			aplic_writel_msicfg(&aplic->msicfg_smode,
+						(void *)(aplic->addr + APLIC_SMSICFGADDR),
+						(void *)(aplic->addr + APLIC_SMSICFGADDRH));
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
@@ -245,6 +350,154 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
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
+    struct aplic_data *aplic;
+    u32 hart_index, claimi, hwirq;
+    int idc_index, rc = 0, tmp;
+
+    aplic = container_of(chip, struct aplic_data, irqchip);
+
+    hart_index = current_hartindex();
+    idc_index  = aplic_find_idc_index(aplic, hart_index);
+    if (idc_index < 0)
+        return 0;
+
+    while ((claimi = aplic_idc_read(aplic, idc_index, APLIC_IDC_CLAIMI))) {
+        hwirq = (claimi >> APLIC_IDC_TOPI_ID_SHIFT) &
+                 APLIC_IDC_TOPI_ID_MASK;
+
+        if (!hwirq)
+            break;
+
+        if (aplic_hwirq_is_delegated(aplic, hwirq))
+            continue;
+
+        tmp = sbi_irqchip_process_hwirq(chip, hwirq);
+        if (tmp)
+            rc = tmp;
+    }
+
+    return rc;
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
+	.hwirq_set_affinity	= aplic_hwirq_set_affinity,
+	.hwirq_mask		= aplic_hwirq_mask,
+	.hwirq_unmask		= aplic_hwirq_unmask,
+};
+
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
@@ -297,22 +550,27 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
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
