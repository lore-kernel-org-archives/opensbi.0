Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD6AF4198B
	for <opensbi@archiver.kernel.org>; Wed, 15 Apr 2026 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=js3CbgLP9UCGrEMwerBvCRabNEgPn52qxpyEjACiR90=; b=gM+WvXDrKJgLtG
	uazgc8C5poWg4l+Z2bxQPFvMsiI0R63fHcxx8ABvqmgV1/51YBSI6gOtmiMdGNdG9S84J67HhbAGF
	vBq+9WHRjNAMy2o4jWqX/p6uWev3e5yBi2njosSy7V3MIrQlGkSMN2XVH+Fd/2H9PxnHTZohlm8MO
	VXboGy7AeXfe5xi6XyxuHucagWj+mYUHCg0U1bdt0OFb/Y04MX8cB9V+ztWsjp8X7Bed9Mif5d0i2
	yvKo/UYbWxeFVAKCd+q6epSXvygpkCx5he3YJisKoGJDwIG4lvCZ4esIxyPfsY0GQ7+9kAjybXF40
	cjz52XY6vEHR0MCYjadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxym-000000010VI-1JbF;
	Wed, 15 Apr 2026 11:00:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxyk-000000010UX-0vE2
	for opensbi@lists.infradead.org;
	Wed, 15 Apr 2026 11:00:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F97ZnJ1779139;
	Wed, 15 Apr 2026 11:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xg8NzOBvasZ
	C494zYbUH+KJybfawZ1ddwfn0grOhZoU=; b=B/KDPOBqACXCsksPKWT21K6yBvr
	LGolA+Vo9HHrCcXKeCpwK0XhshGrTYw/46A1gdTcyFCZy3gH4zHWFKH2cZrVCQZr
	C5AxpN2UlJStbG4d22aisialpY+lyEackwFVVBuix1VeCjHWqWJhq/gDawOhlJFL
	OjnToGxT6fRS85sAnHsP7FuSkYlf1usHM0yL+jMhyfgsN/I/X6E8RJTUWqUT8NTu
	5Pe+TGdoMS6rt9Vo+WM3KVVpnX1vn6ChFVu/CQvNGiil0/V3HODgV6Yr4K6mQM+O
	x7lFWhp+uR+cwoM1ABnIIwv88kvYbW74w8i6VVLR20Yo/mE7PJirIuMRKWA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw0395t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63FB03Br029584;
	Wed, 15 Apr 2026 11:00:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5d11e7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:03 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63FB03aQ029553;
	Wed, 15 Apr 2026 11:00:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63FB03F4029528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:03 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D5BD121ABB; Wed, 15 Apr 2026 16:30:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 2/3] lib: sbi_timer: Introduce per-HART timer state
Date: Wed, 15 Apr 2026 16:30:01 +0530
Message-ID: <20260415110002.2610929-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: Jrp8PkO-fZApovf7PHzp-B_7x1qR7Rdc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMSBTYWx0ZWRfX4Vl8RTODKcSl
 sNzwEer7syGsrAJIeIOEPCQItZ5sUDkHwEbTvYziNcOy/D5Dj8QJ0JRiypskNZUOSI20J99nSMq
 13otZvlPZbJRAVuBog2776gE3cyR7MwOM7XzMe0/euA8vwk+OCBKagIQ7iz+KcBQ/SJjYckJUqg
 XLEiD3Jh43rcham79FYV/M8GxgKipJF7qLk6I/wWsRfq/ZbFNRPq0z/JOOKOZ13A0eetRuy+5QL
 rZDuydezWzBFJqThTZh/gPfP/xUpZZ8xAKQRz9G8VBu7VSUo6V2LuTte1VE2SJ1xG56OtH0Y/vd
 WQPR+1kYyzfwxz989K+9vff1EP048BPoFxP6POcRe9nMelw/0s/AFaFBnC6WBDe1sBAsTnnwq6t
 Fi5q4dKhXjRPNRwZ4Qf4AhSWZ8jSii1M2lZ85tcyhGI63vZQr5ioONJr5SHB3sHJrt034snNYk4
 EO0JAR8DS3wEd22MqeA==
X-Proofpoint-ORIG-GUID: Jrp8PkO-fZApovf7PHzp-B_7x1qR7Rdc
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df6fb7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=QMJzDYCuMJTWl8ySVGcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_040018_267067_4830C271 
X-CRM114-Status: GOOD (  13.49  )
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
