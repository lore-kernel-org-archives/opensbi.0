Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41942C5DF7D
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rh6APDxWBwUzs02a/qmlZ5dyUCPFeXuiMm1mAy5qHc=; b=QwsYMeXrN4iVIS
	Su7DoidKrmfAGk9q4S7MsVeMguxwHAFjCZYUO1iIPypFo7WTUeq+jyjChLzzHoMYe2zWjKOas6IN1
	7GMFaKD3jcyDEesk7888rnrC3s45PNBtC6aGWpjIusWSJzjc+IHmvGrelUX5i6JLt8z90wNvLDGO8
	ZjB/mrvLS90dRciBdnYJ5K4Lh2NCOFk3Eea1vCrgckA4aanXoxcPoqLJc3I2sUTQuX8Z1Hrx/UQTC
	N6EhkS5u7/kzNx5JlqW999qz/CgL+CvjgW4q3N+G06wI1zo/BGz9DoIQxbT24ElYGMz9PX7jS/0Cb
	icEmaQcy7s5FJ3sApFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQvP-00000008eRa-0owi;
	Tue, 18 Aug 2026 21:00:47 +0000
Received: from mail-westus3azon11020103.outbound.protection.outlook.com ([52.101.201.103] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQvM-00000008eRC-2hTo
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 21:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=He3EZ9o4TPzsloUVbrdO72gQRZsa2//00CbY05fCzDaKOgYwKTRiss4T5tAe7cwK0eG099qC5f6HfhXgzt1Ojip5cbpY/5jqDeF0OkZdWAaely0ty8ePEXhvYY6FJ6aRKWeiaB/LvOPkaFzfKb/NPSb+diCxpkHJu80DfgA6XJkXSVKlgl9iIjAifw29ls3GpbLGZahUq6cuDgaU5g31rTGKrJrizQtob27QwTGbW6ztE45wkZK1Da9/fv5au7US6LTXwHTAo8oUhe4cWHAH+2ZmlPrLoX4BFUn0Qu0byecqZ24SMwL/NhaEKGjre8FZoWebsnlMUdO0GXEcSA+2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWmS0OSl0dpVA9ON9H3HL+PFLngTGI5SLz3x3sTR7tA=;
 b=qVlt2LoXhefcK/szLlIBRksZ6H0jDJkrjmMJE0LnKQyUHslzrtcpZDecpKNGVbUjWwX63fzlUZsgpKC2t+UjJe9MIU2yQQDre0pqlu8NsuSqJgHitm1mXX8V7+J9oykhCgE6TIayuJtXKE8k4RzeIA3rjPf3yx0JUWj08Ih1zCYxAh8dUIqeP+3BrYCY8/jKfOmRBN5eHPo9acSnesNYr7vZJrqtfDXT+f3tIQCQtZbqP4vvopBSLA7dqgm/6xKJ8HtqCgU3qy5985qzzsdximH5GKClhWsHGyuNx8aQ+oAeA7r2+fJGjob4zOHnT7H2ua8kwKAuDYP5b16wjKmOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWmS0OSl0dpVA9ON9H3HL+PFLngTGI5SLz3x3sTR7tA=;
 b=ceDO03dPO/mARr7iDpR1r31nV6r060Hv39gwyY7P7ZY4UaDLhLBmT6XaUU7ikrxNu2pZ+ZsnKS8t/cvv8rRTiKPlyZGsUNOapgz9onYYq5RKzvKGBjMzO+k3otWd53bof/eoq/U9JKbapHCyaRq/4HCBT5o/20OpfQwZknXGy03llZZ1BT14bemFRgdjxMpmyakVjB7Jck6nXx4WIDS9VHc2Ux+feYdug4qG+bsgdWWKesCN69p+gaV/tc2rHuzaLer7JfLDZ/XB5pulDbNxAD5K7nM0eTXGJMM0jvPB4hrmsK5SUJ0+pIR3Nbjn61KWOVppFfR0Ale0gwqwHaQcdQ==
Received: from BN0PR04CA0116.namprd04.prod.outlook.com (2603:10b6:408:ec::31)
 by PH7PR22MB5157.namprd22.prod.outlook.com (2603:10b6:510:312::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 21:00:38 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:ec:cafe::39) by BN0PR04CA0116.outlook.office365.com
 (2603:10b6:408:ec::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 21:00:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.0
 via Frontend Transport; Tue, 18 Aug 2026 21:00:37 +0000
Received: from davidAhead.lan (unknown [10.8.0.15])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 9BA1680367;
	Tue, 18 Aug 2026 14:00:31 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH v2 1/3] lib: sbi_pmu: Return invalid param error for reserved event_idx bits
Date: Tue, 18 Aug 2026 15:00:21 -0600
Message-ID: <20260818210023.466462-2-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818210023.466462-1-david.garcia@aheadcomputing.com>
References: <20260803171128.3506804-1-david.garcia@aheadcomputing.com>
 <20260818210023.466462-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|PH7PR22MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5d5615-1642-4e23-99ab-08defd6bc0e7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|56012099006|11063799006|10067099003|4143699003|3023799007|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: G3+ZegUnkE0PhQQqEVVQTU6xm+g/+azZZBExUv8uJbG+vrx5/viwhOmqf00gGeik9I9i0+tlzZxprcwq231DCQFUH7ZA9I6WyyXX0XxSC+y1jOKSUx49B9IKOok1knvBIifg++Bk963WvV0IFVOY1XuPQBQBSSNpgiMrGoc8/jmNmx5DuzAnKQmZRDnsjrVR0xwI2ECMLxXfv0cHcz+PC1v3Kob3dDUxbI5atpxdElpQ2rgBaRhoA6QukV60C3flqxO+zoQHW4JRIbghp98AHyKJ6E66Cn9YcCQQgLSBjRcuWoHl12YRTmPIMYDae2Ur78+tM9DummV4U+CcjKeSTZRAu6KAixxbgJYXe/ECcPHBnfHUHDhAxtz6F610GyyJ30VutZ5WozJxS6Pyr/y7iXK3hE0PKRDrhr8TosETW6jZjcAsjsqJ+bVqrQVGP7egSZeX9FhZsHLDj+TIipcVWEQ6go0b6ytmE2668K5f3Fg7k6iSN9vPfZW3Rawq0ILPNCLwhLMg4j4wt3Y1fj1GiC76nm90fKooLa5yHjVLHCGw7JEu7Db5qUKSv5qRCY8O9K9qYbByfFbVler7SNefh3Czqygb0Yv4760/AzKE9zKmCXPGfttrQZNrjmFnsHSTFwOLeZ0aAtS4M8yWk7p91kPAlxZNm6ZiEIVUr1nOkObCvO81sqfE1FOCdmhyJi6J97AOxuBDQZj5CoKSqugr3g==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RcYVGQ+BQNoNbD2gDkRK6t7CwKcG+kCmkxHKhHejPYXIpuMR6OebWMWaulMqrPFyxq/69i5x1iK6oysdLCl4BE/+L7kSTeCjO7gEk8XFt8hdw/d2G7oTkWFvvKAMr5sZpLaN9FpREt5aEvm4Lmu9gHXD1I6mL1rFnWf9L2YIMykjWGdcuAccziMp0ueRmlt6wI7NyE6VJE/c9B+7XVCEPYulP03xoJprBP34nC8o01NRM3E3p3VOw/pxhXusURAYPdXnij0xRr/OrKXDrK73h9haAy4SuzOelMIi5KqkqB5iP7yLxq6dvAPofGlRSKJg1gqf9Yf7KGGGD+wsX4gCTkd073z+sK99AB8xYYYpKUB79E6U8KfKuiWRta8c0hd55kq5gxHooJkbRyfk9DjPHFzlSbUdgk3bP7TYqSAv+dEqhCGuP6ECmCAV9F1ZO6A7
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 21:00:37.1436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5d5615-1642-4e23-99ab-08defd6bc0e7
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB5157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_140044_692805_4D4BDECD 
X-CRM114-Status: GOOD (  11.90  )
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

As per section 11.14 of the SBI specification (Function: Get PMU Event
Info, FID #8), Table 47, the event_idx word of an event info entry
only uses BIT[0:19]; BIT[20:31] are reserved for the future purpose
and must be zero. Table 48 further requires the SBI implementation to
return SBI_ERR_INVALID_PARAM if any reserved bit in an event_idx word
is set.

sbi_pmu_event_get_info() does not check the reserved bits, so a
malformed event_idx is silently passed on to pmu_event_validate()
instead of failing the call. Add SBI_PMU_EVENT_IDX_MBZ_MASK covering
the must-be-zero bits and return SBI_ERR_INVALID_PARAM when any of
them are set.

Fixes: e4345842168b ("lib: sbi_pmu: Implement SBI PMU event info function")
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi/sbi_ecall_interface.h | 2 ++
 lib/sbi/sbi_pmu.c                 | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index acb91a01..bfde25d0 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -271,6 +271,8 @@ struct sbi_pmu_event_info {
 #define SBI_PMU_EVENT_IDX_TYPE_OFFSET 16
 #define SBI_PMU_EVENT_IDX_TYPE_MASK (0xF << SBI_PMU_EVENT_IDX_TYPE_OFFSET)
 #define SBI_PMU_EVENT_IDX_CODE_MASK 0xFFFF
+#define SBI_PMU_EVENT_IDX_MBZ_OFFSET 20
+#define SBI_PMU_EVENT_IDX_MBZ_MASK (0xFFF << SBI_PMU_EVENT_IDX_MBZ_OFFSET)
 #define SBI_PMU_EVENT_RAW_IDX 0x20000
 #define SBI_PMU_EVENT_RAW_V2_IDX 0x30000
 
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a0f6d2fa..4558876e 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1098,6 +1098,9 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 	einfo = (struct sbi_pmu_event_info *)(shmem_phys_lo);
 	for (i = 0; i < num_events; i++) {
 		event_idx = einfo[i].event_idx;
+		/* Any must-be-zero event_idx bits set should return INVALID_PARAM per-spec */
+		if (event_idx & SBI_PMU_EVENT_IDX_MBZ_MASK)
+			return SBI_ERR_INVALID_PARAM;
 		event_type = pmu_event_validate(phs, event_idx, einfo[i].event_data);
 		if (event_type < 0) {
 			einfo[i].output = 0;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
