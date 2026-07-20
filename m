Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12888C44515
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 21:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6wdu6jXVlVO5lg2QN48su9pBfdLKxr4IEpnRFGAtYw=; b=Zr+T94w6uQSizq
	vIPJUEBmEfBtbSTL8n9mOagkwjVX5RMD94BPAbVFjwFbUWYr+P6CsKWvsbZjoxhjNcZTTSxRxanei
	BLuBAz/CeENvtD+hA571X+qqdDjP1UiHyX3iIiVvKqah1/ItpbXWhIfbsFao1SHxnlvl0WZS3Sq2C
	6gshFU5o/q5LnPsK3nigIiiGSpQRVKaqS0fNcSOe8ojkw4spAj+Q4Bx6MLsP4K2pKrBdvz2+tXhIq
	yiaQY0RYGHohURfTWjkFKqacfKpdlPAo80n2pYLNF/jpK65ReUchwXL/jSTwHEzWDugX8Zsml/N41
	r3jowy5IGjoZkMXprc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDT-00000007umD-24ZF;
	Mon, 20 Jul 2026 21:07:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDO-00000007uk8-4947
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 21:07:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJU3Ov3623992
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gsNdGRD5ClO
	Q0wfMtttRDoJE8HtTsu7UcYHvrqhEegE=; b=WSks/Tm1KSlNXNMBqiAEk13ruzF
	byOFgXnJYmvIJLVxoH2YcAQQtloGZMe9GZH5M+GMRy/5lkt+MKiLi+05gWuxAKqw
	yhX5dF/4tlCIkjmbk5899rIi5WoxZocak1IWe6fFQ5FnvwAyu95fH/sd7RinmCRb
	fvR4ccKIa/ecSV/oLQAcU/VP2vVHcjEIyi0ZKrkENxSY0vMIYndNZH2mspTwDTZl
	liMP0yUHl5YuHLc/VBSNyv+6gsYN6pfMPC0z+Kzy5fxxaQExOHbV9URILimf5AQg
	EaO2kFHKy6G6QtXGeOQfWr5YHIKPGDN5+5XcIW/T+9wJfK/KzthZdnzT5gQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxkc8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:54 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KL7rwU009753;
	Mon, 20 Jul 2026 21:07:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj6jg0a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:53 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KL6JV0007994
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:53 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 66KL7r5L009748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:53 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 256EC22191; Mon, 20 Jul 2026 14:07:53 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v4 2/6] lib: utils/irqchip/aplic: add MSI mode support with IMSIC parent linking
Date: Mon, 20 Jul 2026 14:07:42 -0700
Message-ID: <20260720210748.2893688-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
References: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e8e2a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=L7T4x60bSvCW0hP-ZQYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX8AWFtGEL4MKZ
 HFakg75rIkXXwHZT5HwkELUmpkjXTjiv1ShoOuMr/eukGkrRUicSdGOZQbQJDhZqTfjj3Mn0aiz
 VPAulQ23vU76I/1mCZaQUNSpPUffwHg=
X-Proofpoint-GUID: NIl1db_dfp5XVuncQS_jRSbXgVXkybR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX6NvcAciJd+fC
 Yr1UwCIcLc7loTOh+54pKumEY658PaTytRvBoAUVbkL4ZRTIAS7K/c7bsdc+Y4DpypOmnqL4Amw
 2OZSnaC8KSZRKZymAs+lnn6pybuYlivSO8LgFA0EQ8vMZybUoznDMwJV7pfgqX3e8TW4llFC1DW
 fdXHtOYdXquwuAkwCLUgyRk7Lmtzxf1Dnur7N/nNIIm5hYN0K7GD58kVRfSKVYBA5zkVXB0Bgmn
 z2+UvgSbwmVexxur52PLrzUeiuTTNquuWjOS0Uy69+mvG4zSUw6H7sLMR3aWFOexhi8s2cOggkl
 sDBcgD2RKo2zgiC7TSpj6hjY3P0Bm5BMub5Za0pVIJPXbgyQUn/72iQ6IbhBUuEBRhKK5qP2DSo
 hVk5KdyoXENh6jzzh48CsiEKavWX1TPqRYKy5AHduzf05XbdaU02Jld3v4kQ0TjtlJeY3q+O2hP
 Bx8rOt0O9yDKVW7cvVw==
X-Proofpoint-ORIG-GUID: NIl1db_dfp5XVuncQS_jRSbXgVXkybR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_140755_033088_5DD5E318 
X-CRM114-Status: GOOD (  24.56  )
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
 include/sbi/sbi_irqchip.h         |   3 +
 include/sbi_utils/irqchip/aplic.h |   2 +
 lib/sbi/sbi_irqchip.c             |   7 +
 lib/utils/fdt/fdt_helper.c        |   1 +
 lib/utils/irqchip/aplic.c         | 223 ++++++++++++++++++++++++++++--
 5 files changed, 221 insertions(+), 15 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index e778d747..7f6c763c 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -107,6 +107,9 @@ int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
 /** Mask a hardware interrupt */
 int sbi_irqchip_mask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
 
+/** Helper to retrieve handler's private data */
+struct aplic_msi_data *sbi_irqchip_get_handler_priv(struct sbi_irqchip_device *chip, u32 hwirq);
+
 /** Default raw hardware interrupt handler */
 int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq);
 
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
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 6d0df02e..8923d2a2 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -113,6 +113,13 @@ static struct sbi_irqchip_handler *sbi_irqchip_find_handler(struct sbi_irqchip_d
 	return NULL;
 }
 
+struct aplic_msi_data *sbi_irqchip_get_handler_priv(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct sbi_irqchip_handler *handler = sbi_irqchip_find_handler(chip, hwirq);
+
+	return (struct aplic_msi_data *) handler->priv;
+}
+
 int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq)
 {
 	struct sbi_irqchip_handler *h;
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index ad4efaaf..747ba028 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -664,6 +664,7 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
 
 	rc = fdt_aplic_find_imsic_node(fdt, nodeoff, &imsic, true);
 	if (!rc) {
+		aplic->parent_unique_id = imsic.unique_id;
 		aplic->targets_mmode = true;
 		aplic->has_msicfg_mmode = true;
 		aplic->msicfg_mmode.lhxs = imsic.guest_index_bits;
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index efc25555..c329ed7a 100644
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
@@ -125,6 +128,11 @@
 #define APLIC_DISABLE_ITHRESHOLD	1
 #define APLIC_ENABLE_ITHRESHOLD		0
 
+struct aplic_msi_data {
+	struct aplic_data *aplic;
+	u32 hwirq;
+};
+
 static SBI_LIST_HEAD(aplic_list);
 static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
 				void *msicfgaddr, void *msicfgaddrH);
@@ -292,6 +300,8 @@ static void aplic_init(struct aplic_data *aplic)
 	}
 
 	domaincfg = APLIC_DOMAINCFG_IE;
+	if (!aplic_is_direct_mode(aplic))
+		domaincfg |= APLIC_DOMAINCFG_DM;
 
 	writel(domaincfg, (void *)(aplic->addr + APLIC_DOMAINCFG));
 }
@@ -357,6 +367,8 @@ static int aplic_warm_init(struct sbi_irqchip_device *chip)
 	int idc_index;
 
 	aplic = container_of(chip, struct aplic_data, irqchip);
+	if (!aplic_is_direct_mode(aplic))
+		return 0;
 
 	hart_index = current_hartindex();
 	idc_index  = aplic_find_idc_index(aplic, hart_index);
@@ -377,7 +389,10 @@ static int aplic_process_hwirqs(struct sbi_irqchip_device *chip)
     u32 hart_index, claimi, hwirq;
     int idc_index, rc = 0, tmp;
 
-    aplic = container_of(chip, struct aplic_data, irqchip);
+	aplic = container_of(chip, struct aplic_data, irqchip);
+
+	if (!aplic_is_direct_mode(aplic))
+		sbi_panic("aplic_process_hwirqs called in MSI mode.\n");
 
     hart_index = current_hartindex();
     idc_index  = aplic_find_idc_index(aplic, hart_index);
@@ -402,11 +417,125 @@ static int aplic_process_hwirqs(struct sbi_irqchip_device *chip)
     return rc;
 }
 
+static void aplic_hwirq_eoi(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct aplic_data *aplic;
+    u32 sm;
+
+	aplic = container_of(chip, struct aplic_data, irqchip);
+    if (aplic_is_direct_mode(aplic))
+        return;
+
+    sm = aplic_sourcecfg_read(aplic, hwirq) & APLIC_SOURCECFG_SM_MASK;
+    if (sm == APLIC_SOURCECFG_SM_LEVEL_HIGH ||
+        sm == APLIC_SOURCECFG_SM_LEVEL_LOW)
+        aplic_irq_clrip(aplic, hwirq);
+}
+
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
+static u32 derive_hart_index(struct aplic_msicfg_data *msicfg,
+                             const struct sbi_irqchip_msi_msg *msg)
+{
+	u64 addr = ((u64)msg->address_hi << 32) | msg->address_lo;
+	u64 tppn = addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
+	u32 group_index, hart_index;
+
+	group_index = (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(msicfg->hhxs)) &
+		      APLIC_xMSICFGADDR_PPN_HHX_MASK(msicfg->hhxw);
+
+	hart_index = (tppn >> msicfg->lhxs) &
+		     ((1UL << msicfg->lhxw) - 1);
+
+	hart_index |= (group_index << msicfg->lhxw);
+
+	return hart_index;
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
+	aplic_program_msi_target(msi_data->aplic, msi_data->hwirq,
+				derive_hart_index(&msi_data->aplic->msicfg_mmode, msg),
+				guest_index, eiid);
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
+	struct aplic_msi_data *msi_data;
+    int rc;
+
+    parent = sbi_irqchip_find_device(aplic->parent_unique_id);
+    if (!parent) {
+        sbi_printf("aplic_hwirq_setup: msi_parent is NULL hwirq=%lu\n",
+                   (unsigned long)hwirq);
+        return SBI_EINVAL;
+    }
+
+    msi_data = sbi_zalloc(sizeof(struct aplic_msi_data));
+    if (!msi_data)
+        return SBI_ENOMEM;
+
+    msi_data->aplic = aplic;
+    msi_data->hwirq = hwirq;
+
+    rc = sbi_irqchip_register_msi(parent, 1,
+                                 aplic_write_msi,
+                                 aplic_msi_callback,
+                                 msi_data,
+                                 &first_hwirq);
+    if (rc) {
+        sbi_printf("aplic_hwirq_setup: register_msi failed hwirq=%lu rc=%d\n",
+                   (unsigned long)hwirq, rc);
+        sbi_free(msi_data);
+        return rc;
+    }
+
+    aplic->parent_irq_map[hwirq] = first_hwirq;
+
+    return 0;
+}
+
 static int aplic_hwirq_setup(struct sbi_irqchip_device *chip,
 			     u32 hwirq, u32 hwirq_flags)
 {
 	struct aplic_data *aplic;
-	u32 sourcecfg;	
+	u32 sourcecfg;
 
 	aplic = container_of(chip, struct aplic_data, irqchip);
 
@@ -417,6 +546,7 @@ static int aplic_hwirq_setup(struct sbi_irqchip_device *chip,
 			   (unsigned long)hwirq);
 		return SBI_EINVAL;
 	}
+
 	aplic_sourcecfg_write(aplic, hwirq, sourcecfg);
 
 	if (aplic_hwirq_is_delegated(aplic, hwirq)) {
@@ -428,12 +558,16 @@ static int aplic_hwirq_setup(struct sbi_irqchip_device *chip,
 	aplic_irq_clrie(aplic, hwirq);
 	aplic_irq_clrip(aplic, hwirq);
 
+	if (!aplic_is_direct_mode(aplic))
+		return aplic_setup_msi(aplic, hwirq);
+
 	return 0;
 }
 
 static void aplic_hwirq_cleanup(struct sbi_irqchip_device *chip, u32 hwirq)
 {
 	struct aplic_data *aplic;
+	struct aplic_msi_data *msi_data;
 
 	aplic = container_of(chip, struct aplic_data, irqchip);
 	if (aplic_hwirq_is_delegated(aplic, hwirq))
@@ -443,18 +577,40 @@ static void aplic_hwirq_cleanup(struct sbi_irqchip_device *chip, u32 hwirq)
 	aplic_irq_clrip(aplic, hwirq);
 	aplic_sourcecfg_write(aplic, hwirq, APLIC_SOURCECFG_SM_INACTIVE);
 	aplic_target_write(aplic, hwirq, APLIC_DEFAULT_PRIORITY);
+	msi_data = sbi_irqchip_get_handler_priv(chip, hwirq);
+	if (msi_data)
+		sbi_free(msi_data);
 }
 
 static int aplic_hwirq_set_affinity(struct sbi_irqchip_device *chip,
 				    u32 hwirq, u32 hart_index)
 {
 	struct aplic_data *aplic;
+	struct sbi_irqchip_device *parent;
 	int idc_index;
+	int rc;
 
 	aplic = container_of(chip, struct aplic_data, irqchip);
 	if (aplic_hwirq_is_delegated(aplic, hwirq))
 		return SBI_ENOTSUPP;
 
+	if (!aplic_is_direct_mode(aplic)) {
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
@@ -489,12 +645,13 @@ static void aplic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
 }
 
 static struct sbi_irqchip_device aplic_irqchip_template = {
-	.warm_init		= aplic_warm_init,
+	.warm_init			= aplic_warm_init,
 	.process_hwirqs		= aplic_process_hwirqs,
+	.hwirq_eoi			= aplic_hwirq_eoi,
 	.hwirq_setup		= aplic_hwirq_setup,
 	.hwirq_cleanup		= aplic_hwirq_cleanup,
 	.hwirq_set_affinity	= aplic_hwirq_set_affinity,
-	.hwirq_mask		= aplic_hwirq_mask,
+	.hwirq_mask			= aplic_hwirq_mask,
 	.hwirq_unmask		= aplic_hwirq_unmask,
 };
 
@@ -503,21 +660,44 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	int rc;
 	struct aplic_delegate_data *deleg;
 	u32 first_deleg_irq, last_deleg_irq, i;
+	bool msi_mode;
 
-	/* Sanity checks */
-	if (!aplic ||
-	    !aplic->num_source || APLIC_MAX_SOURCE <= aplic->num_source ||
-	    APLIC_MAX_IDC <= aplic->num_idc)
+	msi_mode = !aplic_is_direct_mode(aplic);
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
@@ -550,22 +730,35 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
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
