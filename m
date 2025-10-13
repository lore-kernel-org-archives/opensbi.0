Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841A0CCD190
	for <opensbi@archiver.kernel.org>; Mon, 13 Oct 2025 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmfWLMzV1ibWYSVRLy7UE2v3678Hl3I5nsFp2X5TRlQ=; b=UG6V8eGWVtkG2i
	fcdSXGbW4Tw4vyO2Dg0opA2AF2q5UqWBm2Yhe/+p7iP10OoOyx/e0UjOIu6vqf+UAuQwgs2XbnIpw
	2lgsSx5wb0XKUW4e8ipX9Y2CruB3VmPZ6I1HuLlWiuHXoDYDvOC5j9kZXrgcixvvKNDVTzSSF2I3D
	Z0FYlnM9UvKsAY6Rb5eXnn8WV455gr7aU+uT+W4E3/IWgtj9QQhtbNj1tDWNtxxL4up51FPevjB1y
	Bo/yMVy9XR+qdHFwE0YIf2HfGB03KpbJGNwRatVVTMMlPkebnbHhQc5m9xn325joOU0/x/S23w+pp
	gP6YhQa/M+L9w+mO8EmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KXV-0000000Dh1v-45O1;
	Mon, 13 Oct 2025 15:32:45 +0000
Received: from mail-bjschn02on2100.outbound.protection.partner.outlook.cn ([139.219.17.100] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KXT-0000000Dgyb-2jw3
	for opensbi@lists.infradead.org;
	Mon, 13 Oct 2025 15:32:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3+GMrSBRFRcdZRaxLqqgPUTUtXr4g5DkVtJKTf38jCUxkRylZc1Dlwjv7x7FiMIcP/44HD7JYUsDPVHW60MmUmJpMJKb88p28pMT+88d5imGflxnG0ycf4DWqukB5w4JqGHSXln6SyLjJQKfSnfFBplE8HFwJd24PmEeCkMU4/P1sP9uY3ygcfoLjDfNblpg+zdUF2FfLH/ZbHc5ASNgmu4y2Z5iC0u3OUheQt3yEw9Nx+BGZJFrfXE/lfNF+Hq7gw23bjgWSs+Gi4X7NrQg1i0MZ5nD3nZz7t5oE2ukeq42FnVPlygnZdy+qIFhfF1KvlHP6QR4awijPdkU94OQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0Yp+D+DRSEbTIe7019DBTu0PUc7bqkQb94L6PuSSUw=;
 b=RCFSE56JALMZpAaqmTPvxeVPSY+sNx8D5mnPKHo5PWzUQVo4Jut4QvnShUgh3W22TUF8gr8/8+vUfHe2RE0GE08ohjt5kCaCKd30vkMHR03RSzO9h9dapBqNv8AD3dIDfw8QzcRvs3AiwD910j60+PVbW1DOjtrBW2DEQ6PHigTxAQJQA/QeVDiGMN0nmvpk3SxV+cB4CBG0N2vFFltz0fukLR6/9RmmbXuXp+1bMGYP2ktAuau/2HMHVbmRwnue81A8MNQbNBQ/PRPBrgBQAN7wmdYmG/Ae2jQiQzQnayQem/i+xec+7vGjItRLYjdhhgZImoBxFz6LTZTEIX/KRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0730.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.23; Mon, 13 Oct
 2025 15:32:12 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%6]) with mapi id 15.20.9182.020; Mon, 13 Oct 2025
 15:32:12 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: atishp@atishpatra.org
Cc: opensbi@lists.infradead.org,
	apatel@ventanamicro.com,
	rpathak@ventanamicro.com,
	leyfoon.tan@starfivetech.com,
	joshua.yeong@starfivetech.com
Subject: [PATCH 2/3] lib: utils: Add MPXY RPMI mailbox driver for device power
Date: Mon, 13 Oct 2025 23:31:37 +0800
Message-ID: <20251013153138.1574512-3-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
References: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::10) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0730:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f91795a-61a7-4c1a-1034-08de0a6dae4a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|41320700013|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: uWnrQPu6syigbkOAwSqYLa+MLEdLFGLvPLCBEImPwapHvgKr4ra8pkZL8IEonD+LPQ9kjM5+DZti81upU5CQNfOSNyIuC1rK/q1MfFTLs7JCPJ6mN9ZaE2DOF6sgTFYHI4kwas4/NywM1S21YoiXpsP4whRnoSGv8AaBiHsj4w/dU2gcAE5BhfPwnlbofteAhT91Z55DnN6pn0vmGZyXSWCn4ZD0sHG58GvdRwHFMdguxEHSCYzD+BA50AFDiLJWGMM00yv87b3U96vUVNbmdeppyHrRay+pYDYZ0OKPVjwE+82e4TgyqsBa1ftHmw2RgXFPVynppZfBR6Te07hq89MQX+3q4MM2Jgbry4DQZdmUfFq9VeRznHk8kQjh53ugwcMIiYCmTCzUpam1tBusrlPpqKmCxGnrXOxuia0hxxQ5+WF3Qe5VB0PeX+LIFaPDbxc/F3GOnms3Q3h/8oErD1CInF9NIaXQ/NNLPUVGOQH5/xyrJIP2mMZN0z5gYGUl+ZbvUTa4nO7LMnXAQVOdPfVPocIrVl+Q3VlIiM1FBJX01Oj0g1o+LaHJAg7U6DAOKep+EOp429myjFN3n407MPO8p3hQY065A9syvD5VTvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zFvMI12yjJKHoP9KcKbFiL1l07cUb3xPm8gNOjSV6FytcSRGjh0G98pALLm5?=
 =?us-ascii?Q?1sWjojDOgj6RCUyDTYm4beNbhw3DetzM4oxSVZnlAahx0jfCk47L3wYMcPkc?=
 =?us-ascii?Q?955eo/SFQy8JjD624tSxJouqpYKBPZEbqaH698P8qNmGCJV7SQ/sDjwIdjcU?=
 =?us-ascii?Q?cLd+cEDx2ooBGPcyYiNAkGE2UesXa7PiY6NXp4hlZSgRIf4XZU3W7HM6wSbG?=
 =?us-ascii?Q?u6wRa0kucLU9KgXGz6pmGfPxAbpyZzuzOwOJ2KPsfLEHxum4xtNdj9S+tCnm?=
 =?us-ascii?Q?ngyWLH3vlL4n7ZoT/8Wd4x9eUF+vOOziBPI9GLTkCxEaVQZiN5s1BAO7CzCO?=
 =?us-ascii?Q?948d4yaMVgYP0msc5UByhj44AnmU5ublSIcyN8oEqKn3L7gdp6m0BNVDW1d7?=
 =?us-ascii?Q?6InWdgDmnQtgOvKbJ/n9+CaHtCA5UaSLpWUj23alDE8kH+0Ex2lQLkdwrLLm?=
 =?us-ascii?Q?rx3ZG2/aJsYc//G/XY16zA5L9LNkCtPtd/t0lKXs4ebgaqTDqIUXUeyrvgv/?=
 =?us-ascii?Q?9Z5PZoO3i6PkB1ltTwneBuW/xQwzUwTqzglFxWNZLJ46hvq1PQQKtE/sn1cj?=
 =?us-ascii?Q?y7aE8YamfPy719pH+z0eOBhSqkCQRCw6xftUw+qTowur+5S3SfEB2Y73MFmE?=
 =?us-ascii?Q?GjS6pCXM54U57Fn+cku8wcp930ML/o0wL3t3G8QNEIFVwXYpQ0tYJoArq9iZ?=
 =?us-ascii?Q?kf9fuu+sR3eUtyGtac6SUwRMQp8vgaPscEqahqZn/lFLjAh58H7/7Jl3+7Ec?=
 =?us-ascii?Q?jA7CR6KxdDF3oju8ALQEZJUiOFdisVc67Ll5/CB3/fN4dYOGF6JdqXlO8X5o?=
 =?us-ascii?Q?eZYLfrU2aejompNj8QQTlm6vy6ImaAbD6YJUKES+eG/FBGDQJPy4+DEW9IOf?=
 =?us-ascii?Q?Rp3EYNoodzN+6F/5J16iWBvIZ46LRJ2P4dFuTygxXpcRuhPtnFqGzjMYJXy4?=
 =?us-ascii?Q?FlHBX1TksJqBXy72pU3KqlOJ7C7KIMwcw8wWfrCWR0qjQVdnUk8Jn/S99ulT?=
 =?us-ascii?Q?MazSLyC6ToiChC9OLN2jd6sNAAW/J+IbdGjZjgLYlGmK7znRk5bfSo7CO30n?=
 =?us-ascii?Q?vHMmwa4Pwzy2igyVtbTKbCF+ouRCReFzkU8JVQendJNO4igZVd6PWtmjVYRl?=
 =?us-ascii?Q?q0F4urQCJyynBaRx6bKN66PL6XKf95c8iB5Z6K5KSOhR9ie3Z1jcSUd4BA5Z?=
 =?us-ascii?Q?7M19u7pHZKugyNv9JE2hK44WMtFnffN/i6D+RVy6oKvCeogICCfRJAHdiS28?=
 =?us-ascii?Q?Z7f1uDpY+4Dp64vfZ4XbnNYgykABSDwLLviRfrtFgMzZtQAJ1F7HdzKUeNSr?=
 =?us-ascii?Q?gzW/UXv5YU97XYfaUHPzKh7TygB8225sesgNtJbCAbqJIWCUkURbxk7uzOxt?=
 =?us-ascii?Q?o7cL2DnaqUeXETpyD7COlcbi/se0HIuYof22VwOxN6dGVb613V6i4UQRv+1/?=
 =?us-ascii?Q?1JFvIZkuSOzTIjEmfRfPCIVzGLaAx/Wu+dgxxW5y9LOSpzFBwxi7a4BWA6QJ?=
 =?us-ascii?Q?rJPdd93XqsiFc1ICZwvT5b7ICQZ/BiisfNu8VDMvey8uhijVJ5MLwnfOqS+t?=
 =?us-ascii?Q?+gy4coydDT1PAudPusiDoNYgPvqrEmgXBZ+gH33nxy4dalSf+X80dZJMM/0s?=
 =?us-ascii?Q?SrqebHtxdSumXvUIuYfXUB8=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f91795a-61a7-4c1a-1034-08de0a6dae4a
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:32:12.6996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nFOAQVQ2U8u6cy+Em0VfcNw9rYrqYSMZx3uq0+1ndwMhHY3VwnQNOiD57YsnNkMq6DsCUU0dzq20FJN7uWngPG14d5wUDYFKA7Nw2QT2Do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083243_693041_D56A0CBF 
X-CRM114-Status: GOOD (  13.54  )
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

Add MPXY RPMI mailbox driver for device power.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h    | 45 +++++++++++++++++
 lib/utils/mpxy/Kconfig                      |  4 ++
 lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c | 55 +++++++++++++++++++++
 lib/utils/mpxy/objects.mk                   |  3 ++
 platform/generic/configs/defconfig          |  1 +
 5 files changed, 108 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 6b5a553c..4e915a08 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -218,6 +218,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_CPPC = 0x0006,
 	RPMI_SRVGRP_VOLTAGE = 0x00007,
 	RPMI_SRVGRP_CLOCK = 0x0008,
+	RPMI_SRVGRP_DEVICE_POWER = 0x0009,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
 	/* Reserved range for service groups */
@@ -784,4 +785,48 @@ struct rpmi_clock_get_rate_resp {
 	u32 clock_rate_high;
 };
 
+/** RPMI Device Power ServiceGroup Service IDs */
+enum rpmi_dpwr_service_id {
+	RPMI_DPWR_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_DPWR_SRV_GET_NUM_DOMAINS = 0x02,
+	RPMI_DPWR_SRV_GET_ATTRIBUTES = 0x03,
+	RPMI_DPWR_SRV_SET_STATE = 0x04,
+	RPMI_DPWR_SRV_GET_STATE = 0x05,
+	RPMI_DPWR_SRV_MAX_COUNT,
+};
+
+struct rpmi_dpwr_get_num_domain_resp {
+	s32 status;
+	u32 num_domain;
+};
+
+struct rpmi_dpwr_get_attrs_req {
+	u32 domain_id;
+};
+
+struct rpmi_dpwr_get_attrs_resp {
+	s32 status;
+	u32 flags;
+	u32 transition_latency;
+	u8 name[16];
+};
+
+struct rpmi_dpwr_set_state_req {
+	u32 domain_id;
+	u32 state;
+};
+
+struct rpmi_dpwr_set_state_resp {
+	s32 status;
+};
+
+struct rpmi_dpwr_get_state_req {
+	u32 domain_id;
+};
+
+struct rpmi_dpwr_get_state_resp {
+	s32 status;
+	u32 state;
+};
+
 #endif /* !__RPMI_MSGPROT_H__ */
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index f720af2c..25288671 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -26,6 +26,10 @@ config FDT_MPXY_RPMI_VOLTAGE
 	bool "MPXY driver for RPMI voltage service group"
 	default n
 
+config FDT_MPXY_RPMI_DEVICE_POWER
+	bool "MPXY driver for RPMI device power service group"
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c b/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
new file mode 100644
index 00000000..9978b727
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
@@ -0,0 +1,55 @@
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+
+static struct mpxy_rpmi_service_data dpwr_services[] = {
+{
+	.id = RPMI_DPWR_SRV_ENABLE_NOTIFICATION,
+	.min_tx_len = sizeof(struct rpmi_enable_notification_req),
+	.max_tx_len = sizeof(struct rpmi_enable_notification_req),
+	.min_rx_len = sizeof(struct rpmi_enable_notification_resp),
+	.max_rx_len = sizeof(struct rpmi_enable_notification_resp),
+},
+{
+	.id = RPMI_DPWR_SRV_GET_NUM_DOMAINS,
+	.min_tx_len = 0,
+	.max_tx_len = 0,
+	.min_rx_len = sizeof(struct rpmi_dpwr_get_num_domain_resp),
+	.max_rx_len = sizeof(struct rpmi_dpwr_get_num_domain_resp),
+},
+{
+	.id = RPMI_DPWR_SRV_GET_ATTRIBUTES,
+	.min_tx_len = sizeof(struct rpmi_dpwr_get_attrs_req),
+	.max_tx_len = sizeof(struct rpmi_dpwr_get_attrs_req),
+	.min_rx_len = sizeof(struct rpmi_dpwr_get_attrs_resp),
+	.max_rx_len = sizeof(struct rpmi_dpwr_get_attrs_resp),
+},
+{
+	.id = RPMI_DPWR_SRV_SET_STATE,
+	.min_tx_len = sizeof(struct rpmi_dpwr_set_state_req),
+	.max_tx_len = sizeof(struct rpmi_dpwr_set_state_req),
+	.min_rx_len = sizeof(struct rpmi_dpwr_set_state_resp),
+	.max_rx_len = sizeof(struct rpmi_dpwr_set_state_resp),
+},
+{
+	.id = RPMI_DPWR_SRV_GET_STATE,
+	.min_tx_len = sizeof(struct rpmi_dpwr_get_state_req),
+	.max_tx_len = sizeof(struct rpmi_dpwr_get_state_req),
+	.min_rx_len = sizeof(struct rpmi_dpwr_get_state_resp),
+	.max_rx_len = sizeof(struct rpmi_dpwr_get_state_resp),
+},
+};
+
+static const struct mpxy_rpmi_mbox_data dpwr_data = {
+	.servicegrp_id = RPMI_SRVGRP_DEVICE_POWER,
+	.num_services = RPMI_DPWR_SRV_MAX_COUNT,
+	.service_data = dpwr_services,
+};
+
+static const struct fdt_match dpwr_match[] = {
+	{ .compatible = "riscv,rpmi-mpxy-device-power", .data = &dpwr_data },
+	{ },
+};
+
+const struct fdt_driver fdt_mpxy_rpmi_device_power = {
+	.match_table = dpwr_match,
+	.init = mpxy_rpmi_mbox_init,
+};
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index a71c56af..45b3281b 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -20,3 +20,6 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_SYSMSI) += mpxy/fdt_mpxy_rpmi_sysmsi.o
 
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_VOLTAGE) += fdt_mpxy_rpmi_voltage
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_VOLTAGE) += mpxy/fdt_mpxy_rpmi_voltage.o
+
+carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_DEVICE_POWER) += fdt_mpxy_rpmi_device_power
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_DEVICE_POWER) += mpxy/fdt_mpxy_rpmi_device_power.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 10992619..5e819b3b 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -60,4 +60,5 @@ CONFIG_FDT_MPXY=y
 CONFIG_FDT_MPXY_RPMI_MBOX=y
 CONFIG_FDT_MPXY_RPMI_CLOCK=y
 CONFIG_FDT_MPXY_RPMI_VOLTAGE=y
+CONFIG_FDT_MPXY_RPMI_DEVICE_POWER=y
 CONFIG_FDT_MPXY_RPMI_SYSMSI=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
