Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC14CCDB46F
	for <opensbi@archiver.kernel.org>; Tue, 23 Jun 2026 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CCh9b034irvaC/pHqY6HSDLZl1S0wSIhVZKi0Ku/fJU=; b=WFTp9MApUbbjnl
	Sa3xcOiCvhZrTgXhSiBbf5P4Bj9xG8PpICDISG2wPJKFzNcORYVCIrkKoNfTsYwyx1EmK3z8lXW9d
	QGq9c1HbzNA7vWhAoblireNqBqKDMuHKmI6ZncC8i0IMRqY/Cr3GpyfaFugD/Rj3F8qwDd8Zptpwi
	L2VFCiMYYT7aMQtVfNnnjywikaB8BzK4o5TzCGV37/pQ/XPFc0NpReVomK4HnayQK/IE+wZfP3ylT
	AkCTo3AmDWv7j9BLA5ZpaIQexz7fXdO/PMUeHyQNetjaPQ4phiyj43nPpn1PvnV8FRJgVY+rUmOWA
	pGSmnSX+ZqPlTnC0f8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxxp-000000063Mq-3yFx;
	Tue, 23 Jun 2026 10:02:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxxm-000000063MM-1fPZ
	for opensbi@lists.infradead.org;
	Tue, 23 Jun 2026 10:02:40 +0000
Received: from 3930813e24e9.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAHpc2vWTpqvJTbAg--.18320S2;
	Tue, 23 Jun 2026 18:02:31 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi_dbtr: fix shared memory double-fetch in install_trig
Date: Tue, 23 Jun 2026 18:02:25 +0800
Message-Id: <20260623100225.1127250-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHpc2vWTpqvJTbAg--.18320S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw4rtrWDJFyrCF1DArW8WFg_yoW7GFWrpF
	9akF9rGrs7XryjyrW7Aa18u343uw48A3W5trZakr92yas8Zw1Fqw13t3sYqa4fKFyDZ3W2
	y3Wj9F1jkan0vF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbhSdDUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_030238_802629_0054E3BC 
X-CRM114-Status: GOOD (  16.72  )
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

Fix this by taking a snapshot of the shared memory into a local buffer
and performing both validation and installation against that snapshot.
Also add a bounds check on trig_count against RV_MAX_TRIGGERS to prevent
out-of-bounds access on the local buffer.

Additionally, fix a redundant read in dbtr_trigger_setup() where tdata1
was read from the message pointer a second time instead of using the
value already saved in trig->tdata1, which could lead to inconsistency
between the CSR write and the trigger state setup.

Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_dbtr.c | 52 +++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..8bad2d95 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -327,7 +327,7 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
 	trig->tdata2 = lle_to_cpu(recv->tdata2);
 	trig->tdata3 = lle_to_cpu(recv->tdata3);
 
-	tdata1 = lle_to_cpu(recv->tdata1);
+	tdata1 = trig->tdata1;
 
 	trig->state = 0;
 
@@ -603,14 +603,15 @@ int sbi_dbtr_read_trig(unsigned long smode,
 int sbi_dbtr_install_trig(unsigned long smode,
 			  unsigned long trig_count, unsigned long *out)
 {
+	struct sbi_dbtr_data_msg local_data[RV_MAX_TRIGGERS];
 	void *shmem_base = NULL;
 	union sbi_dbtr_shmem_entry *entry;
-	struct sbi_dbtr_data_msg *recv;
 	struct sbi_dbtr_id_msg *xmit;
 	unsigned long ctrl;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	bool tdata2_impl, tdata3_impl;
+	int i;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -619,9 +620,22 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
 
+	if (trig_count > RV_MAX_TRIGGERS)
+		return SBI_ERR_INVALID_PARAM;
+
 	shmem_base = hart_shmem_base(hs);
+
+	/*
+	 * Snapshot trigger data from shared memory into a local buffer so
+	 * that S-mode cannot modify the data between validation and use.
+	 */
 	sbi_hart_protection_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
+	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		local_data[_idx] = entry->data;
+	}
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					trig_count * sizeof(*entry));
 
 	/*
 	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
@@ -632,42 +646,35 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	tdata2_impl = tdata_implemented(CSR_TDATA2);
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
-	/* Check requested triggers configuration */
-	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
-		ctrl = recv->tdata1;
+	/* Validate triggers from the local snapshot */
+	for (i = 0; i < (int)trig_count; i++) {
+		ctrl = local_data[i].tdata1;
 
 		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
-			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
+			*out = i;
 			return SBI_ERR_FAILED;
 		}
 
 		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
-			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
+			*out = i;
 			return SBI_ERR_FAILED;
 		}
 
-		if ((recv->tdata2 && !tdata2_impl) ||
-		    (recv->tdata3 && !tdata3_impl)) {
-			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
+		if ((local_data[i].tdata2 && !tdata2_impl) ||
+		    (local_data[i].tdata3 && !tdata3_impl)) {
+			*out = i;
 			return SBI_ERR_NOT_SUPPORTED;
 		}
 	}
 
 	if (hs->available_trigs < trig_count) {
 		*out = hs->available_trigs;
-		sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-					       trig_count * sizeof(*entry));
 		return SBI_ERR_FAILED;
 	}
 
-	/* Install triggers */
+	/* Install triggers from the validated local snapshot */
+	sbi_hart_protection_map_range((unsigned long)shmem_base,
+				      trig_count * sizeof(*entry));
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		/*
 		 * Since we have already checked if enough triggers are
@@ -675,15 +682,12 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		 */
 		trig = sbi_alloc_trigger();
 
-		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
 
-		dbtr_trigger_setup(trig,  recv);
+		dbtr_trigger_setup(trig, &local_data[_idx]);
 		dbtr_trigger_enable(trig);
 		xmit->idx = cpu_to_lle(trig->index);
-
 	}
-
 	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
