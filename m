Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D529DC54EFC
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7a/rywyDbH8HvPR8GZ+ioReFqdjbmsHeQlZiddVescQ=; b=VKVgII0jjNFYpG
	8pASFCaWbJfhFRAeh/KrHFcCogTsZI6nZI3vkmr/xLD/KAGHOFq5lCt1O1bwiWNAT832V/eem5foY
	apK1BJpL8/+TVNKzfY1SkRCM17wK6e50llautUMlFwhegilUf/AtzNI1E59DVRQU3b+6DSb4t7ogD
	GJ/niIUSlxjP2cpAlZokCBW/fdWkm7/SdaktiNjkXpaFKileOGrIqzJ+20x1PdgvPxi1E+vDCVpas
	jFWCOZnI2xJagCgrB2tmgP3vb5iv+qkfcJVvALYg6XzC3j163vWJ0arbRw2Mi6rPwVEAqtfb/2c8k
	7IapvEoXudp21VaGdIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ6N-00000003fZu-3b6p;
	Mon, 27 Jul 2026 18:30:59 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ6K-00000003fXy-09H1
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 18:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKb6HIbD1bOwwivxe+gjzivr2rOb/nxDqBVpJfxDsKN0GIZU/JaZZWvITlYaWt6U3MDC1YPzHCT0Aavp0KhfXMqdTOjJwFZ8Sszq5gF5Hz2WGsb3sybLpwcl3/iOFoMUxcsKNuncp+79w28Rr6lin26nF4s3/7TTJVxr1FR0oNkYZTfVtLnkKpDmJDR/6FDkKGMvK/+jKbJo5IkpNErq2rrT6MiKnyb9GYElUYF3TIglePNd80PyJYLlbPDQrPI/KUlPdxD/4ODtR5iVGVF0LQ24fANJQtHOLHBRf+4RgjIVBIKTNjaeZw+FGuz6rZ6JGnNVnmNSEC+1sg087Bk8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbdTR5ltcKuoKkpu5qe5wHRiTigtJdNULEM610Vj6B4=;
 b=MzfKYxHQeCT6KzsRIox62rNdMIurGijiekdfWDzHDae1UtfCWRu60bTU2XnFlceR4BlzCrmwiZ3qMa5+kyG2V8gAc0dFKg01LhQD3wUJaKu3wItKawhTYnciaBvO5pvnNwBsB+2tuHAszhOwrJE7mIa9U0rmdy3XKPnCALqP+t267LJOwEc9ce7GtVj0FugIwsRG3PDF8/m8QFu3Fa3S6iospznTIEyMJJ8X81FUFsgtpEWffPJPa6tRmm963wosgiME9nclenVmsw8hrifRzBJKJCUUPaKOm4u6NGcSSXWOjTeR7JsePxes3nFy4Ri/bIBdtMwIpb2gx3GbBzp1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbdTR5ltcKuoKkpu5qe5wHRiTigtJdNULEM610Vj6B4=;
 b=Dd4PznrzOtMZ++YReiNe+E2+RJmytEgLahNkzXw38jiChrmgXPxbR/UpRYimTCjZgp9hs/yRQ1q0iH6f/jVdig2QAFzg6wPtSIO4HViq633R3S7Xokpxj0kJ9zHk0Kg7TUUMoTdr3BEsCBchb3/5X7fIx0OFuRsk3Ag94PTTiE7lxCpY8mdSzjVBWW0McwDJM+yI01EHYgcOr67ppIdsWiexibxlylDJsI5/NKhrtXZ4AggEP9EI5PEDN5KuC0VFu3P4qFkD3H/FuTZ4RZ/DfK5AfwBaZ+IKKUnudKj/6LaHHXx1Wi5jaruZ1oGj4vH0RtCxSB0u6RlH2ya2Mo2aMQ==
Received: from SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31)
 by SJ0PR22MB2893.namprd22.prod.outlook.com (2603:10b6:a03:3d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 18:30:49 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::95) by SJ0PR03CA0116.outlook.office365.com
 (2603:10b6:a03:333::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 18:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 18:30:48 +0000
Received: from davidAhead.lan (unknown [10.8.0.39])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 23766800DF;
	Mon, 27 Jul 2026 11:30:47 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 1/3] lib: sbi: dbtr: add platform device for per-slot trigger capabilities
Date: Mon, 27 Jul 2026 12:30:39 -0600
Message-ID: <20260727183041.258377-2-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727183041.258377-1-david.garcia@aheadcomputing.com>
References: <20260727183041.258377-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SJ0PR22MB2893:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3f6b97-52a4-472a-f1e5-08deec0d2e39
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|11063799006|56012099006|10067099003|6133799003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /AFBrDEL+URlVafT9mybRNzzlcXmFJZ3bnq5UJ5XWuNVnqj2GgBnWQIDVUev2W+WlTDKiN1JHkY8udRCYlhOg5V3Pvpc0F4pemPa5NmZZKGqepDWd0w8JW8L+yNg7s0WdAJzr2Oizs+m7MPMyyC2kqfl8RA4M2cNRcYSiwWT+b0W/HfOh381jjvIHyAZqNpBLBI+UofYL1hDuUchVqTRWk/n4jPEmdlvx5Q9Xr7vlJxIEZYuspPsAmbyFrTDD5l6G2LMr8c6v9KGAlU65EYahqKhc3UHLKT6s1FkdJxzhY6EcSOeLWi4QfU4xOs3dVZ0s5gA1Dzmw8OFHPDU7ZHlF3eeMxZ88gwOXK/dC1ym88Fvfzirxwdi3gfBm+N7nas9DPGrW9TjHHxdKuR0xv+ZjG4lfa1ZDOisf4UtKJKQLHTzqv5cVRWCo7f114m5BgsRQWtQxJB8gfYhuiVO9KqNbQJk/uC4caYr7qsASqo9RTXpVwuP4HRY00dw8nzlwssTy81JfLUCTVINtQCSkZ4n6j2WTaiDZNcgqfvSFzrb32mJti7NYmlgDiqrVTxpL+inb0lLFTEzq39XDd1KUoyewjIneYm0KajW+QDoNYN9VbOgZBo4VuYIaLrUmUFWPa6DDgUOhLo0sAFNGKKXJXblDumRX7o7MGiqaUmSkG/s+Ve0PJ2wfgybXQjcyoBRC9LTFyJ5b4E422lk+RlY1caGRA==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(11063799006)(56012099006)(10067099003)(6133799003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MxFO46r2luQz8u0BEsAmHHB43NE/FmhugjVeEMYUDqKruw4mo+u9XPyKahxVVlho3pqKvGoUNsI+RYeXQfsF+XHOQHRCl1+aTyZVdsz1oQnx8ZeAJ+08KaIEE5pk9nHRpOf0okvcNJOOzjkEJzDV+J2E6jwJ6+dNzJSTGm+HWbpDxF8J79E+ZIiXj2l/b55xm9gxFUzhqAWpNnAeQ9GW0zbK1DFKtAW251xISzgV5jqCICp96K2vXoWNCdv8Nm4Td4TJrLDvSVd2hMlCMknlPGxzl2r/cwbgjNxxur1ZCv8NdwPGYnKlzJXPwraQtikQ1E7X5R47tTPa0xarJctA0AjKa8ltYYZhc6vI1upmIvhd8ojsbrrTYnJZzmvA98K5+M2Y2PrxtTyBIbiLcP468J2M/6ezr6WfrRT+pQ0SOV+BbQGVhwvB4ALUXo3UN6ZQ
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 18:30:48.7126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3f6b97-52a4-472a-f1e5-08deec0d2e39
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB2893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_113056_116242_58BC0CED 
X-CRM114-Status: GOOD (  20.54  )
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

The tinfo probe only discovers trigger types; WARL fields tied off
inside an implemented trigger CSR (e.g. an mcontrol6 trigger without
load/store address match) are not discoverable. sbi_alloc_trigger()
also selects the first free trigger slot irrespective of the requested
trigger type or configuration. Unsupported configurations are thus
silently dropped by the hardware while SBI reports success, where SBI
v3.0 sections 19.4 / 19.5 require SBI_ERR_NOT_SUPPORTED.

Add an optional platform device, struct sbi_dbtr_device, with a
trigger_supported(idx, tdata1, tdata2, tdata3) callback reporting
whether the trigger slot selected by idx (the tselect value) supports
a given configuration. Use it, together with the probed per-slot
type_mask, to:

  - allocate only trigger slots supporting the requested configuration
    (new dbtr_find_free_slot() helper)
  - reject unsupportable install/update requests with
    SBI_ERR_NOT_SUPPORTED
  - count only supporting slots in sbi_dbtr_num_trig() (SBI v3.0
    section 19.1)

The install path now dry-runs the allocation of the whole batch before
programming any trigger, so a partially-installed batch is never left
behind. Without a registered device, only the type matching applies (unchanged behavior).

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi/sbi_dbtr.h |  10 ++++
 lib/sbi/sbi_dbtr.c     | 162 +++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 152 insertions(+), 20 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index 5e0bf84e..90871f0d 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -77,6 +77,16 @@ struct sbi_dbtr_hart_triggers_state {
 	u32 probed;
 };
 
+/** Platform specific debug trigger operations */
+struct sbi_dbtr_device {
+	char name[32];
+	bool (*trigger_supported)(unsigned long idx, unsigned long tdata1,
+				  unsigned long tdata2, unsigned long tdata3);
+};
+
+const struct sbi_dbtr_device *sbi_dbtr_get_device(void);
+void sbi_dbtr_set_device(const struct sbi_dbtr_device *dev);
+
 #define TDATA1_GET_TYPE(_t1)					\
 	EXTRACT_FIELD(_t1, RV_DBTR_BIT_MASK(TDATA1, TYPE))
 
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..a04f367d 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -24,6 +24,22 @@
 /** Offset of pointer to HART's debug triggers info in scratch space */
 static unsigned long hart_state_ptr_offset;
 
+/** Device specific debug trigger operations */
+static const struct sbi_dbtr_device *dbtr_dev = NULL;
+
+const struct sbi_dbtr_device *sbi_dbtr_get_device(void)
+{
+	return dbtr_dev;
+}
+
+void sbi_dbtr_set_device(const struct sbi_dbtr_device *dev)
+{
+	if (!dev || dbtr_dev)
+		return;
+
+	dbtr_dev = dev;
+}
+
 #define dbtr_get_hart_state_ptr(__scratch)				\
 	sbi_scratch_read_type((__scratch), void *, hart_state_ptr_offset)
 
@@ -105,10 +121,75 @@ static void sbi_trigger_init(struct sbi_dbtr_trigger *trig,
 	trig->index = idx;
 }
 
-static inline struct sbi_dbtr_trigger *sbi_alloc_trigger(void)
+static bool dbtr_trigger_hw_supported(unsigned long idx, unsigned long tdata1,
+				      unsigned long tdata2,
+				      unsigned long tdata3)
+{
+	if (dbtr_dev && dbtr_dev->trigger_supported)
+		return dbtr_dev->trigger_supported(idx, tdata1, tdata2,
+						   tdata3);
+
+	return true;
+}
+
+static bool dbtr_trigger_any_hw_supported(
+			struct sbi_dbtr_hart_triggers_state *hs,
+			unsigned long tdata1, unsigned long tdata2,
+			unsigned long tdata3)
+{
+	unsigned long type = TDATA1_GET_TYPE(tdata1);
+	struct sbi_dbtr_trigger *trig;
+	int i;
+
+	for (i = 0; i < hs->total_trigs; i++) {
+		trig = INDEX_TO_TRIGGER(i);
+		if (__test_bit(type, &trig->type_mask) &&
+		    dbtr_trigger_hw_supported(trig->index, tdata1, tdata2,
+					      tdata3))
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * Find the first free hardware trigger slot supporting the configuration.
+ * Slots set in claimed_mask are treated as taken, which allows the caller
+ * to track slot availability. A 32-bit mask covers RV_MAX_TRIGGERS (32);
+ * for a larger number of triggers, this function needs to be updated.
+ */
+static int dbtr_find_free_slot(struct sbi_dbtr_hart_triggers_state *hs,
+			       u32 claimed_mask,
+			       unsigned long tdata1, unsigned long tdata2,
+			       unsigned long tdata3)
+{
+	unsigned long type = TDATA1_GET_TYPE(tdata1);
+	struct sbi_dbtr_trigger *trig;
+	int i;
+
+	for (i = 0; i < hs->total_trigs; i++) {
+		trig = INDEX_TO_TRIGGER(i);
+		if (trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))
+			continue;
+		if (claimed_mask & BIT(i))
+			continue;
+		if (!__test_bit(type, &trig->type_mask))
+			continue;
+		if (!dbtr_trigger_hw_supported(trig->index, tdata1,
+					       tdata2, tdata3))
+			continue;
+		return i;
+	}
+
+	return SBI_ENOENT;
+}
+
+static inline struct sbi_dbtr_trigger *sbi_alloc_trigger(unsigned long tdata1,
+							 unsigned long tdata2,
+							 unsigned long tdata3)
 {
 	int i;
-	struct sbi_dbtr_trigger *f_trig = NULL;
+	struct sbi_dbtr_trigger *f_trig;
 	struct sbi_dbtr_hart_triggers_state *hart_state;
 
 	hart_state = dbtr_thishart_state_ptr();
@@ -118,17 +199,12 @@ static inline struct sbi_dbtr_trigger *sbi_alloc_trigger(void)
 	if (hart_state->available_trigs <= 0)
 		return NULL;
 
-	for (i = 0; i < hart_state->total_trigs; i++) {
-		f_trig = INDEX_TO_TRIGGER(i);
-		if (f_trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))
-			continue;
-		hart_state->available_trigs--;
-		break;
-	}
-
-	if (i == hart_state->total_trigs)
+	i = dbtr_find_free_slot(hart_state, 0, tdata1, tdata2, tdata3);
+	if (i < 0)
 		return NULL;
 
+	f_trig = INDEX_TO_TRIGGER(i);
+	hart_state->available_trigs--;
 	__set_bit(RV_DBTR_BIT(TS, MAPPED), &f_trig->state);
 
 	return f_trig;
@@ -547,7 +623,8 @@ int sbi_dbtr_num_trig(unsigned long data, unsigned long *out)
 	for (i = 0; i < hs->total_trigs; i++) {
 		trig = INDEX_TO_TRIGGER(i);
 
-		if (__test_bit(type, &trig->type_mask))
+		if (__test_bit(type, &trig->type_mask) &&
+		    dbtr_trigger_hw_supported(trig->index, data, 0, 0))
 			total++;
 	}
 
@@ -608,6 +685,8 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	struct sbi_dbtr_data_msg *recv;
 	struct sbi_dbtr_id_msg *xmit;
 	unsigned long ctrl;
+	u32 claimed = 0;
+	int slot;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	bool tdata2_impl, tdata3_impl;
@@ -626,8 +705,10 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	/*
 	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
 	 * programs a non-zero value into an unimplemented optional CSR. Only
-	 * the "whole CSR unimplemented" case is caught; WARL bits tied off
-	 * inside an otherwise-implemented CSR are not.
+	 * the "whole CSR unimplemented" case is caught here; WARL bits tied
+	 * off inside an otherwise-implemented CSR are delegated to the
+	 * device-specific trigger_supported() callback via
+	 * dbtr_trigger_any_hw_supported().
 	 */
 	tdata2_impl = tdata_implemented(CSR_TDATA2);
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
@@ -658,6 +739,16 @@ int sbi_dbtr_install_trig(unsigned long smode,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_NOT_SUPPORTED;
 		}
+
+		if (!dbtr_trigger_any_hw_supported(hs,
+						   lle_to_cpu(recv->tdata1),
+						   lle_to_cpu(recv->tdata2),
+						   lle_to_cpu(recv->tdata3))) {
+			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
+			return SBI_ERR_NOT_SUPPORTED;
+		}
 	}
 
 	if (hs->available_trigs < trig_count) {
@@ -667,17 +758,40 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		return SBI_ERR_FAILED;
 	}
 
-	/* Install triggers */
+	/*
+	 * Dry-run the allocation of the whole batch so that no trigger
+	 * is installed if any of the requested configurations cannot be
+	 * matched to a free hardware trigger slot.
+	 */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		/*
-		 * Since we have already checked if enough triggers are
-		 * available, trigger allocation must succeed.
-		 */
-		trig = sbi_alloc_trigger();
+		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
+		slot = dbtr_find_free_slot(hs, claimed,
+					   lle_to_cpu(recv->tdata1),
+					   lle_to_cpu(recv->tdata2),
+					   lle_to_cpu(recv->tdata3));
+		if (slot < 0) {
+			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
+			return SBI_ERR_FAILED;
+		}
+		claimed |= BIT(slot);
+	}
 
+	/* Install triggers */
+	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
 
+		/*
+		 * The dry-run above matched every requested configuration
+		 * to a free hardware trigger slot, so allocation must
+		 * succeed.
+		 */
+		trig = sbi_alloc_trigger(lle_to_cpu(recv->tdata1),
+					 lle_to_cpu(recv->tdata2),
+					 lle_to_cpu(recv->tdata3));
+
 		dbtr_trigger_setup(trig,  recv);
 		dbtr_trigger_enable(trig);
 		xmit->idx = cpu_to_lle(trig->index);
@@ -789,6 +903,14 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			return SBI_ERR_NOT_SUPPORTED;
 		}
 
+		if (!dbtr_trigger_hw_supported(trig->index,
+					       lle_to_cpu(entry->data.tdata1),
+					       lle_to_cpu(entry->data.tdata2),
+					       lle_to_cpu(entry->data.tdata3))) {
+			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			return SBI_ERR_NOT_SUPPORTED;
+		}
+
 		dbtr_trigger_setup(trig, &entry->data);
 		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
 		dbtr_trigger_enable(trig);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
