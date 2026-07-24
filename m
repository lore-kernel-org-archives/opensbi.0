Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB88C531FA
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFu+UP6Ou7oxYeJaDB433VnFWniwAn+EQNEWsa8EvE8=; b=CS2G6MoIY83tuS
	uW1KfuNKV2P0b4eczj0B68WW3Q9+NMPowo1eonJAp8fGuoyBLX0GXH7F61RVDZKV9Yz6Twu2nhxgI
	uXnnnTwmEBHgDi3mkmc/Bfk5Y7QtTgiG+aRuzyJfH3r2h+dABXUbNHZxEYGwAO///Wb4kNcUXe2q2
	qML4a9InD6KSDFXyf013s9iWUiwDcoGGp+U/JLwDhTw+/+q/9ZRFj5M4Bn9cXbeyS1Bt0wHpQAcgQ
	/JOYF8GK6hArRChx9O0fiFUFlanuFrOdJxuu1ZvXTsz/2iHTATU7T0DTL8xdR8b+1KTpNpfJUJzDj
	KUDpq3jOx1sjg7xT+CdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAyL-0000000Fll3-2pNf;
	Fri, 24 Jul 2026 08:09:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAyJ-0000000FliQ-1H5O
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 08:09:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4llxA1510888
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 08:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nQRe4A13sg6
	w7oMfP9l7bKke+uKIB+RcP8BpA4dLCtg=; b=YoGaYQiATRvmxa0H7HCpJNJy4Ly
	646VgMf37aZjJsUlxxTYy/veBbU35qzpbvB2nW52jK6JhJdcS/bDr0zNyVE5nUXO
	brlDF34UYb2bEX2VjW7T8zQqtS2fTcT8cFDkc2/+KorYTPI10ibH6mguzrZCSevg
	qsGKH6cT8pXWjc4GlIUBDtlVMxJJY8QJWpGoXTLuch7UPydbf7I6NiIGcKCxNyBx
	5q/IR2ovS3I6A8oZJEWNv4njeicGIF/csGZB4S6zx+ZJ9xKte4tL0GXTNOR/kZJN
	WUsHh7GOTSecpqURG9r0GEgUOl4NHLKTrCwjZthvqsV3L9qpkviBV4Lo/SQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrsp4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 08:09:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7049fa552so145777a12.2
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 01:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880570; x=1785485370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQRe4A13sg6w7oMfP9l7bKke+uKIB+RcP8BpA4dLCtg=;
        b=IC/P8JbWIfRrsEdekwxcVGTY9jOgzRDB6AkN6MV02mxDuC13wlf4bGqK0pIw5EYV56
         xkSS/jLs+u3chJKdqEnKXJ5XUg11aFp6xrphWs95O/Tp+tW6tV81hAiF/zeJgPx6OkPY
         DxNouX2w1xxMKHrIZOBX6jZYJFrm2a7WY49or5iWPfWG85qHc9qghLSrfou3/Fc9QFYA
         hEdnG1QKFpFTIUp48Ekyha1M0XBm9d9jOk9c2A2K4Sg8N1Rq9va9wLwdOrdXnaHxvTx0
         wBEw6X06mz8w+l+0th50fnlF6gYIwvQvY+XZFuv1xlirtlErHTeRPKZqB6e7Y8Ambnxq
         vNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880570; x=1785485370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQRe4A13sg6w7oMfP9l7bKke+uKIB+RcP8BpA4dLCtg=;
        b=k0zzZM6K3c7GddxijsMsTY3Eziq/fm6eEcH5coy0WPcguQXhUysGekIGnX+D0AFPdK
         NcppypIeV01RSjYOfU2owqLr3A0tfXWUsvgWaT0gJx/FC1csc1/Sr6aEvBtDVYWfY5Ry
         TGvOeVs5EGckXjx3vYbrHiJOhMIQuZSwiRpbHhORhJl0g3ngIUdc75KjRoitwd6hGkp0
         HgazKurTPOpvwXtLZGh4GEcc3Lss0nfoMTb8AioNQ1LRE495pu7I1sES8XwDc7bv7zJL
         z0tR8s9vPcLFFqnfkO6W0Gjkfpb6vEu1z99vZcqVKFWHNmm0rM2qg0ZfIkfWw8MTAXYr
         RwlA==
X-Gm-Message-State: AOJu0Yzh5xE2T2MkYcTwP23DXoF0qsMDYtPZ7If+Zw8MPs+Nu3oBUX6L
	dO5/uxpPyyKGA6HkHW+zMbFy4J23Zr6udcY/eFnJ8DNLQomp2WtX7F4s93t9XOQVVB23U7WB7Xm
	lQAz9PDeNbcbTHE/LhgkH4v4pYTzM/xxwovVJF12idy7aMGGHUaMowRn187mDXm4m9YxlDBc9sg
	==
X-Gm-Gg: AR+sD10kiExd8/e6gsyqO6OdKBiq0eMkGJIeFSCMl49HQ1DoiybiTPj9sQuMO8E9n+c
	HKS/30IKu268TtAWl1mTTe9KCmVga1gXK9gDPeRTlzCQA6gtaEFwhJT+CdJ5KTFkHk2f1Xyj482
	WbsBE1MKGKWq/MyNCmne3RcxcSs6bUPX+dDLz3Up9dDam1t+g1vH7tQ6l7CGHwLAYT/a9eRRdAz
	Nur0Jt9xN84YBPLcaYGDzf6ke0Pv6W2+mSgk4UPyethWOUL+Y7TJlC9+VIHBZWYGBWCYpRaURu5
	4K5L2K+u2NAfjFfTga0HecVEYrutS2cmCBZfyrWMEZjEETyLMDL72Q0pL08n2BKHNvDvRsX/HoW
	LoVBdvMzKbGuEDVtrja0F0ze8IDiaFkqutY3weFL6BiMXgOUDE4o8YKYIRtrL8/KDTFiUdhGHCB
	jUJq7nIV3CzfSZFQrG9wY=
X-Received: by 2002:a05:6a21:7111:b0:3c3:87df:fc7 with SMTP id adf61e73a8af0-3c44b28f8f2mr7207927637.64.1784880570115;
        Fri, 24 Jul 2026 01:09:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:7111:b0:3c3:87df:fc7 with SMTP id adf61e73a8af0-3c44b28f8f2mr7207897637.64.1784880569679;
        Fri, 24 Jul 2026 01:09:29 -0700 (PDT)
Received: from hu-ranbirs-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm45810741eec.1.2026.07.24.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:09:29 -0700 (PDT)
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v2 2/2] lib: utils/mpxy: logging: Use correct enum for enable notification
Date: Fri, 24 Jul 2026 13:39:20 +0530
Message-ID: <20260724080920.1629065-3-ranbir.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724080920.1629065-1-ranbir.singh@oss.qualcomm.com>
References: <20260724080920.1629065-1-ranbir.singh@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfX67z5EC0s6CE5
 DJsfvQ0WHLVIKhgD6KsWEuxFR1IiFRC4kRB7qguxwFIQpDIlD0jESudabbMMXCjzagb+ovT8Kh4
 5GSYy6jQhrfHuDUuOp1gbnbpXB97VoU=
X-Proofpoint-ORIG-GUID: Qe1BBTOEKKYOEZe2KjXmcDA0vFI210km
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfX1wClfX3Ttpex
 z58LG2fkReVfK1JbRWRt4d3yRWvl5JBRg/eGXubww3y5XP/kDNW3YPKlhY7wnhMCu5urpjnfxba
 vCl+zc1k+CrFzYF7vvyllybYKXWk7Ta12WjOOjwSVqhlde/cybjd+LxIvwwiWf91/u9ALj7u2ST
 itxAKkTgAZjn+qCZRLIW7tWF4XUMS7Y2Nt3NC7N4+N5QLmysfARJHH/iczLB3HjDhJ9ckXx1ice
 TglEtwbqJac3AEK/RrSoZ22WncLQER6dOz1uVoVUhQarW5csTalkWpvNWOJv4F8I7fUelFsS3Ky
 6mgYIBvVjacabYqJjbwr4OxY0BOge5WhUqsRehFIpCwpNhBHWf+euG5fOsEtCaEIsVS3xU/F5J8
 tbZGxYz72jXswU3DGymS2XJOWt7mGQnqVvRuUOWdsTda3dyi5u3Gs3GAVK0HZw8VeefWqy6axn2
 bwISdyKXBKC5iXMnWFA==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a631dba cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TUwXktB768aEqdBAUQwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Qe1BBTOEKKYOEZe2KjXmcDA0vFI210km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_010931_352855_7B6CB79D 
X-CRM114-Status: GOOD (  13.59  )
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

Logging file should be using its own enum and not others.

Fixes: 262571217c75 ("lib: utils/mpxy: Add RPMI MPXY driver for logging
service group")

Signed-off-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
index e8f085eb..1e92053d 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
@@ -11,7 +11,7 @@
 
 static struct mpxy_rpmi_service_data logging_services[] = {
 	[0] = {
-		.id = RPMI_MM_SRV_ENABLE_NOTIFICATION,
+		.id = RPMI_LOGGING_SRV_ENABLE_NOTIFICATION,
 		.min_tx_len = sizeof(struct rpmi_enable_notification_req),
 		.max_tx_len = sizeof(struct rpmi_enable_notification_req),
 		.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
