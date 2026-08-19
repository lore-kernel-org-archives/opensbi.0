Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA39C5DF85
	for <opensbi@archiver.kernel.org>; Wed, 19 Aug 2026 07:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnIEg94oKxniykWq6V9tBcJndiFsQaaBHsMik8HLCm4=; b=yeNyjLJn9U1xRK
	2SSrmT4bQ2nL1acFYpXaEQM+okSr3y3mlkgu/kSUaVV/M6xE6qd3Jj5BIoXYM97QTcNSUXwqa5cjx
	l7M4MD9JROAFF8KATXldBecPsPvTR1z4ixEM5x8mVvFM1qD8SRtTqYlgoAlLpdHeScj3XpZDCPO/D
	agtli3btK1kos0QF95iwC3wfubKaslza4QkuuXh6+h5MZ8n0KMnJcUQwLqgI3cIcd90hzgERTl9IP
	+40p8A6N1qrxJfDUmL2O4xpwrujfR+ZeWvoOznef2KEfu67u1+iyFz3ZWYNESO9zyuMJPD/jEYTX8
	Nt0/9ohrfVeB2Qvlbkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb5c-00000009Esu-4Aih;
	Wed, 19 Aug 2026 07:52:00 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb5Y-00000009Eqz-24MH
	for opensbi@lists.infradead.org;
	Wed, 19 Aug 2026 07:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787125905;
	bh=4XLQbQb3Sv0OOFwGDfr0jrb+bqaGRlWN/VNqUsz3+N8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oXQwUV/tEPY+b4qNIE1LqgMAa8w8pSnGKQCdaZKJqOcc/Csi/eQRteMa2CUjtVkX7
	 OizpY/9RDWuGTng2O/xbaWZ1SuGOwVMahqb+/MZY5DMVK7QSOmwUMMtcUFoSZR1eiD
	 ViUb+qCLl5ZdPX4vkLPlRMeUJtDDQUxojsSwzYAk=
X-QQ-mid: esmtpsz11t1787125904tab2e98db
X-QQ-Originating-IP: 7IaqaMUFcopz8SfyCZo0FpNDDTkOdbRb2IAhLqzLosI=
Received: from LT-WUHUAMAO.dc.com ( [101.71.222.5])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Aug 2026 15:51:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3344312266833389704
EX-QQ-RecipientCnt: 2
From: Huamao Wu <huamao.wu@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Huamao Wu <huamao.wu@linux.spacemit.com>
Subject: [PATCH 2/2] lib: sbi: serialize HSM hart_start ownership check with assignment lock
Date: Wed, 19 Aug 2026 15:51:38 +0800
Message-ID: <E62F6A70B52E7CF9+20260819075138.31535-3-huamao.wu@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819075138.31535-1-huamao.wu@linux.spacemit.com>
References: <20260819075138.31535-1-huamao.wu@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MCk7GSmjSGXyRNXbrJ/AvSsxg9HQ2iBQYYTP4l9W7DGLWYIwLnhDnOmz
	d2CAWo4BRbe1ezvaDU/ol0jKzCbSjLboPEuP5I3g5yQMZ/V5UBjmvx1SvMCT8WMUrMAyZ+c
	VL1/rFLjJDiCcHv3QATjvvK2GMxQMfRsQgmtbbmC5VrawrsTsK/kILd7X6J12nFJ5vSIeZ7
	85S+7A3Z/zXJ/LiU13YYk6BkJRZajQ36Y7+wvGzakcNecApu3BxprvSAkQvSCv/JvxY1uSt
	BmkbZ16ljsoLQSUcM3FZrAxkcDoBDAkKq7VHJM0VNvLfufBdIxY2GXe4EznCEz/2H1ErPZL
	kqegb3q0IQ5iRHofbODf48BUjU2wAlzminBBjS968Tk5ckGqJpypVLU2irEjEPNkEN2Cgkj
	mb89S+J4W0CpYTb/NWj1B3areybCQUt8zyE9reP3tUS0F7EBf4odUrW8fEQK1ZRCSJ2BKXj
	SCOPETlXkhQhWWKpIeonPNc4ooKmV0KCG1O58A6H8NFy1KQh0xQaQXp07MDjgyzJcE56djq
	z2LUSi/oP+eiCrxydJL1DL7bVRbl2wUVwVVGN+q9r9JmQllTWeosMGGM8w+v9YJSS5ymGUh
	+oB1D0KBbDWBAejZIZidRvBaGP21QXXKZjat1TeO3haNtSFNERdNwfIPA5kLP2qLhx01Qdi
	Avupjd4/A4NhImd315wJrQgduK5oC44YVNEpUgHK8CHAveEGcQ1UZq5QtkPv7E5XemMA//D
	erWrPlvXQxgyhmfWRawpxsLBrZAg3wbdJYd9Hweko8T6o535Pwl7hjM7sY0rC7zDZ5eULG0
	vfxYrAmf7bnfBYB+5uO6LqNGuSGKZH9lmShciEJ01TwGntMl7t/kV+zK8uuWfV+xpgzw+kX
	/PUxuSz61PIMlly00TnsUxjEeYxe+4DRK6njo8Ecgm0MfRhcxSZYJVp6qok+6+yh3kd6VFI
	N/zvIVc1U8SQXT0WWsGWzc8iVWMjtC84Y22tABO6AlEbEawbKUYToBOXtt4kdU/Tmo0ykS3
	4Yo/gy/DL2XGfr1LHrF5IBk1yGUqgwm/LCbLbnGrTOStXWVadL1QjlmgwYgkM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_005156_978879_284F065B 
X-CRM114-Status: GOOD (  14.70  )
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

sbi_hsm_hart_start() checks domain ownership, acquires the start
ticket, and transitions the hart to START_PENDING in three unlocked
steps.  A concurrent domain assignment can reassign the hart
between the check and the state transition, causing HART_START to
proceed for a domain that no longer owns the target hart.

Hold domain_assignment_lock across the ownership check, ticket
acquisition, and STOPPED -> START_PENDING cmpxchg so that no
assignment can occur between check and commit.  Release the lock
before hardware start or IPI dispatch.

Convert switch_to_next_domain_context() to use
sbi_domain_assign_hart() instead of its open-coded three-step
sequence, eliminating the same TOCTOU window on the context switch
path.

Signed-off-by: Huamao Wu <huamao.wu@linux.spacemit.com>
---
 lib/sbi/sbi_domain_context.c | 13 ++-----------
 lib/sbi/sbi_hsm.c            | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 0861d541..f71dd94f 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -110,24 +110,15 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 {
 	u32 hartindex = current_hartindex();
 	struct sbi_trap_context *trap_ctx;
-	struct sbi_domain *current_dom, *target_dom;
+	struct sbi_domain *target_dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (!ctx || !dom_ctx || ctx == dom_ctx)
 		return SBI_EINVAL;
 
-	current_dom = ctx->dom;
 	target_dom = dom_ctx->dom;
 	/* Assign current hart to target domain */
-	spin_lock(&current_dom->assigned_harts_lock);
-	sbi_hartmask_clear_hartindex(hartindex, &current_dom->assigned_harts);
-	spin_unlock(&current_dom->assigned_harts_lock);
-
-	sbi_update_hartindex_to_domain(hartindex, target_dom);
-
-	spin_lock(&target_dom->assigned_harts_lock);
-	sbi_hartmask_set_hartindex(hartindex, &target_dom->assigned_harts);
-	spin_unlock(&target_dom->assigned_harts_lock);
+	sbi_domain_assign_hart(hartindex, target_dom);
 
 	/* Save current CSR context and restore target domain's CSR context */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0a355f9c..5293f995 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -318,8 +318,6 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	/* For now, we only allow start mode to be S-mode or U-mode. */
 	if (smode != PRV_S && smode != PRV_U)
 		return SBI_EINVAL;
-	if (dom && !sbi_domain_is_assigned_hart(dom, hartindex))
-		return SBI_EINVAL;
 	if (dom && !sbi_domain_check_addr(dom, saddr, smode,
 					  SBI_DOMAIN_EXECUTE))
 		return SBI_EINVALID_ADDR;
@@ -329,8 +327,18 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		return SBI_EINVAL;
 
 	hdata = sbi_scratch_offset_ptr(rscratch, hart_data_offset);
-	if (!hsm_start_ticket_acquire(hdata))
+
+	/* Serialize ownership validation with acceptance of this HART_START. */
+	sbi_domain_assignment_lock();
+	if (dom && !sbi_domain_check_hart_assignment_locked(dom, hartindex,
+							    NULL)) {
+		sbi_domain_assignment_unlock();
 		return SBI_EINVAL;
+	}
+	if (!hsm_start_ticket_acquire(hdata)) {
+		sbi_domain_assignment_unlock();
+		return SBI_EINVAL;
+	}
 
 	init_count = sbi_init_count(hartindex);
 	entry_count = sbi_entry_count(hartindex);
@@ -346,6 +354,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	 */
 	hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
 				SBI_HSM_STATE_START_PENDING);
+	sbi_domain_assignment_unlock();
 	if (hstate == SBI_HSM_STATE_STARTED) {
 		rc = SBI_EALREADY;
 		goto err;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
