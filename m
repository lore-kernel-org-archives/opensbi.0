Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE66606A31C
	for <opensbi@archiver.kernel.org>; Tue, 17 Nov 2026 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xvGfSDYP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B8eSTEif
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BhLZ4cq5E0DK5MTlOKcIgaIKdfHSIu+mYCvHjvwWgIo=; b=xvGfSDYP8xgBey27ml7vz+TQLg
	KiKGmiPXXgQ8sVNiBapwrs8t8QzqfJH3+k4ETamV7alSrTtwqTIVdjhoP3aM/HEwiiGjBclQ1QjT/
	Tqg1ZB2s5/oRzB3IKctpUpJYkIPRwwNYXEyBDJ4Y5BYzbsnGGgDh5yMM+uYkv5cJqyvbeJWb/bO0F
	ooA081TFtqx80+PGyQya+nAqDBZMQi5mYGkKNN95i88VQRI/fdGJ5s9RE0werisYVf75Bl0yk0uVu
	LnjWR0Gm5Wk5iIOBA0ml+3jBcqAceMe0B2+e/gnH5DzkvAAv4ooZw101UVeyLhYYOEM3uM6VAt2d9
	bJwVQpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOEM-00000006nPE-3YVT;
	Tue, 17 Nov 2026 18:48:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOEK-00000006nOm-3hlv
	for opensbi@lists.infradead.org;
	Tue, 17 Nov 2026 18:48:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHGPtR31130122;
	Tue, 17 Nov 2026 18:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jyDmb/vNvj8
	Vkm7wlQEZORD1K8aC4YxQhf+1Lo4tqJM=; b=B8eSTEifRKAyssjrOCXx8Z9nror
	qzyZnRTuRl2cJ4WvqWR67C7vlXPUgrDVbsJWzpBv8cdZZiWqVrep1tB49D6wm/Er
	67zPHWzZCTn75s7uuv9h75a3+JckFGrq+iAfQsIGyHlmPnz1FnQmPBAETBZANhSk
	4LXsjnaL1gdcwsq8Y50+3FWTySN2Ox61WP8Ok0tIRrASXM3l1uK33zn1Q9s/2B8Z
	SXY76o/lmZMCTuCOoo0eO6ETirUQKbYiapujx7gknhFBOw7bbDeSnr5oq66VaYZ4
	Ffrz38Di65P+2T8csKFPbYVol+rRJ1XEtxOBqwFbUozRBkebua4fdLdxSyw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd33mw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 18:48:31 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHIjpHm1167607;
	Tue, 17 Nov 2026 18:45:51 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 6AHIjomI1167594
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 18:45:51 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id BC84520FB7; Tue, 17 Nov 2026 10:45:50 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v9 1/7] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Tue, 17 Nov 2026 10:45:40 -0800
Message-ID: <20261117184547.1145243-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com>
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afca17f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=40duqDnlf2BgY5wjSiEA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX3emEwD4m+L47
 29CrlPLfT3EM5jW6iqg2XvoReCujwm9oedhVCMMwbCfwwEuHz+xerMA5W6ZCv/S5t5NxGc4W1du
 oHwzbMj9Ldena9FmbrXLIt5eXGxezj4=
X-Proofpoint-GUID: TbNNNKBMhAfwR3qRCk1bjiSKT7oiBFuX
X-Proofpoint-ORIG-GUID: TbNNNKBMhAfwR3qRCk1bjiSKT7oiBFuX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfXx2J/SLNGpHFG
 vI/yZ/l+6H0+bHiUS0xCqfvSxOlWCheJMt5ECwaPAgRroi+RusarjJ0rRRetHpFiYwer+9GqbcX
 M/jq0u9ZmI/8FD8Y9EIRKevLluRrPTXyVu8eF9pu4ZlqugjbbFMwGVD2FXnN5L+4RpFdjNPV/RM
 aX6XKIlr9waUZkyt5mohdrRLs5Gdsp8NDspYXLKKcGF4T5u8A9qlL30VJaIwR4sDBz6BEReM4JI
 Rflv0f9Sc+1ZRYM3V2JhuoiEoFXGKkCiRYmJbmpAv2vSPjBmBVbSd0LBFeO+dDT81GStzNWsuV/
 tpmU3T0BOSVK7zHa80xJpxsZzjBkB+PFyia4VDnS4J/NWObpXcpZC4Wq03IsViCjGGlPvB7wQ6k
 WV7jNPVPWiErBFIgE/nPexVC6ysthHEjYB3SVSUTJaxuYAMB+JHdGoAraIObvgsbRKtMAUfl4ok
 HC2LBpl7tB2BLLKZP6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_104833_034885_1622A5FD 
X-CRM114-Status: GOOD (  11.67  )
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
