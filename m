Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A3C53209
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 04:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOpsGqri0v6DJnKQZoAERHJvSDCnIe3+FSwlg+mnJiY=; b=FQjnlHAXEu9uol
	NPadR1L1X7O150+AawFOxjujnqvIxXoHebN88zu9Ohu53Zd9xKDlwpgtLL+AMyyI8xfo67gG/gRNz
	IC4HBX8RERaIBsRbnC7ohO4fq2bCM7ZCiCPwLIvmY/FXKI5rSv0fz6k4+wWuhybTSdyi0a4QlWbU9
	aTmo7VYKfjw9zkjoTA6Yo3sBC9X5Nxi6FfmM3qFpKNY5havdEFU7rRX6ihGEIcBuih0fMr5zVr6KH
	wowQycwK3KhlHKOMpvDzaolZc2i1D34O+caywJMYS5wPcIKb5Yxz+KMFDfZg2rQ41iyLFBCwfIZ/2
	U3DTuXpgJon9jQOyQA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCty-00000001vbs-2VQm;
	Mon, 27 Jul 2026 04:25:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCtv-00000001vaN-0895
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 04:25:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R3HGdL3604391;
	Mon, 27 Jul 2026 04:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MnhILiVJxEs
	GwKlkhW4V3sXXVq38JswObtPsD1/K7yM=; b=OvGgTq/iwNIdNBumDCnBKNJ2mgp
	Lk9bhIs94ehG/Y5AshVsKijepKtZwbDqY5JqqHIy1nIbw7Z1QY4owpUVAdWQYLET
	QqJsk18Ss8tOvoHKt/yAiRgBwWNXrRcGUT5ozFjsdbV4HOHT00uHQVTMhV46B4hn
	RsDCIr5J/lsR6yCd+0aTfguC6mMtScDS2Vt4uiMziH4dkPzKU1/6hUF/xcorzflw
	BFDguwrl6ROBnVsONbUG13VYTnIn83zb9WDbUPWePtu8axCBp0A/wxYRCRJFBbDa
	EWa0HLjvEYAQsXo6wGahVu7/JpUl58Q5aZWFburmA+Fn5DKf2jhMcFd7haA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wg4y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66R4P6PO020036;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fmp7hjd8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66R4P64V020017;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66R4P6VQ020013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id B0FFA22BC1; Mon, 27 Jul 2026 09:55:05 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 4/5] lib: sbi: Extend hart protection abstraction to allow ID configuration
Date: Mon, 27 Jul 2026 09:55:03 +0530
Message-ID: <20260727042504.1743250-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfXzsjNOFMwO3Mc
 llmkLLyoB+htCWTu3FEVmKhzxIojaiy8YYtoSDIrZ5MYalTndD6EVF/AaTbcaRoqCMlxry7KhQM
 QMGFZA8jJoXiaq/MyIVrWsi9gqFvKCDlRD8FWvjNz0d+PtL92mszq+YWixMy1XeMWfy5WYkT+fw
 Xv2VStx6D/k0fe+3MgK2LLjgNXq/ZqS6rzKxwtOt+++hyfAkBiLuwVeA8Ax2TijTi8me+qyh016
 OTKPr762EHHvLC1e4jGLqcjsCYHTLiiljijL/pIe4WV7NMWgDHcX4W9os14YXelIL/dGwirND01
 v7v0CVDEdsg5+qjHsIe1KOxCsmSrYpxCevTW2Qym0pHK3TBOgefTqPejup/w9j/rSib96VHRtpo
 CV9LjvdVPtqE1U5W4jNKdmrJZj33tRoRK66bdjtOhn0MCxFIPbxRXsA6i49Fj6O2ygLH/Ey2SBj
 9ZmRNiV7d2gHzeveqyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfXy+VRjvQ/oxoS
 tsVzuG9LBZE8DsRFZ0lu+jr6wdzag7/c8qr3mD7SC5N1EIsIDOBV5YFuWvoB5HdBtMjxJG7RK1F
 hjZDZXsSgvxxEUyI/zjnqYF1HP8PcNM=
X-Proofpoint-ORIG-GUID: AkfqnfOuOXyXtxjhzItxPUCPgOuXtmYJ
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a66dda6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=fpceXIQPXNCN1ozAXgcA:9
X-Proofpoint-GUID: AkfqnfOuOXyXtxjhzItxPUCPgOuXtmYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_212515_074211_413DE129 
X-CRM114-Status: GOOD (  21.40  )
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

There are various ID configuration ISA extensions such as RISC-V Worlds,
Supervisor domain ID, QoS ID, etc which need to be re-configured upon
domain context switch on a hart. Extend hart protection abstraction to
support both memory protection and ID configuration ISA extensions.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_hart_protection.h | 16 ++++-
 lib/sbi/sbi_hart_pmp.c            |  2 +
 lib/sbi/sbi_hart_protection.c     | 97 +++++++++++++++++++++++++++----
 lib/sbi/sbi_init.c                |  2 +-
 platform/generic/eswin/eic770x.c  |  1 +
 5 files changed, 103 insertions(+), 15 deletions(-)

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
index 5e170f05..de5f2f89 100644
--- a/include/sbi/sbi_hart_protection.h
+++ b/include/sbi/sbi_hart_protection.h
@@ -13,6 +13,13 @@
 struct sbi_scratch;
 struct sbi_domain;
 
+/** Different types of hart protection mechanisms */
+enum sbi_hart_protection_type {
+	SBI_HART_PROTECTION_TYPE_MEMORY = 0,
+	SBI_HART_PROTECTION_TYPE_ID,
+	SBI_HART_PROTECTION_TYPE_MAX
+};
+
 /** Representation of hart protection mechanism */
 struct sbi_hart_protection {
 	/** List head */
@@ -21,6 +28,9 @@ struct sbi_hart_protection {
 	/** Name of the hart protection mechanism */
 	char name[32];
 
+	/** Type of the hart protection mechanism */
+	enum sbi_hart_protection_type type;
+
 	/** Ratings of the hart protection mechanism (higher is better) */
 	unsigned long rating;
 
@@ -40,11 +50,11 @@ struct sbi_hart_protection {
 };
 
 /**
- * Get the best hart protection mechanism
+ * Get the best hart memory protection mechanism
  *
- * @return pointer to best hart protection mechanism
+ * @return pointer to best hart memory protection mechanism
  */
-struct sbi_hart_protection *sbi_hart_protection_best(void);
+struct sbi_hart_protection *sbi_hart_memory_protection_best(void);
 
 /**
  * Register a hart protection mechanism
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 5ede3cc1..c0a4ce1b 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -425,6 +425,7 @@ static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch,
 static struct sbi_hart_protection pmp_protection = {
 	.name = "pmp",
 	.rating = 100,
+	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
 	.configure = sbi_hart_oldpmp_configure,
 	.unconfigure = sbi_hart_pmp_unconfigure,
 };
@@ -432,6 +433,7 @@ static struct sbi_hart_protection pmp_protection = {
 static struct sbi_hart_protection epmp_protection = {
 	.name = "epmp",
 	.rating = 200,
+	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
 	.configure = sbi_hart_smepmp_configure,
 	.unconfigure = sbi_hart_pmp_unconfigure,
 	.map_range = sbi_hart_smepmp_map_range,
diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index 36880a9c..d607ed74 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -10,12 +10,16 @@
 
 static SBI_LIST_HEAD(hart_protection_list);
 
-struct sbi_hart_protection *sbi_hart_protection_best(void)
+struct sbi_hart_protection *sbi_hart_memory_protection_best(void)
 {
-	if (sbi_list_empty(&hart_protection_list))
-		return NULL;
+	struct sbi_hart_protection *pos;
 
-	return sbi_list_first_entry(&hart_protection_list, struct sbi_hart_protection, head);
+	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
+		if (pos->type == SBI_HART_PROTECTION_TYPE_MEMORY)
+			return pos;
+	}
+
+	return NULL;
 }
 
 int sbi_hart_protection_register(struct sbi_hart_protection *hprot)
@@ -25,6 +29,8 @@ int sbi_hart_protection_register(struct sbi_hart_protection *hprot)
 
 	if (!hprot)
 		return SBI_EINVAL;
+	if (hprot->type >= SBI_HART_PROTECTION_TYPE_MAX)
+		return SBI_EINVAL;
 
 	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
 		if (hprot->rating > pos->rating) {
@@ -74,28 +80,97 @@ static void __hart_protection_unconfigure(struct sbi_scratch *scratch,
 int sbi_hart_protection_configure(struct sbi_scratch *scratch,
 				  struct sbi_domain *dom)
 {
-	return __hart_protection_configure(scratch, sbi_hart_protection_best(), dom);
+	bool do_configure, memory_protect_done = false;
+	struct sbi_hart_protection *hprot;
+	int ret;
+
+	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
+		do_configure = false;
+		switch (hprot->type) {
+		case SBI_HART_PROTECTION_TYPE_MEMORY:
+			do_configure = !memory_protect_done;
+			memory_protect_done = true;
+			break;
+		case SBI_HART_PROTECTION_TYPE_ID:
+			do_configure = true;
+			break;
+		default:
+			break;
+		}
+		if (!do_configure)
+			continue;
+
+		ret = __hart_protection_configure(scratch, hprot, dom);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch,
 				     struct sbi_domain *dom)
 {
-	__hart_protection_unconfigure(scratch, sbi_hart_protection_best(), dom);
+
+	bool do_unconfigure, memory_protect_done = false;
+	struct sbi_hart_protection *hprot;
+
+	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
+		do_unconfigure = false;
+		switch (hprot->type) {
+		case SBI_HART_PROTECTION_TYPE_MEMORY:
+			do_unconfigure = !memory_protect_done;
+			memory_protect_done = true;
+			break;
+		case SBI_HART_PROTECTION_TYPE_ID:
+			do_unconfigure = true;
+			break;
+		default:
+			break;
+		}
+		if (!do_unconfigure)
+			continue;
+
+		__hart_protection_unconfigure(scratch, hprot, dom);
+	}
 }
 
 int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 				    struct sbi_domain *current_dom,
 				    struct sbi_domain *next_dom)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+	bool do_reconfigure, memory_protect_done = false;
+	struct sbi_hart_protection *hprot;
+	int ret;
+
+	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
+		do_reconfigure = false;
+		switch (hprot->type) {
+		case SBI_HART_PROTECTION_TYPE_MEMORY:
+			do_reconfigure = !memory_protect_done;
+			memory_protect_done = true;
+			break;
+		case SBI_HART_PROTECTION_TYPE_ID:
+			do_reconfigure = true;
+			break;
+		default:
+			break;
+		}
+		if (!do_reconfigure)
+			continue;
 
-	__hart_protection_unconfigure(scratch, hprot, current_dom);
-	return __hart_protection_configure(scratch, hprot, next_dom);
+		__hart_protection_unconfigure(scratch, hprot, current_dom);
+		ret = __hart_protection_configure(scratch, hprot, next_dom);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
 
 	if (!hprot || !hprot->map_range)
 		return 0;
@@ -105,7 +180,7 @@ int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 
 int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
 
 	if (!hprot || !hprot->unmap_range)
 		return 0;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 02e26924..388f3ecb 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -93,7 +93,7 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	sbi_printf("Platform Features           : %s\n", str);
 	sbi_printf("Platform HART Count         : %u\n",
 		   sbi_platform_hart_count(plat));
-	hprot = sbi_hart_protection_best();
+	hprot = sbi_hart_memory_protection_best();
 	sbi_printf("Platform HART Protection    : %s\n",
 		   (hprot) ? hprot->name : "---");
 	idev = sbi_ipi_get_device();
diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index da4d0e34..c71198a8 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -470,6 +470,7 @@ static void eswin_eic7700_pmp_unconfigure(struct sbi_scratch *scratch,
 static struct sbi_hart_protection eswin_eic7700_pmp_protection = {
 	.name = "eic7700_pmp",
 	.rating = -1UL,
+	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
 	.configure = eswin_eic7700_pmp_configure,
 	.unconfigure = eswin_eic7700_pmp_unconfigure,
 };
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
