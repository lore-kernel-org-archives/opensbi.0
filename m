Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C0CD4F26
	for <opensbi@archiver.kernel.org>; Fri, 19 Jun 2026 10:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hDoNtxTux8ZnWJE5GNMzVfRkdD60VszSDshpquKuATs=; b=2Ob3tWSm2Lk8bm
	abD6qYYLHhYPJF/u6dBuJ74ZLkMLVE5eFIASuY7enJ2e1x/dR1CzDxrBQFuKD54mqf49GRA+MGma0
	hc+PCpM/Q3fAV3tRgQ0GQeIt+IbHfd1vxHnNnd8R4Lnrnbdh9MzKgvPspQSEDBr0YLvABVWxyizei
	Jcgk8ARo7oa7EbnLnuenDtyxQQqcUPfHWccNK0vrq28tZU9HKPtYv0zmH33wxk5taOTeGx8I+aMAc
	6cXo6st8KPxKMMSRlsq3qWoECC82I5G8oPRpww8c4pvZlIAAo+B38li8FWtCdjfUqh8l4G8lN7kUy
	qCmuivGwO9Pk9i/AgWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWYY-00000002I2S-46vm;
	Fri, 19 Jun 2026 10:34:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWYW-00000002I25-1jEk
	for opensbi@lists.infradead.org;
	Fri, 19 Jun 2026 10:34:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Q5LV4033755
	for <opensbi@lists.infradead.org>; Fri, 19 Jun 2026 10:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hBYvikcjb61kXq5Ge/NwChpvTeSDIGrb77k
	UxZkt4f4=; b=YlRnOQdWQJKz3I+mgHQ+iytCwV1PXYpQyMhxHY0ZiaO3yYoCWGa
	MsWIqNb9rQIRucs1sQqmRQMx4fwSt2c7a2lMIxON6vWhooArBSN13znIm7L6KXct
	J53oQ50Ow+UCEOygYsuGEL0WsRLwdrQl7M0Y3G8F8poe60vTfKNah5BrMuFsvrn0
	on4ltmkWe6aSsx2KIcl3HAxIr6YA+myR/xNQm2fwmHHGSGMAktq8MFy5buS/oYnL
	aiWgLHIR1FGy3j8GlX/44gU+OL/1deWPHpJfxSBGoCK/kjlCjIG2RXoowZwem/lR
	akndmasNNHje+QbdiGdoUvV79LSVE/WLUjg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6savmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 19 Jun 2026 10:34:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423efb5155so410809b3a.0
        for <opensbi@lists.infradead.org>; Fri, 19 Jun 2026 03:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781865273; x=1782470073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBYvikcjb61kXq5Ge/NwChpvTeSDIGrb77kUxZkt4f4=;
        b=dHuCYIVQEahLoJFQk5a9OixpuipfjsqELZCmiHZoyLqA5u3sEuWSCe06Ti2PIrpopa
         4aUFTDZ8lKOCHv8uLTzcbrlaG9EICoVwvXiBIJ4bc/m++TpmZkd7ubnZX7iWxxbZceEq
         AeQ89jkBH5RTpyNXhmqxYJALxEujKpetpZ31bN4PI+hDFFvOcQAPJkpOTmh/zJP+VFXj
         Ut30tTO1wnWI7QrRZqgOmEuhDrc1027rGNbE98wrgwPvp1rO9tYQEcj0t8QhQ1A9/7th
         /zrol0+t7zmZnLgw1rvBLiOQjxhsaeReIOzyN6lnuw1Lb8I1/3sYj/Qr08exHdgXR3uf
         tTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865273; x=1782470073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBYvikcjb61kXq5Ge/NwChpvTeSDIGrb77kUxZkt4f4=;
        b=LlzKwWUH9ToqTL+du9sK15z8Q2RO7tWXMkcDKR9cW6Ju8DZI2wZ8jDb6bD0LON6lVd
         KZgJGhFhV5URIrmP2kNfTE0xvSbAAhMyWti5W9Eew9YB+3psp3VjssDzh+lcLRjCEvUe
         Ufsz6ZXRPi6ROfEhVGptuOq4iIu1oXit0JVctpMax5l4siX97NHUHt9BrR3iYM5uxGWa
         Deq5dpCc7uCmQ+AEv3bd4ZEs/CkZQ6xnTte0HEFQ8Tp/Hf5mm42DYgJnxxUhsUCCrLSc
         AkUZe1wu4pP2emUv12VyWvTvhJPp04G9wbqXVf80Br+GkBpRKLXPCaaIHqY8M9VL9klf
         hXdQ==
X-Gm-Message-State: AOJu0YxcXc9PalfluEMGc8cWTS4XHDXQnpe0zle0Gl3W7fGaYmjgjVRe
	bc8knikP0+XrixCrzFkSSckj+cZUJS1itNhyye9ZxNM41D9ohq2D46kE4Mcj7TAPWtg0IbqnVjt
	MfA4ZAOWx7pm9sZjeBpWqoCJ+5ZjEQi5ecsCvhXJ/GxUsmqRpN5lZyN/1lrfryKFVCvJ+Pxl96g
	==
X-Gm-Gg: AfdE7cnD6AN4elU7jIrKe+6M0LCXkSuHMDfgDYVitdrfaiIh9Wx/AboSPj355Z2JST8
	Qa5ZKF5B9l1/GLwvSbb7Ng29S0bBMAsNYFe7eOWwIB+29mAFQpd8gvGqhRYpoEhQSnA5D9XrJRu
	57ZRoxEyUI+2Z9dcLu7EKDcP+0xS20mNUtxHNFQDfkt8umRl/ySGU4Q1gsGE21Hg0ePLBeWE5R7
	Z3FnqWTxq+xC4CdMGxG1VxyJbA2k20Vj7+J2nt8N+DIC1ot69KR+MKVLCyA51imrq92mQLFbRNh
	0UT2B43tcSDtpb6nh21aZGLiNm0EMnzt/MEUiZk9PnyJ/k9485nK6Ka9Z5SLMStKxt0IGLyJYui
	ayMOdavDnTNK1L2nhXlZ/Th+A2bzkz+o1Gxi0vewVuH9x1SH/+cUKnlzsP5sx79c7DTViBmbYaY
	ESOBXCgheZPY+jxFZket3wdAkvqzuMOWhpZhRvEPXYeA==
X-Received: by 2002:a05:6a20:7283:b0:3b4:7eca:a75 with SMTP id adf61e73a8af0-3bb3364d293mr1775488637.1.1781865273317;
        Fri, 19 Jun 2026 03:34:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3b4:7eca:a75 with SMTP id adf61e73a8af0-3bb3364d293mr1775473637.1.1781865272797;
        Fri, 19 Jun 2026 03:34:32 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382402esm2082884b3a.40.2026.06.19.03.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:34:32 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v5] lib: utils: Add Logging service group handlers
Date: Fri, 19 Jun 2026 16:04:24 +0530
Message-ID: <20260619103424.990954-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: koKrt44mx4YotDewOtqXcnU8V_8xEIBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA5OCBTYWx0ZWRfXy9EkIGHyRcqR
 kSy3Rzrk3AENb3lQtNaK5bFkzu+O26vDDGMjQA3kwb2DWy7A6y8zRrcUMBzRt5xL8XmhBPh6nyA
 IdXo1rYrP900eBX6+5EoytFlxIQxKbSLgxgjDHJEOwqaIC26VdmE4KkAKfcwR/H1Y81mApQIYiO
 wrxkm8wvKUMaN2gouAb3NgTdPCniOswg2oi7uEqPaa25Iw0vPXybcJpL9comFytfIWlvNzMEfe2
 SY8cOKWULUQPzIXNmpUNedFgD6OhdU4ujD1TgBAILK/kU1n+O37Rsgx2B8vhdafxMNi2dgvcdvv
 sNHEVQUTU7oOnI20PhW5+7EfeSJEv+mxKawnhtJC0pLfpR4dXEJaVgVY94ImBvpRDUnW+uxcQML
 HcunjJGt4c6KBufwz6UMbOiWt1xA3p5D7tEsM0Peue5a8LE5wVkaeAd3KtqGNjfYepfuabcfuEs
 i3cLDPSCBWk3ii3u4iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA5OCBTYWx0ZWRfX5RfYwydPdpJU
 TKaivX8k+eqptH8jZotGkdBuWTLsjsa9V0NhYV0uifvGrast46EPM182EN7t6jknQ7VVPGlk0GU
 18cJHBxFi+Nh7tgYK8URWgX74FrUZ5o=
X-Proofpoint-ORIG-GUID: koKrt44mx4YotDewOtqXcnU8V_8xEIBi
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a351b3a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=HVJQL6AAgKcqvbT_QroA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_033436_724897_B4D65252 
X-CRM114-Status: GOOD (  16.53  )
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

Add various services of LOGGING service group

The service is exported on MPXY with RPMI as backend.

Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 19 +++++++++
 lib/utils/mpxy/Kconfig                   |  4 ++
 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c   | 51 ++++++++++++++++++++++++
 lib/utils/mpxy/objects.mk                |  3 ++
 platform/generic/configs/defconfig       |  1 +
 5 files changed, 78 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 4fec6402..aeaee575 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -221,6 +221,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_DEVICE_POWER = 0x0009,
 	RPMI_SRVGRP_PERFORMANCE = 0x0000A,
 	RPMI_SRVGRP_MANAGEMENT_MODE = 0x000B,
+	RPMI_SRVGRP_LOGGING = 0x000E,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -1032,4 +1033,22 @@ struct rpmi_ras_sync_err_resp {
 	u32 pending_vecs[MAX_PEND_VECS];
 };
 
+/** RPMI LOGGING ServiceGroup Service IDs */
+enum rpmi_logging_service_id {
+	RPMI_LOGGING_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_LOGGING_SRV_LOG_DATA = 0x02,
+	RPMI_LOGGING_SRV_MAX_COUNT,
+};
+
+struct rpmi_logging_log_data_req {
+	u32 type;
+	u32 num_dwords;
+#define MAX_LOGGING_DLEN  ((RPMI_MSG_DATA_SIZE(RPMI_SLOT_SIZE_MIN) - (sizeof(u32) * 2)) / sizeof(u32))
+	u32 data[MAX_LOGGING_DLEN];
+};
+
+struct rpmi_logging_log_data_resp {
+	s32 status;
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index 1a38b792..a3ed1c22 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -18,6 +18,10 @@ config FDT_MPXY_RPMI_CLOCK
 	bool "MPXY driver for RPMI clock service group"
 	default n
 
+config FDT_MPXY_RPMI_LOGGING
+	bool "MPXY driver for RPMI logging service group"
+	default n
+
 config FDT_MPXY_RPMI_SYSMSI
 	bool "MPXY driver for RPMI system MSI service group"
 	default n
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
new file mode 100644
index 00000000..e8f085eb
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
@@ -0,0 +1,51 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Qualcomm, Inc
+ *
+ * Authors:
+ *   Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
+ */
+
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+
+static struct mpxy_rpmi_service_data logging_services[] = {
+	[0] = {
+		.id = RPMI_MM_SRV_ENABLE_NOTIFICATION,
+		.min_tx_len = sizeof(struct rpmi_enable_notification_req),
+		.max_tx_len = sizeof(struct rpmi_enable_notification_req),
+		.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
+		.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
+	},
+	[1] = {
+		.id = RPMI_LOGGING_SRV_LOG_DATA,
+		.min_tx_len = sizeof(u32) * 2,
+		.max_tx_len = sizeof(struct rpmi_logging_log_data_req),
+		.min_rx_len = sizeof(struct rpmi_logging_log_data_resp),
+		.max_rx_len = sizeof(struct rpmi_logging_log_data_resp),
+	},
+	/*
+	 * Keep a local terminator for safe lookup because only service ID 0x02
+	 * is intentionally exposed by this MPXY service group handler.
+	 */
+	[2] = {
+		.id = RPMI_LOGGING_SRV_MAX_COUNT,
+	},
+};
+
+static const struct mpxy_rpmi_mbox_data logging_data = {
+	.servicegrp_id = RPMI_SRVGRP_LOGGING,
+	.num_services = RPMI_LOGGING_SRV_MAX_COUNT,
+	.service_data = logging_services,
+};
+
+static const struct fdt_match logging_match[] = {
+	{ .compatible = "riscv,rpmi-mpxy-logging", .data = &logging_data },
+	{ },
+};
+
+const struct fdt_driver fdt_mpxy_rpmi_logging = {
+	.match_table = logging_match,
+	.init = mpxy_rpmi_mbox_init,
+	.experimental = true,
+};
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 9cfd86bc..1f1bf0a0 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -29,3 +29,6 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_DEVICE_POWER) += mpxy/fdt_mpxy_rpmi_devi
 
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_MM) += fdt_mpxy_rpmi_mm
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MM) += mpxy/fdt_mpxy_rpmi_mm.o
+
+carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_LOGGING) += fdt_mpxy_rpmi_logging
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_LOGGING) += mpxy/fdt_mpxy_rpmi_logging.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 01d112c7..b0b6282e 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -83,3 +83,4 @@ CONFIG_FDT_MPXY_RPMI_DEVICE_POWER=y
 CONFIG_FDT_MPXY_RPMI_PERFORMANCE=y
 CONFIG_FDT_MPXY_RPMI_SYSMSI=y
 CONFIG_FDT_MPXY_RPMI_MM=y
+CONFIG_FDT_MPXY_RPMI_LOGGING=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
