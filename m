Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D53FF885C
	for <opensbi@archiver.kernel.org>; Sat, 25 Apr 2026 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9nG6iHyWBUPo6cnsvaAV4lBq2wdOORIkgaQ4haDzJE=; b=AGmwzKuj7p6p0q
	UNFp4Qyhtk2yBkmURKPeUqeH+oGnL+T4gHGyYXz4urUsom0iDUvukrF9M5+MfzggeBf+Hh2JHyKTq
	3bcveKkOPk53PxF79uz8tBuAESBw8h0XsCqvgIzfKr9h5vMPFci3WLTl/1VJnZ0XUCK+c5XMDDoUq
	SsX2mh0JciitwBqDexgCaV3oQ2CmEsMXE3qxhTAzBBVuBMRx8aqbNNPaV+Om4/V7twIfVYPeyphKs
	1eMykmLH3cXVxVRGGu7lMylT7cG+r0JdD1a7sX/GymR1qT6+Vwwr+O05REW9TcgWtfc5fjmQF2iMP
	LI6Qe4S5uAot3EGyxFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRY-0000000ELsX-1QUP;
	Sat, 25 Apr 2026 10:41:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRV-0000000ELrA-3JVC
	for opensbi@lists.infradead.org;
	Sat, 25 Apr 2026 10:40:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3mWB81021184;
	Sat, 25 Apr 2026 10:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a2Qs0rOo8VY
	0J10VKitDrHju/jl1TasJMsYFSsrrtw4=; b=EouvBMjdT2Aq4gmqbT/uh+Ui3f4
	4guKWSsWyLVxzIVNC4MnLAfqU0DT9v5sK845EYiOIVjDrtB09u6vEhMLTfrK2xID
	j0Ut9XLPSKCvlRmyv2t9ACCLKTklAJdbOo8s4P+42stsDPcv1gccKRiSxgEVaawq
	HHlpVP4s83DvVnv49/TrmlHqmpvQdOn8TTkX5M3pxp+vjB0cqahMj7dwKoIG6Acc
	Orms02iVSsnUXbbC3rXteaovFHuSz5p4vSeLKVX0RAIkM/6O3kYVumfv+SL8CisX
	loIYQ2afMshoKyUdJgaujIDvAbHUaBBXKqT6rGzwd6QTO8v9b+jPxXX/ysQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07gpwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63PAeo1u005575;
	Sat, 25 Apr 2026 10:40:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4drpph2c88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:49 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63PAensE005546;
	Sat, 25 Apr 2026 10:40:49 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63PAenTP005541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:49 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 206B822A38; Sat, 25 Apr 2026 16:10:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 4/4] lib: sbi_timer: Introduce sbi_timer_compute_delta() and friends
Date: Sat, 25 Apr 2026 16:10:48 +0530
Message-ID: <20260425104048.2335262-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
References: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69ec9a35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=sbnM9rFSS_IGgtnRH10A:9
X-Proofpoint-ORIG-GUID: Bzsasqa3IiWFiEsmWj92yWWSv91R0ku6
X-Proofpoint-GUID: Bzsasqa3IiWFiEsmWj92yWWSv91R0ku6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEwNiBTYWx0ZWRfX4yTk3n1wWsqE
 TaIUCKPQFXaxnwaaRruwLyF1quV7VtkNunS0dKGCpJHAXJE4oPibRIXdzbwQr0kKoXeAmc3jqgQ
 ie7tlMMI2fGixBZMfuMHkuAZyHVsDBgxtcy19hOogjU30F/C1o7RTVbmqqoVLrNWWJufih/3fIy
 QCtmbGnl0GnAMYieq3x+FQe7JsP2EzTKiy8GEQ00TLa2dyhlDOORdVzdF0zd0nMIK3nxZANaTHV
 V12NZ41cfZUzB7xIGJx+u81AYxBVHaEUto/sjiyZb1Sam7ai0gXVWD5946pHIQWNBWjINgXcqa9
 s5jU+qx6H+HXDuehLu96YjdndabQRMF1vY1yDgp/xXMfFSsBU5bua9fC66HdYsvAeblhw0/glCo
 BgO+5fAW1C8qL+OIlaHZRpEtcrM/1uP4p1VwpdvsrO4DwV1ajPEI586m7R5a9mogOH5lmaCuVLS
 Ibb6fJhl9DravPnpEUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_034057_961130_009DBAA9 
X-CRM114-Status: GOOD (  12.67  )
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

The users of timer event have to compute next_event (aka timer value
in the future) based on desired units and unit frequency. Introduce
sbi_timer_compute_delta() and friends to simplify computing next_event
for timer event users.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_timer.h | 27 +++++++++++++++++++++++++++
 lib/sbi/sbi_timer.c     | 14 ++++++++++----
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
index 914a5f12..2a040927 100644
--- a/include/sbi/sbi_timer.h
+++ b/include/sbi/sbi_timer.h
@@ -88,6 +88,21 @@ struct sbi_timer_device {
 
 struct sbi_scratch;
 
+/** Compute timer value delta based on arbitary units */
+u64 sbi_timer_compute_delta(ulong units, u64 unit_freq);
+
+/** Compute timer value delta from milliseconds */
+static inline u64 sbi_timer_compute_mdelta(ulong msecs)
+{
+	return sbi_timer_compute_delta(msecs, 1000);
+}
+
+/** Compute timer value delta from microseconds */
+static inline u64 sbi_timer_compute_udelta(ulong usecs)
+{
+	return sbi_timer_compute_delta(usecs, 1000000);
+}
+
 /** Generic delay loop of desired granularity */
 void sbi_timer_delay_loop(ulong units, u64 unit_freq,
 			  void (*delay_fn)(void *), void *opaque);
@@ -125,6 +140,18 @@ bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
 /** Get timer value for current HART */
 u64 sbi_timer_value(void);
 
+/** Compute timer value after specified milliseconds */
+static inline u64 sbi_timer_value_after_msecs(ulong msecs)
+{
+	return sbi_timer_value() + sbi_timer_compute_mdelta(msecs);
+}
+
+/** Compute timer value after specified microseconds */
+static inline u64 sbi_timer_value_after_usecs(ulong usecs)
+{
+	return sbi_timer_value() + sbi_timer_compute_udelta(usecs);
+}
+
 /** Get virtualized timer value for current HART */
 u64 sbi_timer_virt_value(void);
 
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 4b16dbb2..ec25e5ce 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -58,6 +58,15 @@ static void nop_delay_fn(void *opaque)
 	cpu_relax();
 }
 
+u64 sbi_timer_compute_delta(ulong units, u64 unit_freq)
+{
+	u64 delta;
+
+	delta = ((u64)timer_dev->timer_freq * (u64)units);
+	delta = delta / unit_freq;
+	return delta;
+}
+
 void sbi_timer_delay_loop(ulong units, u64 unit_freq,
 			  void (*delay_fn)(void *), void *opaque)
 {
@@ -72,15 +81,12 @@ void sbi_timer_delay_loop(ulong units, u64 unit_freq,
 	/* Save starting timer value */
 	start_val = get_time_val();
 
-	/* Compute desired timer value delta */
-	delta = ((u64)timer_dev->timer_freq * (u64)units);
-	delta = delta / unit_freq;
-
 	/* Use NOP delay function if delay function not available */
 	if (!delay_fn)
 		delay_fn = nop_delay_fn;
 
 	/* Busy loop until desired timer value delta reached */
+	delta = sbi_timer_compute_delta(units, unit_freq);
 	while ((get_time_val() - start_val) < delta)
 		delay_fn(opaque);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
