Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F38C5516F
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4Z18qUV8B28Edi7DKhZdXkgx5z7WbpDo46gh2VI6F4=; b=IghxRXL4Ngp1n+
	p/O8yHmDBtAjdJazb2X2YBChp1hWF0sMub66LEldPKRxt6h7xPfs9qP98xum2cK7YPDSMRZ3HbjAQ
	xPbCq8lxViZxbbc7GDRZxSB8YcDOu58jwLxFhDO2w6PdZO+Hh9iu+ce+M9EpM/pH8QcRaM5CAwjgK
	vu0i/7AHxu7vuJo+ASKA83RZoJc2gtjBsh6NDpB2In41XHLAaMmM184lmfyJRUesDVF2EM/BiNcLg
	wvK9J5qYaKzmWqTOV50zfLoIfn34ANjVm7vskMh1C8v6duwn7o0xl8jMOVZ4nIA+w5Q7kkdXt0QsL
	cGYx+i2wcn+jVGjyXTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZU-0000000CKNi-09yE;
	Fri, 31 Jul 2026 10:34:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZS-0000000CKLj-3fmt
	for opensbi@bombadil.infradead.org;
	Fri, 31 Jul 2026 10:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yZ8Lj4Ymth8U59kQWUSQOQexuHQWI2ET52u/yXTMkZU=; b=SB5jXaX0AxM9cr4R+PLY9LYkyU
	6f20cAeaiWrpX7SkfwpVxVQa/V9sU6kgmihXnom3wrk3wpJeNWacs9eJSWlC9VadVsAUC66i+GjCg
	7K0wUIDjCqG0mbC6zdjcELKyAv472mYaXmazFXlJSXUMs/vgMnW1bO6qjwJfjgoPgVbEysRGZvBBO
	9JOs9F4E0irlSNMd1NmK0+IMQ2EZpY6Z2496ndxOoUxdJnANlLSBGv/1qymi4yOJU7MrKoAE05jHZ
	MP3wF3LXMBs2fA/XGmYmlCf/s7lxJTvq2RzTH42DjdzVJYKZohSWb3db6bDuoYrwy3fU4dNxblWnQ
	hcBihW3A==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpkZM-00000007Nu1-3Mqj
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 10:34:29 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXq+8nemxqJmmDAg--.64576S4;
	Fri, 31 Jul 2026 18:34:16 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul@summations.net>,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2 2/6] lib: sbi_dbtr: fix shared memory double-fetch in install_trig
Date: Fri, 31 Jul 2026 10:34:01 +0000
Message-Id: <20260731103405.1535818-3-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731103405.1535818-1-liutong@iscas.ac.cn>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXq+8nemxqJmmDAg--.64576S4
X-Coremail-Antispam: 1UD129KBjvJXoWxuFW8AF4rJrW3JFW8KF43Awb_yoW7KrWrpF
	Z3WF9rGrZ7JryqyrW8Aa18Ary3uw48J3W5trZakr92yas8Zr10q34aq34Fva4fKFyDZ3Wj
	v3WjgF1UCan0yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_113425_505325_8B05B1D7 
X-CRM114-Status: GOOD (  15.76  )
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

Previously sent as [PATCH v3].
Changes in v2:
- Single-pass with per-entry snapshot instead of full-array copy
Changes in v3:
- Added Fixes tag
Changes in v2 (series):
- Fixed rollback to cover SBI_ERR_NOT_SUPPORTED path
- Consolidated into patch series

 lib/sbi/sbi_dbtr.c | 82 ++++++++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index eeab7d3a..5cca0922 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -327,7 +327,7 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
 	trig->tdata2 = lle_to_cpu(recv->tdata2);
 	trig->tdata3 = lle_to_cpu(recv->tdata3);
 
-	tdata1 = lle_to_cpu(recv->tdata1);
+	tdata1 = trig->tdata1;
 
 	trig->state = 0;
 
@@ -603,12 +603,15 @@ int sbi_dbtr_read_trig(unsigned long smode,
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
+	int ret = SBI_ERR_FAILED;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 	bool tdata2_impl, tdata3_impl;
 
@@ -619,9 +622,13 @@ int sbi_dbtr_install_trig(unsigned long smode,
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
@@ -632,62 +639,53 @@ int sbi_dbtr_install_trig(unsigned long smode,
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
-			return SBI_ERR_NOT_SUPPORTED;
+			ret = SBI_ERR_NOT_SUPPORTED;
+			goto rollback;
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
+	return ret;
 }
 
 int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
