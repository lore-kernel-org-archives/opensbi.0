Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C27BC5DF81
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 21:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+XxQ3GzywT6Jd7VOzwtfnYZVXS/iGIKvABaGtY025o=; b=2nm/cZ1d3S7wBD
	3ULL0ZLyzx54FCADGkXWuWVJ2RZfkIrjmhrcaMwYMVtNx9E3YbTF0djlQ6DBW7ILji9drlIwkGXZO
	EVainvnAS+/CmugWjhVBuKBsMw8GMpB1aONgtREwL63hZ9ggqlXV6nYsB03kf/oEYZETSHpgwcr/c
	bxXBXYejxH+cklXa0AmStyLnHO79Gycp9rfcB8lsxap1F5pslnZ/Lry2vJunzDHSpLyrAziiMscGS
	AQsOpbgIjwiFEE/5+h+nPzEIZHoGZ+2fpJZe+G+aipb7LHrjOdXTEGOtJDReC+jacbxMORRFfwGdh
	aa+ct9T+kT4hpXX/KuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQvT-00000008eSS-1BXu;
	Tue, 18 Aug 2026 21:00:51 +0000
Received: from mail-northcentralusazon11020120.outbound.protection.outlook.com ([52.101.193.120] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQvR-00000008eRl-07MH
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 21:00:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdu3zO/wdq9mO99A+Ll5fzc1gA6HlcXm9hXWJ2bl7qcWtaR6JsYi1c5snmcPRz33STXUBGoGHkxlDW9pBXBS2cCT7LmNKOipfl3VlQgQuY0zRUGVR1EmlFeP7D7PxpQiPfQS8qVpU4Ecc4IlZbWXneEBUN54wVK9KAW44hUEOl2lUAb8II0HKYe5iECnTvdSKcZS2bxft7iRU1KhJ6F7LZQB1Y/ByNiahuhBYsV6HG24LQf5DoHPfTllgT3uyZLZhHJtrO8sjueW22P6/KkjnhocsfRBJ5Imr+U5LPX0/lHZqeux6WBW/OY6jgAlrg36CdbWK3XnneYvR2qZv88xaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHMZPM75iuvxpckDoCa2C/sASUFrsV9SLpk5/73sX0E=;
 b=v+knXvNT9d8RhEk9/VlYXv7ukU5O5zW+Vr4g8lCAx52Zb+KE0QJ8+Xw+9rjL2Eo1wy8wlNxJkQwhRTjvzDrvuO1VBmkKpHYm9cYVHOwQzlNNw9dnyrzbSj10TM+pUpCERNrstGqa3l7kyYN7aOsaNwNGWBaKt7tBZMXr5AQAV9fOqkNA/FjZUEmJlYZ34dv/zqxgGlA/KFTXRlfXar5X9RKb1YlKxnqLWKhmsQaAi80SBdLQbY0FCCkXWgO9xlux+vRt1WjSI7Waf0w2MYQYPdt7mb6txermqeppmZJSA+cklwqCFba+7sr9ZXUaacubK8frcsW3JeySxBuqEw6ZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHMZPM75iuvxpckDoCa2C/sASUFrsV9SLpk5/73sX0E=;
 b=Z0xCBeoxQCQypJHgM7AZoa2v8vx/nrOfxwpprXd3hzh6bfma72KC4a1Mwupiavg5IbUpDDGBISnlAUdEcSbHOMN+m4RfE2/5wjV7yJK5Ao9Q5bmLXMRTbQW+JwEcu/EKaeTEG7wV9qwCsPDi7zDQXCvu4faA+8AFH9a3DcVBXh2FWFRQ+7q7daWWWhuEGIGZlgkkberyEZNxsEBeAx1nzk3YcAfqNjGcqw/0MxgqdCfrvUg7V22N6wgqPZvBpY7TBDQolzyyfvIj0Na23QIMVauCgT1tmRDvg2ZbFeaKRnZGsm4oFLY6ovNc7xUB0N65o2eUZaPXGJ5TyNjPncCKfQ==
Received: from BN9PR03CA0521.namprd03.prod.outlook.com (2603:10b6:408:131::16)
 by PH0PR22MB2892.namprd22.prod.outlook.com (2603:10b6:510:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 21:00:42 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:131:cafe::6f) by BN9PR03CA0521.outlook.office365.com
 (2603:10b6:408:131::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 21:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.0
 via Frontend Transport; Tue, 18 Aug 2026 21:00:40 +0000
Received: from davidAhead.lan (unknown [10.8.0.15])
	by mail.aheadcomputing.com (Postfix) with ESMTP id E96E280365;
	Tue, 18 Aug 2026 14:00:33 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH v2 2/3] lib: sbi_pmu: Match raw event selector only against raw event map entries
Date: Tue, 18 Aug 2026 15:00:22 -0600
Message-ID: <20260818210023.466462-3-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818210023.466462-1-david.garcia@aheadcomputing.com>
References: <20260803171128.3506804-1-david.garcia@aheadcomputing.com>
 <20260818210023.466462-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|PH0PR22MB2892:EE_
X-MS-Office365-Filtering-Correlation-Id: d59602f5-23ca-4c72-96dd-08defd6bc2a8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|11063799006|56012099006|4143699003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WITkjo7a2wXCuckEhvHCxf6IQ/YmgFemnZRZZ9LJt5AWhY3ohVfi6ufytSUS5xudgvTuvilOzuHh30kyjVOxLUYITWRevXjLieaPjuYq3vcI99cm9tFcwqJ8gwmeNZoGs384oPPeH33gykHGVZbp56j5KI+AY4EG+kieVWKNrwoXVOLCZKTgHc/zXyTg1HasfSLxG38YlEjG5LHQXoUaiQ/dpsx7oENSqSJLm3aQGcxf+NOwAHF+PwNCGSuwVTjYi/oIFZK55pyKVQXJiuCiVAsWZldxa+kebtFvO5aPxizmjlblHcyn4C2tDm6slqqfEv9KlDxwtFRThmStbVYXKNE8/TV14TPDi+pv6juwSrfkagg78qSgQI3Nk19lagROPcg4orD7CaIeTcZIYJfMLoF/MvykRk+2u97eETrkb7A6uTevHLpGafoMhm4kcSKLWol4BuSpiLRVnku0EMVGqu4ZKIzBEOvIduvVz4oWqElmxDAprPi4u5YVB4Uw7XgfXNqyX9XDqCl3NYZD7jEZ90a1S20ef/UgZIMvpi9UaXOAjCva/s7P8m37aA5Mjl0s2wRjZOayRuJ3O9hMh5dQPk/t2zWDEs0vbe4Z++VugawfG0oDqIT9hxD6rB7LxhUstjhZNDwlsTULuCuKNfx8Zx6TTeB4Bm7gET6mOBUx9GowRKJNFANZEj1YlxEnpqLC
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0hK6dkS8JdBkRVNcSnMTCyOuT+Ml6zPJXWc6QbVFJsD6XPr3H9J4njnRk9Nj9nO1K/Ei36cClts4Gd2Yr/yLytyPX/kDQ4jiTn1O2W4UonED4ERctCD9vXrVgPj9NgkBUEr2v6OhTBnb/lM0KGNaGEYoKQgkIXdexCNduetR6m+Pjy/rqn3uAqsB61IPOz8C0l0FiFt+M07B76hLW07tY1EPLnM21MBRstn3etm4rdo0nOeRAN2aZcmaJGBUKRmzNogax2/QLULE5QTO23zTLfrgh5Q867TpB5Ju6ZP0Xnt0iFXE9N66XqlyOBVj3BZ2pNPo8SD4+TZEiR/c1/RSU22BHs4WQQQa7eO6CDRzhRBthPJz84LLcssEwFxmMxx+zAJvlHVx4s9uluoYfgLH6PK2oSeCmDP1dAdgAI/ynmwBa8PPyYlJ2gfMBqFlV8Rh
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 21:00:40.0872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d59602f5-23ca-4c72-96dd-08defd6bc2a8
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR22MB2892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_140049_074327_5E5E4ABA 
X-CRM114-Status: UNSURE (   9.37  )
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

sbi_pmu_event_get_info() walks hw_event_map[] to decide whether a
requested event is supported. For SBI_PMU_EVENT_RAW_IDX and
SBI_PMU_EVENT_RAW_V2_IDX it compares the requested event_data against
temp->select / temp->select_mask without first checking that the map
entry being examined is itself a raw event entry.

Non-raw hardware event entries are added via sbi_pmu_add_hw_event_counter_map(),
leave select and select_mask at zero, hence they satisfy:

	temp->select == (event_data & temp->select_mask)

so the first non-raw entry visited will always match.
The issue's observability depends purely on the ordering of hw_event_map[]:
if the platform registers its raw events last, every raw event query, including
unsupported ones, will be reported as supported.

Fix it by checking event_idx against temp->start_idx and temp->end_idx before comparing select/select_mask.

Fixes: e4345842168b ("lib: sbi_pmu: Implement SBI PMU event info function")
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 lib/sbi/sbi_pmu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 4558876e..676de9aa 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1110,6 +1110,15 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 				/* For raw events, event data is used as the select value */
 				if (event_idx == SBI_PMU_EVENT_RAW_IDX ||
 					event_idx == SBI_PMU_EVENT_RAW_V2_IDX) {
+					/*
+					 * Only a raw event map entry carries a
+					 * meaningful select/select_mask pair, so
+					 * skip any entry which does not cover the
+					 * raw event index.
+					 */
+					if (temp->start_idx > event_idx ||
+					    event_idx > temp->end_idx)
+						continue;
 					/* just match the selector */
 					if (temp->select == (einfo[i].event_data &
 									temp->select_mask)) {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
