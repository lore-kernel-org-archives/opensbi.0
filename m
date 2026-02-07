Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B294EE0AC3
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2/FLvSAI73pqoUvHpIU1/80BypxDKLpC95amJqHDa4=; b=TTod1TRvAT9wfA
	ZW9JN/bAbrHlPPpe5u6JOPk9E7GsNtX4OA4YcKeyFd0MoJBJBfYcmoqNcL1sWszo6vJLYNTWwauA8
	gVyl5ZZpjjHSVDo0QTHlebcUsREIlpvAEpnsRAZd6x6+s6Ofg+j/saVdCOMZp2L6zwlUHjjUcLsvZ
	VD0ic4v6Hd2jMSC5syaNzsezVpXlMRA0ePBZMJwB94QZy1KobN1TC+nYN1P9Xl1/XISmy34nswsIT
	AtTcc9T2kNDPGtPg3MexX3HdblQqs0IwMyUu1Us7yMV1+VvGa9hkQfcJliFDf8iyCe9PBv6YW6kz0
	hDqTtzFAmfICS5XLnVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofW5-0000000CJOL-1yFD;
	Sat, 07 Feb 2026 10:26:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofW2-0000000CJNG-3zai
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:26:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174TMgc1367517;
	Sat, 7 Feb 2026 10:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a1qCr7UtBjH
	H5UxewCkdtSHRdajuKNogDcss+nPGQLc=; b=DT0rrTWonSDS7TrMpU8MvEDTVB5
	715N+qA0jTbxCZ1uaYtUJs9HSjK8+njd49qtpOvaOWJXd2z/HrWJqBdtr+CLD7hI
	GL/JeZAjDzwIH11bmZN34+MbPkTHljfWylwmR9fkuEA7K2w+ilubzfZ10xnCveh4
	a+GLBnyp5xUtpKg3IiYX/AiIuOv0ptFjkCuEvK6A5+19y9DuPR//kOYnFCrZl1nC
	d+79Mm4X+Jkm3idaBymY9Nc1zp9UT6gb/xt4cgrOB4ZGd7zyQieKBPDz051iWrVa
	ehxbqKDImcRmwogIR6ZRypQuPr0H2CSKRGUaECi8J4UQUBqQsRNyK8UFgdw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdergff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 617AQ4fc002790;
	Sat, 7 Feb 2026 10:26:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfkj4k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:04 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 617AQ4wD002758;
	Sat, 7 Feb 2026 10:26:04 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 617AQ30Y002749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:04 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id CA83C249D2; Sat,  7 Feb 2026 15:56:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting subset of harts
Date: Sat,  7 Feb 2026 15:55:59 +0530
Message-ID: <20260207102602.2917520-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ddcaa/tW c=1 sm=1 tr=0 ts=69871340 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=7a4fK-ezoZRecfey04UA:9
X-Proofpoint-ORIG-GUID: c6aB1bJk-0WsKXiBJET-Nrq9fM3HnBYA
X-Proofpoint-GUID: c6aB1bJk-0WsKXiBJET-Nrq9fM3HnBYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfX+DaW2Y2M+cfV
 bMOYN/6AsRQgBzbLZhVyUw065lo3eSTOoEVP5kmaZQqXPqw5Lm23OizCydP3TtIL/ZljxFIQ6M+
 tMRQFY25ROp6olm13mJYa/+D1Wzb7B14QRSuJq/vyrGj1E8fbpQz5MbLybFosZ/NmJWRYb2VTLu
 fV3qbY1KI5O9ZX9ttajPGEVLOpOisOHXhbFLtszbW+xspEMqJ+JO/y8sxFS5RVFPSONqb0rxIqO
 ezoV30Kz/WLrLmmZH0IGl7mEbgyQgA7jUpdJNeEcrkVvRKhX6rhDYDGiOLFkoOeX9NJjp89R6dE
 nuiDvPOo0yfxn0nM7jqe1kg6f3uD0nSkcm4V2jy9TnByvLfcdQsmbtyXQ5FRDFZyynT0QK8kVn/
 cBCBALuRU4ynLfncZOitUbGmJNLP5T9sKma42L6o8csdgMRuhkVh9y6UsJ57cXkHfK5NoRKnhRe
 EwpNPbwsrpAcJ1yMotw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022614_997122_44B80E10 
X-CRM114-Status: GOOD (  20.46  )
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

It is possible to have platform where an irqchip device targets
a subset of harts and there are multiple irqchip devices to cover
all harts.

To support this scenario:
1) Add target_harts hartmask to struct sbi_irqchip_device which
   represents the set of harts targetted by the irqchip device
2) Call warm_init() and irq_handle() callbacks of an irqchip device
   on a hart only if irqchip device targets that particular hart

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h |  8 +++++--
 lib/sbi/sbi_irqchip.c     | 48 ++++++++++++++++++++++++++++-----------
 lib/utils/irqchip/aplic.c | 12 +++++++++-
 lib/utils/irqchip/imsic.c |  7 ++++--
 lib/utils/irqchip/plic.c  |  5 ++--
 5 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index cda1e50f..c3ded271 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -10,6 +10,7 @@
 #ifndef __SBI_IRQCHIP_H__
 #define __SBI_IRQCHIP_H__
 
+#include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_list.h>
 #include <sbi/sbi_types.h>
 
@@ -20,11 +21,14 @@ struct sbi_irqchip_device {
 	/** Node in the list of irqchip devices */
 	struct sbi_dlist node;
 
+	/** Set of harts targetted by this irqchip */
+	struct sbi_hartmask target_harts;
+
 	/** Initialize per-hart state for the current hart */
 	int (*warm_init)(struct sbi_irqchip_device *chip);
 
 	/** Process hardware interrupts from this irqchip */
-	int (*process_hwirqs)(void);
+	int (*process_hwirqs)(struct sbi_irqchip_device *chip);
 };
 
 /**
@@ -38,7 +42,7 @@ struct sbi_irqchip_device {
 int sbi_irqchip_process(void);
 
 /** Register an irqchip device to receive callbacks */
-void sbi_irqchip_add_device(struct sbi_irqchip_device *chip);
+int sbi_irqchip_add_device(struct sbi_irqchip_device *chip);
 
 /** Initialize interrupt controllers */
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 3b970527..77ec05af 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -13,24 +13,44 @@
 
 static SBI_LIST_HEAD(irqchip_list);
 
-static int default_irqfn(void)
+int sbi_irqchip_process(void)
 {
-	return SBI_ENODEV;
-}
+	struct sbi_irqchip_device *chip;
+	int rc = SBI_ENODEV;
 
-static int (*ext_irqfn)(void) = default_irqfn;
+	sbi_list_for_each_entry(chip, &irqchip_list, node) {
+		if (!chip->process_hwirqs)
+			continue;
+		if (!sbi_hartmask_test_hartindex(current_hartindex(), &chip->target_harts))
+			continue;
+		rc = chip->process_hwirqs(chip);
+		if (rc)
+			break;
+	}
 
-int sbi_irqchip_process(void)
-{
-	return ext_irqfn();
+	return rc;
 }
 
-void sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
+int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 {
-	sbi_list_add_tail(&chip->node, &irqchip_list);
+	struct sbi_irqchip_device *c;
+	struct sbi_hartmask hm;
+
+	if (!chip || !sbi_hartmask_weight(&chip->target_harts))
+		return SBI_EINVAL;
+
+	if (chip->process_hwirqs) {
+		sbi_list_for_each_entry(c, &irqchip_list, node) {
+			if (!c->process_hwirqs)
+				continue;
+			sbi_hartmask_and(&hm, &c->target_harts, &chip->target_harts);
+			if (sbi_hartmask_weight(&hm))
+				return SBI_EINVAL;
+		}
+	}
 
-	if (chip->process_hwirqs)
-		ext_irqfn = chip->process_hwirqs;
+	sbi_list_add_tail(&chip->node, &irqchip_list);
+	return 0;
 }
 
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
@@ -48,12 +68,14 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 	sbi_list_for_each_entry(chip, &irqchip_list, node) {
 		if (!chip->warm_init)
 			continue;
+		if (!sbi_hartmask_test_hartindex(current_hartindex(), &chip->target_harts))
+			continue;
 		rc = chip->warm_init(chip);
 		if (rc)
 			return rc;
 	}
 
-	if (ext_irqfn != default_irqfn)
+	if (!sbi_list_empty(&irqchip_list))
 		csr_set(CSR_MIE, MIP_MEIP);
 
 	return 0;
@@ -61,6 +83,6 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 
 void sbi_irqchip_exit(struct sbi_scratch *scratch)
 {
-	if (ext_irqfn != default_irqfn)
+	if (!sbi_list_empty(&irqchip_list))
 		csr_clear(CSR_MIE, MIP_MEIP);
 }
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 8d0db168..ea5cb7c4 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -297,8 +297,18 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 			return rc;
 	}
 
+	if (aplic->num_idc) {
+		for (i = 0; i < aplic->num_idc; i++)
+			sbi_hartmask_set_hartindex(aplic->idc_map[i],
+						   &aplic->irqchip.target_harts);
+	} else {
+		sbi_hartmask_set_all(&aplic->irqchip.target_harts);
+	}
+
 	/* Register irqchip device */
-	sbi_irqchip_add_device(&aplic->irqchip);
+	rc = sbi_irqchip_add_device(&aplic->irqchip);
+	if (rc)
+		return rc;
 
 	/* Attach to the aplic list */
 	sbi_list_add_tail(&aplic->node, &aplic_list);
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 0e9917da..5ec9dff4 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -147,7 +147,7 @@ int imsic_get_target_file(u32 hartindex)
 	return imsic_get_hart_file(scratch);
 }
 
-static int imsic_process_hwirqs(void)
+static int imsic_process_hwirqs(struct sbi_irqchip_device *chip)
 {
 	ulong mirq;
 
@@ -391,7 +391,10 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 	}
 
 	/* Register irqchip device */
-	sbi_irqchip_add_device(&imsic_device);
+	sbi_hartmask_set_all(&imsic_device.target_harts);
+	rc = sbi_irqchip_add_device(&imsic_device);
+	if (rc)
+		return rc;
 
 	/* Register IPI device */
 	sbi_ipi_add_device(&imsic_ipi_device);
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 7989a962..25cc2787 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -276,11 +276,10 @@ int plic_cold_irqchip_init(struct plic_data *plic)
 			continue;
 
 		plic_set_hart_data_ptr(sbi_hartindex_to_scratch(i), plic);
+		sbi_hartmask_set_hartindex(i, &plic->irqchip.target_harts);
 	}
 
 	/* Register irqchip device */
 	plic->irqchip.warm_init = plic_warm_irqchip_init;
-	sbi_irqchip_add_device(&plic->irqchip);
-
-	return 0;
+	return sbi_irqchip_add_device(&plic->irqchip);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
