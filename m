Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC74606A31E
	for <opensbi@archiver.kernel.org>; Wed, 25 Nov 2026 03:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LoHUE70J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7GU/dNxmx9t8cbbm9o1ulGRavFcqJHhtg/PPUManuyQ=; b=LoHUE70Joa5mvEaFMq7eTFwJv2
	+IxZX94qc1TVCh1dZEAoW19xgf5JhkSeOyU68m/fagvb5/ReJNMWlqPi5JaCk5t4Pbf3NGEBla0mW
	ksPz//HQ3+bAcWlbKl4J4e+6jhZlruNKYlx766O537S3+/yEeqCy2UHK4CW6WTQE8/W/RM2S6Sbdu
	P4R0dRA8UV5gTPTCBv8S+dET7I6BuJj4jkzAiPUXgTO/CkUbUTBSyExLEeM/lYsFYwJq8n8Wo9Tf3
	p1QvTX6JDk7+LAVLyyPF3J8xMD3mnmishSqtHZiSTtB+wWXYJkkwk+cHao3OyI2RTZ/E+YGG1DbL7
	RmAnQEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3OP-00000008HbQ-1iAy;
	Wed, 25 Nov 2026 03:09:57 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3OM-00000008Hb1-0QoB
	for opensbi@lists.infradead.org;
	Wed, 25 Nov 2026 03:09:55 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA30rd6UQZr5pLiAQ--.17037S2;
	Wed, 25 Nov 2026 11:09:46 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: hchauhan@ventanamicro.com,
	apatel@ventanamicro.com,
	npiggin@gmail.com,
	xypron.glpk@gmx.de,
	liutong@iscas.ac.cn
Subject: [PATCH] lib: sbi: dbtr: validate trigger configuration before writing CSR
Date: Wed, 25 Nov 2026 03:09:30 +0000
Message-Id: <20261125030930.3743680-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA30rd6UQZr5pLiAQ--.17037S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF45Wr43CrWDJr1kWFWfXwb_yoWrWr1UpF
	WruFy5KrZ7tryjyrWxAay0gry5Zw48Jw45GrZF9ryvvas8Zr18Xr1aq34jqa4FgrykXF45
	AF48tFWDCFsxXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU6Hq
	cUUUUU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_190954_533983_C959E6AA 
X-CRM114-Status: GOOD (  11.53  )
X-Spam-Score: -1.9 (-)
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

Move the validation of tdata1 to dbtr_trigger_enable(), where it is
written to CSR_TDATA1. This prevents S-mode from modifying the trigger
configuration between the validation pass and the install/enable pass,
allowing an invalid configuration (with DMODE or M bit set) to reach
the CSR.

The install pass reads the shared memory twice: once in the dry-run to
allocate slots, and again during install to program them. S-mode can
rewrite the entry in between. Validating at the CSR write point closes
this window and covers all three callers: install_trig, enable_trig,
and update_trig.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_dbtr.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 9b5d25617194..fa75ee356632 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -460,17 +460,25 @@ static inline void update_bit(unsigned long new, int nr, volatile unsigned long
 		__clear_bit(nr, addr);
 }
 
-static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
+static int dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
 {
 	unsigned long state;
 	unsigned long tdata1;
 
 	if (!trig || !(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
-		return;
+		return SBI_ERR_FAILED;
 
 	state = trig->state;
 	tdata1 = trig->tdata1;
 
+	/*
+	 * Validate tdata1 before programming CSR. S-mode can modify the shared
+	 * memory between validation pass and install pass, allowing an invalid
+	 * configuration (with DMODE or M bit set) to reach CSR_TDATA1. Reject it here.
+	 */
+	if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1))
+		return SBI_ERR_INVALID_PARAM;
+
 	switch (TDATA1_GET_TYPE(tdata1)) {
 	case RISCV_DBTR_TRIG_MCONTROL:
 		update_bit(state & RV_DBTR_BIT_MASK(TS, U),
@@ -516,6 +524,8 @@ static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
 	tdata_write_safe(CSR_TDATA2, trig->tdata2);
 	tdata_write_safe(CSR_TDATA3, trig->tdata3);
 	csr_write(CSR_TDATA1, trig->tdata1);
+
+	return SBI_SUCCESS;
 }
 
 static void dbtr_trigger_disable(struct sbi_dbtr_trigger *trig)
@@ -785,6 +795,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
+		int ret;
 
 		/*
 		 * The dry-run above matched every requested configuration
@@ -796,7 +807,13 @@ int sbi_dbtr_install_trig(unsigned long smode,
 					 lle_to_cpu(recv->tdata3));
 
 		dbtr_trigger_setup(trig,  recv);
-		dbtr_trigger_enable(trig);
+		ret = dbtr_trigger_enable(trig);
+		if (ret != SBI_SUCCESS) {
+			*out = _idx;
+			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
+							     trig_count * sizeof(*entry));
+			return ret;
+		}
 		xmit->idx = cpu_to_lle(trig->index);
 
 	}
@@ -847,7 +864,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
-		dbtr_trigger_enable(trig);
+		int ret = dbtr_trigger_enable(trig);
+		if (ret != SBI_SUCCESS)
+			return ret;
 	}
 
 	return SBI_SUCCESS;
@@ -921,8 +940,18 @@ int sbi_dbtr_update_trig(unsigned long smode,
 					       lle_to_cpu(local.data.tdata3)))
 			return SBI_ERR_NOT_SUPPORTED;
 
+<<<<<<< Updated upstream
 		dbtr_trigger_setup(trig, &local.data);
 		dbtr_trigger_enable(trig);
+=======
+		dbtr_trigger_setup(trig, &entry->data);
+		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		{
+			int ret = dbtr_trigger_enable(trig);
+			if (ret != SBI_SUCCESS)
+				return ret;
+		}
+>>>>>>> Stashed changes
 	}
 
 	return SBI_SUCCESS;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
