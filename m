Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED09C677C4
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+HtKi1tz30dvMML/BVaoJVbEw6lLSondDGlafyTLvI=; b=uRRvdMME/by5iP
	ZqSVq8AH/mykvS7EMIWHR7NBJb40CfAhfZZV09399edY2XwhBNbxnWCSdKR56qXZx8b18vdfK6uST
	DCt2A1OeEvFgrfFSMWRuPoPhw7Z2a+VHCDUV5Dc18MZSjn73RuOHCtkMWeHAwy2T5CCveC2Dev6WS
	ICbC8k+KD/6c10SSN8vOZ6l0hb6fcQtZR/owGJcCKgCyIOHXhGF+Wcw0Ialzvbtb4/4NbDeXxwBmn
	DphQwA5+KP+HcK89FzzMVuO5QKNs50oKeCd3X2sBXun5xOhTLQY2aXJFNsY0/k/wKcW8ylPH6Zi28
	84J2qF5Uivte/F2YBYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNLA-0000000ANrH-3byk;
	Wed, 11 Jun 2025 15:26:12 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKN9-00000009pL9-2BFi
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=SU
	actXgMv5hWnBCAPNZdTJfRmM0tTCOfJvpZvL+Vc+w=; b=kyqnf8Ir0MXFnWQFqy
	alVbKawPcGO0cbgv9ARbWV0kA/Y/vZkgIBWVu6MsVXLNShlb/X1gZfWBb5Ht5SDg
	389g6rxpqeR9EAI2nJqHy3yhBbWDS0DHropf9DyEX6AFRywc4YtyUUx+1yGjk2rw
	K3mZGXOdyKG0IYe/nCukEGxQ4=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnj7B7c0lozRcuAA--.48444S2;
	Wed, 11 Jun 2025 20:15:56 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 11/12] lib: sbi: Fix dtbr initialization
Date: Wed, 11 Jun 2025 20:15:24 +0800
Message-ID: <20250611121551.937889-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnj7B7c0lozRcuAA--.48444S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw43Ww1ktF45Xr45trWDArb_yoW5Ww4kpr
	ZagasxKrs2qryvyrZrta18Xw1fWw1xJw47J39FkFySyF1DZr1rGr13Ka4Yqwn3CrWFyay2
	9w4vyrZ8Ca17ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRqsjbUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5A5pOmhJaY2DkAAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_051603_893467_7D8D7B5B 
X-CRM114-Status: GOOD (  13.69  )
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
index bdfbcde9..de459880 100644
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
index 9c496c42..f5639141 100644
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
