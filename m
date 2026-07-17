Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970D9C44514
	for <opensbi@archiver.kernel.org>; Fri, 17 Jul 2026 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17qKsCoPdktesgG5xMpyfKlhtK3kiuSVGgD2shD/Yds=; b=hIj9PHvtB5keaz
	Rldh8u0rCw+a98wtqeEQLyZ2jBBmwoqwD/N5EJFxvj7jwXTSPWNAlQUb9vUaU7Wt0T+VZohQjl8Nq
	gst90ZPcmwFGho7XE6aQ02ziMTs94w2x3FlJU3bU/8h7djGj4kEQzLjJcFD9XBryarqtOtNlLu+mj
	S4c4WZpj5hylwmax/Ry7am0uWCyd17LUte/2TnJZ3DbZHMsbkWZhjz5urPoohD1qyV0Q2hR78BFI5
	J02NHYGAz8xWq7ZwAczigAvWnLRawHxFFceLvxb9Ql1N4MwHREXEB28AqkCIEuhHeB+NjH35C8Sot
	Z7bUxmavSNdXgKSrpexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFB-00000001UfB-2eh6;
	Fri, 17 Jul 2026 07:44:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdF8-00000001Ud8-3IRY
	for opensbi@lists.infradead.org;
	Fri, 17 Jul 2026 07:44:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cq5g1079303;
	Fri, 17 Jul 2026 07:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LHiJRjns4Di
	uAe/FaUUocwfzMiSS0cMSNUw0DofZ52M=; b=A66Dpt4U6NybKFy0v8Erx0AKQEb
	v61cw2XRHicxgQYpebdRoh7PbSn47GH5vrt4vhsrskBzbYl6eS62nTkKJxwDGlrn
	04/hwXZXQeRSVPOOFgkCGLHbeDjeuiaDKHpjKSXpb1IIfMXj+vVz4c4fv4sAX3//
	1ZLJrGEuh+YR86czWEriSr5V9wS67niTOLeszz/bWrSxCtv2IHzSkCjo4Ac55hvS
	oPyPgmOSCRoWLOHS/BacRSEN+wi6i7jfuKgdswv1aolK/QCnnA+Z51ombVsmloGs
	/7+Fx7AmG2aZHA1f3wnsXS774BleQQmzvzgO7/iHYTG+KfMzJH/htRb6WBw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1c11q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66H7iE04015893;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewm32q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66H7iEdH015864;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66H7iEwa015862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BE89F22B8C; Fri, 17 Jul 2026 13:14:13 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 2/5] lib: sbi: Introduce sbi_hart_protection_reconfigure() function
Date: Fri, 17 Jul 2026 13:14:10 +0530
Message-ID: <20260717074413.2536416-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59dd52 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=lEsuMq01qxSVSr6n3k4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfXwquBdNy/cp2P
 +oqCQfhv6xW5Q4Von6k2XU5NkJiYnFeCsCPBuYutvWCaDCpj1zJytthDwKA55WCL2tau8O5gQNr
 RqsKeBsMjk98+Spbk04dGZun6MNRaLZNJBDxwUaZBnX9keR7mUuDjEyeGxKyqKdxxnS+IxxISdN
 zJVq8Argfqd8hSfE2DmrbDgd8JmJmgzpJzxZnEJAxY4PwLebgRufywCTfHbaOKiHhs/1G+VyIAi
 rXORiRn3npzLAvc35yToMiLkaANLgJMTZTdrBp389oc5o1TLzt+BqdD+28mF+knu2YYlHpWTH6E
 /79UXY+aSHcA11fSwFuFdaQN2iXfZ5SymFfN7QiVgZ+KUOGe7+/BT6eTlJWZMJi/yeipA6BY+O1
 CIe4IGIZ2xZ6g3ghEBtc53fgTxGayRniB5Or3NcSBdtRnRN54AvOeyKw4BM9BCOlO1aI5dp49iw
 ecM4plnwxRyYnafzSqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX55HGs4qct1YB
 kq9BBZdpYGW+etN+aO/AGJ6SBxVo8Bl/uq3M7cArFigLPQOl0PAAyBBs9By1klGeIyI6QECdWpw
 s+bLUq2dJTeqANNy8zoPkUj+XLFkISg=
X-Proofpoint-GUID: d0QZKAaZlGGwHg2V5sxJcG5_-1iTQBO4
X-Proofpoint-ORIG-GUID: d0QZKAaZlGGwHg2V5sxJcG5_-1iTQBO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_004422_940971_12A2D69C 
X-CRM114-Status: GOOD (  14.77  )
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
 lib/sbi/sbi_hart_protection.c     | 33 +++++++++++++++++++++++++------
 3 files changed, 35 insertions(+), 8 deletions(-)

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
index fbebfd1a..ed407ab7 100644
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
@@ -61,16 +60,38 @@ int sbi_hart_protection_configure(struct sbi_scratch *scratch)
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
+	int ret;
+
+	__hart_protection_unconfigure(scratch, hprot);
+	ret = __hart_protection_configure(scratch, hprot);
+	if (ret)
+		return ret;
+
+	return 0;
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
