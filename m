Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26418CD98E4
	for <opensbi@archiver.kernel.org>; Tue, 16 Jun 2026 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAGsS6SzpjgPKT4oVZiiZoHW1fco9TwXGti32p5TzyM=; b=CX5WY3FrShme7T
	LaGke2BDLjj6R2Q1LoS6ByQxqR9p8aePUs82bsvAwOyPFCDEXlbQOxOOpxhsMcr/jTLSd0hYy2ARV
	C7sL/Ejt7fIGEssqSyMPgmnF+539CV0efvAn9BBr3Ek60JMpS8YfPlzmLO0e+MtTFHHKQN9hGNgo3
	8RgqwiH9EhKIwIBKVDo3bGQJo8nTmTR9uZqxayeCtOYXE3LcJb4AxQq3rv5pK7jIC0I4NUuuWUL7m
	mYQFU7xr9tFkj9swj+Oc46RXchKogUIIVfIgKn0juvYVm5Gwi2rKmrYyYrtDc/xGBGLJa43mBTmYD
	w1ZGf6tIT92YoJuQVVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZXAM-0000000G8gP-48mo;
	Tue, 16 Jun 2026 17:01:35 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZXAJ-0000000G8fK-3YFG
	for opensbi@lists.infradead.org;
	Tue, 16 Jun 2026 17:01:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcxfkgPfjkiVSOaRzXcvCbWXKvJywQxNnsjlrG5NyNDhALhrGOB31W6fFzz7oPI9hid15RT8NcFL/yb6AjNflNCZC2kCvEhGFrYpoWM4XYcqQ658t6ZwSMk+BiIKyjJjXUhPtZOLseVcYLvosvTkcUpbQnMD2fzWnyT5hA2UnAL9zasErj3VbrxIWUih5AZfavddfySFk1EE8rZI8i4N8prQFhljs4uAfIsrSoQqZ9tF4cXrBnt8i3rEiRGK2CX2Ivb3VoeRBlfbSfnvnqYPCV4lIH1iHfwafr0wPrt2B7HImcPzaZw2XyfKbQl+8jKPnV4ql4RUHDbz4fjtneG9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2HyeMeIrTBsyCvFTwjIafWNqYwXS+K17DsgqiilbS8=;
 b=ECdrE6YlQvRKA60riSmzpi1QdtWiycQMmDIrRcc0EbXcpzim6D7CjLvcaIbkQpVFE2gjxZ3k+mc6agcD+zQFTISXcWMJD6Jabd9VUXjKlVpEbjLXau6AmlpZoMlKfmGlrhBJom6PHCVIWQq2otIvFBcT/oPIIs9a3cEC1bnLf/4mR1UfmjI0AvQplQviqJ0fYOJ2GxjUcetFoBpmCnQv5IXQ0CY6vKedAY0HOwigxwqAZfAK3pMyIU+5PI1CNAv81cqrE1jwLvdtpPrL2SalbUGBE5ncoq5QuvQjqMWoEV0n5F3hkkGk40AoJB586Mz5XhxZ0CxSJcp7/4nWLIs9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2HyeMeIrTBsyCvFTwjIafWNqYwXS+K17DsgqiilbS8=;
 b=OPVqXn0tDVdVrRMY+qoVWuTliikpg60STADugilOHISqBRR+Ue+bV9+sGmQGpySJPbosrO9XlBCHhvJJJdrwCSuKg9y+N/KOCBCV+e3BJep61GJBI5y67AYTfxG1qg6WHMi4JeaWffNaR8yDVLZmj57D2XoQAa68jCzT7kgA0HcFZQO9PN7KysY9/d30q6ey0jv2eMDed2JlBQVZ65uQjU33NlPAGCwXDdDpWJfFtmnKic7EqEN49QB4VA9oTMBE41sm74CEuzvq75P/AiJdY4nlKCVwAURh0g1Erlgu/R0Uqg2nR9BxUTR61XP68IzWNBsUPBhWq6CIqmaMjYqNlA==
Received: from MN2PR16CA0041.namprd16.prod.outlook.com (2603:10b6:208:234::10)
 by IA2PR22MB5672.namprd22.prod.outlook.com (2603:10b6:208:4a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:01:23 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::11) by MN2PR16CA0041.outlook.office365.com
 (2603:10b6:208:234::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 17:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Tue, 16 Jun 2026 17:01:23 +0000
Received: from davidAhead.lan (unknown [10.8.0.36])
	by mail.aheadcomputing.com (Postfix) with ESMTP id CF937805B8;
	Tue, 16 Jun 2026 10:01:20 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH v3] lib: sbi: dbtr: do not unconditionally access tdata2/tdata3 CSRs
Date: Tue, 16 Jun 2026 11:01:18 -0600
Message-ID: <20260616170118.3515676-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525185033.4165210-1-david.garcia@aheadcomputing.com>
References: <20260525185033.4165210-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|IA2PR22MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: b857fd90-2a78-47ae-2d1c-08decbc8e535
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|55112099003|10086099003|3023799007|6133799003|22082099003|18002099003|18092099006;
X-Microsoft-Antispam-Message-Info: lvxv61SlNGbjWTdhlO8BQqeTWpNndVLpABA1QPU1Krpa3kLeGql7v8hc0+LBsbi88efnZmBztKR7DE1OO0jJRI/dRgpUBhlQusv2VPJ6t1rY0Hgl5XsIyEBibEARUHCf61s3BhJKYz0juYUlZtKgpNsy+8HFwrcmVByDPzH6S6GXbC52XzYkYFj8mmF5Wx+WOZd3xy8PeRBGNnXQTO8Eho5t3ZmHefDvHufNPIEZaIHzPTwBjdS/fAYecN+f0S6k4gfIp+ZlqjliNSsrHh6drw6sfhP0c+CURovZePD1CZI1xHQ4JO3ktzAS+2ukE5oJIZcURZe867uYiwvK7rKpYCF6WlwI0haealD/LvWKsNkwsFSMCv4akag57u+r1llWIeAj9PdzR1qSeFkjKPGNVP4jUa1sMY/7Bs9OSQW0YWtbm4Q03PubOTkTU9z4NokYf64HJngMt1fCPzzNYofI6wJqL6BvO8XcHXbHkY9jOcHMt2aX9x20T6NhHz9xin+9UgiWwXpJb3VbHCCMeT7XrYZ4aYG2EJrMbosOmL56H13PELriBbgY8C3xgl7t3JJbTi4b1Ia6bQhd7xvVZZpQwb990PgPFNlEcQSWmjGUsa8/Ml49h0Axd5cs8D/bNZvNETgm7qARLFJB2k3cy9pp10rO9QGyqJZOqf/4ZG6riIajpDlaqAcvf8t/gcPttzMdElTplKHO31t2dQDXKzv2N6IsNKEntWvlJimNm4AjKGo=
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(55112099003)(10086099003)(3023799007)(6133799003)(22082099003)(18002099003)(18092099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Zg6pCcUb/GWI1DV/maH3u6SBrFBOXl5nSBNSpzpYS/5epoYOZi7JgZE9n0eRnTFvYGFAmKPMZrLupGxm7PZ8bouF98IwuZd5mmUEEVkQve5XaYda8OQGl0KOMzm3xr7MpD7kRkYHBar1AS8EHpxJQVgUrWOZucucsybxyAgG+yxcZgOTilVMzMW7ZfKePNnzXcBBlwpMXo7iiPtSHYzcmD5ZU5vlmhJabVQvZvIHMHRonIdosaTxrlz0g9swUzKUxB3m5VLkO7C7foXnC/u/vCGqbREd26/ofOp7YOL1opIX4UbTLdebr1HLk9w7R0HKgUq0JSYYwaLtqQTGGbfOJeAv7r1AJVCpxEwF9TT6ISx5odN6DWaO5W40n+N7CvVLHiNm/p4B3qZguclPcR2ZzN+e6HfZwj2QywG6nEZs0MiWH43XkLW7xNWHXi3xMvwg
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:01:23.1074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b857fd90-2a78-47ae-2d1c-08decbc8e535
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR22MB5672
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_100132_113710_CA6F35E6 
X-CRM114-Status: GOOD (  18.24  )
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

  1. Introduces tdata_read_safe() / tdata_write_safe() helpers that
     wrap csr_read_allowed / csr_write_allowed so that an illegal-
     instruction trap raised by an unimplemented CSR is caught locally
     rather than propagated. On the read path, a trapped read yields
     zero; on the write path, the trap is silently absorbed (writes to
     an unimplemented CSR are no-ops by definition). Every tdata2/tdata3
     read and write in the install/update/read/uninstall paths is
     converted to these helpers.

  2. On the install and update paths, rejects requests that program
     a non-zero trig_tdata2 or trig_tdata3 into an unimplemented CSR
     with SBI_ERR_NOT_SUPPORTED, matching the SBI spec
     wording in sections 19.4 / 19.5:

       "One of the trigger configuration can't be programmed due to
        unimplemented optional bits in tdata1, tdata2, or tdata3
        CSRs."

     Implementation status is probed once per call via the
     tdata_implemented() helper. This only catches the "whole CSR
     unimplemented" case; tied-off WARL bits inside an otherwise-
     implemented CSR are not caught here and would require programming
     the trigger and reading the value back for comparison, which can
     be addressed separately.

  3. Enable tdata3 configuration in the debug trigger install path.

References:
  - RISC-V Debug Specification, Chapter 5 (Sdtrig), sections 5, 5.7,
    5.7.3, 5.7.4, 5.7.17.
  - RISC-V SBI Specification v3.0, Chapter 19 (Debug Triggers
    Extension), sections 19.4, 19.5.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Suggested-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
Changes since v2:
 - Wrapped the repeated csr_read_allowed / csr_write_allowed +
   sbi_trap_info boilerplate in tdata_read_safe() / tdata_write_safe()
   statement-expression macros, and the per-call implementation probe
   in a tdata_implemented() macro returning a boolean, per Himanshu
   Chauhan's review. All open-coded tdata2/tdata3 reads, writes and
   probes now go through these helpers.
 - The install / update SBI_ERR_NOT_SUPPORTED checks now call
   tdata_implemented() and are collapsed into a single condition per
   path.

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

 lib/sbi/sbi_dbtr.c | 63 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 8bcb4312..01047969 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -34,6 +34,25 @@ static unsigned long hart_state_ptr_offset;
 	sbi_scratch_write_type((__scratch), void *, hart_state_ptr_offset, \
 			       (__hart_state))
 
+#define tdata_read_safe(__csr)						\
+	({								\
+		struct sbi_trap_info __trap = {0};			\
+		csr_read_allowed((__csr), &__trap);			\
+	})
+
+#define tdata_write_safe(__csr, __value)				\
+	({								\
+		struct sbi_trap_info __trap = {0};			\
+		csr_write_allowed((__csr), &__trap, (__value));		\
+	})
+
+#define tdata_implemented(__csr)					\
+	({								\
+		struct sbi_trap_info __trap = {0};			\
+		csr_read_allowed((__csr), &__trap);			\
+		!__trap.cause;						\
+	})
+
 #define INDEX_TO_TRIGGER(_index)					\
 	({								\
 		struct sbi_dbtr_trigger *__trg = NULL;			\
@@ -418,7 +437,8 @@ static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
 	 */
 	csr_write(CSR_TSELECT, trig->index);
 	csr_write(CSR_TDATA1, 0x0);
-	csr_write(CSR_TDATA2, trig->tdata2);
+	tdata_write_safe(CSR_TDATA2, trig->tdata2);
+	tdata_write_safe(CSR_TDATA3, trig->tdata3);
 	csr_write(CSR_TDATA1, trig->tdata1);
 }
 
@@ -463,7 +483,8 @@ static void dbtr_trigger_clear(struct sbi_dbtr_trigger *trig)
 
 	csr_write(CSR_TSELECT, trig->index);
 	csr_write(CSR_TDATA1, 0x0);
-	csr_write(CSR_TDATA2, 0x0);
+	tdata_write_safe(CSR_TDATA2, 0x0);
+	tdata_write_safe(CSR_TDATA3, 0x0);
 }
 
 static int dbtr_trigger_supported(unsigned long type)
@@ -566,8 +587,8 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
 		csr_write(CSR_TSELECT, trig->index);
 		trig->tdata1 = csr_read(CSR_TDATA1);
-		trig->tdata2 = csr_read(CSR_TDATA2);
-		trig->tdata3 = csr_read(CSR_TDATA3);
+		trig->tdata2 = tdata_read_safe(CSR_TDATA2);
+		trig->tdata3 = tdata_read_safe(CSR_TDATA3);
 		xmit->tstate = cpu_to_lle(trig->state);
 		xmit->tdata1 = cpu_to_lle(trig->tdata1);
 		xmit->tdata2 = cpu_to_lle(trig->tdata2);
@@ -589,6 +610,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	unsigned long ctrl;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
+	bool tdata2_impl, tdata3_impl;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -601,6 +623,15 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	sbi_hart_protection_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 
+	/*
+	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
+	 * programs a non-zero value into an unimplemented optional CSR. Only
+	 * the "whole CSR unimplemented" case is caught; WARL bits tied off
+	 * inside an otherwise-implemented CSR are not.
+	 */
+	tdata2_impl = tdata_implemented(CSR_TDATA2);
+	tdata3_impl = tdata_implemented(CSR_TDATA3);
+
 	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
@@ -619,6 +650,14 @@ int sbi_dbtr_install_trig(unsigned long smode,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
+
+		if ((recv->tdata2 && !tdata2_impl) ||
+		    (recv->tdata3 && !tdata3_impl)) {
+			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
+			return SBI_ERR_NOT_SUPPORTED;
+		}
 	}
 
 	if (hs->available_trigs < trig_count) {
@@ -705,6 +744,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	union sbi_dbtr_shmem_entry *entry;
 	void *shmem_base = NULL;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
+	bool tdata2_impl, tdata3_impl;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -718,6 +758,15 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	if (trig_count >= hs->total_trigs)
 		return SBI_ERR_BAD_RANGE;
 
+	/*
+	 * SBI v3.0 sec 19.5 requires SBI_ERR_NOT_SUPPORTED when a trigger
+	 * programs a non-zero value into an unimplemented optional CSR. Only
+	 * the "whole CSR unimplemented" case is caught; WARL bits tied off
+	 * inside an otherwise-implemented CSR are not.
+	 */
+	tdata2_impl = tdata_implemented(CSR_TDATA2);
+	tdata3_impl = tdata_implemented(CSR_TDATA3);
+
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
 		trig_idx = entry->id.idx;
@@ -734,6 +783,12 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			return SBI_ERR_FAILED;
 		}
 
+		if ((entry->data.tdata2 && !tdata2_impl) ||
+		    (entry->data.tdata3 && !tdata3_impl)) {
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
