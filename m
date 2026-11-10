Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D70606A321
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 00:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=afnBfjM7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzVweDa6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZJWeENZ9gMRGY3XgqecofBeIzEeN0Lcgu09vSPobEpA=; b=afnBfjM7BSd45wvxA0z+4qlhEk
	1HDIbhh1I3k9AJ/Un2+YCJJYHJezlXxwFUh6FC22tyF5RGxyDYBVFcrEbiM0wjO89igx/2h5FlmTH
	C+1MWl/ctcJ4N3a10WaL3HbxKjT7t1HbVJMKlUcqDcfXGPSew5w3CDZORFZA0I8nGmKzvX0tk7KYU
	p3YPHRYyYbRkO82wwAtAjP2v82hhL9z8Yp061eV7hglkHTykOtrrok0E8uf1oWnxfp97jQVePnidI
	FNNS9w0hPUuDwNsc3/hFNUbJ9o4TZcbuGmd+LE3QAirpFs2uZk3/GEPlnScDWPGbjPYUEKjBqmlSG
	E0RWbKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZOF-00000001zaG-2yJw;
	Tue, 10 Nov 2026 00:07:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZOD-00000001zZD-0cG7
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 00:07:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA725436186;
	Tue, 10 Nov 2026 00:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=86yKyLs8Swl
	0UPklkeIyQdDlUjCOE9I1rhNH7lMslUI=; b=CzVweDa6UqOfKwcw+dCEXSDCZcX
	ErUT6Pml9C9KxRXFng/ZF43oNOkxzsr1YgDO9cXcyOf3Q79ltmzouf9mXtLHLzZ3
	G3iy4PH8dm2CoJvO8xgh0fM8PiSo4zoAwrSmoFSfbK9t0hOaCObxHnIXShP5fUvD
	fr6qe9C24ggycQs02/bEtl4++8KeDGWD8ez59bI8PwgLv33xatk3Vyp1r+J/RzDd
	vop46diKsnHZiBMMw/yAtmQS/gQJq3nVHw+Irzu+7P6LCMb5K7hM0v2gP3YTz3ZM
	OFfMa9X4YAjUNz20pheCcyZnKNoPm76efGSKL4qT0gvFFqdVCVDpy60KLEA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjajp5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 00:07:03 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA072vv2721701;
	Tue, 10 Nov 2026 00:07:02 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AA071o62721654
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 00:07:02 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id D97EC24E0A; Mon,  9 Nov 2026 16:07:01 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v7 3/3] sbi_utils: mpxy:: Add MPXY RPMI bridge MM driver
Date: Mon,  9 Nov 2026 16:06:52 -0800
Message-ID: <20261110000652.1298076-4-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110000652.1298076-1-pawandeep.oza@oss.qualcomm.com>
References: <20261110000652.1298076-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 0NJ1knmJ_EWXsre5IZuFjIkGbYMhQPxd
X-Proofpoint-ORIG-GUID: 0NJ1knmJ_EWXsre5IZuFjIkGbYMhQPxd
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af26027 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=RRwz4WziN3RAixcbr3kA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMCBTYWx0ZWRfX1ZkBmZiBn2I6
 IfLif4oIkNDpw1wQ8NdobUsXpBbnR9k06XC1ukD1DKBzCkJSLCcS39D65XS582ox0cbI4FRymhi
 qHwHBtJUTyQMA3N7Hxj2KWeNvCXJJzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMCBTYWx0ZWRfX3k+HfBTw1D3r
 aAbUV6Fmd3Fyk+uU+3NYw1A1/ErVesbMuS1KCmUrXUKx6cvkLV5sXv73QbYJ+UccWbkzM/NAn9b
 ZFmvKa7suOV/HxEevo1F8oeZQ77AjWAN/9WcOzYFcR31s5evv2Np+xTC+EAiYKLWgVfwJbnO4fw
 jDWMi+Kc81y2n/ckOF9e3fi0qX71CYgqeoazPc7YZwD+COPptTKu/cGEeqeydmQbPbfY/s1V9fT
 X7K8bnLAIW7NLV/LXa6RbHpYElQZjZvOMj6Uo+zyGdwFTFtG3CTb/e1Z7aPK9xe/yKqH09jD3lx
 XOyjjlZcNl2/jXY9i2VoOcg1PLhqGqvARafoWvM1pAdfqen4QZFNeRd/5M24Z+ULlMQXJT8IzLm
 C/dzxT2MtVmnfVMjt5mqKpRmDV3pt13bHkHxQCtAyMGXABbIT8RqKfPolVbcX9ncKaXz8PqwBM1
 vR6QxKq9OzEW/z7sWPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160705_199209_FA0035CF 
X-CRM114-Status: GOOD (  21.76  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
 lib/utils/mpxy/Kconfig                   |   4 +
 lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c | 208 +++++++++++++++++++++++
 lib/utils/mpxy/objects.mk                |   2 +
 platform/generic/configs/defconfig       |   1 +
 4 files changed, 215 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c

diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index bd25796a..ee4feeb1 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -11,6 +11,10 @@ config FDT_MPXY_RPMI_BRIDGE
 	bool "MPXY bridge driver for interdomain communication"
 	default n
 
+config FDT_MPXY_RPMI_BRIDGE_MM
+	bool "MPXY rpmi bridge mm driver for interdomain communication"
+	default n
+
 config FDT_MPXY_RPMI
 	bool "FDT based MPXY RPMI drivers"
 	depends on FDT_MAILBOX && FDT_MPXY
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c
new file mode 100644
index 00000000..19d6767d
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c
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
+const struct mpxy_bridge_source_driver fdt_mpxy_rpmi_bridge_mm = {
+	.match_table = mm_match,
+	.probe = mpxy_rpmi_mm_probe,
+};
\ No newline at end of file
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 488116da..6fc68099 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -37,3 +37,5 @@ carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_BRIDGE) += fdt_mpxy_rpmi_bridge
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_BRIDGE) += mpxy/fdt_mpxy_rpmi_bridge.o
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_BRIDGE) += mpxy/fdt_mpxy_rpmi_bridge_sources.carray.o
 
+carray-fdt_mpxy_rpmi_bridge_sources-$(CONFIG_FDT_MPXY_RPMI_BRIDGE_MM) += fdt_mpxy_rpmi_bridge_mm
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_BRIDGE_MM) += mpxy/fdt_mpxy_rpmi_bridge_mm.o
\ No newline at end of file
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 447f3504..7d5a206f 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -89,3 +89,4 @@ CONFIG_FDT_MPXY_RPMI_MM=y
 CONFIG_FDT_MPXY_RPMI_LOGGING=y
 CONFIG_FDT_MPXY_RPMI_BRIDGE=y
 CONFIG_FDT_MPXY_RPMI_BRIDGE_MM=y
+CONFIG_FDT_MPXY_RPMI_BRIDGE_MM=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
