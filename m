Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7340606A322
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zuHr6YE1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dz23gB83
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BhLZ4cq5E0DK5MTlOKcIgaIKdfHSIu+mYCvHjvwWgIo=; b=zuHr6YE17eADDVhYEIw7DnlAp3
	YA2cSXIxLsDiY/Qmt3+zG3bjyODJv/8xPTu2G6fG7LwwNyW80DQ/BpLivH1ZJONEa/4RsjPa+svrh
	WfkxzjIsiaw3JwfQ+OG6Y8WCaO8fiQU3PXWuYti3Aztm4X5LMZ3arkd5ihW9nNFsduOCdZx6T6ynN
	Xa9UYRSHfdu3C9dHDufSYfHganJqdbicG/m+pWINAoxM/Gmfa+u4B9rMZktJ/+FoSutjPOq5kuwGw
	GnIOjBv3wq9a2JWoItYhaBa/hzfJhwq1iE5xv6P/Oa7dOOkwGdrxojeEoatILkrFgK8YPqcep4P+u
	pmjXhe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Xz-0000000411O-2vqg;
	Mon, 16 Nov 2026 21:47:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Xv-000000040xl-2icJ
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 21:47:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfgp42135312;
	Mon, 16 Nov 2026 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jyDmb/vNvj8
	Vkm7wlQEZORD1K8aC4YxQhf+1Lo4tqJM=; b=dz23gB838WNXZWxfpjvAWzEq+Ee
	OKmip1zxftGEYsie7VZN+AS6yRyUnc0k71zMc9yqw1DsyxPxltlw/b4ziNnMF1bL
	QP2NfbZTu0miS7xhYBPkQxass2cwlJ5Zw4+58NEuj3Ty1RvO+cvsCluWIyZ+qSr7
	ksF150I6o9bldltsgbt0mVgohv1mWbeFedFbN4juAJwznJnvCwz580/vlt6/W+qE
	lLT94hdLxbBY0eYemL6JoWxnb6dKzcJr5ALW/vUxeW0R5PD8Sx6rlohsYmgl2q/9
	e1pdgQ4O/9zjMA7iJ5FZ+Aa2gbYb22teREAVqgyp+C0ZeNkx0og1AUIT2DA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003jn2g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 21:47:25 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLlOdm3355228;
	Mon, 16 Nov 2026 21:47:24 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 6AGLlNqc3355220
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 21:47:24 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id DFA6F2187A; Mon, 16 Nov 2026 13:47:23 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v8 1/5] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Mon, 16 Nov 2026 13:47:07 -0800
Message-ID: <20261116214722.243038-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116214722.243038-1-pawandeep.oza@oss.qualcomm.com>
References: <20261116214722.243038-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: VUT2E2feMkRjdZ9Yo9duM0mKAz1iq-2r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfX5A5KqRxQjfmg
 ErfiVcZ7ZgGcaZA8OGug1Fg6zI7uwMxcAisIDzWwsV7pf9iZgDkmRSlmaLu1HE3E5npwwbteZsY
 OmI0/daIxO5RuSTT0GosoHqeyVzm45s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfX/V+MGlI4cZz0
 6rrM21orC+ozIjcQifJ3sVBC0gro5wxcYK7Ln63Ti4Ave270/SSpQ5QCiaDwjDu7oWcWRrFXngl
 s0XfBVzSgkSTylpCwZMHY2xbBZ1Q5d1WHw7w/qDYIQm99eWLFqm9f1W7AXlIML9G0IFBzA9GoUy
 ks+vBXPfekI18qRpyaHWRbmjmTOy7AVaB1+59bKD2/R6JGR7YrNGNO3Mlwwhbb0hQ6FS3+anhV9
 AYTq7oFm48MzoQZQVKE9jUasMF80pon7sliTWAwTBLKo5akvYI10yFQKFoYrIoaJyZeXiJzd379
 RSsnCq5TfdrWfdETxwo9apkwKPPeN0Z+Cxy2w/qU76cyZ8SKIxBB4mkHPO/ZP9IPV1Aux8iEQES
 r7bTXCig7nNxo0wLrUUVnACgD5hWtPuOw9NH11TMI7Y1audlWQiuL8mTnkXUk6Z3jYpsmanBv8L
 qHj8pCuZc8ANAlizrPQ==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afb79ed cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=40duqDnlf2BgY5wjSiEA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: VUT2E2feMkRjdZ9Yo9duM0mKAz1iq-2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_134727_801180_69F91563 
X-CRM114-Status: GOOD (  11.53  )
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
