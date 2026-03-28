Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FEC10F3DD7
	for <opensbi@archiver.kernel.org>; Sat, 28 Mar 2026 05:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSWx12G7AAOvdwcYTXH3yEZEaDqnycjwpm6PNodNkPE=; b=LvOaV3vIgVtK5p
	my4vST0cnWmCyhzqFITQeDAIeq12eZoB1DJAlQfDrs0CMKyzkoPGozPxR/SifEveUpsXo4MM9zmch
	gHpzsN9IwAYjFkuiX5vLrPmnJY0yQ122PxKjwm6rzOv6L5j5P1AjXk/GgoIPyx7iJsKdkyod6zu1A
	a9NTFa7TNHn8RfEBywIaiqhB//cSCSUkrDSDeYZnbgbp8X/ACSHksNvBMhXx/DhCtztwzPrKrU2uW
	O4/HqmVy75oSGbJNPY1p4lgdI3znU2SZrCQPsbfJ1q6C1s8d5WWQ2soZ5dZf7yeprJzfyz7HMbuiM
	FxURfRvpFFHbvy42Cyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MTA-00000008bOq-2rX1;
	Sat, 28 Mar 2026 05:44:24 +0000
Received: from mail-southcentralusazon11021128.outbound.protection.outlook.com ([40.93.194.128] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MT7-00000008bMf-1ylt
	for opensbi@lists.infradead.org;
	Sat, 28 Mar 2026 05:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1/+JSl4g0vgrjMoZGzkfW/ntdGoGFkhG81hrx52SZKTo9Gv/NBxUt6VjFjm7T/YwQTRZKycapz9vp1GeafW6CVB+uAP5WD4CRkNsVMFeJv2+6xpTIhstRhe5K/aOh/+ZJfg6sHGzjnUGknrCxGPmbM06cCZrbcPGiNzOpN6cMVGpckWURZ/NHSnleLov2oTA2dAjyxTY/bN6DS6Uc1YeQgaJ4TtNA/j99cnjORCmitmkCVaSNmiKHysS8Zya1XcwUU9CWMww8wwv4fZ3PIYUyY1Qh1FfOAB64hM8Tr0+54+6nSETTPLh5VCym1mOJVoTwgsJZU/Nga6iYlc+rgO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9rQub7/dTyfCSCv2M96DEwog7ULlkVKUT6oOfFg/ek=;
 b=Quyy7n13bWmPtNbJPvD2RpPxGhq2fEO2YmIxONxqjayS5/ZhpJfp1F/DCZe6mT31n1Ld4nXK5P+vslEOFb1I4rdrHLDDYKvQqdlqJ8lw795nkcvoM+ZeeUdf0mjDRpDZIiYklz5OV6yRZuzRYLatv8czRTEdO0XUbrjZxSLZM/Ohn+kHigDwNRSSF7mqa5pT/0A7Y32Bpw95raCX71onBDhM5W3ou5XqhIvZNroHhtx7bIJ5/+z2Forxd8VqUI9ps75yu7fjLiA9FwM4RqFCUyWCITP+4xYP2zAD8H0ehadErrmqD0/0q4jijSlbfuTcNLLfPl1C8kaIR/MiTuUEVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9rQub7/dTyfCSCv2M96DEwog7ULlkVKUT6oOfFg/ek=;
 b=mbfjrAAxnn/x2PsuDeiBTXmVLMgKTawrhF3S7mmNcFcgW1ToBdqIvfkZO7lZafJSVpu+1wrJPeeshRnu1Y6qQ7gXOQgFrq2aeKv6GxoCx9FgZTAfhpbYWRtQ09mB1Y81BwAMOX91sZD9c9kRhwmzZv/GiDro/fFFeWA84ng36pBK3IrlUeojnfRAY7ffIWjYasEKf8R21EK23QA7yFRO+c5Z2BGU9Ru45qiA5GOO8XoO57liQKQUyCK0SC/JEynfhEcU0N9o3ni8RJCDXMg+ED+W4Q8nVdtpr+QVFTjLQReRiJ/Qn2LqrS/HTJy0ykUjGVu8Jl5H8KJ5FgWXdohwLA==
Received: from SJ0PR03CA0374.namprd03.prod.outlook.com (2603:10b6:a03:3a1::19)
 by SA1PR22MB3780.namprd22.prod.outlook.com (2603:10b6:806:33d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Sat, 28 Mar
 2026 05:44:13 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::6c) by SJ0PR03CA0374.outlook.office365.com
 (2603:10b6:a03:3a1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Sat,
 28 Mar 2026 05:44:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Sat, 28 Mar 2026 05:44:12 +0000
Received: from davidAhead.lan (unknown [10.8.0.9])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 5EA6D80AAD;
	Fri, 27 Mar 2026 22:44:11 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 1/4] lib: utils: irqchip: aplic: Move register defines to public header
Date: Fri, 27 Mar 2026 23:43:44 -0600
Message-ID: <20260328054347.3706029-2-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
References: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|SA1PR22MB3780:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bc3168-cd4d-4d16-596c-08de8c8d0a50
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info: T0yWwR1W12ImV+fHNJZe96Ljp4LL/9EEiD4mashiGt1cMHRrM2Xz2cgAlf+XJ+Hb9E3+h8Pu/zWvfNJB91KJVsfrFN18yPnT0pruGvlbn7BQGoUxauhuaKyYu6kEJ9ecZo337JF2UVMRF/PmNdt4IlCZdO6D/7jdffVQ6B16oNiHUeFk/llHOzfW0w+JF8Y3oBQSsQAxbd/mDgMinRqzas5ouFQ1bUucHtk7pXstYCSgdPeSWlowaf0zSjgF/3GiKF+bjrbCbku47fgY2ecSqdprvcRqIZPAnMBf0779DzeHCCZm7lIjqPPKsZf1elJAhbSVnqI3I+ZZrsi8GfQCGb8SMQyJ5N0pOV2eOOHDoWM0+0EldrFl6lJjWze4lp1gkCFSruPo/GI6F3Q7MC0FgmH8DApf0roUOviU+pVZLVvIM/DYuYGJbeCsThEGUwJ6j5hpJTYdmMjAusCKRyCTSeSmFYPWndxbCzTZrpbHzo2Ss7MMuGljcn54J81dtCsXIRs6Z9l1UqjrJytLWtbhdXG/fQhZ6yhohvyIpn9X5txwtixY1f5LzxJJS/1kTxeuWXd+70I1BU6eILEKZs/P2jCoz7rXIjshktwrsj5hxORYr4TOvU5N5Gq80bu/tZySWoz/CKUlA6lDfqqPma1bs8fmvzorcu4VxhCxmeXK1vI90P4S3hyX6M9EFOPjMzywQ7WMuQwRs+DybohafBvp0zzuwiDVPqNa21tUQUZ0xfh8psed7q/jMivvWSq3nu5hCZenUmsb6DHFitO/E4UeYg==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rROeOYxILYxxVq4wXv8M4laJRW8MqO7FluIiFwvb5lNm9pAOJnngHRE5h5IdBAfaD/zgCXIHTyTvD0b5oR5HHVjy7VAeL7nFjgVhaMplhXU/thGPoqXuV9nRCXRl0BTuE8Sc2ca927lNluUzn47WdU+ZIzvo6p470hAKk/JmW0zT9GuJQWqJmkKXpjj63V3u1zQOH39ZiLimw2B8qnAaW5AdmQcJiT5BhRCVF/qs8h++33k7a4esTIRTpjIzOFx0IdkS0ziLNkForkwXAAS7N1od0rT08lm7CuJyv/mb+21q0RZyFGaFlwcX7rjBV1huT8NVnJXfZiB8TI6CIIpA0heS+XpUsUGofuybJeMK2DKZdsByLE4hEjM/UFTH3l5Ib1m7tgUqmic6eMM8V93IU+Jtuz/PpS4zeDijacgMGjrZovjuh9SjPzLddewAxrD3
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 05:44:12.4181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bc3168-cd4d-4d16-596c-08de8c8d0a50
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB3780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_224421_556686_15E8E1F0 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

The APLIC register-level defines (DOMAINCFG, SOURCECFG, TARGET, SETIE,
CLRIE, IDC, MSICFG, etc.) are currently defined locally in aplic.c and
not accessible to platform code. Platform implementations that need
direct APLIC register access for custom interrupt configuration (e.g.
MSI-mode source/target setup) have no way to use the canonical defines.

Move these defines from aplic.c to the public aplic.h header so that
platform code can configure APLIC registers without duplicating magic
numbers. The defines match the RISC-V AIA specification. No functional
change.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi_utils/irqchip/aplic.h | 101 ++++++++++++++++++++++++++++++
 lib/utils/irqchip/aplic.c         | 101 ------------------------------
 2 files changed, 101 insertions(+), 101 deletions(-)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index 3461d1c7..286c8f94 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -14,6 +14,107 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_irqchip.h>
 
+#define APLIC_MAX_IDC			(1UL << 14)
+#define APLIC_MAX_SOURCE		1024
+
+#define APLIC_DOMAINCFG		0x0000
+#define APLIC_DOMAINCFG_IE		(1 << 8)
+#define APLIC_DOMAINCFG_DM		(1 << 2)
+#define APLIC_DOMAINCFG_BE		(1 << 0)
+
+#define APLIC_SOURCECFG_BASE		0x0004
+#define APLIC_SOURCECFG_D		(1 << 10)
+#define APLIC_SOURCECFG_CHILDIDX_MASK	0x000003ff
+#define APLIC_SOURCECFG_SM_MASK	0x00000007
+#define APLIC_SOURCECFG_SM_INACTIVE	0x0
+#define APLIC_SOURCECFG_SM_DETACH	0x1
+#define APLIC_SOURCECFG_SM_EDGE_RISE	0x4
+#define APLIC_SOURCECFG_SM_EDGE_FALL	0x5
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH	0x6
+#define APLIC_SOURCECFG_SM_LEVEL_LOW	0x7
+
+#define APLIC_MMSICFGADDR		0x1bc0
+#define APLIC_MMSICFGADDRH		0x1bc4
+#define APLIC_SMSICFGADDR		0x1bc8
+#define APLIC_SMSICFGADDRH		0x1bcc
+
+#define APLIC_xMSICFGADDRH_L		(1UL << 31)
+#define APLIC_xMSICFGADDRH_HHXS_MASK	0x1f
+#define APLIC_xMSICFGADDRH_HHXS_SHIFT	24
+#define APLIC_xMSICFGADDRH_LHXS_MASK	0x7
+#define APLIC_xMSICFGADDRH_LHXS_SHIFT	20
+#define APLIC_xMSICFGADDRH_HHXW_MASK	0x7
+#define APLIC_xMSICFGADDRH_HHXW_SHIFT	16
+#define APLIC_xMSICFGADDRH_LHXW_MASK	0xf
+#define APLIC_xMSICFGADDRH_LHXW_SHIFT	12
+#define APLIC_xMSICFGADDRH_BAPPN_MASK	0xfff
+
+#define APLIC_xMSICFGADDR_PPN_SHIFT	12
+
+#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
+	((1UL << (__lhxs)) - 1)
+
+#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
+	((1UL << (__lhxw)) - 1)
+#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
+	((__lhxs))
+#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
+	(APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
+	 APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
+
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
+	((1UL << (__hhxw)) - 1)
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
+	((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
+#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
+	(APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
+	 APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
+
+#define APLIC_SETIP_BASE		0x1c00
+#define APLIC_SETIPNUM			0x1cdc
+
+#define APLIC_CLRIP_BASE		0x1d00
+#define APLIC_CLRIPNUM			0x1ddc
+
+#define APLIC_SETIE_BASE		0x1e00
+#define APLIC_SETIENUM			0x1edc
+
+#define APLIC_CLRIE_BASE		0x1f00
+#define APLIC_CLRIENUM			0x1fdc
+
+#define APLIC_SETIPNUM_LE		0x2000
+#define APLIC_SETIPNUM_BE		0x2004
+
+#define APLIC_TARGET_BASE		0x3004
+#define APLIC_TARGET_HART_IDX_SHIFT	18
+#define APLIC_TARGET_HART_IDX_MASK	0x3fff
+#define APLIC_TARGET_GUEST_IDX_SHIFT	12
+#define APLIC_TARGET_GUEST_IDX_MASK	0x3f
+#define APLIC_TARGET_IPRIO_MASK	0xff
+#define APLIC_TARGET_EIID_MASK	0x7ff
+
+#define APLIC_IDC_BASE			0x4000
+#define APLIC_IDC_SIZE			32
+
+#define APLIC_IDC_IDELIVERY		0x00
+
+#define APLIC_IDC_IFORCE		0x04
+
+#define APLIC_IDC_ITHRESHOLD		0x08
+
+#define APLIC_IDC_TOPI			0x18
+#define APLIC_IDC_TOPI_ID_SHIFT	16
+#define APLIC_IDC_TOPI_ID_MASK	0x3ff
+#define APLIC_IDC_TOPI_PRIO_MASK	0xff
+
+#define APLIC_IDC_CLAIMI		0x1c
+
+#define APLIC_DEFAULT_PRIORITY		1
+#define APLIC_DISABLE_IDELIVERY		0
+#define APLIC_ENABLE_IDELIVERY		1
+#define APLIC_DISABLE_ITHRESHOLD	1
+#define APLIC_ENABLE_ITHRESHOLD		0
+
 #define APLIC_MAX_DELEGATE	16
 
 struct aplic_msicfg_data {
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index ec69c82b..a20cecf2 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -14,107 +14,6 @@
 #include <sbi/sbi_error.h>
 #include <sbi_utils/irqchip/aplic.h>
 
-#define APLIC_MAX_IDC			(1UL << 14)
-#define APLIC_MAX_SOURCE		1024
-
-#define APLIC_DOMAINCFG		0x0000
-#define APLIC_DOMAINCFG_IE		(1 << 8)
-#define APLIC_DOMAINCFG_DM		(1 << 2)
-#define APLIC_DOMAINCFG_BE		(1 << 0)
-
-#define APLIC_SOURCECFG_BASE		0x0004
-#define APLIC_SOURCECFG_D		(1 << 10)
-#define APLIC_SOURCECFG_CHILDIDX_MASK	0x000003ff
-#define APLIC_SOURCECFG_SM_MASK	0x00000007
-#define APLIC_SOURCECFG_SM_INACTIVE	0x0
-#define APLIC_SOURCECFG_SM_DETACH	0x1
-#define APLIC_SOURCECFG_SM_EDGE_RISE	0x4
-#define APLIC_SOURCECFG_SM_EDGE_FALL	0x5
-#define APLIC_SOURCECFG_SM_LEVEL_HIGH	0x6
-#define APLIC_SOURCECFG_SM_LEVEL_LOW	0x7
-
-#define APLIC_MMSICFGADDR		0x1bc0
-#define APLIC_MMSICFGADDRH		0x1bc4
-#define APLIC_SMSICFGADDR		0x1bc8
-#define APLIC_SMSICFGADDRH		0x1bcc
-
-#define APLIC_xMSICFGADDRH_L		(1UL << 31)
-#define APLIC_xMSICFGADDRH_HHXS_MASK	0x1f
-#define APLIC_xMSICFGADDRH_HHXS_SHIFT	24
-#define APLIC_xMSICFGADDRH_LHXS_MASK	0x7
-#define APLIC_xMSICFGADDRH_LHXS_SHIFT	20
-#define APLIC_xMSICFGADDRH_HHXW_MASK	0x7
-#define APLIC_xMSICFGADDRH_HHXW_SHIFT	16
-#define APLIC_xMSICFGADDRH_LHXW_MASK	0xf
-#define APLIC_xMSICFGADDRH_LHXW_SHIFT	12
-#define APLIC_xMSICFGADDRH_BAPPN_MASK	0xfff
-
-#define APLIC_xMSICFGADDR_PPN_SHIFT	12
-
-#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
-	((1UL << (__lhxs)) - 1)
-
-#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
-	((1UL << (__lhxw)) - 1)
-#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
-	((__lhxs))
-#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
-	(APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
-	 APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
-
-#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
-	((1UL << (__hhxw)) - 1)
-#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
-	((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
-#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
-	(APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
-	 APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
-
-#define APLIC_SETIP_BASE		0x1c00
-#define APLIC_SETIPNUM			0x1cdc
-
-#define APLIC_CLRIP_BASE		0x1d00
-#define APLIC_CLRIPNUM			0x1ddc
-
-#define APLIC_SETIE_BASE		0x1e00
-#define APLIC_SETIENUM			0x1edc
-
-#define APLIC_CLRIE_BASE		0x1f00
-#define APLIC_CLRIENUM			0x1fdc
-
-#define APLIC_SETIPNUM_LE		0x2000
-#define APLIC_SETIPNUM_BE		0x2004
-
-#define APLIC_TARGET_BASE		0x3004
-#define APLIC_TARGET_HART_IDX_SHIFT	18
-#define APLIC_TARGET_HART_IDX_MASK	0x3fff
-#define APLIC_TARGET_GUEST_IDX_SHIFT	12
-#define APLIC_TARGET_GUEST_IDX_MASK	0x3f
-#define APLIC_TARGET_IPRIO_MASK	0xff
-#define APLIC_TARGET_EIID_MASK	0x7ff
-
-#define APLIC_IDC_BASE			0x4000
-#define APLIC_IDC_SIZE			32
-
-#define APLIC_IDC_IDELIVERY		0x00
-
-#define APLIC_IDC_IFORCE		0x04
-
-#define APLIC_IDC_ITHRESHOLD		0x08
-
-#define APLIC_IDC_TOPI			0x18
-#define APLIC_IDC_TOPI_ID_SHIFT	16
-#define APLIC_IDC_TOPI_ID_MASK	0x3ff
-#define APLIC_IDC_TOPI_PRIO_MASK	0xff
-
-#define APLIC_IDC_CLAIMI		0x1c
-
-#define APLIC_DEFAULT_PRIORITY		1
-#define APLIC_DISABLE_IDELIVERY		0
-#define APLIC_ENABLE_IDELIVERY		1
-#define APLIC_DISABLE_ITHRESHOLD	1
-#define APLIC_ENABLE_ITHRESHOLD		0
-
 static SBI_LIST_HEAD(aplic_list);
 static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
 				void *msicfgaddr, void *msicfgaddrH);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
