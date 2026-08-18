Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C76C5DF81
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 21:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gz3VsJ4SdmDdaGhDXNWP/wE88/S1FYl6DXNM0P5Jtuk=; b=al/Lu+FAzTHlEl
	huH6CfqSCVsRWJ/c5BDwZ0f0e7pjdz/l/plo64fajtu6DnpPw4a22nItfxdtDXOdtKOsqemJJqjgq
	g1B7W+Aej9BRTP4wazatDcC4S2y5htrYYTdZqWzmcU9k2l+RDXRRwAflBmEoIfqRLdQoiCCbDGcH8
	r/YrBJ215eBWm0+Wx5DElEcEzEs2GcIzjGZGdht1awwG1lQL6/jh6K8mBk0BGUAzkiuMifN/A34up
	8vEtgu3+VYARCsVkzRpJ8ck88KncIVWpar7DNT+cKoCJULvuNfZ/RNKurmbXSGbWAZkImkJ9oaK7e
	muJgGTLLG7OdD/QnPMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRQ9-00000008g4p-1Vcq;
	Tue, 18 Aug 2026 21:32:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRQ6-00000008g3K-3uJw
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 21:32:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IJZevD1031365;
	Tue, 18 Aug 2026 21:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N35KfDRzewb
	a7JTFkDJnuSGD+XJ/ZFBZXqIltWYaoQc=; b=hFeTQeabEDx1IfVV7H7598FLjrx
	aWslRLslpRni9TAWbITaLk996IMdgeVYvE0AozvnIOYhBi7Ctd/omulfaTQzEFD1
	JXtmgMMwg8vAX1WOUOgqcv4r64M4Pco2mJURhFkxNphcXeGSuJu1yeNIhNR9N3wh
	lZCmd+uDYGskNIETLVVgWZ+F6L4YrIA6ci+51cMNOQQS435+wXUzRdhqmAvx/VW5
	dirTVKWb+tCvSvkBf9zCRrR+Y0YvT6FSk0aRRARaCTzklF0HBgS8JZoit4gNOHHY
	QWL26G9PbIJMCrf70rVvw6iVmrpNf4w55Lj4lUDrpvN9ePB290HiJUvwphQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4resj550-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 21:32:28 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ILWRAK024462;
	Tue, 18 Aug 2026 21:32:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4g3qr2w5a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 21:32:27 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67ILWRYm024456;
	Tue, 18 Aug 2026 21:32:27 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 67ILWRwn024454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 21:32:27 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 6A4CE23F9F; Tue, 18 Aug 2026 14:32:27 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
        Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 2/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD service group definitions
Date: Tue, 18 Aug 2026 14:32:17 -0700
Message-ID: <20260818213218.875883-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818213218.875883-1-pawandeep.oza@oss.qualcomm.com>
References: <20260818213218.875883-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Ne/WEWD4 c=1 sm=1 tr=0 ts=6a84cf6d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=2o_taVJjGYtXnc9YsGQA:9
X-Proofpoint-GUID: R-augD7PpOLBfF1RkQCPdEnnkuJB8LWr
X-Proofpoint-ORIG-GUID: R-augD7PpOLBfF1RkQCPdEnnkuJB8LWr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE1OCBTYWx0ZWRfX3NaWZy/imFaW
 TZIHyoFBK2T2BK/xmUWaQszf1Vi8eYJqX7NWctqRqNIv7OvpTIaZgK6+u7MaRDSrXqSljoPuyyR
 1OuJC8u7jdguHeXwyHQbRzOMyo5cJG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE1OCBTYWx0ZWRfX0wOkOXsXoQa5
 GdT0sNAMuIrCwl/u4eeCDDQ+JZxqcHep5QraZOawLkYsKas8ClROUw/rDFVi9AddvDvbGfrWx8o
 JAtfFa559N++mHA8K+dskzHuBYHyKa++pdcUq1c1p3zmcyXhcH8uT7MQ/c5ZFG5WYdP0T39weh0
 yUnzpOQoAufadSECqHCF9bNqGWJGUUc8dZSIo74pDs0/6WvFGDRz2BgFe34sNj2pShx/TImvtqE
 wGUY+wrYI14Tr5zsRn+XuPZXE+RwhI1Zj33zeRUpHCdQ3xTJoZu441FNqC7omM8xxZVcfEqL37w
 zwTE/dMJXf0q+ZKzxmAD/SeWfcQeLiWtPHHZpMSYuOumIQRRxV/cBSwo7TS/ZD99BN8v7hLCA5i
 bAZnV++rCdM1sZa/hu/zg2w7uZYT9ZcHl4LXPvosuIj4OUV3VlIaNig2iSQ20YRTxNf5Rk/x+0A
 MF13rtHpu9n3HNLCTlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_143231_085430_D2DA4CDA 
X-CRM114-Status: GOOD (  12.17  )
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
