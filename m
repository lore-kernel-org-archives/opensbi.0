Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931A8C4452D
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 06:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkJsOXyZPI8+uE8kSEeDcXpk8PrR2ra1br0h4rVqIno=; b=S59z9xBUP+k3nA
	JQ3nyeSyT2+YNGdAcG0LeyoQfErIi4lEyU+mgZWwyMxTouLZzTPUbjYwlfWW/XPtZcy8O3JxSvyWB
	9V4IdvGPQC0byZZ6wIP2lw1YXSTFJn0ekRCtOn3qOUCHrBiF2kKPMSbYT57MVBPv6IgANfEuZskfD
	jWb+wFphUcKnb636D5fEY1KUl+sTKE89AHdkxLQ4vmsRFisdcg3Dr0apzdxQFSKImwbRhzlP/wAxd
	CCb+IXmG+6GgGAtpDBjHLdz+m6GGbeBFrtl+cb0L6/FDQW+TF/yr5cC3PjDe1WF/qjAPuWXieiJwT
	JQASJlk0/CU1uqomklHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3l1-00000008Uzd-1TBr;
	Tue, 21 Jul 2026 06:15:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3ky-00000008UyT-267v
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 06:15:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCxK33884869
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 06:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e6BcJnWYPwf
	xTJS6BN3z2VEocA5bLNUzGCQpD8mQVSY=; b=iQrOu6GgXqVz4wuCI9s8mHleG40
	3sv60uqiJYtKHx64Zab3G+nIkRRR5RQmx3bVVyLlb8t45jDooAdOL83oWV4+IIuq
	uRjg/CVoBvkXjqqM+HsxC0EtANJCo+WSaV2DJCI0sc5NS5K/2iI+RaaoyXWUqUha
	UYDYG0xI3VY9E3doD+gGCo502kqbhR8L/dT/8eORmIBk7s0mP8t4VVs25T7TjRtS
	zEA4gn0Ug3VEDUPSzSM4PDxYp6Sdf3tsqPIc4PBCo0m9WtXRcZIfgGUKfwo9Jp7l
	YPrKh2dFS7KoegBHxGxxmguATf+OwR3e7+A3uaw+JQUQr+wRj8aOLwL90yw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcapjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 06:15:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so4215224a12.3
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 23:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784614506; x=1785219306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e6BcJnWYPwfxTJS6BN3z2VEocA5bLNUzGCQpD8mQVSY=;
        b=GSJDvLtPTYc/0LPzq9j8zCBIKpG8Ta7GjsFlK5QrUBL0ZWAP0jnCpeGw8pLVyTFib2
         iOlMmnN9vD2lMXgofNs+/944XWu+OpaCeOoRBgSTCkOzljkpQ35X29RCY9MimGhW7rK5
         w8Qf+W6SGhh/2BLKC0/XyY4hBnMVQdXtIFC6LhXuDWALUGW7xRUj6sjk8yG9e60VnMZK
         TXHN+Gr3BJn4/j15xugNd7ugD5JDld7FvIrLuTeULGlFAnCZdBl+Q3t0BhpX8OkmiAAo
         E+OSP4kAsD+dWWsXfAXa1Hk6b23T3NiehjjcRWwBOEN9uiV/KhTD16GqXUSMMX6JDBz9
         mpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784614506; x=1785219306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e6BcJnWYPwfxTJS6BN3z2VEocA5bLNUzGCQpD8mQVSY=;
        b=P2VkvvWPwYUcFvrPN+1UWbXjmohaejclEZy+cX1cxovP8x9iMWSr4YykNKiXtuuFQe
         vQ+6spewaKVKEPHJKJLM224cAznkndluli7mB9Lo7XvzfB51PVNBAQ28siV09O/8OlM2
         rU0TFC2Bire0nAJp9x00N9CPvvi5YExTVBsW7rhNKs2xH3JKmtgq2yWoVnXmzJ2ORszw
         8F0En1yNUQdzYIAXnv1vsbfgWedCNSFqPZsdKzxUPNjN+sJRiLJhf4a9Uu3a1OaMuNrz
         WRMTgidJeEfMRhhBTyeEePyz0su0x448UBHfqZ+PAbdpBBF8N0epo6WoA5SvUq9/Oe8u
         TGKg==
X-Gm-Message-State: AOJu0Ywno8O8h/SxgD8uTUmbrdehZFtyflmeBwNuVPYoAM11UFPctrRm
	DhB8ZdpGLDPvCN2W+8692XPoRHo8JsPCNHeWSyVOFvCckJqH3SoG9PR37l81+KLqJoZI1X5wJeF
	sHyM6lFuCWtAOSQPd5LQsVTAcPhzwGYNwyLGD8GgWkT7+FEA5+DmjQBSQ3qnMwGleHTp5kL8jsA
	==
X-Gm-Gg: AfdE7ckl1roKhYIO0YqqeJXPd/zl21NUfjo7aH3cXSZRTzCdBZEO23762n73Sjg0sZs
	pIcXvKn0jkk+t7Uv6RoLlcmQGvuSI8Zlf7FhiFGvCWCvo65IJSoSJZRTRjhnPnYe6zXDw89HHQQ
	GW4Slu0uGAwZCnZVoxsu7FrIda+Hdr9OWNcjwPB5XJZ44udyZrd+CxkoKdhAl0t09gPuZo4dloT
	9OSJtpvYQwyWTp79dK/bFA+D3Xq7YtZyEqqSCDgq8wNoOQzu/F2Nzb33YsnbK1EHUKMfJy1UhVu
	7QZKdYXfnncx2MNc74AThu8qi4z2nlZqcUtYpfdi6IV8qLp8INGBvIYzuw+gifyUgtlnK3xz4/+
	EMqxTlqGBEsW/FxnIxvoQhUScjCYm6oMYdXDMTpxDoaoMbw3zJphmowYP3T0J2uz8ZznOFlDETq
	YAZviPkJzqcXiesHzhZkA=
X-Received: by 2002:a05:6a21:6b83:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3c3ad78707dmr18876188637.5.1784614506529;
        Mon, 20 Jul 2026 23:15:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b83:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3c3ad78707dmr18876153637.5.1784614506055;
        Mon, 20 Jul 2026 23:15:06 -0700 (PDT)
Received: from hu-ranbirs-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm46059054eec.30.2026.07.20.23.15.04
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:15:05 -0700 (PDT)
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 1/2] lib: utils/mpxy: mm: Add missing RPMI_MM_SRV_ENABLE_NOTIFICATION entry
Date: Tue, 21 Jul 2026 11:44:58 +0530
Message-ID: <20260721061459.1422227-2-ranbir.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721061459.1422227-1-ranbir.singh@oss.qualcomm.com>
References: <20260721061459.1422227-1-ranbir.singh@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfX7Sgr/1l05TdM
 BR5NDq2FYAY8g9J5UOcmWd+Fdea9RX7K0AMqkOYCGg+Xo4TXR+yVJtrWhDlqzH0d1mw2CnJBrEh
 lv6wetxgzwJUB1ZGKOQrGX51+XLAG0g=
X-Proofpoint-GUID: SxoTd-v2Hqij2GXhlizJHi1dyCY5_XGq
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f0e6b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=izapyt6F1Uoae7EJ5J8A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: SxoTd-v2Hqij2GXhlizJHi1dyCY5_XGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfXw81FFby7Ilsy
 svZMsDBi1bGRhEpTaROkcehVrRPUGMEkLzrE9wNGHfxUgxecTv88w4EtEy4L8EoFDopBIcpWucP
 6qFooAmY94i9Pppo+kihJTb+pqSIuOWw/onNWZ08qf7NcvkOwkMXh5bGSYC6xGqjascIwt+ZXg6
 aGTmD8WOIzSLJH5uE7Kv5QbOubD7IeEJ1F+E7N0icTMkvMo01DJyJEeYjNzg4jXOwbIQ05Fcm8U
 TcB3FIJWdNY0nQ40JhrcVjkJv2HFIkYGPEJIYlSdbvm0h2DyFg+X5lgb6aOnZfI+akeEu8WAyM+
 zpB1DQx+QVVenJqud8P4JUwI9ksSgxlWRs7Deu5h6Cs+QZ+HXlc7JCJgLKlH4nn6zVPX9ATm1e4
 M1FpaCXRFPEU/TNKzMS8kMIQJQEblyD0Wfcm7blVpFrqIAzVjqBN2OR7+LBg/1Yo06gmA+tA3qq
 LqsiVTkmGp3XmDSbsXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_231508_661685_A8C123C6 
X-CRM114-Status: GOOD (  13.38  )
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

As RPMI_MM_SRV_ENABLE_NOTIFICATION is a mandatory service for RPMI MM
service group, it must be added in its MPXY client driver here.

Fixes: 0b041e58c078 ("lib: utils: Add MPXY client driver for RPMI MM
service group")

Signed-off-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
index d7176aca..7185f3f3 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
@@ -15,13 +15,20 @@ static struct rpmi_mm_get_attributes_rsp rsp;
 
 static struct mpxy_rpmi_service_data mm_srvcdata[] = {
 	[0] = {
+		.id = RPMI_MM_SRV_ENABLE_NOTIFICATION,
+		.min_tx_len = sizeof(struct rpmi_enable_notification_req),
+		.max_tx_len = sizeof(struct rpmi_enable_notification_req),
+		.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
+		.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
+	},
+	[1] = {
 		.id = RPMI_MM_SRV_GET_ATTRIBUTES,
 		.min_tx_len = 0,
 		.max_tx_len = 0,
 		.min_rx_len = sizeof(struct rpmi_mm_get_attributes_rsp),
 		.max_rx_len = sizeof(struct rpmi_mm_get_attributes_rsp),
 	},
-	[1] = {
+	[2] = {
 		.id = RPMI_MM_SRV_COMMUNICATE,
 		.min_tx_len = sizeof(struct rpmi_mm_communicate_req),
 		.max_tx_len = sizeof(struct rpmi_mm_communicate_req),
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
