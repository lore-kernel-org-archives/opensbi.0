Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC84EF48D5
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 05:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bz3lnz66ltIxfw8CukzxWRVqSpz8aNaW5c8IO/T8RzU=; b=io4LTMKGfPiCXL
	zmt/hYYuKsbovBTJy9L+KPHW+aqp5P6LPsBawIGIwUVWm8Vy6nImwP1lkdBFuyirVW4LIO6TlEzqc
	ruy6B9c9GZK7AMRnPrRbj3ezlAFft43feScDPtjvRDs//WBXySmadoKRh+scV4LHQe74N4DbR0UGg
	OYoxzUBLVQP07PfRtL0Gvl2mbwkqHw247aGyEZJ1NiO1t2Cc35p+7WQn+eDo6jd6gXYeD6EpJlx1A
	ybWsPvNl/B+fKjckLsx0enkATHcJ3dEGIbuqZxNE0tMhgBBObkJAdUGl+CzynQNMaDQnmR3zm9Tcg
	m83PUf4cufVUG/NUAA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm8m-000000032R4-0ibC;
	Fri, 13 Feb 2026 05:54:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm8h-000000032O8-26HN
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 05:54:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CLTN1n1642023;
	Fri, 13 Feb 2026 05:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ujd1y4g+E6m
	z8t6uKl4Q3l0RJdQUj4d+cfZY9N0CnMk=; b=ZCTlT0PXYB4Q3dSw2DSUW7rww37
	DkO6e+BKAe9hp97yVErN0VvDm92PVHi8kW2qytYs2E4v5WU3lM3bBqzSsvJd88/A
	y0+Rz050I3KeGt7lJuoJNLeYDzpncbZzPIJ3d4d0IS9VA1PM3S4OpMT1KVPECQlz
	L32h6Or0fBM5H3LzSt/C8vxLUhti8TVyBYpdD0NCA3DPD1eNAukJ0RMviC9QnTyv
	UYN+ChhELrE0hp/DTnqqSoUydXr10tRCN3oozZ7VG8VMidkaia9sLGh/J1yK7kEE
	YIs6cKpgZI2vnXl/AWkH9TIIxAz24284b69B2WR7TDKGx1Ener3VeuwhN7A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ptv1efx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:48 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61D5ri6r006167;
	Fri, 13 Feb 2026 05:53:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfn97m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:44 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61D5rirK006146;
	Fri, 13 Feb 2026 05:53:44 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61D5riF6006142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:44 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D48C0249CE; Fri, 13 Feb 2026 11:23:42 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 5/8] lib: sbi_irqchip: Support irqchip device targetting subset of harts
Date: Fri, 13 Feb 2026 11:23:39 +0530
Message-ID: <20260213055342.3124872-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
References: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L6_ksE4vVlxsUoJCjJTzICu_OQIWpCwe
X-Authority-Analysis: v=2.4 cv=eaowvrEH c=1 sm=1 tr=0 ts=698ebc6c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=It-RBV9C6G6tl5JBJxcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MiBTYWx0ZWRfXxNRIvEga1O3S
 e9pUevt4nif+/NG7gUXnIeK8HIqqwkyzZw5+RXimQY7DRSU42zQgoo69t50z1MM3AZ+Gu1Nk9ga
 yIkbTgVHRzrmfyeHExi5Wej4t+tjmZfDsW8U58lWynyVW0QcuKxhMb90/vav0NNL9dUdk6HFvr/
 OkFR/OZt1M9fBGe4E5HdI807zFFXyHiZoB1NBUmK8fCJIE7VGDHkDOWZGu2g0v7C+S+wgh3Zblt
 KXyYzxljV6dovATOH7fZBMDKRe49WBIDobklPtyJNkV64B71bKbVZ+cbCDfVc9J9BahpgHk11G6
 3/1itz86HJSZVif8TR/iYq0+GuwmkKzR/T46beicaaGue/4lGenTBwCDKwdl6Sjt264TMiqGaeh
 /RnFQm8I1LZrjQS9jiq/UGwhIZ6cZefFBAyH3UFY//qTAixA8+GT4DusLE/mpDfRGz3zcEEqY3x
 NVKx7CA/KQTve4tmtvA==
X-Proofpoint-ORIG-GUID: L6_ksE4vVlxsUoJCjJTzICu_OQIWpCwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_215451_557401_A2418B7D 
X-CRM114-Status: GOOD (  23.40  )
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
2) Call warm_init() and process_hwirqs() callbacks of an irqchip
   device on a hart only if irqchip device targets that particular
   hart

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h |  8 +++--
 lib/sbi/sbi_irqchip.c     | 63 ++++++++++++++++++++++++++++++---------
 lib/utils/irqchip/aplic.c | 12 +++++++-
 lib/utils/irqchip/imsic.c |  7 +++--
 lib/utils/irqchip/plic.c  |  5 ++--
 5 files changed, 73 insertions(+), 22 deletions(-)

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
index 3b970527..d3e58288 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -10,36 +10,65 @@
 #include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_list.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_scratch.h>
 
+struct sbi_irqchip_hart_data {
+	struct sbi_irqchip_device *chip;
+};
+
+static unsigned long irqchip_hart_data_off;
 static SBI_LIST_HEAD(irqchip_list);
 
-static int default_irqfn(void)
+int sbi_irqchip_process(void)
 {
-	return SBI_ENODEV;
-}
+	struct sbi_irqchip_hart_data *hd;
 
-static int (*ext_irqfn)(void) = default_irqfn;
+	hd = sbi_scratch_thishart_offset_ptr(irqchip_hart_data_off);
+	if (!hd || !hd->chip || !hd->chip->process_hwirqs)
+		return SBI_ENODEV;
 
-int sbi_irqchip_process(void)
-{
-	return ext_irqfn();
+	return hd->chip->process_hwirqs(hd->chip);
 }
 
-void sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
+int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 {
-	sbi_list_add_tail(&chip->node, &irqchip_list);
+	struct sbi_irqchip_hart_data *hd;
+	struct sbi_scratch *scratch;
+	u32 h;
+
+	if (!chip || !sbi_hartmask_weight(&chip->target_harts))
+		return SBI_EINVAL;
+
+	if (chip->process_hwirqs) {
+		sbi_hartmask_for_each_hartindex(h, &chip->target_harts) {
+			scratch = sbi_hartindex_to_scratch(h);
+			if (!scratch)
+				continue;
 
-	if (chip->process_hwirqs)
-		ext_irqfn = chip->process_hwirqs;
+			hd = sbi_scratch_offset_ptr(scratch, irqchip_hart_data_off);
+			if (hd->chip && hd->chip != chip)
+				return SBI_EINVAL;
+
+			hd->chip = chip;
+		}
+	}
+
+	sbi_list_add_tail(&chip->node, &irqchip_list);
+	return 0;
 }
 
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 {
-	int rc;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	struct sbi_irqchip_hart_data *hd;
 	struct sbi_irqchip_device *chip;
+	int rc;
 
 	if (cold_boot) {
+		irqchip_hart_data_off =
+			sbi_scratch_alloc_offset(sizeof(struct sbi_irqchip_hart_data));
+		if (!irqchip_hart_data_off)
+			return SBI_ENOMEM;
 		rc = sbi_platform_irqchip_init(plat);
 		if (rc)
 			return rc;
@@ -48,12 +77,15 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
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
+	hd = sbi_scratch_thishart_offset_ptr(irqchip_hart_data_off);
+	if (hd && hd->chip && hd->chip->process_hwirqs)
 		csr_set(CSR_MIE, MIP_MEIP);
 
 	return 0;
@@ -61,6 +93,9 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 
 void sbi_irqchip_exit(struct sbi_scratch *scratch)
 {
-	if (ext_irqfn != default_irqfn)
+	struct sbi_irqchip_hart_data *hd;
+
+	hd = sbi_scratch_thishart_offset_ptr(irqchip_hart_data_off);
+	if (hd && hd->chip && hd->chip->process_hwirqs)
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
