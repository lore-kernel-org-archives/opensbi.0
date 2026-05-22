Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB0CD5BB3
	for <opensbi@archiver.kernel.org>; Fri, 22 May 2026 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UXu5MTw5rHBj7u3OXye+h4hSvKQGdoKtCIv4qMhlYFY=; b=d9UIEKyAjbt4g8
	9Se0vIZfHoOzaoWvab30vCXZzXaSBUFOtEht1cjLSpkjY3ucumM9hz4Dngq4EBWZyDYpyFIqVzGrs
	QccF1s68jnkEGHNOdEcU+x7r1IO+Bqmga9oavvah0HY0TQzf+MMksBRbHl0TBBAcuTR3S8NugFCrB
	iEnkHmHCRu7Z4djmxKH/bKhHe+yR1zkk59CYOaPi0ky2sVNXSr1n3SspRAZRVC9+AD2TH54sZAnXd
	xSR+Xg9iwjGtcNMKdI4hjKltAEzHAGuRc+ZZa0ZcQ3QfiZ62UePKbIvoVgH3g+loXOJl5Z724v//l
	kxbzkU+x6RP9XKUzZQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQR8n-0000000BAQu-3zaJ;
	Fri, 22 May 2026 14:46:21 +0000
Received: from mail-northcentralusazon11023124.outbound.protection.outlook.com ([40.107.201.124] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQR8l-0000000BAQI-3OFk
	for opensbi@lists.infradead.org;
	Fri, 22 May 2026 14:46:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iErGXi31keWtcfP6a9NEJBObEvvRdpdWCVeH6N6ZKkksCQt4Vr/qMRNDZp0EU2yMP1XcsPNkwI6SZu5ldnlGMBZTaNT5A4TG4Wm7kTbjpcOcylIVRPb6lUdFxmxS/Yxu3JLMlYkhmoY+r6QdiGOfABIztSD33a14WhDY7v6WEWte3WHhpYKDkfx88/W+KnBPaPh/9hsReCdGPNwYR32is2+CXmsPjfOBdrmqgTIosMQzwAcqszLS7YVZO+ym/9TUnh23GXRvltOgsD8hAk+pWy/+tsmXZSmNYaU2Xg4ld2m3PnBs2JS/XSaq1CU3wOfZ6ASXcKANWaejLNPGAWcTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAiiWUZBkjjsD+fC72CbXwhF4sdWkhF8NUexQkDnAwc=;
 b=iWY5UFOXjHHM1pbYmMRX1kzCRhm+ZrpQ7z+b+s+Op1Q/VY6H82kFAi9HXCskxh3CBq5qrK8lcHv3LW+g7e2ePlKmBFwv4F+6AM3eqYCbLZ118hZVTkpRtrgUFTv+mEEU0CCIYnf3VLLdaBBE89PwgG04q6WOcG9pT9jsfVzgQOTooxCcPK5RpFxJiyfVS5CtUe0xiH73195Krmm/vqcBcxNSIrMLIiq4VFNXbH2r2+oJcJtWhRNplE0CO93XUuMMlvmg3Jlq9huUvlml5EAGimdD4UWkZ6cW/rtJp4SwiXZZEikDTqiPhuSWfuDD4lo3ufzGyrhphO1hdnUqm0e1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAiiWUZBkjjsD+fC72CbXwhF4sdWkhF8NUexQkDnAwc=;
 b=aMtbjTfnZKmx5ilV01qvMCnYt8p2qr+VjUHOl0YhTqLP2Ey6P8An5+cY2BoXKOtrHeNZ92cVr9dGfxsFyy4r65n5vnuyYPuoEYwseQZWugeaxl/TH/GUphkfAoWXzq+cr6WLpNE7blWR/vi3lx73eiFvwUFiPva3sViu/2iS03Gv44wZ/F6OuNtkg7NrBN3tbZTjT8/D2tr0i/VjZGqbqr4uC04CrOWw6rYdDqb6cxCAKd79T1Fb7iSBR0fqHfAkPgutqKbep931EGeE2WQxRONzu1frFVAvJsGdwWJozlEGOp9DBd8JKZYq6EVTjeUs91jl4VCoc131wkLk9K8z/Q==
Received: from DS7P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::16) by
 DS6PR22MB996741.namprd22.prod.outlook.com (2603:10b6:8:460::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 22 May 2026 14:46:11 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:8:1ca:cafe::34) by DS7P220CA0011.outlook.office365.com
 (2603:10b6:8:1ca::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 14:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 14:46:11 +0000
Received: from davidAhead.lan (unknown [10.8.0.17])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 20F6F80916;
	Fri, 22 May 2026 07:46:10 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH] lib: sbi_pmu: Honor CLEAR_VALUE/AUTO_START for all hardware event types
Date: Fri, 22 May 2026 08:46:07 -0600
Message-ID: <20260522144608.3433470-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|DS6PR22MB996741:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f7dc3c-2b6d-4b82-cbaf-08deb810de05
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|55112099003|6133799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: AKVH55abAHi2r4JALEOCECMsiBplil3hjHhLGWML6P0az3zOzc5MEoJ/KLASR7MIpLoM5IY5PtM2OmiIyOWbj+2asHw/BO0wNtBUWne4IDPiRAoQT4vv6tZbjSTWHC2k5TA+suHzpga/Cs+0W+aE/lmM8EJgro4yN6XZwtg5wkwM0kUDWWgn4hvzBjwfzNEwM/Td4z2juBMCDBzKymSso6glB8Ssa+Fxu8V5Hc1ra1DO8wYY+ZWI9NSAcAW1u1OXcI3FU/BuL5y0gDnygUUcBR9cCWg8W8ikeB2edXKnec+TcKY0bgS51nfLv40ZqiOtdLqV0KBwworfsIeXWE7BEdvb3iFbPsWX4ErhKoyvVobLk2dd2Lghk0kcDzYBXWOu3hxHSQQq/KHaoFK8NM4jsRDlgHmYmT4EsIOK/9vraYYRte651UrVZnPWOmoErzks26Tfon66JXmpc5YRYKFF2jje3B1DHMROvios7nT0ehDi48700PIoQzgjFykOQUBaXd/Ctp0DnWkfLB5LkxkGeSlRgEnank8kNoYbKTI7T6EBBFaX06NvrhItJ/RUvQUSwVh6CbOpRo5zGWxHz4jDNgZyYEv8lOQOUdq7UhWgeYCi8/kAYoJ1lGgIAYZd8+6wIyfB+6+57wix3bb36op5CTUmMJa3ogmPiXESQnU8TqjhcyLwBxMxnPmJb8U6htsvPUtkn5H794ohQYU9UOGRxx93+fdCee2Hgfy4v9OlXns=
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(55112099003)(6133799003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gc+sIUyDVMpTqmRZMOomR2MxjpzwWBGILCmfWpgURKBP3mDnKTL824+WAxlx2TqQkt7RJqcQdrah4jJPknEV+2GYGVizxGUWoCuEp67xWOF3HGfzL5q31R6bCRf5TVdhby2sqHFS+KRK91QVMVNmjkiyIzdwgb5zIypLEuEztC+FCAvLHMpfN2fPXhiSYBXCgAdGAdMTEfguEXv7ST3w6bONqyFNA6Gnk6aS82JaHzZvOTDhYtTnTL4ib2/jXTyR48Vw4jZ09WrDKIb2Zv8B0KhqSNV59r1vkdzpCOTD7ok2DYc86yZ2Yoa3MNlvqoGf8JGR3cZGfr2QXMxLJm5PkdWDsmC2kYoyfP/LXAymUPo/lzxMdcOMhjkyhDeyAxGYoV1qlZzVmxY9j+YCo70mt2AvXGu4OZirHCs7IXV+auMNNKlDMQ+yT8vPVcRv5y8W
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:46:11.5040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f7dc3c-2b6d-4b82-cbaf-08deb810de05
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR22MB996741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_074619_917599_E7238050 
X-CRM114-Status: GOOD (  10.08  )
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

sbi_pmu_ctr_cfg_match() only acts on SBI_PMU_CFG_FLAG_CLEAR_VALUE and
SBI_PMU_CFG_FLAG_AUTO_START when the event type is SBI_PMU_EVENT_TYPE_HW.
However, pmu_ctr_find_hw() allocates a hardware counter from the same
hw_event_map for SBI_PMU_EVENT_TYPE_HW_CACHE, SBI_PMU_EVENT_TYPE_HW_RAW,
and SBI_PMU_EVENT_TYPE_HW_RAW_V2 as well, and the start/clear helpers
(pmu_ctr_start_hw, pmu_ctr_write_hw) operate on the counter index alone
and are agnostic to the event type. As a result, when a supervisor
configures a HW_CACHE/HW_RAW/HW_RAW_V2 event with these flags, the
counter is programmed and recorded in active_events[] but is never
cleared or started, requiring an extra SBI call to make it count.

Extend the check to cover all hardware-counter event types so that the
configuration flags take effect for HW_CACHE and raw events too.

Deliberately avoiding using "not FW" logic to be explicit about HW-backed events only.

Fixes: 13d40f21 ("lib: sbi: Add PMU support")
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 lib/sbi/sbi_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 8a9021e2..480a9723 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -946,7 +946,10 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 
 	phs->active_events[ctr_idx] = event_idx;
 skip_match:
-	if (event_type == SBI_PMU_EVENT_TYPE_HW) {
+	if (event_type == SBI_PMU_EVENT_TYPE_HW ||
+	    event_type == SBI_PMU_EVENT_TYPE_HW_CACHE ||
+	    event_type == SBI_PMU_EVENT_TYPE_HW_RAW ||
+	    event_type == SBI_PMU_EVENT_TYPE_HW_RAW_V2) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
 			pmu_ctr_write_hw(ctr_idx, 0);
 		if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
