Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B483C531F9
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gKD3dG1z6j9yVzAEOI/RVGBoQ7tebeRjD1x6ZqNex8=; b=kI91HOQiWu8Hr3
	rpYUUNVLFpkC3JXSRYVYwukwOErDcKZIer609jsD+GVEKNFdbzZ7wH8HIqKVV27cTArCM8n0bfk5l
	NVGT8igpdVIIISShs2CdK8LWXYl1tbsRn/qwxSGgfuKshrI9Lo++8DERi3oGqdwBTqRSsKXjhUTVg
	3mUvd+R4Tk924V5PvhhPxh8r6rp64IWAy8IjpbZkhiSls7sqGNKZFb3l8U06zs8byLf2ecSLdtOmh
	aSMvar7v2W+SOPB2gFeiEuFobHlHaB51K4Qi68IhFzWLpj8CmvyyJ3Hj3AqTQcauttwA0YxnM2Ivo
	O+q7tLGv6jtqSPwdL5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAyJ-0000000Flj2-239N;
	Fri, 24 Jul 2026 08:09:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAyG-0000000FlgX-3xrn
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 08:09:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xPA41892358
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 08:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lZgTPrgwwRE
	OdOjFQkm+ypoyHvsVIQhBjgeRImeGfEo=; b=X3Knpx1yWg5uszgNaxS2E4ovvle
	JWETvE0QPhtOm4UOOA9PI6bP67ZG0W6x4iVBw3zZx+GC0DDKw1CVji46rAWAryYK
	Gvxx9HuXHydDHXEtiTw26wqhP/nfV7XRkjFySarSOiW/pdgcPgghvQVMHB50li9N
	Qc7bKuLNyx/gw6+nT/gTs414lKp6JsWo8C/U6v1acKOjZQbwrGzIgzOJdcHO9EnI
	EPXh8cgQEjmi/6/YEqzgwviPftXoDklE0bX5NBTEQQjttOOuhv4KLkcbnwJKmk2F
	H4exvO52K5avQ+5hbz7KCH1t9euU9vWuQrgPoo+2lqsGRyRIgVjmWidxWdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx8fr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 08:09:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e0234967aso135953b3a.3
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 01:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880568; x=1785485368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZgTPrgwwREOdOjFQkm+ypoyHvsVIQhBjgeRImeGfEo=;
        b=TOb07yny7R7P8CaEDmd+MMoQCtfrYPZSPwLYf8M5y6grvN2Ylj28qSMbGDtj443Bg5
         77q01f2N77PlGOpQqSdXLxIYgEMXQyHOQuPK+Po/XUikkd8TqYeM+vGTVKymCLLaFp9H
         Q3605QSQIDV4bmd/6j/7jCEVfl+F1j4xLOqVCY3NyLrVTKpmzzwqb5VCq8Jf8MVoUBU0
         wUDdw84+xA9OKenry3HhNRO6BiZ2bKmhFpQ0U2GOMEWqp51stISNxfaQLkh1QaxB5zEK
         Jq9PJlkRyoBXGjdpI7TCIbTflplUTeG37fLsemoz4WHe0aF6F+w5Z1aNYUPIG7Xk/SP2
         h3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880568; x=1785485368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZgTPrgwwREOdOjFQkm+ypoyHvsVIQhBjgeRImeGfEo=;
        b=gt4GgT7Wez/b46U9SGjEMw+uCinfnqv+WxDaNQnYY9PH9yGzFa7xa6uy+GZG/Ak4aX
         GdCgVJ2ImZKgz6LgAa0n/dtX8xWKJLOeJeRIMnumFtKWOuSAOf4RUI9L4dw5+etOcikL
         /3QXUQZizj1eeEpdRCX1z03KcmNyzxYAPdLdSUcDa7Dkpvde+I4zg9jMT2dSVLeAelc1
         qv9IZMF8ogKlB+ZZK9hX3b1m1FUF/poqMt5ko+q4KNEPi+i200wvT24BQdMVfGVXUkqR
         59ZF24xXVfGTL+fC9XwphV6tcr3X6kZAFL24H0d4llxxgouRKE/Q6p9GfUyEUl4Vv6C4
         HJWg==
X-Gm-Message-State: AOJu0Yw35si70pZiLe1PJexCX1ekD/Y4i1K1UksF12ZC9/1Wp6lg6zEU
	V/bG3RT4SU/32oDRs50U0tmgy4hTQY9zDX0cvf7XTNG+1EE56PBXQ3rBzjXCiJA4cTRu6Ux8smQ
	SVPOrfPphi2ipeDlxLCl8ZBqXjbMZBKSctLIMnKeYQ+Q2NLCkhlrTrMsyKSScVvIOsZAgfLHxow
	==
X-Gm-Gg: AR+sD13LDJGtTaz58swH7zrflVW9TzWSQFuS3AU+la5lybWwwLkoPLrNg60ECoYP7wE
	YZGrqMPP6EDGfN/RBjdbOj3gSm9F3p6QcrVaP7HJoAJAtH/S2+UF6dsXUtkGSMrDjXKxX8MvXMI
	YdH83hJ5ojUH9Z859h/vP6KRjExnmTbF29Ojoul/cQrC6E2by9lA/Bsn0I5btpWjhuYWX65KEZm
	IwycBSAE6EchNDWJEO3uEqVGZIrjTAKNUB4GFaM61SGCgByfwnB6rnlEto7vyr/SlR+dLLenXFj
	xcDz95hMX5JRdMI/DIw4eKHsGatSKNaGgQ1rJxqHM4Pas5A9KqrODQb5EqsddSW+1EdefR5JOXM
	4Z4gWwTTzn0L7GAJEi46Ep+vJzUcT2gSa+xD3Epn9qPOe1X5xPassIKpXy2HZt1d/duBkJ0SbfW
	LUIgiIO3bIx120R1WqO6o=
X-Received: by 2002:a05:6a21:1bc8:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c44b1d2a4fmr6758471637.53.1784880567834;
        Fri, 24 Jul 2026 01:09:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:1bc8:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c44b1d2a4fmr6758455637.53.1784880567435;
        Fri, 24 Jul 2026 01:09:27 -0700 (PDT)
Received: from hu-ranbirs-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm45810741eec.1.2026.07.24.01.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:09:26 -0700 (PDT)
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v2 1/2] lib: utils/mpxy: mm: Add missing RPMI_MM_SRV_ENABLE_NOTIFICATION entry
Date: Fri, 24 Jul 2026 13:39:19 +0530
Message-ID: <20260724080920.1629065-2-ranbir.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724080920.1629065-1-ranbir.singh@oss.qualcomm.com>
References: <20260724080920.1629065-1-ranbir.singh@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: DpjzJVcUPTatDz5uxUN6WZ2ZLFv927gE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfXxBmnfxRym21h
 gBtzIbegDc+XMQC7kncQldu1l0A/qWkQvwp0Ox0QjDrttJUVHduNaQ+x2BmatkavjulqgsW87Lq
 LUGbZa6rVglJlHxKxZ68CKD54/3Px6Yxp1zdzzxd8zkNQJVpaQBqPuCI+yicBXB3qmVSaLGAs4p
 rF2clBi7LIvBX90CJUUukRTp9dhPMuKk6lvTpnPCdD0VUQYn6IQgfvgwfVWztWLVa+BzSTWjYX+
 lRqEANg3uKwuKQJdC2hHrl3eJXwTBfiMHLSUaPyqxkyYDh3jxFnWFTXrWNARbpFiqyTwxnQ4aB9
 FPNmq6I2h0GOD8mDyu19oTIF1yzlxHpym0PfkJAz7sXSZdVK7//yck2o1DGD9TFG/l3wIU9c8M8
 LVNm/CSniwiAeb30y6zrzHkEr8ycQI9dqaHnwyiaCpfl/jNWEX0Y3ro9Qv72rgQZm4AKB/doG3N
 Oz6LOyHkXhvK5tLNW6g==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a631db8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=izapyt6F1Uoae7EJ5J8A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: DpjzJVcUPTatDz5uxUN6WZ2ZLFv927gE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfXws/oqi3+OVBV
 sK7Y2JgFUWTIe/7icgEMCdslYcWyD6VH1FSkiydb/sx7ZVScpDEv8eHsQmrKLGrkE7sYHE0r+WS
 uViuWL2v9YMYRkRD7HlT16f8+jsZD/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_010928_992728_4348315B 
X-CRM114-Status: GOOD (  13.32  )
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
Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
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
