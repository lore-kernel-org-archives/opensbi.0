Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0472C54F4C
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 04:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGVHXP+NvJymQCcbrVW8mWIrcmvvSTO9pzUcIwTxVuY=; b=OCcwcmQ/Ooiqak
	5MuNB6ViIQmEbfczzb1j71HxS03SXyQP2gYVTGwdb7LuJBqbksWCFr+xJm6TPRIFokD4WUwA+FmG7
	zK5NkyTWkC08S9Z2E7xi170lERuyG+bKLwhINYkTRzEkx4Sj8bFFgBWyihpp7dKTlBXP8z1tW7y9B
	eIoB3DuFL0GYGUM017eCnPKGCizMnVwKM86jWgmILmIhBi8PHXo7E9U7H0UxxmmSbcZb66p8ZUA8o
	rfcIt0tkFEzKs18pBoqtunSCOsi76vFIjD3fxctA3VAJzJ0UHxn3viz24fVrRqHpue9TzUbp+tr2L
	QLy89CFRmSxkzMqx0qNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCty-00000001vcB-3J77;
	Mon, 27 Jul 2026 04:25:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCtu-00000001vZC-1uSQ
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 04:25:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fhC72239921;
	Mon, 27 Jul 2026 04:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=agvZFQJe3yC
	Vj6tVaY19NIroZNm8WZi9wEfmTw6/rOU=; b=kWuVK72KMcu4CZhnNl9zbJ1nQjL
	+l0RJi/fopVc6ce+GAvL+w+Ri4feJZPBssHKGdDmbAguHJPnjahBjCUsiqrcjE9x
	0kFmVdp57THixo/3Q6vP0TGjzkbvpR2A/aiYG4fcCh8SVHQoPS6kPrMnHBTPj9Sp
	Zmo0E3OcTYPt8GCi0+0FTfYtIR3Sw1/aqV9tzaOtS3hbHz1NZk2sen/cc2ZIWjr/
	36AHKZwRCgaSqOblvdqg5Wb1yPmtaJ7SkXt6ZRxgZO9a9f5ByyjbH3B6WW1LYFCA
	hGuV79GiVFILIrkYJt/feVMFAg4Jy4GdRDFtzU9iZBPEl6QyOAdMthzCGzw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs0rk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66R4P6PN020036;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fmp7hjd8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66R4P6Zl020016;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66R4P68w020010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id AA55522B85; Mon, 27 Jul 2026 09:55:05 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 2/5] lib: sbi: Introduce sbi_hart_protection_reconfigure() function
Date: Mon, 27 Jul 2026 09:55:01 +0530
Message-ID: <20260727042504.1743250-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfX82tRxZyk8cd+
 mi/lj39LpuVhYJ3+JGf9ftMtfea0Apykwh2nySDS6mw5+6qfansJuNmZ2K6FBiAy/m/U3H0ZgHs
 /EkCF0DB7OZd7P9uogRHFqGMQp9sc4VyzZ1VtjmoclN8YYUBlONP8ZNuqmicLVy9bQ7wi6pkK9a
 iesryvOLEa6wEHRuF/IFYxsOExluKZ6h2pA4+oZmM8gIttwaqSsgQG3jXEPrb8ZytpNbQ8NEfDh
 BHGC4BQpMAPZ6AKx1Ib6wTpHmNGEo8AQZnmv02F+8XTA9mnInQNikC4+c+2wZEqVH54bbJvel9e
 aiWrXPx0AO6KB04P1wf9UDh6SDQDBIK1CiIBm2WGweqSJl9NulTN6F61RuBtv/Z6nnBIQOz7ccF
 yqH/7+j89ZoYA9qraKcJH6HI0hnCqshsvgLoa4Yqo96lsLtIw8sTBWHHXY5WnwTlpPVk+r9BhJZ
 WSkCFcR0szE0522dlTw==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a66dda6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=lEsuMq01qxSVSr6n3k4A:9
X-Proofpoint-ORIG-GUID: QlBw2Qh_PWjcmOVZ7rrYQs9SNEaHEFZn
X-Proofpoint-GUID: QlBw2Qh_PWjcmOVZ7rrYQs9SNEaHEFZn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfX5fBZmjZONPGq
 CbPHJuLyt3HvEYKZ9cQt2u6HQl91u1Y4GoXTcgl2d0Chq39VwNsV6v5lUL/Ka5x1wkj65hyRN6t
 eCM7WMRRn46baLslgHmJf1adfFfzzOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_212514_612735_C9AA87E6 
X-CRM114-Status: GOOD (  14.55  )
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

Instead of assuming that hart protection reconfiguration is unconfigure
followed by configure, introduce a separate sbi_hart_protection_reconfigure()
function and use it in switch_to_next_domain_context().

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_hart_protection.h |  7 +++++++
 lib/sbi/sbi_domain_context.c      |  3 +--
 lib/sbi/sbi_hart_protection.c     | 28 ++++++++++++++++++++++------
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
index d65f32ca..6698ceb0 100644
--- a/include/sbi/sbi_hart_protection.h
+++ b/include/sbi/sbi_hart_protection.h
@@ -77,6 +77,13 @@ int sbi_hart_protection_configure(struct sbi_scratch *scratch);
  */
 void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch);
 
+/**
+ * Re-configure protection for current HART
+ *
+ * @param scratch pointer to scratch space of current HART
+ */
+int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch);
+
 /**
  * Create temporary mapping to access address range on current HART
  *
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index cc4cc04d..7d9817d6 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -171,8 +171,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	 * is also required for some of the above CSR updates (such
 	 * as satp CSR).
 	 */
-	sbi_hart_protection_unconfigure(scratch);
-	sbi_hart_protection_configure(scratch);
+	sbi_hart_protection_reconfigure(scratch);
 
 	/* Mark current context structure initialized because context saved */
 	ctx->initialized = true;
diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index fbebfd1a..9a8427b9 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -49,10 +49,9 @@ void sbi_hart_protection_unregister(struct sbi_hart_protection *hprot)
 	sbi_list_del(&hprot->head);
 }
 
-int sbi_hart_protection_configure(struct sbi_scratch *scratch)
+static int __hart_protection_configure(struct sbi_scratch *scratch,
+				       struct sbi_hart_protection *hprot)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
-
 	if (!hprot)
 		return 0;
 	if (!hprot->configure)
@@ -61,16 +60,33 @@ int sbi_hart_protection_configure(struct sbi_scratch *scratch)
 	return hprot->configure(scratch);
 }
 
-void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch)
+static void __hart_protection_unconfigure(struct sbi_scratch *scratch,
+					  struct sbi_hart_protection *hprot)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
-
 	if (!hprot || !hprot->unconfigure)
 		return;
 
 	hprot->unconfigure(scratch);
 }
 
+int sbi_hart_protection_configure(struct sbi_scratch *scratch)
+{
+	return __hart_protection_configure(scratch, sbi_hart_protection_best());
+}
+
+void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch)
+{
+	__hart_protection_unconfigure(scratch, sbi_hart_protection_best());
+}
+
+int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch)
+{
+	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+
+	__hart_protection_unconfigure(scratch, hprot);
+	return __hart_protection_configure(scratch, hprot);
+}
+
 int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 {
 	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
