Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F13606A321
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZVfIfgqY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tARDdaJy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EwIUYR9pGT0/RWhtAsgRIHSETU8YNqVYN7Tq/jjTdxU=; b=ZVfIfgqYGq6pm82WA8LHOpV0Pg
	TAufn8/xwNC4qF4z/T6zQo4IKx62YXHqPdIqSg9u/k6w68uCR7D4GmlTFQl/vy33wCwu2PHEO+JRJ
	CuYYWYYxpcHIYOM1gM95Uk70PjG/f0zu5Xjl6MPu8YESL5lgiiYGRe4RbAQCFOkgKai0gZuoZ5euL
	cJDUfqrNRST8yjOUEIGsz1NQ3kkZZkqrasUYmKVZSZR8eC0GAQnhzJcDJWbJwzV93dKpmHi7ggbi4
	WitLIY+D+qRGorSe3b1iZ7EumQbDNMdY4Nb32Cuq+TKCiUujw96LraPBzpO0nBTa1jwVih5+JhAUU
	+h51GRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJmr-00000008UAy-46pp;
	Thu, 29 Oct 2026 06:38:57 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJmm-00000008U9u-2KJa
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 06:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793255918;
	bh=G5agB5nZfyo1n6eJZesfQRhOzOgxtNwsU0UpvNJ9CxE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=tARDdaJyAmIF+JDabC0SWYclPOoAvhdXbthjLNzROWmpWLyapXtklXcV9fH/51mBK
	 tB8I6LUiP1R+TvBQFUw3ZOMpPSaZV4v8/8zoU3DrflTWW/jZfUVmxAB9b4jqDoB9HD
	 G+atk9eLrcU8SJNnoVgppHu0lvT+p9ZdZmLFfOeA=
X-QQ-mid: esmtpgz10t1793255914t0a75a9ca
X-QQ-Originating-IP: RK+CdlDnG5pbvz6zStsLZ+ePrXYuZuLgVYxAkRNfyoM=
Received: from LT-WUHUAMAO.dc.com ( [101.70.125.129])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 14:38:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 680868665268212795
From: Huamao Wu <huamao.wu@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 1/2] lib: sbi_domain: Make HART to domain updates atomic
Date: Thu, 29 Oct 2026 14:38:28 +0800
Message-ID: <4F78EC9A525F6DA4+20261029063829.783449-2-huamao.wu@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029063829.783449-1-huamao.wu@linux.spacemit.com>
References: <20261029063829.783449-1-huamao.wu@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NM/A8GId7NUBu+coCDreR+FAWpD9QS5b0QxX9yrqyi73Re21+q9u9gJt
	ey994LUs2wWuzUaMpuAQTpzLnDNmceobODcVhxKogd5LkASqVRSS0qo49Hs0mnTm7fdHV/U
	lIHbNbxK52ZYenDH2pfRwamQCJNMq7PRlm2c6Iy3oXsnOQviRroxB3MyJYUMSJulViU84tV
	7qNEjv9Fl4N+1rr9QG8HXHH/iXqW7kzN0u04lI6eckm7f9xDrYXMwNRy/0xPbxD/NzgxcXb
	VwxBbRy04P/B+2veIbx1kBSBVWS99xBRWo8ueCGE9BB0j7v173lV1e3/w0SehtjcMf1oz0+
	XJjlr6enQ6fHilCfele+3X+571oJcUnESfDuTqEJD1dh2jvv1bJswHBL6T+2AzAtNfwua7f
	Z8kVKI7YYXeug6E5UIwm21TSNdaNQmQ8fEPVfs+kQtf2GZ5NhYg4O0f0hb/RGFcl/OEWh++
	uEX08oxCVe24ZfsiCAFzIykZGnu3KqKZ92JAyAnxhGO/ZQImEjAFKmSe8coTi9bzao7vDv3
	QZQFI2/56Fso0EmlWRyZ+G7iVwhTU/0PmzTvb6/l0QLbU4Aes6biHLxILdDd//BdPoXWS7L
	0uq1AvuePlB+gWPXjGKN37+g4gAJI3PHXhhzGptV6sYCONr7IzMG7SM/URJ2CNRF2iKco64
	B2UAjpMP+DoOSJWXcLPDRhNIy4dJsMf1IZ0Rcw4ApBeOh4Sz29MUp04W3B4Ti6Uv1U10JBr
	HPZBl2OOEK/OTXXRQtZ7Vh2BoPS6KmZP71C35lXycLkkJMzry+zFtQV5qQv07bEkxFGva5f
	0Wh1Yj+4fOhCn3JeUZ0dO4kfl1OSZhLFiH2M5sQRElNgRFp1O0Di7QopQX41QFZjf9i6l11
	ZpgzTiFOHafhUtKYQ1puun4JhfYD5osz9fDxQ6p0aCDMvTvVKO1jsg5rKTcd4BEzmmAr8sM
	U35G3s/UB1loFC9zclWe+jRHgjJc0ZQx9Sz2MDAD+KSnWIbweCcobPqIqf3/4wNOeIrc=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_233853_461809_509EC799 
X-CRM114-Status: GOOD (  20.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A HART's domain assignment is represented in two places: the domain
pointer in the per-HART scratch, and the bit in that domain's
assigned_harts bitmap. They are written by different code depending on
the caller, so a HART can be observed in a state where the two
disagree.

Today the two writes happen outside any common lock:

  - switch_to_next_domain_context() clears the bit in the old domain,
    calls sbi_update_hartindex_to_domain() to rewrite the pointer, and
    sets the bit in the new domain, with a separate lock/unlock around
    each bitmap update.
  - sbi_domain_register() additionally clears the old domain's bit by
    hand and sets the new domain's bit after the call.

Move all of it into sbi_update_hartindex_to_domain() and serialize the
update with a new domain_hart_assign_lock. The function reads the
current domain, clears its bit, writes the pointer, and sets the bit in
the new domain, all under that lock. Readers that take the same lock
therefore see the pointer and the bitmap agree.

sbi_hartindex_to_domain() takes the lock for the load. Both functions
and the new lock are annotated for thread safety analysis, so a caller
that already holds the lock fails to compile rather than deadlocking.

The bitmap itself stays protected by the per-domain assigned_harts_lock,
which is nested inside the global lock and never taken in the opposite
order.

Callers no longer touch the bitmap:
  - switch_to_next_domain_context() becomes a single call.
  - sbi_domain_register() drops the manual clear of the old domain's bit
    and the now redundant set of the new domain's bit.

The global lock is exported so that the HSM HART start path can hold it
across its ownership check in a subsequent change.

Suggested-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Huamao Wu <huamao.wu@linux.spacemit.com>
---
 include/sbi/sbi_domain.h     | 16 ++++++++++++++--
 lib/sbi/sbi_domain.c         | 37 +++++++++++++++++++++++++++---------
 lib/sbi/sbi_domain_context.c |  8 --------
 3 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 56a21397..dcb613d0 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -225,11 +225,23 @@ struct sbi_domain {
 /** The root domain instance */
 extern struct sbi_domain root;
 
+/**
+ * Global lock serializing updates to HART to domain assignments
+ *
+ * A HART to domain assignment is represented by the per-HART scratch
+ * pointer and the per-domain assigned_harts bitmap. Both are updated
+ * under this lock so that readers never observe the two disagreeing.
+ */
+extern spinlock_t domain_hart_assign_lock;
+
 /** Get pointer to sbi_domain from HART index */
-struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex);
+struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
+	MUST_NOT_HOLD(&domain_hart_assign_lock);
 
 /** Update HART local pointer to point to specified domain */
-void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom);
+void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
+	MUST_NOT_HOLD(&domain_hart_assign_lock)
+	MUST_NOT_HOLD(&dom->assigned_harts_lock);
 
 /** Get pointer to sbi_domain for current HART */
 #define sbi_domain_thishart_ptr() \
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 42fe5632..88f4af55 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -34,6 +34,7 @@ struct sbi_domain root = {
 };
 
 static unsigned long domain_hart_ptr_offset;
+DEFINE_SPIN_LOCK(domain_hart_assign_lock);
 
 struct sbi_domain_notify_entry {
 	struct sbi_dlist		node;
@@ -104,25 +105,46 @@ static int sbi_domain_notify_all(struct sbi_domain *dom, enum sbi_domain_notify_
 }
 
 struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
+	MUST_NOT_HOLD(&domain_hart_assign_lock)
 {
 	struct sbi_scratch *scratch;
+	struct sbi_domain *dom;
 
 	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch || !domain_hart_ptr_offset)
 		return NULL;
 
-	return sbi_scratch_read_type(scratch, void *, domain_hart_ptr_offset);
+	spin_lock(&domain_hart_assign_lock);
+	dom = sbi_scratch_read_type(scratch, void *, domain_hart_ptr_offset);
+	spin_unlock(&domain_hart_assign_lock);
+	return dom;
 }
 
 void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
+	MUST_NOT_HOLD(&domain_hart_assign_lock)
+	MUST_NOT_HOLD(&dom->assigned_harts_lock)
 {
+	struct sbi_domain *current_dom;
 	struct sbi_scratch *scratch;
 
 	scratch = sbi_hartindex_to_scratch(hartindex);
-	if (!scratch)
+	if (!scratch || !domain_hart_ptr_offset)
 		return;
 
+	spin_lock(&domain_hart_assign_lock);
+	current_dom = sbi_scratch_read_type(scratch, void *, domain_hart_ptr_offset);
+	if (current_dom) {
+		spin_lock(&current_dom->assigned_harts_lock);
+		sbi_hartmask_clear_hartindex(hartindex, &current_dom->assigned_harts);
+		spin_unlock(&current_dom->assigned_harts_lock);
+	}
 	sbi_scratch_write_type(scratch, void *, domain_hart_ptr_offset, dom);
+	if (dom) {
+		spin_lock(&dom->assigned_harts_lock);
+		sbi_hartmask_set_hartindex(hartindex, &dom->assigned_harts);
+		spin_unlock(&dom->assigned_harts_lock);
+	}
+	spin_unlock(&domain_hart_assign_lock);
 }
 
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartindex)
@@ -748,7 +770,9 @@ int sbi_domain_register(struct sbi_domain *dom)
 	SPIN_LOCK_INIT(dom->assigned_harts_lock);
 
 	/* Clear assigned HARTs of domain */
+	spin_lock(&dom->assigned_harts_lock);
 	sbi_hartmask_clear_all(&dom->assigned_harts);
+	spin_unlock(&dom->assigned_harts_lock);
 
 	/*
 	 * Assign HART to a domain with the least initialization order
@@ -756,15 +780,10 @@ int sbi_domain_register(struct sbi_domain *dom)
 	 */
 	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
 		tdom = sbi_hartindex_to_domain(i);
-		if (tdom) {
-			if (tdom->init_order > dom->init_order)
-				sbi_hartmask_clear_hartindex(i, &tdom->assigned_harts);
-			else
-				continue;
-		}
+		if (tdom && tdom->init_order <= dom->init_order)
+			continue;
 
 		sbi_update_hartindex_to_domain(i, dom);
-		sbi_hartmask_set_hartindex(i, &dom->assigned_harts);
 
 		/*
 		 * If cold boot HART is assigned to this domain then
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 987ac7fa..ee43cd43 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -121,16 +121,8 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	current_dom = ctx->dom;
 	target_dom = dom_ctx->dom;
 	/* Assign current hart to target domain */
-	spin_lock(&current_dom->assigned_harts_lock);
-	sbi_hartmask_clear_hartindex(hartindex, &current_dom->assigned_harts);
-	spin_unlock(&current_dom->assigned_harts_lock);
-
 	sbi_update_hartindex_to_domain(hartindex, target_dom);
 
-	spin_lock(&target_dom->assigned_harts_lock);
-	sbi_hartmask_set_hartindex(hartindex, &target_dom->assigned_harts);
-	spin_unlock(&target_dom->assigned_harts_lock);
-
 	/* Save current CSR context and restore target domain's CSR context */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
 	ctx->sie	= csr_swap(CSR_SIE, dom_ctx->sie);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
