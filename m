Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98088CD98E2
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Diug7ThSi4WUA726ANUBnq4q+NhS2JzPqm5PzIC3f3A=; b=1gu2BD/gE4UWB/
	J+FhFh8zKiHo2q5Fv+6cS3LFsMMiOqwHOAKn3TjAfNjVio4YUt2hyXtaRTXIhBCPWt0pu7w5nwDOk
	CFILWSEnkXLy0K9SmgwZzeUL4B6KKZuYGFAYSSj/f7w00d8/JxLOomLTRG4ByRGpacxc1dEUipMQ+
	DH47azQ/iCbCmm+tZwgRV8m0m+nEfO9+dhpxxbjegKmYxeXTPZ4KgjP6ZlB/Bo2wTm1NOjF95KvIu
	9gAAPYwmGOLH8lrSyxt+ahUDOT/DUOjyCldZmDuZBtyjOfcG5aclJOTW0TLj2Y/kzl9o1Q35Uz9n+
	jZSqgwjnC/AK9QLdK/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxg-0000000EdXk-05Xh;
	Mon, 15 Jun 2026 17:19:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxc-0000000EdV9-1tCa
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 17:18:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhME9446930
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JAKew/gTkRG
	mWh3/nkOWwe3Zsx/7I85pcm//hYqTMeY=; b=KVFsuKBE6Akg+yHcIMSnvzW7FXG
	j4Q5dOs08qu4/kCT2A8fetcy3b0BvbUH9tXOJXROiYOCueBhwwS/BaYc38XO05s7
	es1r+bbPWEzA8A5A74IGkO+k7kBVQaaO330B8q2QyJV7iGkbB79bxO7G4EeRekJe
	BpJJ3Nd6oaJLAT1qbns+uPKRq03ywPbVUyAA8MoBXSSLEDDe5ei3UpSWngB5Bmsk
	sYiHCRdrLfvt8syb4v6XSts/3iruYhl1zkfnoB4t5XJodipVzheizKwaKafa6Mfw
	rbU1mUWIvOFOk1g5cLcvbIVTRVdEEQKFpgfp/YXb14PnxEuAMmhelvC+0rw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0j0yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65FHIt9p014675;
	Mon, 15 Jun 2026 17:18:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4etk129hhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65FHIs2U014654
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:54 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 65FHIsYx014648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 17:18:54 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id B06A824E54; Mon, 15 Jun 2026 10:18:54 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH 2/7] lib: utils/irqchip/aplic: add MSI mode support with IMSIC parent linking
Date: Mon, 15 Jun 2026 10:18:47 -0700
Message-ID: <20260615171852.447545-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
References: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX6vwDiuLUlxm5
 A0eqdtxPVVVWBMOKArBlN9lvkVR5C7UvYptPB3iPDGoG2uyu5cR5RHg8FEHas1mO7QRfcQVs7md
 PnneMc/83tOqDSrkKgcqNZdASbAlrL4=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a3033ff cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pE0iYSICBcrGQQEK4coA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX0UpEWVVpRbU/
 vj5VmBouvvblyJZYqcs7OifnLesnAztMV8QysQxwRcrtdW7F2IWbVTxSfHWnMgokNxHOEG//8aF
 9Tkg6rz7C9MYYfRAS0hibsixpTpVxmT4LcVwWPgga0bjRLiC55TIL4efzmA2MVbZtsCdgVC6hTC
 8ztcidfgL/2sh+pcBV56bVlFDhLKAKjNN1veAmpbMYGH/FRRI6gNytZzoTXPjpypXYVwIo3I/0d
 ftijQ+Q6z3Ka6FbVLYa72yOL2ei3GtSrDYNdVmJbL3dJIzJgb1PXxx1iewPBOaevIadRGmA543W
 uOYFOgQ61dWcl0loqGrP7LBnhHuiPMKu1cGEYtSDq6gaXfclDPKPZbRjAaMSf0KgyNLtUzi+gNK
 6oGljmSAptnBRTew/SJMZ9rKmkO4z3nPV4J8X4iuUonJ9+9T+UJkBJw9a3r0AakW3cc9Rbqol38
 ggXkQ1CGk+f6/PURXlw==
X-Proofpoint-GUID: 68XwKCNXepk_9gituRyC-a2sKi2ZUQZ8
X-Proofpoint-ORIG-GUID: 68XwKCNXepk_9gituRyC-a2sKi2ZUQZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_101856_501389_C8ADDA80 
X-CRM114-Status: GOOD (  24.78  )
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

Add parent_unique_id fields to struct aplic_data for
IMSIC parent linking in MSI mode. Store parent IMSIC unique_id
during FDT parsing of the APLIC node.

Add aplic_is_msi_mode() complementing aplic_is_direct_mode() to
consolidate delivery mode detection. Add APLIC_TARGET_EIID() macro
for packing the EIID field into the TARGET register.

Add parent_unique_id and parent_irq_map fields to struct aplic_data.
parent_unique_id identifies the upstream IMSIC irqchip device resolved
via sbi_irqchip_find_device() during hwirq_setup. parent_irq_map is
a per-source array allocated at cold init time to track the EIID
assigned by the IMSIC for each APLIC source.

Restore aplic_writel_msicfg() and re-introduce MSI address register
programming in aplic_init(), gated on aplic_is_msi_mode(). Set the
DOMAINCFG_DM bit to switch the hardware to MSI delivery mode when
no IDC structures are present.

Add aplic_program_msi_target() to pack hart_index, guest_index, and
EIID into the APLIC_TARGET register. Add aplic_write_msi() as the
sbi_irqchip write_msi callback that extracts EIID and hart_index from
the MSI message and calls aplic_program_msi_target(). Add
aplic_msi_callback() as the MSI receive callback that dispatches to
sbi_irqchip_process_hwirq() on the APLIC chip.

Extend aplic_hwirq_setup() with an MSI path that resolves the parent
IMSIC chip by parent_unique_id, registers an MSI route via
sbi_irqchip_register_msi(), and stores the allocated EIID in
parent_irq_map for the source being configured.

Extend aplic_hwirq_set_affinity() with an MSI path that delegates
affinity reprogramming to the parent IMSIC chip via
sbi_irqchip_set_affinity() using the stored parent_irq_map entry.

Guard warm_init, process_hwirqs, and hwirq_eoi with early returns in
MSI mode as interrupt delivery and acknowledgement are handled by the
IMSIC in that configuration.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h         |   1 +
 include/sbi_utils/irqchip/aplic.h |   2 +
 lib/utils/fdt/fdt_helper.c        |   1 +
 lib/utils/irqchip/aplic.c         | 280 ++++++++++++++++++++++++++----
 4 files changed, 251 insertions(+), 33 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index e778d747..a695ecc5 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -18,6 +18,7 @@ struct sbi_scratch;
 
 /** irqchip message signalled interrupt (MSI) */
 struct sbi_irqchip_msi_msg {
+	u32 hart_index;
 	u32 address_lo;
 	u32 address_hi;
 	u32 data;
diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index 3461d1c7..96d6e7b7 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -34,8 +34,10 @@ struct aplic_data {
 	/* Private members */
 	struct sbi_irqchip_device irqchip;
 	struct sbi_dlist node;
+	u32 *parent_irq_map;
 	/* Public members */
 	u32 unique_id;
+	u32 parent_unique_id;
 	unsigned long addr;
 	unsigned long size;
 	unsigned long num_idc;
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b57eae1a..1060e2ec 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -695,6 +695,7 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
 
 	rc = fdt_aplic_find_imsic_node(fdt, nodeoff, &imsic, true);
 	if (!rc) {
+		aplic->parent_unique_id = imsic.unique_id;
 		aplic->targets_mmode = true;
 		aplic->has_msicfg_mmode = true;
 		aplic->msicfg_mmode.lhxs = imsic.guest_index_bits;
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 7ae77440..eaaa84d7 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
 #include <sbi_utils/irqchip/aplic.h>
 
 #define APLIC_MAX_IDC			(1UL << 14)
@@ -73,6 +74,8 @@
 #define APLIC_TARGET_GUEST_IDX(__gidx) \
 	((((u32)(__gidx)) & APLIC_TARGET_GUEST_IDX_MASK) << \
 	 APLIC_TARGET_GUEST_IDX_SHIFT)
+#define APLIC_TARGET_EIID(__eiid) \
+	(((u32)(__eiid)) & APLIC_TARGET_EIID_MASK)
 
 #define APLIC_SETIP_BASE		0x1c00
 #define APLIC_SETIPNUM			0x1cdc
@@ -125,6 +128,13 @@
 #define APLIC_DISABLE_ITHRESHOLD	1
 #define APLIC_ENABLE_ITHRESHOLD		0
 
+struct aplic_msi_data {
+	struct aplic_data *aplic;
+	u32 hwirq;
+};
+
+struct aplic_msi_data **aplic_msi_ptrs;
+
 static SBI_LIST_HEAD(aplic_list);
 
 static inline bool aplic_is_direct_mode(struct aplic_data *aplic)
@@ -132,6 +142,11 @@ static inline bool aplic_is_direct_mode(struct aplic_data *aplic)
 	return aplic && aplic->num_idc;
 }
 
+static inline bool aplic_is_msi_mode(struct aplic_data *aplic)
+{
+	return aplic && !aplic->num_idc;
+}
+
 static inline void aplic_sourcecfg_write(struct aplic_data *aplic,
 					 u32 hwirq, u32 val)
 {
@@ -221,10 +236,40 @@ static int aplic_find_idc_index(struct aplic_data *aplic, u32 hart_index)
 	return SBI_ENOENT;
 }
 
+static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
+                               void *msicfgaddr, void *msicfgaddrH)
+{
+       u32 val;
+       unsigned long base_ppn;
+
+       /* Compute the MSI base PPN */
+       base_ppn = msicfg->base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
+       base_ppn &= ~APLIC_xMSICFGADDR_PPN_HART(msicfg->lhxs);
+       base_ppn &= ~APLIC_xMSICFGADDR_PPN_LHX(msicfg->lhxw, msicfg->lhxs);
+       base_ppn &= ~APLIC_xMSICFGADDR_PPN_HHX(msicfg->hhxw, msicfg->hhxs);
+
+       /* Write the lower MSI config register */
+       writel((u32)base_ppn, msicfgaddr);
+
+       /* Write the upper MSI config register */
+       val = (((u64)base_ppn) >> 32) &
+               APLIC_xMSICFGADDRH_BAPPN_MASK;
+       val |= (msicfg->lhxw & APLIC_xMSICFGADDRH_LHXW_MASK)
+               << APLIC_xMSICFGADDRH_LHXW_SHIFT;
+       val |= (msicfg->hhxw & APLIC_xMSICFGADDRH_HHXW_MASK)
+               << APLIC_xMSICFGADDRH_HHXW_SHIFT;
+       val |= (msicfg->lhxs & APLIC_xMSICFGADDRH_LHXS_MASK)
+               << APLIC_xMSICFGADDRH_LHXS_SHIFT;
+       val |= (msicfg->hhxs & APLIC_xMSICFGADDRH_HHXS_MASK)
+               << APLIC_xMSICFGADDRH_HHXS_SHIFT;
+       writel(val, msicfgaddrH);
+}
+
 static void aplic_init(struct aplic_data *aplic)
 {
 	struct aplic_delegate_data *deleg;
 	u32 i, j, tmp, domaincfg;
+	int locked;
 
 	/* Set domain configuration to 0 */
 	writel(0, (void *)(aplic->addr + APLIC_DOMAINCFG));
@@ -275,7 +320,34 @@ static void aplic_init(struct aplic_data *aplic)
 		}
 	}
 
+	/* MSI configuration */
+	locked = readl((void *)(aplic->addr + APLIC_MMSICFGADDRH)) & APLIC_xMSICFGADDRH_L;
+
+	if (aplic_is_msi_mode(aplic) &&
+	    aplic->targets_mmode &&
+	    aplic->has_msicfg_mmode &&
+	    !locked) {
+		sbi_printf("aplic_init: programming M-mode MSI config addr=0x%lx\n",
+			   (unsigned long)aplic->addr);
+		aplic_writel_msicfg(&aplic->msicfg_mmode,
+				    (void *)(aplic->addr + APLIC_MMSICFGADDR),
+				    (void *)(aplic->addr + APLIC_MMSICFGADDRH));
+	}
+
+	if (aplic_is_msi_mode(aplic) &&
+	    aplic->targets_mmode &&
+	    aplic->has_msicfg_smode &&
+	    !locked) {
+		sbi_printf("aplic_init: programming S-mode MSI config addr=0x%lx\n",
+			   (unsigned long)aplic->addr);
+		aplic_writel_msicfg(&aplic->msicfg_smode,
+				    (void *)(aplic->addr + APLIC_SMSICFGADDR),
+				    (void *)(aplic->addr + APLIC_SMSICFGADDRH));
+	}
+
 	domaincfg = APLIC_DOMAINCFG_IE;
+	if (aplic_is_msi_mode(aplic))
+		domaincfg |= APLIC_DOMAINCFG_DM;
 
 	writel(domaincfg, (void *)(aplic->addr + APLIC_DOMAINCFG));
 }
@@ -312,6 +384,8 @@ static int aplic_warm_init(struct sbi_irqchip_device *chip)
 	int idc_index;
 
 	aplic = container_of(chip, struct aplic_data, irqchip);
+	if (aplic_is_msi_mode(aplic))
+		return 0;
 
 	hart_index = current_hartindex();
 	idc_index  = aplic_find_idc_index(aplic, hart_index);
@@ -333,6 +407,8 @@ static int aplic_process_hwirqs(struct sbi_irqchip_device *chip)
 	int idc_index, rc = 0, tmp;
 
 	aplic = container_of(chip, struct aplic_data, irqchip);
+	if (aplic_is_msi_mode(aplic))
+		return 0;
 
 	hart_index = current_hartindex();
 	idc_index  = aplic_find_idc_index(aplic, hart_index);
@@ -358,32 +434,108 @@ static int aplic_process_hwirqs(struct sbi_irqchip_device *chip)
 	return rc;
 }
 
+static void aplic_program_msi_target(struct aplic_data *aplic,
+				     u32 hwirq, u32 hart_index,
+				     u32 guest_index, u32 eiid)
+{
+	u32 target;
+
+	target = APLIC_TARGET_HART_IDX(hart_index) |
+		 APLIC_TARGET_GUEST_IDX(guest_index) |
+		 APLIC_TARGET_EIID(eiid);
+
+	aplic_target_write(aplic, hwirq, target);
+}
+
+static void aplic_write_msi(u32 parent_hwirq,
+			    const struct sbi_irqchip_msi_msg *msg,
+			    void *priv)
+{
+	struct aplic_msi_data *msi_data = priv;
+	u32 guest_index = 0;
+	u32 eiid;
+
+	eiid = msg->data;
+	if (!eiid || eiid > APLIC_TARGET_EIID_MASK)
+		return;
+
+	aplic_program_msi_target(msi_data->aplic, msi_data->hwirq, msg->hart_index,
+				 guest_index, eiid);
+}
+
+static int aplic_msi_callback(u32 parent_hwirq, void *priv)
+{
+	struct aplic_msi_data *msi_data = priv;
+	int rc;
+
+	rc = sbi_irqchip_process_hwirq(&msi_data->aplic->irqchip, msi_data->hwirq);
+	if (rc && rc != SBI_ENOENT)
+		sbi_printf("aplic_msi_callback: hwirq=%lu failed rc=%d\n",
+			   (unsigned long)parent_hwirq, rc);
+
+	return rc;
+}
+
+static int aplic_setup_msi(struct aplic_data *aplic, u32 hwirq)
+{
+    struct sbi_irqchip_device *parent;
+    u32 first_hwirq;
+    int rc;
+
+    parent = sbi_irqchip_find_device(aplic->parent_unique_id);
+    if (!parent) {
+        sbi_printf("aplic_hwirq_setup: msi_parent is NULL hwirq=%lu\n",
+                   (unsigned long)hwirq);
+        return SBI_EINVAL;
+    }
+
+    aplic_msi_ptrs[hwirq] = sbi_zalloc(sizeof(struct aplic_msi_data));
+    if (!aplic_msi_ptrs[hwirq])
+        return SBI_ENOMEM;
+
+    aplic_msi_ptrs[hwirq]->aplic = aplic;
+    aplic_msi_ptrs[hwirq]->hwirq = hwirq;
+
+    rc = sbi_irqchip_register_msi(parent, 1,
+                                 aplic_write_msi,
+                                 aplic_msi_callback,
+                                 aplic_msi_ptrs[hwirq],
+                                 &first_hwirq);
+    if (rc) {
+        sbi_printf("aplic_hwirq_setup: register_msi failed hwirq=%lu rc=%d\n",
+                   (unsigned long)hwirq, rc);
+        sbi_free(aplic_msi_ptrs[hwirq]);
+        return rc;
+    }
+
+    aplic->parent_irq_map[hwirq] = first_hwirq;
+
+    return 0;
+}
+
 static int aplic_hwirq_setup(struct sbi_irqchip_device *chip,
-			     u32 hwirq, u32 hwirq_flags)
+                             u32 hwirq, u32 hwirq_flags)
 {
-	struct aplic_data *aplic;
-	u32 sourcecfg;	
+    struct aplic_data *aplic;
+    u32 sourcecfg;    
 
-	aplic = container_of(chip, struct aplic_data, irqchip);
+    aplic = container_of(chip, struct aplic_data, irqchip);
 
-	sourcecfg = aplic_hwirq_flags_to_sourcecfg(hwirq_flags);
-	if (sourcecfg == APLIC_SOURCECFG_SM_INACTIVE) {
-		sbi_printf("aplic_hwirq_setup: unsupported flags=0x%lx hwirq=%lu\n",
-			   (unsigned long)hwirq_flags,
-			   (unsigned long)hwirq);
-		return SBI_EINVAL;
-	}
-	aplic_sourcecfg_write(aplic, hwirq, sourcecfg);
+    sourcecfg = aplic_hwirq_flags_to_sourcecfg(hwirq_flags);
+    if (sourcecfg == APLIC_SOURCECFG_SM_INACTIVE) {
+        sbi_printf("invalid hwirq flags 0x%x\n", hwirq_flags);
+        return SBI_EINVAL;
+    }
 
-	if (aplic_hwirq_is_delegated(aplic, hwirq)) {
-		sbi_printf("aplic_hwirq_setup: hwirq=%lu is delegated\n",
-			   (unsigned long)hwirq);
-		return SBI_ENOTSUPP;
-	}
+    aplic_sourcecfg_write(aplic, hwirq, sourcecfg);
 
-	aplic_irq_clrie(aplic, hwirq);
-	aplic_irq_clrip(aplic, hwirq);
+    aplic_irq_clrie(aplic, hwirq);
+    aplic_irq_clrip(aplic, hwirq);
 
+    if (aplic_is_msi_mode(aplic)) {
+        return aplic_setup_msi(aplic, hwirq);
+	}
+	
 	return 0;
 }
 
@@ -399,6 +551,7 @@ static void aplic_hwirq_cleanup(struct sbi_irqchip_device *chip, u32 hwirq)
 	aplic_irq_clrip(aplic, hwirq);
 	aplic_sourcecfg_write(aplic, hwirq, APLIC_SOURCECFG_SM_INACTIVE);
 	aplic_target_write(aplic, hwirq, APLIC_DEFAULT_PRIORITY);
+	sbi_free(aplic_msi_ptrs[hwirq]);
 }
 
 static void aplic_hwirq_eoi(struct sbi_irqchip_device *chip, u32 hwirq)
@@ -408,6 +561,9 @@ static void aplic_hwirq_eoi(struct sbi_irqchip_device *chip, u32 hwirq)
 	int idc_index;
 
 	aplic = container_of(chip, struct aplic_data, irqchip);
+	if (aplic_is_msi_mode(aplic))
+		return;
+
 	hart_index = current_hartindex();
 	idc_index  = aplic_find_idc_index(aplic, hart_index);
 	if (idc_index < 0)
@@ -429,12 +585,31 @@ static int aplic_hwirq_set_affinity(struct sbi_irqchip_device *chip,
 				    u32 hwirq, u32 hart_index)
 {
 	struct aplic_data *aplic;
+	struct sbi_irqchip_device *parent;
 	int idc_index;
+	int rc;
 
 	aplic = container_of(chip, struct aplic_data, irqchip);
 	if (aplic_hwirq_is_delegated(aplic, hwirq))
 		return SBI_ENOTSUPP;
 
+	if (aplic_is_msi_mode(aplic)) {
+		parent = sbi_irqchip_find_device(aplic->parent_unique_id);
+		if (!parent) {
+			sbi_printf("aplic_hwirq_setup: msi_parent is NULL hwirq=%lu\n",
+				   (unsigned long)hwirq);
+			return SBI_EINVAL;
+		}
+
+		rc = sbi_irqchip_set_affinity(parent, aplic->parent_irq_map[hwirq], hart_index);
+		if (rc) {
+			sbi_printf("sbi_irqchip_set_affinity: failed hwirq=%lu rc=%d\n",
+				   (unsigned long)hwirq, rc);
+			return rc;
+		}
+		return 0;
+	}
+
 	idc_index = aplic_find_idc_index(aplic, hart_index);
 	if (idc_index < 0)
 		return SBI_EINVAL;
@@ -469,13 +644,13 @@ static void aplic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
 }
 
 static struct sbi_irqchip_device aplic_irqchip_template = {
-	.warm_init		= aplic_warm_init,
+	.warm_init			= aplic_warm_init,
 	.process_hwirqs		= aplic_process_hwirqs,
 	.hwirq_setup		= aplic_hwirq_setup,
 	.hwirq_cleanup		= aplic_hwirq_cleanup,
-	.hwirq_eoi		= aplic_hwirq_eoi,
+	.hwirq_eoi			= aplic_hwirq_eoi,
 	.hwirq_set_affinity	= aplic_hwirq_set_affinity,
-	.hwirq_mask		= aplic_hwirq_mask,
+	.hwirq_mask			= aplic_hwirq_mask,
 	.hwirq_unmask		= aplic_hwirq_unmask,
 };
 
@@ -484,21 +659,44 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	int rc;
 	struct aplic_delegate_data *deleg;
 	u32 first_deleg_irq, last_deleg_irq, i;
+	bool msi_mode;
 
-	/* Sanity checks */
-	if (!aplic ||
-	    !aplic->num_source || APLIC_MAX_SOURCE <= aplic->num_source ||
-	    APLIC_MAX_IDC <= aplic->num_idc)
+	msi_mode = aplic_is_msi_mode(aplic);
+	if (!aplic->num_source) {
+		sbi_printf("aplic_cold_irqchip_init: num_source is zero\n");
 		return SBI_EINVAL;
+	}
+
+	if (APLIC_MAX_SOURCE <= aplic->num_source) {
+		sbi_printf("aplic_cold_irqchip_init: num_source=%lu exceeds max=%lu\n",
+			   (unsigned long)aplic->num_source,
+			   (unsigned long)APLIC_MAX_SOURCE);
+		return SBI_EINVAL;
+	}
+
+	if (!msi_mode && APLIC_MAX_IDC <= aplic->num_idc) {
+		sbi_printf("aplic_cold_irqchip_init: num_idc=%lu exceeds max=%lu\n",
+			   (unsigned long)aplic->num_idc,
+			   (unsigned long)APLIC_MAX_IDC);
+		return SBI_EINVAL;
+	}
+
 	if (aplic->targets_mmode && aplic->has_msicfg_mmode) {
 		rc = aplic_check_msicfg(&aplic->msicfg_mmode);
-		if (rc)
+		if (rc) {
+			sbi_printf("aplic_cold_irqchip_init: invalid M-mode msicfg rc=%d\n",
+				   rc);
 			return rc;
+		}
 	}
+
 	if (aplic->targets_mmode && aplic->has_msicfg_smode) {
 		rc = aplic_check_msicfg(&aplic->msicfg_smode);
-		if (rc)
+		if (rc) {
+			sbi_printf("aplic_cold_irqchip_init: invalid S-mode msicfg rc=%d\n",
+				   rc);
 			return rc;
+		}
 	}
 
 	/* Init the APLIC registers */
@@ -531,22 +729,38 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 			return rc;
 	}
 
-	if ((aplic->targets_mmode) && aplic_is_direct_mode(aplic)) {
+	if ((aplic->targets_mmode)) {
 		aplic->irqchip		 = aplic_irqchip_template;
 		aplic->irqchip.id	 = aplic->unique_id;
 		aplic->irqchip.caps = SBI_IRQCHIP_CAPS_WIRED;
 		aplic->irqchip.num_hwirq = aplic->num_source + 1;
 
-		for (i = 0; i < aplic->num_idc; i++)
-			sbi_hartmask_set_hartindex(aplic->idc_map[i],
-						   &aplic->irqchip.target_harts);
+		if (msi_mode) {
+			aplic->irqchip.warm_init      = NULL;
+			aplic->irqchip.process_hwirqs = NULL;
+			aplic->irqchip.hwirq_eoi      = NULL;
+		}
+
+		if (msi_mode)
+			sbi_hartmask_set_all(&aplic->irqchip.target_harts);
+		else
+			for (i = 0; i < aplic->num_idc; i++)
+				sbi_hartmask_set_hartindex(aplic->idc_map[i],
+							   &aplic->irqchip.target_harts);
+
+		aplic->parent_irq_map = sbi_zalloc(sizeof(aplic->num_source));
+		if (!aplic->parent_irq_map)
+			return SBI_ENOMEM;
+		aplic_msi_ptrs = sbi_zalloc(sizeof(struct aplic_msi_data *) * aplic->num_source);
+		if (!aplic_msi_ptrs)
+			return SBI_ENOMEM;
 
 		rc = sbi_irqchip_add_device(&aplic->irqchip);
 		if (rc) {
 			sbi_printf("aplic_cold_irqchip_init: sbi_irqchip_add_device failed rc=%d id=%lu mode=%s target_weight=%lu\n",
 				rc,
 				(unsigned long)aplic->irqchip.id,
-				"direct",
+				msi_mode ? "msi" : "direct",
 				(unsigned long)sbi_hartmask_weight(
 					&aplic->irqchip.target_harts));
 			return rc;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
