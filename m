Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD93C55184
	for <opensbi@archiver.kernel.org>; Mon,  3 Aug 2026 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0UMVI4Pl1OXIcN+/lpDmjY6om/zt0Oi690oi9z9b+Y=; b=MKObr+YrsREtpu
	X5SgUtKTeOcWq/KEe0hErKW190v2xFNG19+1IGKjfzcIAWuhD9TN9OvKVQPsdlL93SYH+KQHqAdKC
	6drgdyiZhfz6pyTz+Y8Lb+wn/XASmeux6Tut1Qv/MXz3N8nUnBJxCISAt2fpFUdldzckmv8Iu2Gi7
	pMQHUeYLnO0XFaJVBDRfgBzHltC9LEMQ3DF1kCRISOSQbDmWjhrv5m7DBj/ybLUUIxjU1LUgz3CPe
	J2rpmrKB8yuag1s0ymLS1TLJm9mhxrGNJ4p2Nun6UG74+IAzUHcNFvODGNN3mwepJ0UdTXnNffAlH
	ez0sThvJZ7hO6h1XtgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwCd-00000000C3R-24b1;
	Mon, 03 Aug 2026 17:11:51 +0000
Received: from mail-westus2azon11022087.outbound.protection.outlook.com ([52.101.48.87] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwCb-00000000C2j-1KUT
	for opensbi@lists.infradead.org;
	Mon, 03 Aug 2026 17:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilQwjIUXP2517zvR1NJuE2nxPbI9lEQTL8Legmol3kn/fSA5NIBdmNb8FEGaYI0bkzWufpMFrkGCRxqn0eH3d+QGSKPd37bYhIlnN2oxQE+D81SFY/mM5Y+iDtot+emA+88XBz2P6AK212aloXRXM8Rcza4t0kEAzcagwy182VpJQ/ioumxf/Ay5D4TjBLlPAsNjGz5jTPlJp3VhMmqzm9JMMqZfOzQrebYux0MFy6rxKkcfoeLLlpJeEcv05eTfxhc12T0pgNQf7ze9zt37ubUTJCHAk2Vpq89WYBFnDERJE/5ytn6vKftzw+IbxbRFTAz8bR3PY3fTSKngMyQmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8QFDGPfFT5ViC7IxnWwU8deKSDTeU9EFaKJZCLbY7w=;
 b=e59WZnbE2bWYCDr4JJFQ4REyL0uRfdUhnlnXhPCqBsS7JAOxHAcjXUBrGIKr9efp806J5u0gQpzFTGI/D58I+aN1h/5u+kEGxq3x+N+Rr/7Zm6J8jGUmXxP6dMcVNSghJtDQnlSOov84r4J7jVdHLvLx/5HwELbJ7KzHyOpwmyE7j4WpuX9Gmtq472x38ItKdZdI1yMHxS/u/Gu8dlIiOcTcT/F2XYV795mPoBhshT07kQOJUfdEbF2zMkJPei6gU5SjloqyIqj9ouKaLov/7A4r2MPFTCl9T0hITr4fz60cV0IYRNYPPmuaWLs9e8T8EPuJckr7SVLoqWezGZi09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8QFDGPfFT5ViC7IxnWwU8deKSDTeU9EFaKJZCLbY7w=;
 b=AOZ080MkscaKNgu9Lt7f7FS+lNBNns4nI1VFNiVJq6a9/Rh0+zR95boYtZ9TdoJuAo+99Tpo06Azpj19kl1x5Vmz9ygn267tE6jGY35/m6InLaSS7JQHTHVKhMSJbgvMpVAM7VbaRnsYNtN7J4mwhIL7jGcjwSZh7wROmU8huWvQ60RbWkRSWG7uvLAhuv2KQZWbXY6FqTQ/6WnFWDs6+3RWsOxWfiFc+3EyJGVWxbveVqKj+18WnsCy9YPxYSaJfZ4QgngfQ66sGuufJ/rvA8Ne6BHqlWICKGlMDI3XV0RCmrgYHH6Ydq7XdYfA9a5UU88M88yFxqcY48634+b8Ww==
Received: from SJ0PR05CA0148.namprd05.prod.outlook.com (2603:10b6:a03:33d::33)
 by CH5PR22MB942307.namprd22.prod.outlook.com (2603:10b6:610:2f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 17:11:40 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::33) by SJ0PR05CA0148.outlook.office365.com
 (2603:10b6:a03:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.14 via Frontend Transport; Mon, 3
 Aug 2026 17:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 17:11:39 +0000
Received: from davidAhead.lan (unknown [10.8.0.34])
	by mail.aheadcomputing.com (Postfix) with ESMTP id C103280015;
	Mon,  3 Aug 2026 10:11:37 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: Atish Patra <atishp@rivosinc.com>,
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH] lib: sbi_pmu: Match raw event selector only against raw event map entries
Date: Mon,  3 Aug 2026 11:11:27 -0600
Message-ID: <20260803171128.3506804-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|CH5PR22MB942307:EE_
X-MS-Office365-Filtering-Correlation-Id: ff547f84-1a80-4812-b3e8-08def1824850
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|18002099003|55112099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: ryS70iYgjvkbjAgDawWqRw+rQJMMksAk0xg6yHH1dXqDNS+3H4h1OGDE4sJCl+jZr8EvEuSoFAmoxTOiYyaJkssskZmld8rJtH255CoUMZBro3swm9i0GtAzNFWkbc6AjHwZoETcJxGlcyH4DTRnSUV1GNvzgilqvNwJzw7pNv82YOccc+d8S5Z4+BeWFkMIEMhCCmGZ+N/RpNIk9jfPO1eMPhFePLvHA8ifOnh1IaYU7297OoUlluTQzEdCDdTUSlYKPNSLbIXMbJDmbuWDkwtzUblNHoVELT7S7K5VvKgxnbet7R/tiqL2PBH9ArC/9EO8ylv5bq3TptCmdcfufc7D5x7gydrZuIGKtrq0sJY+vj5Io/6SX72KOtCJrGBL5EcVADMZQP4w8OsnTCupvi4WePgzOhTBxAh5scUV8b1vCgWa0wAWXj8R2HUGLXvEgf/Iwyl4VaX3WjS5bjyxBcxcdFeqPgg1/HYH8Nc6I/birSpmo5I/TXa2CrtRn8VfJo2zdP5DlaR9QLIV8fj+CS9irW+gO4MHU+I/e+nKmPd8VxD5eXBoOK+V+XWdA1gJlqOA0KC+3pb8Yuma0jQAbEPCjJrBGSJm6iXqWGe61eKIPuGm2c2UPI6CV0epdhBzbM0R2rHKWDFSNDt5KDDM2lvP3OxdIloVEpREcwNh5sARvtsk1kzPvfZ2B5+aMogI41uCweRuwdNw3n7OhWxddw==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(18002099003)(55112099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z9UnlcLp5PRsJ6MQKV/sChLBpyhjv5DBY7XiMYe0GOXHGln3NtM2HHQO1Rq2hWVsLrEOb5bYTgE6ZvjASIDJcqtw1p+eAKUvrtTgiw0795DpmNMvA+1AUdBClfjyhTVZGhesSsFW7PNn76KsPaSuVXmPYbvPE0Kn7ZdWNM5IWUKVpqmyIZzuHnCjaH62WAaqwcavX3j33koHXorWhfERF+wHc9RqIao/AvBiK6yjs43158i4/RZvI/ecRHjt1ARB9jr8lsNI9THt2jXU74uSWtWxeHbYQu6W7m+hRdJ9phw2d7z6Iu+ulvp2JTkOGN+kg+0cAULRUF0Eh0RO47PgqiDknpfcg0rPDb+XfStAYek8QBW+5Alk6dXoT/ld9PCBTH3as46K8SVMEGvIiOS20kHZAPGpAut6GfLlyKjf/zjv367r8K4FgZRZnZXjqx0q
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 17:11:39.3982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff547f84-1a80-4812-b3e8-08def1824850
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR22MB942307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_101149_498508_B09ACD7A 
X-CRM114-Status: UNSURE (   8.87  )
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
index a0f6d2fa..4e93dc10 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1107,6 +1107,15 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
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
