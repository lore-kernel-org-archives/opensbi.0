Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6321606A31B
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WZI+BEAT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8OqfC/Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gz3VsJ4SdmDdaGhDXNWP/wE88/S1FYl6DXNM0P5Jtuk=; b=WZI+BEATALcxN0lNj0oJqAtbZ/
	yH1Cr9gbmt+P+lHxC75NoKWWc06NPoFnfieXgq//fuKncRUUzWvEDsE3Canr9RQ9hwtSh4ikyUHsQ
	ENKQ3wffaqTdwme06hkcavnr5D6pElYKmPfJ/7wwhksCKfMXFXkwIRlQ3Kn/qehfoqavaE0q5ft8e
	vz4jc6ak2ADqRxPxU+c/AHLef5fDzeaUZlu2qNFoEcPk3gob7gJ0HIMIkwnkbP4IWGUQZy7HmmDWu
	F9ezrWLfdZ6YxSt/f9mfOc5VKKce+bN3sKo3hF4l/aaN8UoiVVGlsrqVN/FROr9DzzfRjkfmmAspI
	0vQFd8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMhm-0000000GzGK-2gLt;
	Fri, 23 Oct 2026 21:21:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMhe-0000000GzDf-3Mx7
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 21:21:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIZJ0Y453651;
	Fri, 23 Oct 2026 21:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N35KfDRzewb
	a7JTFkDJnuSGD+XJ/ZFBZXqIltWYaoQc=; b=l8OqfC/ZmBahrezeKAuNvRw1B5g
	Fr1oHTnjKJgdVW/bTLdROHrZ/3dXAil/3zGpeYb3Q/bBua24DQVtooNCwkOH8w5t
	HE3xIItuzPX/wWY/+snMptBteu8oDyfMiiMR69vH82RD2G96Ou7TU18LagkcxJTo
	c+M3hHhSsTDkC8iao4p5YVGcu4is83S2sq80v6wRirubyzMAtMbm22DWRejD69qT
	c84lvs9tfr7AAH6+GTUUbG6JZbJYd/03l87JAAixIpq+P3XulpL7mUFSHoz+HVO+
	+EqIQX8B+FlXApoSB1maWRU20LEjA49v1nORQn7ks8wfOFj/v8Kz/243YXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr68j3f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 21:21:28 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLLSYI2515397;
	Fri, 23 Oct 2026 21:21:28 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 69NLLRKO2515388
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 21:21:28 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id C677E2187A; Fri, 23 Oct 2026 14:21:27 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v5 1/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Fri, 23 Oct 2026 14:21:24 -0700
Message-ID: <20261023212126.1914666-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023212126.1914666-1-pawandeep.oza@oss.qualcomm.com>
References: <20261023212126.1914666-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6adbcfd8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=2o_taVJjGYtXnc9YsGQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA4NCBTYWx0ZWRfX/mezw4f0bPuq
 bXkphbuZvgfwlCL80otLu31vX6nOCUktSZbG0j2EvoLQcyryYQeTvTJGP4J+5vqhU60LHGkavkA
 pm0XrVo8MI9Kkcj4MX59AgV/7oiBC1uN2ILBrJJSCFvUJYSrYuSre6g+oW6OVzRK59lUlDTVKl/
 9t9pqgEUrUht34HJq8biJmA/tiO1fPGfjX6C8xOD517TY1zdBm2I8p+RcoMTAJFKgp1hElBjZ3L
 DGCZEUythBNCO6Wt60VIVojr7l0hHYUKT8bpiejJrM85YOdbOgC+lfWwCGenVQl0T22913rwMCs
 OOP7Z+aS6XEMhCbDORZ6umju2ScA+Wz7+LClXiyO/Ot42NIg86GvbjKzcQlwBx6X26axeTHsnof
 Nb710CJntCOxKMgFjuG12ElTSqbqHgVlOV/TcR20eJmod0WjT6np3YkmXaK5OVRB66YQgk82Nmc
 S71cV5kA+qJQdzdjltQ==
X-Proofpoint-ORIG-GUID: f6vJ4FKmQ1JgIlbMjM9y7N56Qn-_0kwp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA4NCBTYWx0ZWRfX2RTsPLcZ3AHt
 pv9/TzpaIP/USPC0i7SQJsNmIRVxsBC8vjf9tB3QXczkkp87x1g7z87Oom2s5a0W8lWR50pIliR
 DIRB7Y5CCsypSGDgG7QZkVBYunQkfO0=
X-Proofpoint-GUID: f6vJ4FKmQ1JgIlbMjM9y7N56Qn-_0kwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_142130_859477_95649D04 
X-CRM114-Status: GOOD (  11.45  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
