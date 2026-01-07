Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBF7CFD65B
	for <opensbi@archiver.kernel.org>; Wed,  7 Jan 2026 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TAqy+bfU7oVNzG+f7rSlhjYmw1Z6orJAw5kp+KVZYAo=; b=XgY5Vua3ahVsRd
	z5DUXLyJuojruNZhGhGUiDrMmtc9Pf67g+NdU5hBITdGIDUgW/LixTVn11D4p2CHas/zrPqYlFwxk
	0IKFwqtMt/9DwxRs0kFEm2QoZTP98RNDyCD+fxocM7bsHwOVFxU1OZcYuqNw+25xUU+A3LOek6syU
	NUXA5QNwdzgaD+zWCinvV5l1rfsL+K0QCJDLJx25rQ9F5iOSu3Big1G2Y57DwCfZvwN2tTY71eCmS
	60BViBo53jNlfSpwdnDHjs9paDy6S6KqHbS9pU4VmyrPpapWHzjrl6X3lYx1DP6IH5Z+np17N4Hgn
	B2CfwWWJZ+1lqZZcen9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW29-0000000FE6a-2INq;
	Wed, 07 Jan 2026 16:05:17 +0000
Received: from mail-southcentralusazon11012057.outbound.protection.outlook.com ([40.93.195.57] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW26-0000000FE66-1eFV
	for opensbi@lists.infradead.org;
	Wed, 07 Jan 2026 16:05:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvBu+h+JZdOe8pnJZc7u5slBxi4DP9738phsE7lkz4rE3ZOpnJyx/KR4fKaIf93C2q+rX1i+WjdxA77YAlftMQon6yp0O8kcly6JtmRuMeDtKWkk8rZ1Kz7mNjBgKH7BxO7GWDLI9R5Er9u9EURy46rPd+hRmTdZWR9tDzFAu3PB4PB4IgUKBnjOJwi9rJyiQGLA1JJFey+iEPr0/T7eqXX0I7yDA++vIK0i6Nyrq53l1S0k2LQZuah4cjyGy4tJkbUMAgpV0ZfLpv0AS0gMU6mojjZQ/x67/aKGvujUCrzDTkuYUmLLv+Cv3vU1q4rVYRchIOVOQWoCytPOgkIUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c6vPLTEte8PzG+aJZkhVPjtgIrjqgJnIfLALK4uB3Q=;
 b=xNBBuUL2ZokcFiwYHT0SyksJ4zbOBVYPZhuAuTjeojuf+dWSOdfAG1oT4xKgKl+H3JvgifxXyS6XnxMMGnfnrgMKOi1b3EJhNGB7gRUFH1Nb5sm4+zRDGryzY8h+JcLhAflKkT+w35hQOdHeW0gjhrEmXEw95I8YmYlGCjXJ2+ETP7kK7GYP/ocUi1BnR0h9wvnyiixYV7NTCNe0pFvEa9aFBDdzgg96IUHnGdkl0wqXNc03RQB/yTRjp+XQv57aqlXihUZJOh4uxGiLNCq6+Hum8dIN10LxODQXrWMv7Ezd1s7lOcrTBCt0hfDImF8l2USC38+dQXOx8Z7iaNEbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c6vPLTEte8PzG+aJZkhVPjtgIrjqgJnIfLALK4uB3Q=;
 b=Ch8DNkr3aCzRLKk8RTz3HuJOX8JJMB6btXkSgNNkR/NsHO6v/zC/cuax8We53KaWGdMdNm5/tJDIKB3iAZFg+d6wTm0eUmqtb0VXdfMS7exGaGLccmslJ9l6Rw4Niv1b+PVqpWWeoDIf4yq4gdvOr2R9RXDWjQu6jG9izu1IyMc=
Received: from BL0PR1501CA0028.namprd15.prod.outlook.com
 (2603:10b6:207:17::41) by DM6PR12MB4075.namprd12.prod.outlook.com
 (2603:10b6:5:21d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 16:05:08 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::ac) by BL0PR1501CA0028.outlook.office365.com
 (2603:10b6:207:17::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 16:05:07 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 16:05:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 7 Jan
 2026 10:05:05 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 10:05:05 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 10:05:05 -0600
From: Michal Simek <michal.simek@amd.com>
To: <opensbi@lists.infradead.org>
CC: Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2] lib: sbi: Fix behavior on platform without HART protection
Date: Wed, 7 Jan 2026 17:04:56 +0100
Message-ID: <bb8641e5f82654e3989537cea85f165f67a7044e.1767801896.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: michal.simek@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|DM6PR12MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: 308bf165-f61d-4f3b-ef21-08de4e06864d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vSYCtx+YqV4CbCRFwb9lPtGwVwj/4aWfQkL4QEKql693SypWot3KrAO5QB2/?=
 =?us-ascii?Q?TFAfXlnWTr5BN0UUHf+i+GyIYxBobxEwLgXOeK7W9JohJFFXRujFojUnoSCG?=
 =?us-ascii?Q?iOBxJlhcwFRPuq6Jv/CKsCxJkWjNmy2fprEoPEVH+twTdQo0ArjC8T3AmJYW?=
 =?us-ascii?Q?X7NAFShwIXi2QBZvzDTCMeZNCcfVPcnsLsskD8jJq4kKl2/64FcEj0IKHkOY?=
 =?us-ascii?Q?eGPs5vDCfobW5c1zZRBPss56BRvoWKn6uyCUGnkWe6PCuUnJHB1cBq6kuCFg?=
 =?us-ascii?Q?B5ixQ9Bb1cggR1yRegd1RC9HPAa5Re8L4IlnP96iwBo2kUTwLH5T1YMNiD7p?=
 =?us-ascii?Q?V1Wcy7FTsZlnL9hsdqDron38kWSf5VvkoGTfuhcRSxy08CeDA2u858KrDE92?=
 =?us-ascii?Q?D4viI32GSuuXPsxdUXkjMj1hl7WUDiMwTEGZoQ7H/m4X8RWwwY0odGVBCdnp?=
 =?us-ascii?Q?gTU3UePZYtmnq6QI2YpPRQpDdANyCbKwPUzbPp39q8inzCLLB/4kvpnXiQ6D?=
 =?us-ascii?Q?YfTM5e7Wx/bSoO2bj1opDSdmM0m62kgRoVokKw1eilkZIYLjQJvIuVRzShlD?=
 =?us-ascii?Q?JzD//Rc0fkWKTey4+6UEg2+o6oqOLHwIDHhK0CDQ+59s47oAz6mv8OOETaFu?=
 =?us-ascii?Q?0znSk9ghKG6hDPm6qXEshpXZz7tbgb5GvXwFDDgAhQ3LMbjykYTSSc7dQhVU?=
 =?us-ascii?Q?MC3i/JtrNesKYlYTJZdM2LiF3znlV9MYL51Dlg7soCIMnkmkK/WcORVsesJ9?=
 =?us-ascii?Q?4bUP1/G24vZ4bD5q+qL1DnZFdfPYrEU478bFbW5bSFZyy8p0rqquE5VdAC7K?=
 =?us-ascii?Q?xZpj3Ll3v2Uc09OdtR3roDG3CuqxTl2Khzcaesh2Nj/Qgunb7rdyqd6EwIrT?=
 =?us-ascii?Q?A6ZeJZ8lLv/nfupkiDg4KUPzkocMZeq0xRBkJUZ8OfgDALF0KzpGX1JoaEgg?=
 =?us-ascii?Q?AUdYJIEntiHAuBVEadPh0gieoz/uJ0fhvSdElkPOmyWrNRxB564UGpT9sSTb?=
 =?us-ascii?Q?8rGJypAeGEei3phW0JfgPj884in48Su7D5KTQ8MhrctddARJ6fx/M01Xh1ey?=
 =?us-ascii?Q?IzNcr5ul3dG0C8rgQ0K4lk7M7wvPf6jXdLGEolPRT4DLbslYE/RktpokhbEK?=
 =?us-ascii?Q?Pdjrkd+dxfTkWSpWZs0jcYxvnuDmrr8im81xeGeo2udfnlfFAg6tAlo9uVX5?=
 =?us-ascii?Q?Gk3hJIl/jZg4/zJmCVI9zBWo5fM81UAFDNxdCekU7+VUbK+tlM9Cy0u8vq2g?=
 =?us-ascii?Q?L5qIi1ck0yX2VkL+uHLlVwr8uq9A9zjdsa5rMjuxxDTMrsogeDlplWkqIlQp?=
 =?us-ascii?Q?/nlj4n1NJ9lkHihqCCLcz0yiiO5pyAOREKXfooPHvTMlfRW4t0xlHTag3bq5?=
 =?us-ascii?Q?wsquiL3s8f6VBEkXOxD62sRBAfQlHafdKbQ2mKhDgdlr2FjOSElvR7OccSj8?=
 =?us-ascii?Q?B4kxTdI3Koq6RGoFcD90psiqb6cWd9TnIuTfZ+xTwgMi/potjE01ELt2zQNG?=
 =?us-ascii?Q?Syc22NUn2sUJAPirXl4f/pBTLw7ZWc/PaCqZRw7Oo/cPCgYzakeb7Xpe7kAW?=
 =?us-ascii?Q?P8vJ2N3JEXXx9+Pnow0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 16:05:06.2739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 308bf165-f61d-4f3b-ef21-08de4e06864d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_080514_498360_7823E6F6 
X-CRM114-Status: GOOD (  11.15  )
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

The commit 42139bb9b7dc ("lib: sbi: Replace sbi_hart_pmp_xyz() and
sbi_hart_map/unmap_addr()") changed logic by calling
sbi_hart_protection_configure(). But when protection doesn't exist the
function is returning SBI_EINVAL.
But on systems without protection this is correct configuration that's why
do not hang when system don't have any HART protection.

Fixes: 42139bb9b7dc ("lib: sbi: Replace sbi_hart_pmp_xyz() and sbi_hart_map/unmap_addr()")
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Changes in v2:
- Also update
  sbi_hart_protection_map_range()/sbi_hart_protection_unmap_range()

 lib/sbi/sbi_hart_protection.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index 306f5afbdaea..e10c856460a4 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -54,7 +54,7 @@ int sbi_hart_protection_configure(struct sbi_scratch *scratch)
 	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
 
 	if (!hprot)
-		return SBI_EINVAL;
+		return 0;
 	if (!hprot->configure)
 		return SBI_ENOSYS;
 
@@ -76,7 +76,7 @@ int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
 	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
 
 	if (!hprot)
-		return SBI_EINVAL;
+		return 0;
 	if (!hprot->map_range)
 		return 0;
 
@@ -88,7 +88,7 @@ int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
 	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
 
 	if (!hprot)
-		return SBI_EINVAL;
+		return 0;
 	if (!hprot->unmap_range)
 		return 0;
 
-- 
2.43.0

base-commit: e7fa66c2160ec139de1853a00f669c09320a9256
branch: track

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
