Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683F606A32F
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 21:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JE4sjTO9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQMb1yfA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BhLZ4cq5E0DK5MTlOKcIgaIKdfHSIu+mYCvHjvwWgIo=; b=JE4sjTO923zkZhR/uC9WovAHMq
	RgQ57wF1oJhhq0PjJ30/ZonHqmTd/u9UYSQc2cfHFoYw45FQx1HTN0gq4aVHwq3k5lM8dp55dSBJd
	whzflrbNzEY25ORgZ0lz4DRmUUUp1RzVjl7h438WORyGNUJ2ZkXJEbGAKTTA/EE/sH5SfH908ZQQL
	iSDLPzOXqB985C3rB0Kdyl5tTz3RyvRJCmApwSbIOvi8TRhBS8QFIvX20kJuwf05P6gl1J6u0lmSM
	MHZB7N4EDOga6olEl8cqI6ExD5w/6DT/JlS2xySPd+M0OBuPwRzA3ZVsSbXdJ6OeXQpRPpXJMjAzJ
	yvm1uV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndJ-0000000AMrI-0whZ;
	Wed, 18 Nov 2026 21:56:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndD-0000000AMn3-07Sk
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 21:55:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDdxI1417438;
	Wed, 18 Nov 2026 21:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jyDmb/vNvj8
	Vkm7wlQEZORD1K8aC4YxQhf+1Lo4tqJM=; b=kQMb1yfAF7zNClQMqzvzE6SfPbm
	ILBFcGoiUTKVggwf/5qzQUktYtjadCpM8B/Z/zdj7Hk9CDOTZ/DczbxyfoYMPbN8
	ZgoQgmWDLFkKFEwwYFz6jFhpAE2sUxb7NaAegnHEDJ1d1VP12Q3MpbuYP2QX+t6F
	vAHtfW87UiLQqcuJg7ppNSkGWOoQQ9SZuglOki/EOnM6LObc6uARYVG/nbaJnRT2
	IJkTBDpafP8XYY5aRa5cUOqX+S+1m5piNSLE2spoHHT2yLRgJDuxgCmtN0AEB0Hw
	6yHFjTs7PtZHR+mqpTGJj+pDXdjti5OxnAXyZgmqQbk4fcRef4BGkYWCFbg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p1525-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:55:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILtoKU1429985;
	Wed, 18 Nov 2026 21:55:50 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AILtn6J1429977
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:55:49 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id A1A9A20FB7; Wed, 18 Nov 2026 13:55:49 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v10 1/7] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Wed, 18 Nov 2026 13:55:42 -0800
Message-ID: <20261118215549.2499040-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
References: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: gVPmg7BJpa6_4532yOQUUS9L5r5v7nuv
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afe1ee7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=40duqDnlf2BgY5wjSiEA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4MCBTYWx0ZWRfX8Cx+D36ls312
 P+r10zwKnzHlXeBaT+ebn1snEfxc2301TIi0olBQAulyQCe/XPX98o8+dVJ7+kEVhfSwMI8vjk9
 ud+PydCc0iGslfWnayi1j+rrdJgle6jpYQHqBkze+RHmpa+XF1cxtho3matj51+ONIpMz1IiVsU
 mbVUqOFJjuz7E5Q8uvGknfIAGTrekBSWB8P+oC/eUj1CXer7jZjotEd3KxueZBJ/pHvsUsxON7o
 5Ufyl82ElR31I9cFJLJVPmsubwXBJJJyd8GDpIIEDhMbzNCLaDviTYnolSdP9uU0/XeuxuJXwij
 tgRHQq9oMup0bD79P0pvjk2yUOOsLrWQ4Y55GKxaNoEUGDcMx/PcUpQv0F4L//V1rbwcymCTIuT
 eD6f96HXFRbYTUHtNYWQQluN9AS5iZuRY4416XzXTqvhtJjIq2a1xNUtRYl4wkvdRDzeWTRBMF1
 9lzgjPSDxj8AWzL847w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4MCBTYWx0ZWRfX33LuKZ+MEAFp
 GhYcpLfiE721O0N/sBP1LNuY2ClE/AMG92pWJL2AThTReXF3R+bnVNklfINnl/j6LsupI8vklIU
 4wKQwz2SmR6DiNGK4znCRTgLeiStZEk=
X-Proofpoint-GUID: gVPmg7BJpa6_4532yOQUUS9L5r5v7nuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_135555_188914_5B3A1184 
X-CRM114-Status: GOOD (  11.37  )
X-Spam-Score: -2.7 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index b473e5f6..9aac94e4 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -225,6 +225,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_DEVICE_POWER = 0x0009,
 	RPMI_SRVGRP_PERFORMANCE = 0x0000A,
 	RPMI_SRVGRP_MANAGEMENT_MODE = 0x000B,
+	RPMI_SRVGRP_REQFWD = 0x000D,
 	RPMI_SRVGRP_LOGGING = 0x000E,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
@@ -1064,4 +1065,24 @@ struct rpmi_logging_log_data_resp {
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
