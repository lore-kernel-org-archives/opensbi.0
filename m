Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35262C79FB9
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qTWYMflfD9pHhiMGdrYAPENGgV+218TH9ElAKqua4M=; b=kxrZUYhJyLEHiI
	fbShg+fHKV/YnDAhoux2aWy7eDmUgGINoiOjuRdvHEQqx7c1YEH9HeVTfxzCxZFZ19l7J0pBMccog
	b27yRuA3NhKeo4pMoQiuHeY/LqqlTRb4kT6a9K3QBjv+vrvMJe0lgkCb5kKKu9m58cKTPEdswzXvz
	Eu6Fk8mxfclbcAD9ae+/AiS1iCEMf8opabTsFbVMfZLd/MR3vB+EIrKNwGuBo/QF8UTq4sBMeuUae
	gHVh5OtLRrKSB/IlLQJNDf4tes7dYsWPaWiVH3zqmwDbR2Q0zQuru5k3MyL0oXCZ268fK7KNLwpBa
	OkHdwwWMar2z/JIsfQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XMa-0000000DRm7-1l9W;
	Thu, 10 Sep 2026 05:30:20 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XMX-0000000DRjf-1gLB
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:30:19 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHUT9fQKJq9rRPBw--.30051S3;
	Thu, 10 Sep 2026 13:30:07 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	david.garcia@aheadcomputing.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 1/3] lib: sbi: dbtr: fix shared memory double-fetch in install_trig
Date: Thu, 10 Sep 2026 05:29:56 +0000
Message-Id: <20260910052958.3365324-2-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910052958.3365324-1-liutong@iscas.ac.cn>
References: <20260910052958.3365324-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHUT9fQKJq9rRPBw--.30051S3
X-Coremail-Antispam: 1UD129KBjvJXoW3ur1DGFWfGr4rJr48tr18Zrb_yoWDtw1DpF
	ZagF9rKrs7XryjyrZrZa1kury3uw48A3W5t39akryjya98Zr1vvr1Sv34Fqa4FkFykZFyU
	tF4Y9Fyqka1qvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUzE_MUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_223018_017405_57D8540F 
X-CRM114-Status: GOOD (  28.60  )
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

sbi_dbtr_install_trig() reads each trigger configuration from the
S-mode shared memory in three passes: the configuration check, the
dry-run slot allocation, and the install loop. Each pass re-reads
entry->data, which S-mode may write in between, so the configuration
that gets programmed is not necessarily the one that was checked.
dbtr_trigger_valid() does reject the M-mode enable bit, but it can be
checking a different value than the one installed.

Copy tdata1/tdata2/tdata3 for the whole request into a local array once
and run all three passes against that copy. The shared memory is then
only read while taking the copy, and only written to report the
allocated trigger indices. dbtr_trigger_setup() takes the decoded
values directly, which also covers what dbtr_find_free_slot() and
sbi_alloc_trigger() are given.

cfg[] is a fixed size array, so trig_count is bounded before anything
is copied into it. total_trigs cannot exceed RV_MAX_TRIGGERS, so
rejecting trig_count against total_trigs bounds cfg[] too. Rollback
records the installed slots in a u32 bitmap rather than an array, so it
needs no bound of its own.

The loads that fill one entry are not atomic, so a second hart writing
the same page can still tear an entry. That does not reintroduce the
problem here, since all passes then agree on one copy.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
Previously sent as [PATCH v2 2/6].

Changes in v3:
- Rebased onto current master. The v2 version predated the per-slot
  capability matching and the dry-run slot allocation, so it no longer
  matched the function it was fixing.
- The copy is threaded through dbtr_trigger_any_hw_supported(),
  dbtr_find_free_slot() and sbi_alloc_trigger(). dbtr_trigger_setup()
  now takes the decoded values instead of re-reading the message.
- Preserved master's SBI_ERR_INVALID_PARAM vs SBI_ERR_FAILED
  distinction for the invalid configuration case.
- Rollback state is a u32 slot bitmap rather than an array of installed
  triggers, so the out-of-bounds write that was a concern with
  installed[num_installed++] no longer exists.
- The bound is now "trig_count >= hs->total_trigs" returning
  SBI_ERR_BAD_RANGE, the same shape as the check in Pengpeng Hou's
  "lib: sbi: dbtr: validate complete shared memory range" and in the
  DBTR error code rework, rather than a separate RV_MAX_TRIGGERS test
  that would have collided with both.
- Noted in the commit message that the loads are not atomic, and what
  that does and does not mean for this fix.

 lib/sbi/sbi_dbtr.c | 169 ++++++++++++++++++++++++++++-----------------
 1 file changed, 104 insertions(+), 65 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 7e4ddd98..e9135ba5 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -392,18 +392,15 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 }
 
 static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
-			       struct sbi_dbtr_data_msg *recv)
+			       unsigned long tdata1, unsigned long tdata2,
+			       unsigned long tdata3)
 {
-	unsigned long tdata1;
-
 	if (!trig)
 		return;
 
-	trig->tdata1 = lle_to_cpu(recv->tdata1);
-	trig->tdata2 = lle_to_cpu(recv->tdata2);
-	trig->tdata3 = lle_to_cpu(recv->tdata3);
-
-	tdata1 = lle_to_cpu(recv->tdata1);
+	trig->tdata1 = tdata1;
+	trig->tdata2 = tdata2;
+	trig->tdata3 = tdata3;
 
 	trig->state = 0;
 
@@ -677,19 +674,30 @@ int sbi_dbtr_read_trig(unsigned long smode,
 	return SBI_SUCCESS;
 }
 
+/*
+ * Trigger configuration decoded from the shared memory. S-mode can write
+ * the shared memory at any time, so a request is snapshotted once and all
+ * later passes work on the snapshot instead of the shared memory.
+ */
+struct dbtr_trig_config {
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
 int sbi_dbtr_install_trig(unsigned long smode,
 			  unsigned long trig_count, unsigned long *out)
 {
-	void *shmem_base = NULL;
+	struct dbtr_trig_config cfg[RV_MAX_TRIGGERS];
+	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	union sbi_dbtr_shmem_entry *entry;
-	struct sbi_dbtr_data_msg *recv;
-	struct sbi_dbtr_id_msg *xmit;
-	unsigned long ctrl;
-	u32 claimed = 0;
-	int slot;
 	struct sbi_dbtr_trigger *trig;
-	struct sbi_dbtr_hart_triggers_state *hs = NULL;
+	struct sbi_dbtr_id_msg *xmit;
 	bool tdata2_impl, tdata3_impl;
+	void *shmem_base = NULL;
+	u32 claimed = 0, installed = 0;
+	unsigned long i;
+	int slot, ret;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -698,10 +706,29 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
 
+	/*
+	 * This also bounds cfg[], because total_trigs can never exceed
+	 * RV_MAX_TRIGGERS.
+	 */
+	if (trig_count >= hs->total_trigs)
+		return SBI_ERR_BAD_RANGE;
+
 	shmem_base = hart_shmem_base(hs);
 	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
 					   trig_count * sizeof(*entry));
 
+	/*
+	 * Snapshot the whole request before looking at it. These loads are
+	 * not atomic, so a second hart writing the same page can still tear
+	 * an entry across two messages it wrote, but it can no longer make
+	 * M-mode install a configuration that was never validated.
+	 */
+	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		cfg[_idx].tdata1 = lle_to_cpu(entry->data.tdata1);
+		cfg[_idx].tdata2 = lle_to_cpu(entry->data.tdata2);
+		cfg[_idx].tdata3 = lle_to_cpu(entry->data.tdata3);
+	}
+
 	/*
 	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
 	 * programs a non-zero value into an unimplemented optional CSR. Only
@@ -714,48 +741,41 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
 	/* Check requested triggers configuration */
-	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
-		ctrl = recv->tdata1;
+	for (i = 0; i < trig_count; i++) {
+		unsigned long type = TDATA1_GET_TYPE(cfg[i].tdata1);
 
-		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
-			*out = _idx;
-			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-							     trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
+		if (!dbtr_trigger_supported(type)) {
+			*out = i;
+			ret = SBI_ERR_FAILED;
+			goto out;
 		}
 
-		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
-			*out = _idx;
-			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-							     trig_count * sizeof(*entry));
-			return SBI_ERR_INVALID_PARAM;
+		if (!dbtr_trigger_valid(type, cfg[i].tdata1)) {
+			*out = i;
+			ret = SBI_ERR_INVALID_PARAM;
+			goto out;
 		}
 
-		if ((recv->tdata2 && !tdata2_impl) ||
-		    (recv->tdata3 && !tdata3_impl)) {
-			*out = _idx;
-			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-							     trig_count * sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
+		if ((cfg[i].tdata2 && !tdata2_impl) ||
+		    (cfg[i].tdata3 && !tdata3_impl)) {
+			*out = i;
+			ret = SBI_ERR_NOT_SUPPORTED;
+			goto out;
 		}
 
-		if (!dbtr_trigger_any_hw_supported(hs,
-						   lle_to_cpu(recv->tdata1),
-						   lle_to_cpu(recv->tdata2),
-						   lle_to_cpu(recv->tdata3))) {
-			*out = _idx;
-			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-							     trig_count * sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
+		if (!dbtr_trigger_any_hw_supported(hs, cfg[i].tdata1,
+						   cfg[i].tdata2,
+						   cfg[i].tdata3)) {
+			*out = i;
+			ret = SBI_ERR_NOT_SUPPORTED;
+			goto out;
 		}
 	}
 
 	if (hs->available_trigs < trig_count) {
 		*out = hs->available_trigs;
-		sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-						     trig_count * sizeof(*entry));
-		return SBI_ERR_FAILED;
+		ret = SBI_ERR_FAILED;
+		goto out;
 	}
 
 	/*
@@ -763,45 +783,62 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	 * is installed if any of the requested configurations cannot be
 	 * matched to a free hardware trigger slot.
 	 */
-	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
-		slot = dbtr_find_free_slot(hs, claimed,
-					   lle_to_cpu(recv->tdata1),
-					   lle_to_cpu(recv->tdata2),
-					   lle_to_cpu(recv->tdata3));
+	for (i = 0; i < trig_count; i++) {
+		slot = dbtr_find_free_slot(hs, claimed, cfg[i].tdata1,
+					   cfg[i].tdata2, cfg[i].tdata3);
 		if (slot < 0) {
-			*out = _idx;
-			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
-							     trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
+			*out = i;
+			ret = SBI_ERR_FAILED;
+			goto out;
 		}
 		claimed |= BIT(slot);
 	}
 
 	/* Install triggers */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
 
 		/*
 		 * The dry-run above matched every requested configuration
-		 * to a free hardware trigger slot, so allocation must
-		 * succeed.
+		 * to a free hardware trigger slot, so this cannot fail.
+		 * Unwind instead of relying on that invariant, so that a
+		 * later change to the matching logic cannot leave a
+		 * half-installed batch behind or reach the NULL
+		 * dereference in the index write-back below.
 		 */
-		trig = sbi_alloc_trigger(lle_to_cpu(recv->tdata1),
-					 lle_to_cpu(recv->tdata2),
-					 lle_to_cpu(recv->tdata3));
+		trig = sbi_alloc_trigger(cfg[_idx].tdata1, cfg[_idx].tdata2,
+					 cfg[_idx].tdata3);
+		if (!trig) {
+			*out = _idx;
+			ret = SBI_ERR_FAILED;
+			goto rollback;
+		}
 
-		dbtr_trigger_setup(trig,  recv);
+		dbtr_trigger_setup(trig, cfg[_idx].tdata1, cfg[_idx].tdata2,
+				   cfg[_idx].tdata3);
 		dbtr_trigger_enable(trig);
 		xmit->idx = cpu_to_lle(trig->index);
-
+		installed |= BIT(trig->index);
 	}
 
+	ret = SBI_SUCCESS;
+	goto out;
+
+rollback:
+	/* Undo the batch in reverse order of installation */
+	for (i = RV_MAX_TRIGGERS; i-- > 0;) {
+		if (!(installed & BIT(i)))
+			continue;
+
+		trig = INDEX_TO_TRIGGER(i);
+		dbtr_trigger_clear(trig);
+		sbi_free_trigger(trig);
+	}
+out:
 	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 					     trig_count * sizeof(*entry));
 
-	return SBI_SUCCESS;
+	return ret;
 }
 
 int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
@@ -911,7 +948,9 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			return SBI_ERR_NOT_SUPPORTED;
 		}
 
-		dbtr_trigger_setup(trig, &entry->data);
+		dbtr_trigger_setup(trig, lle_to_cpu(entry->data.tdata1),
+				   lle_to_cpu(entry->data.tdata2),
+				   lle_to_cpu(entry->data.tdata3));
 		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 		dbtr_trigger_enable(trig);
 	}
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
