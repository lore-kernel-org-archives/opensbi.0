Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F718F31E22
	for <opensbi@archiver.kernel.org>; Thu,  9 Apr 2026 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZzXakTNVgkaowJH17ZwK9BD3p7wLHTkHE47B9hJtns=; b=DW/mzsvrHi5vyH
	q2iWxehEsQS+CjNMM5LGFJ8BQSmtZqplnwyV1rdU1ANJfZU5JoDCoki/XQU5uNLecFr7QB7zWxKPU
	2oepF3OzqYL+QL5HgAlyIWBOYHzMFOblrsmo2cxFyhJAuW0kEhd5jnlYgGmYa/fpuR8xRdsIVXhwi
	BEw6z/k+pDKX8jJ2HzUXBvww+hro6CW3o9HBn/N5VcTrGdAbt1rBVwEzSNU0ebLFLWFA7qL2y+Xq3
	X3PDP+9gt2dqT8dHYKZMmazgqDtMsJhnQfT+2/XravM3A+3dPdNvMDJupqVVtQnmFzsHfYiiRYTVl
	Erg7W+/XAWFhbLrOt5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqp7-0000000AkN5-46Mu;
	Thu, 09 Apr 2026 14:57:37 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqp5-0000000AkLv-2SEu
	for opensbi@lists.infradead.org;
	Thu, 09 Apr 2026 14:57:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZFI0pTi3cCkwuuIMk5krlCsYkDnf/fOTJ/3PEk0FKUx2/upD0eyrXXceDtp3DEqFU2FtUvRx13zkUt3c95e6Wm//HlCBPK4cBV0wuwNlsS1PKnwRJwspdTpyWJJcy3YuEpbaOISkSxaHr/grjkaV40cO4D/0FTOAHFwduzXyuAdnxUbQWoRGSVdmFx/lcslW54l82Xi8RIWcrCavS5kinlA583hd5RcMzjtTc/sNDK7bWkNuGBtBILjrTGqcFI8NMJuRbqp0fqmlQu66Rx2SQnk7MjLwzdGwCLfcaT/k8u5rtwtbKi1xKCHtwAsCqKo3j5wfm9Tp4mpp+q3sdB49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfE7BfuuM8827ErVFI0GZyGqnOyhgG8j5KJFpG1bZ0s=;
 b=pUtkrwEHs6c1YWvdkjF0shp4TefAw7+7UuFM7W1kSFTPkKlPRNxLt1sc34eKvFNl6rty8jbqnUaPXqA3DZsyffJ7uzLFip1UWPs53lSe4WQKHuOeZIxVD6D6QAULwiqwH2Zs92j4eeNNdLb4HoNcPWs1W33JOxm9k/3I/oijtXaieTCLHXqpL2A+H9nXMSbftBsWaRx97R3tMQu45tNlDNN27yJUjNhbscJ5eaPAvW+hZEIezd0FETzwNfupI4lIGEF8QxBX6+c1Cm1wpePhpZflpo2UnhkP3J8EiTPH8FodBJ3C//JgfTNjKtkewDyElyfYNqpZ8YpRQtXzOZzHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfE7BfuuM8827ErVFI0GZyGqnOyhgG8j5KJFpG1bZ0s=;
 b=gvcwCGcOKL7JO4AKCOLuTRd3JfhKKhS1JaGZSISdOk/QhlChMyCi2HCosbBPN23yg4nhc8cI2N3YxF1ZvgUpoQu++6lYQ0e6RGYe+uS2zipqOerpVcC9DAzf39zWuWE4VXcAIs8STDeN2QM70M0YWpcJfyRA2B1sDm3y/vpq+vlcLCKjDOZpCQcIWFkWoXGFt1iRq5R76E2dSw/MahOuuveIefPqAqo9ch24Grs3qTpyjj2L4RG1+ekVAghW1oh3k5n9iBFJYOaiAFKOQYEXHPTgpmordy2S0py/OdQo0AymCe9PLtA1wntAjVVEacRH8dRi2lbzn3Scp3/GjR2FUA==
Received: from CH2PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:59::18)
 by BL1PPFAA7FD2635.namprd22.prod.outlook.com (2603:10b6:20f:fc04::f43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 14:57:27 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::6f) by CH2PR03CA0008.outlook.office365.com
 (2603:10b6:610:59::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 14:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 9 Apr 2026 14:57:27 +0000
Received: from davidAhead.lan (unknown [10.8.0.20])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 09DDA80AAA;
	Thu,  9 Apr 2026 07:57:25 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 1/2] lib: sbi_mpxy: Enable MPXY channel MSI availability determination
Date: Thu,  9 Apr 2026 08:57:15 -0600
Message-ID: <20260409145716.2611852-2-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409145716.2611852-1-david.garcia@aheadcomputing.com>
References: <20260409145716.2611852-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|BL1PPFAA7FD2635:EE_
X-MS-Office365-Filtering-Correlation-Id: 46232891-7368-45e7-55b0-08de964850fb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: oT1wp/9Zrf5d0KObSpXr69dA5wQDBUVjRaC9U8QpyELqQUDMPQTvPujUFwi6xdFw6YeBuy16JkMlR73DjEBy66bJXgbCYM4+x9l5Eoghz2n7WkcnwZM8TGylxeLF8Nu+4yXR0/BncZ7tjmVceP72USCgq1M/zeGjGPA4CRf0Bpv+/e23BeWkIB7DvCJfIGhpywKtuCKtjDNOlEKwtFValr+NZM+XrmxIulfewX/Yy47Owoxr6wiMvfme4tA4hY31vUsjceCQt6UdM2DJQd6A8EDWwmjB+D6JVLFBIKIHrVwpLz74t9tv4SyTcz51TLFhK/+ReDnVsUMR5BG8Gf78t50PMRNKPupUlpWnIUZlAQTmCmwbDOH4Q6qQ/MKJuhNWEIdz2ZuRlvxn7BFd9M7hRvcym3io/niTo3duY2CokWOwZ3CHU26zs1DznxMncvza0dgZjDe0fInAPjsyLjIcmy1d40EDgX34lXiqEMTiu6GVMDpHBoZR0TToTMrYXWW6YSLJzCoYy8mCTCwOuqOPQLzSgq631Zw/mkc+1E+2lpCcvuPof1Q1n3sKH0+oYrv65xNcUxCjlq8tasz3pIB5zD1lQ1M1GkuNFfgOVhy8bxBLfTlj7N7D3U2xUaMVbyOmEu3fqwcZVAOBfaHT6xbqAyrseG2/CjZK8O2xE5u1deinEPAcYSIHz+b2nwjZ+nUVs2YFIHB0al6qsr0hON57K4z/RpbhhyQz6WoWbmBnkzA1N11Z0sB07TYLZmsWE2A872UlmW954N2n4SlYu/ATIQ==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: c8QpK8uVpPEaOi/YdukvrbhZscPTzcIE4p4S+siZ4bnZuCDNudxYJ4olv+9EjUxIjF8hQG2iQDqIjRAkVecauQzWbqAdFxyxsoYsXPME5R5Ve4XQu2bsMk7EvDvhJPldQkdKa3lBHbuEThWuxhs0wpb5U1aFrHrWIjcZzTy0vbl/9pp9ATsZCCN84L3nAHf5B5msN9kQkiXHb5z5vh5S17we55Mv1qZO59PkAgioZpKTOwN6lf5PsnCTwvxHx1k2hYdrtaUI8kkVm8RfScK8Q1FJa0AU6Arkr+TDyf1HICr6jCyKExpxUApmt14CzChy6MItGp8RVWETTL0yn1YHCRDzEd62wHCghRoBJ+aBXFlObNN6udtG3gFgfK76SHsBs+aesGTIMpQ7w/43/I7I/Z5dm9GdDrkJoKcabPTEdgAVbxH5xXEX+jAdxq9+becY
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:57:27.2582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46232891-7368-45e7-55b0-08de964850fb
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFAA7FD2635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_075735_624145_D12C2414 
X-CRM114-Status: GOOD (  10.91  )
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

Use imsic_get_data() to determine MSI availability for each MPXY
channel based on IMSIC presence per hart, instead of unconditionally
disabling it.

Add a static inline stub for imsic_get_data() when CONFIG_IRQCHIP_IMSIC
is not enabled.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi_utils/irqchip/imsic.h | 2 ++
 lib/sbi/sbi_mpxy.c                | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/sbi_utils/irqchip/imsic.h b/include/sbi_utils/irqchip/imsic.h
index 88dd3cfb..68f3c4ad 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -54,6 +54,8 @@ static inline void imsic_local_irqchip_init(void) { }
 
 static inline int imsic_data_check(struct imsic_data *imsic) { return 0; }
 
+static inline struct imsic_data *imsic_get_data(u32 hartindex) { return NULL; }
+
 #endif
 
 #endif
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index a83cf16c..8ff52bb6 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -20,6 +20,7 @@
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_byteorder.h>
+#include <sbi_utils/irqchip/imsic.h>
 
 /** Shared memory size across all harts */
 static unsigned long mpxy_shmem_size = PAGE_SIZE;
@@ -255,11 +256,10 @@ static int domain_mpxy_state_data_setup(struct sbi_domain *dom,
 			return SBI_ENOMEM;
 
 		/*
-		 * TODO: Proper support for checking msi support from
-		 * platform. Currently disable msi and sse and use
-		 * polling
+		 * TODO: Proper support for checking sse support from
+		 * platform. Currently disable sse and use polling
 		 */
-		ms->msi_avail = false;
+		ms->msi_avail = !!imsic_get_data(i);
 		ms->sse_avail = false;
 
 		sbi_mpxy_shmem_disable(ms);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
