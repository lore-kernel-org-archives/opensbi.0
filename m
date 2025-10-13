Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30870CCD18E
	for <opensbi@archiver.kernel.org>; Mon, 13 Oct 2025 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3zcFYP1JzRqXKoGHFLKe1GijCkIelUS4C0q9cLd5yI=; b=ry0T3ImHSQ4KPY
	jaBFxErfivqP7aWNJdDqKpoK9Rmt6OH8xE8xN8Kxnr2BAmcHJ2ut0aGI1riIZRXFpljiIPOkOdTuU
	mg4yziTQ5qH0s4VlKSIsGHP4KMgZ5ECaI0p8gbwYbSM/oNjUJxPH7IcFP9KVhuwODyJBVzk7AtjYQ
	8JPOpkcKEAAc6uvr0S9HW4CvP4+blNsFlkF+IpMrGjsTCE2haplsnsA+uhr3qfT4cuw7qwuM46W63
	m7bAurIqL/K6FAVTtTOz/ce/YsduyHtrZBLNluWHbWTZNZf0TbaLrboEu9Fc1N9DLDih9UF50DOLB
	/5QBTjvHDJFBPoYTWOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KXX-0000000Dh31-2Jyc;
	Mon, 13 Oct 2025 15:32:47 +0000
Received: from mail-bjschn02on2100.outbound.protection.partner.outlook.cn ([139.219.17.100] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KXV-0000000Dgyb-1uy5
	for opensbi@lists.infradead.org;
	Mon, 13 Oct 2025 15:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neeVa2aa4TFEE5ceP9tj4paV0d0pDEqXPc+mu1m+QUEvC/TdLPZoYvLZmo1oVSBneS/tJr36cXOwohTYqX/M4DkkqooJE0WF94HhTMO+QAfiQdGVygBuexeKI71grV9kRw/y17V6rj4iUq4HfVZ2J0+iaIZHOh7Sa+OP+9l3eDAxOlpZypX8w5ZFVdo5P3EyMxtYGR6y/ncMkALYck6SPli4JF/aZI1vc34kMcrJSojzlgzmbIG4wZWZzj/LmEST4Vs6N7T4RmMTj9HXlA7t7eR0yxzm6oWFtHScvHlvppk/jjaJB31oIhdOo23risjDXuz+puOfXsyQF/Z+WkLLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeQJsg/LxN/OBwLA9g0szRlDm5QcpgQ/8lR9yciWLDE=;
 b=KXiKWs8E35tQVElvDT+ta5uAsteDdDSRYiKQ2+IP9KC1vfzygpSWalkEbB/pqOsjg5sY1yQMrrBGYB/BHPYf3bVvFhau7YTk3wzghhELGibo7TaP0Us1kcEjRgtOIxAqafdJ04mbY4oqpBl0wxa5cS//sQeb1OkSr1NwcmnDYikoirxvae6HEmxVR3mreGtGyJoBK3dDPPmaC0bfBrIq+PpHfLOKSochLP4avjT361pS3UdTEwK/D3Id78I3NbnOT19Kowsj5ZuTMlZ2DW3jA4x+F7YQSkbyG1oc6CiviF2DNPSDjeZ4VjtWHF9moOl7chUjayBwLEeOjXxhrBg3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0730.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.23; Mon, 13 Oct
 2025 15:32:15 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%6]) with mapi id 15.20.9182.020; Mon, 13 Oct 2025
 15:32:15 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: atishp@atishpatra.org
Cc: opensbi@lists.infradead.org,
	apatel@ventanamicro.com,
	rpathak@ventanamicro.com,
	leyfoon.tan@starfivetech.com,
	joshua.yeong@starfivetech.com
Subject: [PATCH 3/3] lib: utils: Add MPXY RPMI mailbox driver for performance
Date: Mon, 13 Oct 2025 23:31:38 +0800
Message-ID: <20251013153138.1574512-4-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
References: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::10) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0730:EE_
X-MS-Office365-Filtering-Correlation-Id: af03ba43-d184-4857-3b9d-08de0a6dafbd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|41320700013|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: qa8aSEUoJP6/v/5WpyCZeIPfQxlwIZiDSl3tfIHabRu7a5QP+3qB7ZhIWjhc0tiP3jM/dgO6N8f7WRyPwpoc64IQFWU/XpB0Ol1/FsEZ6yBXomriNNDQrY1LIuIvUkRy0SqiuthUeuUXOou2SYnZ5uRvth0FkFrXAt7j7DkZq9nAzKyfwVL6ZPVhSQdiWMVgH8Pbtjg+Q81ms3yDaM9EkDuWwaZCFnIx+aFOrlV5bWGLiKGoLKk4+xYPkpKPoQE6z4JERb7ZJnjbU2Oaw3DjAiwyB870t1J+IzQ6SWSHO/CHLRuzLLgoBdKe56p4TULct0ms30MRHefi6taEGNlCTI/3H06ML3F9yzJb9rnxJIBSJI5VvQom3Lav15w109CiN+DEshLZbjfkV74PwdPx4eC7TTBkM4sXUCsiE1RO+xgD3nVzu1/1nFRsBIo8eOxQtyYm5zrUSdm9w3MUq+GmTTqjsdfrzljxk4LId/49ykiV4nS+PDbxxfG66AflN+GuX9pz2tW/2z5lYLWC2TWCZMyfK2Ije96JtwCm2ssp7tzreZoMsDNWynWBdqXx1JI6U2Bu4JEfMAFBNsutCdhc13peBkxF04d8juaKDu850So=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MVKYaJSuDMHS2G7vYl9b2rVHNgC2ANNKzg0dIK+xhPHH4SX2ld+IfIz1xyL1?=
 =?us-ascii?Q?18WONnlZ7QMfGQzDN5wT+Jk8L0iFkgEfs9sDR2JrX3OHZBKeA/H+H3BTMH8h?=
 =?us-ascii?Q?8/MUyuvowFRoRkr4iDqsvcSS2wTao5GV+lvCb5BsvnJClhHXTMXePaB6Ni8H?=
 =?us-ascii?Q?M/I9HOApA86Mq22w2WNPyFULn8boXutRgyza0ry/ItiuE/WcICXoAkqADJQe?=
 =?us-ascii?Q?6MGgsCdQEmz4FXK/QZK+lbInI39hJSpuCH4Nt55P+MgpRu++ffDVCMCNpUZ+?=
 =?us-ascii?Q?lb9AkaQmo4uFVfPkeitrNVaKdRhxXuRVrl3hRPWqInd8Mb8nEZu05S9DBDOl?=
 =?us-ascii?Q?JtwOcREYGx+Plbaj6+H4udEKTMkhoNgc9iAyOj3rlGjzwqpaNTETuB5FnlLz?=
 =?us-ascii?Q?9Tn3ea63ynMMt+N65cAb74TF16BjLycM0HsoSFJUh8nPokurtQ9YyRwUNc0E?=
 =?us-ascii?Q?CQPMM3SJiwtJMcViJL/hzhCyfeM8Cl1DFV9Q965ceA/BG+gsxJoifYFPEwyn?=
 =?us-ascii?Q?1nAaiM2aMbtmWEtNRej+DQWU3Bol1hD9V2kn6kUjOA7MyFNEHInFUSt5M9xy?=
 =?us-ascii?Q?1/1LgA4bmhs3XjiEAF32GLThsq464t6QNgii/HLXGEfkSgivQIXBlP2xat+L?=
 =?us-ascii?Q?2iUKP/BHIWPq4YJgtG/nsNQNuMwBHUfgg6HOaudP5saxzItplz1CuxsnEeeU?=
 =?us-ascii?Q?1f8vtGg/MJ72LYrqeLA0T1p6W39MtF4g704fT4DNeb/3fC2AV+hgH9RkRDp0?=
 =?us-ascii?Q?Ag5fXKSBXgCIqIPpZFtJl6cFD9BZc7UgokbFV1Qs6mt/uMXMp12AGYDXCczM?=
 =?us-ascii?Q?DhK8FnQCak09ZKzYmI4aNskzENiZkIoUO/rvjadceFPzgUgbVYkccqGXxmY+?=
 =?us-ascii?Q?shwu6uNa+HsUoAozypEC3rVGv0dnHmr02z6WiypWwJ0hlmSBztB52AwIZHC6?=
 =?us-ascii?Q?aOJNbuevHbVTmOILeSi5fDcBw6iR3YKAYBwqYlvE5bYeznNLA6d+nZizHDgt?=
 =?us-ascii?Q?1sQSdhRR58E7hJkljQv+a8OdsT7xCCUKDoqZlz1v5S7uUXjcUUyIka/8ANWb?=
 =?us-ascii?Q?v9kylA6yzPekNoDuRq4OiSrmJaRn5c++mvk9BcW8fnfdiThcANxxKvJKK5TG?=
 =?us-ascii?Q?hLIduGmXcfAIBPlp0hFcblOOu4+i1X8s3+aKQ+szWlhF6X67ArhEAEAgbaOk?=
 =?us-ascii?Q?JOgOdeZKy3nXsB9fs+rcD0cI+/Pfuit2HvtQBHMUJJstEMaI2tTwFY7qN/w4?=
 =?us-ascii?Q?te9UgVIc0XACN+aTqgwR8nUcCIJUYXzlyf8txOKFJ1tn7S2m9ytP2ZBCeeAy?=
 =?us-ascii?Q?EYF3B57g0b7yGc5qej43Y3Q9poKEUyWUP8FxYIvMhwaRrtTRaMl5TcFS5UqT?=
 =?us-ascii?Q?+fDmbjw3sX2NsgC/zrtJqazx0VSPDQjS8gaKE9digg33qERanFDfhziY096c?=
 =?us-ascii?Q?VWnjPqHgduHl6wxlXISD3MyjEpj9zPyCkOkVpQ0eZ/ccOhQTi7tnAKa7dsRG?=
 =?us-ascii?Q?udBGfGBfkbvHbHfCF9sdpUPFzdZvN6mgIy3C89isXXTodEuEZrl8BBQ76rQE?=
 =?us-ascii?Q?SvktFUQ8JXrkfgM7m32yyLj9pfp5QvNcDJlzdVzA++VMVlBYeipthqufPQo+?=
 =?us-ascii?Q?1EZO7He9TX17PDagj3fa9pA=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af03ba43-d184-4857-3b9d-08de0a6dafbd
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:32:15.1641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufJOVvk9KvbKqPol57os5WbGCnrsuLrwNNtmSbawexH90dHcOG8r+agKkVTz1iL6ZanvZZB9/QzX71V8COe0B8N6vWN151BQ+bKuydP9klc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083245_497005_92569A48 
X-CRM114-Status: GOOD (  13.64  )
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

Add MPXY RPMI mailbox driver for performance.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h   | 118 +++++++++++++++++++++
 lib/utils/mpxy/Kconfig                     |   4 +
 lib/utils/mpxy/fdt_mpxy_rpmi_performance.c |  90 ++++++++++++++++
 lib/utils/mpxy/objects.mk                  |   3 +
 platform/generic/configs/defconfig         |   1 +
 5 files changed, 216 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_performance.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 4e915a08..f8b16753 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -219,6 +219,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_VOLTAGE = 0x00007,
 	RPMI_SRVGRP_CLOCK = 0x0008,
 	RPMI_SRVGRP_DEVICE_POWER = 0x0009,
+	RPMI_SRVGRP_PERFORMANCE = 0x0000A,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -829,4 +830,121 @@ struct rpmi_dpwr_get_state_resp {
 	u32 state;
 };
 
+/** RPMI Performance ServiceGroup Service IDs */
+enum rpmi_performance_service_id {
+	RPMI_PERF_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_PERF_SRV_GET_NUM_DOMAINS = 0x02,
+	RPMI_PERF_SRV_GET_ATTRIBUTES = 0x03,
+	RPMI_PERF_SRV_GET_SUPPORTED_LEVELS = 0x04,
+	RPMI_PERF_SRV_GET_LEVEL = 0x05,
+	RPMI_PERF_SRV_SET_LEVEL = 0x06,
+	RPMI_PERF_SRV_GET_LIMIT = 0x07,
+	RPMI_PERF_SRV_SET_LIMIT = 0x08,
+	RPMI_PERF_SRV_GET_FAST_CHANNEL_REGION = 0x09,
+	RPMI_PERF_SRV_GET_FAST_CHANNEL_ATTRIBUTES = 0x0A,
+	RPMI_PERF_SRV_MAX_COUNT,
+};
+
+struct rpmi_perf_get_num_domain_resp {
+	s32 status;
+	u32 num_domains;
+};
+
+struct rpmi_perf_get_attrs_req {
+	u32 domain_id;
+};
+
+struct rpmi_perf_get_attrs_resp {
+	s32 status;
+	u32 flags;
+	u32 num_level;
+	u32 latency;
+	u8 name[16];
+};
+
+struct rpmi_perf_get_supported_level_req {
+	u32 domain_id;
+	u32 perf_level_index;
+};
+
+struct rpmi_perf_domain_level {
+	u32 level_index;
+	u32 opp_level;
+	u32 power_cost_uw;
+	u32 transition_latency_us;
+};
+
+struct rpmi_perf_get_supported_level_resp {
+	s32 status;
+	u32 reserve;
+	u32 remaining;
+	u32 returned;
+	struct rpmi_perf_domain_level level[0];
+};
+
+struct rpmi_perf_get_level_req {
+	u32 domain_id;
+};
+
+struct rpmi_perf_get_level_resp {
+	s32 status;
+	u32 level_index;
+};
+
+struct rpmi_perf_set_level_req {
+	u32 domain_id;
+	u32 level_index;
+};
+
+struct rpmi_perf_set_level_resp {
+	s32 status;
+};
+
+struct rpmi_perf_get_limit_req {
+	u32 domain_id;
+};
+
+struct rpmi_perf_get_limit_resp {
+	s32 status;
+	u32 level_index_max;
+	u32 level_index_min;
+};
+
+struct rpmi_perf_set_limit_req {
+	u32 domain_id;
+	u32 level_index_max;
+	u32 level_index_min;
+};
+
+struct rpmi_perf_set_limit_resp {
+	s32 status;
+};
+
+struct rpmi_perf_get_fast_chn_region_resp {
+	s32 status;
+	u32 region_phy_addr_low;
+	u32 region_phy_addr_high;
+	u32 region_size_low;
+	u32 region_size_high;
+};
+
+struct rpmi_perf_get_fast_chn_attr_req {
+	u32 domain_id;
+	u32 service_id;
+};
+
+struct rpmi_perf_get_fast_chn_attr_resp {
+	s32 status;
+	u32 flags;
+	u32 region_offset_low;
+	u32 region_offset_high;
+	u32 region_size;
+	u32 db_addr_low;
+	u32 db_addr_high;
+	u32 db_id_low;
+	u32 db_id_high;
+	u32 db_perserved_low;
+	u32 db_perserved_high;
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index 25288671..507b8371 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -30,6 +30,10 @@ config FDT_MPXY_RPMI_DEVICE_POWER
 	bool "MPXY driver for RPMI device power service group"
 	default n
 
+config FDT_MPXY_RPMI_PERFORMANCE
+	bool "MPXY driver for RPMI performance service group"
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c b/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
new file mode 100644
index 00000000..f4f18831
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
@@ -0,0 +1,90 @@
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+
+static struct mpxy_rpmi_service_data performance_services[] = {
+{
+	.id = RPMI_PERF_SRV_ENABLE_NOTIFICATION,
+	.min_tx_len = sizeof(struct rpmi_enable_notification_req),
+	.max_tx_len = sizeof(struct rpmi_enable_notification_req),
+	.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
+	.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
+},
+{
+	.id = RPMI_PERF_SRV_GET_NUM_DOMAINS,
+	.min_tx_len = 0,
+	.max_tx_len = 0,
+	.min_rx_len = sizeof(struct rpmi_perf_get_num_domain_resp),
+	.max_rx_len = sizeof(struct rpmi_perf_get_num_domain_resp),
+},
+{
+	.id = RPMI_PERF_SRV_GET_ATTRIBUTES,
+	.min_tx_len = sizeof(struct rpmi_perf_get_attrs_req),
+	.max_tx_len = sizeof(struct rpmi_perf_get_attrs_req),
+	.min_rx_len = sizeof(struct rpmi_perf_get_attrs_resp),
+	.max_rx_len = sizeof(struct rpmi_perf_get_attrs_resp),
+},
+{
+	.id = RPMI_PERF_SRV_GET_SUPPORTED_LEVELS,
+	.min_tx_len = sizeof(struct rpmi_perf_get_supported_level_req),
+	.max_tx_len = sizeof(struct rpmi_perf_get_supported_level_req),
+	.min_rx_len = sizeof(struct rpmi_perf_get_supported_level_resp),
+	.max_rx_len = -1U,
+},
+{
+	.id = RPMI_PERF_SRV_GET_LEVEL,
+	.min_tx_len = sizeof(struct rpmi_perf_get_level_req),
+	.max_tx_len = sizeof(struct rpmi_perf_get_level_req),
+	.min_rx_len = sizeof(struct rpmi_perf_get_level_resp),
+	.max_rx_len = sizeof(struct rpmi_perf_get_level_resp),
+},
+{
+	.id = RPMI_PERF_SRV_SET_LEVEL,
+	.min_tx_len = sizeof(struct rpmi_perf_set_level_req),
+	.max_tx_len = sizeof(struct rpmi_perf_set_level_req),
+	.min_rx_len = sizeof(struct rpmi_perf_set_level_resp),
+	.max_rx_len = sizeof(struct rpmi_perf_set_level_resp),
+},
+{
+	.id = RPMI_PERF_SRV_GET_LIMIT,
+	.min_tx_len = sizeof(struct rpmi_perf_get_limit_req),
+	.max_tx_len = sizeof(struct rpmi_perf_get_limit_req),
+	.min_rx_len = sizeof(struct rpmi_perf_get_limit_resp),
+	.max_rx_len = sizeof(struct rpmi_perf_get_limit_resp),
+},
+{
+	.id = RPMI_PERF_SRV_SET_LIMIT,
+	.min_tx_len = sizeof(struct rpmi_perf_set_limit_req),
+	.max_tx_len = sizeof(struct rpmi_perf_set_limit_req),
+	.min_rx_len = sizeof(struct rpmi_perf_set_limit_resp),
+	.max_rx_len = sizeof(struct rpmi_perf_set_limit_resp),
+},
+{
+	.id = RPMI_PERF_SRV_GET_FAST_CHANNEL_REGION,
+	.min_tx_len = 0,
+	.max_tx_len = 0,
+	.min_rx_len = sizeof(struct rpmi_perf_get_fast_chn_region_resp),
+	.max_rx_len = sizeof(struct rpmi_perf_get_fast_chn_region_resp),
+},
+{
+	.id = RPMI_PERF_SRV_GET_FAST_CHANNEL_ATTRIBUTES,
+	.min_tx_len = sizeof(struct rpmi_perf_get_fast_chn_attr_req),
+	.max_tx_len = sizeof(struct rpmi_perf_get_fast_chn_attr_req),
+	.min_rx_len = sizeof(struct rpmi_perf_get_fast_chn_attr_resp),
+	.max_rx_len = sizeof(struct rpmi_perf_get_fast_chn_attr_resp),
+},
+};
+
+static const struct mpxy_rpmi_mbox_data performance_data = {
+	.servicegrp_id = RPMI_SRVGRP_PERFORMANCE ,
+	.num_services = RPMI_PERF_SRV_MAX_COUNT,
+	.service_data = performance_services,
+};
+
+static const struct fdt_match performance_match[] = {
+	{ .compatible = "riscv,rpmi-mpxy-performance", .data = &performance_data },
+	{ },
+};
+
+const struct fdt_driver fdt_mpxy_rpmi_performance = {
+	.match_table = performance_match,
+	.init = mpxy_rpmi_mbox_init,
+};
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 45b3281b..bbc998af 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -15,6 +15,9 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MBOX) += mpxy/fdt_mpxy_rpmi_mbox.o
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += fdt_mpxy_rpmi_clock
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += mpxy/fdt_mpxy_rpmi_clock.o
 
+carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_PERFORMANCE) += fdt_mpxy_rpmi_performance
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_PERFORMANCE) += mpxy/fdt_mpxy_rpmi_performance.o
+
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_SYSMSI) += fdt_mpxy_rpmi_sysmsi
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_SYSMSI) += mpxy/fdt_mpxy_rpmi_sysmsi.o
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 5e819b3b..387ce833 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -61,4 +61,5 @@ CONFIG_FDT_MPXY_RPMI_MBOX=y
 CONFIG_FDT_MPXY_RPMI_CLOCK=y
 CONFIG_FDT_MPXY_RPMI_VOLTAGE=y
 CONFIG_FDT_MPXY_RPMI_DEVICE_POWER=y
+CONFIG_FDT_MPXY_RPMI_PERFORMANCE=y
 CONFIG_FDT_MPXY_RPMI_SYSMSI=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
