Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA011FAD40F
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kLx633I1+RhvaTaO0JveocJEBbJPa/A8L1CLr3laWw=; b=4rkV4qGqyyS9uJ
	GkfERcnmeNZpcwuN+SRtvXgt+bFYdK4V2c+KyMYOB+jTgsa4Pu/5PyAWKTySn8Z0AKva2yT/AZdzj
	tP7pFSQOS1/+x1IJ+c/GXdEzEYbLGrt/sENS1SyhOg0nij/dYtu0/ipyIXkTJGIaw4zDq+GzR971u
	Xv9r1YC/DRkTBZFfctD+Q+FOfjQPe0zImoY9U5XExR6F63lijneG4FGbl1ARXe2yyEaFp/jHdX2Fc
	dtr3OmENILkLwRGmrO026Eo7q2pfPSKAmttfFejxKuRC5nar0FHSOmE262uZvOlcHbu+T/Gu7oWsh
	Ni5Hxu67cQ1LXBjKKGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXh-0000000B3lV-3WUl;
	Thu, 23 Apr 2026 05:24:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXf-0000000B3jo-0hgl
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 05:24:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3IOK43173170;
	Thu, 23 Apr 2026 05:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kMH8BvPuN1F
	HEYKs+UPWpnJs4RDr0GOsQ/cpq7rdpkQ=; b=BqmgdnJvTrkaBPxWIY4WeEN8hZ3
	O6aoZqic9q4/Cs/na+mzIk8iEpKUXqANSjnvb+bW9WfEROoqlKoqZXxMU3+ogRHd
	YF+PuHBzAo7og/8peLU9v+n47IsuPZ5cofCQVrz6v6DCF92Sm4v8H1JqviALZk8z
	apIRZD6mfKeSD/NsR0+l05gkuTmhO04oaRbcSM8N9jd+3ghlt+aM50MZ9+s8VOrT
	S/q4CU1eFcz0SQx0yuyiS/0tmVrbDEPQYRnGq93nsvQbfCJGjp6KOeurppHzw/G3
	RctHQ9PmZGR65CIlFmq2bjNKM4dA+wVDxG75mnPAm7VziG6ACFUO7FZjTww==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m3283h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63N5NgiL007146;
	Thu, 23 Apr 2026 05:23:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dm31jyv1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:42 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63N5NfNS007121;
	Thu, 23 Apr 2026 05:23:41 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63N5Nf0Z007119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:41 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 0584B22783; Thu, 23 Apr 2026 10:53:41 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 4/6] lib: sbi_irqchip: Allow marking hardware interrupts as reserved
Date: Thu, 23 Apr 2026 10:53:37 +0530
Message-ID: <20260423052339.356900-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
References: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: UMpJvOX3s6I2AXHaAxZjUZku1oXa42AQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0NyBTYWx0ZWRfX5FqOwtbPtk6f
 rJpVdcCs93YN4o1xCiO0gYyR3R28tC2PDb46hdJnLsl0scjB59ZjBE/ERRPNk6CUFPdIpNfoENE
 yQEIilQtSAYHAvSWW88PH5O5gJo+a002C9CECIBfPFVpysk2cCairtmJzAb1KeKS2u5fT8dAia3
 S2i7osZyUAXAF3cmljPO6b+UBXMYwuY4WakkvSQuBrW37Kl20qFoDHx1DqPAFeF0vW2zSnwA88Q
 Pu5/NtXplkZIu6rwmoSxuGpnNmR3SE0f/wKlH7I+e9p9mcUfIcUS4MQ3fn+PRKfqR9BlKZLvvDp
 50VTmPP6mBNzw8X4hI/cWppyjLp+i6+JXgelAjqgr3QLzsPJ4Buz6Bfr4VbnYLzOiyR33wBiU3b
 upVmOhWTtJmHqCX2Tkj0AixoCp0dbrDeAEivM87j1RDbZI+H04smTvYiZX83LwSjxEZeFXLV5Q6
 8/XeQG/NHKMM4WDcd4w==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e9ace1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=dnB8MZ6qHW_oZ28M05AA:9
X-Proofpoint-GUID: UMpJvOX3s6I2AXHaAxZjUZku1oXa42AQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222359_228478_94C484DD 
X-CRM114-Status: GOOD (  12.69  )
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

Some of the hardware interrupts may be special so allow irqchip
drivers to make these hardware interrupts as reserved. Introduce
sbi_irqchip_register_reserved() for this purpose.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h |  6 +++++-
 lib/sbi/sbi_irqchip.c     | 44 +++++++++++++++++++++++++++++----------
 lib/utils/irqchip/imsic.c |  7 ++++++-
 3 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 9035dcef..880ff49f 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -101,7 +101,11 @@ int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
 /** Register a hardware interrupt handler */
 int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 				 u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
-				 int (*callback)(u32 hwirq, void *opaque), void *opaque);
+				 int (*callback)(u32 hwirq, void *priv), void *priv);
+
+/** Register a hardware interrupts as reserved */
+int sbi_irqchip_register_reserved(struct sbi_irqchip_device *chip,
+				  u32 first_hwirq, u32 num_hwirq);
 
 /** Unregister a hardware interrupt handler */
 int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index ea684303..15ea2211 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -108,13 +108,14 @@ static struct sbi_irqchip_handler *sbi_irqchip_find_handler(struct sbi_irqchip_d
 int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq)
 {
 	struct sbi_irqchip_handler *h;
-	int rc;
+	int rc = SBI_OK;
 
 	if (!chip || chip->num_hwirq <= hwirq)
 		return SBI_EINVAL;
 
 	h = sbi_irqchip_find_handler(chip, hwirq);
-	rc = h->callback(hwirq, h->priv);
+	if (h->callback)
+		rc = h->callback(hwirq, h->priv);
 
 	if (chip->hwirq_eoi)
 		chip->hwirq_eoi(chip, hwirq);
@@ -135,20 +136,14 @@ int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
 	return 0;
 }
 
-int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
-				 u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
-				 int (*callback)(u32 hwirq, void *opaque), void *priv)
+static int __sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
+					  u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
+					  int (*callback)(u32 hwirq, void *priv), void *priv)
 {
 	struct sbi_irqchip_handler *h, *th, *nh;
 	u32 i, j;
 	int rc;
 
-	if (!chip || !num_hwirq || !callback)
-		return SBI_EINVAL;
-	if (chip->num_hwirq <= first_hwirq ||
-	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
-		return SBI_EBAD_RANGE;
-
 	for (i = first_hwirq; i < (first_hwirq + num_hwirq); i++) {
 		h = sbi_irqchip_find_handler(chip, i);
 		if (h)
@@ -198,6 +193,33 @@ int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 	return 0;
 }
 
+int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
+				 u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
+				 int (*callback)(u32 hwirq, void *priv), void *priv)
+{
+	if (!chip || !num_hwirq || !callback)
+		return SBI_EINVAL;
+	if (chip->num_hwirq <= first_hwirq ||
+	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
+		return SBI_EBAD_RANGE;
+
+	return __sbi_irqchip_register_handler(chip, first_hwirq, num_hwirq, hwirq_flags,
+					      callback, priv);
+}
+
+int sbi_irqchip_register_reserved(struct sbi_irqchip_device *chip,
+				  u32 first_hwirq, u32 num_hwirq)
+{
+	if (!chip || !num_hwirq)
+		return SBI_EINVAL;
+	if (chip->num_hwirq <= first_hwirq ||
+	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
+		return SBI_EBAD_RANGE;
+
+	return __sbi_irqchip_register_handler(chip, first_hwirq, num_hwirq,
+					      SBI_HWIRQ_FLAGS_NONE, NULL, NULL);
+}
+
 int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
 				   u32 first_hwirq, u32 num_hwirq)
 {
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 877255f8..521d17fe 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -348,7 +348,7 @@ int imsic_data_check(struct imsic_data *imsic)
 
 static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq, u32 hwirq_flags)
 {
-	if (!hwirq || hwirq == IMSIC_IPI_ID || hwirq_flags != SBI_HWIRQ_FLAGS_NONE)
+	if (hwirq_flags != SBI_HWIRQ_FLAGS_NONE)
 		return SBI_ENOTSUPP;
 	return 0;
 }
@@ -406,6 +406,11 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 	if (rc)
 		return rc;
 
+	/* Mark hwirq 0 and IPI hwirq as reserved */
+	rc = sbi_irqchip_register_reserved(&imsic_device, 0, IMSIC_IPI_ID + 1);
+	if (rc)
+		return rc;
+
 	/* Register IPI device */
 	sbi_ipi_add_device(&imsic_ipi_device);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
