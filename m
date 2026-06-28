Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DADBC43327
	for <opensbi@archiver.kernel.org>; Sun, 28 Jun 2026 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MV4unkBZSDFMhZJ0Gc0UVKPrd7Wk4fTTnXRC/9ho84=; b=YXRwC/qXBBWHQI
	FvELxBddViavjsJVzt9Q5NOvoKO+3U+YtIh3gsun0kfvcG+3vD47TLnyIC/ZlmpGCpqkydGupLllv
	O8Ag3Q7mEfWmRVcCErVetRIjfGWTZC/X8uKlYjuNrdEgMfrHH88zVoujeXMV/rwzyCzVJLvCYwVv9
	K3y3iiFeUL4Ius+Sji6k8lURDbmVKA71j/N1mF3ge+x7ZRW+W8tO5ZZLdjdDhyyMuuFRJDE43O17D
	/oMyb7/mICYBRbCtKT3HPi4mNA07RnXYjvyChCrTKRyL5/1m6bLlThMaWxef8hCXs9y+RCsZ6PQCG
	m5c9Zrc2a4ii5A7KDdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdlpw-0000000D1G7-0XIp;
	Sun, 28 Jun 2026 09:30:00 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdlps-0000000D1Fi-2tRP
	for opensbi@lists.infradead.org;
	Sun, 28 Jun 2026 09:29:58 +0000
Received: from 3930813e24e9.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADHq+KL6UBqB8EoFg--.22211S2;
	Sun, 28 Jun 2026 17:29:53 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2] lib: sbi_dbtr: fix shared memory double-fetch in install_trig
Date: Sun, 28 Jun 2026 17:29:49 +0800
Message-Id: <20260628092949.218380-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623100225.1127250-1-liutong@iscas.ac.cn>
References: <20260623100225.1127250-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADHq+KL6UBqB8EoFg--.22211S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr4rKF17AFy8tFyxGFy5XFb_yoW7GrykpF
	Z3uasrGFZ7JryjyrWxAa18Cry3uw48J3W5trZIkr9ayas8Zr10q34avF9Yqa4fKFykZ3WU
	t3WjgFyjkan0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYKZXUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_022957_418869_E0AEA87D 
X-CRM114-Status: GOOD (  15.51  )
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

sbi_dbtr_install_trig() reads trigger configuration from S-mode shared
memory in two separate loops: first to validate, then to install. Since
the shared memory remains writable by S-mode between the two reads, the
data used for installation may differ from what was validated.

Fix this by merging validation and installation into a single pass.
Each entry is copied to a local variable before use, so S-mode cannot
modify the data between validation and installation. On validation
failure, all previously installed triggers are rolled back.

Also add a bounds check on trig_count against RV_MAX_TRIGGERS.

Additionally, fix a redundant read in dbtr_trigger_setup() where tdata1
was read from the message pointer a second time instead of using the
value already saved in trig->tdata1.

Signed-off-by: liutong <liutong@iscas.ac.cn>
---
Changes in v2:
 - Replace full-array stack snapshot (local_data[RV_MAX_TRIGGERS], 1KB)
   with per-entry local copy (single struct, 32B) to reduce M-mode
   stack usage
 - Merge validation and installation into a single pass with rollback
   on failure, instead of two separate passes over the snapshot

 lib/sbi/sbi_dbtr.c | 66 ++++++++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 8bcb4312..efd9a7e7 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -308,7 +308,7 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
 	trig->tdata2 = lle_to_cpu(recv->tdata2);
 	trig->tdata3 = lle_to_cpu(recv->tdata3);
 
-	tdata1 = lle_to_cpu(recv->tdata1);
+	tdata1 = trig->tdata1;
 
 	trig->state = 0;
 
@@ -582,12 +582,14 @@ int sbi_dbtr_read_trig(unsigned long smode,
 int sbi_dbtr_install_trig(unsigned long smode,
 			  unsigned long trig_count, unsigned long *out)
 {
+	struct sbi_dbtr_data_msg local;
 	void *shmem_base = NULL;
 	union sbi_dbtr_shmem_entry *entry;
-	struct sbi_dbtr_data_msg *recv;
 	struct sbi_dbtr_id_msg *xmit;
 	unsigned long ctrl;
 	struct sbi_dbtr_trigger *trig;
+	struct sbi_dbtr_trigger *installed[RV_MAX_TRIGGERS];
+	int num_installed = 0;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 
 	hs = dbtr_thishart_state_ptr();
@@ -597,58 +599,54 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
 
-	shmem_base = hart_shmem_base(hs);
-	sbi_hart_protection_map_range((unsigned long)shmem_base,
-				      trig_count * sizeof(*entry));
-
-	/* Check requested triggers configuration */
-	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
-		ctrl = recv->tdata1;
-
-		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
-			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
-		}
-
-		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
-			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
-		}
-	}
+	if (trig_count > RV_MAX_TRIGGERS)
+		return SBI_ERR_INVALID_PARAM;
 
 	if (hs->available_trigs < trig_count) {
 		*out = hs->available_trigs;
-		sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-					       trig_count * sizeof(*entry));
 		return SBI_ERR_FAILED;
 	}
 
-	/* Install triggers */
+	shmem_base = hart_shmem_base(hs);
+	sbi_hart_protection_map_range((unsigned long)shmem_base,
+				      trig_count * sizeof(*entry));
+
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		/*
-		 * Since we have already checked if enough triggers are
-		 * available, trigger allocation must succeed.
+		 * Snapshot one entry from shared memory so that S-mode
+		 * cannot modify it between validation and installation.
 		 */
-		trig = sbi_alloc_trigger();
+		local = entry->data;
+		ctrl = lle_to_cpu(local.tdata1);
 
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
+		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl)) ||
+		    !dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
+			*out = _idx;
+			goto rollback;
+		}
+
+		trig = sbi_alloc_trigger();
 		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
 
-		dbtr_trigger_setup(trig,  recv);
+		dbtr_trigger_setup(trig, &local);
 		dbtr_trigger_enable(trig);
 		xmit->idx = cpu_to_lle(trig->index);
-
+		installed[num_installed++] = trig;
 	}
 
 	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
+
+rollback:
+	while (num_installed--) {
+		dbtr_trigger_clear(installed[num_installed]);
+		sbi_free_trigger(installed[num_installed]);
+	}
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					trig_count * sizeof(*entry));
+	return SBI_ERR_FAILED;
 }
 
 int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
