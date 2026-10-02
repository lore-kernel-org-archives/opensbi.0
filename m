Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A11CA5FE0
	for <opensbi@archiver.kernel.org>; Fri,  2 Oct 2026 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlE9CDJYXxi7Wgst3rjAQJati8lhMaF81X7QPsW3TEI=; b=VMjciE1VXAbadu
	vvgetO42F7ddXdixl9Rgg73rBrQxd3bQiqJARYSJ5ixHoAMoiWPLk79Bt1mq3jMA7KJa3o3THSOkV
	xQGh1QhFcfbZI3ZIpWVdXt/U+Ydm1FKddgVjAfWKqKDaIGDTtXz3S24+vV1TphvIl1ABFDajv0Ted
	lh8yBtAyu2Yp5w7QP2mBx02Zplu7sXVTrXM4mx+VjJDw9iX5R8uPhsnWwOfAKw3xznuviDOUVhJti
	QhUUHbfQFCjqWqcZvfZSyRy+bJjVyTt38C8UOmAic0lQ7Jc3HP7EsBy2RaC4a3el1udIdrgxLhjLx
	LVHYkQ6K3OuMd34pW75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfT-0000000AzK1-198b;
	Fri, 02 Oct 2026 08:30:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfO-0000000AzJL-2lsl
	for opensbi@lists.infradead.org;
	Fri, 02 Oct 2026 08:30:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jekp036688
	for <opensbi@lists.infradead.org>; Fri, 2 Oct 2026 08:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7HER4fgwIf9
	7M7c4AQe9rK+yzDYuCw6AddOuxb4aYZU=; b=HqM8fjp8cJF8UPeqn3uNqmWFoJo
	SZXnH6gXC36q4s4uwHf1SoWpvCyq1/8tQEGdOZ50OsGRVft4kGdTqU5nnxR1hAVk
	Yt4facTI/Og/s8S7Zv3Koz7g/eo1sokyWwn8SRAfx5TcEt5pQPAHZiciwx8InAy5
	HMsc/tFWSd/HnyzLJ7IGlHDE/n59TqD6oLualdsR245c5Dhx7MA08PlErBGKV8mC
	4uzu+D334uMIA7/tJd8dAPJaXQIidssqdH6TKMkIgQeUPa5Cv8jsMRtS12jvEmpT
	DSJri0q7jSCZ+WmucqiF+8J7p+MhkIaRJF4QKoEZAYNfzhDJZvWE4AQVvBA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgb7ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 08:30:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34e676375d9so1261648eec.0
        for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790929853; x=1791534653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HER4fgwIf97M7c4AQe9rK+yzDYuCw6AddOuxb4aYZU=;
        b=YqXPD1LXxdYbrDI1dM3KBFOZhyx80ROhXLCM/pcO4AHe8aoNtcGgGMpVX2UuTmjPgF
         owDBE0rR53xK9r9zltrO8cH9Z1i2ylNqOmq99Ih7MFxCrAX3fmdZPR2CjIz1BP7Ju/sC
         YIVzTow3ZSnlYRER9K23tI6IDo8TguMJ0NpIAxWEGLF2QNBdhTtCFFNeXf3jeFXUsIiR
         wiL68TCn6OYwvB8gMiM1fbi4Caj5BMyebs98EtWymRIOtJ15M3ivsmbG/47v2UlHcdW4
         sSG2LYonuWpbKjml4zZof6SQ5dJjC0yhkPlnIvbzd5uB1MIMoiWbxzFMFp1Pj5JK3Ukz
         DezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929853; x=1791534653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HER4fgwIf97M7c4AQe9rK+yzDYuCw6AddOuxb4aYZU=;
        b=b1uAoxzzCiDUApU3dfIPkkW0aRpEIgL7DDtHycdVf8hyTwTKOi6u4jnfU3tdz7qOE9
         c4f8LsIiMRzdF/9OiI88feKVv4F3PuvKvQybz/kL2fNwW+VTbPHs/ZicceGnwc6pFZ5y
         i6MxpH9q3YKoliCdD033cjBGnVt5N5j6oOszaDw/rcY8WgmmLqNhjYUNkRf26ts2GBTY
         so+VdzXa7bKd0B5Oru6AuGJ+cPIjbhCVD3OB4KemXvJZII/1giPGASkU2ScE1z5VIMrW
         JGupmirH8vF/KTSLYXas9HY+gF+8mIua3GLdFPKsGu+MrjLEsGLm4jLbXdWUzLhqkvZn
         j+Xw==
X-Gm-Message-State: AFq9FYJ9aA1/ZiSipzICurEdaUDSGfJIgfNLSO3rXa5ZuqpTrXnoLOgx
	WZIL2XgBtX+heB/QTN0UBteCgba1sznNfwSHR0eH4bS7FAsuwVGySV6YVivDys/9n8w+2Ljr+T/
	Rcg2L/rniTM7qKfgFK9kcq6fRiA6v1J9fGgbTcsWatbwAAGzax67MOzOLTrDPTAd3Tw==
X-Gm-Gg: AYBFou3JM9MijbzmnP7gHteQ0Zd52w8yMOPCBuAd225RV3q9Q3W1LP3aOTEKF8DlqN4
	p5rrduRejfF+E4XyhiJYuFDhOFk8U/6H1BgJnKMowql0nNc7RepAG4feQPoDtvdKcl439RKJGSX
	UuSYVTToPXcltJW7w753EVSmsy/QrSGcAM8LDmEuGQZJmKLF4dVfv81zUNpBvJH7WVE1hIIlpkq
	5yENKBe3z2HHVn6Ht3NfL1tb84R2/tAg5PCh9DfV3fxveMXPQjusvjKYR/5ZgEdwLdMSq0q5M0X
	kDwfftlBpv57ZBvo5QAT7vlBb3olOHm/aE7lOI8Rs2SSTqSzM6bW2fOXWzOnS9HFtOPUkDo8Jbr
	GvHoy+LItk6XVuvpmm8rCY1lR3DNllANPXAWdbxxqpFJn4zDjr9J772PIn1+3b1X3J/lFWvDLvT
	zE5mY2EQ/hA0o7
X-Received: by 2002:a05:693c:4090:b0:344:1b88:6d88 with SMTP id 5a478bee46e88-34db6511339mr6559223eec.10.1790929853215;
        Fri, 02 Oct 2026 01:30:53 -0700 (PDT)
X-Received: by 2002:a05:693c:4090:b0:344:1b88:6d88 with SMTP id 5a478bee46e88-34db6511339mr6559204eec.10.1790929852668;
        Fri, 02 Oct 2026 01:30:52 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm5208850eec.1.2026.10.02.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:30:52 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH 1/4] lib: sbi: Add timer tick to time conversion helper
Date: Fri,  2 Oct 2026 14:00:37 +0530
Message-ID: <20261002083040.2533097-2-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
References: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfXwlFMUgLSn2PA
 iNYGLsH2cZIC1l4CtE5LXy3U4/H6QJV4yS8348XMz5Nov/JiqROBrmkLNA+GFAMydqBRd25aeEE
 tbzPB8x0xqj8Ol7zEQW2BLLa2UrMTqM=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abf6bbd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ndiehmx6BMdluV5mVIwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfX5ZbZsuu6/VT1
 3DQVB0bJUamiMOQHrwCymzmGz8Shp5vz0k9/MCKhVXGYTVTs394Pz7uco2mjdx3p47E5dJWtAlC
 DiGLJ+Y7xZVDG17B5QabwHu5mk9vBCSt0vnjG+976nz5WAZQfKxkmiJWfqlpCASlEjeYLXu57GQ
 DazvMfiqNyhLRKegpTqEmsDleQMq/AdfSjJ/PrkVPDhwbEkq+fHe29Mw0Mpojhy0N92TyaSjB+d
 5i5FJ+hmYHnzO1Ui3F0AYpY8VMEvYo8bJsn1S91kQ3qDdup4aiMFJVZZuQEr1ZVc4nFR5wKPFKZ
 5/ANJsmhW4PJAO19HzqQjPVG4dVx0BYVtLi4/muzaiQp+p8PsPUF03s9yFgYSqBNFJ6MZq7K3LP
 YrI2yCyMu4BlWgtgj2KHuNY80VqWcEI2UE313GRw5ZcXzTT+FmIlFmDJ1o7AG5NUaWZ2Jn6veNp
 m7L4kkXqDXnSWQGD0Pg==
X-Proofpoint-ORIG-GUID: n0175DTqx_l0T0O0w9N1EMsrhBk_TD8D
X-Proofpoint-GUID: n0175DTqx_l0T0O0w9N1EMsrhBk_TD8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_013054_710481_C3EC07EB 
X-CRM114-Status: GOOD (  13.16  )
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

Add helper function to convert timer tick delta to a specified time
unit using the corresponding unit frequency.
Add a wrapper to convert the timer ticks to microsecond.

The generic helper allows the SBI watchdog and other timer users to
share the same conversion logic and can be extended to support
additional time units.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 include/sbi/sbi_timer.h | 12 ++++++++++++
 lib/sbi/sbi_timer.c     |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
index 17d6c1dc..3e1243b2 100644
--- a/include/sbi/sbi_timer.h
+++ b/include/sbi/sbi_timer.h
@@ -12,6 +12,9 @@
 
 #include <sbi/sbi_list.h>
 
+/** Macro for seconds to microseconds conversion */
+#define SEC_TO_MICROSEC		1000000ULL
+
 /** Timer event re-start details */
 struct sbi_timer_event_restart {
 	/** Flag indicating whether event re-start is required */
@@ -88,6 +91,15 @@ struct sbi_timer_device {
 
 struct sbi_scratch;
 
+/** Compute timer value in given unit sec from timer tick delta */
+u64 sbi_timer_convert_ticks(ulong from_ticks, u64 unit_freq);
+
+/** Compute microseconds from timer tick delta */
+static inline u64 sbi_timer_ticks_to_usec(ulong ticks)
+{
+	return sbi_timer_convert_ticks(ticks, SEC_TO_MICROSEC);
+}
+
 /** Compute timer value delta based on arbitary units */
 u64 sbi_timer_compute_delta(ulong units, u64 unit_freq);
 
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 78aaa32e..aeb860eb 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -58,6 +58,11 @@ static void nop_delay_fn(void *opaque)
 	cpu_relax();
 }
 
+u64 sbi_timer_convert_ticks(ulong from_ticks, u64 unit_freq)
+{
+	return (from_ticks * unit_freq) / ((u64)timer_dev->timer_freq);
+}
+
 u64 sbi_timer_compute_delta(ulong units, u64 unit_freq)
 {
 	u64 delta;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
