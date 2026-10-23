Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA889606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=acV8G8BW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GPopHADy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G4MNitDJM+/zrW84SjKklofx7539yeyu/xLy7Zc4PN8=; b=acV8G8BWKrABXThOPa1k0jaRaR
	rOLIeZZezkWMx8Et/RDc9NUJOchQDo3dAs82/SGRl/RzjVg+wpme3YFsbvorTOPazKmE+OFAxTv/e
	nq/H+g8md1x6bFPqdsBtDpO/rTs2LhvJVToeUVZl4qT2yWdViXTBpiBl5z/mFannBiH+cr+tOwACT
	OO5bXC1LvgWbU96VBBs3vFNiJKdu0gK9XJKuOUT4vgROeF+9E79ecgDFCRGRMpdWzlN5y9vK9VdJd
	IJ6qU86ZhKhWk3scn5T5epFfuevw4iUmGFseZC8jFFHM933lYNr3iwhEU56dXrCvD+ut2Ev85nU2h
	6N2jiADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMhm-0000000GzG0-1yGA;
	Fri, 23 Oct 2026 21:21:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMhe-0000000GzDc-3KaT
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 21:21:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIZO6E3603455;
	Fri, 23 Oct 2026 21:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qpmGrTrAumc
	iC8XFCVCt4V3MD2nOfnyjBxOiILx3bxk=; b=GPopHADy61CPAAGHJa3vwOHEfTT
	jrXxhDSgVUp0UhfRsiJg/2w9nD016zboYJF+zjrmsQwrZcE1ptY4rDm4T51SxieF
	p0LR2/08BLfNT5BzMmS8r+P6NLPJDmSBv7rplp+JaUAQYL4zvvGjQ7CLDMnRe2Y0
	C9Gkl/4JGxtTnOpKx8YvsNTewe8c89g24KBBRdX+dH2OPooVqGhkJdQOWjIo6AaB
	vs1S0H4PhJ+ibds7Wta9tXLCvtx8KEhv/dFbz7uddUF8jEP8EFF7/ctr+SHYLo/c
	D6CzIDDi0w0IK08bp2gk7Nh5AO18B25lTf3DeMpy9oGfjngzA8wupkVQKWQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcs7gjk5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 21:21:28 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLHxBn2491667;
	Fri, 23 Oct 2026 21:21:28 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 69NLLRIh2496021
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 21:21:28 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id CF0FE24CE7; Fri, 23 Oct 2026 14:21:27 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v5 3/3] mpxy: Add MM source driver
Date: Fri, 23 Oct 2026 14:21:26 -0700
Message-ID: <20261023212126.1914666-4-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023212126.1914666-1-pawandeep.oza@oss.qualcomm.com>
References: <20261023212126.1914666-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA4NCBTYWx0ZWRfX7cZPSyDvN75g
 J2+3lmxeQUGSoECUfHAGxCiJwZ9CzOiul+zfgypIu+cxOS0ompn4enh1Y5v5ewA4MFScCwjllco
 ifciRsWHyK58NtZgHjlrxkZ47usGDK4=
X-Authority-Analysis: v=2.4 cv=XJCl2ghE c=1 sm=1 tr=0 ts=6adbcfd8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Hvk66tuYxJjxctRP0WwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA4NCBTYWx0ZWRfX8pCO4xHT5n/T
 i5obN3VhkENjy1rkWVqPpPe+nU7YVET6NaktHr8qcEK/4wn4kaWWFbtUdlk8fON1SPoW73cwWII
 a6aNQVC9pSKrg5lL/pOH01WPdzPuch+e9y+Dl62JulLNS2D/XuwTYljN8drCeif603ygihiv3Mn
 lWCoEZxo9SLftQAL1CdVdTf8qdq+OiLXxmyyzqPcVKP1DXMdbes16dJci2P7k3vRXZq3MXX3+uH
 M3M/tTWy5SOP/D+aEpsfKixHzLEILy4mA80/ap3YLfg0neuYcIAqD1akuOhcU+5ooXQ9Ku796/e
 1BEI+2T+VSHdTh2yonTYxO2PIcHd7tGxgPH8Tm8PyDwPziH/4qiA2TG7XqnFxmma0aG+oPNRTmJ
 X21+SC33/jNQWwPtqJqH7aaOxbr57Dj7oxXtCygKjbNkpfKKQuYDXmnghAzRFI8vj9RV8yMe2ZK
 8VZxYBLx27lL54rmOHw==
X-Proofpoint-GUID: ev7k4UtjKr0Yuvjcuwy2HX-pkhb5c8qJ
X-Proofpoint-ORIG-GUID: ev7k4UtjKr0Yuvjcuwy2HX-pkhb5c8qJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_142130_851282_9D25D5A1 
X-CRM114-Status: GOOD (  22.54  )
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
