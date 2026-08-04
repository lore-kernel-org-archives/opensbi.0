Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9758DC55822
	for <opensbi@archiver.kernel.org>; Tue,  4 Aug 2026 22:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/rh6APDxWBwUzs02a/qmlZ5dyUCPFeXuiMm1mAy5qHc=; b=1lqpb9bMZFpY5I
	dmu7rgwMYeSISNZqNxmC5iyFFpxNq6J5Mq/N5IbY+tY+qZCi8kQhiVhOGug+Xt9t77Cj9+nhUBsok
	7P33FU3rp9kBsd3N1yk/5EJ7PymrCZ5aOefEWQqUkZNsCXC/C/22mCQ57ePtEQSafHTaCy/sIZBIK
	+R9LHMPTLRQlSoKqkg+0flVuLj9EN8IKXJ0yjBUAU1eLGFCttdfPIDGOBR2IfWi/gSEGX87r9XfZn
	iTtVMR0AbyofmSA5xhU5ryTIo5CLch7X7wqo8prhJvdO2Ez8hnnfZgWSdTiAvBjgaSMgZSiJRu+pu
	Nw/o9ExDpsXYFkN0ZqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNmB-00000002skx-38vO;
	Tue, 04 Aug 2026 22:38:23 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNm9-00000002ska-1Yim
	for opensbi@lists.infradead.org;
	Tue, 04 Aug 2026 22:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8eloNRdn9jI6q12Nmue0HCAUlDlO/QEZ8lUaVvSpqId2XYNFfDKhCb1V48ByvOUtSBRHDmLaS3XbcvDR1avullIwPxwF8F0/a1OANN15tG6TSnHzQo1URgcdbXalDWjKHDhgdcLDeaXqT5VGXxdeC/71YfxAF+oP8IFfyeryNqQo6HjOk1vSBAaVOWM+32jotAjNYTb3D3KWeZusz8hMwwdqFZdayQDw2jatHJBdkSKBrawVW3zSH1QHGzm4wRQPXqK0Y3oVDgXhWRBX8pylf5hXbpG6HrkOYZjyO2wNNOiEOOPMDMTG1EIZjqK27rG/+/EvXmqouLQhM2JqCVxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWmS0OSl0dpVA9ON9H3HL+PFLngTGI5SLz3x3sTR7tA=;
 b=YorTN/testoflR2Srd7YNzBM/Ch8ytjwzGythxlGmWacQIEo+vN0uLQvvjaVtxJQdNaWSqqHAhu/dKMEup1wlUpHd1MgPc0zOvRh423g0QN0nYPKXCu7izIZ9JCoVBG7apILM8kzK6TFrSjEMW04lzD8klRLHxs8q79fW7tgyvYP0tIVCx9jKrTalt/fro1mKO0F7HatdPW5Gx3R6f5usml5yJZL72dDTKDjhFMD5h+4QSLCpmq7WaH0UIKdzJyS+RvUnb56I6HZW7Bo7ykpIVrxerX+BELtiZ0/RETWpBnCBlrqg/QvlRqRnxRxEUed4mo3mHXSVQ3HOTqtfrnMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWmS0OSl0dpVA9ON9H3HL+PFLngTGI5SLz3x3sTR7tA=;
 b=1NjZVV/HZY7Vw/81gAvtDaK02VdOkr+o4yLjnDWQQnDNmIF36rSaZms+x7AWXROXI72r4G/Fsnfxhn7v7gIastEcq+u5Wf/JEr1PW7obaoozcPaX64WL+Vh8bHP2Gz+Vr+GkX74OjZIsgSEZfUekuccXAbONX//kI4gjcqj65CG9PdDHtX500Qjlf3BbXzo16vV9Nnz+uhTQIIrrnNzUzV/RFB09YRo18LoQ+g5DosTPwEy5uo+hbwfLbcEY9hORtKf01o6X5jWZpyk2/XFLgQJlJjX1L+836QDBZK5EVFJLWir1Kz2UGkNPvoY9bvlJTvYIWTkCEVtP+4XCLwJksQ==
Received: from BN0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:408:e6::21)
 by DS4PPF00D71B7BD.namprd22.prod.outlook.com (2603:10b6:f:fc00::b04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 22:38:14 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::ab) by BN0PR03CA0016.outlook.office365.com
 (2603:10b6:408:e6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 22:38:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 22:38:14 +0000
Received: from davidAhead.lan (unknown [10.8.0.41])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 32FBE80021;
	Tue,  4 Aug 2026 15:38:11 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH] lib: sbi_pmu: Return invalid param error for reserved event_idx bits
Date: Tue,  4 Aug 2026 16:38:05 -0600
Message-ID: <20260804223805.3358157-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DS4PPF00D71B7BD:EE_
X-MS-Office365-Filtering-Correlation-Id: b701bfe9-4b4b-459d-84f4-08def279122a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|56012099006|55112099003|18002099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: NZe2ftqkAzWyyphSjsfKxNieV0S6Zde5fAbTmMVZg3gGCxXcCDsSJpPRwDZ83W7yNriTCB22wVh31NobgwHxbCXgTHw/Xtq0SxG+92bjnnYnXLVgNShRN9anl+a7VhT0E71fG4IZFmExuRwa6nzQ3N3G5ZG7FcEE6t3MhAMSMbSyKBmwCEw1YqXGF50tm7Ssucs0/cgoBBmCXst1co6k77QGNXhPMln8/FrVhdOSeRnN6M310f714DE9iZacee1npIx/QIIiMM/M/u/Cx7awS/B3UcjnN5vYhOXHc5K4FkYhJEIxsHl3PeYjSop8fFbVRv+KOn3ckNuRyCCUCWp9GGZNetaUTW0izwyhjA36avtzxbdLKSs3sUU/HpKJaT5g5VtnAOzC7JgOcgebCdLIlSvxtYJBOHNQokkfCdkVVF8m4w18/a51vQrSESfazcZFz3et/87ks34nuPJIROlJjXu2WzYf3X5IT9PcoTgbKE5szaeDX+Dx0LaOp2yBXYJnYVFbQB64BMtyOEkvWiq0Yx7ZAJyB7095t9zjNWbC1sTAL0yxbtAA9VFD6c/kI8ALaFWoTxg+efKb1RzBhWYzblumGFEf1HCoO6P6QSqmwuBHWKDhmCJGXDoJwr3vb5a7F6FLsp14Hi4RvbdRNi+0uYiGTzQ2gTH/8McIoCtBvTKJaUKKGb0JhcKSwRXtIwIj3z5TVRmrgBEA/qs1aISgrA==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(55112099003)(18002099003)(3023799007)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cQgU21r3vQFsfkHfcgmI13R8Orcw9ACx5JJlCC/vbx4EwhLQOrYyufg0Bd/gx2+qJvy+o/rgO88nwSpdN/1uAfg8kgfhMOEvaotq9jVh3854JaalvQwBNh0QWVO9QX5yomxLMTGViTKnUONRyInOgh8YqRsioQB0agg/hGinEs7dCX5d4nkK+pA/xiD9OjF6/8xQsjdkU4r8o60DIRLJigOmwNexpqKclj6oPR6SXvC52i/UYEQ/nNC8It2AZyZObFHKfhljukX7W+dvdeG7va1AyfaofcrsXsy0XeRgOE1igesN0nbKPqCGUo0CpfsUXpvESEDJTIfrDTVhX5hlPVkBFGY9vWvYYMAKMy3ZiDZkEKILGhwldgpVew2ZPCdvlT0QpvPzO0FvqWvsss2xcZHc+8QapT2wrS0Ku2Bh59kjnvIKzpuklz/hIS0MiqED
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 22:38:14.1460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b701bfe9-4b4b-459d-84f4-08def279122a
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF00D71B7BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_153821_493289_187A842C 
X-CRM114-Status: GOOD (  11.67  )
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
