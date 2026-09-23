Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989AEC98302
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ppn7sd2t2mr2ppJ6vK2h1ajqitlppURFROWPJVAjZ2s=; b=TyA163D0LAOEXM
	xF0hA0xWcpANhBMbWxRU9ijAt19+4XRi6PLPDvlS20Dp6xq4bqJZUI5uuUoTKeG1Yco29+iYtRObA
	MAtbk5P+7yfUj3t8jJD8yWL1h/wbhYrZ7T39q95qWjpcs3vNTDOFRVI/iHPa7bNg1mEg+j2DTgRrv
	0Y29AYZdCMYWxBQL+Zmo9gyIDnK5lSPp3VTHAwn2WB3K1m4LXzgt/81Tfks8HEIsW26bd+yFa7sXy
	ZRRBJugB4Nbm8KeUnxMFiMr6XD4XnX5+7UioNudnNe9OKxWdKpcRk/mUw0K+kk7gyS/M1nB03j1FO
	bdL723TOkm3jIu0139nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dav-000000072C6-0MTK;
	Wed, 23 Sep 2026 03:24:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dam-0000000724O-46IW
	for opensbi@bombadil.infradead.org;
	Wed, 23 Sep 2026 03:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=z4epu3WMCqVIoxQSdTPAKqOdftta4nwJO8y7zCess+w=; b=l9US53mDcTdtxTmkZ0egKCe/uX
	a/L2ItuuqNgzRUoNz3954pfWAw3pWOFi1B29IDzOQn53oGjtDHWS2POQSXF42selL1zHLfONcxnLK
	vITAEa8Mpk1/U9V8IQBJwvGgIB5kOHjIDIop96Xs83lCCKWfBUia4vSi8Jd3FvftmJWxg9XitcZQA
	fX/O4xtPPtBavGYKxqk51mOqhpXWY2FTmNhEJmLay+Ku3JmhbZWxtvYmWiwvXRbS+7Ky2MEg42X7b
	wohzmWoRKOQXWAsb4eQzwm/++Xyb0GTOk8uwvt5jhjpvqFdiWFSLC3ct84PJHjOmRVp0dRhl/+k8M
	/IQF0pwA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Daj-0000000EJci-2QNa
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6xBb2033234;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z4epu3WMCqV
	IoxQSdTPAKqOdftta4nwJO8y7zCess+w=; b=cHZWnlbQFYyVB827MIAHuVrtrnn
	P4IvNn7huBLaxIew6M5U0VzsCWjR2mErGikbiyrER6goQky30TUR15nQwM807xaV
	Ipu1R5tgwmFLnooRJYsiF7F1tP0iuen28uKmpcMPk8KBkmIxKYioZrjsZXIvXXVY
	irTaJ9vKaf8GivzW78qLwrFM4KwGSPO0y653oankZyVGi+N9aL6DNsTQ4TdcCSUv
	tsDVtb9xUINoK72VaGdmnYvTuZRBrOqoOl+gKRotd65+kaOV/FuqGUs+7926MHn7
	LWp7OdkAodCXJPgvdD7DOl8UgXqYTc7+N+Q6MQmdMYoeo4FVTGN9NrnNv3Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c27qw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2O0015889;
	Wed, 23 Sep 2026 03:24:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O2gu015968
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:02 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 12455248FA; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 05/11] lib: utils/mpxy: Introduce mpxy_rpmi_no_mbox_init() function
Date: Wed, 23 Sep 2026 08:53:53 +0530
Message-ID: <20260923032359.4041876-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX+b938IXEeRAE
 bf+9gfmVha/rOM+TSgXlySuhaEkmqgpctDqVZ5GwDUFjAFqIoXANxsC1FYkBK6PQXJaHerVs5Wk
 FrfLsXfFt53pR0fPT1GcPG7CLV65+L0LOYhsvQGzQU7OG7lJP1YZFBE1l5KjXMslQ+S8JBjLeOK
 l9Y2pt7VMJ28j/GsbCrucpXhZ8ggoOMty+jWEdYjk/o+lUPOjUB3OOSS2iDChFFU9bRHV5gZOsm
 H6GlIT/YfeuFdEjPfMBJQgKcsNZmII+S19YeP6o71hjepIA43rVprPu84Vbh2MfsakVf+dxb4VG
 SAhRDyboJZR4PYTZBQHyHOy942vNmShqN+dWxBkuirHke+OKPXfQCCqnYHHtVCw6+AORLuTLDAl
 kL/PlQ9vhD0ZEkA8Fj8TuEQa5aYW88tVaRbQBbEtelRDGB54BndN4aIt9syd+XMysrfcKOaSoCy
 KMn2I2bYOPcYjPVNeUA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=gs66Sc-kNA020VpUQPYA:9
X-Proofpoint-ORIG-GUID: QAEyfhVtecMdOz4HZgOkhEZdzourW-hj
X-Proofpoint-GUID: QAEyfhVtecMdOz4HZgOkhEZdzourW-hj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX29QDegt9t/m4
 AeUlabx98WzxPlc6h0mBaRN9wx+XWTjhlrNwWnS07TDbujLTR+FQJhUo8ffh65SSd+DaDfjbsZY
 PKaFOQmcTAYP6yECEq4fjvOazyv0d+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_042418_157513_65721373 
X-CRM114-Status: GOOD (  20.54  )
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

Add new mpxy_rpmi_no_mbox_init() function to instantiate MPXY RPMI
channel without any mailbox channel backing. This new function can
be used by MPXY RPMI drivers that want to emulate MPXY channels in
software.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h |   6 +-
 lib/utils/mpxy/fdt_mpxy_rpmi.c         | 119 ++++++++++++++++---------
 2 files changed, 83 insertions(+), 42 deletions(-)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
index a3968e87..c4e6897f 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
@@ -84,7 +84,11 @@ struct mpxy_rpmi_data {
 	void (*cleanup_group)(void *context);
 };
 
-/** Common probe function for MPXY RPMI drivers */
+/** Function to instantiate MPXY RPMI channel */
+int mpxy_rpmi_no_mbox_init(const struct mpxy_rpmi_data *data, u32 mpxy_channel_id,
+			   const char *dom_name);
+
+/** FDT probe function to instantiate MPXY RPMI channel */
 int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *match);
 
 #endif
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
index 9b8e69e1..103ded13 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -219,44 +219,37 @@ static int mpxy_rpmi_get_attribute(struct mpxy_rpmi *rmb,
 	return rc;
 }
 
-int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+static int __mpxy_rpmi_init(const struct mpxy_rpmi_data *data,
+			    struct mbox_chan *chan, u32 mpxy_channel_id,
+			    struct sbi_domain *dom)
 {
-	u32 channel_id, servicegrp_ver, pro_ver, max_data_len, tx_tout, rx_tout;
-	u32 impl_id, impl_ver;
-	const struct mpxy_rpmi_data *data = match->data;
+	u32 servicegrp_ver, pro_ver, max_data_len, tx_tout, rx_tout;
 	struct mpxy_rpmi *rmb;
-	struct mbox_chan *chan;
-	const fdt32_t *val;
-	int rc, len;
+	u32 impl_id, impl_ver;
+	int rc;
+
+	if (!data || !dom)
+		return SBI_EINVAL;
+
+	/*
+	 * When mailbox channel is not available, both get_attribute_group() and
+	 * xfer_group() callbacks must be available.
+	 */
+	if (!chan && (!data->get_attribute_group || !data->xfer_group))
+		return SBI_EINVAL;
 
 	/* Allocate context for MPXY RPMI instance */
 	rmb = sbi_zalloc(sizeof(*rmb));
 	if (!rmb)
 		return SBI_ENOMEM;
 	rmb->data = data;
-
-	/*
-	 * If channel request failed then other end does not support
-	 * service group so do nothing.
-	 */
-	rc = fdt_mailbox_request_chan(fdt, nodeoff, 0, &chan);
-	if (rc) {
-		rc = SBI_ENODEV;
-		goto fail_free_client;
-	}
 	rmb->chan = chan;
 
-	/* Match channel service group id */
-	if (data->servicegrp_id != chan->chan_args[0]) {
-		rc = SBI_EINVAL;
-		goto fail_free_chan;
-	}
-
 	/* Setup RPMI service group context */
 	if (data->setup_group) {
 		rc = data->setup_group(&rmb->group_context, chan, data);
 		if (rc)
-			goto fail_free_chan;
+			goto fail_free_client;
 	}
 
 	/* Get channel protocol version */
@@ -301,24 +294,11 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 	if (rc)
 		goto fail_cleanup_group;
 
-	/*
-	 * The "riscv,sbi-mpxy-channel-id" DT property is mandatory
-	 * for MPXY RPMI drivers so if this is not present then try
-	 * other drivers.
-	 */
-	val = fdt_getprop(fdt, nodeoff, "riscv,sbi-mpxy-channel-id", &len);
-	if (len > 0 && val) {
-		channel_id = fdt32_to_cpu(*val);
-	} else {
-		rc = SBI_ENODEV;
-		goto fail_cleanup_group;
-	}
-
 	/* Setup MPXY RPMI channel */
 	/* Channel ID*/
-	rmb->channel.channel_id = channel_id;
+	rmb->channel.channel_id = mpxy_channel_id;
 	/* Set the owner domain */
-	rmb->channel.owner_domain = &root;
+	rmb->channel.owner_domain = dom;
 	/* Callback for read RPMI attributes */
 	rmb->channel.read_attributes = mpxy_read_attributes;
 	/* Callback for write RPMI attributes */
@@ -360,9 +340,66 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 fail_cleanup_group:
 	if (data->cleanup_group)
 		data->cleanup_group(rmb->group_context);
-fail_free_chan:
-	mbox_controller_free_chan(chan);
 fail_free_client:
 	sbi_free(rmb);
 	return rc;
 }
+
+int mpxy_rpmi_no_mbox_init(const struct mpxy_rpmi_data *data, u32 mpxy_channel_id,
+			   const char *dom_name)
+{
+	/* Create MPXY RPMI instance without mailbox channel */
+	return __mpxy_rpmi_init(data, NULL, mpxy_channel_id, sbi_domain_find_by_name(dom_name));
+}
+
+int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	const struct mpxy_rpmi_data *data = match->data;
+	struct mbox_chan *chan = NULL;
+	const fdt32_t *val;
+	u32 channel_id;
+	int rc, len;
+
+	/* Request mailbox channel when available */
+	val = fdt_getprop(fdt, nodeoff, "mboxes", &len);
+	if (val) {
+		/*
+		 * If channel request failed then other end does not support
+		 * service group so do nothing.
+		 */
+		rc = fdt_mailbox_request_chan(fdt, nodeoff, 0, &chan);
+		if (rc)
+			return SBI_ENODEV;
+
+		/* Match channel service group id */
+		if (data->servicegrp_id != chan->chan_args[0]) {
+			rc = SBI_EINVAL;
+			goto fail_free_chan;
+		}
+	}
+
+	/*
+	 * The "riscv,sbi-mpxy-channel-id" DT property is mandatory
+	 * for MPXY RPMI drivers so if this is not present then try
+	 * other drivers.
+	 */
+	val = fdt_getprop(fdt, nodeoff, "riscv,sbi-mpxy-channel-id", &len);
+	if (len > 0 && val) {
+		channel_id = fdt32_to_cpu(*val);
+	} else {
+		rc = SBI_ENODEV;
+		goto fail_free_chan;
+	}
+
+	/* Create MPXY RPMI instance with mailbox channel discovered from DT */
+	rc = __mpxy_rpmi_init(data, chan, channel_id, &root);
+	if (rc)
+		goto fail_free_chan;
+
+	return SBI_OK;
+
+fail_free_chan:
+	if (chan)
+		mbox_controller_free_chan(chan);
+	return rc;
+}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
