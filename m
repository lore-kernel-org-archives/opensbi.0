Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F126C55164
	for <opensbi@archiver.kernel.org>; Thu, 30 Jul 2026 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1lrSirTQD98PnHKd5dXrpCHjTb58eFOaI3yoarF2vk=; b=L1y8zhWhhNw6b6
	X+iqeF+1WfZzcsUsthIMYEUME1qFNsuZGfWmEMTGsdskghcIXonp81mvIeerQ8Z6/9WO5YW/PJR8a
	tBF98ceGPegbvEoxxKfGfAMm3+7E2YlGIsmHNenA3FMj9u00WKxYkG/6UkqRU8oL0rK672aNm3M4Y
	Q6dUBqip7155tgCMGVf/iOcFSPhF5/dNMCYfVfi6L1pToSzD+yLTmJuwA4tPv/+XR/4Ukc2cqo4ml
	Q4ItVK5r3SeMAt6a5mx5+WX2pnQXvSCu5x8+80rmqkG3qwLpTzDUsyzQQWkdWa/azxF4J+mV7q//w
	p45OLmiTysXJnkgZgATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTGe-0000000AwZG-2KMz;
	Thu, 30 Jul 2026 16:05:56 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTGb-0000000AwXH-1UmT
	for opensbi@lists.infradead.org;
	Thu, 30 Jul 2026 16:05:55 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACX_zledmtqIblWAg--.29808S2;
	Fri, 31 Jul 2026 00:05:50 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3] lib: sbi_dbtr: fix shared memory double-fetch in install_trig
Date: Thu, 30 Jul 2026 16:05:40 +0000
Message-Id: <20260730160540.1326394-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260628092949.218380-1-liutong@iscas.ac.cn>
References: <20260628092949.218380-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowACX_zledmtqIblWAg--.29808S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFW8AF4rJrW3JFW8Zw15CFg_yoW7tF13pF
	Z3WF9rGrZ7XryqyrWxAa18Cry3uw48J3WrtrZakr92yas8Zr10q34aqasYvFyfKFyDZ3Wj
	y3WjgF1UCan0yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYwIDUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090553_761518_F0A586DC 
X-CRM114-Status: GOOD (  15.30  )
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

This allows S-mode to bypass validation by modifying shared memory
contents between the two passes, potentially installing malicious
trigger configurations in M-mode.

Fix this by merging validation and installation into a single pass.
Each entry is copied to a local variable before use, so S-mode cannot
modify the data between validation and installation. On validation
failure, all previously installed triggers are rolled back.

Also add a bounds check on trig_count against RV_MAX_TRIGGERS, and fix
a redundant read in dbtr_trigger_setup() where tdata1 was read from
the message pointer a second time instead of using the value already
saved in trig->tdata1.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Changes in v3:
- Added Fixes tag
Changes in v2:
- Single-pass with per-entry snapshot instead of full-array copy

 lib/sbi/sbi_dbtr.c | 81 +++++++++++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..b5ba4b72 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -327,7 +327,7 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
 	trig->tdata2 = lle_to_cpu(recv->tdata2);
 	trig->tdata3 = lle_to_cpu(recv->tdata3);
 
-	tdata1 = lle_to_cpu(recv->tdata1);
+	tdata1 = trig->tdata1;
 
 	trig->state = 0;
 
@@ -603,12 +603,14 @@ int sbi_dbtr_read_trig(unsigned long smode,
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
 	bool tdata2_impl, tdata3_impl;
 
@@ -619,9 +621,13 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
 
-	shmem_base = hart_shmem_base(hs);
-	sbi_hart_protection_map_range((unsigned long)shmem_base,
-				      trig_count * sizeof(*entry));
+	if (trig_count > RV_MAX_TRIGGERS)
+		return SBI_ERR_INVALID_PARAM;
+
+	if (hs->available_trigs < trig_count) {
+		*out = hs->available_trigs;
+		return SBI_ERR_FAILED;
+	}
 
 	/*
 	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
@@ -632,62 +638,55 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	tdata2_impl = tdata_implemented(CSR_TDATA2);
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
-	/* Check requested triggers configuration */
-	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
-		ctrl = recv->tdata1;
+	shmem_base = hart_shmem_base(hs);
+	sbi_hart_protection_map_range((unsigned long)shmem_base,
+				      trig_count * sizeof(*entry));
 
-		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
-			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
-		}
+	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		/*
+		 * Snapshot one entry from shared memory so that S-mode
+		 * cannot modify it between validation and installation.
+		 */
+		local = entry->data;
+		ctrl = lle_to_cpu(local.tdata1);
 
-		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
+		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl)) ||
+		    !dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
+			goto rollback;
 		}
 
-		if ((recv->tdata2 && !tdata2_impl) ||
-		    (recv->tdata3 && !tdata3_impl)) {
+		if ((local.tdata2 && !tdata2_impl) ||
+		    (local.tdata3 && !tdata3_impl)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
+			sbi_hart_protection_unmap_range(
+				(unsigned long)shmem_base,
+				trig_count * sizeof(*entry));
 			return SBI_ERR_NOT_SUPPORTED;
 		}
-	}
-
-	if (hs->available_trigs < trig_count) {
-		*out = hs->available_trigs;
-		sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-					       trig_count * sizeof(*entry));
-		return SBI_ERR_FAILED;
-	}
 
-	/* Install triggers */
-	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		/*
-		 * Since we have already checked if enough triggers are
-		 * available, trigger allocation must succeed.
-		 */
 		trig = sbi_alloc_trigger();
-
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
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
