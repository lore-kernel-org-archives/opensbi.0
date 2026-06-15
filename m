Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DC5CD98E1
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfKd/5OMuJkzeJumiJOWgl0Nper4n5VM22qC4VRchzM=; b=npRk/3V3J1eqvw
	Xj00kFXuz2vgym4IPUa9meOhPYQ8czrLvc7wDFwap0pTHA9Iikj64hZi4EoBXzbPUS9cPiKscSpqP
	Pg/RGn3wpOD5PgL2C3BT+pnr07amqaJLX+HRAhGx6CV0w8khuQW4aiXUxqrp3CiTOqL3eaiPe7a5Y
	BvB0NLmiSUNP104YwHDjymuC3sSeMmEEF09gwa56LJwlGxVeY/wcS8+mliQ94XYdbBTsfl0Nxl1Uq
	ecDvluAEdG1Njfml6K3zDd51Inyey+wJPj8tFtir6fegU5Uxi9dRFYcTi40bK5SYpnd88EdcB0DVA
	QJQI06ZSzFpxVhDtAcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxf-0000000EdXd-3wLw;
	Mon, 15 Jun 2026 17:18:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxc-0000000EdVA-1tGk
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 17:18:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhLHv3139322
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EpnXkhYXHCn
	VOU+mrZVTNQvQpX6TdxxYqMNMPOt+wZo=; b=VBsqD74JOE7jtUviDcoY9UqsE44
	2ma118pjbixRsW2VfFag10T7prxrLI5P6b8Iwh61YKqbcy/V0Ryv4Wfy4WRC2rSL
	LldmILthqMCqfzzIsNkcVl6OvrRzvF2ANn9sUzurrK4IgwNfvpo4gAIYcCKfu5hr
	CTQ/d6cvM0+dsa9Umw14ZgexNoPfWBFZR8aJPEWs50677KSPfRR62DIow8kCoIpi
	s2SRHqHC+j+zyuplRg29I25FMBuLvauFJ9/AXWnaQcwpPoVOtHZr4S+u5LPWnWh/
	RiH+9uqAsrBPSGPD9gC01Tp2/PtRhaIMLnCq2UA6bL0/oixkAjgGvi8hHWQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete98257x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65FHIt61014676;
	Mon, 15 Jun 2026 17:18:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4etk129hhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65FHIsxK014653
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:54 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 65FHIs8Q014651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 17:18:54 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id B776524E67; Mon, 15 Jun 2026 10:18:54 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH 4/7] lib: utils/irqchip/imsic:migrate to irqchip framework
Date: Mon, 15 Jun 2026 10:18:49 -0700
Message-ID: <20260615171852.447545-5-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
References: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a3033ff cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=xYZ_hGR2hrIPzfnWWYoA:9
X-Proofpoint-GUID: f8_y10PEqU6xUvYxOrcMHfSH67fPRXyL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX6rvM4mtIFjM0
 +Icd08InNibLM/VV+V43KZuoQuHEVdjQjVGWkT6dIHeX8HEtdC8yOTX9qYcSeUntgjaUBp17yde
 GtScMRTDbG852IHHamQphKWd/58Tu+g=
X-Proofpoint-ORIG-GUID: f8_y10PEqU6xUvYxOrcMHfSH67fPRXyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX/OtG1zy//UX+
 exCWn8H7d1tP0wq/K7owcGlEG34f5T+JIJEr2hA9Tm5VGp4XTQRpi58bwdPpjL4lTMujhm6WFff
 umrNBVodFrqbKeEiyb+VC1UgV8/JZ/ic2c0ie7BGlPjDVxlilLyNx7Qb9Hpv8LP0Hr5ql5kXJKB
 dNu8TtbRRv1PyoTB/nPa30LhBW2IDQt4TVxfYdnzwNmVyp9yQqd9dfs391OPQ3IcwH14zrTeJml
 anrBWJ8rR8PY8EQ9RNjzFxWh3RuDEDsymIkOBG7SU4tPLOgyJFQnOkaLHMOwKM0xLftX8vIEcnj
 J1ADqmq0eDD/U7XZ+dAReofkjkZBKfKEubhhxtAYe38LosOopMzL1hHzsTadcMhJ5riK2dX0LSr
 MbCeZE71QLfb/yFFO0YMA0QfT8QMXmO66A6X2wl6wFbwQXWAIT8K9hE5gyxO+kJHy5LPrcrNxGl
 fuii7NAQ1boYG1xynrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_101856_500885_0B17AC22 
X-CRM114-Status: GOOD (  23.96  )
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

Rewrite imsic_process_hwirqs() to use container_of() for instance
lookup, validate ownership via imsic_current_hart_owner(), mask
IMSIC_TOPEI_ID_MASK on the raw CSR value, and dispatch non-IPI EIIDs
through sbi_irqchip_process_hwirq() instead of an open-coded switch.

Rewrite imsic_warm_irqchip_init() to resolve the imsic_data instance
via container_of() from the sbi_irqchip_device pointer, and skip
initialization silently for harts not owned by this instance.

Extend the sbi_irqchip callback set:
- hwirq_setup: registers sbi_irqchip_raw_handler_default for the EIID
- hwirq_cleanup: clears EIE and EIP bits for the EIID on the owner hart
- hwirq_eoi: no-op as claim/ack is already performed by CSR_MTOPEI
  read in imsic_process_hwirqs()
- hwirq_set_affinity: reprograms the upstream MSI source via
  imsic_program_msi() to retarget the interrupt to the new hart
- hwirq_mask: clears the EIE bit for the EIID on the owner hart
- hwirq_unmask: sets the EIE bit for the EIID on the owner hart,
  skipping IPI (EIID 1) and non-owner harts

Add imsic_compose_msi_msg() to compute the MMIO target address for a
given hart and EIID by walking the imsic_regs array and applying file
and guest index offsets.

Add imsic_program_msi() that composes an MSI message
and delivers it to the upstream interrupt source via
sbi_irqchip_write_msi(), enabling APLIC TARGET register programming
from the IMSIC driver.

Migrate imsic_cold_irqchip_init() to the instance-based model:
preserve any pre-configured target_harts mask set by platform or FDT
code before applying the imsic_device template, falling back to
sbi_hartmask_set_all() only when no mask was provided. Register the
irqchip and reserved EIIDs on the embedded irqchip rather than the
global singleton.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 lib/utils/irqchip/imsic.c | 254 +++++++++++++++++++++++++++++++++++---
 1 file changed, 234 insertions(+), 20 deletions(-)

diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 2abdc8ef..5d628901 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -151,26 +151,41 @@ static int imsic_process_hwirqs(struct sbi_irqchip_device *chip)
 {
 	struct imsic_data *imsic;
 	ulong mirq;
+	u32 hwirq;
+	int rc, ret = 0;
 
 	imsic = container_of(chip, struct imsic_data, irqchip);
 	if (!imsic || !imsic->targets_mmode)
 		return SBI_EINVAL;
 
+	if (imsic_get_data(current_hartindex()) != imsic)
+		return 0;
+
 	while ((mirq = csr_swap(CSR_MTOPEI, 0))) {
-		mirq = (mirq >> IMSIC_TOPEI_ID_SHIFT);
+		hwirq = (mirq >> IMSIC_TOPEI_ID_SHIFT) &
+			IMSIC_TOPEI_ID_MASK;
+
+		if (hwirq > imsic->num_ids) {
+			sbi_printf("imsic_process_hwirqs: invalid hwirq=%lu num_ids=%lu\n",
+				   (unsigned long)hwirq,
+				   (unsigned long)imsic->num_ids);
+			continue;
+		}
 
-		switch (mirq) {
-		case IMSIC_IPI_ID:
+		if (hwirq == IMSIC_IPI_ID) {
 			sbi_ipi_process();
-			break;
-		default:
-			sbi_printf("%s: unhandled IRQ%d\n",
-				   __func__, (u32)mirq);
-			break;
+			continue;
+		}
+
+		rc = sbi_irqchip_process_hwirq(chip, hwirq);
+		if (rc && rc != SBI_ENOENT) {
+			sbi_printf("imsic_process_hwirqs: hwirq=%lu failed rc=%d\n",
+				   (unsigned long)hwirq, rc);
+			ret = rc;
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 static void imsic_ipi_send(u32 hart_index)
@@ -360,18 +375,204 @@ static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq, u32 hwi
 {
 	if (hwirq_flags != SBI_HWIRQ_FLAGS_NONE)
 		return SBI_ENOTSUPP;
+
+	sbi_irqchip_set_raw_handler(chip, hwirq,
+				    sbi_irqchip_raw_handler_default);
+
+	return 0;
+}
+
+static void imsic_hwirq_cleanup(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct imsic_data *imsic;
+
+	if (!chip)
+		return;
+
+	imsic = container_of(chip, struct imsic_data, irqchip);
+	if (!imsic || !imsic->targets_mmode)
+		return;
+
+	imsic_local_eix_update(hwirq, 1, false, false);
+	imsic_local_eix_update(hwirq, 1, true, false);
+}
+
+static void imsic_hwirq_eoi(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	/*
+	 * IMSIC interrupt claim/ack is already done by reading CSR_MTOPEI
+	 * in imsic_process_hwirqs(). No extra EOI operation is required.
+	 */
+}
+
+static int imsic_compose_msi_msg(struct imsic_data *imsic,
+				 u32 hart_index, u32 eiid,
+				 struct sbi_irqchip_msi_msg *msg)
+{
+	struct imsic_regs *regs;
+	unsigned long reloff;
+	unsigned long msi_addr;
+	int file;
+
+	if (!imsic || !msg)
+		return SBI_EINVAL;
+
+	if (!eiid || eiid == IMSIC_IPI_ID)
+		return 0;
+
+	file = imsic_get_target_file(hart_index);
+	if (file < 0) {
+		sbi_printf("imsic_compose_msi_msg: no file for hart=%lu rc=%d\n",
+			   (unsigned long)hart_index, file);
+		return file;
+	}
+
+	regs   = &imsic->regs[0];
+	reloff = file * (1UL << imsic->guest_index_bits) * IMSIC_MMIO_PAGE_SZ;
+
+	while (regs->size && regs->size <= reloff) {
+		reloff -= regs->size;
+		regs++;
+	}
+
+	if (!regs->size || regs->size <= reloff) {
+		sbi_printf("imsic_compose_msi_msg: no regset for hart=%lu "
+			   "file=%d reloff=0x%lx\n",
+			   (unsigned long)hart_index, file, reloff);
+		return SBI_ENODEV;
+	}
+
+	msi_addr = regs->addr + reloff + IMSIC_MMIO_PAGE_LE;
+
+	msg->hart_index = hart_index;
+	msg->address_lo = (u32)(msi_addr);
+	msg->address_hi = (u32)(msi_addr >> 32);
+	msg->data       = eiid;
+
+	sbi_printf("imsic_compose_msi_msg: hart=%lu file=%d eiid=%lu "
+		   "addr=0x%lx data=%lu\n",
+		   (unsigned long)hart_index, file,
+		   (unsigned long)eiid, msi_addr,
+		   (unsigned long)eiid);
+
+	return 0;
+}
+
+static int imsic_program_msi(struct sbi_irqchip_device *chip,
+		      u32 eiid, u32 hart_index)
+{
+	struct imsic_data *imsic;
+	struct sbi_irqchip_msi_msg msg;
+	int rc;
+
+	if (!chip)
+		return SBI_EINVAL;
+
+	imsic = imsic_get_data(hart_index);
+	if (!imsic || !imsic->targets_mmode)
+		return SBI_ENODEV;
+
+	rc = imsic_compose_msi_msg(imsic, hart_index, eiid, &msg);
+	if (rc) {
+		sbi_printf("imsic_program_msi: compose failed "
+			   "eiid=%lu hart=%lu rc=%d\n",
+			   (unsigned long)eiid,
+			   (unsigned long)hart_index, rc);
+		return rc;
+	}
+
+	rc = sbi_irqchip_write_msi(chip, eiid, &msg);
+	if (rc) {
+		sbi_printf("imsic_program_msi: write_msi failed "
+			   "eiid=%lu hart=%lu rc=%d\n",
+			   (unsigned long)eiid,
+			   (unsigned long)hart_index, rc);
+		return rc;
+	}
+
 	return 0;
 }
 
+static int imsic_hwirq_set_affinity(struct sbi_irqchip_device *chip,
+				    u32 hwirq, u32 hart_index)
+{
+	struct imsic_data *imsic;
+	int rc;
+
+	if (!chip)
+		return SBI_EINVAL;
+
+	imsic = container_of(chip, struct imsic_data, irqchip);
+	if (!imsic || !imsic->targets_mmode)
+		return SBI_EINVAL;
+
+	if (!hwirq || hwirq == IMSIC_IPI_ID)
+		return 0;
+
+	if (!sbi_hartmask_test_hartindex(hart_index, &chip->target_harts))
+		return SBI_EINVAL;
+
+	rc = imsic_program_msi(chip, hwirq, hart_index);
+	if (rc) {
+		sbi_printf("imsic_hwirq_set_affinity: failed hwirq=%lu "
+			   "hart=%lu rc=%d\n",
+			   (unsigned long)hwirq,
+			   (unsigned long)hart_index, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static void imsic_hwirq_mask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct imsic_data *imsic;
+
+	if (!chip)
+		return;
+
+	imsic = container_of(chip, struct imsic_data, irqchip);
+	if (!imsic || !imsic->targets_mmode)
+		return;
+
+	imsic_local_eix_update(hwirq, 1, false, false);
+}
+
+static void imsic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct imsic_data *imsic;
+
+	if (!chip)
+		return;
+
+	imsic = container_of(chip, struct imsic_data, irqchip);
+	if (!imsic || !imsic->targets_mmode)
+		return;
+
+	if (!hwirq || hwirq == IMSIC_IPI_ID)
+		return;
+
+	imsic_local_eix_update(hwirq, 1, false, true);
+
+	sbi_printf("imsic_hwirq_unmask: hart=%lu eiid=%u\n",
+		   (unsigned long)current_hartindex(), hwirq);
+}
+
 static struct sbi_irqchip_device imsic_device = {
-	.warm_init	= imsic_warm_irqchip_init,
-	.process_hwirqs	= imsic_process_hwirqs,
-	.hwirq_setup	= imsic_hwirq_setup,
+	.warm_init		= imsic_warm_irqchip_init,
+	.process_hwirqs		= imsic_process_hwirqs,
+	.hwirq_setup		= imsic_hwirq_setup,
+	.hwirq_cleanup		= imsic_hwirq_cleanup,
+	.hwirq_eoi		= imsic_hwirq_eoi,
+	.hwirq_set_affinity	= imsic_hwirq_set_affinity,
+	.hwirq_mask		= imsic_hwirq_mask,
+	.hwirq_unmask		= imsic_hwirq_unmask,
 };
 
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
 {
 	int i, rc;
+	struct sbi_hartmask target_harts;
 
 	/* Sanity checks */
 	rc = imsic_data_check(imsic);
@@ -408,20 +609,33 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 			return rc;
 	}
 
-	/* Register irqchip device */
-	imsic->irqchip = imsic_device;
-	imsic->irqchip.id = imsic->unique_id;
+	target_harts = imsic->irqchip.target_harts;
+
+	imsic->irqchip          = imsic_device;
+	imsic->irqchip.id       = imsic->unique_id;
 	imsic_device.caps = SBI_IRQCHIP_CAPS_MSI;
 	imsic->irqchip.num_hwirq = imsic->num_ids + 1;
-	sbi_hartmask_set_all(&imsic->irqchip.target_harts);
+
+	if (sbi_hartmask_weight(&target_harts))
+		imsic->irqchip.target_harts = target_harts;
+	else
+		sbi_hartmask_set_all(&imsic->irqchip.target_harts);
+
+	/* Register irqchip device */
 	rc = sbi_irqchip_add_device(&imsic->irqchip);
-	if (rc)
+	if (rc) {
+		sbi_printf("imsic_cold_irqchip_init: sbi_irqchip_add_device "
+			   "failed rc=%d\n", rc);
 		return rc;
+	}
 
-	/* Mark hwirq 0 and IPI hwirq as reserved */
-	rc = sbi_irqchip_register_reserved(&imsic->irqchip, 0, IMSIC_IPI_ID + 1);
-	if (rc)
+	rc = sbi_irqchip_register_reserved(&imsic->irqchip, 0,
+					   IMSIC_IPI_ID + 1);
+	if (rc) {
+		sbi_printf("imsic_cold_irqchip_init: register_reserved "
+			   "failed rc=%d\n", rc);
 		return rc;
+	}
 
 	/* Register IPI device */
 	sbi_ipi_add_device(&imsic_ipi_device);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
