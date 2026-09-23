Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0ACC982FA
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIYNKI27J0bLI2UNMwGo1mOA1yNvAWsQitn2VdNlZzM=; b=lPzr5Sko6/6qqx
	hFrZsp+3aOUgTQcgw2LmGkZ6zk/ENE1oaIYlFmp357UQpdDsE15/aYZJYF34hSAFqE1JJz4yz6hFy
	AALehTGp3FcuNxg8/ae13kUWs6FrCkymqoh93R52qpQO2rRqlkJgE36xXQzFfRTdXzs7dQTMWcUSL
	8EdWYJY/ENNVUNwupkqwa3FKLsTFnY8CVmrn91upS6TGePKgYv0R5rZ3Ok9GyePnvqok6u8WOXWJ3
	CClskM3uZ/95sENWcVSExHKacPZrFhm28WH6mY8pD/1dVLQgK1PYaXZGG+rZQzLwmrkfGZrSsi+jJ
	vIJfWlQQEZjAQTdiVJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dam-0000000724r-2Gmf;
	Wed, 23 Sep 2026 03:24:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Daf-0000000721U-0CR6
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3D4fx1153696;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QVziS5A8FPN
	riv/1aeG4eWAJcrmPfhxyBMjyRba7R+M=; b=I+N7XkbNdyROEvAVm1eI3Ea+vLM
	wcyX48RJQnxGqgOxruvVGlNGqTwZ+SGQW/BDibJ6GY2HdOXyLQTp2zD3ZiTc2g3S
	6ifaJtO0jNZHa2cR2CiLi8uubaQJaS5cnM2SEJc+GJ2FrTBrTSB5T0d95ITENuOk
	AlsgJNyfPkboju+JcZtjWpZUZgyePsFJPBQk57z8gNJC22wjb4dhND3ZNRBkmXYH
	U2/L3zcve2MO/VhJtUj1rYFC/oT9lZlBLeljMzRfQ8i1MEAuIkkL3kIypT1MJchk
	qWYaW8z8HQWVq4gGCoFiE6qn+K82J2eSguZzIVIhn0JBHtmU0Bmf1ct4FEA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7jtab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2rk015891;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O15d015849
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:01 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 0B37D22C87; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 03/11] lib: utils/mpxy: Introduce get_attribute_group() for MPXY RPMI data
Date: Wed, 23 Sep 2026 08:53:51 +0530
Message-ID: <20260923032359.4041876-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX4EYFkI6qH2Wk
 SSn9rh4GmrJxHsVs7W0jcZMLMhCU0EN4aj19M+rgQVfCnFEkgvD2q0K9D6A/Yo795xPVkPUO+Vx
 G0gdDAmYuzs/rkL+EMG8ErH3ECVMnhM=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=-_I07vcqxqyDPgzx1_oA:9
X-Proofpoint-ORIG-GUID: 8fRQ8mZEQZBbeu8Y6v0o_5pZWXZ99QGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXywvTk4xwzpL7
 +0n3pQBCbtmWl/IOB9fNde/S483lgKF9E4SBrSP1/1JJrQ+O+ZQvFvPi4C0vG1iZuvahtvXgWUs
 qGg+DD9RnfZrWsYg5qFYwAjKc7TmoLsJ9OA/YTXJbLEZFKJGqrKcCJSa07iH8I1a6P7ODhfDVOP
 bLmwmG6KQlohVQ7GrX+/hqpNOwGmSmnBkRCxwF5JkQVbW0gaMr0AUW9fT2OGovah9P9yFzmirnU
 BlyItEvlcip1I7WVATG1b7RZEEoddstWHyRCS4UyAp5OazlJoVQPjLfwqWFhZIGVGlcTfu64q7K
 fZMyrGeO28ZnUz3DQPkENe2uA9XWNHn4jlxtBO8lwum2YZyLYvA/WJf5tz4q4EZ67o8343LaU4I
 if1om+AXhSjHXcjAZ279LH8TVYCHqpKQFaHD2HT+batNH8/Jx0dN7Atcq0ZBuW0fRZbrHgx2dcx
 +KZAla/hVmgcy9yRYtA==
X-Proofpoint-GUID: 8fRQ8mZEQZBbeu8Y6v0o_5pZWXZ99QGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202413_559233_A229B6F4 
X-CRM114-Status: GOOD (  13.94  )
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

Fully emulated MPXY channels need a custom way to provide RPMI attributes
so introduce optional get_attribute_group() callback in MPXY RPMI data
for this purpose.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h |  5 ++++
 lib/utils/mpxy/fdt_mpxy_rpmi.c         | 34 ++++++++++++++++++--------
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
index d1f5f9ca..a3968e87 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
@@ -67,6 +67,11 @@ struct mpxy_rpmi_data {
 	u32 num_services;
 	struct mpxy_rpmi_service_data *service_data;
 
+	/** Get RPMI service group attribute */
+	int (*get_attribute_group)(void *context, struct mbox_chan *chan,
+				   enum rpmi_channel_attribute_id attr_id,
+				   u32 *out_value);
+
 	/** Transfer RPMI service group message */
 	int (*xfer_group)(void *context, struct mbox_chan *chan,
 			  struct mbox_xfer *xfer);
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
index bbeb7a79..9b8e69e1 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -204,6 +204,21 @@ static int mpxy_send_message_withoutresp(struct sbi_mpxy_channel *channel,
 				   NULL, 0, NULL);
 }
 
+static int mpxy_rpmi_get_attribute(struct mpxy_rpmi *rmb,
+				   enum rpmi_channel_attribute_id attr_id,
+				   u32 *out_value)
+{
+	const struct mpxy_rpmi_data *data = rmb->data;
+	struct mbox_chan *chan = rmb->chan;
+	int rc;
+
+	if (data->get_attribute_group)
+		rc = data->get_attribute_group(rmb->group_context, chan, attr_id, out_value);
+	else
+		rc = mbox_chan_get_attribute(chan, attr_id, out_value);
+	return rc;
+}
+
 int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	u32 channel_id, servicegrp_ver, pro_ver, max_data_len, tx_tout, rx_tout;
@@ -218,6 +233,7 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 	rmb = sbi_zalloc(sizeof(*rmb));
 	if (!rmb)
 		return SBI_ENOMEM;
+	rmb->data = data;
 
 	/*
 	 * If channel request failed then other end does not support
@@ -228,6 +244,7 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 		rc = SBI_ENODEV;
 		goto fail_free_client;
 	}
+	rmb->chan = chan;
 
 	/* Match channel service group id */
 	if (data->servicegrp_id != chan->chan_args[0]) {
@@ -243,43 +260,43 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 	}
 
 	/* Get channel protocol version */
-	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_PROTOCOL_VERSION,
+	rc = mpxy_rpmi_get_attribute(rmb, RPMI_CHANNEL_ATTR_PROTOCOL_VERSION,
 				     &pro_ver);
 	if (rc)
 		goto fail_cleanup_group;
 
 	/* Get channel maximum data length */
-	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_MAX_DATA_LEN,
+	rc = mpxy_rpmi_get_attribute(rmb, RPMI_CHANNEL_ATTR_MAX_DATA_LEN,
 				     &max_data_len);
 	if (rc)
 		goto fail_cleanup_group;
 
 	/* Get channel Tx timeout */
-	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_TX_TIMEOUT,
+	rc = mpxy_rpmi_get_attribute(rmb, RPMI_CHANNEL_ATTR_TX_TIMEOUT,
 				     &tx_tout);
 	if (rc)
 		goto fail_cleanup_group;
 
 	/* Get channel Rx timeout */
-	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_RX_TIMEOUT,
+	rc = mpxy_rpmi_get_attribute(rmb, RPMI_CHANNEL_ATTR_RX_TIMEOUT,
 				     &rx_tout);
 	if (rc)
 		goto fail_cleanup_group;
 
 	/* Get channel service group version */
-	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_SERVICEGROUP_VERSION,
+	rc = mpxy_rpmi_get_attribute(rmb, RPMI_CHANNEL_ATTR_SERVICEGROUP_VERSION,
 				     &servicegrp_ver);
 	if (rc)
 		goto fail_cleanup_group;
 
 	/* Get channel implementation id */
-	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_IMPL_ID,
+	rc = mpxy_rpmi_get_attribute(rmb, RPMI_CHANNEL_ATTR_IMPL_ID,
 				     &impl_id);
 	if (rc)
 		goto fail_cleanup_group;
 
 	/* Get channel implementation version */
-	rc = mbox_chan_get_attribute(chan, RPMI_CHANNEL_ATTR_IMPL_VERSION,
+	rc = mpxy_rpmi_get_attribute(rmb, RPMI_CHANNEL_ATTR_IMPL_VERSION,
 				     &impl_ver);
 	if (rc)
 		goto fail_cleanup_group;
@@ -333,9 +350,6 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 	rmb->msgprot_attrs.impl_id = impl_id;
 	rmb->msgprot_attrs.impl_ver = impl_ver;
 
-	rmb->data = data;
-	rmb->chan = chan;
-
 	/* Register RPMI service group */
 	rc = sbi_mpxy_register_channel(&rmb->channel);
 	if (rc)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
