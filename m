Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3826ACD8CAA
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4U9Fzaa38oT9oO8QPUajNtDYXRVXObswGNH0Bn9aHFo=; b=g47oaWYr2xWV2/
	z9P/rerFV9moogielCp+Im6y38Ou7sxQwOH2NT8rHuuRC1y5j1ocRFeaRDoiT03P0I89bGOeevw8d
	w9SUtlLHvieMhQ3a1zsazPn63020lcNoVFyQYREg/0uXTq+OWu0ySbe7trpoSNduPatJuS5nX9dI5
	mwgFsy9D4mQuYntIxfdVcTixMUofbjP+N31ELSRLoGmNuFJDM0LthH8fq4GQ3cVOZfIz/kZuJh7W8
	GxABUvdTtJgos6Dl2SOra/HPnj4iL/kq7hKacHYHRg8jMYAOHR3M+taBjc5X0ptVU7uy2Fjr/bsU3
	G+kSmCyl7t5ye1aHT34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZTv-00000003Xw2-1WD8;
	Mon, 08 Jun 2026 12:53:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZTs-00000003Xtp-0m7j
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 12:53:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9Rw22965398;
	Mon, 8 Jun 2026 12:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=smGgfU2MyHh
	qzjRjgXAB9xJx3DKfL91EsYZD60dWkyA=; b=H9Jo2WsnDofORrCTfIx6w4icI81
	HfhZBbwYAdFYhiLPSdwjUdiiQn5lDezIVo5Z7eHnAWIXd2/WSJuRTjpQZCMFerLF
	DQBFxPYxW5bvWuBNZsE0bOfr9rb/4YCkxD+cTmBtzKL/+UCmp/zHJzy7t9uqYOM6
	Is/uy/4Rijqz260F+ddx9kQSV3lXLldkKTjElHtEsWAmSnMBrR7m+IW6dNxAZGV2
	iGMorJkpL6TTXxafclDGN7uVodoijTrLIk55Z9bkKmh6dH2vAJ8wPPX9FL9MzgTB
	CLhKWdn2iS29NXlswG9cHdkRv01fbbfMlyteg25l0RTJOW5iJ8j6owz7EfA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkryb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 658CrIv4018167;
	Mon, 8 Jun 2026 12:53:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmj8fsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 658CrI9E018143;
	Mon, 8 Jun 2026 12:53:18 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 658CrIhN018139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:18 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1A25422594; Mon,  8 Jun 2026 18:23:17 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH v2 3/4] include: mailbox: Update RPMI notification structs and add performance events
Date: Mon,  8 Jun 2026 18:22:55 +0530
Message-ID: <20260608125257.3220114-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
References: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: aM4KwOHQWosuHbxp-aFrAjh9Jh22YJ42
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26bb42 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=mlbbMAg2AAAA:8 a=W-_n0kkjAAAA:8
 a=hTTKMuhdH-oCViq9umIA:9 a=MVgJjSScqoDYXLft4fpg:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: aM4KwOHQWosuHbxp-aFrAjh9Jh22YJ42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMiBTYWx0ZWRfX0QIXFIzRxnuN
 +HT8KGfykIFCvPkGQ86QQV9JknjCkXNPAxH4NPIQiVBm+5hTuZfvf800UBjEjxrmdD0FXbiQ94r
 fjEQBdImK/sStRUokdavISaO2whIhxZ2hUSZesmJw+1vtjLOTaT40SKFJ/cwYnn6DK8ZPq2+Fa7
 A0VzTb4a48OmiTFt0LOxb7pgQNnAWMaxUKsUAsZPXzh9M0QFliAGzV0VdxUm9LfNaIYwyuYl9pF
 /rzzrzKFSeaFzbMSNjbh+RqqRo2gODdfXLoKzEjzwV/w+RB7k0nnfd60wHDBubgHMPNlzGCuO2R
 zkOHlIvyqZZUdxlQOfapI2WVuvdUxZFiydC6doQmmTUQaltv2jpHdcUe9mtFDfTaXfVAr83HAFC
 9L9WP9+SEtMdmYvh5lJcldo/CiSIgzwhXfnVeejIs03v10O5ImIdyAK62CZ9yWj2EI+gnIk7YrT
 PvrbktKIDiPeG6kP9/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_055328_412415_C31B1718 
X-CRM114-Status: GOOD (  11.57  )
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

From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>

Add rpmi_event_notification_state enum with disable, enable, and return
current state IDs. Also, add req_state field to rpmi_enable_notification_req
and current_state field to rpmi_enable_notification_resp for RPMI specification
compliance.

Add notification event ID enum and data structures for RPMI Performance
service group events: power change, limit change, and level change.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 46834877..525b3750 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -87,6 +87,10 @@
 #define RPMI_DEF_TX_TIMEOUT			20
 #define RPMI_DEF_RX_TIMEOUT			20
 
+/** RPMI Notification event header constructor */
+#define RPMI_NOTIF_EVENT_HDR(eid, dlen)		((u32)(eid) << 16) | \
+						 ((u32)(dlen) & 0xFFFF)
+
 /**
  * Common macro to generate composite version from major
  * and minor version numbers.
@@ -232,14 +236,24 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_VENDOR_END = 0xFFFF,
 };
 
+/** RPMI event notification state IDs */
+enum rpmi_event_notification_state {
+	RPMI_EVENT_NOTIF_DISABLE_STATE = 0,
+	RPMI_EVENT_NOTIF_ENABLE_STATE = 1,
+	RPMI_EVENT_NOTIF_RET_CURR_STATE = 2,
+	RPMI_EVENT_NOTIF_MAX_COUNT = 3,
+};
+
 /** RPMI enable notification request */
 struct rpmi_enable_notification_req {
 	u32 eventid;
+	u32 req_state;
 };
 
 /** RPMI enable notification response */
 struct rpmi_enable_notification_resp {
 	s32 status;
+	u32 current_state;
 };
 
 /** RPMI Base ServiceGroup Service IDs */
@@ -846,6 +860,33 @@ enum rpmi_performance_service_id {
 	RPMI_PERF_SRV_MAX_COUNT,
 };
 
+/** RPMI Performance ServiceGroup Notification Event IDs */
+enum rpmi_performance_event_id {
+	RPMI_PERF_EVENT_POWER_CHANGE = 0x01,
+	RPMI_PERF_EVENT_LIMIT_CHANGE = 0x02,
+	RPMI_PERF_EVENT_LEVEL_CHANGE = 0x03,
+	RPMI_PERF_EVENT_MAX_COUNT,
+};
+
+/** RPMI Performance power change notification data */
+struct rpmi_perf_event_power_change {
+	u32 domain_id;
+	u32 power_uw;
+};
+
+/** RPMI Performance limit change notification data */
+struct rpmi_perf_event_limit_change {
+	u32 domain_id;
+	u32 max_level;
+	u32 min_level;
+};
+
+/** RPMI Performance level change notification data */
+struct rpmi_perf_event_level_change {
+	u32 domain_id;
+	u32 level;
+};
+
 struct rpmi_perf_get_num_domain_resp {
 	s32 status;
 	u32 num_domains;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
