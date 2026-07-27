Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF181C531FC
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 04:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwHTRpoeL+jlqb3KTrUpVqf01Bfo2nvUUgJNc/REZAc=; b=PCrShERxg9Osve
	CD3aIFBSm/FCfdpER2WKiz3T22UepsFAE4vqEpH27zfnwEIQiNhiiQcsUTnhrblDp5VUxDvRcCbPp
	1kD8k6ALi+pSB5ixz0NKnITS7PuLs6Ebb073GygdShE8uWriOBMzY2+6csh3kiHJtnqQ4D57dU0qZ
	Rj+kK7iJwInMWBJG60NC6tv3Sr0hFUeuaT0r15h2CWuba8dCVd/QDU+BGkrEhmylP0e6bbMcS79b6
	FSCx5yB9Ygof+GO1bJiHPke3pgFwAFCrEPyRyO+u8yJqu4gW74NqkTP5vAGZVbPw7RqPh65h6tWtN
	eDIHTMh3i3yvsOAxP5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCtw-00000001vas-18B4;
	Mon, 27 Jul 2026 04:25:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCtt-00000001vZH-3gX8
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 04:25:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fuZ92175956;
	Mon, 27 Jul 2026 04:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QJ4D6zrbES4
	u2sM2gbYpR9qe6B72ZzOd65uyt5JDoWI=; b=V9PXd6eNbDSa+p4yPQ+lQxb0iAs
	WoKfZlsoB6Rb0+Gkxh5UMvOxtNTwv4FXmnnDTyMXtA3v44xlr6INwUzTqMSGoZyU
	iS/HoN2R4qIBw7JB4psJqKZoTxBV0dbUL2PlVrxlxiBsARtwF8p7fy5X2nv/rljF
	qK2bY2YIGV/i+c9+GCXyb0BNYCSAQkE6/m9G0CmmbrPrZWf/BTD8mLBlWIwtX6Pz
	BBIPRf0a0jJ1orLD/aPSi314g+fa0uiAq4bznthbctHwjEAANgF0d3tBIWmWK0ti
	7WQPqjhqxlbh4lSft7gM3zPKxZvjMxz4ZlzV28f7rqASf42/LBEuxqV3CFg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwevags-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66R4P6vu020037;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fmp7hjd8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66R4P6WX020014;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66R4P6Oq020009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id ADA9122B8C; Mon, 27 Jul 2026 09:55:05 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v2 3/5] lib: sbi: Add domain parameter to hart protection (un)configure()
Date: Mon, 27 Jul 2026 09:55:02 +0530
Message-ID: <20260727042504.1743250-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfX1aNJHFCUuLVI
 2DLA4AoeBEPpKjnjghjXm3H9TtPtp3YHhCyY5KExMZiXFZbhXiXm6RHztwvMvmb0Rov5Tshls5p
 qWhFYluoQpJqxaj4Q4eOxhJfS2Fm46Q4CtyoSRZg1H8U5/vu1GUa5To7frzX9OufsQfJ+GrQeU0
 TjtJLwgq8gIJGYF+dk4CbfmQgJ3tsTkAmCDKasZgudnLuQ9YFivXytHcE1CZasLwhSSxvhbmOcb
 w+Usges2CfLi70LO9qX+9pyxO1xA8U2q+8Ahnmmzrm8p6eDJiEjgcYCS1HiLIzBT7EFylT6m5eO
 I0y75yNmEFBuMAwROG4CIWjRCCaCfE91NFEDbj0ExQsaOWoZi6JlRTlADxRU4cwtKWIai0McYcH
 tQ9W0DTnUHiGgnjtq2/hjQmPpTiWlbxi/ujO5W9tBQ8Of5sCSo4WcxJer8c1oNt2yGEws+CQGtj
 zxrDL8CpMoYZCw3awRQ==
X-Proofpoint-GUID: FgjwG5xEOtZaYoud4Gd16l3wawWDRkNp
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a66dda6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=jSPNLT6Jh6jtsI9LWPcA:9
X-Proofpoint-ORIG-GUID: FgjwG5xEOtZaYoud4Gd16l3wawWDRkNp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfXxYiR/0Fh7RLN
 hUmcr3OV6iT6yai3PuTBqxu4icUSgQXhLf9AuuIHo8+/4O5lp+pgsJancXBvY9aP5FRbb4U+onD
 T7d80sSFdtDULyd3D5nEJR02spFifhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_212513_924771_FBE07D1B 
X-CRM114-Status: GOOD (  19.89  )
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
Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
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
index 9a8427b9..36880a9c 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -50,41 +50,47 @@ void sbi_hart_protection_unregister(struct sbi_hart_protection *hprot)
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
 
-	__hart_protection_unconfigure(scratch, hprot);
-	return __hart_protection_configure(scratch, hprot);
+	__hart_protection_unconfigure(scratch, hprot, current_dom);
+	return __hart_protection_configure(scratch, hprot, next_dom);
 }
 
 int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index d4aca242..02e26924 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -435,7 +435,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * Configure hart protection at last because if SMEPMP is
 	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
-	rc = sbi_hart_protection_configure(scratch);
+	rc = sbi_hart_protection_configure(scratch, sbi_domain_thishart_ptr());
 	if (rc) {
 		sbi_printf("%s: hart protection configure failed (error %d)\n",
 			   __func__, rc);
@@ -518,7 +518,7 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	 * Configure hart protection at last because if SMEPMP is
 	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
-	rc = sbi_hart_protection_configure(scratch);
+	rc = sbi_hart_protection_configure(scratch, sbi_domain_thishart_ptr());
 	if (rc)
 		sbi_hart_hang();
 
@@ -539,7 +539,7 @@ static void __noreturn init_warm_resume(struct sbi_scratch *scratch,
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
