Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F1BEE0AC6
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bQLvmdHRXoVl3DdDKL5OaTALmWfF8+1WSG/P2QIZ+U=; b=dtFbMozaPl3xSE
	+ec62+UsiL6MDuBuDmPBBs1qSyUThKE1z2ptxDulJiJIwpuMxliIY8Yd5McFpOcaOIWvoQMfNgU2C
	ouo+VUon86Of7xvDssykAI0M0eGNFmzYU9g1TFl8HwzX5kFuKJUDIgy8odkfW/PvjFQcf5a0d7/Zz
	2MDgbgBrfJkNIjsduXHtQPui1trml25Ih8iYdZfE5P9RhS8wzkLEAASFgfqKntPrh91gbdILn1sx/
	SWN4vP919vtpff/IKfHEXirSuDY0ehSdN0CXQzEFna9ZD96HNbGBKrUTnaXygJ3kxFd3XJ3T6SKYD
	+xJcmfilFASeF3OXVQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofas-0000000CLCW-3sQT;
	Sat, 07 Feb 2026 10:31:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofaq-0000000CLC1-21ih
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:31:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174OO7b411559;
	Sat, 7 Feb 2026 10:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=11dbYlNZTUu
	zVFkAZ8IK+71L+3pmEDTFnOAd7uxoXRk=; b=CIEKw1oflrdXhO8eHA5dAiq0428
	EO8VkgUhf+r6I8wAlIcCHt8O3vkV6kM/XeWy9N5d43EVNkj7tzD90gggYiXWofKA
	Syhus3nB5lIXp+fO3yQSucGgyc8Cp8JgGHaKQLwjd5eLvHrYuHru3VbaEJw+/mwE
	rFOk7gL4r8mdUdDm0h+O2BOcv+iqwiF5si3d3POJndaH2yvNJTAdzqrNz14lT/PM
	h4CHntLTelz8ULXuzxXtiXY89Cv+XpTLSlCnuFK/Z+ZJzqD1aLEZF14P+TSEygtm
	VVfzNt5QLBLbEIRINfcK8rmrOXz6Fv831bOpdYrTTKfCYV8ye7ISy33s2lw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4rhau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 617AQ3Tg002715;
	Sat, 7 Feb 2026 10:26:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfkj4jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:03 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 617AQ34C002688;
	Sat, 7 Feb 2026 10:26:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 617AQ3Rv002678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:03 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BC69322B5D; Sat,  7 Feb 2026 15:56:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 1/8] lib: sbi_irqchip: Use chip as variable name for irqchip device
Date: Sat,  7 Feb 2026 15:55:55 +0530
Message-ID: <20260207102602.2917520-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n0xH48APn8wLxeDCNw6BFUYoiphGpU5n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfX8mwfyYq1DY19
 7b+b+f6RUqqwzMokZYoeH5KbcYSFnLKlZhZqc7it3MWerTSQmYIqAhBEq552YwoXplGZHOy0pFv
 mP0e8GLvRGv48V/LiiaEXRVw6BWX1JiNyMuAZajCImQ4dszqe/JadOSqypqhdnpM7+WnJ0biiUl
 yz8DGT9qV4+WNfD8H5caFJNaP4IFLAWXx5vqIIN8v4ssMXvVHGJUcNRmMWKuLLXlZN51kVxwqk/
 4/RaOtgSnry1279urIfYrMPHHy66HClbSq+q0oowkw2IpHyGg/IquakMD/LxD4e6XyKr9lnYuqO
 uwI0WY9cO+Td5+3Cu+TiNqR2oGffW6mo41iI5ApYOQh9mt/qtgRVBO9ukDG+GsUordtOoKR0l7O
 2PW9eI7LJQfL6oSeKGtz9/FV7M0joY1vjyLRBUTMrZ2Cl6IFi2pMbEwlEbUm4evbbLtFUkrx99j
 X/I3fYm/awHNgINlYnQ==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=69871341 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=gh03vId5hNsAhgaDwcEA:9
X-Proofpoint-ORIG-GUID: n0xH48APn8wLxeDCNw6BFUYoiphGpU5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_023112_640647_84C6343C 
X-CRM114-Status: GOOD (  13.58  )
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

The irqchip device represents an interrupt controller so use chip
as variable name instead of dev. This will avoid confusion as the
sbi_irqchip framework grows.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h |  4 ++--
 lib/sbi/sbi_irqchip.c     | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index e0ae12f5..97332248 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -21,7 +21,7 @@ struct sbi_irqchip_device {
 	struct sbi_dlist node;
 
 	/** Initialize per-hart state for the current hart */
-	int (*warm_init)(struct sbi_irqchip_device *dev);
+	int (*warm_init)(struct sbi_irqchip_device *chip);
 
 	/** Handle an IRQ from this irqchip */
 	int (*irq_handle)(void);
@@ -38,7 +38,7 @@ struct sbi_irqchip_device {
 int sbi_irqchip_process(void);
 
 /** Register an irqchip device to receive callbacks */
-void sbi_irqchip_add_device(struct sbi_irqchip_device *dev);
+void sbi_irqchip_add_device(struct sbi_irqchip_device *chip);
 
 /** Initialize interrupt controllers */
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 0594e05a..8a71b88f 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -25,19 +25,19 @@ int sbi_irqchip_process(void)
 	return ext_irqfn();
 }
 
-void sbi_irqchip_add_device(struct sbi_irqchip_device *dev)
+void sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 {
-	sbi_list_add_tail(&dev->node, &irqchip_list);
+	sbi_list_add_tail(&chip->node, &irqchip_list);
 
-	if (dev->irq_handle)
-		ext_irqfn = dev->irq_handle;
+	if (chip->irq_handle)
+		ext_irqfn = chip->irq_handle;
 }
 
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
-	struct sbi_irqchip_device *dev;
+	struct sbi_irqchip_device *chip;
 
 	if (cold_boot) {
 		rc = sbi_platform_irqchip_init(plat);
@@ -45,10 +45,10 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 			return rc;
 	}
 
-	sbi_list_for_each_entry(dev, &irqchip_list, node) {
-		if (!dev->warm_init)
+	sbi_list_for_each_entry(chip, &irqchip_list, node) {
+		if (!chip->warm_init)
 			continue;
-		rc = dev->warm_init(dev);
+		rc = chip->warm_init(chip);
 		if (rc)
 			return rc;
 	}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
