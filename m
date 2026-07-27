Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DEAC531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fb+/5Wll5uksJaH5YtSxV8mDWLCTeHZw6gKG8HP6VoQ=; b=w4B83Z28ahovoJ
	M5EREHEXeXPNE0/GmphyZ8bbYd2UPjFdXS5/Xci8rdDfhr0ipEbb6sOxK9/yoKf2ODrRu0l72hlI5
	GCAVErqCusQnIl+ASn5NFPMI5VoratBuv1ntbSYR4jm3ra1APgG4301bADV8C/ZRq9zNFX/XsFJYZ
	TD0gUzEvuUgMXpq1gU7DPyQRk4R+w8y6YgreXuH06TZltPdmUMMy/v5MjLPp5RADeYGXjydtVJnDW
	4JZqpZg0qmPv1Vl/5caXcoMx0y4XNNF3HfpiT/+Q39Mw9Ati/lrfL5viR6/WhlRWAVHO+IcL+kjmU
	838ZPYyW1yVGPgxHQW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ6K-00000003fYh-3GeJ;
	Mon, 27 Jul 2026 18:30:56 +0000
Received: from mail-westcentralusazon11023100.outbound.protection.outlook.com ([40.93.201.100] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ6I-00000003fXZ-34ph
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 18:30:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMqVz4xhSFSVJODKQ0AfuG8Pyn3Bsw5VHGh+/Ol/0kh1dauUGOn9lMyr4LgbQf5h2wsT5dhc8ppIIF1pMG8QmsS70zEYkmbuscy9RG3jJLw6zs1Vhgh0ZI44zcH7yffJB7RKMQlh1edaO4uoOa7luIX97BeUUgIUdErLHgE3hRswh95Vdng+x9XYv3COYC7AY6iIIqxql2H+R1TZJqBM67nT4JLRX1fbiBftDYW8/CBsTsrk6SduuC00WoEdWJoK5YOc3yCmnEw71Hnos6k+aqaRcJgQJjklw+vgYUfpdbaFIefIHidetp6v+adI0k4Mxj9F7toNqRiekO98gsQdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w7wk8qKJa7EXSMNtXB3i21hbca8cBVcHAHbS0JBha4=;
 b=vgMhuWuZ7hsCvYYKiWW33Cp/jKeF/k8FdE6EmQ7xm+RfkKrg8A24D1QshAvA6W5iHjl4mnHOenbX7ufb2CF8idBC8Lqd5oYILrqYcvbfOtE5hG7BFvmu2cScDG0240gcTS2lXdD3B2fTb3G4znLRsWMy5SMOJFP6zqxWhUdSZP3Jpd5p3Tlh65pbJGSMQ+AYMF369oKaHsDchV0xuFI5ecdyqfw6Q6szXScc4ahJziQwsUILB/yYmBPWdX3eup7zoH5N3ZpMLl/dx6jzLeB1O8mIFDXpx1aZO2EugTHAbsygTlaL10N+x+2A+6mtTKQicCh5N4npFchXL+hokiJEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w7wk8qKJa7EXSMNtXB3i21hbca8cBVcHAHbS0JBha4=;
 b=khAq4XtoZntF3JnTJ81swNYNqzmJ55dKgPOZxGlhSclXrd80wZqRSjA+cYPExFWH6d0hSfLf2w+bI8WVjLBQTIcwvmBx+IBpta7Bmkmi1BlpP44cij9sLnIKuhbTOj4eSQV3u743gzUIvVt/b8eWvUH3o0tQ7sUUt+lt0vX9eK84w4OzG+g4vrDjKcFNQaAPkXj2g38cK1Vy6Ry6x5kdOP1oPLZXMKjgiAigSVJ9T6Twcy3A689rKP58ovJCixJJySCI91fsYv+EWOnSpf6pfAWVIUs0v9MwAIQGt367RTNbheoQSLl5xE7zzrE+vcUwhMIduPinKYiSPObvAvMmBg==
Received: from BY3PR05CA0014.namprd05.prod.outlook.com (2603:10b6:a03:254::19)
 by SJ2PR22MB4485.namprd22.prod.outlook.com (2603:10b6:a03:55d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 18:30:47 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::26) by BY3PR05CA0014.outlook.office365.com
 (2603:10b6:a03:254::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Mon,
 27 Jul 2026 18:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 18:30:46 +0000
Received: from davidAhead.lan (unknown [10.8.0.39])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 875658000D;
	Mon, 27 Jul 2026 11:30:43 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 0/3] lib: sbi: dbtr: per-slot trigger capability detection
Date: Mon, 27 Jul 2026 12:30:38 -0600
Message-ID: <20260727183041.258377-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SJ2PR22MB4485:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9b22fa-4f1f-4ead-7e46-08deec0d2cbd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|6133799003|10067099003|11063799006|56012099006|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: gIunxIE5rgkyN14DOvOWbHk6X75Bo4IrftvbpTCWHc71xoJh0jnKahO0nD+oVN1oDIZ0BFOaPai0zskvWdkAB0FLH5ailefPnTIQKsigiTrUt3P0Z9ubnt8O9WwweMVYvuIm3X1ZmJ+PTRR7we+TaJr9mEIMKwh7zXAEj0NZgTth8ELnolpRwNDRZh/O58jhCcBkecuGl+OzHcNXN+egG8V2KF4QGcJlY5u3isaxf2hTDQzn45o7BEdAxQbMkkkUrlnyZEYByBpp6FPDjipupAgfNsmsBUswQojrSs+Vd7AGfF2eRpPUxq/BMr6gH0oAS1i0icERZVNX53CeeVNnvzBUBosDKRrCTtX5S7SI6hb9hEtOxPL+y+DOWqlXtcP9htM/tUwjQMfOrZnpp5Q5N42VNd22pjlUUag+4A7l3ktrtOdU4fk+RLSAL2xKPXJJYoNNMMPjdEnUy6s6o3jbuC3TsJnYm5qXH4issizfI3Abxc6r4kFioi48HMAX5kHC6KK4v/JI33RyXhwUOeqnqp+dyNUSPBV0DGEMNhMsub6JqFUW7wWbIyQEPPhClvr3aOsUdkqredGPXXRprp5OR/NZIJC+GSqESPIQermoUpxd4yiwjzbYYWtNA06GHWA8mPGSP5OQVN36cuUJgab0HXacQt5XOIvyxawDOOrxUSBJ3LFXvliNmm+Vk94ER1APvfGqUb7gErjQHXYbTO1XkA==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(55112099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0+fQDMl2CqFO2YQsQxEzk5lmxsajXByL12YUQMQklFpCqC+zzA0OegmVniyOIuT7QdFuWzPB/BTK+KCjACmV1BW41DfK51nzyV8nIX2CRha8iugawvS3U6JtNuvrRlZVmUeSGSkbW40pvOfCC0PDBH7xVcnyNZJgaTU4Gom74JZh8+X1XZBoKO+IGXrYdKilnNdXN6Q1l5NxMc1Rr3ckWAXnoNkGSuxMzPF+Eetcv3EPyjIec5OpnBe8eqA6cUW64wV3SX1UCq8SC/8dmErkhnsw8krMxihQZZ0d84t+y8ULBRgqbOZ1SvjuYGrkCqgPkT5p28BrxB2zNyXkel8x1VLEusByMCH1elNL3tr2W56OfEt4tMDzHUMU8QqJ6nz/3985D/1a390HyvMXjd9GPh+8jLL5GRF1UZSmBLQz+igMfqbOqfo1cyEB2wMUXkCW
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 18:30:46.1992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9b22fa-4f1f-4ead-7e46-08deec0d2cbd
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB4485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_113054_939876_F3713444 
X-CRM114-Status: UNSURE (   4.30  )
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

Patch 1 adds an optional platform device (struct sbi_dbtr_device)
reporting whether a trigger slot supports a given configuration --
WARL fields tied off inside an implemented trigger CSR are not
discoverable via tinfo -- and makes trigger allocation
configuration-aware instead of picking the first free slot.

Patches 2 and 3 fix error return codes: sbi_dbtr_read_trig() returns
SBI_ERR_BAD_RANGE per SBI v3.0 section 19.3, and
sbi_dbtr_install_trig() returns SBI_ERR_INVALID_PARAM for an invalid
trigger configuration per section 19.4.

David E. Garcia Porras (3):
  lib: sbi: dbtr: add platform device for per-slot trigger capabilities
  lib: sbi: dbtr: return SBI_ERR_BAD_RANGE for invalid trigger index
    range
  lib: sbi: dbtr: return SBI_ERR_INVALID_PARAM for invalid trigger
    configuration

 include/sbi/sbi_dbtr.h |  10 ++++
 lib/sbi/sbi_dbtr.c     | 166 ++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 154 insertions(+), 22 deletions(-)

--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
