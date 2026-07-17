Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E04C44515
	for <opensbi@archiver.kernel.org>; Fri, 17 Jul 2026 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPStx55c5sbGhpT0VmyE3tSnOeriqG0QCTCCj0mthAw=; b=ddVyq3j7iqCNVO
	aq0s4BFACcDO1iMhRnVR/H2/Zu7qqQOtGXFR/7ORTayPoOitmGGyuyb/sjeE2PSJFs/p5YQAeDkel
	uQ80/nj8o6FNShhepvtt/08Z/Y0lecpmN5l12Mn1NHZeL+JwaayHIycKjDSIGUrzyArSTeKjK3300
	acyDqMN24GwdZeBEiTpkGs6ed+kZCvNnlHLt18nsixINRgny2C9+SKQWcQcsBETjDj5HD7Cmmvv/v
	kmh2mohsjHDIkx6aQfTGO1KpriGV+x4WNOo3KquwmOpYiiBlxPetjCP6OyRRvOQ4DUE29vol0IuZC
	xiyBxSWGPtY7m2J/rRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFA-00000001Uem-2EAw;
	Fri, 17 Jul 2026 07:44:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdF8-00000001Ud5-1oHq
	for opensbi@lists.infradead.org;
	Fri, 17 Jul 2026 07:44:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQa2951335;
	Fri, 17 Jul 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B1lzH1TWx0I
	vdogr7nk+f7/U5uchfTdPNDBmcaoq0G8=; b=mW+TimeC+cZFUIkJkYktrIwqnfA
	mwUd0+RytlW+Z7X71gEc3ak12Ll9bFfmb2QDJb/tYJbzR+BQWhPz7O0tB4TDL0Ki
	IZSehLW1KCiXCFa79ufXoXoEAxfVi7SzaMb1YQM31V2/FD6GAuG1GJC3twpVzArk
	GqOmqxRYyhZu8q9HDcG5I5cVSbz0tYtd6CVDQ+BQ6uf4LcjvhyZr6TbiQ2p2LjWL
	Zjff1HELAHzCnIMMCyRCgOJhLYB/Ayjue/vj7qKh79BrnXBu+EgxK7k3wKahVWFG
	y4vKMPimn04jlC34XxpVVmuVj/76knxeKnh6pVsbierMHONI62C6sUEY/wQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2u563-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66H7iEC2015891;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewm32q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66H7iE1e015863;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66H7iEpG015858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C6DE322C38; Fri, 17 Jul 2026 13:14:13 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 4/5] lib: sbi: Extend hart protection abstraction to allow ID configuration
Date: Fri, 17 Jul 2026 13:14:12 +0530
Message-ID: <20260717074413.2536416-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: HL3TMRl9bwGhJsueFUZF1dpe2QGcT4ne
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX5z7RWODvigzv
 igL3HI9SG6G8TizSzuQjwpmxNyf54s/+GRuHfLnwYg4b2UM5mLoBneZ614GtpXwkr5afwVA46jy
 Bkmkpiv/MoetJi17D1OUZvLLSAzDEMQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX4B5mkTjU3CRM
 KvZS6IGxrttbiZBrXxgmABxnH0XP/xNaDfAN8rouwMSWn3HmWLYGjbXGOiCaUg+xQjuc3wJ5I5O
 Q+GsBDwXETqVwO1jihuKAcDbmftHa1JfxciwoVHckTjC8KhAXZ2h/K88kOP7zXeS2hJtbzMTZvL
 vvgh9bYaBOvHHcYvrx+6MtREykKvKe9y0HsV/+nXLQxN/iBk4jltTK8qstnGWDP61+Q4bEsRfCf
 CceZfiLNT7gCm5P32SSjEjX4I3geIURjtds4ciK8F0rN8QyaTpNkYKeGEEdB7NALwHHaizBEsJl
 Y3T88vKTSf9PgHiGvfRoWEHrMfUuzaNto+GuemI3q43x6dAXJo1Dea3c0pqXGytcgbdlsC7gkP3
 etT/tCuCgwCv5XLYZhoPGwrMtc6e1kNWv7ZQxdlTJn7Xrws9r33cLxZzzEoKFGPtPLpLt5OwJig
 DZ8M7n1TCtku9EGNv0g==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59dd52 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=ZeB3pxtiXGfQFvdFbFsA:9
X-Proofpoint-GUID: HL3TMRl9bwGhJsueFUZF1dpe2QGcT4ne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_004422_590068_BACC82A1 
X-CRM114-Status: GOOD (  20.16  )
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
 include/sbi/sbi_hart_protection.h | 16 +++++-
 lib/sbi/sbi_hart_pmp.c            |  2 +
 lib/sbi/sbi_hart_protection.c     | 94 ++++++++++++++++++++++++++-----
 lib/sbi/sbi_init.c                |  2 +-
 platform/generic/eswin/eic770x.c  |  1 +
 5 files changed, 98 insertions(+), 17 deletions(-)

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
index 5e170f05..1358b5be 100644
--- a/include/sbi/sbi_hart_protection.h
+++ b/include/sbi/sbi_hart_protection.h
@@ -13,6 +13,13 @@
 struct sbi_scratch;
 struct sbi_domain;
 
+/** Different types of hart protection mechanisms */
+enum sbi_hart_protection_type {
+	SBI_HART_PROTECTION_TYPE_MEMORY = 0,
+	SBI_HART_PROTECTION_TYPE_ID,
+	SBI_HART_PROTECTIOn_TYPE_MAX
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
index fecefde8..d31e9938 100644
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
@@ -74,33 +78,97 @@ static void __hart_protection_unconfigure(struct sbi_scratch *scratch,
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
 	int ret;
 
-	__hart_protection_unconfigure(scratch, hprot, current_dom);
-	ret = __hart_protection_configure(scratch, hprot, next_dom);
-	if (ret)
-		return ret;
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
+
+		__hart_protection_unconfigure(scratch, hprot, current_dom);
+		ret = __hart_protection_configure(scratch, hprot, next_dom);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
 
 int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
 
 	if (!hprot || !hprot->map_range)
 		return 0;
@@ -110,7 +178,7 @@ int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 
 int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
+	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
 
 	if (!hprot || !hprot->unmap_range)
 		return 0;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index d74dc67c..3f1f136a 100644
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
