Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA9606A326
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 00:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rprztzwl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kak6fAb8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BhLZ4cq5E0DK5MTlOKcIgaIKdfHSIu+mYCvHjvwWgIo=; b=RprztzwllAWsOXSUUvkl35QIwr
	RqKkoHqfzXk4kxcQv6f+ynyUO2g2uwipfeIHrhz2nVpKU0b+keDHNX4REEoPEtGMjL24zmexbcNLp
	N3tK6aR3BEJpn1Cq50bYVjGAr+XZ9m0WHFUwZUbJzmnonbeylQ3JLjgn2Lg5IytIDE8IU6ebwiq4o
	0NZtaoaDHfhGz51RYnEOfEUHZnqc64dqNRj2cQ/9KPUw9sKpJlfwPObmgdE+bXMwq6U6tzAn8ymu7
	oTYrqyWTXoIIryZVwp/zSG8I26V3ljKhGBBj3Y8A0jqcnl8QyS6bGvXLZvRrfGFa0/fnKxih5w8Jt
	ow0+JbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZOG-00000001zay-3mun;
	Tue, 10 Nov 2026 00:07:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZOD-00000001zZ9-1hbL
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 00:07:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA3Vc870180;
	Tue, 10 Nov 2026 00:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jyDmb/vNvj8
	Vkm7wlQEZORD1K8aC4YxQhf+1Lo4tqJM=; b=Kak6fAb83WpkCPZfHSmMy33C28H
	Dn3BXpqBTq5ZV9UInr63pzTNNmbKJovmV8FNJAiVVAQyB7VoG0lNH5w/l9I99zLN
	W2pX5gyR8sH5N5I7oabrFjQGwyRjsv4ciQX0CKivO4+muNLcSG5SSIG4W+W6of8L
	kb2LPwudRUGiVyV2rrirIh+g+Zwfjutj4w0yGj3+o7j/w+zd/OyN04SOAgwr/+sD
	5Xq7AiKrS4USrIELV/OYiK+rElclKClFBand8gZXTY9jaBo0aldUCMMDTbPqsUmT
	vGlyObHegmRI207PAqTwThNh7toXQw3TmOJm8iFhXIYe5q8p+UwuxUDE1Bw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58ba42-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 00:07:02 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA072pN2721699;
	Tue, 10 Nov 2026 00:07:02 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AA071MY2721653
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 00:07:02 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id D46E920AE8; Mon,  9 Nov 2026 16:07:01 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v7 1/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Mon,  9 Nov 2026 16:06:50 -0800
Message-ID: <20261110000652.1298076-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110000652.1298076-1-pawandeep.oza@oss.qualcomm.com>
References: <20261110000652.1298076-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMCBTYWx0ZWRfX/wCgRtGoZEiP
 rn7Na9eUfXzpg/sPDUPJj8ed9gFwE8WJnJDClVXPOQ9Xlj1Il7D5x2cEFxef5NcQZ6Fzh/j63Ym
 q9RQJOgkEgSMgou5hrstLahgeE7wlBHLLQzxHrv1ttxbWHmp4vTsuwQf795n3EUnvNnGfTZ/aHt
 3br1lP1NPJs1nmFqEeGrGZKtwTklbUibYaQOS149fGCNuCLDwjhzIGFzlt6xCEroJRZ9lcaZ0XZ
 MQnT6YRPAaBkwRr8NZ1U0PIizLf5FYIGA1VeNCbUdu9vmtsiHBWPIhQ4xW8vHSLeZ2LR6/QDGjC
 abWwUFGNin2cJqmvVm2MGfdi1bJjdDpNWXnsxuMIEVIHZJcxLMjyIxFxTXWYHQNvCHwi8GWTnMn
 0gPTmJ3xIVZMc6bKAw7+vNodFAMI5TPKycgMMex6rzXm9EXwF8Cs7Yl5PUQV5RzjAHR8/1scFgV
 0Ju29ZcHGZxwiyXPD/A==
X-Proofpoint-ORIG-GUID: 5KgGlJuLP07Sb3FiklZk2Av3xSqTcU3g
X-Proofpoint-GUID: 5KgGlJuLP07Sb3FiklZk2Av3xSqTcU3g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMCBTYWx0ZWRfX8Q08jlU8Zxt1
 nXNfPKpzd/9oMMn3s6Q5K8sJbxo7Gwqty0sv3sXNqM6k7HqTOCT407ARQPlTa0dAXlFx1R6/7aI
 MVeh20HzY4I4vbgwbNr8t1p4j/dn09c=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af26027 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=40duqDnlf2BgY5wjSiEA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160705_484529_5422C160 
X-CRM114-Status: GOOD (  11.92  )
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
