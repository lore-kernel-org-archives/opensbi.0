Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07157C4451C
	for <opensbi@archiver.kernel.org>; Fri, 17 Jul 2026 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ah/uWN3N4n0KTMWqAb25DS88taJJALgRTv+UfR/FAUI=; b=Oj1tcKmlMDi1n3
	p2m5HihZzV5TgNdmLOGZeMGZJhPdQOJoo2Sn718QUbl+YMXEl8DogVlJFzolJs8RKqXCjqWmYvknB
	lKBCZgW7pQc7tBAE/R6Vo7uHU8zLhkqcSsqfvWF5nc186EXVLEm+0PQeIP+TfXpAbAGOYqsorbj/Z
	ZW3rtdZGobyo1FwhEkBcnzLotGJzVCcU3K1c9xdKDU/G4EnH0ZjgiXdfIVuhaR+u6pWby4VOyQU7w
	BFFqOIaKwgmE+X3taX/2deETp9HXIqMF6HaRmgkR5X1UhMuguCC+QJ6UU7OKSaRcjlUA3ITh37kij
	JtA28c1L6D66KdrzbtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFE-00000001UgO-3JB2;
	Fri, 17 Jul 2026 07:44:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdF9-00000001UdP-019O
	for opensbi@lists.infradead.org;
	Fri, 17 Jul 2026 07:44:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d5hn821203;
	Fri, 17 Jul 2026 07:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+B8jdK2WsNL
	I8VF+mMNT4bkjgCm5NIq3QTLazjRxTUw=; b=hqC7Ardnz0wyTSSyxkVdIEl2g87
	6m8rKDj03fJe9g5kEIOdnNLszK5AlMxrTixRpm7sTyXjJQhU275gs+FkLBnIH18D
	TaUbGTfJOUpx6WGTl67DwdFlrndCWpTwQzgo/ty6vISy7jLbQXe+J8OPtsW91SkG
	8bfVizZiIZuLXJDzxJavTZO1abMVrYFqNOjiL7KLbvw7bO1XDAdtqfA0mW6eH8t8
	URd1u+WtBRLMHP46HH+aslUXXY41LlilEpezEM1sG3iAxiudrPlExOlDH8aYeZmt
	EaHRvWYjx8l+6mkic9NLqTbeaFJoLQCJ5/Ph5REGGE7z/CH8aKmTP6PZSEA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag87n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66H7iE05015893;
	Fri, 17 Jul 2026 07:44:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewm32q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66H7iEY8015865;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66H7iELa015861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C2FFC22BC1; Fri, 17 Jul 2026 13:14:13 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 3/5] lib: sbi: Add domain parameter to hart protection (un)configure()
Date: Fri, 17 Jul 2026 13:14:11 +0530
Message-ID: <20260717074413.2536416-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX0WDhZQ7mLj45
 BqJJRwwVNPgJM5N6mlywa/T1I3PaSleM+9KmQBUEigZWU6xFnUS4OBGdR+27dwPeYrMpSwAnu0m
 rMvcbeJTnH7lUbFOiO1FqSfY0hQLYXeotor01kYZsBtu5uLV6yRIssbDBgShZCJkxJkXUXi0GEq
 NBR6NOFJE1oK2QFK/2JzmfvjvWp2uivVnoVmLPNfX1tcMvQ72YJ76H1vQjeIxhWnJqwuDzEt/0u
 BkgARvIwEjv8m1ufASPrsJfMpB5rWA6mf++x4eIg8X6airVEFuhYtf3trBDV6aeRv2JW6iWfgFg
 w7rW0hPlJ/HmLNvarrdvAfpyew4fxo4op6YNqgz/WJ9B+wuNPdLSznSgUcWBaknTxyn5j8agYDB
 j5RSdemkOT7C0WA208LRiMunOmF96XtEuFWE6bCwMODVI2OFX9Cr7KtKUHcjcO6atsDSuW3CH8Z
 UhLNphHpA3rSMUj48rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfXwSwP3UzUY0fl
 iAraB1L67RPiM1dkN2RnTeGoFt6SAg/RQ1q3pxSp5UGRs/4/8kYEyNMVAsT/rlqtO3mWWjRFrEx
 9rajVIveji4N6hQSlxYg5XWc76H4o24=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59dd52 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=jSPNLT6Jh6jtsI9LWPcA:9
X-Proofpoint-GUID: xKbMVfpVJM6Orx-kBbPIwW3IuAQcZvz2
X-Proofpoint-ORIG-GUID: xKbMVfpVJM6Orx-kBbPIwW3IuAQcZvz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_004423_050400_093377E8 
X-CRM114-Status: GOOD (  19.22  )
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

The switch_to_next_domain_context() already has the pointers to current
and next domains so pass them as parameters to hart protection configure()
and unconfigure() callbacks.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_hart_protection.h | 25 +++++++++++++++++++------
 lib/sbi/sbi_domain_context.c      |  2 +-
 lib/sbi/sbi_hart_pmp.c            | 11 ++++++-----
 lib/sbi/sbi_hart_protection.c     | 28 +++++++++++++++++-----------
 lib/sbi/sbi_init.c                |  6 +++---
 platform/generic/eswin/eic770x.c  |  7 ++++---
 6 files changed, 50 insertions(+), 29 deletions(-)

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
index 6698ceb0..5e170f05 100644
--- a/include/sbi/sbi_hart_protection.h
+++ b/include/sbi/sbi_hart_protection.h
@@ -11,6 +11,7 @@
 #include <sbi/sbi_list.h>
 
 struct sbi_scratch;
+struct sbi_domain;
 
 /** Representation of hart protection mechanism */
 struct sbi_hart_protection {
@@ -24,10 +25,10 @@ struct sbi_hart_protection {
 	unsigned long rating;
 
 	/** Configure protection for current HART (Mandatory) */
-	int (*configure)(struct sbi_scratch *scratch);
+	int (*configure)(struct sbi_scratch *scratch, struct sbi_domain *dom);
 
-	/** Unconfigure protection for current HART (Mandatory) */
-	void (*unconfigure)(struct sbi_scratch *scratch);
+	/** Unconfigure protection for current HART (Optional) */
+	void (*unconfigure)(struct sbi_scratch *scratch, struct sbi_domain *dom);
 
 	/** Create temporary mapping to access address range on current HART (Optional) */
 	int (*map_range)(struct sbi_scratch *scratch,
@@ -65,24 +66,36 @@ void sbi_hart_protection_unregister(struct sbi_hart_protection *hprot);
  * Configure protection for current HART
  *
  * @param scratch pointer to scratch space of current HART
+ * @param dom pointer to the domain for which HART protection
+ *        is being configured
  *
  * @return 0 on success and negative error code on failure
  */
-int sbi_hart_protection_configure(struct sbi_scratch *scratch);
+int sbi_hart_protection_configure(struct sbi_scratch *scratch,
+				  struct sbi_domain *dom);
 
 /**
  * Unconfigure protection for current HART
  *
  * @param scratch pointer to scratch space of current HART
+ * @param dom pointer to the domain for which HART protection
+ *        is being unconfigured
  */
-void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch);
+void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch,
+				     struct sbi_domain *dom);
 
 /**
  * Re-configure protection for current HART
  *
  * @param scratch pointer to scratch space of current HART
+ * @param current_dom pointer to the current domain for which
+ *        HART protection is being unconfigured
+ * @param next_dom pointer to the next domain for which HART
+ *        protection is being configured
  */
-int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch);
+int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
+				    struct sbi_domain *current_dom,
+				    struct sbi_domain *next_dom);
 
 /**
  * Create temporary mapping to access address range on current HART
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 7d9817d6..0861d541 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -171,7 +171,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	 * is also required for some of the above CSR updates (such
 	 * as satp CSR).
 	 */
-	sbi_hart_protection_reconfigure(scratch);
+	sbi_hart_protection_reconfigure(scratch, current_dom, target_dom);
 
 	/* Mark current context structure initialized because context saved */
 	ctx->initialized = true;
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 4528258d..5ede3cc1 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -228,10 +228,10 @@ static bool is_valid_pmp_idx(unsigned int pmp_count, unsigned int pmp_idx)
 	return false;
 }
 
-static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
+static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
+				     struct sbi_domain *dom)
 {
 	struct sbi_domain_memregion *reg;
-	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_log2gran, pmp_bits;
 	unsigned int pmp_idx, pmp_count;
 	unsigned long pmp_addr_max;
@@ -366,10 +366,10 @@ static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
 	return sbi_hart_pmp_disable(SBI_SMEPMP_RESV_ENTRY);
 }
 
-static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
+static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
+				     struct sbi_domain *dom)
 {
 	struct sbi_domain_memregion *reg;
-	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned long pmp_addr, pmp_addr_max;
 	unsigned int pmp_log2gran, pmp_bits;
 	unsigned int pmp_idx, pmp_count;
@@ -407,7 +407,8 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
 	return 0;
 }
 
-static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
+static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch,
+				     struct sbi_domain *dom)
 {
 	int i, pmp_count = sbi_hart_pmp_count(scratch);
 
diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index ed407ab7..fecefde8 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -50,42 +50,48 @@ void sbi_hart_protection_unregister(struct sbi_hart_protection *hprot)
 }
 
 static int __hart_protection_configure(struct sbi_scratch *scratch,
-				       struct sbi_hart_protection *hprot)
+				       struct sbi_hart_protection *hprot,
+				       struct sbi_domain *dom)
 {
 	if (!hprot)
 		return 0;
 	if (!hprot->configure)
 		return SBI_ENOSYS;
 
-	return hprot->configure(scratch);
+	return hprot->configure(scratch, dom);
 }
 
 static void __hart_protection_unconfigure(struct sbi_scratch *scratch,
-					  struct sbi_hart_protection *hprot)
+					  struct sbi_hart_protection *hprot,
+					  struct sbi_domain *dom)
 {
 	if (!hprot || !hprot->unconfigure)
 		return;
 
-	hprot->unconfigure(scratch);
+	hprot->unconfigure(scratch, dom);
 }
 
-int sbi_hart_protection_configure(struct sbi_scratch *scratch)
+int sbi_hart_protection_configure(struct sbi_scratch *scratch,
+				  struct sbi_domain *dom)
 {
-	return __hart_protection_configure(scratch, sbi_hart_protection_best());
+	return __hart_protection_configure(scratch, sbi_hart_protection_best(), dom);
 }
 
-void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch)
+void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch,
+				     struct sbi_domain *dom)
 {
-	__hart_protection_unconfigure(scratch, sbi_hart_protection_best());
+	__hart_protection_unconfigure(scratch, sbi_hart_protection_best(), dom);
 }
 
-int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch)
+int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
+				    struct sbi_domain *current_dom,
+				    struct sbi_domain *next_dom)
 {
 	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
 	int ret;
 
-	__hart_protection_unconfigure(scratch, hprot);
-	ret = __hart_protection_configure(scratch, hprot);
+	__hart_protection_unconfigure(scratch, hprot, current_dom);
+	ret = __hart_protection_configure(scratch, hprot, next_dom);
 	if (ret)
 		return ret;
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 4208db0b..d74dc67c 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -431,7 +431,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * Configure hart protection at last because if SMEPMP is,
 	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
-	rc = sbi_hart_protection_configure(scratch);
+	rc = sbi_hart_protection_configure(scratch, sbi_domain_thishart_ptr());
 	if (rc) {
 		sbi_printf("%s: hart protection configure failed (error %d)\n",
 			   __func__, rc);
@@ -510,7 +510,7 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	 * Configure hart protection at last because if SMEPMP is,
 	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
-	rc = sbi_hart_protection_configure(scratch);
+	rc = sbi_hart_protection_configure(scratch, sbi_domain_thishart_ptr());
 	if (rc)
 		sbi_hart_hang();
 
@@ -531,7 +531,7 @@ static void __noreturn init_warm_resume(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_protection_configure(scratch);
+	rc = sbi_hart_protection_configure(scratch, sbi_domain_thishart_ptr());
 	if (rc)
 		sbi_hart_hang();
 
diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index 3fe3d090..da4d0e34 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -380,9 +380,9 @@ static int eswin_eic7700_final_init(bool cold_boot)
 	return 0;
 }
 
-static int eswin_eic7700_pmp_configure(struct sbi_scratch *scratch)
+static int eswin_eic7700_pmp_configure(struct sbi_scratch *scratch,
+				       struct sbi_domain *dom)
 {
-	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_domain_memregion *reg, *prev = NULL;
 	unsigned int pmp_idx, pmp_max;
 	unsigned int i, j;
@@ -453,7 +453,8 @@ no_more_pmp:
 	return SBI_EFAIL;
 }
 
-static void eswin_eic7700_pmp_unconfigure(struct sbi_scratch *scratch)
+static void eswin_eic7700_pmp_unconfigure(struct sbi_scratch *scratch,
+					  struct sbi_domain *dom)
 {
 	/* Enable P550 internal + System Port */
 	sbi_hart_pmp_set(PMP_FREE_A_START + PMP_FREE_A_COUNT - 1, 0, 0,
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
