Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0075FAD40E
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 05:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/btJzRgU7ITtUU1e7J5Nl7PFqTg20ZmYiyVOMpTTMA=; b=gRc6YVtE6un2JS
	hKh+b0DiD5Da6+IpmkW7sMOzhPrP7NqFw3aqydYmr0IeWHDBo55HNo0RsiOe5xpAUHsAVJcO6I08T
	0KcMYrOjSo/jaSozcUzHB/inKv++xptu4IUNU0Wu4nGwtWd/mvxE9CR1PKKUDIBwaN5Hr6hr7OP0q
	JSyT5t7z/BSICmVwu0p2UGW60GBsrW3YiF8yD7vaq9PCsGRSV9vDK6rj/jF2aPSZAvzyImt/gkgsq
	VyToTA8WNlb6FQcOuC1cOn/1KmBmu0lk2Hypr8IFD4FGcHOLUhS4Sj7tr7uNwGLM4uIYud6ThMKkQ
	I1ooPdnoo7qkQMEV4WAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXu-0000000B3s6-3qqd;
	Thu, 23 Apr 2026 05:24:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXs-0000000B3qU-1rEn
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 05:24:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MHtmY22630089;
	Thu, 23 Apr 2026 05:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AzhNDWSBDj8
	EiqEuZ51hrJbof4CcNLwv2JY0I9uX9+Q=; b=WhiTSZA8dXn7FUKpCKCOs33PNqk
	EwMgzb2Dkrvlm3J7wLpDj+iWX5kEnkEzKsNfoVbxVIwZLmhXSvxsmkdqhblJv4Nn
	pOVYsGvC1Muw37swflZrFSbMkms4JPzU9CHI0qFZX+naQIO370rd0n1fBxt1/ZQW
	t8wwKwcVlyxgZykuabbgTDglaBpZAX7Gn8VqAiqChou4jyJZXjS/4hh3ahtePrfZ
	uPTv4W0Q9YG//EhB19Uylc9DzqtVJdxnYeqhcUAlMnZjiWR8CXSWxXHTbbf/mwAp
	1CBINADrdYsuuIMmB/StEwFlsTFxShfRHSUYj++1VYRfluOD4rob5KqxTag==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35r9vj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63N5Ngt5007157;
	Thu, 23 Apr 2026 05:23:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dm31jyv1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:42 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63N5Nf79007132;
	Thu, 23 Apr 2026 05:23:41 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63N5Nfbg007118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:41 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 01D9B222EC; Thu, 23 Apr 2026 10:53:41 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 3/6] lib: sbi_irqchip: Allow interrupt client to specify line sensing
Date: Thu, 23 Apr 2026 10:53:36 +0530
Message-ID: <20260423052339.356900-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
References: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0NyBTYWx0ZWRfX+XWjpXQOzSO+
 N7Bn1kzeiGqzxMLSsYnae46qMPpHsBZcSAewShva3Ka03xXw/0bDjcBHW+2ZNESpEaymG98vbme
 PiCldwtNFekvJPF/IpuzTiCFWidTu36GiTRJCsbefgN4wLOWR8OWpNO2yot7xN4i+SKV5EPSGBE
 XZKhc4oGVWIdIHnOTPnYRuXyXQfjwmRPuRmq6eTAbCZY+LkqdB+hiS563qQFX24I/g+S4Z5XOyd
 bcQEzUJK4T5ZWCdOLgRQJQ7PgLMz/c+Tt6eaTjgUW3ETb/9pxdKxkV+V8WnouLu1tUswdgPADLB
 iNfdrKeSLiMInL/Nb3f0gSXgqj4JaHgAPftEU/uXfB0U1oGiSvmJqlsK/5QoJBe4KRn4sIQUFkl
 8OJTZNrQTebc9X/u0qM/LdyG+5D8BTNx8dNHYJLqN0pmFkHAopugmXYhW8N9AsizSAJy9IbksXe
 5gRtqxvuu0pAP0yvqHA==
X-Proofpoint-ORIG-GUID: CI2Q86Ke90HaSgU9EJEtxuks6EZrK2MN
X-Proofpoint-GUID: CI2Q86Ke90HaSgU9EJEtxuks6EZrK2MN
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9ace1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KUY_xoyuxW_Na2JgVsYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222412_631566_F8984E02 
X-CRM114-Status: GOOD (  14.40  )
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

The interrupt client should be allowed to specify the line sensing
type of the hwirqs for which it is registering handler. To support
this, add hwirq_flags parameter to hwirq_setup() callback provided
by the irqchip driver.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h | 13 +++++++++++--
 lib/sbi/sbi_irqchip.c     |  4 ++--
 lib/utils/irqchip/imsic.c |  4 ++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 77b54110..9035dcef 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -43,7 +43,16 @@ struct sbi_irqchip_device {
 	int (*process_hwirqs)(struct sbi_irqchip_device *chip);
 
 	/** Setup a hardware interrupt of this irqchip */
-	int (*hwirq_setup)(struct sbi_irqchip_device *chip, u32 hwirq);
+	int (*hwirq_setup)(struct sbi_irqchip_device *chip, u32 hwirq,
+			   u32 hwirq_flags);
+#define SBI_HWIRQ_FLAGS_NONE			0x00000000UL
+#define SBI_HWIRQ_FLAGS_EDGE_RISING		0x00000001UL
+#define SBI_HWIRQ_FLAGS_EDGE_FALLING		0x00000002UL
+#define SBI_HWIRQ_FLAGS_EDGE_BOTH		(SBI_HWIRQ_FLAGS_EDGE_RISING | \
+						 SBI_HWIRQ_FLAGS_EDGE_FALLING)
+#define SBI_HWIRQ_FLAGS_LEVEL_HIGH		0x00000004UL
+#define SBI_HWIRQ_FLAGS_LEVEL_LOW		0x00000008UL
+#define SBI_HWIRQ_FLAGS_LEVEL_SENSE_MASK	0x0000000fUL
 
 	/** Cleanup a hardware interrupt of this irqchip */
 	void (*hwirq_cleanup)(struct sbi_irqchip_device *chip, u32 hwirq);
@@ -91,7 +100,7 @@ int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
 
 /** Register a hardware interrupt handler */
 int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
-				 u32 first_hwirq, u32 num_hwirq,
+				 u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
 				 int (*callback)(u32 hwirq, void *opaque), void *opaque);
 
 /** Unregister a hardware interrupt handler */
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index f9e2eb5a..ea684303 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -136,7 +136,7 @@ int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
 }
 
 int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
-				 u32 first_hwirq, u32 num_hwirq,
+				 u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
 				 int (*callback)(u32 hwirq, void *opaque), void *priv)
 {
 	struct sbi_irqchip_handler *h, *th, *nh;
@@ -177,7 +177,7 @@ int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 
 	if (chip->hwirq_setup) {
 		for (i = 0; i < h->num_hwirq; i++) {
-			rc = chip->hwirq_setup(chip, h->first_hwirq + i);
+			rc = chip->hwirq_setup(chip, h->first_hwirq + i, hwirq_flags);
 			if (rc) {
 				if (chip->hwirq_cleanup) {
 					for (j = 0; j < i; j++)
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 7559a069..877255f8 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -346,9 +346,9 @@ int imsic_data_check(struct imsic_data *imsic)
 	return 0;
 }
 
-static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
+static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq, u32 hwirq_flags)
 {
-	if (!hwirq || hwirq == IMSIC_IPI_ID)
+	if (!hwirq || hwirq == IMSIC_IPI_ID || hwirq_flags != SBI_HWIRQ_FLAGS_NONE)
 		return SBI_ENOTSUPP;
 	return 0;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
