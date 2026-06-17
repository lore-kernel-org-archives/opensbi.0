Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE16BCD98ED
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XatRz+KMOqhli42j2ryIFNPCZaE2zupBfZUjkk80bPU=; b=Dp1r/6VniTWC6k
	DmVwFB6EvRGxCiklteuvtFqDdRTUIr7t0fTySRACtgF7SNYj77iaxck2EWWJzj2PC2ehPI3bjAuNw
	GrAjdRmajSXXrKoXJmsjSoePDPYm4KytJAWmHR7VoNCTVE97hZulNCWuOjlLjxce0mNqAPGp4OgW0
	GJeJXcSFG4XUU5udYXGZ15K6hwcamj4J71NDAYw4DRGG0SP1NbkogtEzEmz0LJlz5tflhaTJO92D0
	n2ZkRwXBlmzAXHOFqON9EXqUtXX0oSqMJv07WTWaeGqggveyfc/CP+rrVIk0VTs+hDKFYu/Lt6TTB
	vJS/rxwgfOj6iRNaI3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlOl-0000000GrJ0-3qy7;
	Wed, 17 Jun 2026 08:13:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlOj-0000000GrIb-0VVQ
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 08:13:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H6OEud149710
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 08:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hq/Dc9Z78XEBtbA9t73pWVTYJQeLhQUgvzF
	hWEv+3Iw=; b=etFE7PExj2Ferx6ramUgIIzT39K4ncrL82miGthkjPB/GM3mGIJ
	CIZ98S9GlqLaOPhVxEh3Jf9Rg5CxoeFcWyGxiIvLMdS3nELXG/36KIF9midRU3Qr
	PdDSehcKeCoCnuY6kz9kumTHOwdn3NOe5/u45+7EZqq9cHFs+kkafNbCgPqTIuz2
	gfyjjshGuHbVhWbi1/YRgoIigrRXOIw4KzGMZ0BeMOcUMnAuWWWb8QtuCvvPGzAv
	UyFzNDMJ2qCoQwMRxSU9qmb6S/v/SG/uGfMqW5xy2FN/2+EOpIhb5Bz9SSTuBuIe
	Mf7vv7qlPkkFXoH9kLf0NHAaPuPEQCEj5XA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef223st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 08:13:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c318546dso6197205ad.1
        for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781684000; x=1782288800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hq/Dc9Z78XEBtbA9t73pWVTYJQeLhQUgvzFhWEv+3Iw=;
        b=Fp2ja1OZBN/YXZJ56aU6QSPBtkv1P6xHmxFQtKYyn0OC2TJW0SpqUicMpqVTwe6n9v
         GmHyXK914P6ZnbAsjMX9nTciF6bOQT04KZtOq2d+oS4zMohg+ufQMRDwFFuu5VZUPBf3
         omoSMJMWCLGM1k7lXlK1koQDCR/l/gKaskzRIxMU1YDb3Sl0kEowruEv+tCo9FQXf5eT
         amWe+9mz2nVBa5l99s35Csx3PQtLWpgogNJTO1DvBfdCkTg+iCmL4QCO2hg052QoSW1w
         yTMXSBkDQ8P3yypv814fu4kLUmlMoGj/vbg/T/qF04nlpAd9I+5CdAh8no2YhRdZof9M
         YCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684000; x=1782288800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq/Dc9Z78XEBtbA9t73pWVTYJQeLhQUgvzFhWEv+3Iw=;
        b=BYJXKEreD4U5A7cz5fphmK8BPFU/3ksbM5ot2FwETlZGbrU0N66kjFq5zmODGU0tds
         E00GlF4qhWZVoBoq/Rfvgq7Abtvle6X9sq3KdJaH0vH5/CCFYRVBwWy80wt6t3UbtE3r
         hUK/5DWGddEiIi5W14LSnaccKV2kj5/qcb3ZzZ64g5mgTYLjuG4nsF7t2Vx1NG83p30u
         sqFvxtfrG1g0FoTJwMuPXXEK+vU5YY0Dq6PnuKlbdpJHUNbVzSW8e+xfpDskKXQSSmRf
         ncZvVlcb0lS3pfFp+CpGfMqOjilIE7ZUAnJnf/NlxIZV86o4Se7nI6q+GDGSQhfpslWE
         njmg==
X-Gm-Message-State: AOJu0YxFpjvcUMPnK8KD54yQ7PUJp7i/FLH/Ww5bXyuUy4qELW3Bfwv7
	6m3jPUFkn6pZXS94ZVu13lA18ahW/Gg7vFUwjI0XMEpiw0rZVFcD9HeUOEpu5PCmWOThPtSIEQm
	US/LMP0JZKfp0zZuyvCQ1HnqLjXGn5UG1Z0TteOwZhAhRyj8TT18HikVt4+LoLR8yZDbITJyKcw
	==
X-Gm-Gg: AfdE7cny/1mz8HOMhLXGK/uskShderYp1iANovEoQsh3whX1FzMFyNGFct+rY4j7SUi
	GDdaQjs1tH8g22bpApQeUt4rXct/IlQ9Gha7ZsuNO0KfZJ/9JoOgw6tEIRn1ISDQfdn40pFRqEk
	ItcXl6/0EPyBKebjYlDSfcvoeHuzoFkN43OcwWEwb1/TRo/b1xEC+WQKdaTNaGEZVToEm2SEMvl
	cj2iX0rhkAQ78Uifo21mZoO4GY6XOyPo7zggr2/NoijmS0JdoHGimB3Y+XF0KWXtNdi8yzqrXU8
	rQWxWgcoOUu/UdKAd35Ci9kfjz5GWKjwiQuSZ6xaTUuLeSyxNPzJWitc9vCE+lgBoS3htc1MP4w
	iBm/CkyBSqHcaKpQJnGYKJzikF023lHdSerj/BAfQqQ/fxT8gDJ/PpqHPd44a8PWgMXJmHS+Mkk
	YCmAuxf2i0D2dEljVKSDlZenByHIhPUQfPFE8GulRoAg==
X-Received: by 2002:a17:902:eccd:b0:2c0:c262:b928 with SMTP id d9443c01a7336-2c6bc0978d3mr11906685ad.2.1781683999801;
        Wed, 17 Jun 2026 01:13:19 -0700 (PDT)
X-Received: by 2002:a17:902:eccd:b0:2c0:c262:b928 with SMTP id d9443c01a7336-2c6bc0978d3mr11906575ad.2.1781683999298;
        Wed, 17 Jun 2026 01:13:19 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a43c9sm158628285ad.41.2026.06.17.01.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:13:19 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v3] lib: utils: Add Logging service group handlers
Date: Wed, 17 Jun 2026 13:43:07 +0530
Message-ID: <20260617081307.429101-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA3NiBTYWx0ZWRfXzuY360K6NXq7
 dpBAg4Y462cVZfYtQflunEcvthWy07ASFVPPE/RxtWBG71MCHAIzPpBHiiEBSXX8Kwzo11VlMKh
 kgjYRaLL3gG4w1/0VZwxfGKtUHWF/xk=
X-Proofpoint-ORIG-GUID: EzJBOKVdmO_kLwC2shZH0_E2ymuojyYI
X-Proofpoint-GUID: EzJBOKVdmO_kLwC2shZH0_E2ymuojyYI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA3NiBTYWx0ZWRfXxuRyyaAs/m54
 CmjpkTNrrQV1djzjZyrPMf6jWkcRLCiHe6yLZ9V2wODIUVxMPt2k26kyDEKXkomn1C+ng0IIhCc
 lgrz4uW6n2CkIAsaQvWGjKg9tHfFMUHOvsniAWOo0blYTpaaWwckrgqTxvZ/d8fN9LIC2Qx6pt0
 KPYV6RbozwqmL20a7Fjru66JfBwFSLDHuM6m1lZHrQg1NzV1zhXK+S4CaGvc1uhv7/kKjtZk809
 AYnQXf44gv4v8iWfyvrMKPaYUDlD5fJWdvt6zQTbNCutNFKgMAsfU/OIAvIxj22jk2e6MJIeCcR
 AeDv6hApqQblCBmi6x47pFOF55ngWYTXm3F0w5Oi7tW+9T/0n6tH55P/Yq2OCeChvk3WANehoR3
 ZnCAGXyLa6iwsZOwYv2iccwT+jdSlC9Rh1bZCh8e17lyYMz67vvJO4j+y11B+kVOTK7/gqb5iT9
 QV6f3W2xfjKnySuHNhg==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a325720 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Geju9WyY0_kS-ZpFwSoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_011321_164012_173FC8F7 
X-CRM114-Status: GOOD (  16.35  )
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
 include/sbi_utils/mailbox/rpmi_msgprot.h | 19 ++++++++++
 lib/utils/mpxy/Kconfig                   |  4 +++
 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c   | 44 ++++++++++++++++++++++++
 lib/utils/mpxy/objects.mk                |  3 ++
 platform/generic/configs/defconfig       |  1 +
 5 files changed, 71 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 4fec6402..a51250bc 100644
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
+	u32 len;
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
index 00000000..dbbe33ae
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
@@ -0,0 +1,44 @@
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
+		.id = RPMI_LOGGING_SRV_LOG_DATA,
+		.min_tx_len = sizeof(u32) * 2,
+		.max_tx_len = sizeof(struct rpmi_logging_log_data_req),
+		.min_rx_len = 4,
+		.max_rx_len = sizeof(struct rpmi_logging_log_data_resp),
+	},
+	/*
+	 * Keep a local terminator for safe lookup because only service ID 0x02
+	 * is intentionally exposed by this MPXY service group handler.
+	 */
+	[1] = {
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
