Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EFAC7EE2E
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CJejDUDP6DXRU6qvvAsaIxFcOD/YSRL0YaMa5VQh/s=; b=W6rygrNpTxDjxf
	uyiEnluDURsnDrnxkL/wfiz6ismYcSDU8Kvzp8twGIMdaWt1ySTEm1yqtVJaGr59Xw2kxzrs2P7KD
	40RxYehnfhYgqh+4YRfXTuOTq3zUEnjvrwTBwXFR7xkxt4vG2s/VuNnmQ/CKuQ8Pz0s+97+V9WNcj
	nre/szqYIFtnAHaBLUfBks48BmUUup34tMTO1rwbVeg79NydPCnOBzhg22A4nb64b3Q6/MUsT1rCi
	3gx+9YHCpbmktt9AtgAI0sV44Pd2bqbpPDLTs0OF6WFdqEv2Tku6+pC+qSAnB7WlwSZ9pFtld1x8Z
	osfX/WC1ryVk5XDsPSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpym-0000000H61r-19Xf;
	Sat, 21 Jun 2025 04:37:24 +0000
Received: from m16.mail.126.com ([220.197.31.8])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSplw-0000000H55b-0xpW
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ur
	fhRGzf6I0XbkY9A3Jnv0p+mWgQzhxNJUyWUz/hk2s=; b=iT/WjsO0WQ8bOcJlYl
	CPcqRYys4h3nzFm9lhR40nBDXlkQ4Z/qIRLBWFXFqVGoWfmbPwPhSMk9BiNyoycu
	2irHX+CwZ7Eq/RUH2H5/sdmrIFJUDHRIfDaboqXK1yeHsJz3vPEbtVbKshNd0Qfi
	qX4Z8uVLAsNEl7TZc89DVkiUE=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S10;
	Sat, 21 Jun 2025 12:23:12 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 8/9] lib: sbi: Fix dtbr initialization
Date: Sat, 21 Jun 2025 12:22:56 +0800
Message-ID: <20250621042302.160802-9-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw43Ww1ktF45Xr45trWDArb_yoW5Ww4kpr
	ZagasxKrs2qryvyrZrta18Xw1fWw1xJw47J39FkFySyF1DZr1rGr13Ka4Yq3Z3CFWFyay2
	9w4vyrZ8Ca17ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_g4fiUUUUU=
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5BlzOmhWMwUHoQAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212408_583336_D924BED2 
X-CRM114-Status: GOOD (  13.73  )
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

Previously, dbtr initialization and extension registration were
performed only on the coldboot HART, resulting in extension
registration only depending on whether the coldboot HART supports
dbtr. Now that the boot sequence has been corrected, dtbr extensions
can be registered even if some cores support dtbr.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_dbtr.c       | 29 ++++++++++++++++++++++++-----
 lib/sbi/sbi_ecall_dbtr.c |  2 +-
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index dcf24ce5..5cfc64e4 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -23,6 +23,8 @@
 /** Offset of pointer to HART's debug triggers info in scratch space */
 static unsigned long hart_state_ptr_offset;
 
+static bool has_dtbr_triggers;
+
 #define dbtr_get_hart_state_ptr(__scratch)				\
 	sbi_scratch_read_type((__scratch), void *, hart_state_ptr_offset)
 
@@ -138,12 +140,10 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 	struct sbi_trap_info trap = {0};
 	unsigned long tdata1;
 	unsigned long val;
-	int i;
+	int i, ret = SBI_SUCCESS;
 	struct sbi_dbtr_hart_triggers_state *hart_state = NULL;
 	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
-
-	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SDTRIG))
-		return SBI_SUCCESS;
+	static atomic_t sync_b = ATOMIC_INITIALIZER(0);
 
 	sbi_wait_for_boot_hart_first(coldboot, &sync_a);
 	if (coldboot) {
@@ -153,6 +153,9 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 	}
 	sbi_signal_boot_hart_first_done(coldboot, &sync_a);
 
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SDTRIG))
+		goto _exit;
+
 	hart_state = dbtr_get_hart_state_ptr(scratch);
 	if (!hart_state) {
 		hart_state = sbi_zalloc(sizeof(*hart_state));
@@ -215,10 +218,26 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 
 	hart_state->probed = 1;
 
+	if (hart_state->total_trigs > 0)
+		has_dtbr_triggers = true;
+
  _probed:
 	hart_state->available_trigs = hart_state->total_trigs;
+_exit:
 
-	return SBI_SUCCESS;
+	/*
+	 * Wait for all HARTs to complete sbi_dbtr_init to
+	 * ensure that the following code can determine whether
+	 * dtbr is supported
+	 */
+	sbi_sync_and_wait_all_harts(&sync_b);
+
+	return ret;
+}
+
+int sbi_dbtr_supported(void)
+{
+	return has_dtbr_triggers;
 }
 
 int sbi_dbtr_get_total_triggers(void)
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
index 40a437ee..b11490b8 100644
--- a/lib/sbi/sbi_ecall_dbtr.c
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -59,7 +59,7 @@ struct sbi_ecall_extension ecall_dbtr;
 
 static int sbi_ecall_dbtr_register_extensions(void)
 {
-	if (sbi_dbtr_get_total_triggers() == 0)
+	if (!sbi_dbtr_supported())
 		return 0;
 
 	return sbi_ecall_register_extension(&ecall_dbtr);
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
