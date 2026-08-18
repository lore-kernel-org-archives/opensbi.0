Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C16C5DF7D
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 21:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQH7OLkk7zdma723oT+xK1Id3HUGeR6GEk2EtOGpS6A=; b=aAMaLLjfWqrqem
	mzpHhq8kAdg+N/I2m0WwphNO7ts5hKbfzyS0nw9c1ZfwmLBR9pAGsAOgG1fOE8p+4/aghIjZ3Nm4z
	FEn11E8ypMahdN4b2yjtoafLr1emVkXb3ZoG2T53gnKCT/LoFlvWzeDdGRYlP3nO1qaWXcxiOCt6C
	FKTpjLSIEvUv56TVyilGY8LwKmTsCA6lrv/PoEOHRlxzspadjZWLXFx/oxK+34fG5Dx1bRwjxkxzK
	SAX6QCyzeuoq/zayw17L8s5fSiW24idtE5fsymjH8wVUR53bY1cZSrIIv6iDJ38zuyJJLWy09uEMm
	UvWTnXcFAR4U9OP7j4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQvf-00000008eVR-1nQk;
	Tue, 18 Aug 2026 21:01:03 +0000
Received: from mail-centralusazon11021110.outbound.protection.outlook.com ([52.101.62.110] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQvd-00000008eUs-1or5
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 21:01:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQIDQVsmwIW53FdCatgmv1OwgstgwpNCdyrWWHjp9bv31iRveb5/4pawVqK4QP0LTXsvReK3X4n9bxqdl9trdncrClqZjg7TIKTANj3b+be31pNeNAz0lGgIhucNcxjpP48BeD5uqaTBkTl3z+zSb3cOVfeM0ZnavrMXz/Lik1M8xQS/FIHKx4wELBODVasNpb3zgyms1B6U1AcZvdxvkJECv6V7yHlH8VYKosmkMRz4DapDzu04L2fG1+AinMWf0LSykiJONGEDCBlhObq2MWqARxqU1v1JEM9VRlkcug7LEwV/HgmPHY2hQYxTrMY5tIdyUXymFbFUlE5cwca2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufG1zPSBqOCK8hsTRjjB0Zom/mnNT6U8s8Zy6EXjEhU=;
 b=xqSSiYBXRAQEiaE3Rb09/77uQcIJdav/0ZZrUOJr/WjfREOWYVXDpk3xEPNwGMD4QtE+LgSz1BWZ2KxznRyybMCyeUuUrjnJ4Km5hv15M85+KsTn2kwRxPbZmsx3dlFCx0WXAKrI6KsOcmC2ycVi+gfU/zucFficThvmzLqMNuTFA6sRFqgNbOdKKOT31n62jUXRLlsOSEZqpn7sLsF8aNxHbp15guKRrS8gPlZqFb+9/oyqL7LK3hYvVkKX/Ls2/NN4s14on1zF6lgDHkdsqQ6iwuZQvJ3/KHthFKO89rgnulMUpHv3B0s8P79lZ0XUZ5YshBtM1w3BJVpsuSVohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufG1zPSBqOCK8hsTRjjB0Zom/mnNT6U8s8Zy6EXjEhU=;
 b=xhIu7JCBOuvwvX3+IhQj+AjtiO7/5sRsoPOmXTeVw7Wf1Nsn51sR1wNH0VyWvbvfwzFvs5VBToFYzrXGwBAdwDkCvVRodpiDnaOYFNFC+ikaMb+HJ3cCLs1E+9zhhnA0QB7W3Y+sXg5ZOO7MJxyV3eT1OvoeHytlKymca/tdA2rWq4zkqimsF8thhOt/gfLaYO5wi23nzB8JYlE/hyMOl0Fsc+u0Jp+JAM9EZpFc0llNNYxdOw+hblfNFrRu1Tjbgd+j5iSgh1lzHYiQmQ5aC8wBwOmq49CTN+4qQlJHsv2pKjaEyj3qTO2id9cW/LFlGPC9AOfEUI+FTWSH8JTqhQ==
Received: from SJ0PR05CA0105.namprd05.prod.outlook.com (2603:10b6:a03:334::20)
 by SA1PR22MB4335.namprd22.prod.outlook.com (2603:10b6:806:386::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 21:00:41 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::6a) by SJ0PR05CA0105.outlook.office365.com
 (2603:10b6:a03:334::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 21:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 21:00:41 +0000
Received: from davidAhead.lan (unknown [10.8.0.15])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 0BDF780369;
	Tue, 18 Aug 2026 14:00:37 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH v2 3/3] lib: sbi_pmu: Fix counter and event info error codes as per SBI v3.0 spec
Date: Tue, 18 Aug 2026 15:00:23 -0600
Message-ID: <20260818210023.466462-4-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818210023.466462-1-david.garcia@aheadcomputing.com>
References: <20260803171128.3506804-1-david.garcia@aheadcomputing.com>
 <20260818210023.466462-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|SA1PR22MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc50411-fa4f-4833-1dff-08defd6bc33f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|3023799007|56012099006|10067099003|4143699003|22082099003|18002099003|11063799006|55112099003;
X-Microsoft-Antispam-Message-Info: 8GedGkSErYGINdu2doF9R0sCgs34/bh46XGOeLxSBcmJQ8n1PzxO4f+NS33Oo3x4C5QT6FC1Wu9kooJI8MtIuuiYCCqySVb486YaS2M3qATh3QG5zHy3Lo9W4Xz2bs1c58JVRzyJGOiOyfzFLkQyw6gea3Vlki2bA2W+pMlsvC5v1+1m8e5FXMF7IySOCWaSdx3ZLlrmMB0GeOS2GZ58FlBT1xrJcTYQzZyA7X/UWZumwb8VIOr6nsCRQ4dA0xt+cOa9RXJues9A86iQXwhs0whVGbCN4mjGw8MHfNiUAyeTJk55f7VRoGYHjFkIDu8DfCyzdEkN0IOBeWbK1qKSnH/qhTy7s2JvrVe8g7UB7Wl1z3k8Yhj6GSmg6kEGnwTxTY2/iDBKbKpyCZ3QGMJ9IjpKlXXsu5LjWPCuFBI6q1MxAtFb2+hFlYjtQMFeVL0fjfpA375rSTOSCw9QYkv65KqbZ1/aSW7EUOm3xpxsyja1r+cpaNioaL7L0LEo9NXDS2M78TNDmD9RPskipIzVYLnN8e2Ouyy7fGUTDKtvyPsfImKdqTO3t45eg9ZF8ZCaZX8eKOLhmbr00ScYinD5uUsX+MR3MC1oU5dtaVyEt2sN/pg198QJJIIEFZFJyxURwxqVVwq0psmYPqNrk4Aak8HDba88XEmNTmDs35eA16YfbchscIUqJk4IFqBp/Q7yRB0H6FqRcB7iBN28AgnJWQ==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(3023799007)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003)(11063799006)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xLItiLaUNJb7ChleKFAX0qGGoUdqGnpaxvEhl8mYqCX6YWq9tACy/XlAwz2bm7sCPW4u9T8n3bqxO8xpLli/ZaNdEF7tp/YannFbVZLxxYiRLbZGkIW9NectscvCvNA69QHIHcUzAecGby9QBxb6cFnUwxLjDlbC/DIxPpYzMUZkJmUR0PadoV6YbIA3jWKcbUxd46ayL+7vg0a4Bj1x3t0Z7KXEl3LHQ1T+2zss+/l3cu32mj6t8b2IQ37FsC7kRWnzu32a4A9pCcWOhuQQgcgMzm29zmiVf9kjvMwIg+wKfNuQ7SxMk2gSNn3lOunFWIQ6X1wBus8Dh3UEDT1F9tKST65n9gofAnjBvefjaLmEqcmTlEg5WAyZAM4muUAnOnQR1JbOYEqirigyTJpAY+wcyH0SoJPcRbrP7e8TpFNP1v7HA4QWVxnIW+SOjJHJ
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 21:00:41.1661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc50411-fa4f-4833-1dff-08defd6bc33f
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB4335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_140101_483956_9D4A5F4D 
X-CRM114-Status: GOOD (  21.27  )
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

Align the PMU extension implementation with the error codes required
by the SBI v3.0 specification, chapter 11:

 - sbi_pmu_counter_start and sbi_pmu_counter_stop (secs 11.9-11.10,
   tables 39-42): the start_flags/stop_flags bits 2:(XLEN-1) are
   reserved and must be zero, so return SBI_ERR_INVALID_PARAM when any
   reserved flag bit is set. Introduce SBI_PMU_START_FLAGS_MASK and
   SBI_PMU_STOP_FLAGS_MASK for the valid bits of each function.

 - sbi_pmu_counter_start and sbi_pmu_counter_stop (tables 40 and 42):
   return SBI_ERR_ALREADY_STARTED / SBI_ERR_ALREADY_STOPPED when the
   set of counters includes a counter which is already started or
   stopped, instead of ignoring the error returned for each counter.

 - sbi_pmu_event_get_info (sec 11.14, table 47): the output word must
   indicate whether the event is supported, but firmware events were
   only matched against the hardware event map and were always
   reported as unsupported. Report a validated firmware event as
   supported.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi/sbi_ecall_interface.h | 12 ++++++
 lib/sbi/sbi_pmu.c                 | 61 ++++++++++++++++++++-----------
 2 files changed, 52 insertions(+), 21 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index bfde25d0..fd4e77ca 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -306,10 +306,22 @@ struct sbi_pmu_event_info {
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
 #define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT (1 << 1)
+/* Start flags valid mask */
+#define SBI_PMU_START_FLAGS_MASK	\
+	( \
+		SBI_PMU_START_FLAG_SET_INIT_VALUE | \
+		SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT \
+	)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT (1 << 1)
+/* Stop flags valid mask */
+#define SBI_PMU_STOP_FLAGS_MASK	\
+	( \
+		SBI_PMU_STOP_FLAG_RESET | \
+		SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT \
+	)
 
 /* SBI function IDs for DBCN extension */
 #define SBI_EXT_DBCN_CONSOLE_WRITE		0x0
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 676de9aa..0c62bde0 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -574,6 +574,9 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 	if (!pmu_ctr_idx_validate(cbase, cmask))
 		return ret;
 
+	if (flags & ~SBI_PMU_START_FLAGS_MASK)
+		return SBI_ERR_INVALID_PARAM;
+
 	if (flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
 		return SBI_ENO_SHMEM;
 
@@ -592,6 +595,8 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 				 : 0x0;
 			ret = pmu_ctr_start_fw(phs, cidx, event_code, edata,
 					       ival, bUpdate);
+			if (ret)
+				return ret;
 		} else {
 			if (cidx >= 3) {
 				struct sbi_pmu_hw_event_config *ev_cfg =
@@ -605,6 +610,8 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 					return ret;
 			}
 			ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
+			if (ret)
+				return ret;
 		}
 	}
 
@@ -693,6 +700,9 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	if (!pmu_ctr_idx_validate(cbase, cmask))
 		return ret;
 
+	if (flag & ~SBI_PMU_STOP_FLAGS_MASK)
+		return SBI_ERR_INVALID_PARAM;
+
 	if (flag & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
 		return SBI_ENO_SHMEM;
 
@@ -708,6 +718,9 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		else
 			ret = pmu_ctr_stop_hw(cidx);
 
+		if(ret)
+			return ret;
+
 		if (cidx > (CSR_INSTRET - CSR_CYCLE) && flag & SBI_PMU_STOP_FLAG_RESET) {
 			phs->active_events[cidx] = SBI_PMU_EVENT_IDX_INVALID;
 			pmu_reset_hw_mhpmevent(cidx);
@@ -1105,30 +1118,36 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 		if (event_type < 0) {
 			einfo[i].output = 0;
 		} else {
-			for (j = 0; j < num_hw_events; j++) {
-				temp = &hw_event_map[j];
-				/* For raw events, event data is used as the select value */
-				if (event_idx == SBI_PMU_EVENT_RAW_IDX ||
-					event_idx == SBI_PMU_EVENT_RAW_V2_IDX) {
-					/*
-					 * Only a raw event map entry carries a
-					 * meaningful select/select_mask pair, so
-					 * skip any entry which does not cover the
-					 * raw event index.
-					 */
-					if (temp->start_idx > event_idx ||
-					    event_idx > temp->end_idx)
-						continue;
-					/* just match the selector */
-					if (temp->select == (einfo[i].event_data &
-									temp->select_mask)) {
+			if (event_type == SBI_PMU_EVENT_TYPE_FW) {
+				/* pmu_event_validate() already confirmed this event is valid; counter support is checked later by cfg_match/find_fw. */
+				einfo[i].output = 1;
+				continue;
+			} else {
+				for (j = 0; j < num_hw_events; j++) {
+					temp = &hw_event_map[j];
+					/* For raw events, event data is used as the select value */
+					if (event_idx == SBI_PMU_EVENT_RAW_IDX ||
+						event_idx == SBI_PMU_EVENT_RAW_V2_IDX) {
+						/*
+						 * Only a raw event map entry carries a
+						 * meaningful select/select_mask pair, so
+						 * skip any entry which does not cover the
+						 * raw event index.
+						 */
+						if (temp->start_idx > event_idx ||
+						    event_idx > temp->end_idx)
+							continue;
+						/* just match the selector */
+						if (temp->select == (einfo[i].event_data &
+										temp->select_mask)) {
+							found = true;
+							break;
+						}
+					} else if (temp->start_idx <= event_idx &&
+						   event_idx <= temp->end_idx) {
 						found = true;
 						break;
 					}
-				} else if (temp->start_idx <= event_idx &&
-					   event_idx <= temp->end_idx) {
-					found = true;
-					break;
 				}
 			}
 			if (found)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
