Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D601C5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gz3VsJ4SdmDdaGhDXNWP/wE88/S1FYl6DXNM0P5Jtuk=; b=USSzNh1lPEJQLm
	5QRXVRfxHb3dOCt3tNaCp0mdf+o99lQtrC8xkvGNCoxfM+LYrbbTVVYJ/NBXpt6ZX72E9YX82gL2h
	nWi/WbV6d7QvylTOEXdE9UpzYpaucX5m9uZtr1Vhl1FdMnQoHUCrW2eVH2JXlT0gAnlIRSifv9TDh
	6Dzr/z5FA9Ds+MKZ/iGXeoCrUNmHkPBRtu+bUnRbXBTLEWBAPqrhpNFZTZqScuTfF0pKzygp3v6qi
	q0dAAITo0J6ZbUy0f5TWWnd2O2wrGCbG6xWOl23b94w9F20XgbILFB+Pv0zcKrrmSkchqg+jGYYbu
	o9yGhOXMM8HMeqXEEJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I6-00000006jbC-1XU1;
	Mon, 17 Aug 2026 19:46:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I3-00000006jZA-3Ep7
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 19:46:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIR9el2638284
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N35KfDRzewb
	a7JTFkDJnuSGD+XJ/ZFBZXqIltWYaoQc=; b=ownTSA4bIigTxlRHL4dQIiNbjGI
	DmmkULcuxIJnx2Qoy6TGo2t36Xk3ZnTTMUHp1s66opcFEZ9FkDhAkqnyR3DJ1mqn
	ScklGukj/aD4uQWqv5nJ0p/FC4nctrhmQC1D0fL6JPe6sQDeYqUSlgq05+gtK+i7
	9UB51l6wNNZ04IM8ZLs1x6d4ahrEesSlR0/7P5eYIBnsK8IEXdg4Z4hnTQHypYXB
	0XjZS/u02N93ZNxLqq/uOEFZ1luUpqi/2ndG4NrQk9KeuxH7vgUJf9ewioS3seqr
	Zo3zSUir1tGbcl8bPI6DZepr7l2ppcGjEbhMLsTZRTfGwvFKsgIoS126TQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7jn3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:34 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HJkY5T019944;
	Mon, 17 Aug 2026 19:46:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4g2h6j6j22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:34 +0000 (GMT)
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HJkXXB019936
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:33 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 67HJkXw3019930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 19:46:33 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id AA6C8234B5; Mon, 17 Aug 2026 12:46:33 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH 2/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Mon, 17 Aug 2026 12:46:30 -0700
Message-ID: <20260817194631.3723725-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817194631.3723725-1-pawandeep.oza@oss.qualcomm.com>
References: <20260817194631.3723725-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE1MSBTYWx0ZWRfX/zde5Vr8xrvT
 x35udkFuEK83ws3eOaA1DhwwUVCKvVI6APj3bkggj4/m8tBhDJ4/uoHwLTqONxdfKoHIpjDDBJj
 kTZehiCZ3IUD4UmWEsQDhdhuxYLOhGo=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a83651a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=2o_taVJjGYtXnc9YsGQA:9
X-Proofpoint-GUID: 55aVbulL3XYPM0_t2a5GWpqHVn9jZZy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE1MSBTYWx0ZWRfX5WJNzN2T3d29
 fPYuHdSbBcV8Sx23ZSll1uXdjzPX2CGTeZPL+7JCZEn6Vo1Ga6hGs283uYsR4s1kV8Tkj/4hX41
 WN75CRu2fYONyjIhfJBIefIxc94Pr3ukU9EIe/OfSrLiQVmWZ1Y0LbuT2Xj79LO0erbc007aMEI
 Vx4B8TGxYXjItJI2/EqfS3OKj21A5BI732xRqG4RzyHGuaEX7gE812ddVtLyo8veyg2Y5vNIbqu
 gv4h4BFDaSyvVvAtFKzNG9K4gOwXPkEpGtOnE2ZirKjmmXzcF2s0pwVGUteMW1U8XQlh8rTWDD3
 UWpjDP04kIiU3Hcfd/99CBeePqev7UAcOQDETEovkpohCmvm0htcIGrv2p8dYoRuTkCVLBjqQ+Y
 aoYQSaAJjG6I8LU9pofH0WQlAyzHzWUAAkVApat6A4Gfsy0EdnfelGbXmbRcUrQvq7JSHIzpkWl
 GksO3l2QRaitV+Rx6WA==
X-Proofpoint-ORIG-GUID: 55aVbulL3XYPM0_t2a5GWpqHVn9jZZy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_124635_820746_D6AA11FB 
X-CRM114-Status: GOOD (  13.68  )
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
