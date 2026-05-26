Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BDDCD5BB1
	for <opensbi@archiver.kernel.org>; Tue, 26 May 2026 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cS1peqrQBv0DC5QvdwoJ/1ifqxclQxcxdz37hiWStPA=; b=SSNW9/7IUDiPtQ
	NddrCQ9ajGEBueXyUFcpEQxfKbM3Jvbj1TGsB6UCiMrnapfMvlA2Z3QJHTs2oxKQBU+rc9lLVnOPt
	U9W/s/toSjeoFbY4PFJW2G0Kd/XlarFfK7+p7lzV/Mn+hHu2NhvKl7vYn/U6rkpWW7gz5qcDlEsMk
	ezYeN5+10FLi64k+BogdwbcQ0CCwMTEcpJ0ZvLcryIYB2dfX1U0OS+hn643Ip4TfOwKIscBDuSeea
	1/Vl/KvzVYPg/77dBBrzfMlu9u/2/RwrrXrJMMNn6qhEFOay5eXJNu5DzGZxVNTM3JLwWxZ8/w84z
	KxKlJch/X7/pqe8vlIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvYe-00000002ihR-3kde;
	Tue, 26 May 2026 17:27:12 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvYa-00000002igY-0WuN
	for opensbi@lists.infradead.org;
	Tue, 26 May 2026 17:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9Vh5+PjDSlASU5M+h8wS2i6KqQtK6cBCH1Xyaulk7NcEm952bsrluBa2enIGxzbmfHUn1uBj0j+v04ar8qv9KZ7lPCGpgTGPxuny/6v5XMqF+/ADYZKTAWM844V2ivjh69OuLF07SdNCpohAzze8SFP5FAJi09nnLlNiRCavTOE/3Dsmt4KCnOJA+2uIul1ZrjjVlDd2spu6jzC7I10Nsoi26JqtUOlvosAnDYdG3Vy+bGTJNHfJyzl8NE7AT7MsPOESeIphRc4YCzswFcemAgf7OJPlMI+s4VAs6MTmh+salxPSrtN3qCJcLWDWeQWyl8pLyc0SlqBjGDLsaPalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D57fgopllnC8yTaNqXMUXC4J1r8/8yVlZr7DjljerU=;
 b=OEbNmtXkvJDSuox6JfkshPwPDqSik1BYvX26DFKAp4RBCTLbyJcZo2DRGQMSCOlrxzQPd5prSSDGOLO+PmI1Q3+zRsh6jE81NF47HgehNt6cRLRvQPffhPYq+U1bqJN8HJ0x8wcQI8u8DJO/y0zOdSngIdlkozlpzqCiQIrGdRoeA4BNtASFfJ8lOe+bdd0OgRP/VmmiSNZIZV1RepSgggvWt6zq6ArIgQ+lAL5zq7YQOTYrwoq544WwwPT5p7J+OWFluJy+y0UV0+Qa/OEeX6vBxFWY6LscdJKYkDHSXurv33mG9S0GKqdPNhXBBtwg5vLvh0vkXLz31OMwD6yPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D57fgopllnC8yTaNqXMUXC4J1r8/8yVlZr7DjljerU=;
 b=wJQmWBrAhDoXdj15hQaPfOZtAwawmx0TAswtVn8ES2ZSIIkuBLWc0/6mWzVDTufnea8CImiEq+5qNshMAv5cLGSGegVDI93dQPcmgYU4cGaHj8MFwGDCVEl/RryL9xjvrEmzXFUR+mrdLyM24BDWWKh00hPqbUM1P45xSfTbfMj4lS1akeo8tywQ2R5MiR1fy6siIco7pKbq/mjaK26xtFagcPpU5dr50ra4ON53R+BLo/lWd+AmjzSCfrKqPVdiRFxrzIXWrHvtAd+v0tkWfU8bibjFCcaMwN3qUqBidISmPz0HvXgJLyP+QA3SZAFt2TFfBlmxPm6ZlIzhF8kk5w==
Received: from PH0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::32)
 by EA2PR22MB4753.namprd22.prod.outlook.com (2603:10b6:303:254::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 17:26:57 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::a2) by PH0P220CA0019.outlook.office365.com
 (2603:10b6:510:d3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Tue, 26
 May 2026 17:26:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 17:26:56 +0000
Received: from davidAhead.lan (unknown [10.8.0.21])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 353038055C;
	Tue, 26 May 2026 10:26:54 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH v2] lib: sbi: dbtr: do not unconditionally access tdata2/tdata3 CSRs
Date: Tue, 26 May 2026 11:26:51 -0600
Message-ID: <20260526172651.280722-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525185033.4165210-1-david.garcia@aheadcomputing.com>
References: <20260525185033.4165210-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|EA2PR22MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a1c3fb-0642-42bb-0f50-08debb4bfc3f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|55112099003|22082099003|18002099003|18092099006|10086099003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: CWkjqeyrIF2NQCcV8/KlHwYsRsaWLo2wFzFQZkf/SLwhZw1Mruj2Hf1zXKCxgQ6t7YEoAuBlqC8jhLZ6VVQBmT9XjMfVHy5ONRYRz5kydt3CJyt+gEE94/2J4/B41NzOdXL6gKvjq1cRQGTYNCoU/tPQCcR22Oln7KyYbJD/W5WCvDeWnTpfkhnKxiGEHMUQpP+d2lbj7ibsl1GoBUO6LS9NhH1Eni0MVMDVIAGdW31+Y2CKmZbXYxQh8gC4y+wa8jXoSzHlNQXjg+ea6mOJUGbXrCGkeS9ZNZ9tL95/mCcozidOYO7CXSMkFZpnMjWAQATlCYDVNKxMegK68iRmwuXKw8gHuKowttgowtte3fBYl7k7xMRuSZXRopvdnX2UlZP9fAkGk10kcXNtMU8+LhW1zwHQl6fbFIchSufaLfechqEmcF/Kvud4f8plcRJuZ5sBQzsYOXAh8G3ZLcJQhjsZop6Vcf8RbXZyAuBFgAwn8FgyhVb6cKBZhzCmoL5nvIy2l6WX7SUJY7zTX7VGxNA22g1ltfzq+IciTaq3iPJ38fJBckkj6wlnhvhiL0kGFmq4H+9QDmwB09T1cCctAMxImHOFRQpxjRYAqsuy9IUGWSiK8Ni4pa0XwmlpVGlhYlFpOOA6I+im8LoIfcBMHuWlnUiN539fvF5Wbv6j93PJpGu5SnFrik+XEjCUJPAJLYwP1cHhTmZpf1nRIDpXB50rmz9DDhvibBnPm6RQXhI=
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(55112099003)(22082099003)(18002099003)(18092099006)(10086099003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9OLHbbnmRebFfZH+i9LQtudcrI4WaZblElRq9yFxO749tmE0p/9YVex31RdiMctcy57jjhkd73hbIR8FKPniNSD3fK/5pvjywa7esAx2ICzljZ2RxIbyLDWQPPEwwz4sf+Y24Ks34A9DYOOXfuigUAS/FNjsxL6nuqq0VWXSMRkXv2Wq8y6zJOsau3GOJQx85b9LxY8bRQCEvOYnryD4ccRdT/kGGFyo+vKZziHqnjZbprjN/OL/jtgulxipRJ0r/S30O+tRu/2g5EKHZAdFP9IicW/h8SR30jopaIgTpkW8NBZBWz4titKpkVTVEG311dbp8XAQdkRDH2TQPpK5Q24OZ+wIz95w0Pci8WyELpnNrLndhhrDuRlTaHltU7zDX1iLmvkTqrdQn1XB8ZeoSQOi8TzH0chReb1/3zK4wm2RIHZWDcTcFYjlUbSKIf5n
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 17:26:56.1529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a1c3fb-0642-42bb-0f50-08debb4bfc3f
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB4753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_102708_196324_539ED898 
X-CRM114-Status: GOOD (  19.18  )
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

The current SBI DBTR extension implementation accesses tdata2 and tdata3
without first checking whether either register is implemented on the
underlying hart. This produces an illegal instruction exception on
otherwise spec-compliant cores that legitimately omit one or both
registers.

Per the RISC-V Debug Specification, Chapter 5 (Sdtrig ISA Extension)
and Section 5.7 (Trigger Module Registers):

  Section 5 (Sdtrig introduction):
    "If Sdtrig is implemented, the Trigger Module must support at least
     one trigger. Accessing trigger CSRs that are not used by any of the
     implemented triggers must result in an illegal instruction
     exception. M-Mode and Debug Mode accesses to trigger CSRs that are
     used by any of the implemented triggers must succeed, regardless of
     the current type of the currently selected trigger."

  Section 5.7 (Trigger Module Registers):
    "Attempts to access an unimplemented Trigger Module Register raise
     an illegal instruction exception."

Per-register optionality is also explicit:

  Section 5.7.3 (Trigger Data 2, at 0x7a2):
    "Trigger-specific data. It is optional if no implemented triggers
     use it."

  Section 5.7.4 (Trigger Data 3, at 0x7a3):
    "Trigger-specific data. It is optional if no implemented triggers
     use it."

  Section 5.7.17 (Trigger Extra (RV32), at 0x7a3), which also applies
  via textra64 on RV64:
    "All functionality in this register is optional. Any number of
     upper bits of mhvalue and svalue may be tied to 0. mhselect and
     sselect may only support 0 (ignore)."

Unconditionally accessing tdata2/tdata3 in the install/update/read/
uninstall paths causes SBI calls to fail with an illegal instruction
exception on hardware that does not implement one or both CSRs, even
if the supervisor-supplied trigger configuration does not require the
missing CSR(s).

This patch:

  1. Wraps every tdata2/tdata3 read and write in csr_read_allowed /
     csr_write_allowed so that an illegal-instruction trap raised by
     an unimplemented CSR is caught locally rather than propagated. On the
     read path, a trapped read yields zero, on the
     write path, the trap is silently absorbed (writes to an
     unimplemented CSR are no-ops by definition).

  2. On the install and update paths, rejects requests that program
     a non-zero trig_tdata2 or trig_tdata3 into an unimplemented CSR
     with SBI_ERR_NOT_SUPPORTED, matching the SBI spec
     wording in sections 19.4 / 19.5:

       "One of the trigger configuration can't be programmed due to
        unimplemented optional bits in tdata1, tdata2, or tdata3
        CSRs."

     Implementation status is probed once per call via
     csr_read_allowed. This only catches the "whole CSR
     unimplemented" case; tied-off WARL bits inside an otherwise-
     implemented CSR are not caught here and would require
     programming the trigger and reading the value back for
     comparison, which can be addressed separately.

  3. Enable tdata3 configuration in the debug trigger install path.

References:
  - RISC-V Debug Specification, Chapter 5 (Sdtrig), sections 5, 5.7,
    5.7.3, 5.7.4, 5.7.17.
  - RISC-V SBI Specification v3.0, Chapter 19 (Debug Triggers
    Extension), sections 19.4, 19.5.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
Changes since v1:
 - Replaced the boot-time probe and the cached per-hart
   tdata2_supported / tdata3_supported flags with per-access
   csr_read_allowed / csr_write_allowed at every tdata2/tdata3 site,
   per Nicholas Piggin's review. This covers both spec-compliant
   cores and implementations whose trap behavior depends on the
   currently selected trigger type (e.g. QEMU's tdata_available()).
 - Dropped the additions to struct sbi_dbtr_hart_triggers_state.
 - Install / update SBI_ERR_NOT_SUPPORTED checks now probe via
   csr_read_allowed once per call. Added a comment noting that this
   only catches the "whole CSR unimplemented" case; tied-off WARL
   bits inside an implemented CSR are not detected and can be
   addressed in a follow-up.

 lib/sbi/sbi_dbtr.c | 76 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 8bcb4312..aeb92f58 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -367,6 +367,7 @@ static inline void update_bit(unsigned long new, int nr, volatile unsigned long
 
 static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
 {
+	struct sbi_trap_info trap = {0};
 	unsigned long state;
 	unsigned long tdata1;
 
@@ -418,7 +419,15 @@ static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
 	 */
 	csr_write(CSR_TSELECT, trig->index);
 	csr_write(CSR_TDATA1, 0x0);
-	csr_write(CSR_TDATA2, trig->tdata2);
+	/*
+	 * tdata2 and tdata3 are optional in the RISC-V Sdtrig extension.
+	 * Use csr_write_allowed so that writing to an unimplemented CSR
+	 * traps locally and is silently absorbed; install/update have
+	 * already rejected non-zero requested values for unimplemented
+	 * CSRs.
+	 */
+	csr_write_allowed(CSR_TDATA2, &trap, trig->tdata2);
+	csr_write_allowed(CSR_TDATA3, &trap, trig->tdata3);
 	csr_write(CSR_TDATA1, trig->tdata1);
 }
 
@@ -458,12 +467,16 @@ static void dbtr_trigger_disable(struct sbi_dbtr_trigger *trig)
 
 static void dbtr_trigger_clear(struct sbi_dbtr_trigger *trig)
 {
+	struct sbi_trap_info trap = {0};
+
 	if (!trig || !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
 		return;
 
 	csr_write(CSR_TSELECT, trig->index);
 	csr_write(CSR_TDATA1, 0x0);
-	csr_write(CSR_TDATA2, 0x0);
+	/* Clearing an unimplemented tdata2/tdata3 is a no-op; absorb the trap. */
+	csr_write_allowed(CSR_TDATA2, &trap, 0x0);
+	csr_write_allowed(CSR_TDATA3, &trap, 0x0);
 }
 
 static int dbtr_trigger_supported(unsigned long type)
@@ -562,12 +575,14 @@ int sbi_dbtr_read_trig(unsigned long smode,
 	sbi_hart_protection_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		struct sbi_trap_info trap = {0};
+
 		xmit = &entry->data;
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
 		csr_write(CSR_TSELECT, trig->index);
 		trig->tdata1 = csr_read(CSR_TDATA1);
-		trig->tdata2 = csr_read(CSR_TDATA2);
-		trig->tdata3 = csr_read(CSR_TDATA3);
+		trig->tdata2 = csr_read_allowed(CSR_TDATA2, &trap);
+		trig->tdata3 = csr_read_allowed(CSR_TDATA3, &trap);
 		xmit->tstate = cpu_to_lle(trig->state);
 		xmit->tdata1 = cpu_to_lle(trig->tdata1);
 		xmit->tdata2 = cpu_to_lle(trig->tdata2);
@@ -589,6 +604,8 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	unsigned long ctrl;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
+	struct sbi_trap_info trap = {0};
+	bool tdata2_impl, tdata3_impl;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -601,6 +618,19 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	sbi_hart_protection_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 
+	/*
+	 * Probe tdata2/tdata3 implementation status for the
+	 * SBI v3.0 sec 19.4/19.5 mandatory SBI_ERR_NOT_SUPPORTED check
+	 * below. This only catches the "whole CSR unimplemented" case;
+	 * WARL bits tied off inside an otherwise-implemented CSR are
+	 * not caught here.
+	 */
+	csr_read_allowed(CSR_TDATA2, &trap);
+	tdata2_impl = !trap.cause;
+	trap.cause = 0;
+	csr_read_allowed(CSR_TDATA3, &trap);
+	tdata3_impl = !trap.cause;
+
 	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
@@ -619,6 +649,20 @@ int sbi_dbtr_install_trig(unsigned long smode,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
+
+		if (recv->tdata2 && !tdata2_impl) {
+			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
+			return SBI_ERR_NOT_SUPPORTED;
+		}
+
+		if (recv->tdata3 && !tdata3_impl) {
+			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
+			return SBI_ERR_NOT_SUPPORTED;
+		}
 	}
 
 	if (hs->available_trigs < trig_count) {
@@ -705,6 +749,8 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	union sbi_dbtr_shmem_entry *entry;
 	void *shmem_base = NULL;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
+	struct sbi_trap_info trap = {0};
+	bool tdata2_impl, tdata3_impl;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -718,6 +764,18 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	if (trig_count >= hs->total_trigs)
 		return SBI_ERR_BAD_RANGE;
 
+	/*
+	 * Probe tdata2/tdata3 implementation status for the
+	 * SBI v3.0 sec 19.4/19.5 mandatory SBI_ERR_NOT_SUPPORTED check
+	 * below. Only the "whole CSR unimplemented" case is caught
+	 * here; tied-off WARL bits inside an implemented CSR are not.
+	 */
+	csr_read_allowed(CSR_TDATA2, &trap);
+	tdata2_impl = !trap.cause;
+	trap.cause = 0;
+	csr_read_allowed(CSR_TDATA3, &trap);
+	tdata3_impl = !trap.cause;
+
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
 		trig_idx = entry->id.idx;
@@ -734,6 +792,16 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			return SBI_ERR_FAILED;
 		}
 
+		if (entry->data.tdata2 && !tdata2_impl) {
+			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			return SBI_ERR_NOT_SUPPORTED;
+		}
+
+		if (entry->data.tdata3 && !tdata3_impl) {
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
