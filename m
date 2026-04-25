Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBB2FF885D
	for <opensbi@archiver.kernel.org>; Sat, 25 Apr 2026 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkhEgsDBKD/LmwMlqeEosUv9te7ongkxUR6qjn0nZvs=; b=xRs8jnaFRZiG7j
	DbJEDo2IOJEutL4RAWFerWylBXDWoE81lpGSTxaNTR52aU/vuTkVDR+jNt12c4IJLJxy8kt0rq8do
	oNlEoloK8XPPqfoaqTLlEREAs65D0Ba9uZs4maQr6vCQeJ2AEqvoxe9jf1xbQ/VIybtyMxmW4qCHu
	9NfvtBWce6+g3AlxHPbhwvWbG2IPINKrgeAjBoKGsYGdae8nIfvsX+ERHS8wpNf7kXnE7zzfMzeO/
	hK8PlcunwF8Np2uama79QEQJWHKCbCKDh6hA7pmjYBEMb1SlrTzBAAsFgwYJ4ET6sPBfv4p19dot4
	lwsoLa4UXYer8P8Dlm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRY-0000000ELsc-2YxJ;
	Sat, 25 Apr 2026 10:41:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRV-0000000ELr9-3LYK
	for opensbi@lists.infradead.org;
	Sat, 25 Apr 2026 10:40:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3jk9B1016045;
	Sat, 25 Apr 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bdVNLAvS8kI
	ZG65WAf/ka3JRbXSVXlCPnkMd/09MrEw=; b=Z8Gbw/WKJmzwDUF5jdLT1Pr/bMb
	gW2Zt9Je3lu2eUvhoBiYDV+4svhmMDmpXqo+iKGuioo9m3achifrLCco76SXkelZ
	1pUEzxEnGAgZJ0QqVCkHN6gQ0SQNDgppjfbhBuNb9QGwg+CXpnmV+np1DAqBXKp4
	ji3lgt2lMLcv/0gqqEI68GLjeVb2CiRC0wv/dYJkzYdGgdtR7lFCfA7XkeXo6ROC
	gTkSTOK+iVwFrSZetgBjGf4QjTHxihavLNCFUVBdt5XjaNXJ7yM6iw1Y1MHqiRcd
	XDUIoEfLcCa3q3qrJAESZO+IoVI4NgAIxfVVEoVlx/RO9SJQzkIDBZjFvRQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07gpwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63PAeoCJ005578;
	Sat, 25 Apr 2026 10:40:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4drpph2c8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:50 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63PAen9F005547;
	Sat, 25 Apr 2026 10:40:49 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63PAenX8005539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:49 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1A25922156; Sat, 25 Apr 2026 16:10:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 2/4] lib: sbi_timer: Introduce per-HART timer state
Date: Sat, 25 Apr 2026 16:10:46 +0530
Message-ID: <20260425104048.2335262-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
References: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69ec9a35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=3A821fTzlExcq4CWNVkA:9
X-Proofpoint-ORIG-GUID: YFvDzMGOGqNZLfAYSAgyeaspWA-pGV-v
X-Proofpoint-GUID: YFvDzMGOGqNZLfAYSAgyeaspWA-pGV-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEwNiBTYWx0ZWRfX46QvK4UAisyC
 G/pdGsWSVPLx4wErrxJS5JKIji6wXQHuXByiBFTmZsSjfartG4RRTvQUFQoy6QsrSVG2a0r9jWr
 Ab2vV0hqC/9s+qepRc4/cEQ92b9Htqo3t0Pl9X7MBEy620tb6n36PSMsBrYuoJYB85td3rIfyr3
 LcFRImsmih0RvyCm2nXl/DwNS7yYKkXDf9Y7E5l9FwWcWtCgmddV0v9/GVBAWJyeyQHm/ex0MJj
 /2IE/DH1DOa6CKnZJh9ClzWfRwanwdZbRegs0mPGx4nT07whw6CacD4iu6sXi3LXQJIMW2kkoNJ
 /TlN0iQt/kOXYiZxnuiJyrDuillX2f5EM+G4qElZSmwXXO+0EFBU9R+RdGpTQQTJQsuabpiQTLP
 xBl0XZmZBjxQyFR5GL4xIDEDoHQc4aoiL8CVtkUYzahjRNhn5J+yd5DPI8vzmw8erVuWy98rCX5
 Zr6evAkxYZgy49XuQIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_034057_963210_793BB9C8 
X-CRM114-Status: GOOD (  13.01  )
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

Currently, only time_delta is per-HART so introduce per-HART timer
state for having more per-HART timer information.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_timer.c | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 4088a597..9806c033 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -18,7 +18,11 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
 
-static unsigned long time_delta_off;
+struct timer_state {
+	u64 time_delta;
+};
+
+static unsigned long timer_state_off;
 static u64 (*get_time_val)(void);
 static const struct sbi_timer_device *timer_dev = NULL;
 
@@ -98,35 +102,37 @@ u64 sbi_timer_value(void)
 
 u64 sbi_timer_virt_value(void)
 {
-	u64 *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
-						 time_delta_off);
+	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
 
-	return sbi_timer_value() + *time_delta;
+	return sbi_timer_value() + tstate->time_delta;
 }
 
 u64 sbi_timer_get_delta(void)
 {
-	u64 *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
-						 time_delta_off);
+	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
 
-	return *time_delta;
+	return tstate->time_delta;
 }
 
 void sbi_timer_set_delta(ulong delta)
 {
-	ulong *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
-						   time_delta_off);
+	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
 
-	*time_delta = delta;
+#if __riscv_xlen == 32
+	tstate->time_delta &= ~0xffffffffUL;
+	tstate->time_delta |= (u32)delta;
+#else
+	tstate->time_delta = delta;
+#endif
 }
 
 #if __riscv_xlen == 32
 void sbi_timer_set_delta_upper(ulong delta_upper)
 {
-	ulong *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
-						   time_delta_off);
+	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
 
-	*(time_delta + 1) = delta_upper;
+	tstate->time_delta &= 0xffffffffUL;
+	tstate->time_delta |= (u64)delta << 32;
 }
 #endif
 
@@ -176,13 +182,13 @@ void sbi_timer_set_device(const struct sbi_timer_device *dev)
 
 int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 {
-	u64 *time_delta;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	struct timer_state *tstate;
 	int ret;
 
 	if (cold_boot) {
-		time_delta_off = sbi_scratch_alloc_offset(sizeof(*time_delta));
-		if (!time_delta_off)
+		timer_state_off = sbi_scratch_alloc_offset(sizeof(*tstate));
+		if (!timer_state_off)
 			return SBI_ENOMEM;
 
 		if (sbi_hart_has_csr(scratch, SBI_HART_CSR_TIME))
@@ -192,12 +198,12 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 		if (ret)
 			return ret;
 	} else {
-		if (!time_delta_off)
+		if (!timer_state_off)
 			return SBI_ENOMEM;
 	}
 
-	time_delta = sbi_scratch_offset_ptr(scratch, time_delta_off);
-	*time_delta = 0;
+	tstate = sbi_scratch_offset_ptr(scratch, timer_state_off);
+	tstate->time_delta = 0;
 
 	if (timer_dev && timer_dev->warm_init) {
 		ret = timer_dev->warm_init();
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
