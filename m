Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3AB606A332
	for <opensbi@archiver.kernel.org>; Tue,  3 Nov 2026 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F6N6YTg+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WQWl8/8iatjuMwzusvCecKr8zV9T7mEA6VBk/HJLqp0=; b=F6N6YTg+zjQnn1asVt77mo3p6y
	FrDI4+eoGLdRsrxd1qutrqwAz1uhk/ZQY6Hk8wM/tUUAMc/hrdSFrquHuIKsRuh5QatPLQHLCCueX
	q248i4zL7Z0vFw2PoJ4HWICoLtUMud029fKwZ5hdOYPh5M2CxWjidrJ0++M8ix6d3jAsIYZuZ67FE
	MLdYBkuDL35lqSuhYJ2xeoQeoXPw5i5I6oEYL9H+F1KBewUFpKvWFa5AhDSCul2UmDG/B2H+m8M7b
	QfKZdhQHKP6eyQIkUVxtEbJxjqJWmsbSq+XNDmqtrxgDQF/ujYJrLuXordET+DyKbOy1JyizbfNAr
	mL72n88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9bO-00000001Utn-2iZq;
	Tue, 03 Nov 2026 08:10:42 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9az-00000001Ueb-2oUt
	for opensbi@lists.infradead.org;
	Tue, 03 Nov 2026 08:10:21 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACHkpPklulqdEI6AA--.1588S2;
	Tue, 03 Nov 2026 16:10:12 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	anup@brainfault.org,
	npiggin@gmail.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi: dbtr: validate trigger configuration in update_trig
Date: Tue,  3 Nov 2026 08:10:01 +0000
Message-Id: <20261103081001.2948003-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACHkpPklulqdEI6AA--.1588S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1UAr4DuFy5JFW8Cry8Xwb_yoWxAw4DpF
	ZYgF98KrZ7t342v397Zay8uFyrZw48J3WUJ3909ry2ya98Z348ArySqa1rZ3yFkrn5W3Wj
	yF1jqrW7Can8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUXID7UUU
	UU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_001018_115772_039C9A4D 
X-CRM114-Status: GOOD (  26.79  )
X-Spam-Score: -0.9 (/)
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

sbi_dbtr_update_trig() programs a new tdata1 into an already installed
trigger without checking it. sbi_dbtr_install_trig() runs
dbtr_trigger_valid() on the configuration it is given, which refuses a
tdata1 that sets the mcontrol6 M bit, because such a trigger fires
while the hart is in M-mode. Update has no equivalent check, so S-mode
can install a trigger that install accepts and then set that bit on it
with an update. No race is needed: the two calls succeed in sequence
and the bit is written to CSR_TDATA1 without being checked.

dbtr_trigger_valid() also refuses the DMODE bit. That one is not
reachable this way, since tdata1.dmode is writable only from Debug
Mode, but the check covers both.

Check the configuration before the trigger is reprogrammed, and copy
it out of the shared memory once so that the validity check, the
hardware support check and the value finally written to the CSRs all
see the same configuration rather than separate re-reads of memory
S-mode can still write. The copy also lets the mapping be released
before the trigger is programmed.

SBI v3.0 section 19.5 defines SBI_ERR_INVALID_PARAM for an invalid
trigger configuration entry. Install reports an unknown trigger type
as SBI_ERR_FAILED instead, from a separate dbtr_trigger_supported()
call that this patch does not add to update, so the two paths differ
for that input.

dbtr_trigger_valid() rejects a type it does not recognise, so an
unknown type in the new tdata1, including a zero tdata1, is refused
here as it already was on install. It does not check the new type
against the one the trigger was installed with, nor against the
trigger's type_mask, so update still accepts a change of type that
install would not have allowed in the first place.

This does not address the equivalent problem in sbi_dbtr_install_trig(),
where the value passed to dbtr_trigger_valid() and the value later
programmed come from separate reads of the shared memory. The
escalation stays reachable there until that is fixed separately.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Prior art: Nicholas Piggin reported the same gap and posted a fix in
"[PATCH 07/18] dbtr: Check for invalid and unsupported triggers in
update" (20260313051948.4017134-8-npiggin@gmail.com). That series is
marked changes-requested in patchwork and has had no v2 in seven
months, and 07/18 depends on earlier patches in it, so this is a
standalone version against current master. His version also calls
dbtr_trigger_supported(), which is what gives install its
SBI_ERR_FAILED for an unknown type.

Measured under QEMU 11.1.0-rc3, -M virt -cpu rv64,debug=on, one hart,
no race, OpenSBI at c9a7d009:

  install benign (M=0)   : err=0, CSR_TDATA1 = 0x6000000000000014
  update to M=1          : err=0, CSR_TDATA1 = 0x6000000000000054
  after this patch       : err=-3, CSR_TDATA1 unchanged
  benign update          : still applied

Aimed at an address OpenSBI executes, such a trigger takes a
breakpoint in M-mode on the next ecall; an M-mode trap cannot be
redirected, so it ends in sbi_trap_error() and sbi_hart_hang(). The
other hart keeps running, so it is not a machine kill.

Adjacent problems this patch deliberately leaves alone, listed so they
are not assumed fixed:

- sbi_dbtr_install_trig() has the same split between the validated
  read and the programmed read. With a second hart rewriting the
  entry I get the M bit into CSR_TDATA1 within a few rounds. I have a
  tested patch that moves the check into dbtr_trigger_setup() so one
  check covers both paths, but it restructures install_trig and I did
  not want to put that in the same patch. Happy to send it if the
  approach is wanted.
- In that same loop, sbi_alloc_trigger() returning NULL leads to
  xmit->idx = cpu_to_lle(trig->index) on a NULL trig. The comment says
  the dry-run makes allocation infallible, but the dry-run reads the
  entry separately.
- sbi_dbtr_update_trig() reports no index for the failing entry, since
  it has no out parameter, and this patch adds another failure exit to
  it. Install sets *out on every failure. Changing the signature felt
  out of scope here; David E. Garcia Porras's DBTR error code series
  already proposes it.
- update applies entries one at a time, so a refused entry leaves the
  ones before it reprogrammed. That is pre-existing and already
  reachable through the trig_idx check.

 lib/sbi/sbi_dbtr.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 5f66b641..5cb494f0 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -853,7 +853,8 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 int sbi_dbtr_update_trig(unsigned long smode,
 			 unsigned long trig_count)
 {
-	unsigned long trig_idx;
+	unsigned long trig_idx, tdata1;
+	struct sbi_dbtr_data_msg local;
 	struct sbi_dbtr_trigger *trig;
 	union sbi_dbtr_shmem_entry *entry;
 	void *shmem_base = NULL;
@@ -897,22 +898,34 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			return SBI_ERR_FAILED;
 		}
 
-		if ((entry->data.tdata2 && !tdata2_impl) ||
-		    (entry->data.tdata3 && !tdata3_impl)) {
+		/*
+		 * Copy the entry once. S-mode can rewrite the shared
+		 * memory at any time, so the configuration that is
+		 * checked here has to be the one that is programmed.
+		 */
+		local = entry->data;
+		tdata1 = lle_to_cpu(local.tdata1);
+
+		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1)) {
+			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+			return SBI_ERR_INVALID_PARAM;
+		}
+
+		if ((local.tdata2 && !tdata2_impl) ||
+		    (local.tdata3 && !tdata3_impl)) {
 			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_NOT_SUPPORTED;
 		}
 
-		if (!dbtr_trigger_hw_supported(trig->index,
-					       lle_to_cpu(entry->data.tdata1),
-					       lle_to_cpu(entry->data.tdata2),
-					       lle_to_cpu(entry->data.tdata3))) {
+		if (!dbtr_trigger_hw_supported(trig->index, tdata1,
+					       lle_to_cpu(local.tdata2),
+					       lle_to_cpu(local.tdata3))) {
 			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_NOT_SUPPORTED;
 		}
 
-		dbtr_trigger_setup(trig, &entry->data);
 		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
+		dbtr_trigger_setup(trig, &local);
 		dbtr_trigger_enable(trig);
 	}
 

base-commit: 2c7788e4c3efa63d670ee90402dac2a9799d0bd7
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
