Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A6DC88E40
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r15Hot1HEIOMdNViqwBZfVU5DHkV3loTK5ZhmI6LiJE=; b=yBEeTVEEz76zYo
	1dbghkRIymwPLQkPkQ64xwDgc2PGC9Avr5p+Cen4WHi1BAwhMcW+RKLR1uJU5h+3UE9XH74oQx7Fy
	APlflNJg9FxHzAkOddwAcr2OKdjOo/oEXS5Qc6+feq9jbQwpusMCnrBkOh5/Tp9tlF+q4+4Qip4fF
	4b6K41NV1f34GULknohKy2lZQAV20UqBoX/NTWzMcw65dl6qhncFiZXIRM3Xcd6Gdv8pxgXaFmasu
	kTDRRIzOg89Z1K7K/3fBy+MAS8f2+V0D4gtMHh/4AJxoX4NsxDu8SFI5C9R+emkGsGDBkm3xOlMDf
	Pz8jIUiR9LfnC4nU5hog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XMU-0000000DRiy-0ohm;
	Thu, 10 Sep 2026 05:30:14 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XMP-0000000DRhP-4A3G
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:30:12 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHUT9fQKJq9rRPBw--.30051S4;
	Thu, 10 Sep 2026 13:30:07 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	david.garcia@aheadcomputing.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 2/3] lib: sbi: dbtr: fix shared memory double-fetch in update_trig
Date: Thu, 10 Sep 2026 05:29:57 +0000
Message-Id: <20260910052958.3365324-3-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910052958.3365324-1-liutong@iscas.ac.cn>
References: <20260910052958.3365324-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHUT9fQKJq9rRPBw--.30051S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKF1xurWxCw1rCry5Cry7GFg_yoW7AF1DpF
	95GFy7Krs7JryUJw18Za18urySvr4kJa45t39akr92ya9rZw18XrWfK34vvFyIkr95Zry7
	A3WUtF48GFs8ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFXdbUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_223010_407120_EE1ED327 
X-CRM114-Status: GOOD (  16.61  )
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

sbi_dbtr_update_trig() reads each entry from the S-mode shared memory
several times: for the trigger index, to check tdata2 and tdata3
against the implemented CSRs, for the hardware support check, and again
when the trigger is programmed. S-mode may write the shared memory
between any two of those reads, so the configuration written to the
debug CSRs is not necessarily the one that was checked.

Entries were also applied one at a time as they were validated, so a
rejected entry left the entries before it already programmed, and the
error was reported against a partially updated trigger set.

Copy the index and tdata1/tdata2/tdata3 of every entry, validate the
whole batch against that copy, and program the triggers only once all
of it has been accepted. Each entry is unmapped as soon as it has been
copied, so neither the checks nor the CSR writes can see a later value.

trig_count is already rejected when it reaches hs->total_trigs, which
cannot exceed RV_MAX_TRIGGERS, so the same check bounds the arrays.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
New in v3.

sbi_dbtr_update_trig() has the same double-fetch as install_trig, and
additionally applied entries one at a time as they were validated, so a
rejected entry left the entries before it already programmed. Both are
addressed here.

 lib/sbi/sbi_dbtr.c | 63 +++++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index e9135ba5..beb6d2bf 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -890,11 +890,12 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 int sbi_dbtr_update_trig(unsigned long smode,
 			 unsigned long trig_count)
 {
-	unsigned long trig_idx;
-	struct sbi_dbtr_trigger *trig;
+	struct sbi_dbtr_trigger *trigs[RV_MAX_TRIGGERS];
+	struct dbtr_trig_config cfg[RV_MAX_TRIGGERS];
+	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	union sbi_dbtr_shmem_entry *entry;
+	unsigned long trig_idx, i;
 	void *shmem_base = NULL;
-	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	bool tdata2_impl, tdata3_impl;
 
 	hs = dbtr_thishart_state_ptr();
@@ -906,6 +907,10 @@ int sbi_dbtr_update_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base(hs);
 
+	/*
+	 * This also bounds cfg[] and trigs[], because total_trigs can never
+	 * exceed RV_MAX_TRIGGERS.
+	 */
 	if (trig_count >= hs->total_trigs)
 		return SBI_ERR_BAD_RANGE;
 
@@ -918,41 +923,47 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	tdata2_impl = tdata_implemented(CSR_TDATA2);
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
+	/*
+	 * Snapshot and validate the whole batch before programming any of
+	 * it. Every check then acts on the same copy that is written to the
+	 * CSRs below, rather than on shared memory that S-mode can still
+	 * change, and a rejected entry cannot leave the entries before it
+	 * already applied.
+	 */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_protection_temp_map_range((unsigned long)entry, sizeof(*entry));
+		sbi_hart_protection_temp_map_range((unsigned long)entry,
+						   sizeof(*entry));
 		trig_idx = entry->id.idx;
+		cfg[_idx].tdata1 = lle_to_cpu(entry->data.tdata1);
+		cfg[_idx].tdata2 = lle_to_cpu(entry->data.tdata2);
+		cfg[_idx].tdata3 = lle_to_cpu(entry->data.tdata3);
+		sbi_hart_protection_temp_unmap_range((unsigned long)entry,
+						     sizeof(*entry));
 
-		if (trig_idx >= hs->total_trigs) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		if (trig_idx >= hs->total_trigs)
 			return SBI_ERR_INVALID_PARAM;
-		}
 
-		trig = INDEX_TO_TRIGGER(trig_idx);
+		trigs[_idx] = INDEX_TO_TRIGGER(trig_idx);
 
-		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		if (!(trigs[_idx]->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
 			return SBI_ERR_FAILED;
-		}
 
-		if ((entry->data.tdata2 && !tdata2_impl) ||
-		    (entry->data.tdata3 && !tdata3_impl)) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		if ((cfg[_idx].tdata2 && !tdata2_impl) ||
+		    (cfg[_idx].tdata3 && !tdata3_impl))
 			return SBI_ERR_NOT_SUPPORTED;
-		}
 
-		if (!dbtr_trigger_hw_supported(trig->index,
-					       lle_to_cpu(entry->data.tdata1),
-					       lle_to_cpu(entry->data.tdata2),
-					       lle_to_cpu(entry->data.tdata3))) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		if (!dbtr_trigger_hw_supported(trigs[_idx]->index,
+					       cfg[_idx].tdata1,
+					       cfg[_idx].tdata2,
+					       cfg[_idx].tdata3))
 			return SBI_ERR_NOT_SUPPORTED;
-		}
+	}
 
-		dbtr_trigger_setup(trig, lle_to_cpu(entry->data.tdata1),
-				   lle_to_cpu(entry->data.tdata2),
-				   lle_to_cpu(entry->data.tdata3));
-		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
-		dbtr_trigger_enable(trig);
+	/* Program the batch only once all of it has been accepted */
+	for (i = 0; i < trig_count; i++) {
+		dbtr_trigger_setup(trigs[i], cfg[i].tdata1, cfg[i].tdata2,
+				   cfg[i].tdata3);
+		dbtr_trigger_enable(trigs[i]);
 	}
 
 	return SBI_SUCCESS;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
