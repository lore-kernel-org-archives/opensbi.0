Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A60CD98C5
	for <opensbi@archiver.kernel.org>; Sat, 13 Jun 2026 13:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFiJAy2JX+wdboGUEVU6J2a3IPNb0GNeLbI3BL3J3pU=; b=xohUOpZLbwbsmP
	1MtJ9s9MwxWYRiFbu/U+AmAd072LULnVMJryjvYein+aQRgKzqBhZZXgujMLz1WU763Kot++BoXyH
	fAD4xIn+dugw5snrNXQHe2iMG6guteORgIQBsMbfs1JW7ecVVwqYmRTxnNUmQ1nJDXVh/akl5FGtE
	covTYbPe7y5cIfcFS3QfZORXQItvueu7/87pqmKCTzb6Ox0NLlkp65noU8suGgJEhI56bFNX/4qO5
	W/fqu8rFRUKOktW6lG0yl7c4K0i+7+H6JWEUZAY+HkjdrKEQN1BYQ9LDqLvQlJNy3eaZD71uoYK24
	ygXBNpFz9jeiukNq/XVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOJ4-0000000CJtj-1MsB;
	Sat, 13 Jun 2026 13:21:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOJ1-0000000CJt4-3XnZ
	for opensbi@lists.infradead.org;
	Sat, 13 Jun 2026 13:21:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DAwmp02609990;
	Sat, 13 Jun 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oHlGf15gPBz
	kCmSlj254Npkw4DyZEn4aHhxPKpYI8ik=; b=CJb9WO58LG6FEr5LyBw1+8Y1yh6
	x7L7waFUdHNC+uMopRGUDVOCUn9jMqGHm1SKqRQuKYpBVwCVvvYPS6eQSg+iMQP0
	AdKkCaQcReTSE8w7wcySfEeuf/lBVCnVidtN2odWD+TpEjDlfxN0m9Qez98LogoL
	s8rLMrNrdaKzlN7uODq1XNYBWHHmvvJaHGv1jbQtVgfTJghJ8+mTWZgvCktmDyZ2
	H+UWyzBo4bwBsbqTbz55tKj745NVohrDcedbVM9JpAFu7wqIbaOMBgTsFz9ijOAA
	xeQwJiay4qJoHJb4QPfaPVDxz723FcAuf9A7441jHRRh+IsBjttT6bg3ezg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9514bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65DDLVLr013501;
	Sat, 13 Jun 2026 13:21:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09hd8xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:31 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65DDLUgD013484;
	Sat, 13 Jun 2026 13:21:31 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65DDLUEk013481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:30 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 26EFE216A5; Sat, 13 Jun 2026 18:51:30 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Vivian Wang <wangruikang@iscas.ac.cn>,
        Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
        Bo Gan <ganboing@gmail.com>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 1/2] lib: sbi: Move trap delegation setup to sbi_trap.c
Date: Sat, 13 Jun 2026 18:51:28 +0530
Message-ID: <20260613132129.2135128-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613132129.2135128-1-anup.patel@oss.qualcomm.com>
References: <20260613132129.2135128-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Pg3n4zlNIgx3_vBOwk3IeVFi8td0egdj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDEzNiBTYWx0ZWRfX0xKYBuDYF0HV
 eJZn5hiJslxDxBDI0tnmDBhJ8mJigPrIHfdPTUQxBFDI6+6VezgLU184UA3JpRqqVZtJhJH46AC
 MsNh0u4zlSw/NdWVQuXVouzgEnDP2wA=
X-Proofpoint-GUID: Pg3n4zlNIgx3_vBOwk3IeVFi8td0egdj
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2d595e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=gDAi18hT6ToFhAxdC0EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDEzNiBTYWx0ZWRfXyKamE2M8P1iB
 etRvG7Ce9IPoDk9LuhN+wdFG9F45M+CengTaGxdc0fUPpuSLuHgXrJ4fsYwNkqE+qi5/prNpIIG
 bz4w/XwszmAOaaAWQIWIMB4uNuKLd2XeV93uoer5QtOrNoZMA0QOP5k4jOE615ssOKgfhMp+PAH
 GdDuFpa3CSEPyIijtX4RbvnUVFgSnpa8BKlgfrV/xXi2FUXVTCDjDbAuDIRqYq9DlLPPjoswULS
 q7F76yXX4BRjj9rRKbflNPLgSRRVoC9qTvjz83dgbYHCMMHetz+RB4NQ6lO9eEasjPUFxPFBHHe
 0gs6aDN7tmCnvcQPSjIvo4isoHZqi11w5cWjkQEkeNulIDDWlupmGElVTIVaLqEhbdlpSdqg6Mg
 8xV/XUC3RBctGvQaQ456buQw/qrbqxGBj7XqsvmzxFqZBGiwTpPXoKEKHWPNxHht4Wwkc5Yu1ZQ
 s+PlZ/s41ni7ojY5ajA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_062147_997667_D05934CD 
X-CRM114-Status: GOOD (  13.49  )
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

Currently, the trap delegation setup is part of sbi_hart.c and
called via sbi_hart_init() whereas the per-hart trap (aka exception
and interrupt) handling is part of sbi_trap.c.

Move trap delegation init to sbi_trap.c and call it via new
sbi_trap_init() from both cold boot and warm boot path. This
way trap delegation setup is in same place as trap handling.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_trap.h |  2 ++
 lib/sbi/sbi_hart.c     | 46 -----------------------------------------
 lib/sbi/sbi_init.c     |  8 +++++++
 lib/sbi/sbi_trap.c     | 47 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 46 deletions(-)

diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 091a2446..8d2a6346 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -291,6 +291,8 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx);
 
 struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx);
 
+int sbi_trap_init(struct sbi_scratch *scratch, bool cold_boot);
+
 #endif
 
 #endif
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 21713816..bee88557 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -211,48 +211,6 @@ static int fp_init(struct sbi_scratch *scratch)
 	return 0;
 }
 
-static int delegate_traps(struct sbi_scratch *scratch)
-{
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
-	unsigned long interrupts, exceptions;
-
-	if (!misa_extension('S'))
-		/* No delegation possible as mideleg does not exist */
-		return 0;
-
-	/* Send M-mode interrupts and most exceptions to S-mode */
-	interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
-	interrupts |= sbi_pmu_irq_mask();
-
-	exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
-		     (1U << CAUSE_USER_ECALL);
-	if (sbi_platform_has_mfaults_delegation(plat))
-		exceptions |= (1U << CAUSE_FETCH_PAGE_FAULT) |
-			      (1U << CAUSE_LOAD_PAGE_FAULT) |
-			      (1U << CAUSE_STORE_PAGE_FAULT) |
-			      (1U << CAUSE_SW_CHECK_EXCP);
-
-	/*
-	 * If hypervisor extension available then we only handle hypervisor
-	 * calls (i.e. ecalls from HS-mode) in M-mode.
-	 *
-	 * The HS-mode will additionally handle supervisor calls (i.e. ecalls
-	 * from VS-mode), Guest page faults and Virtual interrupts.
-	 */
-	if (misa_extension('H')) {
-		exceptions |= (1U << CAUSE_VIRTUAL_SUPERVISOR_ECALL);
-		exceptions |= (1U << CAUSE_FETCH_GUEST_PAGE_FAULT);
-		exceptions |= (1U << CAUSE_LOAD_GUEST_PAGE_FAULT);
-		exceptions |= (1U << CAUSE_VIRTUAL_INST_FAULT);
-		exceptions |= (1U << CAUSE_STORE_GUEST_PAGE_FAULT);
-	}
-
-	csr_write(CSR_MIDELEG, interrupts);
-	csr_write(CSR_MEDELEG, exceptions);
-
-	return 0;
-}
-
 void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
 			      const char *prefix, const char *suffix)
 {
@@ -773,10 +731,6 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 			return rc;
 	}
 
-	rc = delegate_traps(scratch);
-	if (rc)
-		return rc;
-
 	return sbi_hart_reinit(scratch);
 }
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 658fe37f..9bb1a37e 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -309,6 +309,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 			__stack_chk_guard = guard_val;
 	}
 
+	rc = sbi_trap_init(scratch, true);
+	if (rc)
+		sbi_hart_hang();
+
 	rc = sbi_timer_init(scratch, true);
 	if (rc)
 		sbi_hart_hang();
@@ -466,6 +470,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_trap_init(scratch, false);
+	if (rc)
+		sbi_hart_hang();
+
 	rc = sbi_timer_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 1e55b885..16774fd2 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -414,3 +414,50 @@ struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx)
 	/* Never returns */
 	return tcntx;
 }
+
+static int delegate_traps(struct sbi_scratch *scratch)
+{
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	unsigned long interrupts, exceptions;
+
+	if (!misa_extension('S'))
+		/* No delegation possible as mideleg does not exist */
+		return 0;
+
+	/* Send M-mode interrupts and most exceptions to S-mode */
+	interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
+	interrupts |= sbi_pmu_irq_mask();
+
+	exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
+		     (1U << CAUSE_USER_ECALL);
+	if (sbi_platform_has_mfaults_delegation(plat))
+		exceptions |= (1U << CAUSE_FETCH_PAGE_FAULT) |
+			      (1U << CAUSE_LOAD_PAGE_FAULT) |
+			      (1U << CAUSE_STORE_PAGE_FAULT) |
+			      (1U << CAUSE_SW_CHECK_EXCP);
+
+	/*
+	 * If hypervisor extension available then we only handle hypervisor
+	 * calls (i.e. ecalls from HS-mode) in M-mode.
+	 *
+	 * The HS-mode will additionally handle supervisor calls (i.e. ecalls
+	 * from VS-mode), Guest page faults and Virtual interrupts.
+	 */
+	if (misa_extension('H')) {
+		exceptions |= (1U << CAUSE_VIRTUAL_SUPERVISOR_ECALL);
+		exceptions |= (1U << CAUSE_FETCH_GUEST_PAGE_FAULT);
+		exceptions |= (1U << CAUSE_LOAD_GUEST_PAGE_FAULT);
+		exceptions |= (1U << CAUSE_VIRTUAL_INST_FAULT);
+		exceptions |= (1U << CAUSE_STORE_GUEST_PAGE_FAULT);
+	}
+
+	csr_write(CSR_MIDELEG, interrupts);
+	csr_write(CSR_MEDELEG, exceptions);
+
+	return 0;
+}
+
+int sbi_trap_init(struct sbi_scratch *scratch, bool cold_boot)
+{
+	return delegate_traps(scratch);
+}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
