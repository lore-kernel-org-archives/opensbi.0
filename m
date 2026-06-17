Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5D5CD98E4
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HiEv0HSFgbIHQEjLU+gzkeqKksKzdgZnmjBYzZyxhq4=; b=gFmJFEPOxTy0p9
	HJTCZXOzsTw2IyAlGsBiatNbyOOWJMSNKtsYwd1UA9nt233NcuFLIBfycv14KRLSyTtuxEo67teiD
	lSs0Lq09XdnS+4zJ9Rn0SveFBRbfhgJg+lo5cbEgmheKYVMIM1/k5HCp+u0z8jVI+XAC4tsxU+Fch
	Wqn1vVFsEQ1GJ4MoF2/Vj/3zy2ii67l80eEEDjGYbJtI/8ZfZZMMf9APy7uF9/OhRxif+240LbjcS
	czhldHI4eM6AW3em7V3QXsez/CUjx5ZmwCpafpw3+prfIqCiHzK2PHcohbvMBuvD79/40Iq/Y1oHF
	dMR6MSD12EO5cbBh2vag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmbW-0000000GxJh-0ZmD;
	Wed, 17 Jun 2026 09:30:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmbT-0000000GxJM-2YqP
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 09:30:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V54h2291274
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 09:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=obiWTs/+RM93+uIA7GVQHK5bYk7YvpSH1fB
	VecjeaZ4=; b=bHvjgt70TD9pU54nqMYIFA0geHni+2kaPpAbtzkh194iNDCYZEZ
	DN27yhrNbQFV5emIrAVHEKdhg9Xk0EAXfhUOol+/PizQ66AVDud7KOEw5sv2mi1r
	tJWXJdXg1iMdNS6FdiIs+jDqDYz6a43ySCxhSuZxyC1SD2wmbZE6zIokeb45bbz2
	JPhZ9T/FdNFMra3EQmTfXSDduT26b/nWjJ9YW0MBao6X5USeB3Il6uLYfmT558Wu
	0MAEG0jMBNqxyRu1GAI4F8eMEq58kTOTDgkjLtvgP+WdsL42OYRg8c52TanFZVVg
	/OHcPEZN/9ikrKx2qkYdDqySPDNlOVv/x8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjfyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 09:30:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befebfa664so9639915ad.1
        for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781688633; x=1782293433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=obiWTs/+RM93+uIA7GVQHK5bYk7YvpSH1fBVecjeaZ4=;
        b=Hf3yRCrwSPxddCqAgVkHtO8fzETy7Gg/7Fgu2co/YcEP8zyW15GubnndPcxAMFmXUy
         47AXijLbZacpKIQ2TPgy9wt4b9dvLAcnCunjvcfrpPHeT9Sy8miSH7yYhKWBwT3Bm3a+
         4XIkKCN8aNeKE1Lyiflt8RnGyltXFkOeTq4t7ABCZGazeiVFJEB5/2eXV/AvfC9rVTMl
         wDXLg/kMZr3wI969Ppwx/IWWBv6w+WFxrs5I1jChVFYFUa2U0N48BaKSw+SJWibQM9uT
         NLr/rVNsO4e0yHeZqjpopQBaZIJdAXtZuVLChiT5I0Thkpbl15qXPFrN41V3qHZ/bhny
         IOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688633; x=1782293433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obiWTs/+RM93+uIA7GVQHK5bYk7YvpSH1fBVecjeaZ4=;
        b=Jy/bONPOBCoxEHtkv1OV2f1k2VAVo0lZVVC7wWcBjMnIeo8XsCmYDqiDczvbI58QJj
         rRDp4QKF337+ymPTfOvzXisNPewtP69IpQBEwau3t++4vNmhvYAvzdmYQJ2QxfI++W01
         UFfwuWszQ9bAS/51do7cgGfGWGS2v0f2u728HoQXUEdiveqRQzSqmOlUOgDlnxnAISfC
         n7TGfzrwaxnvK/vU9Wb3DUJKFAAtxbf+IRgJIrjDNjh32LgQXCN9/3pfVNfzGDudJlyb
         wMC/nnfLqjC+EuqZCCkQwQOcbbJfflQXvk7Pp5nncSr+rhPHKQlRUmUqeNXXJB8353Ry
         u3gw==
X-Gm-Message-State: AOJu0YxNJ1u67iwPoQkH7mYDnSDIshZg/dZkfXKjqcjaY/5VbOdN3DBr
	hGPjqI9B1q3gUmK5z1kXvPWyv7Bnr7e9N/zmptKbI29D2AG+r9+DC8xFd1JH+Qsd1F7Hgi6L2Ms
	saI0zC+Yzl4LAOYr+cPW1LCKoL7l/gmRX2fvzAw2vQxy5MqJbnc+8aoMyN0ECD5fvKpGHTbQGFg
	==
X-Gm-Gg: AfdE7clStQ1OJtmDxGOPGDHwfoYiZyQHzui2igUNymcvWIecQ1OsJOjgNwTlBkbkSA0
	a7gcCcPbzQtWAqYkshmC+gmoo30RfwDvN9ZKteVxuesztfyhfJLIz1N1oJSFLMoz5s+A77klqxJ
	rMvmyia/BJZoENeNNIN6EwjGmK/kv/TIVN53m4Wwm3GNggC9Wqa8qA2A8ZKeCw0qAOXEdOwrZrF
	INC5KlJZQNoLKFrtbqxGEhQgQ9zjv0MXtWm+0ZFTvMDDPiBL3EGtCYkb7Ca+0C8y3i2NkYYTEEa
	5yDQDgn3l7NNO3XynmG8KUV4iYGbiB+SgA57b+ZvSEfuHsNR62P6ewaMia3XHp2Wu7r76MjXfQi
	1GXM/tTImuBTSnqJJWxOT+jUoXtL5czpUwhxHqON2C3GrJjEooxbQe3TWgBcQfGrj3WXCOeizSX
	IY2w6Y+oRtwSeICKS/8lXlDah/uvghFvIltY7EF01N1w==
X-Received: by 2002:a17:902:cf0e:b0:2b2:eb6b:72f2 with SMTP id d9443c01a7336-2c6bc23c695mr13896175ad.7.1781688633555;
        Wed, 17 Jun 2026 02:30:33 -0700 (PDT)
X-Received: by 2002:a17:902:cf0e:b0:2b2:eb6b:72f2 with SMTP id d9443c01a7336-2c6bc23c695mr13895925ad.7.1781688632988;
        Wed, 17 Jun 2026 02:30:32 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm37295635ad.52.2026.06.17.02.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:30:32 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v4] lib: utils: Add Logging service group handlers
Date: Wed, 17 Jun 2026 15:00:24 +0530
Message-ID: <20260617093024.667237-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX6pi+zKLe0pDA
 iklPtO+4gpn9IVVkwjdSMsBQfi+1uohQt7EWzVTGaZUe+IYsqNLO+PRfhplAR2jpVKk9dgk0FJm
 7/Or87bZR4c3dMtQpl1tvP1fZ4l3+eFW+oeni1Fkk3bt7siGZ43qgG3oeI3lRJccb2w7bLUZamO
 5DhXa4gB9Mi9wVhGqigj96KSDYv0xNHaj1WYfR3detR61OXyGilM9jMhMD559sxf6qJAg1vp/6y
 FyEET1G60LpsjM99faKyDWvklqQ6vLb2odhr1QwiCkmNoWprp+od49dKXk39GUQb1oohT8gd2ml
 mID7Ur/QHfeU/iKuEWe5SWDSa84sguqvYZaE1dkCbOi5F1EtGkhhj7zA8Vn/93EJkPH29WNqka/
 D7PHUPoykrFN8RTxwyf/aUo1Iw49ooncucj3lxTzMoPOdxJdhwvgqkcceMLexaJbmJ4Jp6lwd1j
 QTOUHlUfLTZfWt4gqoA==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a32693a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Geju9WyY0_kS-ZpFwSoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: V0mnC9saCoeByyq7ya15D6PcBBB0J_U9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfXw4Or2vU+VSMu
 Q29VBPXqH8LyhkCz17IECRyOIMP/anW4F9bU+V5wuAf34f09KbQM526C/W7ismPGWfFZyC2cYP5
 gExg0KzB8qmjrF3xV8MmDuvxQcSCNHA=
X-Proofpoint-ORIG-GUID: V0mnC9saCoeByyq7ya15D6PcBBB0J_U9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_023035_771292_BE1F0698 
X-CRM114-Status: GOOD (  16.44  )
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
index 00000000..87454975
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
+		.min_rx_len = sizeof(struct rpmi_logging_log_data_resp),
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
