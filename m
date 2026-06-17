Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D63ACD98EE
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 05:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dxzLox+j9Qvjh+EEgP4ckpsDkiaAkC+lAKZxw/9PaPc=; b=daBoYe0VREaKtK
	YBfVuGSqXuc21fefhkMwF8jX1tLq5hRtC06R2NzCHtF08g3mrGxq0ARJAgU63sC35sCqkiVQ2r8SM
	TNumUvT4LzPNrzG1dG9CVq1mI0GHwIS5tkUTHKHzoC4PCa9Z3vxFZJ1pMAuOXt7HjNNrc5mzK1T29
	hBjNqttg6oCJOtsePcZhKwDIqfUMnkjugnWFD4xAZCdHYoGu8OV9O6Jzc4gfpmz/g55ev6Y7UvZb/
	8QQArmT0sIgQv/6Bu9CuMRaD4G2mnWOJCgAfssfb823uL8lChTH72yWBJH4tAknOaGJmcxVHT0bfc
	gsOCFo+/u9yNpoDcRbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZizN-0000000Gf0H-2mMR;
	Wed, 17 Jun 2026 05:39:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZizL-0000000Gezl-1udr
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 05:39:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLSqnR274468
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 05:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MOHPdAm7NJPT6a0Yp2StXSvvawToxvtAVHF
	K4yuEXh4=; b=I9M+kVuIlVgzvWLvnP5upbibwkQwAE5VQyzhJ4PU9yPBxkvzfxG
	NYkNOiQvEpYZ9qsMjh35LcLQN/L5iB+IHVIOKjlEcp/Qbsb37jMQNBN9Cm/1KvKy
	ugVzvovJezfg7unoKkE8Rtdlh4+W3IB9d63CeCksTj3vrQs4BrmLg39dBpCVYsO7
	FST4KT5Nibv3xTRiJNW1n3ozSJGx/VpnYQpINFn7DrtLBp8OZfzPgLXWpQZjiSbZ
	uYmEoe/23W6NkAIfnCWG2GE49eq7oBNEVCw0XJSADqDVEHsq6IcX3ocRtFlk7wSa
	TRKHW74uLpKRqw0Wb0VZdCQfxS2UrQBqYLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemhgtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 05:38:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c680ead9edso7832355ad.0
        for <opensbi@lists.infradead.org>; Tue, 16 Jun 2026 22:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781674737; x=1782279537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOHPdAm7NJPT6a0Yp2StXSvvawToxvtAVHFK4yuEXh4=;
        b=O7pvx969RYlWgMKUOyggU4cXly14LEjCfwZenlvm+klGETDy9M1XnFmEa6ya1TczQc
         +pQGOmvmhNGZUT5Kh2psKuU6AdPrcTrNdUpD9m8GyQ0BjRg52I67W5CjmOjYxsKwZhKW
         e7hMVIgzNBuH2tLYNnE9ragagkDbXVMv4AP603gjzGOFKepj+qM3k7K7xKWE1ysuoLov
         VF3n8Rh8CNWXJ/NI1J+2MnOmkNfiySZkLD+52Tl3f6SkFeOStbE2VfC9CyqD2c0y748a
         mFPh7oqlNFjIqqADVMZy4vkGf6VuwWy9AsYBjCbn2nkBE54ZxBJYpKGyDbMQiFM+vMQg
         SfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781674737; x=1782279537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOHPdAm7NJPT6a0Yp2StXSvvawToxvtAVHFK4yuEXh4=;
        b=O+p6lw63M37mRfIo/5OShAmTfWGmPDzJaxV5jIgky3/WrLD18/yHaM7Bv7odoLIgL9
         SIIXyqrLLmMuM7g36PsGPI2FLwXyCADOTa/lncCftIQ3Yj+++0vA4VYdMgMLEA94J2v3
         SCe7N+pCdvNIv3XyHdoYvQbsHtTiQVHC1BqwzewfWxPE1CTikEqBbkL+4duUYai5cPgy
         nA59SEhleTGvhD2oj6nWT8RP/Pj+vGaA7FC3PCE9SQkyDXZwkGd2r0qFH7KgyPN8ttt2
         mbUmixZFJgC4vKwkGfZ14kmjFJMfXPSRmnJLXOUktf2FUw+4qbTzCGdq55Tq358VJaXI
         MgFw==
X-Gm-Message-State: AOJu0Yy3eFmwnUrOb1dJqRycfaWbS7jl3a5czIMs5oR8xq73KJQ0joYO
	zVDhzkWuadfEdsrOE8BY7LZT4RNIF71I4ITc73x1spYla4HeOu3JOEjkEk9JhU82nmKRxGlFTew
	k44rRUs3C72BnfDgu6xnl75X5wAniNti189mPDy3H7tB4aSbxcFMpsxOb296jSI3m1K3FkTDo7A
	==
X-Gm-Gg: AfdE7clv853kNQeDutXKLSA1roT5+8xxizxyHetNlzvWOhJ5J7pSldQquwdSYMHG7ry
	MGTEf4vtoaJP4L8+1LhOsmPwy8AeYs6mVOjqHIFSMA49RJ22Yv4bK9kZmGCDPVfnTPOaxSunESG
	3oJ9JPSd/T1gjKChq7fe35+QHTADzBDNaypCU9sbcyYoyzsnD6ymA2G3V+YzBJjH+lWRPjXt5an
	4/+mZGi3iJW9YCojOZ6+JLmramiYHu+C0tFfr01GGtB2Z0IQckF1mbLpWCVqrJv45kFwzJJf033
	nP4P2yDrUe0ok3ggKBzWtNVc12NJJl+7YzDjRFtRZ6g8juEmd2GlCUrCu8T/oQW1CeaYoLz7JiJ
	fWgQDmU2WbaNF2//9QzLHXqfFTkCvbEC4eaLJM6CqK8djzbVYweqKIqvHYqqLyGcyFrrt+Mszug
	o6oarwXvfwVfKpy5dXQwS2naXdI+Bd6nLKmrJnGB6T7w==
X-Received: by 2002:a17:903:2a8b:b0:2bf:13f3:4d3 with SMTP id d9443c01a7336-2c6bbc9430cmr11222155ad.0.1781674737092;
        Tue, 16 Jun 2026 22:38:57 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2bf:13f3:4d3 with SMTP id d9443c01a7336-2c6bbc9430cmr11222045ad.0.1781674736588;
        Tue, 16 Jun 2026 22:38:56 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm12991061a12.26.2026.06.16.22.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 22:38:56 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v2] lib: utils: Add Logging service group handlers
Date: Wed, 17 Jun 2026 11:08:40 +0530
Message-ID: <20260617053840.4036602-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA1MCBTYWx0ZWRfX8gTXMXEeA7ZW
 B3+sK8V+uxr2a+I+j7xthsbr32iydISZ12W4NXpHlZQcdASfIPiB4dqX1trewri07oIdjudXSMV
 R80Hm88lKLE0xs/vZaTsN56Bhmc2NWw=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a3232f1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Geju9WyY0_kS-ZpFwSoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: amNLyzjd4Mw49jIwabfu52BQytBi-myY
X-Proofpoint-ORIG-GUID: amNLyzjd4Mw49jIwabfu52BQytBi-myY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA1MCBTYWx0ZWRfXwoRq2c2an/qa
 5P06lVktUuF9shKZ857sdikKYW5o7H7kpuC2hfMTaTH2YNIZ3JoKMfzY3PFhsLVDmQvsaieFELu
 C8ZqwBKaXq35rq/dZOpYWcPGC6kpBB/FE2cgFkMfNFPTp5EZ2xZhm5CEa/2463mMb2EhOiw82uz
 6hzCmYj4orPNT9ay2aGXH/boS1L4oAixIm9yP14bRulc2AwOxcFaqLsRLSZuNctXhXw9Z1STtOW
 Lq2OCASZH27VB1NAytU9YaENSX/YpzetQPcUPvq6PbDhxHORlMiIR1dkUx4TZaZFPSKwOXDOW2c
 Lr+8cnN8mU7iqj/jc0Snf/tv8fiDp0kaGlE9jJIe2a8j78T5lc440buQeYK7BVIuv6dCdGGjFiX
 R32ytGGT/LcMw+btbrCw7kzBFbLZsXCAaCojakAK1WGxmuUkZcvyNvVmX78YvS+Sq5tqImpI21x
 LA8sVMYYDV2jUxdKbeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_223859_544811_2E6BB258 
X-CRM114-Status: GOOD (  17.09  )
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
index 4fec6402..b034b9b7 100644
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
+	RPMI_LOGGING_SRV_SET_CONFIG = 0x02,
+	RPMI_LOGGING_SRV_MAX_COUNT,
+};
+
+struct rpmi_logging_set_config_req {
+	u32 type;
+	u32 len;
+#define MAX_LOGGING_DLEN  ((RPMI_MSG_DATA_SIZE(RPMI_SLOT_SIZE_MIN) - (sizeof(u32) * 2)) / sizeof(u32))
+	u32 data[MAX_LOGGING_DLEN];
+};
+
+struct rpmi_logging_set_config_resp {
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
index 00000000..7c930360
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
+		.id = RPMI_LOGGING_SRV_SET_CONFIG,
+		.min_tx_len = sizeof(u32) * 2,
+		.max_tx_len = sizeof(struct rpmi_logging_set_config_req),
+		.min_rx_len = 4,
+		.max_rx_len = sizeof(struct rpmi_logging_set_config_resp),
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
