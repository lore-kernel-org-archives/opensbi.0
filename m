Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CE5CD8CAD
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 05:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hOedg8lRrr/p1mM/bkXXEXho/w71SHWCnOdkiOY/PjQ=; b=TlcoBWsLl4BAWU
	XUUeDGQXiRj5Nn6UnxdGkcydRWuVXhtPLmPf6tD6lgz1c2WxwMz+Nv6wqV25y20qvK2NJ17qw6GEf
	sZCcBLJESGHTvxPNG55mVH4/kaOEtQnDx0b/uLegCD/B00T2vdw1cpe1TorPLR06R2lo/8aZWtN+u
	LJasqU7849saP9xAGtu6jDB3cN1umZR9aJXLi2bGUPpokGhvv8aFreI26oHOyllMYs4CN8Z390KD+
	rqgYfsGFq8X2HepMZ6tvznrgzSLMF++cVAHrVV9Q5470vohOrGaqbekctGHS0R+1ogh0k+DWhJrVD
	qnzGmaywjJ3ahZuLWvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpTc-00000004m52-03By;
	Tue, 09 Jun 2026 05:58:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpTY-00000004m4g-3k6I
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 05:58:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wi4Q1438059
	for <opensbi@lists.infradead.org>; Tue, 9 Jun 2026 05:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=avTF57USxnSEVIs7y2jtOk4KqMzqA4Mh9zm
	nNvESdK4=; b=GTI+zBGtuMgaig0l3FCLtLvi1hwm2KeZ9lV+EJvdiAiE5SetyWG
	ab5/nO0vg12os9RXJlRnyMFoX7OheRIW9FMM9p1fjfD+NFRKsyKEshNwEAQ27DLO
	YxNCMJdviC568L87ONzDoDdH6bvrDIl4nKjp8zixxNsi4TX54soCmtKd+5BjzJc9
	I3UpM6nAZFkd6XXylnSk6ZPOIWMnyPtKpv3G2S/3szm91jhex7rNY9SzADcvqPFv
	dIhjty/ze+pZjyV9UMEKdIO7OIhHTM6EdqBNvoJrMpa1Hu1QND7gbrG8xM/dp0qm
	DpfKXnt/BRPr1Wco2My96LXXoDouRbaohYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptmkvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 09 Jun 2026 05:58:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf2247e3b9so11865275ad.3
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 22:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780984690; x=1781589490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=avTF57USxnSEVIs7y2jtOk4KqMzqA4Mh9zmnNvESdK4=;
        b=dEFj/TAk5N4eMox9LchuULfG8hEswDKCj0r7l9QRYJstT/cc6Sa6GrPm1rwcP3QCp5
         SXu3SWnxbbNBmOaZD/3FU212T3ApIyG7cLe3EPCDloF8xKyq7IZcYjIkeZtVEtirhqmo
         +y8J3OQV3nzj8tC+AKW8BCo9swV/34fLj39KAki16zzrEpH3iSA2Ui4f0iPaTwFGC2Pj
         26+d19dr/E5Pv3IE0xEkToQXHOkCU+ABEM45nztT+neJQMSCX3x7qe9IrTTh5DstPDmJ
         OHnAfrYd/s7LY4uhF+3svePapZMUTEwD7D5RdADM8J9u0OIwfF1gC69MQ2SsCqMxlkXN
         8XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984690; x=1781589490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avTF57USxnSEVIs7y2jtOk4KqMzqA4Mh9zmnNvESdK4=;
        b=YwBLvKcoSq27453Ft3LHTAOWgTmCbeM50zSly9AoILdHldaiPrVs27K3cuukoLhYoM
         z3lc1UAo1dMZoROYtuptSvEq/AZMEPjXjP5U/AJQNL1RY1rahQMAtgKfNRYnC7OfEIqt
         5tb6GljdbfSCl2iAAIweNe3E9nrSRsVBWg9N3U6T+0QW8Is0RK4oNwM+cin6WeJfz9Nd
         Glq9kpXlALGdEJJSqP31KXiQbjM6PflnicD9wpWFFPnJbbL0jvWPFzEXX2CJyUUIl/Mg
         xbodB+rlpdJi6fSs+1OU0PYOVp6eAK/08jkgWnmmiuBDM0A+J6H+d3ODivsDyVzv8z3v
         cMkw==
X-Gm-Message-State: AOJu0Yyq7MhnoJmXkBkdXArBSb4hiS8kW+Off5qgtmhEx7n+OtiJeAXw
	YhlSOwI+L/qt3eqFOqL7Qx6waZ2BSGehF24E6WSscOkQc0KT1WWl9vcOR05iUxObmrOUtyr1fyo
	bQsdAqFduiB7hlZya4cUZG4RZxjLrWyhDOwhk5CwWZWrX86kJiwEYQHg/dcW3Sxm7uabJs8QVag
	==
X-Gm-Gg: Acq92OHJNDMLpfnYKPuFKcckcR9tR0UIQXlLgRKKwawQtvPWESZ4Ni5Rrr53lb+t9PJ
	xNm+xnFU4R1p9jIzgR7tGgc5Kzs162W0DNUkvmuUJ8p/4gik8VKey+rQWf+H8XQZRgdsU0eJ9gA
	7QwrzhsOvlh7ovBxDBjJiUQbqLyfQ/FDsyHhSrF/D31WewTWwWIVTaSZllB3rliM0Sba+i2rGs3
	E+B8Ys+C+DL6aWvboY2yy+JbkBYnC+bN7zUoSexyi3SthsKCd2Gm6n2sEI4g7Gf2SWniemb9FM/
	u7uOhvyNydZ+vOCeLx5I6Iu3xsdZ58mW7dU4ykwNLeNRghhbfcsF5rGmJf0YJSgW7XUvZ0swDkP
	VdClbKNkM5iIO1F65uUkkg90J1tgQgn5eOSRUJ4ssobyphEH1wJxkWkvIERW/5hCNLwvEfS7wgR
	wp98PIQLVmTJU+exLefVOyeGLb46Y73BhZGqpzktCHZdEo4YmJ/Nem4GG1VE905Go=
X-Received: by 2002:a17:903:8ce:b0:2c0:dd75:e829 with SMTP id d9443c01a7336-2c1e7e71494mr100128305ad.2.1780984689554;
        Mon, 08 Jun 2026 22:58:09 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2c0:dd75:e829 with SMTP id d9443c01a7336-2c1e7e71494mr100128165ad.2.1780984689065;
        Mon, 08 Jun 2026 22:58:09 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm206004465ad.82.2026.06.08.22.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 22:58:08 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH] sbi_mpxy: Add Logging service group handlers
Date: Tue,  9 Jun 2026 11:27:45 +0530
Message-ID: <20260609055745.2443353-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: fZ1QvToXkiqnC01nY-enk4N_1-TBkZkf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MyBTYWx0ZWRfX+gphMEOLBs03
 rST20ve4/brHJSKz/Q6BHdoEzCdxYLAVNv/+lAXWrCXFZT32uBt9bko0sUBlOjz+TSTzcio+Q8u
 TkcERLGtfSr0dmWUM7iLbkMYmV2JMbfTvB/nympAhH08cuFj9FAOCm81Bss8MzalGgQBUNlX2B4
 I9ZmE+r0CRMz8RmnkLgUJF9IfI1rNGVaTi99V52QZgJGlg0Gziz+BFbsE/+ipBJHPXh93UYnbTf
 0PBeETtjNKWChoLvMdTiDUJlsOGWDgwVL6b+Iu7giL8zgX07XhIamYGQ2Y+hZpwPgKckf6zNrnC
 aIxwTATWJnjcWUrT3/cTjfhTwehPKv6wEeYlep54m2P1b4UW6ZnTxSg8+rpl7jZMqbHxSf0FE0r
 9/05dyDhk3zUDKzMJ8kTmxq+JhVrUaS8aq5+Pj76xGBOzl9MmK2SEWpMybf+bBsKME9Sx8B+aqW
 3TlU8w2kfzFPa8xKGQw==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a27ab72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Geju9WyY0_kS-ZpFwSoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: fZ1QvToXkiqnC01nY-enk4N_1-TBkZkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_225813_076145_E5F0F6FA 
X-CRM114-Status: GOOD (  17.08  )
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
