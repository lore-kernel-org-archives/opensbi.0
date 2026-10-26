Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05091606A31E
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 16:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=34j+GQDO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nbaxijtI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G4MNitDJM+/zrW84SjKklofx7539yeyu/xLy7Zc4PN8=; b=34j+GQDO2jE77kGdggnyriybcA
	rfYOe1EzVVRP0tVsHGPpuFgzQ+SzWT/WFXpOk2udi02vqalM1cqqnI7fBGsHORFJIBEhGStWTBNO8
	Y24ERDeXH/agOjJtM15qXGve4uY84Olo9zFWCdSD5H7hf1PUcUwb6dgV4oEAafFAB5yLv45p71pip
	0/VZ4f/34dBB154Hi1wRWcJiCE9+EEhr0coNA/JA71C5X2q+HMAUrsqftqyu1/0Xbwug+KE6ZEFH4
	lHUrgiP1tK6D8QaAZ1gPO8/HnXfz5C3Hj7p0pl1XxbmUbqHLDWde5gcVXT1E92fSchYOR2fCI+JIs
	Gf0DAMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNLc-00000002r34-3DHP;
	Mon, 26 Oct 2026 16:14:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNLY-00000002r0n-3pdM
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 16:14:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvqdS3268455;
	Mon, 26 Oct 2026 16:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qpmGrTrAumc
	iC8XFCVCt4V3MD2nOfnyjBxOiILx3bxk=; b=nbaxijtI0JHF3+qK5j7jHYZBG2k
	ezzOhrLwE2CEmARRg6JPRVgONGNZ65ddJD6cXiNIJ4g9BbJwMR6NS4RXNT8/JMkV
	QAOQtF4rEcgf3Dwc06KmTc4/dJ1GCtYJpaSomdshLHp69zHX8vJ8y5boqY5jOOhf
	AoLW5MOeOI/kepaj+k57VXKI2Et6Vyt5+ynJQm9I8OQTNRDIC3QA6mvywYbtMEAt
	DZ8lwdkEjq+bGW4RD2k0fKt14DTx1j1qFlFoI8xjfk/6XQn81JDFxVpcb1Z6YSa5
	FXQX87WiH4IUNVWozlsR74+bOnDySMupLn03Ynabv99cMjwnbiIlzLh69/Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9hr2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 16:14:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69QGEoSd3751302;
	Mon, 26 Oct 2026 16:14:50 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 69QGEnSJ3751290
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 16:14:50 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id D49A424CF6; Mon, 26 Oct 2026 09:14:49 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v6 3/3] mpxy: Add MM source driver
Date: Mon, 26 Oct 2026 09:14:48 -0700
Message-ID: <20261026161448.938375-4-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026161448.938375-1-pawandeep.oza@oss.qualcomm.com>
References: <20261026161448.938375-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfXxJyxMWKx9OdP
 oV7//VLunpqc9XXktzU1kqzjAVY6sShRl/Yd0HO92p6IOd0l6KV2JD18DC6wmXxF7fTHzC4SXHX
 tc6lJtdfq19kHriIQxh1X62EXzrtJFdGTlU56P/40bcoxHwgk6sR+tyuSRzP/jxhR05EwCBU3IF
 k04zccLo1k/acOVEw837cwGq5hMiXr4mspEHElgehjAlKrCwBmQZlsRKrLN8SEDy/J28tvMRk6o
 pfOfRF6rsHaXGBOssk3/kxZOtASI6mZclZHZGnNCLxmakPGZszjiu9bBkYLOypHowBoqHy9+XfP
 EcfGhORhP/ELEg8JCaQQqL/USDoSmzetLGjGx+j9sDkYI++BK9iIx7a3tDzMtvM7aEpFpO1YuY0
 bq4Y97l6g7HQ9EYowJ5wvEB+f0QSVIG83eKOCAYBB+JCzCrIY303uEBJGNnccJkXRx9NL9Qvm4Q
 svWqqYVH1XMNy1IGZsQ==
X-Proofpoint-GUID: 2J7EK3suQrXf4M1-w3cVBTmfGR91fbOi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfX1sldXMOorkIY
 6DDPnNajIoogiwv6luwAjudJYCM92jRDRNucj2Xn9W/0ez/DGRWkz3bgioR8OV/RD8wsXOrax/y
 9Tu04MzWdQIlqAz34zkrhs1Z3WAXqf0=
X-Proofpoint-ORIG-GUID: 2J7EK3suQrXf4M1-w3cVBTmfGR91fbOi
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf7c7b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=Hvk66tuYxJjxctRP0WwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_091453_068246_BE8879C7 
X-CRM114-Status: GOOD (  22.44  )
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
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>

Add the MPXY MM source driver for forwarding RPMI Management Mode
requests through the MPXY request-forwarding bridge.

The driver:

- Registers the `opensbi,rpmi-mpxy-reqfwd-mm` FDT-compatible source.
- Defines MM service metadata for get attributes and communicate services.
- Builds request-forwarding responses for MM GET_ATTRIBUTES and
  COMMUNICATE requests.
- Handles MM response completion and copies response payloads back to the
  source buffer.
- Extracts and stores the MM shared-memory address and size from the
  GET_ATTRIBUTES response.
- Registers the MM source with the Management Mode RPMI service group.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_bridge.c |   3 +
 lib/utils/mpxy/mpxy_source_mm.c  | 208 +++++++++++++++++++++++++++++++
 lib/utils/mpxy/objects.mk        |   2 +-
 3 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 lib/utils/mpxy/mpxy_source_mm.c

diff --git a/lib/utils/mpxy/fdt_mpxy_bridge.c b/lib/utils/mpxy/fdt_mpxy_bridge.c
index ac44c3a6..4cf78b9b 100644
--- a/lib/utils/mpxy/fdt_mpxy_bridge.c
+++ b/lib/utils/mpxy/fdt_mpxy_bridge.c
@@ -30,7 +30,10 @@
 #define SBI_MPXY_BRIDGE_PROP_CHAN "riscv,sbi-mpxy-channel-id"
 
 
+extern struct mpxy_bridge_source_driver mpxy_rpmi_mm_driver;
+
 static const struct mpxy_bridge_source_driver *source_drivers[] = {
+	&mpxy_rpmi_mm_driver,
 };
 
 static uint16_t token = 0;
diff --git a/lib/utils/mpxy/mpxy_source_mm.c b/lib/utils/mpxy/mpxy_source_mm.c
new file mode 100644
index 00000000..1d19ba7d
--- /dev/null
+++ b/lib/utils/mpxy/mpxy_source_mm.c
@@ -0,0 +1,208 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Qualcomm, Inc
+ *
+ * Authors:
+ *   Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
+ */
+
+#include <sbi_utils/mpxy/fdt_mpxy.h>
+#include <sbi_utils/mpxy/fdt_mpxy_bridge.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+
+static struct mpxy_rpmi_service_data mm_srvcdata[] = {
+	[0] = {
+		.id = RPMI_MM_SRV_ENABLE_NOTIFICATION,
+		.min_tx_len = sizeof(struct rpmi_enable_notification_req),
+		.max_tx_len = sizeof(struct rpmi_enable_notification_req),
+		.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
+		.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
+	},
+	[1] = {
+		.id = RPMI_MM_SRV_GET_ATTRIBUTES,
+		.min_tx_len = 0,
+		.max_tx_len = 0,
+		.min_rx_len = sizeof(struct rpmi_mm_get_attributes_rsp),
+		.max_rx_len = sizeof(struct rpmi_mm_get_attributes_rsp),
+	},
+	[2] = {
+		.id = RPMI_MM_SRV_COMMUNICATE,
+		.min_tx_len = sizeof(struct rpmi_mm_communicate_req),
+		.max_tx_len = sizeof(struct rpmi_mm_communicate_req),
+		.min_rx_len = sizeof(struct rpmi_mm_communicate_rsp),
+		.max_rx_len = sizeof(struct rpmi_mm_communicate_rsp),
+	},
+};
+
+static struct rpmi_mm_shmem_info {
+	u64 addr;
+	u32 size;
+} mm_shmem;
+
+static int mpxy_rpmi_build_reqfwd_resp(struct mpxy_bridge_src_ctx *src,
+				       struct mpxy_bridge_dst_ctx *dst,
+				       const u8 *data, u32 data_len)
+{
+	struct rpmi_request_forward_resp *resp;
+	u32 hdr_len = sizeof(struct rpmi_message_header);
+	u32 avail;
+	u32 offset;
+	u32 returned;
+	int ret = SBI_OK;
+
+	do {
+		resp   = (struct rpmi_request_forward_resp *)dst->respbuf;
+		offset = dst->start_index;
+		avail  = dst->resp_bufsize - sizeof(*resp);
+	
+		if (offset > data_len) {
+			ret = SBI_EINVAL;
+			break;
+		}
+
+		if (offset == 0) {
+			if (avail <= hdr_len) {
+				ret = SBI_EINVAL;
+				break;
+			}
+			avail -= hdr_len;
+		}
+
+		returned = data_len - offset;
+		if (returned > avail)
+			returned = avail;
+
+		resp->status = RPMI_SUCCESS;
+
+		if (offset == 0) {
+			sbi_memcpy(resp->data, (u8 *)&src->header, hdr_len);
+			sbi_memcpy(resp->data + hdr_len, data, returned);
+			resp->returned     = hdr_len + returned;
+			resp->remaining    = data_len - returned;
+			*dst->resp_len_ptr = sizeof(*resp) + hdr_len + returned;
+		} else {
+			sbi_memcpy(resp->data, data + offset, returned);
+			resp->returned     = returned;
+			resp->remaining    = data_len - offset - returned;
+			*dst->resp_len_ptr = sizeof(*resp) + returned;
+		}
+	} while (0);
+
+	if (ret) {
+		resp->status = RPMI_ERR_INVALID_PARAM;
+		resp->returned = 0;
+		resp->remaining = 0;
+	}
+
+	return ret;
+}
+
+static int mpxy_rpmi_mm_xfer(struct mpxy_bridge_src_ctx *src,
+			     struct mpxy_bridge_dst_ctx *dst)
+{
+	if (!src || !src->msgbuf || !dst || !dst->respbuf || !dst->resp_len_ptr)
+		return SBI_EINVAL;
+
+	switch (src->header.service_id) {
+		case RPMI_MM_SRV_GET_ATTRIBUTES:
+			return mpxy_rpmi_build_reqfwd_resp(src, dst, NULL,
+			mm_srvcdata[RPMI_MM_SRV_GET_ATTRIBUTES - 1].min_tx_len);
+
+		case RPMI_MM_SRV_COMMUNICATE:
+			return mpxy_rpmi_build_reqfwd_resp(src, dst, (const u8 *)src->msgbuf,
+				mm_srvcdata[RPMI_MM_SRV_COMMUNICATE - 1].min_tx_len);
+
+		default:
+			return SBI_ENOTSUPP;
+	}
+}
+
+static int mpxy_rpmi_get_payload(void *msgbuf, u32 msg_len,
+				 const u8 **payload, u32 *payload_len)
+{
+	struct rpmi_message_header *hdr;
+	u32 len;
+
+	hdr = (struct rpmi_message_header *)msgbuf;
+	len = (u32)le16_to_cpu(hdr->datalen);
+
+	*payload = (const u8 *)msgbuf + sizeof(struct rpmi_message_header);
+	*payload_len = len;
+
+	return SBI_OK;
+}
+
+static int mpxy_rpmi_copy_payload(struct mpxy_bridge_src_ctx *src,
+				   const u8 *payload, u32 payload_len)
+{
+	sbi_memcpy((u8 *)src->respbuf, payload, payload_len);
+	src->resp_length = payload_len;
+
+	return SBI_OK;
+}
+
+static int mpxy_rpmi_mm_complete(struct mpxy_bridge_src_ctx *src,
+				  void *msgbuf, u32 msg_len)
+{
+	const u8 *payload;
+	u32 payload_len;
+	int ret;
+
+	ret = mpxy_rpmi_get_payload(msgbuf, msg_len,
+				    &payload, &payload_len);
+	if (ret)
+		return ret;
+
+	switch (src->header.service_id) {
+		case RPMI_MM_SRV_GET_ATTRIBUTES:
+			struct rpmi_mm_get_attributes_rsp *attr_rsp;
+			attr_rsp = 	(struct rpmi_mm_get_attributes_rsp *)payload;
+
+			mm_shmem.addr = ((u64)le32_to_cpu(attr_rsp->mma.shmem_addr_hi) << 32) |
+				(u64)le32_to_cpu(attr_rsp->mma.shmem_addr_lo);
+			mm_shmem.size = le32_to_cpu(attr_rsp->mma.shmem_size);
+			attr_rsp->status = RPMI_SUCCESS;
+			break;
+
+		case RPMI_MM_SRV_COMMUNICATE:
+			break;
+
+		default:
+			return SBI_ENOTSUPP;
+	}
+
+	ret = mpxy_rpmi_copy_payload(src, payload, payload_len);
+	if (ret)
+		return ret;
+
+	return SBI_OK;
+}
+
+static const struct mpxy_bridge_source_ops mm_ops = {
+	.xfer    = mpxy_rpmi_mm_xfer,
+    .complete  = mpxy_rpmi_mm_complete,
+};
+
+static const struct fdt_match mm_match[] = {
+	{
+		.compatible = "opensbi,rpmi-mpxy-reqfwd-mm",
+	},
+	{ }
+};
+
+static int mpxy_rpmi_mm_probe(const void *fdt, int nodeoff,
+		   const struct fdt_match *match)
+{
+	(void)match;
+
+	sbi_printf("%s\n", __func__);
+	return mpxy_bridge_register_source(fdt, nodeoff, &mm_ops, mm_srvcdata,
+					array_size(mm_srvcdata), RPMI_SRVGRP_MANAGEMENT_MODE);
+}
+
+const struct mpxy_bridge_source_driver mpxy_rpmi_mm_driver = {
+	.match_table = mm_match,
+	.probe = mpxy_rpmi_mm_probe,
+};
\ No newline at end of file
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 0ba79d59..09c2a313 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -34,4 +34,4 @@ carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_LOGGING) += fdt_mpxy_rpmi_logging
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_LOGGING) += mpxy/fdt_mpxy_rpmi_logging.o
 
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_BRIDGE) += fdt_mpxy_bridge
-libsbiutils-objs-$(CONFIG_FDT_MPXY_BRIDGE) += mpxy/fdt_mpxy_bridge.o
+libsbiutils-objs-$(CONFIG_FDT_MPXY_BRIDGE) += mpxy/fdt_mpxy_bridge.o mpxy/mpxy_source_mm.o
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
