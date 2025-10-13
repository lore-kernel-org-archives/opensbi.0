Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E9CCD18D
	for <opensbi@archiver.kernel.org>; Mon, 13 Oct 2025 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkE/Vv3GhWDx6HZWfpFoAPO1IDT+BxswhH3730nYtsc=; b=XbKW00QhEQahRL
	WXP8nv8pa/8ot0VMFWf7aAX15ioeiPVhTce1NBy3ThPodl0fU5DatGjf7GVTKNAlYBWCG/2fd1EDM
	nQkGPishrZ7OjzTPg6dJau8S8pgcYIEDm6SFggha1QSdv2vEHhW7CGIqSpaQxKVj83zU7vBtI6a0N
	NlNntu/dU/OuWxJYq4Vf7/08s6Ho0YD+DwJXlnRxJUefs7bQovuatSuAF+jnUYZZ8/jLMu3EmhdRY
	P5aD6WMnTH37TwvPAkZ0pStD41gh9Pd5yzCmacnZx/M4yviNfSgziuL/wl7f4N/zb3R3OZw2H4beW
	1UA75N1O6lFPvca62WLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KXT-0000000Dh0O-2on6;
	Mon, 13 Oct 2025 15:32:43 +0000
Received: from mail-bjschn02on2100.outbound.protection.partner.outlook.cn ([139.219.17.100] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KXR-0000000Dgyb-3kvC
	for opensbi@lists.infradead.org;
	Mon, 13 Oct 2025 15:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpEvjijraxMAUvEHdbOuCPo9pE6uOdqFnnNMYNNO/qZNYaA560N5kdi0fnW8wYI+kCkbHCwPDstr3WW7FmQLeCbadR1NTWb3Beh8aYC48jTAsJBtiOOeyvKc0z7FndjoDyK45nbPbzCIstYEFCcEwvvHEvfrAVHQtXaovci7tIuZSKgUdE+q6L/uYTx8ZOwJ9RgXcqFO+2MYBMyiXKkW12aUuJngg49itOr8EDXSvZ4BdV1cut8D+qyulpDHW4ZV+MKAZmCsuQHy9AuonxAEFLNAZ/fCqyOg8CeNiAcz6uU8OWOWT1htriYPJcQ3y/8MGmdpfPja+niWJQlHS5N7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEHdRaqBgmL5/ivUf9617SYLcCU5oEx4/pcgaB5c/Jc=;
 b=PrDhcywQg2/ajmjsx+b4uWa0MITncKVgiU/DsO0U1m30J0jPRrlkantanGFu1lO/2t4FDIY+btHan6Y3QrC7rbDpviE3iwixK4HuHvJhX6rUcz0uiJ9WGR1tkGLfwfgK3BJyOpZ253s28hHqnT6HKhGunw8KNFaTcRR7MQELrOMAlGxBYSRPa4x/P+xOfNUuULRJteEENaJeZtj+4UqTEKTH7p8a1705/cnq9OIoRzwh87jj0ME8r8u0Q3Tj1Rfgfv7CADVMxM0TGgR+nb1M1AOLXpKT1nfF5QNM74nfdDmcKjPuRipr0B+V9GOugnZjykRyqPH3s4z2aDsrM/EKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0730.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.23; Mon, 13 Oct
 2025 15:32:10 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%6]) with mapi id 15.20.9182.020; Mon, 13 Oct 2025
 15:32:10 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: atishp@atishpatra.org
Cc: opensbi@lists.infradead.org,
	apatel@ventanamicro.com,
	rpathak@ventanamicro.com,
	leyfoon.tan@starfivetech.com,
	joshua.yeong@starfivetech.com
Subject: [PATCH 1/3] lib: utils: Add MPXY RPMI mailbox driver for voltage
Date: Mon, 13 Oct 2025 23:31:36 +0800
Message-ID: <20251013153138.1574512-2-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
References: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::10) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0730:EE_
X-MS-Office365-Filtering-Correlation-Id: 648cad66-f2d6-4153-beee-08de0a6dacb6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|41320700013|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: rNRT3f+dhqnMLktxViCEHbdkX8bIhGmrELuv9N7CegxxyvEYfNJ177Nwc3zcvO1dEzvWjZ7C21d0aHB+P7zia3Xsp5WgIRPyxoJgvrTdHqSjTKkgzpJUa4ObxPk5waftl7ZBcxhhYYcH1W2ZrrR+BiZXknUniVSqPkLf45PaeevioRvwJrg7EOTSTKxxRZqP70wF2fnm7skA84ssQxy40QQgspY1fsjUAisTCgyInaX3IeEJRrN8iwqXFubp9v5nk+CgwSrJVbs+2HU1QgJ3XRxjLOrSi5JiHroMdcCqUBNOQXKOBO0TmP3VQbWdLJPOS4fG3VLE7OXzzOqzURJtzUlyxGWr09pE7FnztrB+ogZeUSL5gfrrdH0jUaKYn5VnWrXuV4peq1rjDvItNNusSpx50VdVNDU5DRnZmAU668d0jFeb55/dEZprh7ftcqW4//CJcvIjAMjvxmZU/J9ZNM4TJNENjfrxOQA0W2LR2C5iFr6exfPTWlcBkN7/r8SEQ8yoZzuWm8WCmH146nku9uBmp5W6AlJ4oWR/okq2VDJKJIo99eLWOq+Xd0XuUSFB+2VH5JPGo7SDmldJbmRF0JZuRMR6piOg26JFTYpLNTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XmsvOsDxOUH0K7XCihH22ewTNiIX5T8YeWJ4HcIzN8RSWaHe6UTui7G/m7Zq?=
 =?us-ascii?Q?bIvu2C6tO+jR9ZNFAb+zlrTZUTpUmU0oqJvF9r4RRbrcJZ+WyGeZYcV9wgee?=
 =?us-ascii?Q?X3FFrSNh2kDrmZPSD3/yzDl2jPaKECND2YaqKQDVOBZbxDZ548nnGiINPYMQ?=
 =?us-ascii?Q?WBs0NDMZUOxGooiiA7YC31mhw9Tkxutng2f8PH2dYOz0lCcjClxTh7uPKuO1?=
 =?us-ascii?Q?dnO/x4LDDRR0IOXYpQWJw4agd7D83Tlrc/4L0k4JSqk8iWKkgyRlqrsLPlZH?=
 =?us-ascii?Q?JHNHit2E7ZLht50uk1Iuhm5SRWVWVO8pOl5OjtPz7elwKBFL0Xk7SA2WN/oc?=
 =?us-ascii?Q?sRSPkkO4OZqWmWGEqOoztMo1mnivQ0iWXrmMTvFWkKHHbC2p3X34Hs08Wxaz?=
 =?us-ascii?Q?alGc9qoCRS/EyU4G521yy+m+xFBazsvsoCG6H7nwdIH0HTfbYAU2wgo0BbLU?=
 =?us-ascii?Q?C1+Y6qIYAKlYGyE9sfLKsdTE89ZJx/x4vOSrfsR36Vf8YHvZude84oozhexf?=
 =?us-ascii?Q?edjaVIlQnH3HqsqAIjGE8kpIcwuxlZjVbcw0IgONWxoq17eh6Qh1Wp0mVjj9?=
 =?us-ascii?Q?XfjFc4yoBI+hEb+EonYi4+9QOwHuaZb/ztaEBFa0ZO+x4NVKu1VneqNQtU1D?=
 =?us-ascii?Q?yxHU3GFCF6tAAyoa6wANbKVUVGd06XmCC4L5hcDqtf0ehsnFi5hEzA6LHJr4?=
 =?us-ascii?Q?g7T8Vwu1bcGQja3gWTdhOKk/44ZsNdXQ7c+6uGhz+zrmiTOkULUUIg6Hw0wb?=
 =?us-ascii?Q?hrBDbzeADTykSKGhwL987Wmfa93jtiRARI3wVMqLl0/StmAqne+fwJlF2zxc?=
 =?us-ascii?Q?tz0vrc4/y2xFdwGnl8BVsQ/dDnucmAhW+0vu42/DZQF4pvf0wIqA3mIzIja3?=
 =?us-ascii?Q?s11FpX5VpuAT3kBeFoBxZkyFAhyM2cQLbDRdaRFFqqh6MovEIMjy8XcD92eo?=
 =?us-ascii?Q?Qm02t9e6l3VIsjL3VhgXTuLi7buPhsp3NssjY9/787qUGyvYDaMv7XxttSde?=
 =?us-ascii?Q?oPDAGhRChxcIvpng8J0pZqnyYhg0uB9NCsa6dTgW6ed6AfpF99locNWuHffW?=
 =?us-ascii?Q?IYl84QiPPwBwOqYu1Fctx0iDKOiXhQTIV5x3rY6t49c3Trrfq0S+bICQKR6l?=
 =?us-ascii?Q?s5XEh2UAj3lwx2kFOIwGnR8gtlD5g5aPEEOkRkfERMr4GVj4K1BHFArqTn9r?=
 =?us-ascii?Q?B7wlc8n2HDG2wYST8KOxhapu3SRq6A5It5FZ+YGFfRkkolpTi7sqY0v2K9fk?=
 =?us-ascii?Q?VoWgwNcD1c79esGSRgp73kPxwo6AP+LKXI+2lMFQnLExMDwRGfEjSiIdHnEc?=
 =?us-ascii?Q?Nk4wZW5ZAr2WYa5YDxt28Z6FKLwns2yTYsZvmN+2tWkoZz3cXqf2e3eX9/vi?=
 =?us-ascii?Q?oc6ZTxkxfWPjxmbQBFivic2Oy1wHs7hYF8gOtA7hvakP4LrSIItdrJs7vHK6?=
 =?us-ascii?Q?AamzJo0jt/XZms5HxqAfavpPSsdbdijVyZ2s1t73BvmenRAqZSSo3P2Uc6NO?=
 =?us-ascii?Q?odbVO3amjesDTTIhdURpJo5HzXpX3lG34gjnMhpeNGMNmjFCj9dIoGNIiXr6?=
 =?us-ascii?Q?2Ir9T9jBEJIs5E8qPTpkAKakptI+qfliBU9dp35BKiz5H2j1AoNgj2QUeHtw?=
 =?us-ascii?Q?DNFggRQnK1ZQfnvBqephT+Y=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648cad66-f2d6-4153-beee-08de0a6dacb6
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:32:10.0804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4z/ZBT41BgovK8oPq8M0dsSMVF6OnwTFsSITDWBz9FpJfpdz0rwiyQTOcUwbD8tQjbCJdlyrERj7WHQuc8yAfid42rgQZFwqKl5AfTKdpvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083241_936195_3934FA4B 
X-CRM114-Status: GOOD (  12.88  )
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

Add voltage service group for RPMI/MPXY support

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 81 ++++++++++++++++++++++++
 lib/utils/mpxy/Kconfig                   |  4 ++
 lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c   | 76 ++++++++++++++++++++++
 lib/utils/mpxy/objects.mk                |  3 +
 platform/generic/configs/defconfig       |  1 +
 5 files changed, 165 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index a761b560..6b5a553c 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -216,6 +216,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_SYSTEM_SUSPEND = 0x0004,
 	RPMI_SRVGRP_HSM = 0x0005,
 	RPMI_SRVGRP_CPPC = 0x0006,
+	RPMI_SRVGRP_VOLTAGE = 0x00007,
 	RPMI_SRVGRP_CLOCK = 0x0008,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
@@ -611,6 +612,86 @@ struct rpmi_cppc_hart_list_resp {
 	u32 hartid[(RPMI_MSG_DATA_SIZE(RPMI_SLOT_SIZE_MIN) - (sizeof(u32) * 3)) / sizeof(u32)];
 };
 
+/** RPMI Voltage ServiceGroup Service IDs */
+enum rpmi_voltage_service_id {
+	RPMI_VOLTAGE_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_VOLTAGE_SRV_GET_NUM_DOMAINS = 0x02,
+	RPMI_VOLTAGE_SRV_GET_ATTRIBUTES = 0x03,
+	RPMI_VOLTAGE_SRV_GET_SUPPORTED_LEVELS = 0x04,
+	RPMI_VOLTAGE_SRV_SET_CONFIG = 0x05,
+	RPMI_VOLTAGE_SRV_GET_CONFIG = 0x06,
+	RPMI_VOLTAGE_SRV_SET_LEVEL = 0x07,
+	RPMI_VOLTAGE_SRV_GET_LEVEL = 0x08,
+	RPMI_VOLTAGE_SRV_MAX_COUNT,
+};
+
+struct rpmi_voltage_get_num_domains_resp {
+       s32 status;
+       u32 num_domains;
+};
+
+struct rpmi_voltage_get_attributes_req {
+        u32 domain_id;
+};
+
+struct rpmi_voltage_get_attributes_resp {
+        s32 status;
+        u32 flags;
+        u32 num_levels;
+        u32 transition_latency;
+        u8 name[16];
+};
+
+struct rpmi_voltage_get_supported_rate_req {
+        u32 domain_id;
+        u32 index;
+};
+
+struct rpmi_voltage_get_supported_rate_resp {
+        s32 status;
+        u32 flags;
+        u32 remaining;
+        u32 returned;
+	u32 level[0];
+};
+
+struct rpmi_voltage_set_config_req {
+        u32 domain_id;
+#define RPMI_CLOCK_CONFIG_ENABLE                (1U << 0)
+        u32 config;
+};
+
+struct rpmi_voltage_set_config_resp {
+        s32 status;
+};
+
+struct rpmi_voltage_get_config_req {
+        u32 domain_id;
+};
+
+struct rpmi_voltage_get_config_resp {
+        s32 status;
+        u32 config;
+};
+
+struct rpmi_voltage_set_level_req {
+        u32 domain_id;
+        s32 level;
+};
+
+struct rpmi_voltage_set_level_resp {
+        s32 status;
+};
+
+struct rpmi_voltage_get_level_req {
+        u32 domain_id;
+};
+
+struct rpmi_voltage_get_level_resp {
+        s32 status;
+        s32 level;
+};
+
 /** RPMI Clock ServiceGroup Service IDs */
 enum rpmi_clock_service_id {
 	RPMI_CLOCK_SRV_ENABLE_NOTIFICATION = 0x01,
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index 8d1f5183..f720af2c 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -22,6 +22,10 @@ config FDT_MPXY_RPMI_SYSMSI
 	bool "MPXY driver for RPMI system MSI service group"
 	default n
 
+config FDT_MPXY_RPMI_VOLTAGE
+	bool "MPXY driver for RPMI voltage service group"
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c b/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c
new file mode 100644
index 00000000..a281924e
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c
@@ -0,0 +1,76 @@
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+
+static struct mpxy_rpmi_service_data voltage_services[] = {
+{
+	.id = RPMI_VOLTAGE_SRV_ENABLE_NOTIFICATION,
+	.min_tx_len = sizeof(struct rpmi_enable_notification_req),
+	.max_tx_len = sizeof(struct rpmi_enable_notification_req),
+	.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
+	.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
+},
+{
+	.id = RPMI_VOLTAGE_SRV_GET_NUM_DOMAINS,
+	.min_tx_len = 0,
+	.max_tx_len = 0,
+	.min_rx_len = sizeof(struct rpmi_voltage_get_num_domains_resp),
+	.max_rx_len = sizeof(struct rpmi_voltage_get_num_domains_resp),
+},
+{
+	.id = RPMI_VOLTAGE_SRV_GET_ATTRIBUTES,
+	.min_tx_len = sizeof(struct rpmi_voltage_get_attributes_req),
+	.max_tx_len = sizeof(struct rpmi_voltage_get_attributes_req),
+	.min_rx_len = sizeof(struct rpmi_voltage_get_attributes_resp),
+	.max_rx_len = sizeof(struct rpmi_voltage_get_attributes_resp),
+},
+{
+	.id = RPMI_VOLTAGE_SRV_GET_SUPPORTED_LEVELS,
+	.min_tx_len = sizeof(struct rpmi_voltage_get_supported_rate_req),
+	.max_tx_len = sizeof(struct rpmi_voltage_get_supported_rate_req),
+	.min_rx_len = sizeof(struct rpmi_voltage_get_supported_rate_resp),
+	.max_rx_len = -1U,
+},
+{
+	.id = RPMI_VOLTAGE_SRV_SET_CONFIG,
+	.min_tx_len = sizeof(struct rpmi_voltage_set_config_req),
+	.max_tx_len = sizeof(struct rpmi_voltage_set_config_req),
+	.min_rx_len = sizeof(struct rpmi_voltage_set_config_resp),
+	.max_rx_len = sizeof(struct rpmi_voltage_set_config_resp),
+},
+{
+	.id = RPMI_VOLTAGE_SRV_GET_CONFIG,
+	.min_tx_len = sizeof(struct rpmi_voltage_get_config_req),
+	.max_tx_len = sizeof(struct rpmi_voltage_get_config_req),
+	.min_rx_len = sizeof(struct rpmi_voltage_get_config_resp),
+	.max_rx_len = sizeof(struct rpmi_voltage_get_config_resp),
+},
+{
+	.id = RPMI_VOLTAGE_SRV_SET_LEVEL,
+	.min_tx_len = sizeof(struct rpmi_voltage_set_level_req),
+	.max_tx_len = sizeof(struct rpmi_voltage_set_level_req),
+	.min_rx_len = sizeof(struct rpmi_voltage_set_level_resp),
+	.max_rx_len = sizeof(struct rpmi_voltage_set_level_resp),
+},
+{
+	.id = RPMI_VOLTAGE_SRV_GET_LEVEL,
+	.min_tx_len = sizeof(struct rpmi_voltage_get_level_req),
+	.max_tx_len = sizeof(struct rpmi_voltage_get_level_req),
+	.min_rx_len = sizeof(struct rpmi_voltage_get_level_resp),
+	.max_rx_len = sizeof(struct rpmi_voltage_get_level_resp),
+},
+};
+
+static const struct mpxy_rpmi_mbox_data voltage_data = {
+	.servicegrp_id = RPMI_SRVGRP_VOLTAGE,
+	.num_services = RPMI_VOLTAGE_SRV_MAX_COUNT,
+	.service_data = voltage_services,
+};
+
+static const struct fdt_match voltage_match[] = {
+	{ .compatible = "riscv,rpmi-mpxy-voltage", .data = &voltage_data },
+	{ },
+};
+
+const struct fdt_driver fdt_mpxy_rpmi_voltage = {
+	.match_table = voltage_match,
+	.init = mpxy_rpmi_mbox_init,
+};
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 5b6e9bdf..a71c56af 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -17,3 +17,6 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += mpxy/fdt_mpxy_rpmi_clock.o
 
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_SYSMSI) += fdt_mpxy_rpmi_sysmsi
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_SYSMSI) += mpxy/fdt_mpxy_rpmi_sysmsi.o
+
+carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_VOLTAGE) += fdt_mpxy_rpmi_voltage
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_VOLTAGE) += mpxy/fdt_mpxy_rpmi_voltage.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index fb90bb3e..10992619 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -59,4 +59,5 @@ CONFIG_FDT_TIMER_PLMT=y
 CONFIG_FDT_MPXY=y
 CONFIG_FDT_MPXY_RPMI_MBOX=y
 CONFIG_FDT_MPXY_RPMI_CLOCK=y
+CONFIG_FDT_MPXY_RPMI_VOLTAGE=y
 CONFIG_FDT_MPXY_RPMI_SYSMSI=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
