Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009CCCFD641
	for <opensbi@archiver.kernel.org>; Wed,  7 Jan 2026 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vyILeCfhPbeQRo55gLXgTYq92WaFLjI61gSTLm6kGho=; b=se8FOIMkJ4k1xc
	cTh1eGSVwMERFP1Oozi/Z6QTcUy/JsYmTSBzlhSrV5EyMkSj4X+5xtd1zLjWRlzG6gcHvII0FG+hm
	7tIQS9oX2YdlcEILJVRKYPsafGwYtEdpwq9bPPWhpijWYYi8GHC2upYvKbXzOcRLlu8+XFjJ4+KRS
	+pR6OVPn3JzMw583c+rOXLyQ3cqdyMjyVXPwoy2NdnjDVz4N4l78T3KRUGEnXJGwbbC8TdKDcrEvt
	D50NclIpWcIn+BIHnR8cYjrbBml64XEpY2wXBWGA4WnPrZOvLxpTmzbOTXZe6o5f0Mz0ZaEW63ftk
	94RtWdR2hONP3oEeX1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUre-0000000F7tP-3MnI;
	Wed, 07 Jan 2026 14:50:22 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUrb-0000000F7sw-3Q6G
	for opensbi@lists.infradead.org;
	Wed, 07 Jan 2026 14:50:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeKxkXVSITeO4U4bTTYcJe0v9xoBaYpSvvQAbvOLVl5jzeRG3lxfkd7Q92jbnkVpgUPb2euBoTFOkmnYVAzvdMwOCtKCnkY+5ds19Tj+80WCgwF1ELuYo4HhelTJYTKGzFn5kZHoJBWJASPh8tY8krEJKHISwQLd6qUAjI2vAbbSsLG6TY/WZ8X6DUm5vT6fnvzY3f/lGjTMv5RxpJ45NXWF/SPi5TLqY7ttJgfwe09xBHkjUEXXTgxpzm08OGAFiCZ+tvw3tQiHJtk1D3hNbeGiVhYng5SbNkQaER5fIP+f27Bp3C9HbTgGsJrVMN9dTf4QCaKsIHsb15FI/1ROkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bz1zDyNKhqBG7FLwjtPmPBbJ7sO8F77vbfrx2QUv9BY=;
 b=g/sOvZCOaOMoTkrQ8OHiGtKETCnEayUSZMXIr6fAV//rJnRxcobfLdAjTXVcWIJu+9AGMFFTdX8HxgbUdcaRgphNhS3bbX529T1Sn8jJah9jjSslPtDQ6bV/esQkOnDeXpb/JoQgw9MMitIJLHsaj0NLJqUe+fsZyUb7PboVzjGMOII2HiJES6f61P9b5DZrsc0kBioiRT79eEfM9i7DjEUhC4cpk7ACygVH/BvN6Z/5NwIs10/UGGax4VqCWm0wH4YcXLC1dHS2EikcfZk1EQ7DNsMJ4KtryDpzkNeY0XTxyEpbeZtsdi7iWxDxa8SsFZ1cE0CEumwtxtO4nTPtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz1zDyNKhqBG7FLwjtPmPBbJ7sO8F77vbfrx2QUv9BY=;
 b=UzAY9Ro9asbENGCcOhokEXWwf8uTqEVdy4efc6hfbFAQHj3KeGnyx5Ds8XYrDxHanseCRlTUc47gAUH7GUWhQWJhxxPqNIDZ/A3yTVrZkpuD362X0SHdJ4cAHvnEDmXBhpet8QVPmtb88xHIpKHnwvdLXK4iBHzkpIsaGNFf9hQ=
Received: from BYAPR21CA0014.namprd21.prod.outlook.com (2603:10b6:a03:114::24)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:50:12 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::82) by BYAPR21CA0014.outlook.office365.com
 (2603:10b6:a03:114::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Wed, 7
 Jan 2026 14:50:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:50:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 08:50:06 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 08:50:05 -0600
From: Michal Simek <michal.simek@amd.com>
To: <opensbi@lists.infradead.org>
CC: Michal Simek <michal.simek@amd.com>
Subject: [PATCH] lib: sbi: Fix behavior on platform without HART protection
Date: Wed, 7 Jan 2026 15:48:59 +0100
Message-ID: <ff5d68f0fde594396300323736416063152dcb2a.1767797338.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bde85db-e6ec-40cc-9d8b-08de4dfc0f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l7qG9nR2xGpH0tA1YZOuF91rxoHMQ6VzNcFhBpbAAJUGCig/zFLzOliild9O?=
 =?us-ascii?Q?BSblDjVyEalLxiHOI3Em8PsOuAFkrjLbJMeURKtXJw31kQCkQrmDxMroogPc?=
 =?us-ascii?Q?ubjatXulI8YzeHEHOAmYCQXpLmdEBqFXsX/fs3NPACYliFwEWYTeK2+SjkDa?=
 =?us-ascii?Q?FnFXX2UVH/oY7RuheKHnZCzKEFwyBGKsldlltZfG2cBvF4QD8dHMTYIsxI85?=
 =?us-ascii?Q?+Q+m//VJaGgxhbZ6OeTZnNhJ/Z4xw8ICM10w+Jgb0g8XEi9GyetGUFYfaBcc?=
 =?us-ascii?Q?S1D0WayHdkmupfrQDnwy1/ad3rdgdAd5Jy2Ben1rXaPYB8VNY2hVqbmMqS46?=
 =?us-ascii?Q?SBBKeznUh9On6WZ5vPBCelM+Es6wB2sGJy9jPhGF+gaN7STO/CHe6hQXL1Fq?=
 =?us-ascii?Q?SPtvDNah6JjWSAyup/mhzXAvHPRSUeODPlMkcbB+UxvoT6MPZWZd+LAHivWP?=
 =?us-ascii?Q?6V11EbdaEl0AUvg1Yqh6QFxYFtjxCrE8H8facs62d6pq+ma7iPVe1ZagHyDs?=
 =?us-ascii?Q?aXaet+Ct5MQdagaQKjtgPz1Gcue2PGo5f5PWRfIyXOQAYeqmenxA7JLACHti?=
 =?us-ascii?Q?MhCESXxRYqKNCISkO1V84PRT56zQP2iVmlBPoXFwwouQ1zi4jEiSrN4TwOFf?=
 =?us-ascii?Q?+f1UCwauC2OphBw26TEB5QGqPgafpKgu54Nl59JPGr9t3bnac1RhEaY4T8W5?=
 =?us-ascii?Q?OeYzV7W8Wd5bGX1qN7wuzWZtS7sIAoMONj2x2FjGFiCVsd+cEHmcqVWEx66R?=
 =?us-ascii?Q?Z4ChwiI573sVUCOdF+IEiKqnTu1YOgogVdFjJVOJTWYFv7iYYpFGSejs4fNG?=
 =?us-ascii?Q?YV8ZAEgczoH6Zoc9tLwfm0hXK1xHdT632EWQcEk8ZB6wAuBqUT5abcEkVvHp?=
 =?us-ascii?Q?6FtkbhPsODF6XCFCZCHn6z9UfFRexgXmJBbTUFj3tmKVROzNc6q1U3DUv785?=
 =?us-ascii?Q?ZsjcNJfUqF9kfQ+G2YGgF9maWoGbSeNnxLjyJ2EOkAn9jEEwfLXLNjKygaj3?=
 =?us-ascii?Q?U4WpNWGEp3PdgB9WXZjGQYpwPMS9A9RKuJ7GyO0E3Awd6HAcF5+jcw+37Fie?=
 =?us-ascii?Q?OT8nLGI9wz7UvPFnAyPDc9LQxA0Mmealh8W3AHAibIf83D+j+/qmnvXt+hMH?=
 =?us-ascii?Q?4u6TN6pP5nxfuCr0zWC0F6fyytpnOt6+TFOZ4rq9nz18b/yM4VHI6sJuKhPh?=
 =?us-ascii?Q?oaYH/eJ8S0UfTW7tDPrPDCa0oLSwkWyTkKlgSJhCf3x710IDnDhTg6d60RVR?=
 =?us-ascii?Q?7UDsXbA+TAKiG9Mx7OsUwPQowDS15GwssF04JxrKRS95BvblH5KNGXRUjWzU?=
 =?us-ascii?Q?f42LHpG8eyIlQYBeP3HBm0oFqA8ky5G7DKin6T2xJOjZK9Eec56YuKd0AzpJ?=
 =?us-ascii?Q?M8Scw1YqC7SrJppIKrRY2vc0xHj+9K89fACiSoP8TJtnqy4++fX1deM/yE/5?=
 =?us-ascii?Q?Cu80dEc6YIm5Gz48XeilebCYimZ/ajTDwDhV2O6exm7cp5oxCccJpNgbKucD?=
 =?us-ascii?Q?YPBv0aaVhNhgbzEAFy8lszLorLATDozqYgQ0krCUe+/h6fpHAkis9NW/hj63?=
 =?us-ascii?Q?IUg7xAwPtuD1oTnSsss=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:50:11.8665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bde85db-e6ec-40cc-9d8b-08de4dfc0f7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_065019_885492_4BFE1A94 
X-CRM114-Status: GOOD (  12.87  )
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

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 lib/sbi/sbi_hart_protection.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index 306f5afbdaea..43e65a38cfcc 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -54,7 +54,7 @@ int sbi_hart_protection_configure(struct sbi_scratch *scratch)
 	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
 
 	if (!hprot)
-		return SBI_EINVAL;
+		return 0;
 	if (!hprot->configure)
 		return SBI_ENOSYS;
 
-- 
2.43.0

base-commit: e7fa66c2160ec139de1853a00f669c09320a9256
branch: track

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
