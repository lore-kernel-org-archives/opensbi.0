Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4EAC4451E
	for <opensbi@archiver.kernel.org>; Fri, 17 Jul 2026 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/bKXyB3gXGajQRVP7z+qMiWxhOOaRKeY+U9PN2PX3E=; b=ygaDGQJaXxFCqH
	M6qQPKaNMNyUk6oGnSuPIi+OA+IdYOKxTpcae1WUFEXv1Ira3NOz0LmhSZdtvDha4FhblOqxS6Wht
	5dO2uuuGk3lDltdeNPtKLQHXKUh6fbjWnt3spySuX2eEtoqPut5QY+IpxRNKyoOaD1lx/E7o5KZk0
	HKV0JbFAGQyoSScyA602mNEPG12eYmq4e8vcNTn92hon8GVsB1hddvrA4yg9ijRRimcvCxtqIzRJt
	n5Am/IRPrk/4Ws/FW/BboNUo3YLzPRDfT+QmtjArmmlrtDJKWWzWfEKvi+0AF1vxROT9spdtYSMYS
	K4NE/3mqBw2v0d5MWqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFF-00000001Ugk-02fV;
	Fri, 17 Jul 2026 07:44:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdF9-00000001Udt-1ReA
	for opensbi@lists.infradead.org;
	Fri, 17 Jul 2026 07:44:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ca2f1066306;
	Fri, 17 Jul 2026 07:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rgg4VaADBev
	8OyfvQMRJbrLJct9goEcZ9PvO1n9Jwhg=; b=YMCqtoi9xLNYtz+pXzAWhl/Vhrs
	6ThOCy+A6vFkXFXyn82hf/InRjLg/dujFR0ksNjsjkee0iLrhE+9mxsAIeNaoFF9
	FTfo4e9tmr6RiGLx+V4tU8iKY7/aULurwSLWDTEPDbgR+Xx4w1eMprMbXPAF0SaW
	dbRPopp/dEDe7b3DVp1qxAd81TFAJRLlYTmfofsJZ/tB4QbXtXye5PM9FS5ZmKrX
	7M6jZPsWpURiNBrjTM1hLzWgw4dS1hERtFAPUT+din+ibfWGVDFX+vPCu268/C3X
	Bmo3hqBiQnP+wb9MvVL++IR6owzdrYokBDZlAOhhvbPrfHqOYits2GmsjVw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquh0rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66H7iE07015893;
	Fri, 17 Jul 2026 07:44:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewm32qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:15 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66H7iFV1015922;
	Fri, 17 Jul 2026 07:44:15 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66H7iFK6015921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:15 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id CA59122CAA; Fri, 17 Jul 2026 13:14:13 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 5/5] lib: sbi: Print list of all hart protection mechanisms at boot time
Date: Fri, 17 Jul 2026 13:14:13 +0530
Message-ID: <20260717074413.2536416-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: JClO1zTxRxl3ufEtcDVkmfrs-4nok455
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX/Ue4WOOkS3ps
 m6TFbCQP5K0Ty6rjQ2KIY5B8Ir5xRfOMs0AsnuxvciGvslCx7t2qeprvwaLFKloEtILCXlWjXar
 amuLvDRqiNXjCmxXyGUrdIful6oWxWGK+J+kOseUAb2k6No7eilqwS79wytGI2kijgstOzGKwvV
 mD5MMsMNexzwmyTpTjGbcVrEfVTLXyRc92Nxc5fZ3ZW7QGheNSrUZwVzt8vA0/TWM3AGsj7LGAz
 uqlH/VzLiuV42A+lSslZn/J5wpekSSEY/L1mQbj5HH31PJkVPSR7+/Zxe686MJYwZjS1WkZCWOa
 gLiy1Tsah0MX3pd0E2PhHb4pBeWpGT15dd6R47+K/AJMxMn3Qo6F9Lin82Ngnd+icfOgTpafGQB
 NTGIJZ8K2ovgcbHKqUlMhu/JuJf/SOJplDtxiGaryI4qyI3bX5efbebPVPikAFQwyY+t/05FxgP
 Bq0Fsyj993kOs24C9Eg==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59dd53 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=a6pi3eVxuCcDFANDvycA:9
X-Proofpoint-ORIG-GUID: JClO1zTxRxl3ufEtcDVkmfrs-4nok455
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX2PehlSg75VEP
 eAMUXXc7jMdzNC2CJ5CLElPS3VmssLr4YGPOv3BdnNv28DzfMBYFlzmhJ421eXLat1mTaEn17ZM
 0QO9fLNKqhY/9TLHlaM6KYs7Tcthj7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_004423_398922_43612238 
X-CRM114-Status: GOOD (  16.20  )
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
index 1358b5be..dbe8eae1 100644
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
index d31e9938..a5f19639 100644
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
@@ -168,7 +196,7 @@ int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 
 int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
+	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
 
 	if (!hprot || !hprot->map_range)
 		return 0;
@@ -178,7 +206,7 @@ int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 
 int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = sbi_hart_memory_protection_best();
+	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
 
 	if (!hprot || !hprot->unmap_range)
 		return 0;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 3f1f136a..c3f09c52 100644
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
