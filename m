Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD88F31E21
	for <opensbi@archiver.kernel.org>; Thu,  9 Apr 2026 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xOp0JvlRxWy8k4OMmq3b/ycohmMLmzDt7CGVP5xXCAg=; b=nTkJd2OdSstCnB
	8OIqSvy34xKpvfGedPn90jZvZerE7RXutGWIJxF9OruJLd43hbbDZYY8d2UtLJgyimUiFzKC8vFVl
	9LiQIKDPEDduzhiSI8/BcqYWa8rmON7wBR/VSmAP29Yu2NtwMIjIWf66OghoDYhyTfgCiAa88VJcx
	AbpcWGI9Z0LpGgDja/okzCkiwHd39tel2rB09aV6uOiBEgmh+1Jf/Pzp5McSKVecBCRRio3FA/Tsn
	5671INpq/BTnB72CifX2VOEK4+B7+DzmvFOJBJk5J+AZHcQ8QH9jSTol7/hKHiELKx0u179RbNHq2
	979uKUXKkmeXtYBKZmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqp3-0000000AkLb-0yJn;
	Thu, 09 Apr 2026 14:57:33 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqoz-0000000AkLF-3KcI
	for opensbi@lists.infradead.org;
	Thu, 09 Apr 2026 14:57:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygsgEG+h/ZKoapHCgCovhOFF3LbUlfrBhTp1B1QXS/qUVCJ/TRrxNntlek7lGU4SAJFYp+zt4kZ8sMjvxJGXomw+CNuppu8di6bsCdx5s27jKgcsj5Nva8ubydF++kCZBrms2+h7nye4Yz1SmD4UflmIxQ2s9glO96gkiECJeG99CtKKn8llFfhRzmK1/582/qejgaAcrDfk+GRu4FRdg6g5Y2B3dc04TrECuqJtYyq69iq7B1TZyV+8WIZAjohJhaMT0saj/C1KL8hhtu3ulgxjKdUzVe0gC+7ruU1l3s7cxMd/LUaZ02IWKg8X8JMrZS2q1NG1IXGQ3PCUObuFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXGIworoXkxBBfssHq6GgzqSXHiJ5gm8CpugrLfeYt8=;
 b=fkTlCg9/PIIMQh+/8AL3AneQ9dZWIL4pIXf8mqVqxIagId1O+PCExP+s3+5Zdq/PavTcpXyR2stKaI34uvGEKIyeK+z1QiflZu6Mh73TH/hBPQBPOOynn3v3tpOZaFEyjKnMslRdBxxHxI8mAVdGtpPpqa4nMv7+doVi4hFReUJQu1EAjrMSHL5vpDkzTRZjdPJbf/63fm8f1YmLK4J99yhWc+jz4lJwE6WeBGndowybxPuE7q5J49NHoUj33M2xyZJHv5qo24RtMyOo9oLBl92lpLHqU3glodnVLJi5/MPQtEGyVMVGG1biQy9yyLM/ubz4iTl3TTyeuECPKbRkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXGIworoXkxBBfssHq6GgzqSXHiJ5gm8CpugrLfeYt8=;
 b=uSnltATesh4OuFXQInBSBg17WopWuo+Q4l152UsQR5kEjfFc2xqoW/JbGT9HWe7jERjZ4VjyFySuplFLNd+2NfODltwd2tz5OCBy8W/XpGUQvX323WL0XNGjItjZg7tPk4UQdsJsP5G9BWc7KFrsYtkHDhWFUAsmnKILintM7zp5xlnlSa3axLa6ghxqErQkN34QYWXYFxu7vnGXtn+8witN7SuIwV1KybsXjFHP9FYJfCdq6tklKve3ajPqy3Xr36IJp6VIzWIKLITbVQNG8G+EarHb+BfxklgDuczLXjlQin00S1nbJTfNlnggrYMFTm51hDlzhMRrFDR8glJHJQ==
Received: from BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21) by
 DS4PPFA3A665146.namprd22.prod.outlook.com (2603:10b6:f:fc00::b3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 14:57:20 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::1) by BYAPR01CA0044.outlook.office365.com
 (2603:10b6:a03:94::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 14:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 14:57:20 +0000
Received: from davidAhead.lan (unknown [10.8.0.20])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 1DA5C80AAA;
	Thu,  9 Apr 2026 07:57:19 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 0/2] MPXY MSI availability and RPMI notification updates
Date: Thu,  9 Apr 2026 08:57:14 -0600
Message-ID: <20260409145716.2611852-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|DS4PPFA3A665146:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e110f8-7489-418f-fdde-08de96484ce7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: wqZQLoaowwBx2idGuneJ4IENsSH0cNEiddJO1hJNMbMY8t+KCF9m10tDzbAmCndnj0xFuJ0iaTu4LPOjfdb453wHbjIYwdj4uWmd9J4WS3qEKfDQci2vI6cludKhzdu9YhC1bt67iaWljGgC6uV79Sl56ScnU3BVDoW3bFo0+Rk6+RiQ1Cdzy8EXcSRRkIzysPHQxcad5MFZRuisfmdWBllKspnJjgh2sBtkCEV5uLXm1rOxIdXZZoDC8f61iSz3S/iSGFQLbgjPhfKIDz9pA/oKMyNr+WjEyK/VRZkQYxe7bH2HCZyLsVCgogzVaa4azGJY4N5jdhmRp+ocUp/TxWbzm6l880bY2QB3hjrHff89jgzle6su8FQIeiibsmiohXf1gQ8B1z7h/f4aNKHdj6XdVhkOmLM0QLdI7vCyUERlMLP5JirVhYglTKBcIdkfFObLxqezOCN9xZZdXzRvWnXGO4ehNHLX1TiPIDgbi2DIJykevf8ws7UnbFZkWmqasJg1ZjEjkxW+cZDKT5R3qAVjcjgEByDP1a9RqoD/dsl5PNfMDyaShaBfKD36At9gRtsNa2VDRR7ExQIk7F0u2LspBrAJKvhNg6avzi+wuMfcP/qDc6U5N5rjjunHbF1z1+ddC4Js/+oFWr+SeVZmyAkV9ggv40k4IGSHJS304m4Xc2xtf5bnVHenM9pcvyfiQYSVZehrmsO5dSPiGzrvyzKW3kB7obgphMNuLJeQPo3sdm4OJl59lBFlArcxZTtJ9zgopyhgVaZU7anYX+n4nw==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(55112099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nf35XX+VJP99zydvHNlSK5VoFRwe1/D7pZxMTLKTQzMYWvJfhbRw28V7WyHBMghi/q4zFQRH1DuuzhiOp2KCOmunEBI9l4L/mcWgsrPNZZtQDPP+QMGOuMaECuGfMFnXKyezVgYLr/SrHRM36clAtf1WlT6mkoIZNkenBQnwKbQRg5bZwtctCBg5q1x6oFnA0KyXTWj+QcfmdWpqDDmcL4CflkwssLktco0zo8cRWsD8qzFzqEOa5qnolkvsVlSWLjJ4NRANHn9ivziWvqwyDQmw1QzzpULIN4xJYV95jXWvK6H4ywT46qa3IBR9PIJ/CV8ZSVS7kkIEsw5JpBrYRQOUZQCPTPkLDIDoOd8wV8b1r4vkzWAzZ7f+WuIUWK8XTZA/dUvVxDLPIoD5AftHtP8YCA/M1EnYLLrqR1Bep6nAUOCusxgOOZ090STaJYl/
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:57:20.4948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e110f8-7489-418f-fdde-08de96484ce7
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA3A665146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_075730_091537_A6DBBC7B 
X-CRM114-Status: UNSURE (   5.11  )
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

This series enables proper MSI availability determination for MPXY
channels and updates RPMI notification structures and Performance
service group event definitions.

Patch 1 replaces the hardcoded msi_avail = false in MPXY channel setup
with a runtime check using imsic_get_data() to detect IMSIC presence
per hart. A static inline stub is added for builds without
CONFIG_IRQCHIP_IMSIC.

Patch 2 adds RPMI notification header macros, rpmi_event_notification_state
enum, and missing req_state/current_state fields to the RPMI enable
notification request/response structs for RPMI spec compliance. Also adds
notification event ID enums and data structures for RPMI Performance
service group events (power change, limit change, and level change).

David E. Garcia Porras (2):
  lib: sbi_mpxy: Enable MPXY channel MSI availability determination
  include: mailbox: Update RPMI notification structs and add Performance
    event definitions

 include/sbi_utils/irqchip/imsic.h        |  2 +
 include/sbi_utils/mailbox/rpmi_msgprot.h | 49 ++++++++++++++++++++++++
 lib/sbi/sbi_mpxy.c                       |  8 ++--
 3 files changed, 55 insertions(+), 4 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
