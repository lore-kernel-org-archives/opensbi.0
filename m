Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D8DC677C4
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Sr0h5ooOTIqfA0isiG40RBdu1IpV9VWWL/LilNcZVY=; b=GCXwqc4CmHmZdO
	MVXa0s5pljSGLKJT6JGnkztRM7TgvPoxsqXKTB/SJrg/SyKGkm1uHy+/88PrSA5EhB2JU+zJf0G7y
	3p6xp5r+c7bdabhvEEGGiKXicbSnJh1zLF/nDFgUb6cJu7XajJE22oyZHyZbubP+lWzW+huN+82Sr
	mO/i61JD4M4OSTXd2ErJMNCO665u0X3LDA8Lj2hhAKRj4lQB8pVkytQlvKThVKSIvZ/OlL74myRSX
	UIewkDrhPlDlZh+wqhr63lWUtrXz/kFpBowgawqXONxELDuuaSc20fVbABswxykZVr5Flb2Bj3bhq
	U/xNcuJ6FtorvTc/umZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL4-0000000ANke-0frb;
	Wed, 11 Jun 2025 15:26:06 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKK5-00000009oys-40WA
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Qn
	8JIRJGPupChrNWGRoRGHIjcwiccKL2cOOeZ0bexO0=; b=iE2D/fg5Rk7zfyJeip
	+bltFjiEJ3YNNmuplT2Ku013O0q3RWo0NLt1CSgp3HgxV2qNmfNawsZisao4tSR+
	7Wov4wM55XiXkBv6Mq07LJSq/vHEw+CahFqoS4WwYOZkJSFw6pw0vZ5nQc7UQ50Y
	knEhBFmPgQkV2plK6dJ2NOQp8=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S3;
	Wed, 11 Jun 2025 20:12:41 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 01/12] lib: sbi: Add coldboot parameters to some initialization functions
Date: Wed, 11 Jun 2025 20:12:18 +0800
Message-ID: <20250611121236.937455-2-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3WrWxWw4fGw1fAw1fWFWUXFb_yoW7Xw45pF
	98tFnFyr40q34xt3srAw4UXr4xK3y0g3W7GrW5C3s2qw40yF1Fgr18Jw1YvF4DGF4Iya1j
	yanFvrW8CF4avrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_E_MkUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFxhpOmhJa81c4QAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_051254_377298_21EFFFDF 
X-CRM114-Status: GOOD (  12.66  )
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

To reduce the difference between init_coldboot/init_warm_startup,
add cold_boot parameters to some initialization functions.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_domain.h      | 2 +-
 include/sbi/sbi_double_trap.h | 2 +-
 include/sbi/sbi_mpxy.h        | 2 +-
 lib/sbi/sbi_domain.c          | 9 +++++++--
 lib/sbi/sbi_double_trap.c     | 6 ++++--
 lib/sbi/sbi_init.c            | 6 +++---
 lib/sbi/sbi_mpxy.c            | 4 +++-
 7 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index e9cff0b1..af25196b 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -311,7 +311,7 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid);
 
 /** Finalize domain tables */
-int sbi_domain_finalize(struct sbi_scratch *scratch);
+int sbi_domain_finalize(struct sbi_scratch *scratch, bool cold_boot);
 
 /** Initialize domains */
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid);
diff --git a/include/sbi/sbi_double_trap.h b/include/sbi/sbi_double_trap.h
index c3d64dfd..1c9f6472 100644
--- a/include/sbi/sbi_double_trap.h
+++ b/include/sbi/sbi_double_trap.h
@@ -15,6 +15,6 @@
 
 int sbi_double_trap_handler(struct sbi_trap_context *tcntx);
 
-void sbi_double_trap_init(struct sbi_scratch *scratch);
+void sbi_double_trap_init(struct sbi_scratch *scratch, bool cold_boot);
 
 #endif
diff --git a/include/sbi/sbi_mpxy.h b/include/sbi/sbi_mpxy.h
index 9da2791e..9145816c 100644
--- a/include/sbi/sbi_mpxy.h
+++ b/include/sbi/sbi_mpxy.h
@@ -148,7 +148,7 @@ struct sbi_mpxy_channel {
 int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel);
 
 /** Initialize Message proxy subsystem */
-int sbi_mpxy_init(struct sbi_scratch *scratch);
+int sbi_mpxy_init(struct sbi_scratch *scratch, bool cold_boot);
 
 /** Check if some Message proxy channel is available */
 bool sbi_mpxy_channel_available(void);
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 461c7e53..c4d16f1b 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -742,15 +742,20 @@ int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid)
 	return 0;
 }
 
-int sbi_domain_finalize(struct sbi_scratch *scratch)
+int sbi_domain_finalize(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	const struct sbi_platform *plat;
+
+	if (!cold_boot)
+		return 0;
 
 	/* Sanity checks */
 	if (domain_finalized)
 		return SBI_EINVAL;
 
+	plat = sbi_platform_ptr(scratch);
+
 	/* Initialize and populate domains for the platform */
 	rc = sbi_platform_domains_init(plat);
 	if (rc) {
diff --git a/lib/sbi/sbi_double_trap.c b/lib/sbi/sbi_double_trap.c
index d0ddb493..0e3951b8 100644
--- a/lib/sbi/sbi_double_trap.c
+++ b/lib/sbi/sbi_double_trap.c
@@ -30,8 +30,10 @@ int sbi_double_trap_handler(struct sbi_trap_context *tcntx)
 	return sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
 }
 
-void sbi_double_trap_init(struct sbi_scratch *scratch)
+void sbi_double_trap_init(struct sbi_scratch *scratch, bool cold_boot)
 {
+	if (!cold_boot)
+		return;
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSDBLTRP))
 		sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, NULL);
-}
\ No newline at end of file
+}
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 62c32682..a227cb53 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -280,7 +280,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_boot_print_banner(scratch);
 
-	sbi_double_trap_init(scratch);
+	sbi_double_trap_init(scratch, true);
 
 	rc = sbi_irqchip_init(scratch, true);
 	if (rc) {
@@ -313,7 +313,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
-	rc = sbi_mpxy_init(scratch);
+	rc = sbi_mpxy_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
@@ -324,7 +324,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * Note: Finalize domains before HART PMP configuration so
 	 * that we use correct domain for configuring PMP.
 	 */
-	rc = sbi_domain_finalize(scratch);
+	rc = sbi_domain_finalize(scratch, true);
 	if (rc) {
 		sbi_printf("%s: domain finalize failed (error %d)\n",
 			   __func__, rc);
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 681cfbe9..761d81e0 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -306,9 +306,11 @@ static struct mpxy_state *sbi_domain_get_mpxy_state(struct sbi_domain *dom,
 	return dom_hartindex_to_mpxy_state_table[hartindex];
 }
 
-int sbi_mpxy_init(struct sbi_scratch *scratch)
+int sbi_mpxy_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int ret;
+	if (!cold_boot)
+		return 0;
 
 	/**
 	 * Allocate per-domain and per-hart MPXY state data.
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
