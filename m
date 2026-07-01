Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29963C43458
	for <opensbi@archiver.kernel.org>; Wed,  1 Jul 2026 18:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3RAEd+j6+LEebZ6roBD2ONxjE4kYH7/Mw/soxs/mLEI=; b=0KaH2HfVC+l7Um
	iFwouCX0aa8jhQYgkLwaczmhZdonHjyXZRfvN7DmjUTgBF4Eyx2fVjBbc/yOTymCW2+DR3OCgGCls
	7snW7oJC6MYjFVpAKgaw7ouUiEPJvASHsJ0seu++giJ9CFi5xoo8xkSS9ubFOmJld8eHiZ7w/coQL
	2ZNOjazOhq0uXfbXeiVEAbRiDj0FD+Ib+oDvVdqqBiC3X5jt+q3PaNJj0cAh8SNA9v2UkFcIEx3dK
	Lcaf2NSdtmD7xRzDiwwb+Md77XCRRF9MlxCAQM8/0Z9GlLW3ikVPlSkEeQAtLOMxZCDF7X2d9gpdp
	x520FivCLAcZUtQ6OI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezRY-00000002nzB-2ErA;
	Wed, 01 Jul 2026 18:13:52 +0000
Received: from mail-westus2azon11020111.outbound.protection.outlook.com ([52.101.46.111] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezRV-00000002nxx-2qOb
	for opensbi@lists.infradead.org;
	Wed, 01 Jul 2026 18:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttElbGUF7qkP6AorypOIqTUboLrNjmYv2CxwuWX76HH1n+/C3Q2MazChKorKktrWlblGTY27OFBFqJ33Tsz4vwnrNrsOiSKrmdbfzCtLrmKGw2BtUI4lTRc2aU8zIKQbqbK36+UF9DreIqS2k8H/YvsvtV1tVWkRYPvalNJM4Y2Y2DpHbZ9dDJqETqsdPeHoU6EtMPostq2EH1TXlbwtrmzuNnHtEa3h7AHvnq4+TNNc/TWGXQxO52RshWYtvTsRxGMhYEsKOX8+AOEFxXoChHssV9PqNX1fSZaxlZMQwxztgYDxdls/+h3CjRtb2mvksqirb7UGCwwbAwJTyj/Q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucrGSGlpDxKPxS2vUMjfcwkIX+6Yk9RNHcy6YPUr8NY=;
 b=l7tdRoTSgafBQp98yKmdwYP+xVx25PG9HZ74PFA7SOmPCZLzYcjbxJSZwGID1HqWxP53ym5d2XkJAVpVqXV0zMArlSxygWEYsr+RzrK2uJaPkloRw14djmWbK/kfnNm/j+sllrG4UuD+vLjEPBDOv3BCYspIoDQP5oUiBdRbNIN9X1pHW5MlDsGtsWx7EA+S1XSiP9OqbxFAQ8RJnRVHfcxwN0Dr6Zijn6ikcGi6esVXPWCID9uDCbtSmmVstk6cyVZbaIRESPKSP33yYjvTqXFeNmzScdPMLfwmM9gK8v0SiKbY9PJy6REixyCANJtibI+e7acJWnz18GHkCrpsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucrGSGlpDxKPxS2vUMjfcwkIX+6Yk9RNHcy6YPUr8NY=;
 b=19wk8giirALAlJCpAR5Iq//h7nM2GrDa69RKqgDiw8QpeyploVan0FONo3qodpQh646NZ1NoZ0zvZ79Y52N4+fT4DMuseMUr5SUIWBJQtIuRNSFhCmUYcJQR6HojIRZyPPTupMhe/UV7uDM5OpCw0JE8WIEh6kvrF8guv6Sv4LaJEK2ocJWyptMFjctgLMc31iRXbXV2bo8ZTp25tdldvualhWSoFfTT9QcH0o2AHUlFhlSgqpwC5GP4ZKB5ujH5njfdyBPnkFAaBQpajGguS7QA8vJNNh4wObxrJzszCMZCSv4x6rmTlh4Q/UsdhnnkH6JkdDr1eT3CU316oJnpIQ==
Received: from DS7P220CA0076.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::10) by
 CYYPR22MB4245.namprd22.prod.outlook.com (2603:10b6:930:c1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Wed, 1 Jul 2026 18:13:38 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:259:cafe::17) by DS7P220CA0076.outlook.office365.com
 (2603:10b6:8:259::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 18:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 18:13:37 +0000
Received: from davidAhead.lan (unknown [10.8.0.3])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 5481C80594;
	Wed,  1 Jul 2026 11:13:36 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH] lib: sbi_irqchip: fix device lookup by caps when first is NULL
Date: Wed,  1 Jul 2026 12:13:34 -0600
Message-ID: <20260701181334.969877-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CYYPR22MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: 1735edc1-8db2-4256-4577-08ded79c78f2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|5023799004|11063799006|56012099006|55112099003|6133799003;
X-Microsoft-Antispam-Message-Info: 5LVuRqubRlndSZrykqQzqfxa+mLJzSC0aEbeSLSykWbPeFzX4Z7ZC3Pkkl2Hf3plW8YSJsLx/gCqFUfNpiwGFvXbn+ufQkOL/sIXLs5WMh89J8eR9jdOIh71LCtDm8VPuYfdLNuqzKnEx67RPzhq6PFTWELvqq75MgaydFxVn3KsNl8HdMBMw+zQZTqepk6rARV0LrjpwwUISIihHczXsn8iBAqaqW8l7sCAet2/66bRCaxFNSMhF/rJp45J2t8PdVfhwb6AEiJeQlOiYzlDOzjIbvFPHweS6rYogWVtW7yjVM3lEH0vbJT2cRKlHADVrAhTEH/kSQPZIJIFzT8kkquF/gQxlmT2IXR63pcBzcolUV8RkNPZFOW4yFBE4aO4PFPn9FliEzHL8oUofirXhxV0nG4w9Dwhs4naUT26BcR1QKG9Edh3IiT5Nlo2KQoGij1NU8hIaCoSb6rVjCi8/FNQFcO4rt3P0fYxwTHD8ANI8+wXhZ0J5IUtByJadeafG61eQq/LXZSdkovNBUJEiV8LFtgxf0NA95Pwi1rYsJWpCrmY0S9fKs5f5o4+wzBmuyIW5Whkbvfc0xjz/UczNyNSY7lsUWgmRRNItI1vXh6f80jvdrO9JP9GqYLUu9x1Djl5JiBp24PAb+kAqpUKHFeEchhfaI69H2O0aWYkexKzMREuK+5M00pciImhH5yyfKF3cPP+geuxWnVoEEMePQ==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(5023799004)(11063799006)(56012099006)(55112099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VYz4B2OuInKDFEXeh5KKWBfBpGARTJDqExYBc/4ot1pZy3iOxTh8rIvq+3rkjQUOdHSV+zEIHax82fk/TCqHBLMTJYx6Bxxw1CYLPZsoZLBOJTkhPEW2nhEJnZLE9EblOrOVoAF6R34TWCyY+tj/mfaOG73PEP9AAx6hnoOuf/KAQ5S2bmuWdXEpZ2jmneprJUMhW4sGJ7w6wRMdKJh/Ti9xm95AM/5bPPKuJ+qT0UgHcPtMSvgCWkG6e/oejDYF0XItvJC9kDwYZOTr63tv4sds2tIJPo2PH7zb2dabY6lV62+OCcu3kk58hbS9cEtSWQRv4RodwYOd1yPONCGm2QJa1LQvoLmClVA2JxPdi0ymvPpqeyskZ9TrhUdtPeTmGXFU7cZgoI/ihiQyy0pm8eNFpOpRRkCvvw3W2FDxRVJpFc8yVLQXwG03aeqgpQsX
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 18:13:37.6334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1735edc1-8db2-4256-4577-08ded79c78f2
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR22MB4245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_111349_888371_48A6E09E 
X-CRM114-Status: GOOD (  10.49  )
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

lib: sbi_irqchip: fix device lookup by caps when first is NULL

When called with first == NULL, sbi_irqchip_find_device_by_caps() should
scan the device list from the start. Instead it always returns NULL: "found"
starts false and only flips true when an entry equals "first", but no entry
ever equals NULL, so every entry hits "else continue" and nothing is checked.

This breaks MSI detection in sbi_mpxy, which calls it with first == NULL:

  ms->msi_avail = !!sbi_irqchip_find_device_by_caps(SBI_IRQCHIP_CAPS_MSI, NULL);

msi_avail is therefore always false, so mpxy_write_std_attr() silently drops
the MSI attributes (MSI_ADDR_LO/HI, MSI_DATA, MSI_CONTROL) while still
returning success, and MSI-based MPXY notifications are never delivered.

Initialize "found" from "first" so a NULL "first" scans from the beginning,
and always continue in the pre-match branch so a non-NULL "first" resumes
after the given device.

Fixes: 8570b938444d ("lib: sbi_irqchip: Allow irqchip drivers advertise capabilities")
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 lib/sbi/sbi_irqchip.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 6d0df02e..f1bc24ca 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -412,14 +412,13 @@ struct sbi_irqchip_device *sbi_irqchip_find_device_by_caps(unsigned long caps,
 							   struct sbi_irqchip_device *first)
 {
 	struct sbi_irqchip_device *chip;
-	bool found = false;
+	bool found = (first == NULL);
 
 	sbi_list_for_each_entry(chip, &irqchip_list, node) {
 		if (!found) {
 			if (first == chip)
 				found = true;
-			else
-				continue;
+			continue;
 		}
 		if ((chip->caps & caps) == caps)
 			return chip;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
