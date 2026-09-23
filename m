Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26C8C98306
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ngvVsSMnj/kVI2PNwYJSlEF6fxJ1qFvOlyV0cPqr9g=; b=U7r7QkEtY4gAEI
	Zii033nusdkb2Lu8mFg97LrXqG9jAL5xsGi5nFZ24TD5b1sE/wcnFhB0C5o7ZCUzNKd4BDC5V06ky
	2HJdCt4SlMakgMIHjv1L0/tyh+Vbtna2FQ8imC4ywxPKx/fW/mMs9HcyVUugirInjMQXN1ZoSfvet
	rDrZq/RYhKchNc//XNy/u4EHIbfQNR+cGuoZuYbhHHmzAFMdfWuDOLQhJp7ftGY9ApBCkm5TFusRt
	kjJh/fUxW0+IIS0mjujbscC9/gL7w4EIpkDggR0cvEBRx7LXCOeRvbqnIsBpbWZXFknpPxkYvtNEw
	6wyqUvK0KJTutq+q6ggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dav-000000072Cq-12eN;
	Wed, 23 Sep 2026 03:24:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dao-00000007260-26wp
	for opensbi@bombadil.infradead.org;
	Wed, 23 Sep 2026 03:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HEllUb3B3qWY+WFV+kSqQZ3FsxHELk6hWhiIrkGOKRk=; b=Kt1JLe1Tqb5guxEt8/Qkr5MoM5
	UxIXmF/Haqcgb5KQlzeEmTehm/fSt7u8Xoc3ccWs3ajfcackMUlydkLIMW0qV8ZAyVmki+X86kIq2
	b9nM8XMZr+nhtNsXHvAu43xYQFzxPQePEf02+HVAJYc2thKsJq5eQ7oZq8CxW+k9dSN5ODqa4Wyte
	EQH4wACu24MCujlq98tePOgZL5AvOEFpxdUj1hFg/PlqHXKs2qPKCWYpyRMnoE5avhwuQwIGWifKU
	xD0/dVWcpioyXhSkVZxelRIUIki7lw5DIzaOm5tmXWEUehGe5WWP1uqns1UDlkUFlPofX6iVpk2aa
	nFHNfpxw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Daj-0000000EJcl-2h1y
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3J7CW1509482;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HEllUb3B3qW
	Y+WFV+kSqQZ3FsxHELk6hWhiIrkGOKRk=; b=kGa8fhlmolPXk6H53ebAC9pufyl
	qhCteibJO7VvvZipMOIDOl4kObl2heZ44mR5Ta/Div8f/am8NREKFdMQabpWc9HW
	2FRbYq5lAfLXtMy3Dm/t5fJ0QPfiyKfVHTKSgCPJWQc2ZW7SOhQp+Yc69e+QLzxx
	lfmagA2VedEtikuIOKPIO/B3fS56rFeOAvXfxzpu93xKM6n6Gzg8Nq1YTo7BTLmK
	ZcWBsFgjufjGT9sE7XG2ZGDKFHwS9v2iAzfSyyiwjQLNBS6wLDwBRov9rdcJmt0o
	FFqlu8hIfbNqozyXhnW7XGEZvwHWeIdMxB6dLR/LX19mWtst6G29Yf68Duw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xt937-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2cO015898;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O1ul015850
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:01 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 0792422C30; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 02/11] lib: utils/mpxy: Setup group early in fdt_mpxy_rpmi_init()
Date: Wed, 23 Sep 2026 08:53:50 +0530
Message-ID: <20260923032359.4041876-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: iE65vmo6M-qyeGmZYzNVN4BHOjwGKdAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX+anrfnvJysdf
 eEfWErAGtJrM3aFDKbz56XqmgxrZslspXdIMV3092MoI3/jzuByesbEKnxOnNked+YTrVIcc0YX
 z/CZlFgur8vIsEVMaWEJYVHXY32G11a3DF3RHuTRgchmTiJS32K9zgN795PPD2X7uNIPPfPQO3f
 j4e6V3932pseAaEHRbZcGAGHWiJC8YQWw6IoNu1oA3UG7/bmQ98v/OcoQsGnHQz2Kza6NeoVhn/
 j9ZaMzv1RO+6vBFLNwBs/h+x7lvyYGfEcW+3lNpDQ6k0/iAit5s9N5Q1xGHRUFy+3zQwatl0tW/
 4rqnQ/K/ApT7Dil2XNyi4+78xFv/Cb+fGqQKB9XvYMKf1hcbJ8xIOO2b4iCoEilEC7+bRvX6QXk
 7QsYmuaEuQnWfIK6DDf4xq4RDHUgBKku43Gf/NTPYOGOOWeI3JKvzbrWUYeWoSZfnHQepLvGDfW
 tFFjiDCLwy+VFQYrzKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX/yz8geXTv6Vv
 BlFU/ED2jGIuIKzYcjlOKUFJPPeHI0k/I1lubhYu/r3S9UN49A/z7J5RMps9Ls+1qi/Zp7mIKXh
 Gu+BKfIidYFMelw8X6ZVB6FevQWPy84=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=1pru2aKv3DW0B6oIe2QA:9
X-Proofpoint-ORIG-GUID: iE65vmo6M-qyeGmZYzNVN4BHOjwGKdAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_042418_169158_3768BEBA 
X-CRM114-Status: GOOD (  13.02  )
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

Instead of setting group late in fdt_mpxy_rpmi_init(), it is better
to do it as early as possible right after requesting mailbox channel
so that we define new callback for channel attributes.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi.c | 40 +++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
index 9a37fbdc..bbeb7a79 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -235,47 +235,54 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 		goto fail_free_chan;
 	}
 
+	/* Setup RPMI service group context */
+	if (data->setup_group) {
+		rc = data->setup_group(&rmb->group_context, chan, data);
+		if (rc)
+			goto fail_free_chan;
+	}
+
 	/* Get channel protocol version */
 	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_PROTOCOL_VERSION,
 				     &pro_ver);
 	if (rc)
-		goto fail_free_chan;
+		goto fail_cleanup_group;
 
 	/* Get channel maximum data length */
 	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_MAX_DATA_LEN,
 				     &max_data_len);
 	if (rc)
-		goto fail_free_chan;
+		goto fail_cleanup_group;
 
 	/* Get channel Tx timeout */
 	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_TX_TIMEOUT,
 				     &tx_tout);
 	if (rc)
-		goto fail_free_chan;
+		goto fail_cleanup_group;
 
 	/* Get channel Rx timeout */
 	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_RX_TIMEOUT,
 				     &rx_tout);
 	if (rc)
-		goto fail_free_chan;
+		goto fail_cleanup_group;
 
 	/* Get channel service group version */
 	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_SERVICEGROUP_VERSION,
 				     &servicegrp_ver);
 	if (rc)
-		goto fail_free_chan;
+		goto fail_cleanup_group;
 
 	/* Get channel implementation id */
 	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_IMPL_ID,
 				     &impl_id);
 	if (rc)
-		goto fail_free_chan;
+		goto fail_cleanup_group;
 
 	/* Get channel implementation version */
 	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_IMPL_VERSION,
 				     &impl_ver);
 	if (rc)
-		goto fail_free_chan;
+		goto fail_cleanup_group;
 
 	/*
 	 * The "riscv,sbi-mpxy-channel-id" DT property is mandatory
@@ -287,7 +294,7 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 		channel_id = fdt32_to_cpu(*val);
 	} else {
 		rc = SBI_ENODEV;
-		goto fail_free_chan;
+		goto fail_cleanup_group;
 	}
 
 	/* Setup MPXY RPMI channel */
@@ -329,23 +336,16 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 	rmb->data = data;
 	rmb->chan = chan;
 
-	/* Setup RPMI service group context */
-	if (data->setup_group) {
-		rc = data->setup_group(&rmb->group_context, chan, data);
-		if (rc)
-			goto fail_free_chan;
-	}
-
 	/* Register RPMI service group */
 	rc = sbi_mpxy_register_channel(&rmb->channel);
-	if (rc) {
-		if (data->cleanup_group)
-			data->cleanup_group(rmb->group_context);
-		goto fail_free_chan;
-	}
+	if (rc)
+		goto fail_cleanup_group;
 
 	return SBI_OK;
 
+fail_cleanup_group:
+	if (data->cleanup_group)
+		data->cleanup_group(rmb->group_context);
 fail_free_chan:
 	mbox_controller_free_chan(chan);
 fail_free_client:
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
