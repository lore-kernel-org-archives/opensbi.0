Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB33C7113D
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pt38jbIt4A2nxX9Hq6WuN+Iwy7Dgw9Rp3Q3DZMfKlOM=; b=SJ88Up4YhG863D
	W93fsK4Hu40+XFSQxK80sz0Ykasin1VDBmS8weqiAB73n+bqSNM017aTyWsp15Yin/EMqwHVx55lm
	9QqacpN5KeVkEsjH4CN7ISTSjfRC7vuDe/NpB14Ks0Iml1MQzvGHP6PIANDtIYSNNX3Ux/+f/OuTr
	i86noeVm2ogm864GMqhSG44yBfzhvx3XGDUQ0ZGga/NzTBiW0OFZy8OqoXVxhqvOrqQbuS1lgZarN
	RDol13pFnUrLKDHnzHYrnrL6d4nx042Qdv/wzUMIYqXVEJy1FtWFJeLrE9q3hsVapNPRrNaC2vs+G
	isSyQ1JOtoI5E8dU+46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL5-0000000ANlE-28Rl;
	Wed, 11 Jun 2025 15:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKD-00000009p0u-0Rwa
	for opensbi@bombadil.infradead.org;
	Wed, 11 Jun 2025 12:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dWa81jDHFtIhrTH7PJUwqAx3cUZokMyGYYqtcva2fxc=; b=UOmWGeQbNDoIcJ66W1q8qGuj3Q
	aCRyMGvlWVNVJC1F8INVj7KBWEn+NKs9D8PghtnubgQotP2ZfiFlZ4vf1vb4fRBpzEZXCuxG9fUkC
	YIsgme7vOIs4w1rOTjCIywjvnccoliUOHDehNwN7YQD2/4yDewD2VIA8ZFjXQNbM13tFxayqTzynf
	5wCRyUJhGay1FUN1j1QdHtGroIWFfR4aFQ0/dwF+k2JDAbHB/w4JDgxSF11hDun/vJd5qOxBhbgzl
	AYATX00hVY2Dy1UrSLBF/k/uFtZ6phHPpBF3tO0fU+2yRo6ScA72FQ7yJRJ2sAxxJbi2zWlnurJIo
	F/yJh2pA==;
Received: from m16.mail.126.com ([117.135.210.6])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKA-00000002NeU-2D0g
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dW
	a81jDHFtIhrTH7PJUwqAx3cUZokMyGYYqtcva2fxc=; b=O41ESFwMPiZt+pzayZ
	rpnXZlqTW5htaUNoG92JVX9uNCq8HNL1Zf/AlzntxN7MneDaOmrQ7oxH3bafIg+t
	iSky2wzGCtFBTrKH7aQ9Z82D9cRRlb7NA1mMH1UhNMSkK2YWawaozbWrEs88MyIO
	E0I23/gR7Vq82A4syCuP7T1Mw=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S6;
	Wed, 11 Jun 2025 20:12:42 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 04/12] lib: sbi: Remove wait_for_coldboot and wake_coldboot_harts
Date: Wed, 11 Jun 2025 20:12:21 +0800
Message-ID: <20250611121236.937455-5-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF18trWkZFW3XFyxKw18AFb_yoW8tF43pF
	W5KFy2yFsYvFW0q3srJ3yUWr13C3y8tr17Gry7t34rJF4UAFn8XF17Gw1Fv3s8GrWxA3Z7
	ZrWqvFyxGa18Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEwZ2xUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5A1pOmhJaY15wQAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131259_056758_1DCDE801 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

Remove wait_for_coldboot and wake_coldboot_harts and use more
general methods instead.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_init.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a8983f4d..8405fcf3 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -197,21 +197,6 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "           ");
 }
 
-static unsigned long coldboot_done;
-
-static void wait_for_coldboot(struct sbi_scratch *scratch)
-{
-	/* Wait for coldboot to finish */
-	while (!__smp_load_acquire(&coldboot_done))
-		cpu_relax();
-}
-
-static void wake_coldboot_harts(struct sbi_scratch *scratch)
-{
-	/* Mark coldboot done */
-	__smp_store_release(&coldboot_done, 1);
-}
-
 static void __noreturn init_warm_resume(struct sbi_scratch *scratch, u32 hartid)
 {
 	int rc;
@@ -238,7 +223,9 @@ static void __noreturn init_startup(struct sbi_scratch *scratch, u32 hartid, boo
 	int hstate;
 	unsigned long *count;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	static atomic_t sync_a = ATOMIC_INITIALIZER(0);
 
+	sbi_wait_for_boot_hart_first(cold_boot, &sync_a);
 	if (cold_boot) {
 		/* Note: This has to be first thing in coldboot init sequence */
 		rc = sbi_scratch_init(scratch);
@@ -258,8 +245,6 @@ static void __noreturn init_startup(struct sbi_scratch *scratch, u32 hartid, boo
 		entry_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
 		init_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
 	} else {
-		wait_for_coldboot(scratch);
-
 		hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(), hartid);
 		if (hstate < 0)
 			sbi_hart_hang();
@@ -284,8 +269,7 @@ static void __noreturn init_startup(struct sbi_scratch *scratch, u32 hartid, boo
 	 * have these HARTs busy spin in wait_for_coldboot() until coldboot
 	 * path is completed.
 	 */
-	if (cold_boot)
-		wake_coldboot_harts(scratch);
+	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
 	rc = sbi_platform_early_init(plat, cold_boot);
 	if (rc)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
