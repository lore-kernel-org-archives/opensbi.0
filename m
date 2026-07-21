Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9AAC4453A
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 21:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+srgbQf/OQqiI6/cK7QR5ENDJlA/VB3wv1z7kOd3o/4=; b=H14orJA/Jfqt7g
	TeUMzpJiXJ6smqcbUHtuUKFQvWPZWPuSnQ+gJaP/5h/M4zk1ArRMRczjPTzb/39b4hLW+v/b94cMX
	30RpyX6mKs4fq6YFDkZIf+gidXrF61oOZINYebAYUvA8CsJh5yDGyRdM1d2qORPjzsJ+0opoO2msZ
	N11Xlbq04KkbX/J5LFbzsB3czEsVdCS+uml9lYh4JJ1LGcefH0rPyOy1vC86/+tQcStJ0ItIBVZXG
	cT0BM20FUKQiQWp0OSyMZmzwZgB50IBzpGdPCkZIqx+jwSTNfHKs0Ek/ereSXuWKY+tWywHFPMxjt
	NBvaWvKoAXV6655ByHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKV-0000000ATYJ-1VQm;
	Tue, 21 Jul 2026 21:48:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKN-0000000ATTn-1gXX
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 21:48:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlnqP2904778;
	Tue, 21 Jul 2026 21:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wzLDf7q/K83
	86qv6+DhTUfP5ZG5BGe5Oxn6keNw3Mxs=; b=pC3ZBrEFcz+w3TqYaUtRvu75vjo
	hQtvh15MwfoyrbEAziOEaUOYhkK1n5E1UekltfULx8hEUOIF5OchjV2HqljyPcD7
	4JXLYfvBTkB+g2thEadLkR00TIGmwnhrzZ3b1MDLCPrFtusEr7+rOEs3OfnB3sce
	Pk2qSIcyM/FPRgGA9pfXHITXBTUg1WJ4TUmwZQ7EM0AYlkVMqh4f1iY9kZIMK/h1
	gAcEvra0qvZVdeWn8m5gJbGySxZHbuZwlkqD3ky3dLbrhQSEZ/CFfWi5u/EXiBpU
	fuSNqjTzKhYhvTYjinIaaESBntrZ+gmFV1wEodxfbcm4gkCvRE2npC+WpcQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d10yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:37 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66LLk0WD025566;
	Tue, 21 Jul 2026 21:48:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fhx1yt43v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:35 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LLmZsf029224;
	Tue, 21 Jul 2026 21:48:35 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 66LLmZlK029222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:35 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 855E124DFE; Tue, 21 Jul 2026 14:48:35 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH v5 4/6] lib: utils/irqchip/imsic:migrate to irqchip framework
Date: Tue, 21 Jul 2026 14:48:28 -0700
Message-ID: <20260721214833.687361-5-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
References: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: zHfv_uwIdkDUIRuepzwrqdYJFtpoQpnA
X-Proofpoint-ORIG-GUID: zHfv_uwIdkDUIRuepzwrqdYJFtpoQpnA
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5fe935 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=eO4dnEO7znYMZeWyH6gA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfX6zprwj4/odKW
 BDA3UCV1UWOtGAOglDrLvzRJWZ/F5SLpTtUVdocWkXeV5AR36BFwaGnSWHGjNonEYJDImfF5GUn
 j1vTVb15SV42JFWwZ6aQ/Io5y1JZ3J6HL3BQLD7YKaWEMIAtfdmNWHrK2A3amfa8u4dSpSnhLCV
 VASsuzbtciUa5e8DrEg0T86dOe1H9alocXrG8eNycAJtCuce8CFKLInrj1beFOSgmxX7EhiiuHP
 SbszBxhaLNLs5B2V6pv6ARP8bXEACWOcoFAUi/GpENJ1vwarvub1suM7m0kNywbWpOgjwx+Rdqw
 AvavByME7GZa9qGKUm+y6O7rIIMoquLn9T2CZVdpTBJ4S5Gz+USMX3zY6e6wxBmxux0vVGN+Tly
 Y79m4KbF5Sj6VuHujIFtvkRhfDK6luDC67eRVpMCtl8E0InhUKTMY9xmU5GTEZfCwsLq8pHsbId
 /xSiWqVYGqz0AZf6/xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfX+FAttBTUZzML
 c9FE893PXNf0vhBBy780I1EH+JMiggWbkvlJC1poYIqrgq7hLjqSTJk1niHE+wKlJpDKETKLqFg
 cd+B0ioFyH5Pk6wmdLNjo2F839tpfns=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_144839_558698_B75942A2 
X-CRM114-Status: GOOD (  21.90  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/utils/irqchip/imsic.c | 240 +++++++++++++++++++++++++++++++++++---
 1 file changed, 222 insertions(+), 18 deletions(-)

diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 2abdc8ef..40bffcc0 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -151,26 +151,43 @@ static int imsic_process_hwirqs(struct sbi_irqchip_device *chip)
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
+			sbi_printf("%s: invalid hwirq=%lu num_ids=%lu\n",
+					__func__,
+					(unsigned long)hwirq,
+					(unsigned long)imsic->num_ids);
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
+			sbi_printf("%s: hwirq=%lu failed rc=%d\n",
+					__func__,
+					(unsigned long)hwirq, rc);
+			ret = rc;
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 static void imsic_ipi_send(u32 hart_index)
@@ -360,13 +377,193 @@ static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq, u32 hwi
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
+		sbi_printf("%s: no file for hart=%lu rc=%d\n",
+				__func__,
+				(unsigned long)hart_index, file);
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
+		sbi_printf("%s: no regset for hart=%lu file=%d reloff=0x%lx\n",
+			   __func__,
+			   (unsigned long)hart_index, file, reloff);
+		return SBI_ENODEV;
+	}
+
+	msi_addr = regs->addr + reloff + IMSIC_MMIO_PAGE_LE;
+	msg->address_lo = (u32)(msi_addr);
+	msg->address_hi = (u32)(msi_addr >> 32);
+	msg->data       = eiid;
+
+	sbi_printf("%s: hart=%lu file=%d eiid=%lu addr=0x%lx data=%lu\n",
+		   __func__,
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
+		sbi_printf("%s: compose failed eiid=%lu hart=%lu rc=%d\n",
+				__func__,
+				(unsigned long)eiid,
+				(unsigned long)hart_index, rc);
+	}
+
+	rc = sbi_irqchip_write_msi(chip, eiid, &msg);
+	if (rc) {
+		sbi_printf("%s: write_msi failed eiid=%lu hart=%lu rc=%d\n",
+				__func__,
+				(unsigned long)eiid,
+				(unsigned long)hart_index, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
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
+		sbi_printf("%s: failed hwirq=%lu hart=%lu rc=%d\n",
+				__func__,
+				(unsigned long)hwirq,
+				(unsigned long)hart_index, rc);
+		return rc;
+	}
+
 	return 0;
 }
 
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
@@ -408,20 +605,27 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 			return rc;
 	}
 
-	/* Register irqchip device */
-	imsic->irqchip = imsic_device;
-	imsic->irqchip.id = imsic->unique_id;
+	imsic->irqchip          = imsic_device;
+	imsic->irqchip.id       = imsic->unique_id;
 	imsic_device.caps = SBI_IRQCHIP_CAPS_MSI;
 	imsic->irqchip.num_hwirq = imsic->num_ids + 1;
+
 	sbi_hartmask_set_all(&imsic->irqchip.target_harts);
+
+	/* Register irqchip device */
 	rc = sbi_irqchip_add_device(&imsic->irqchip);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: sbi_irqchip_add_device failed rc=%d\n",
+				__func__, rc);
 		return rc;
+	}
 
-	/* Mark hwirq 0 and IPI hwirq as reserved */
 	rc = sbi_irqchip_register_reserved(&imsic->irqchip, 0, IMSIC_IPI_ID + 1);
-	if (rc)
+	if (rc) {
+		sbi_printf("%s: register_reserved failed rc=%d\n",
+				__func__, rc);
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
