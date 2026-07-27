Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F1EC531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 04:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xiTpP+4tfN+jGe75hKpfo0AGIKwda+btqsbgxomew0=; b=MhC9oBMDRNzUzN
	s/hsO6QKTqRKmqDnnQLXvR/RkjxB3X+OxIkpKPxhBi/7+W+pmy7Alzahe84nKkirZZDzI3HQCiVsk
	OPaBaCR3KUcHCpJgEAuRj5ojc6vW3YIh+c9mhD39VZeNB6THW18d0ri/KFIJXMSZd+akjstD494Lu
	mra2V+s3CKz4klsJ7vynd6wCApB3tY7FpfgqfS9E/B7dRyyFxwtgtcYe923KzFz1Mr7PGHCq9Klk+
	G7Sjjah7AebuPficKeU6YvNcwCN4rHfKnRWfEXsYvpT1vgJ+ZbUMkJwnkwX7h9Hl2VCqOkTXhNyXb
	DWoIboxG0Jvs5gMibx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCty-00000001vbh-26jl;
	Mon, 27 Jul 2026 04:25:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCtu-00000001vZF-2HaH
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 04:25:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1hUIK2140671;
	Mon, 27 Jul 2026 04:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KXL/ugs0HbY
	WH9z7B5mvY/w4CKaOXqTfuGvBXKTmDdo=; b=CAxPkyTSvBYcWOxqe3BgpUlfAqR
	BZC8IhXq9CS6dVl9+h1wVJdyK8kAMTnxeG8GEOJJFX6yIBghRjOvPwoYNrq7oPds
	Lton063GybJknpc6PJhj27709FHzXSFOLDa1bDmEDwyhYfaH0f7+gxJ/D7M8YiL/
	68ioo1WDnsGAaLQkUA+F7rj2cqpDCcY71w2cgfNUljF9nCs58OAbsJrBBzuAwIoH
	YgXU5gyztSk5e7Ox/hwlGR31/HNfmxoGuOdUVHtyCbelWddVwHzzhrRTCOBsNvr/
	fnksvswWTg6vPtEM8EK9oysM5Da3zRq8NF/yxxJRsPYe6AowYYKWzF51p6A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7veam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:10 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66R4P6vv020037;
	Mon, 27 Jul 2026 04:25:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fmp7hjd96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:07 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66R4P7lR020068;
	Mon, 27 Jul 2026 04:25:07 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66R4P78b020067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:07 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id B429224A76; Mon, 27 Jul 2026 09:55:05 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 5/5] lib: sbi: Print list of all hart protection mechanisms at boot time
Date: Mon, 27 Jul 2026 09:55:04 +0530
Message-ID: <20260727042504.1743250-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: LG8MCwIyTAUntUEU8amacSaAplYP-Vk7
X-Proofpoint-GUID: LG8MCwIyTAUntUEU8amacSaAplYP-Vk7
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a66dda6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=a6pi3eVxuCcDFANDvycA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfX8MNJinYI340B
 cscSMLOUtEhoZ+bt3se4WbKcr/LXCCffEBoLAf8vUrE/XO626/sBhj1c+akzbjKHxaNDdCKpLhl
 ILgDZU41Ag5rbS8QRWNDo1lLd3yPU3Juz4p9fIlI6V1I0Pom1Uc++bcXtzwQORtxsizUydNeohM
 Ypwkc+Mv4CGfCjWOjx8Pj4/l/m2++DsYOF+Azjbo1rpNMk6Ythd7BRGcaT6Cc7FeFJfkWjeZsjb
 pg08Gg+jHhiXWjizsMaJK1Jk8Oxclg+L+ELdDY7WJocvI5iLCpBVgIJHUAr35aeYbN9f3VuIz7n
 JhpHEiORCYUAGXq/zgksi59W3Aty3FKONcy68l4oiXo3b/cB50G/zmHOUNV/uz9bkq01b3qrqry
 tRZG7qXBkIBXw742+jZzkNkTLyrmAUcFaekNgrREvpwGyl6vkkbv/cnju7o3XckDQSArKATFWnG
 ifYnds3xqsW4Pqzs+XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfX9Jsw/U6oGaRi
 Kjgpwo0fSDtDHiZOhvlsEdT8ba6b4P0TmYhNyOyOtkWhd8wtePOn5T51lAzMIOyct/FgfpgcbjA
 HdEek7QdTeeaYZvDLiHgLCycJHs+IpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_212514_702610_691FCF7F 
X-CRM114-Status: GOOD (  16.72  )
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

Instead of printing only the best hart memory protection name at
boot time let's print a list of all hart projection mechanisms.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_hart_protection.h |  7 +++++--
 lib/sbi/sbi_hart_protection.c     | 34 ++++++++++++++++++++++++++++---
 lib/sbi/sbi_init.c                |  6 ++----
 3 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
index de5f2f89..cafe6ee7 100644
--- a/include/sbi/sbi_hart_protection.h
+++ b/include/sbi/sbi_hart_protection.h
@@ -50,11 +50,14 @@ struct sbi_hart_protection {
 };
 
 /**
- * Get the best hart memory protection mechanism
+ * Get a string containing names of protection mechanisms
+ *
+ * @param out_str pointer to output string
+ * @param out_str_size maximum size of output string
  *
  * @return pointer to best hart memory protection mechanism
  */
-struct sbi_hart_protection *sbi_hart_memory_protection_best(void);
+void sbi_hart_protection_get_str(char *out_str, int out_str_size);
 
 /**
  * Register a hart protection mechanism
diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index d607ed74..c4c149c8 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -4,13 +4,15 @@
  * Copyright (c) 2025 Ventana Micro Systems Inc.
  */
 
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
 
 static SBI_LIST_HEAD(hart_protection_list);
 
-struct sbi_hart_protection *sbi_hart_memory_protection_best(void)
+static struct sbi_hart_protection *__hart_memory_protection_best(void)
 {
 	struct sbi_hart_protection *pos;
 
@@ -22,6 +24,32 @@ struct sbi_hart_protection *sbi_hart_memory_protection_best(void)
 	return NULL;
 }
 
+void sbi_hart_protection_get_str(char *out_str, int out_str_size)
+{
+	bool memory_protect_done = false;
+	struct sbi_hart_protection *pos;
+	int offset = 0;
+
+	if (!out_str || out_str_size <= 0)
+		return;
+	sbi_memset(out_str, 0, out_str_size);
+
+	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
+		if (pos->type == SBI_HART_PROTECTION_TYPE_MEMORY) {
+			if (memory_protect_done)
+				continue;
+			memory_protect_done = true;
+		}
+		sbi_snprintf(out_str + offset, out_str_size - offset, "%s,", pos->name);
+		offset = offset + sbi_strlen(pos->name) + 1;
+	}
+
+	if (offset)
+		out_str[offset - 1] = '\0';
+	else
+		sbi_strncpy(out_str, "none", out_str_size);
+}
+
 int sbi_hart_protection_register(struct sbi_hart_protection *hprot)
 {
 	struct sbi_hart_protection *pos = NULL;
@@ -170,7 +198,7 @@ int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 
 int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
+	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
 
 	if (!hprot || !hprot->map_range)
 		return 0;
@@ -180,7 +208,7 @@ int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 
 int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
+	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
 
 	if (!hprot || !hprot->unmap_range)
 		return 0;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 388f3ecb..acd2f8b6 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -76,7 +76,6 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	const struct sbi_hsm_device *hdev;
 	const struct sbi_ipi_device *idev;
 	const struct sbi_timer_device *tdev;
-	const struct sbi_hart_protection *hprot;
 	const struct sbi_console_device *cdev;
 	const struct sbi_system_reset_device *srdev;
 	const struct sbi_system_suspend_device *susp_dev;
@@ -93,9 +92,8 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	sbi_printf("Platform Features           : %s\n", str);
 	sbi_printf("Platform HART Count         : %u\n",
 		   sbi_platform_hart_count(plat));
-	hprot = sbi_hart_memory_protection_best();
-	sbi_printf("Platform HART Protection    : %s\n",
-		   (hprot) ? hprot->name : "---");
+	sbi_hart_protection_get_str(str, sizeof(str));
+	sbi_printf("Platform HART Protection    : %s\n", str);
 	idev = sbi_ipi_get_device();
 	sbi_printf("Platform IPI Device         : %s\n",
 		   (idev) ? idev->name : "---");
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
