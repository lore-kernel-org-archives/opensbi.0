Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CAEC88E41
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gz3VsJ4SdmDdaGhDXNWP/wE88/S1FYl6DXNM0P5Jtuk=; b=LxeHzIwUxFMfV3
	yklRUC6VAqkpyX7lrUfl/JhE0pFnrpNZFGHFS+jCnShi0zCg5evQV1fuJV5X8M0ySrZARlJOquYvV
	t/lEjhOnrUY7BVF7w2GuT9UUxVXobnxkTnD9v6pU9HEu07K/lBfgUPG4/Gz2pMTjfxm8yhPpggkD2
	QHXVJw3DLQl8ipaK2Kd2SsoqLAd35eN+SF+FQip1ZQiloGgw4UaR8cH4KZHrFMYC+TaPAzDVCZ+L+
	IoU+h3Px147vFg4JmRfT+4rlTgRHv2VmQjrM/9mt086nXUb0enaXaFP0GlfOgLXM5ogoAO9NsCJBs
	o3HNk7EvL7mZSwjWtwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4m0V-0000000FOht-1BzO;
	Thu, 10 Sep 2026 21:08:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4m0R-0000000FOgU-2slP
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 21:08:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AIRcu4583554;
	Thu, 10 Sep 2026 21:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N35KfDRzewb
	a7JTFkDJnuSGD+XJ/ZFBZXqIltWYaoQc=; b=dL4JekAGtr+CGP0/exWS6nhXjIn
	BjkfnwZv6ufcZWZlqR4ZeelCQT5JddLrx95yha6HuwI4lNmqbAZ/nJnjXdW1qS8m
	SfdIub/G4wj7o0GLrhREeMJt7eGQ3oWW9OOt6UZjJw5XMuiAVzjd99SGyrpzGaIp
	vKMmA4x2EtAhG8fIFE6iTkD1AI++HFBe80ud7Jtw8YGp2EtmeT+RMyCAU1uyqCCg
	zpKPZzrxF4xk5XiIa2xbNWhoOQHhwmnP5RatT/aFD9NyLHdEWPPsg6Z9HOcH9hXU
	QQvCelZBjH1/bRYKSHsAiYS9RqXRnEwj1PxHLDTdxhbHo/fA7zNDuruNNfw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8u6yd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 21:08:25 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68AL8P0i2324820;
	Thu, 10 Sep 2026 21:08:25 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 68AL8O822324808
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 21:08:24 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id B94E424E11; Thu, 10 Sep 2026 14:08:24 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v4 2/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Thu, 10 Sep 2026 14:08:18 -0700
Message-ID: <20260910210819.525538-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com>
References: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: Qb3uAeSj466f2BVEw7Ebi1D2pyrq8Pr-
X-Proofpoint-ORIG-GUID: Qb3uAeSj466f2BVEw7Ebi1D2pyrq8Pr-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI2MiBTYWx0ZWRfX6ejzbF4+JEpO
 qb6kqJovFbGUnJvlOUL0e7gwQh2DV1eyQxEsfeUjyL1UbLWNj51KwPqzzWMVPJv9JeOuEjttY/f
 nkbMbWAbWIN2xfuSGDBHuEfkC97iUpZNYvZ4gXoLF2AQcyiIt8Kc7+9e/k+LbDRcy1/TwslYPBg
 DuI4SlIP3QalvXghpgB33sD03Apc8zZBPxMTr1Crjwfykguc0em8J4M4990SRqH2HStsP1oZFwH
 OfTkwHYlqz8Jz7Mn2sAZbXNS/cyOUJJBx3SuLAbPhWd1WXQm2x3u/Mx19+XGp/+Vsh0e8zcaDpv
 H17lBo/Zmi31Uj0TjBGAf2ANcYQLzwuGZDO+Y30THct5BqT1MFN0GC0BN29MCuGaTHIhuJ9J7bJ
 XZ+Fhirf9iofGJMexXjBMS4jI9UJTDpTXzst4zktH0GUosAR0D4oUUgrmEZ7WU6t2DGFHi4wpUO
 xaxfDy53MbuX4yqdsvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI2MiBTYWx0ZWRfXxicoWJpkpUYz
 RUERmnW0RSOekUz9MC83YvNYKyl7SxaJOnu0rtTVDvMZINVbBMdQfx4ylZeVmmwtdgqKGBh2ESO
 hAJx1jFB6iBluFbAEcCAhhH7ugeyz8U=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa31c49 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=2o_taVJjGYtXnc9YsGQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_06,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100262
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_140827_728019_8B456909 
X-CRM114-Status: GOOD (  11.97  )
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
