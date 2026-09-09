Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9379C79FBD
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gz3VsJ4SdmDdaGhDXNWP/wE88/S1FYl6DXNM0P5Jtuk=; b=jAmONehoQSIf1I
	qVQx+aEBWCI7xnkaH4I80C7CsE/8Ca1k1jJUXn6coFQZJOzz/4ymmfq4RAIg1FD8NllUyHkUHFIbu
	t2Puiew+pfj7P76bDp/0waDKWkk8E8TBCpCeq5gH2d/9bwxhmjnS16jN51xNDZ8TCQN71LXMHkCEr
	pzkqOD6pdkTdmFCwYPaZeNLgQgBvicU056d18+oWJ3/0RfXOuveGODZ6ACvbtN0qQPkJaPV+0Co2V
	WVQ49prCFBd2uZhfz4y5MFta9niVlQPPivNU3uoxuBlaGETNh7cp35QTTYfFfIBMaXG2b83QuehLo
	f8DVOWD9tlIRRXEbT21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PSs-0000000CrBK-0PC9;
	Wed, 09 Sep 2026 21:04:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PSm-0000000Cr98-2OCX
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 21:04:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JIaA42773648;
	Wed, 9 Sep 2026 21:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N35KfDRzewb
	a7JTFkDJnuSGD+XJ/ZFBZXqIltWYaoQc=; b=UZZpo9gdjRD7I7EYS1B4jIArJ+P
	z83/93aJH1l4//pAhxDZiZ7rftPLpvPgxHHho/PNpi/z6/TbnPdOqs6Nac+jrkds
	pXrVVICu0MVQMpJitWuKGvHMWryd/9AXObcPHTOElFolnEzl6OoDAN3pXRmCbISZ
	imzm/abuhle1hq33TwdBAYhxRlxcrFnnvluOZKGhHTJ+NwWY6xIYwroYJ0hG094G
	d/KHKSD7FhWP8IS76vFBDIbG8TUNzUrX+bIS+uHkua45WPLIar6rK6iLvrEKipkw
	hu3hsTMX3gDAqZO4zLmTRlaej/yyYkWiIKutCAtxzEaI0XgBYj1qxP7Jbgg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfrnxh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:04:10 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 689L4AGJ4121275;
	Wed, 9 Sep 2026 21:04:10 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 689L49ZO4121260
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:04:09 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id AB84024D9C; Wed,  9 Sep 2026 14:04:09 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v3 2/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Wed,  9 Sep 2026 14:04:06 -0700
Message-ID: <20260909210407.3524619-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909210407.3524619-1-pawandeep.oza@oss.qualcomm.com>
References: <20260909210407.3524619-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: eX7AyU8b6kqGY2qQCIVB4Ckc9ef6hVI8
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa1c9ca cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=2o_taVJjGYtXnc9YsGQA:9
X-Proofpoint-ORIG-GUID: eX7AyU8b6kqGY2qQCIVB4Ckc9ef6hVI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfX4Q7ltj7t08b9
 kBhEvQNKvyAGAPKL39D8GL0iSDBjsaAfLfotm2AwBxz3Y+XMUL5/EUyy/gq9j3Kc6tmItK2qEZz
 YXa3xyons1CJn0Btj1ilWE7cwJS6DcN2bjvB5XlYNTObB/ACBP4Bjq3E5vaj1elc+NNXSdFvt2h
 wqLYwWrLrdhYoWIMpOiQxogFj/9qFKTm1QuGoqt3CTz9GfCzeNYd2MGxS3CEdiyZjAAzXFb0DOr
 BSKQtGTRu20ZpS3RmnlEaNgoQPpSLUM2bFQ71A6XKonUnZslyuzfhb5Sgg/G9kmcjOxD7sp219G
 Xnp13iLkm+RAwPhxBIMykOof5TvEZZMKRZHEb6Pchxx3LvH7Hq0RsdZlZQZsYegdCcph+n4C0U8
 H+hgUODn+/8lyhtGUqJYDV6Wd2/qYRj7LUVmkv+PAogbieyOLGk+ltuRnwXURwzlxsScoW6kUzm
 XrWy+Wh9G1s/1kBl0Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfX2Zto6ZgwSBVE
 cV98L2xXByOtjqAFELx1JJzQFu5ZOuInfbtEWf+FNRiT4Jg28Lp939oSa+P16BZG2OsnjU9P9P6
 I4eezQoezdH7N3+4UiYODSwLTeM9YRc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_140412_753199_961515FA 
X-CRM114-Status: GOOD (  12.15  )
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

From: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>

Add message protocol definitions for the RPMI REQUEST_FORWARD service
group (SERVICEGROUP_ID: 0x000D).

The following are introduced:

  - enum rpmi_request_forward_service_id: service IDs for the
    REQUEST_FORWARD service group:
      - REQFWD_ENABLE_NOTIFICATION  (0x01)
      - REQFWD_RETRIEVE_CURRENT_MESSAGE (0x02)
      - REQFWD_COMPLETE_CURRENT_MESSAGE (0x03)

  - struct rpmi_request_forward_resp: response structure for
    REQFWD_RETRIEVE_CURRENT_MESSAGE (SERVICE_ID 0x02) carrying
    status, remaining bytes, returned bytes and a flexible array
    member for the inline message data.

  - struct rpmi_request_complete_resp: response structure for
    REQFWD_COMPLETE_CURRENT_MESSAGE (SERVICE_ID 0x03) carrying
    status and the number of pending forwarded messages.

These definitions are used by the MPXY bridge driver to implement
the RPMI REQUEST_FORWARD protocol for inter-domain message passing
over the SBI MPXY extension.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 7ae4abe0..c5d564ac 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -1064,4 +1064,24 @@ struct rpmi_logging_log_data_resp {
 	s32 status;
 };
 
+/** RPMI REQUEST_FORWARD ServiceGroup Service IDs */
+enum rpmi_request_forward_service_id {
+	REQFWD_ENABLE_NOTIFICATION = 0x01,
+	REQFWD_RETRIEVE_CURRENT_MESSAGE = 0x02,
+	REQFWD_COMPLETE_CURRENT_MESSAGE,
+};
+
+struct rpmi_request_forward_resp {
+	u32 status;
+	u32 remaining;
+	u32 returned;
+	u8 data[];
+};
+
+/** RPMI MM ServiceGroup Communicate response struct */
+struct rpmi_request_complete_resp {
+	u32 status;
+	u32 num_of_messages;
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
