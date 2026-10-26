Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F6606A31D
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGGoWqtw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mz0uPQQJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gz3VsJ4SdmDdaGhDXNWP/wE88/S1FYl6DXNM0P5Jtuk=; b=XGGoWqtw5AUOe3VklBDRSyYEpH
	kaLT6nPKNsaKKChOVe/RYz+FQL0IEA9McAd2LfTVce8uc7RnIMrsQoHGBhE58X7OB84bSrT+opQrK
	6D4hO2auXPcyhrp7gEvSB4Yy1qYEF9JOFsn/20r0U+JUXj9WkQZWeAjA+YXmje2dx3IDBiV+HAV/s
	igN1XVqbn6CtPKd7lNug9HsmiWVP0QuzlwfU2/eI9RlHjyuJLTEZJ401Ar79BSPoHWk6t5//6Td/D
	qtE1+O28IUkm/5vXWI+ghUbU89Os+Bb9wyORgEUmZwfPkLYOL92ybt02wxXhfqZ90ALthGXPEbVai
	/ituPP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNLb-00000002r1w-1nLC;
	Mon, 26 Oct 2026 16:14:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNLY-00000002r0j-3MYn
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 16:14:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvg5A2544128;
	Mon, 26 Oct 2026 16:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N35KfDRzewb
	a7JTFkDJnuSGD+XJ/ZFBZXqIltWYaoQc=; b=mz0uPQQJHY+9x7dSs7hGEkNUCC0
	QDL0vVxAv3owfjpGVzpl+nfRKl4mDOcwW9dHuEYXdkPo/8xdYwHzbpV6bq78YKbz
	2Qnwlqa1gtEw690Na//VEgfKEWskMTqG2xxPUw4JxG0azOmEtBJNaxS3bIUABg+L
	nCnoTIEkW6DbuST9v5Wp9qbLmdLwx3plqqxScNLp3jWBoJD6xxrxVEAGPSCbfvAT
	Ayu8Po2Z0Q/aPO2FMnGkjvMoYWRHXaKXs/KWtSHFYNh5hOec5WI+Q6WLG6qTphCz
	ndLxwMOAdUH2//DrOkO0o3Y9IcJYwGFWXGA2RDhrA46BuVftymJu5/yLH6Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smrd48-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 16:14:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69QGEo4C3768495;
	Mon, 26 Oct 2026 16:14:50 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 69QGEnF73768480
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 16:14:49 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id CBAF5229B3; Mon, 26 Oct 2026 09:14:49 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v6 1/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Mon, 26 Oct 2026 09:14:46 -0700
Message-ID: <20261026161448.938375-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026161448.938375-1-pawandeep.oza@oss.qualcomm.com>
References: <20261026161448.938375-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: u9LfIoSUhR6CxHOGLCnPx6chvThiaLjg
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6adf7c7b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=2o_taVJjGYtXnc9YsGQA:9
X-Proofpoint-GUID: u9LfIoSUhR6CxHOGLCnPx6chvThiaLjg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfX3psJYK8C5Lor
 CXYlpGmiK5p/foTq3ulTITIOGk2VYDJtKQLzo9I9aCL2AO0iKYHYuViq/lz0GMu9aWwEdZBNfwf
 xf5tMvTE6K1zsWC+CeQACnyyFBaTWA0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfXxPRiKihRvkCB
 KW04sGh61S/v15MXS1CvpdzckLYFXVzhuTWfM/2TtPyuOex0oeEQkS8Oksh9PkmexLIzaAgmR7L
 TpCKLdB+3vCa3pRFmJFYoDLehBxaYk7Wy1vXBvGU6mrSeMVg0jUgL9ZbdSvV4kezFzd65Gljqys
 72QvpwBQ9YAi1rbdfc/OpOONzjRUL1GW3j9PuKKdZF1krqoEUeI35OEIe5pBJfMgUdeHTuNJLhP
 xb3g9BZz9OMmd2YYr13FJLfB0DuWkwKCKqX4pN1yfBBYHfs/6X65A9VCfKh/IdVvRuXVyGGANRA
 qrU3R6GLluG0hKJHKFtBvwT9/t/iFplD37T0aTSiq1dWeTVNfSycpEWHzXpk/g9y3apC/J1QxYT
 +YnlRsDUxgrudhS10AOzsS1rf2oOCEmoKcxYlVljbfX43DUkxkw6EnbVC2xwW3igr8BQbseIONq
 ZkzX47uO/Qs9gW+7IDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_091452_952938_2A0A6245 
X-CRM114-Status: GOOD (  11.82  )
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
