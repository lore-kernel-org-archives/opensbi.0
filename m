Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0858C5CFCF
	for <opensbi@archiver.kernel.org>; Fri, 14 Aug 2026 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ocbB4r498mScMSga3MEGgUxPmNwgO769qRkZluL3RtA=; b=fCuXOrlVehR2dt
	+XM0Y7Me0OnLOPip7CsJd1E4GJE+NBEqH21u1Twk5Toi0WnbHtfuoZGOupFN2yvA/GW9ygF6FnYjx
	IyLgHdJ2ZIZKm3IungJ0OFUgl/OtLaB4sDTeIcYf0Ae3wjCRqi6JiM47+hW5BKqYnI9Msydh8BaV8
	jD/cpiOINeiJ6IiC4ZlvJaa48/tZF+Y4hSzg2kXrJVjezS5TPj8rvbL/vhbH7gStU8e0maQ68o6qd
	7qswexjBGUd35NxfJtnwIiamD3MAVCqA85sEs1gD9tXcjaChYhKqAYsNgART0fgCxUNO8MLnwiYep
	u2hXqqSqsnG2i+xwXtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvdF-00000002zBr-1aGf;
	Fri, 14 Aug 2026 17:23:49 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvdD-00000002zB6-1gMK
	for opensbi@lists.infradead.org;
	Fri, 14 Aug 2026 17:23:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqXaIoZzPeOgVn4U2w+rdHLjulLjULJ3HdXt4GasjQZKPaRDEbWRmSDC6NpBVgUY3tW67tcgBLzGHKCEMfdGi5a9GdH4l3tPvMHpMmAwjCNElVwZ8E0BkeOrI/oZIzCaPAkngzMFsmP5obOYZJyBGXsLNmmsWzdc/8SYK3YJQaIhq+d0QhQi//JHrkJn07RqzerOigGvZMTo3oO4OdVEeEdRS4cUf1IucROxpL3VxUy83VL2Wr6ht/VZvaPg7QHF7j2UCWgt78CNMSYz1d0CtyafiumXNfnHWOKdWL+JcCo/zLfxzf8FeQvQ/rF9USL3naXp+/sLb5AvpVZfdrMB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYzbsw2zTeMdtzM2FS2nsetn5GBdsU+U7l52n3GmAiA=;
 b=FRCxcEYrvS5brzzhpN9I4+M1QxoNo++NJx7blP3Nrm1/kiCirRyCkrAQ8wzG/9SrD7oqpCAm7jzPfBJaEouVvyXxm4NJWJlQAeH0E7cH1yhJ2rzPfVYpB7QHYUIDOSicpQG/Z/PtR8bLh5ekoJhPmdErJa72i+h944zKDJqhcBqAKl0G9vBgxUk1aZt75LFCe9I4LEUZhf9jgUiUDCYCTnPY6Ie9vpQwR3LPH4dIx4ZCWXGmoFzTl7dTsaGeV4+TSXB+LLtZRVeA2lmLrUlwmY6cheFAeuVAGyS8a6t/BjmPid5YL4IBbB4aqtCOcyfQp2a2Zsw4HFVll+9DDVx8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYzbsw2zTeMdtzM2FS2nsetn5GBdsU+U7l52n3GmAiA=;
 b=3My8BK0zcer07/jZ+wNVO4v02M4o4Dadtms/y82msdHpvP6zzNkgWY3Prj8y1HfGLFDyRwDTZwwN2DFqjJUqEYM741Fc53uwQvrBLIARwxhLjTkfiQpafuJg1Am5p1L/jCvwuNFmwBipobYYaQmAMzbvy9ni4ux2qR+DUFqbz3s/oirhAvt2GDqA2kkLYcqFeK0A8JjDYHj8w9HYbyGqIdBF/QN7YzvpohYx4u5HSD0KIyElGBANKq3W71eBgnZ8ue7SVbMsCeU+37qxLKcJx17GAjyEHvEVbF1Jbjasg3m1ihu7z/qiS6kZDdm832u4doHkMYjMpTPsHub7EmrsFQ==
Received: from CH0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:610:b1::7)
 by LV2PR22MB3629.namprd22.prod.outlook.com (2603:10b6:408:17b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 17:23:34 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::e) by CH0PR13CA0002.outlook.office365.com
 (2603:10b6:610:b1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Fri, 14
 Aug 2026 17:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 17:23:34 +0000
Received: from davidAhead.lan (unknown [10.8.0.25])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 842D7800FE;
	Fri, 14 Aug 2026 10:23:32 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH] lib: sbi: Fix DBTR error codes and semantics as per SBI v3.0 spec
Date: Fri, 14 Aug 2026 11:23:29 -0600
Message-ID: <20260814172329.52258-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|LV2PR22MB3629:EE_
X-MS-Office365-Filtering-Correlation-Id: aea19168-9e1a-4a42-d9ff-08defa28c4f5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: X9Zk9eVg8Tpix9lThwjVxODxdnC75vB5RHvFvMtJuqhUXXFthULgMqOAzYcoLyjKhqlNoBBPnqjNhoLI7IsVRup92u4Tsi3C3FUUWpueUdM6b1hYLhHhd3ot46f8ZvM9TwF4jREDwwvokhjdtnBUClGvZBw7usxdniLeBQEc6hMJFhoASrhIyAr9iazCf1H0sf2j1cC+pazZ1ZVjf+dUVLY5Z0C+CbFQncMFB6ubntsxd+Tly6AlQxGUJSa3MgYEnFAe7niCh1c8npu2tSUvKoOKJLeSVkyPcb319Q4yPFmIGzYl9oW8tH5aXEj1LffQnAVkqEYPiehNXL306hGP/1jYeKQZUw0hUTRXJ+Zq6TxtUhK2kTVNTR4QN8X75G80+2dWzcmPWXdwZY5OOTLvAh9ugC9GW5D4HMYxEHEVzy45ZI4FJpaV7cu1XustY6yJPHEbx9/GJBH+yp1lEgC6Du9jqk8zajJkOeIgRLRsIt8nP4wrG2WlJQOcHrrdJtPQO1OAo5y0+im2zsu96xDKs9dhIcAESPvEoC22Yq13ybPKkFGhT/tOyQuju/5IZB4BpMp49fDrO0lLeRDAfeUoDxL+ISIYdAVPNUJTWi6vVVqcqJJnn/TJCjk0V/4OsXxEH9lMVlX/h2kYeqBjnY958F0L8EfFGUdz0H/2rUkQfkqH84P+oAcCRY/4R8Bhq8vOj4bFt89xqgOxys/mYvPU8A==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: op9FtecFdIkqqVXHvF6iCaEpYquNNW4GZj3Y9DZlvFwCpdv++OOVj2wcEhMxgezYIwzVgl2Dmoq9/rg8+U3A1eXWrcN3tgdHeYrotVGJCkAvKPETA3RSNk7iqLwQF+LGpQOyjJD2DdCDW/hI9/Oc+lJPWIQEXACmYP4C0xEliUkeefOgX84OgPEtOVmjLfU5bXX/GyPcz1xMG1ZQLzDn0K4kXC862c2RTp4wdDUWUyHmVnOwn8xlZu1p7GEMoSjUvi+WB9yezdUbLioYUvjRMrrStyp+c7/++CdKO1Y+TE0fi++I+hmRw6m1Ar1rJ0wDx1RYrOnPvcg6tSY/tzraerHerwWhCiqmMG3/OOWkNGMZzGn9StHyhbYgSj7LEkouQGTkqnpmSu9e89OHRXWgjbB5I/Bxm7iyuGFii2Io1H6yE/z9fj3Dx8zlUcJczn+Q
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:23:34.2159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aea19168-9e1a-4a42-d9ff-08defa28c4f5
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR22MB3629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_102347_547873_15D0B9EF 
X-CRM114-Status: GOOD (  16.15  )
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

Align the Debug Triggers (DBTR) extension implementation with the
error codes and behavior required by the SBI v3.0 specification,
chapter 19:

 - sbi_debug_set_shmem (sec 19.2): accept the flags parameter and
   return SBI_ERR_INVALID_PARAM when it is not zero. Also validate
   the entire shared memory range of trig_max * (XLEN / 2) bytes
   instead of only the base address, returning SBI_ERR_INVALID_ADDRESS
   when the range is not accessible.

 - sbi_debug_install_triggers (sec 19.4, table 101): return
   SBI_ERR_BAD_RANGE when trig_count >= trig_max, and return
   SBI_ERR_NOT_SUPPORTED instead of SBI_ERR_FAILED when the trigger
   type is not supported.

 - sbi_debug_update_triggers (sec 19.5, table 102): return the array
   index of the failing trigger configuration in sbiret.value, and
   return SBI_ERR_INVALID_PARAM when trig_tdata1.type or
   trig_tdata1.chain do not match the originally installed debug
   trigger. Validate the complete request before updating any trigger.

 - sbi_debug_uninstall_triggers, sbi_debug_enable_triggers and
   sbi_debug_disable_triggers (secs 19.6-19.8, tables 103-105): return
   SBI_ERR_INVALID_PARAM when any trigger in the set has
   trig_idx >= trig_max, and validate the complete set before acting
   on any trigger so a partially processed batch is not left behind.

 - Set the trig_state.have_hw_trig bit when a trigger is mapped to a
   HW debug trigger (table 98).

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi/sbi_dbtr.h   |  5 ++-
 lib/sbi/sbi_dbtr.c       | 91 +++++++++++++++++++++++++++++++++-------
 lib/sbi/sbi_ecall_dbtr.c |  4 +-
 3 files changed, 81 insertions(+), 19 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index 5e0bf84e..e6b76086 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -104,7 +104,8 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot);
 int sbi_dbtr_supported(void);
 int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 			 unsigned long shmem_phys_lo,
-			 unsigned long shmem_phys_hi);
+			 unsigned long shmem_phys_hi,
+			 unsigned long flags);
 int sbi_dbtr_num_trig(unsigned long trig_tdata1, unsigned long *out);
 int sbi_dbtr_read_trig(unsigned long smode,
 		       unsigned long trig_idx_base, unsigned long trig_count);
@@ -115,7 +116,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 			 unsigned long trig_idx_mask);
 int sbi_dbtr_update_trig(unsigned long smode,
-			 unsigned long trig_count);
+			 unsigned long trig_count, unsigned long *out);
 int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 			  unsigned long trig_idx_mask);
 
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..1d4785c7 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -261,8 +261,10 @@ int sbi_dbtr_get_total_triggers(void)
 
 int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 			 unsigned long shmem_phys_lo,
-			 unsigned long shmem_phys_hi)
+			 unsigned long shmem_phys_hi,
+			 unsigned long flags)
 {
+	unsigned long shmem_size;
 	struct sbi_dbtr_hart_triggers_state *hart_state;
 
 	if (dom && !sbi_domain_is_assigned_hart(dom, current_hartindex())) {
@@ -271,6 +273,9 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 		return SBI_ERR_DENIED;
 	}
 
+	if (flags)
+		return SBI_ERR_INVALID_PARAM;
+
 	hart_state = dbtr_thishart_state_ptr();
 	if (!hart_state)
 		return SBI_ERR_FAILED;
@@ -304,9 +309,11 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_hi)
 		return SBI_EINVALID_ADDR;
 
-	if (dom && !sbi_domain_check_addr(dom,
-		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
-		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+	/* Must fail if address *range* is not fully accessible - size is assumed to be trig_max * (XLEN /2) bytes */
+	shmem_size = (unsigned long) hart_state->total_trigs * (__riscv_xlen / 2);
+	if (dom && !sbi_domain_check_addr_range(dom,
+		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), shmem_size,
+		  smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	hart_state->shmem.phys_lo = shmem_phys_lo;
@@ -332,6 +339,7 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
 	trig->state = 0;
 
 	__set_bit(RV_DBTR_BIT(TS, MAPPED), &trig->state);
+	__set_bit(RV_DBTR_BIT(TS, HAVE_TRIG), &trig->state);
 
 	SET_TRIG_HW_INDEX(trig->state, trig->index);
 
@@ -616,6 +624,9 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (trig_count >= hs->total_trigs)
+		return SBI_ERR_BAD_RANGE;
+
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
 
@@ -641,7 +652,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 			*out = _idx;
 			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
+			return SBI_ERR_NOT_SUPPORTED;
 		}
 
 		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
@@ -702,13 +713,17 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
-	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
+	for_each_set_bit_from(idx, &trig_mask, RV_MAX_TRIGGERS) {
 		trig = INDEX_TO_TRIGGER(idx);
-		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
+		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) || idx >= hs->total_trigs)
 			return SBI_ERR_INVALID_PARAM;
+	}
 
+	/* Only uninstall after validating the arguments - maintain atomicity */
+	idx = trig_idx_base;
+	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
+		trig = INDEX_TO_TRIGGER(idx);
 		dbtr_trigger_clear(trig);
-
 		sbi_free_trigger(trig);
 	}
 
@@ -727,6 +742,14 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	for_each_set_bit_from(idx, &trig_mask, RV_MAX_TRIGGERS) {
+		trig = INDEX_TO_TRIGGER(idx);
+		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) || idx >= hs->total_trigs)
+			return SBI_ERR_INVALID_PARAM;
+	}
+
+	/* Only enable after validating the arguments - maintain atomicity */
+	idx = trig_idx_base;
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
@@ -737,8 +760,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 }
 
 int sbi_dbtr_update_trig(unsigned long smode,
-			 unsigned long trig_count)
+			 unsigned long trig_count, unsigned long *out)
 {
+	int stat = SBI_SUCCESS;
 	unsigned long trig_idx;
 	struct sbi_dbtr_trigger *trig;
 	union sbi_dbtr_shmem_entry *entry;
@@ -772,23 +796,52 @@ int sbi_dbtr_update_trig(unsigned long smode,
 		trig_idx = entry->id.idx;
 
 		if (trig_idx >= hs->total_trigs) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
-			return SBI_ERR_INVALID_PARAM;
+			stat = SBI_ERR_INVALID_PARAM;
+			goto endloop;
 		}
 
 		trig = INDEX_TO_TRIGGER(trig_idx);
 
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
-			return SBI_ERR_FAILED;
+			stat = SBI_ERR_FAILED;
+			goto endloop;
+		}
+
+		if (TDATA1_GET_TYPE(entry->data.tdata1) != TDATA1_GET_TYPE(trig->tdata1)) {
+			stat = SBI_ERR_INVALID_PARAM;
+			goto endloop;
+		}
+
+		switch(TDATA1_GET_TYPE(entry->data.tdata1)) {
+			case RISCV_DBTR_TRIG_MCONTROL:
+			case RISCV_DBTR_TRIG_MCONTROL6:
+				if ( (entry->data.tdata1 & RV_DBTR_BIT_MASK(MC6, CHAIN)) != (trig->tdata1 & RV_DBTR_BIT_MASK(MC6, CHAIN)) ) {
+					stat = SBI_ERR_INVALID_PARAM;
+					goto endloop;
+				}
+				break;
+			default:
+				break;
 		}
 
 		if ((entry->data.tdata2 && !tdata2_impl) ||
 		    (entry->data.tdata3 && !tdata3_impl)) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
+			stat = SBI_ERR_NOT_SUPPORTED;
+			goto endloop;
 		}
 
+		endloop:
+			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			if (stat != SBI_SUCCESS) {
+				*out = _idx;
+				return stat;
+			}
+	}
+
+	/* Only update after validating request - maintain atomicity */
+	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
+		trig = INDEX_TO_TRIGGER(entry->id.idx);
 		dbtr_trigger_setup(trig, &entry->data);
 		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
 		dbtr_trigger_enable(trig);
@@ -809,6 +862,14 @@ int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	for_each_set_bit_from(idx, &trig_mask, RV_MAX_TRIGGERS) {
+		trig = INDEX_TO_TRIGGER(idx);
+		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) || idx >= hs->total_trigs)
+			return SBI_ERR_INVALID_PARAM;
+	}
+
+	/* Only disable after validating the arguments - maintain atomicity */
+	idx = trig_idx_base;
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		dbtr_trigger_disable(trig);
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
index 40a437ee..b86ce5b3 100644
--- a/lib/sbi/sbi_ecall_dbtr.c
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -28,7 +28,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
 		break;
 	case SBI_EXT_DBTR_SETUP_SHMEM:
 		ret = sbi_dbtr_setup_shmem(sbi_domain_thishart_ptr(), smode,
-					   regs->a0, regs->a1);
+					   regs->a0, regs->a1, regs->a2);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_READ:
 		ret = sbi_dbtr_read_trig(smode, regs->a0, regs->a1);
@@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_UPDATE:
-		ret = sbi_dbtr_update_trig(smode, regs->a0);
+		ret = sbi_dbtr_update_trig(smode, regs->a0, &out->value);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_DISABLE:
 		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
