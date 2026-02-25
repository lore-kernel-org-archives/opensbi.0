Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D2FF5545F
	for <opensbi@archiver.kernel.org>; Wed, 25 Feb 2026 06:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xD7HkDdVT9gvglRUQrKvFJpIjDU4Gs6Q2OR+dvXEZPk=; b=Yy+OQ0hC0RHDTh
	N9YQRYHK6APFQ0pIEA4+IU2q8wIxfqOTfpYcRkWN6sMjCkGJmf7MipsjcOMRqmulJNysI17VjhaYo
	pKIz2C/l8/vxRaIpL+LVxedCyW2TWwxKwCDouenFBYFhcKnKORWn7CfRk1LPyZ34DRQrsJud20q9+
	cP6SfJCzWYrRi+HTO2FaZHID+2y6WLlFLYXstVz3yXNENFa9s20l4R69etKyJ0CGSMfyOUcNl0+zF
	HwFIAIsmh3RK9UBbRpNMS3XfXpOSGquTC9ivzN5B6S+loSu1131huIMFz5Qclg9xBhePVryp8nB1K
	uZDU5D7dQRMH2WbELM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv89l-00000003I2I-2p2q;
	Wed, 25 Feb 2026 06:13:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv89j-00000003I1r-04qy
	for opensbi@lists.infradead.org;
	Wed, 25 Feb 2026 06:13:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OMjmI84044329
	for <opensbi@lists.infradead.org>; Wed, 25 Feb 2026 06:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z1MBlnJCVcRQfPxHozz2pXhCf81xffzLoK5
	gT/SDlCo=; b=Pe859u/iSlJDaHbPG6+28HMFPtNDIZfodxFae8EUbRmiAHLO7nK
	X0s87U6M+ySb30rqWksDvZJvyQoox8Ud7/d1FkK3EpXQln6liTKmROEJj3WP/nWk
	O09eXgqsMnhZ9C0vN3vsk0fIVPq3wZ/gaV0XaNfO+xIXmguDHGFsdWtbuZ5T9iEW
	uf9axbpYwh6WOYtya9FB9P6pOJ9IavAG1GI4KTE5tr/mcB5nmCEIDnHNgkCrJxsw
	VMZ99xtWzzoZjTmWQkAIoGDDcZGKOhBGk9yV8Xl09dJhUdW8WcNekkffjMREspKv
	hRARzb+qxN1WJ0poN1ECUufylmDkicwvECw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chexejdjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 25 Feb 2026 06:13:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70efa3b730so16298a12.2
        for <opensbi@lists.infradead.org>; Tue, 24 Feb 2026 22:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772000032; x=1772604832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1MBlnJCVcRQfPxHozz2pXhCf81xffzLoK5gT/SDlCo=;
        b=Yq6Z9yAOr7tWDk5Bs4Y86m2tFQJfQrdxyWfrl/JJAHQtiwJ+68ZcSDO6mj2XwBEQ/2
         BVxqMVOkbJoKsjlPATqpHXlQZSV26yDIVNv74EfrLHCcEBBSuWHQbPW+KBxqtmBTu5Ro
         PJOBj3MR0ccZoapK18a2lcaswSSvPgbqRNePsQfug4eNekuAAHA6FZujwCukPesPP2Pp
         1MQWdIniQ2LgSHcj6t4Bsx9BlcWOAND+9XT2GL95aA+4hk3ElRV2FJrtfw3NZQZM0T3r
         uPIQ3wmcckHHeEjFgnXiUZWcxoQGcNCqH8HIxG6G90t6mZ7EA0GVfKGUM10OJeyyD/PY
         yeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772000032; x=1772604832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1MBlnJCVcRQfPxHozz2pXhCf81xffzLoK5gT/SDlCo=;
        b=ticjaDRjyUoDlseDpJ7HlqCt9j2c5HmfmxVQ6ouVDIsWBkp/ztYVgvDiZClaR8D4ea
         9+zMCTLejegDF/5/YFjLfL10bcnXM7E3wiAaFYfjuHygwkVzCjmD2rC6bVFD8z1uaHBO
         E26Fvz5orRFS6BNJrBs1vEM+b+ik+UW2pgJaeaZaizp+IJ77v+FxyiH/Hvk27DqmQYqI
         SOic11pnXU10J7zD4BhW9NBbC7oOR/UNXKIWX3yAmSX54TfJbPYxfi4tGOyyA9tPQ+NB
         aMfT+N/kRP4wAJg/mAWimJFxNh8WgdbttNf1Kl64HAPB/4Xi3mLw5uNx2t07ZYcoUS7Y
         svjw==
X-Gm-Message-State: AOJu0Yz1jyslPiIDeOC1i4q/xBxJ8mM1+ZweznmN4iyiS2dfO45VOKOd
	Eftj+9vBOzHzcF+5kHgAdSEru44j82vomzbnY5B0vOWK09IvNpANakuc/jNCusS/feXzmM3psrU
	HLym6DNkRXNMCP3T5KQVzJIqAkSi1l43UTKXAVJOhkqqeY7uaPvxvqXmJAvuDe9lnjwXv7tlmJw
	==
X-Gm-Gg: ATEYQzwwmtxN+OcvhOdk7TSmBExakSWyvE3Ip6VfILel3VSlvZuTgXbPL8nxdLULNDF
	fgJD9hR6jXi2g8oFgdH9j2Wy6jmbVpg0AU28TILpGwn8rhBfpaarQ9ri9OMP9AyOmViKsaCX6om
	15DaXZmrFxUhkY5t7VuMQRLYmcNkBv0sQPVtftH0t5ejHaTB7QvwhxF6LDMYykBJwjzSd0pXvsP
	7U4H1I38TzDLWZENywancFZSFd9w28fGtQD9GhFGpSTMFYDZ5u6t69yMOfcj/ZPSLvFJRMwil/X
	eDufFYPHFP1ZyVzRRppURzxW8AG8uT+cg9R3BxIcGMcDQS0Pr6KqzrXSNWpSXnZsmUPliM4EHJp
	XpW1hCOF76ddx1q5VhS63mfRX8NgH4TJ7pO+tsyLW1uYDPj072bPA0D2i10bsNH/h+tZJPh+IkK
	9QVO1QrgVd2JKN8pyq9Q3HKN8YlJqBSVbqV91Wqmmy
X-Received: by 2002:a05:6a20:431b:b0:334:a681:389c with SMTP id adf61e73a8af0-39545e54a68mr14047241637.15.1772000031831;
        Tue, 24 Feb 2026 22:13:51 -0800 (PST)
X-Received: by 2002:a05:6a20:431b:b0:334:a681:389c with SMTP id adf61e73a8af0-39545e54a68mr14047214637.15.1772000031330;
        Tue, 24 Feb 2026 22:13:51 -0800 (PST)
Received: from hu-ranbirs-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359019780bfsm1638931a91.8.2026.02.24.22.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:13:50 -0800 (PST)
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH] lib: utils: Add MPXY client driver for RPMI MM service group
Date: Wed, 25 Feb 2026 11:43:47 +0530
Message-ID: <20260225061347.1396504-1-ranbir.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA1OCBTYWx0ZWRfX61axPZYL44p7
 LtB9A0WD0QAvWzLYsl0t4IXQF21j9DX0Y7woJDyShCk2Gbm+cnyXXSOfkhJkDZGwrZaCOCTA3Ye
 nPVZ5WcU2Yv0n+cnddicp1ih5aNbAq5yXsMxtIU7f2ZfC37YcGyaWMf20I1aia/6cZEcqs2ubHq
 utVHXbPV5T6LfYdSf0K4BN26CfEC+DBDMqbj9Wf6S6pJC2fnA37fFjZDuvAYLt6LqeYrYo99ZWp
 BZwB9bIvDVkVOygHUCtn8ZSQRbbuVW2rbc8nk1Ol00ttzh993/LPS6o/W3GQSkTxpCXHWFk2Qqy
 nPSUMEyxM0JPKDoRnylFipq9unoYppoygy2tJaVDZ7/66645UQhtKfYYsf/cz0y8nGxq+/N1llp
 hBFs6oZt8ONfLhVewHEj1GLiyk9W3ghaXO9YUpiA2ppqDxVo2NwNQtif1uxJ8K59r1f2SKVfLYX
 RBx25fY5UqLiWzWEyJw==
X-Authority-Analysis: v=2.4 cv=V85wEOni c=1 sm=1 tr=0 ts=699e9321 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vF3tV0oYDW5fJrcOub4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 4fNA8sJ9qD3FFyFPgLQ-VJDlCjuyN813
X-Proofpoint-ORIG-GUID: 4fNA8sJ9qD3FFyFPgLQ-VJDlCjuyN813
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_221355_195585_725077FB 
X-CRM114-Status: GOOD (  20.15  )
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

  - Add necessary infra for RPMI Management Mode service group

Co-authored-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h |  37 ++++++++
 lib/utils/mpxy/Kconfig                   |   4 +
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c        | 116 +++++++++++++++++++++++
 lib/utils/mpxy/objects.mk                |   3 +
 platform/generic/configs/defconfig       |   1 +
 5 files changed, 161 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index f8b16753..c35788f0 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -220,6 +220,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_CLOCK = 0x0008,
 	RPMI_SRVGRP_DEVICE_POWER = 0x0009,
 	RPMI_SRVGRP_PERFORMANCE = 0x0000A,
+	RPMI_SRVGRP_MANAGEMENT_MODE = 0x000B,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -947,4 +948,40 @@ struct rpmi_perf_get_fast_chn_attr_resp {
 	u32 db_perserved_high;
 };
 
+/** RPMI MM ServiceGroup Service IDs */
+enum rpmi_mm_service_id {
+	RPMI_MM_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_MM_SRV_GET_ATTRIBUTES = 0x02,
+	RPMI_MM_SRV_COMMUNICATE = 0x03,
+	RPMI_MM_SRV_MAX_COUNT,
+};
+
+/** RPMI MM ServiceGroup Get Attributes main struct */
+struct rpmi_mm_attributes {
+	u32 mm_version;
+	u32 shmem_addr_lo;
+	u32 shmem_addr_hi;
+	u32 shmem_size;
+};
+
+/** RPMI MM ServiceGroup Get Attributes response struct */
+struct rpmi_mm_get_attributes_rsp {
+	s32 status;
+	struct rpmi_mm_attributes mma;
+};
+
+/** RPMI MM ServiceGroup Communicate request struct */
+struct rpmi_mm_communicate_req {
+	u32 mm_comm_ipdata_off;
+	u32 mm_comm_ipdata_size;
+	u32 mm_comm_opdata_off;
+	u32 mm_comm_opdata_size;
+};
+
+/** RPMI MM ServiceGroup Communicate response struct */
+struct rpmi_mm_communicate_rsp {
+	s32 status;
+	u32 mm_comm_retdata_size;
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index 507b8371..1a38b792 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -34,6 +34,10 @@ config FDT_MPXY_RPMI_PERFORMANCE
 	bool "MPXY driver for RPMI performance service group"
 	default n
 
+config FDT_MPXY_RPMI_MM
+	bool "MPXY driver for RPMI MM service group"
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
new file mode 100644
index 00000000..0163d0d2
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
@@ -0,0 +1,116 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ * Authors:
+ *   Ranbir Singh <ranbir.singh@oss.qualcomm.com>
+ *   Sunil V L <sunilvl@oss.qualcomm.com>
+ */
+
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mailbox/rpmi_mailbox.h>
+
+static struct rpmi_mm_get_attributes_rsp rsp;
+
+static struct mpxy_rpmi_service_data mm_srvcdata[] = {
+	[0] {
+		.id = RPMI_MM_SRV_GET_ATTRIBUTES,
+		.min_tx_len = 0,
+		.max_tx_len = 0,
+		.min_rx_len = sizeof(struct rpmi_mm_get_attributes_rsp),
+		.max_rx_len = sizeof(struct rpmi_mm_get_attributes_rsp),
+	},
+	[1] {
+		.id = RPMI_MM_SRV_COMMUNICATE,
+		.min_tx_len = sizeof(struct rpmi_mm_communicate_req),
+		.max_tx_len = sizeof(struct rpmi_mm_communicate_req),
+		.min_rx_len = sizeof(struct rpmi_mm_communicate_rsp),
+		.max_rx_len = sizeof(struct rpmi_mm_communicate_rsp),
+	},
+};
+
+static int mpxy_rpmi_mm_setup(void **context, struct mbox_chan *chan,
+			      const struct mpxy_rpmi_mbox_data *data)
+{
+	unsigned long mm_region_addr = 0;
+	unsigned long mm_region_size = 0;
+	unsigned long mm_region_flags;
+	int rc = 0;
+
+	rc = rpmi_normal_request_with_status(chan, RPMI_MM_SRV_GET_ATTRIBUTES,
+					     NULL, 0, 0, &rsp,
+					     rpmi_u32_count(rsp),
+					     rpmi_u32_count(rsp));
+	if (rc)
+		return rc;
+
+#if __riscv_xlen == 32
+	mm_region_addr = rsp.mma.shmem_addr_lo;
+#else
+	mm_region_addr = ((unsigned long)(rsp.mma.shmem_addr_hi) << 32) |
+	    rsp.mma.shmem_addr_lo;
+#endif
+
+	mm_region_size = rsp.mma.shmem_size;
+	mm_region_flags = SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW;
+
+	rc = sbi_domain_root_add_memrange(mm_region_addr, mm_region_size,
+					  PAGE_SIZE, mm_region_flags);
+	return rc;
+}
+
+static int mpxy_rpmi_mm_xfer(void *context, struct mbox_chan *chan,
+			     struct mbox_xfer *xfer)
+{
+	struct rpmi_message_args *args = xfer->args;
+	int rc = 0;
+
+	if (!xfer->rx || (args->type != RPMI_MSG_NORMAL_REQUEST))
+		return 0;
+
+	switch (args->service_id) {
+	case RPMI_MM_SRV_GET_ATTRIBUTES:
+		((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_SUCCESS);
+		((u32 *)xfer->rx)[1] = cpu_to_le32(rsp.mma.mm_version);
+		((u32 *)xfer->rx)[2] = cpu_to_le32(rsp.mma.shmem_addr_lo);
+		((u32 *)xfer->rx)[3] = cpu_to_le32(rsp.mma.shmem_addr_hi);
+		((u32 *)xfer->rx)[4] = cpu_to_le32(rsp.mma.shmem_size);
+		args->rx_data_len = 5 * sizeof(u32);
+		break;
+
+	case RPMI_MM_SRV_COMMUNICATE:
+		rc = mbox_chan_xfer(chan, xfer);
+		break;
+
+	default:
+		((u32 *)xfer->rx)[0] = cpu_to_le32(RPMI_ERR_NOTSUPP);
+		args->rx_data_len = sizeof(u32);
+		break;
+	};
+
+	return rc;
+}
+
+static const struct mpxy_rpmi_mbox_data mm_data = {
+	.servicegrp_id = RPMI_SRVGRP_MANAGEMENT_MODE,
+	.num_services = RPMI_MM_SRV_MAX_COUNT,
+	.service_data = mm_srvcdata,
+	.setup_group = mpxy_rpmi_mm_setup,
+	.xfer_group = mpxy_rpmi_mm_xfer,
+};
+
+/* one extra blank entry for loop termination while matching */
+static const struct fdt_match mm_match[] = {
+	{
+		.compatible = "riscv,rpmi-mpxy-mm",
+		.data = &mm_data,
+	},
+	{},
+};
+
+const struct fdt_driver fdt_mpxy_rpmi_mm = {
+	.experimental = true,
+	.match_table = mm_match,
+	.init = mpxy_rpmi_mbox_init,
+};
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index bbc998af..9cfd86bc 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -26,3 +26,6 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_VOLTAGE) += mpxy/fdt_mpxy_rpmi_voltage.o
 
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_DEVICE_POWER) += fdt_mpxy_rpmi_device_power
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_DEVICE_POWER) += mpxy/fdt_mpxy_rpmi_device_power.o
+
+carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_MM) += fdt_mpxy_rpmi_mm
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MM) += mpxy/fdt_mpxy_rpmi_mm.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 727c5f4a..7e37919b 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -76,3 +76,4 @@ CONFIG_FDT_MPXY_RPMI_VOLTAGE=y
 CONFIG_FDT_MPXY_RPMI_DEVICE_POWER=y
 CONFIG_FDT_MPXY_RPMI_PERFORMANCE=y
 CONFIG_FDT_MPXY_RPMI_SYSMSI=y
+CONFIG_FDT_MPXY_RPMI_MM=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
