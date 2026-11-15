Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB66606A332
	for <opensbi@archiver.kernel.org>; Sun, 15 Nov 2026 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FeebX94H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=noDAnRGZEapfwyPKK5XWlWyRA5hRnQBKOgdF4IJlqM4=; b=FeebX94HrDfyRs2wm6zJN/hGKz
	G1ni0dj14hvGYUugcVLx+y2NN7hgw4DhebyS7G3A+yz9KwZ4VlndIOOO077c+AkIRt04XWqRycp5h
	BUum3QHVt6camoeYTLaiamvn6L2knxT/frK+gDdfNAG/JdU0pvVYHptk2/PdXFnJkgbEEX3KYtbJ6
	bwlICBt9mA7mnDA8as8py7g/QOrpgtRRc+y2U8uDWDN0UoxThjT3hFsm19vQaR0VNJrtb9NjC2lvR
	6PStjIlpdJE4htGEuP/L/G6b1xC7S0xsBGRaJBeyKqgz0LffYd0cyjeKlZtHt/Ir8Px7wQwYIGfdg
	gXQJTmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdEr-00000000Cll-2MO8;
	Sun, 15 Nov 2026 16:37:57 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdEm-00000000Cju-27Ar
	for opensbi@lists.infradead.org;
	Sun, 15 Nov 2026 16:37:55 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3IPva3_lqkhoOAQ--.1207S2;
	Mon, 16 Nov 2026 00:37:46 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	anup@brainfault.org,
	npiggin@gmail.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2] lib: sbi: dbtr: validate trigger configuration in update_trig
Date: Sun, 15 Nov 2026 16:37:32 +0000
Message-Id: <20261115163732.746589-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAD3IPva3_lqkhoOAQ--.1207S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFyUGw48WFyxAFW3CFykZrb_yoWrZr13pF
	yrCFy7KrZ2qryUtrWIv3W8Aryruw48t34Ut3929rykta9rZw1xAr1ay3s5XFy8Kr95uF1j
	ya4jqF4j9Fs8ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjnmRUUUUU
	U==
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_083752_936847_9B76A69F 
X-CRM114-Status: GOOD (  12.70  )
X-Spam-Score: -4.2 (----)
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

sbi_dbtr_update_trig() writes the caller's tdata1 to the trigger CSRs
without validating it, so S-mode can install a trigger that install_trig
accepts and then set the mcontrol6 M bit on it with an update, making it
fire in M-mode. No race is involved. dbtr_trigger_hw_supported() does
not cover this: it returns true when the platform has no
trigger_supported callback.

The entry is also re-read from the shared memory, so the value validated
need not be the one programmed.

Copy the entry once, drop the mapping, and run the checks against the
copy. Also reject a tdata1 whose type is not set in trig->type_mask,
the capability the hardware slot was allocated for.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
Changes in v2:
- Reject a tdata1 whose type is not set in trig->type_mask.
- Link to v1:
  https://lore.kernel.org/opensbi/20261103081001.2948003-1-liutong@iscas.ac.cn/

SBI v3.0 also requires tdata1.chain to be preserved across an update.
That needs a record of the tdata1 the trigger was installed with, and
trig->tdata1 is not one: sbi_dbtr_read_trig() refreshes it from the CSR,
which the hardware may have normalised. Left out of this patch.
 lib/sbi/sbi_dbtr.c | 46 ++++++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index c97e625f..9b5d2561 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -856,7 +856,8 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 int sbi_dbtr_update_trig(unsigned long smode,
 			 unsigned long trig_count)
 {
-	unsigned long trig_idx;
+	unsigned long trig_idx, tdata1;
+	union sbi_dbtr_shmem_entry local;
 	struct sbi_dbtr_trigger *trig;
 	union sbi_dbtr_shmem_entry *entry;
 	void *shmem_base = NULL;
@@ -885,37 +886,42 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		/*
+		 * Take a copy and drop the mapping. S-mode can rewrite the
+		 * shared memory at any time, so every check below and the
+		 * value finally programmed must come from the same copy.
+		 */
 		sbi_hart_protection_temp_map_range((unsigned long)entry, sizeof(*entry));
-		trig_idx = entry->id.idx;
+		local = *entry;
+		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 
-		if (trig_idx >= hs->total_trigs) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		trig_idx = local.id.idx;
+		if (trig_idx >= hs->total_trigs)
 			return SBI_ERR_INVALID_PARAM;
-		}
 
 		trig = INDEX_TO_TRIGGER(trig_idx);
 
-		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
 			return SBI_ERR_FAILED;
-		}
 
-		if ((entry->data.tdata2 && !tdata2_impl) ||
-		    (entry->data.tdata3 && !tdata3_impl)) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		tdata1 = lle_to_cpu(local.data.tdata1);
+
+		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1))
+			return SBI_ERR_INVALID_PARAM;
+
+		if (!__test_bit(TDATA1_GET_TYPE(tdata1), &trig->type_mask))
+			return SBI_ERR_INVALID_PARAM;
+
+		if ((local.data.tdata2 && !tdata2_impl) ||
+		    (local.data.tdata3 && !tdata3_impl))
 			return SBI_ERR_NOT_SUPPORTED;
-		}
 
-		if (!dbtr_trigger_hw_supported(trig->index,
-					       lle_to_cpu(entry->data.tdata1),
-					       lle_to_cpu(entry->data.tdata2),
-					       lle_to_cpu(entry->data.tdata3))) {
-			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		if (!dbtr_trigger_hw_supported(trig->index, tdata1,
+					       lle_to_cpu(local.data.tdata2),
+					       lle_to_cpu(local.data.tdata3)))
 			return SBI_ERR_NOT_SUPPORTED;
-		}
 
-		dbtr_trigger_setup(trig, &entry->data);
-		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		dbtr_trigger_setup(trig, &local.data);
 		dbtr_trigger_enable(trig);
 	}
 

base-commit: ed70256dd22c09962d146e433834239825ef0616
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
