Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7251EF48CA
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 05:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IU3ai+VobRsNgSEURd0mpSTExZqf8jR11UrGCPqZ/w=; b=EsdMpGU9WnhJ25
	dhTEZVk6iteDpBITrCA5FEjug/lJHouMvTP6Xvv+XUzJAdJadtFPlo7XBBCdeadYQPbH4x1PcO/Rh
	Vkjgu2uQrrJO7KmH4Mvgumm/WhtEKVRPxnVgjq8K9SpNTERMyEsdCnHZhuNGkoTdSSn8s61UB2naH
	c4aCvvjprt16NAfwLylshkw39qVXgImlKrr4qUseIHS/Yr2VhiS1StBepGLrQpoa+SEAskaGHCQJU
	8u+jaq4a305OcaUnWY6DeSPmVJgef+c+uFVawlvPevZy6LtxfPt1r6WK5UpSV1Ubpxs+5NlqCk6f/
	o/xpbfVJQa4MzJNZngeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm8q-000000032Ue-0sbh;
	Fri, 13 Feb 2026 05:55:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm8m-000000032RT-2eq8
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 05:54:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CLQ4kd3043463;
	Fri, 13 Feb 2026 05:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vwSCv+cXQkK
	n7P5nDWfNQScVkds1865uz9ldpiTIA9E=; b=o+vsCBvksC/+Tn+ofz0yFtocW0Z
	+FvQZkZg1dLerlqfvqwt7XX4ZpZ+bTuiCCC0kDlYdFvD4IlrwLa8GLuF3OJtdg9c
	/rHqCNsDp6jf31bM9dx4b3vX56AwID2w7UMDkcVR0ajandb9uiWcCrpc2XWdoAcT
	dyqPiKR+F6dfGulaJaZa6VM01wuBJyn7GK2db7Y+CAGlr1B3XjeON31+m5ZE9CA6
	rnut2LCGqURa6J0QrRIdXsNvXJFqZKFHkEHUZPUBBVPOB6lWAGP+MRjYyl5gc30p
	JkCqWweK0+VIz4S0xRhT6mIUlGI9zjo2gq26ZFqQgqZJWei58+pEu9BA1lw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2sf8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61D5rhPM006112;
	Fri, 13 Feb 2026 05:53:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfn97ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61D5rh8F006086;
	Fri, 13 Feb 2026 05:53:43 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61D5rhmR006080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:43 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id CAAE82499F; Fri, 13 Feb 2026 11:23:42 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 2/8] lib: sbi_irqchip: Rename irq_handle() callback to process_hwirqs()
Date: Fri, 13 Feb 2026 11:23:36 +0530
Message-ID: <20260213055342.3124872-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
References: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JzYfFY-bRjQ7g8ULe8ITB-vl4fqwrONn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MiBTYWx0ZWRfXxurlftFc92Kp
 oqDPmD7r3U7TMHu/7TjWDz5qBsx+bhvSb3OwALZhOzEzljVv3KLokX7uCmWzXuhNYqT5xUp9CNr
 34bBlm+vf7TJi+lLAQtkhrWphB9pIARpo8rIIL4Jaccm/9ZmBqqIzFcj3dTYZ+Zr/gCh8Xjf/AB
 nkCOuFabA7m0ZBanf85HHFErY6H5GBJfHqTp31m0r6jw3RXa2CD+uWBhCyvijgeh5baBSe1x0OL
 UavZWR/ubDa/VOQQQlwr9MAaaKHl1DEvQZSRpqxldYFf6G1LP9RhMJ/noK8yauyD1lejaYX2spT
 naom9TZFoi2WxuPmsoSEWTMQmVDl+hWWHKJpGC65EV4BKlAD5N8tN01RHJV5L4/uk13HcPk5Wt1
 0wuT9gKNSidboWpB8QojvalC/WdoJF51eQh7zzfuFoI3GuPUG6cpSESPXfL38KDRmNP7pTyOCYs
 YA/wsf/ow2+XVJKqT5w==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698ebc6a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=Ny5fTK4PIkcv4RV8BXIA:9
X-Proofpoint-GUID: JzYfFY-bRjQ7g8ULe8ITB-vl4fqwrONn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_215456_705167_F5762C31 
X-CRM114-Status: GOOD (  13.24  )
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

The irq_handle() callback of irqchip device is meant to process
hardware interrupt of the irqchip hence rename it accordingly.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h | 4 ++--
 lib/sbi/sbi_irqchip.c     | 4 ++--
 lib/utils/irqchip/imsic.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 97332248..cda1e50f 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -23,8 +23,8 @@ struct sbi_irqchip_device {
 	/** Initialize per-hart state for the current hart */
 	int (*warm_init)(struct sbi_irqchip_device *chip);
 
-	/** Handle an IRQ from this irqchip */
-	int (*irq_handle)(void);
+	/** Process hardware interrupts from this irqchip */
+	int (*process_hwirqs)(void);
 };
 
 /**
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 8a71b88f..3b970527 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -29,8 +29,8 @@ void sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 {
 	sbi_list_add_tail(&chip->node, &irqchip_list);
 
-	if (chip->irq_handle)
-		ext_irqfn = chip->irq_handle;
+	if (chip->process_hwirqs)
+		ext_irqfn = chip->process_hwirqs;
 }
 
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index d72ef794..0e9917da 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -147,7 +147,7 @@ int imsic_get_target_file(u32 hartindex)
 	return imsic_get_hart_file(scratch);
 }
 
-static int imsic_external_irqfn(void)
+static int imsic_process_hwirqs(void)
 {
 	ulong mirq;
 
@@ -348,7 +348,7 @@ int imsic_data_check(struct imsic_data *imsic)
 
 static struct sbi_irqchip_device imsic_device = {
 	.warm_init	= imsic_warm_irqchip_init,
-	.irq_handle	= imsic_external_irqfn,
+	.process_hwirqs	= imsic_process_hwirqs,
 };
 
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
