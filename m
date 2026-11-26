Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7143606A323
	for <opensbi@archiver.kernel.org>; Thu, 26 Nov 2026 02:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xFVZj/ll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A+Ow5l3iA9XNlC8UmvjOWT2P5BbXI5kg9dYKXg1Hmdk=; b=xFVZj/llsE7XjZ5kJJOtkiVyv4
	l6imsf9VAdHAvWZD4l/QsIAGKqd+KUymmsiWQh35J0svylHoAjCMQiVzNB9/orLlFvJDKMBqtXF3B
	UX8qGgpIfF1nW+/EAWvL26HwAGkE44GR4B6p5m/uAZUM9uwAwR3dtxCdwAXhOh3j5KdPobpw1RhcH
	BbZDGZ2rvnKRHsVQbfj59Zl4vQdWFO67GaFw16Mv7WUsNQzAACxq7JfTMAqXLnsJiTtQ+UplgpwlA
	qHPgeLYS+fzkfNSDnKoxgvvMuyFibJEmunSnx4nklP5oMxOI4ZfKY0kCwrq6Xo/K8KM2vml4xd2/1
	AgcAUuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPUY-0000000BwCo-0oAM;
	Thu, 26 Nov 2026 02:45:46 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPUQ-0000000BwBp-2ElJ
	for opensbi@lists.infradead.org;
	Thu, 26 Nov 2026 02:45:40 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAHpLlOnQdrIcL3AQ--.1173S2;
	Thu, 26 Nov 2026 10:45:35 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: hchauhan@ventanamicro.com,
	apatel@ventanamicro.com,
	npiggin@gmail.com,
	xypron.glpk@gmx.de,
	liutong@iscas.ac.cn
Subject: [PATCH v2] lib: sbi: dbtr: validate trigger configuration before writing CSR
Date: Thu, 26 Nov 2026 02:45:19 +0000
Message-Id: <20261126024519.251642-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125030930.3743680-1-liutong@iscas.ac.cn>
References: <20261125030930.3743680-1-liutong@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHpLlOnQdrIcL3AQ--.1173S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurW3XFW3uF13AFWUXF1rtFb_yoWrKw4kpF
	ZY9FyUKrZ7try0kr4Iyay0gryagw48Jw45GrZF9340vas0yw18Gr1agw1jq3WruFykXF4U
	A3y8tFWDCFsxXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20261125_184538_982492_F0A7B3E1 
X-CRM114-Status: GOOD (  13.22  )
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
v1: https://lore.kernel.org/opensbi/20261125030930.3743680-1-liutong@iscas.ac.cn/
v2: resolve the unresolved conflict markers accidentally included in v1's
    update_trig hunk, add the missing forward declaration for
    dbtr_trigger_valid(), and free the trigger allocated in install_trig
    when the new check fails.

Applies on top of

  [PATCH v2] lib: sbi: dbtr: validate trigger configuration in update_trig
  https://lore.kernel.org/opensbi/20261115163732.746589-1-liutong@iscas.ac.cn/

Build-tested with PLATFORM=generic for RV64 and RV32.

 lib/sbi/sbi_dbtr.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 9b5d25617194..d2617252f305 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -460,17 +460,27 @@ static inline void update_bit(unsigned long new, int nr, volatile unsigned long
 		__clear_bit(nr, addr);
 }
 
-static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
+static int dbtr_trigger_valid(unsigned long type, unsigned long tdata);
+
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
+	 * memory between the validation pass and the install pass, allowing an
+	 * invalid configuration (with DMODE or M bit set) to reach CSR_TDATA1.
+	 */
+	if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1))
+		return SBI_ERR_INVALID_PARAM;
+
 	switch (TDATA1_GET_TYPE(tdata1)) {
 	case RISCV_DBTR_TRIG_MCONTROL:
 		update_bit(state & RV_DBTR_BIT_MASK(TS, U),
@@ -516,6 +526,8 @@ static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
 	tdata_write_safe(CSR_TDATA2, trig->tdata2);
 	tdata_write_safe(CSR_TDATA3, trig->tdata3);
 	csr_write(CSR_TDATA1, trig->tdata1);
+
+	return SBI_SUCCESS;
 }
 
 static void dbtr_trigger_disable(struct sbi_dbtr_trigger *trig)
@@ -687,6 +699,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	unsigned long ctrl;
 	u32 claimed = 0;
 	int slot;
+	int ret;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	bool tdata2_impl, tdata3_impl;
@@ -796,7 +809,14 @@ int sbi_dbtr_install_trig(unsigned long smode,
 					 lle_to_cpu(recv->tdata3));
 
 		dbtr_trigger_setup(trig,  recv);
-		dbtr_trigger_enable(trig);
+		ret = dbtr_trigger_enable(trig);
+		if (ret != SBI_SUCCESS) {
+			sbi_free_trigger(trig);
+			*out = _idx;
+			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
+							     trig_count * sizeof(*entry));
+			return ret;
+		}
 		xmit->idx = cpu_to_lle(trig->index);
 
 	}
@@ -839,6 +859,7 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 	unsigned long idx = trig_idx_base;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs;
+	int ret;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -847,7 +868,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
-		dbtr_trigger_enable(trig);
+		ret = dbtr_trigger_enable(trig);
+		if (ret != SBI_SUCCESS)
+			return ret;
 	}
 
 	return SBI_SUCCESS;
@@ -857,6 +880,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			 unsigned long trig_count)
 {
 	unsigned long trig_idx, tdata1;
+	int ret;
 	union sbi_dbtr_shmem_entry local;
 	struct sbi_dbtr_trigger *trig;
 	union sbi_dbtr_shmem_entry *entry;
@@ -922,7 +946,9 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			return SBI_ERR_NOT_SUPPORTED;
 
 		dbtr_trigger_setup(trig, &local.data);
-		dbtr_trigger_enable(trig);
+		ret = dbtr_trigger_enable(trig);
+		if (ret != SBI_SUCCESS)
+			return ret;
 	}
 
 	return SBI_SUCCESS;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
