Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BCCC5DF81
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 21:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/XVeMKxjPZz9LC1SoqVoVvmv6AIjIXMzq6ZupoB5XM=; b=WS+sXgLdcB+4rR
	vrBn/6QYED2bvr6FlJ+IP+eAdS6uW4pKhAa4ZODNs+I8jB8S09uIbFJy+on09F3XG5oJGz4lTMCWG
	n1smFzzoTb994tVSzCHQMoGEbvdtrJ7eeAJtKrsqdbRVsXcJrHvVVEQuKXAOZAJwWf0JPaveBw5fr
	v+Oh9KIqyMAOomh4+syLHtL+tUaviYbt/eIkdYxAe8dh+ycd00b2VcyBFM3A8cRJdqMC0EIHmGcM4
	D+tbg/kJ8Orj7I8qCwYNl95KESYPc64zhHoaIewRY/94iDIsDHx7hRt4Ctpy/pKbSctZLFvSjszfx
	F5vOCBHANQq7i36gbLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQvJ-00000008eQk-0Ghf;
	Tue, 18 Aug 2026 21:00:41 +0000
Received: from mail-northcentralusazon11023073.outbound.protection.outlook.com ([40.107.201.73] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQvH-00000008eQK-1SrI
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 21:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0rz98/tFpjlynvEOF8jcXbElBAO7445MD6fik1THE1RWdkAblB/+Zf4PhFC8Pee2u/9+ZPoWs2xli6AaFTSm4uNcMX45cPm0ddK3MOkPKEmPmwNuCY6ZQiJ1l4wUpfLNDDZeNFr/cvPOPpWaederdxYVmLCP7l2DRr+7TsWFcpenoNR9GIzq4OdcyRNe2nZYMqRA/FSv5Kgepqf3KrbM6d40mQ5PCJNDh+xRT8TRiFASmOxireIQg+Ij5vgaWjjvqzWDkRFzMM68b/ro4RruCRZdaZis9UVLvVWY+am0GumzioTI5p/vaVuL98cEWbF7m9StQ8YV9v76ACwiuAB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Jyigxl/uB4bb+Xegf0hDoYog1apanR+s1vo3hvdakE=;
 b=iTqvwKx7i8OejG1rRSBuQsaMg3wzDHzGOWKbmU1U6brxswdyAL4Tkr761De75GEJw4YfronQKWgX+9bwxvFkVeymG75Fmf9xMbewOo0iDxYi2w0HZLMuESoriPY/usJaGe6CGMahaN3XV9OKlx5RYhS5v1jUQR9XrfQhLxw1V8oROUyTRKb0m+TWU2KSLT0xRmO4te8Rau+hnaFIrc/BDoCaeNoYNL6sdK+KR+bJXlfWhpV/uU1gk0UIkASZlS/1aHncU+GhRaOTL2cpKxTqE+SQKx9zFmRr1bOkCrZDpEIRohfN+ti4iahxRETmwszwLUZ0iOW0BN1Alhgw6jMa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jyigxl/uB4bb+Xegf0hDoYog1apanR+s1vo3hvdakE=;
 b=kjvkSUAMrmKPMVtM8gwfoaNJYTL3phwxH63apr+jbSWnpacXJBDVuc7kr+G2fEvqmu3BvP55EHm9F50aiUMvO15aQA9C1Y5WRzq3w5xBs99ACpBv+3wOOh2ZH+wHlIaZmibetLmjX6N/z078WToqAk7Xc3lSc172Owm+z+gV9+0BEa6swu84NPtS9utRuHzVZkgQGD6NNXS36+wjNhUed04038QQmsnk7qqghDiw2B7+spReBYNR8iZ+UkK87u3pdHd734FoADIGChTWYg0mkuw2GRj857NVAnYRDdEjR5YUynZYuZXfRviL7tmP9lH7OxFPPQSDRkfkwySl5lJwSA==
Received: from MW3PR06CA0014.namprd06.prod.outlook.com (2603:10b6:303:2a::19)
 by EA2PR22MB5305.namprd22.prod.outlook.com (2603:10b6:303:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 21:00:33 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::86) by MW3PR06CA0014.outlook.office365.com
 (2603:10b6:303:2a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 21:00:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 21:00:32 +0000
Received: from davidAhead.lan (unknown [10.8.0.15])
	by mail.aheadcomputing.com (Postfix) with ESMTP id D556780365;
	Tue, 18 Aug 2026 14:00:29 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH v2 0/3] lib: sbi_pmu: SBI v3.0 PMU error code fixes
Date: Tue, 18 Aug 2026 15:00:20 -0600
Message-ID: <20260818210023.466462-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803171128.3506804-1-david.garcia@aheadcomputing.com>
References: <20260803171128.3506804-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|EA2PR22MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 8927322c-a60a-4876-0911-08defd6bbe34
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|56012099006|10067099003|11063799006|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info: TTqGlgEDXpDL5h4/gXb8nlqadloceXFWh7W30XaE/zQWignAYU3R3XpXTONJ1HfUsbdonHPivdWfU1Qx6Y0CNT6SL5AqvxZiRqOwH9xqjjRrm+TkGJqPqBtWHId31EL3nF7t4iDObGtKb2pizW9zLLihzCyAt9teMJa0sCxB2yozXm0OKMkGz7SbqXTXL+J7qNNQwVlT1kMQqwZrgVE/ltWy3DV1rJYdlyiqRIHOb2xu/oTLSA4nd7RLKyGcTGPzBZOqPBuoVJ96NbDacI8wCY8t0bV0T1TvQ9wq/b32P/22x3OK5Ijdkqx7IP/mFS5ORf+Nl+cPJsULpHSG29ty+mX13x4e3wvIzglnlHoPZpmGL1JxihxWruPYTLcK8u04/FFsT5VlAva+GNAOXzpbFXWQpIk1vDLlRFfK5UbTxJ466oTXzBCrw/L+jDWJk0jB+eYMSwyXISqr2OS9DfIMqNO9fNwQoMAiRTSPdEFuAHaEEQsz+8fVAOgtgaHTvOcJIZJlHTGcKmBT0AMUsDAiD5g1TyS8G43EpVq743lUwWNKPgNEkylOsIwJ5dM4GTW3rVMDkMmJ5Cyjd3OIs47HVHQwebku9j5KgzYZzl658v816nvUuUWdUPAiCF5ypAwlV6cX/0zYtmJu4UzrzgNgEHUXDXHFUxCILOPtxOWHRGvMlP4uWKsUVg6CW9zpI/v8VQAbXkdzZezsUBihsetR6Q==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rj9O1crLdKQFtEYuyZK26ilIGkyr9APTgb8aXG13oxpVtQm+Nla17rJOFnZezcfqXtpJS/Bm6xJiZ2h5f8rZgmA2kKCRvaEOTZ5pECVNmPLQd9jgjqJufQ3QHMUS2L8NK4DLVdAgaNewgT93rryZ19Cd2XHtywNOYTscaHF2u13bKV+fYGIW4pFg6jilPqtSxFkQWQraZqViWgA/UIOYnq3jPdo0vkxcg6JJECC//HE6JRpixRy55UMyu+C1/TCZgH/d/m35p10eFVF/NvDJBhyOviwCAD8Cd6BXHFWfvYHh1EFvlb9yWx0aOczIjU78cgEyXF5lQh57YotkHfWS2nDpzPofH08xD3CAVlLDJZOIgw2gPz8y3+NjBjVj/iAXTDng8rp+SrxCnF4oDl+NOTG5km3VXfxxVX8CBurOZrTXEwzOo+cT6GvDAgAh1vNZ
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 21:00:32.7319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8927322c-a60a-4876-0911-08defd6bbe34
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_140039_543555_5D17BBE6 
X-CRM114-Status: UNSURE (   6.08  )
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

This series fixes several places where the PMU extension returns
error codes that do not match the SBI v3.0 specification, chapter 11.

Changes in v2:
 - Added patch 3/3: reject reserved flag bits in counter start/stop,
   propagate ALREADY_STARTED/ALREADY_STOPPED, and report firmware
   events as supported in event_get_info.
 - Patches 1/3 and 2/3 are unchanged from their v1 submissions.

This series supersedes the two standalone v1 patches.

David E. Garcia Porras (3):
  lib: sbi_pmu: Return invalid param error for reserved event_idx bits
  lib: sbi_pmu: Match raw event selector only against raw event map
    entries
  lib: sbi_pmu: Fix counter and event info error codes as per SBI v3.0
    spec

 include/sbi/sbi_ecall_interface.h | 14 ++++++++
 lib/sbi/sbi_pmu.c                 | 55 ++++++++++++++++++++++++-------
 2 files changed, 57 insertions(+), 12 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
