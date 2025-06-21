Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A83C7EE30
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZCEUc1ChMGzjC2fV9Vje9hIbTcj01lk8uAZneEgtO4=; b=yXVABCFO6kfAK2
	+hJu6U30lQEeBQdIRWhUuIVNTD1+Mue0yhmEU4fOQKIvyJKfb1482YKfFj87elQGpJ0/7X8/OM3hj
	LR3fEfaZdCbwlJ9RY9zKFGBEaHLrr8jZqNNDCVXtSkwigSC8D1IRIb3R6rpfWBrlg+J6QhiGnqCHy
	0efiFK8u45g7bPB7/JuCttTo6D/qRb3nwjF14Af27dpph3NbTmG2iCu58oUIne571Aq5SaiX62/gl
	UGbQXbuizgF9tZzaNJkw9tKWX0eRL+MRfU3kd5LYHTE9U5qEZoEjrNm95nv2YF8HB/e6SZuaaSjDb
	CDNewaPklRSkClEJ46jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyk-0000000H60Z-3BM4;
	Sat, 21 Jun 2025 04:37:22 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSplr-0000000H54J-0pFd
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9x
	a8X4CJZ9PTuHOrduoOvfU8miI5f2loTOd4pZ+jZTg=; b=BMXbHTU2dMG9SJuzv5
	vcX3rt34lFv0pMR9o6uyDQ+ot27y2LmvwshKdcP8q1XzFwIWo4wGq2oZUc4wpcYt
	iQ+Ljow9UbPSqid5/KUS2vkk5ZBHZJUNkRYwxLPzFjeeKMIpNgupPsaWDJQxdkJ7
	cwjV69NAeue0aFIq4YHyfEnLw=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S4;
	Sat, 21 Jun 2025 12:23:08 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 2/9] lib: sbi: Remove wait_for_coldboot and wake_coldboot_harts
Date: Sat, 21 Jun 2025 12:22:50 +0800
Message-ID: <20250621042302.160802-3-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF18tF18CFy8WryDCFyDWrg_yoW8Zr4rpF
	W3GF13KFs2qFWvg3srJ3yUWr1Yk3y8t347tr9rK34rJF4UCFn8XF1UGwnYyrZ8GrWkAa1k
	ArWDtFyxGF48Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_l1vDUUUUU=
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1xxzOmhWM5sAzAABsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212403_635074_967BEC2E 
X-CRM114-Status: UNSURE (   7.65  )
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
 lib/sbi/sbi_init.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 84a63748..4c55b3dc 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -197,20 +197,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
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
+static atomic_t coldboot_done;
 
 static unsigned long entry_count_offset;
 static unsigned long init_count_offset;
@@ -254,10 +241,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	/*
 	 * All non-coldboot HARTs do HSM initialization (i.e. enter HSM state
 	 * machine) at the start of the warmboot path so it is wasteful to
-	 * have these HARTs busy spin in wait_for_coldboot() until coldboot
-	 * path is completed.
+	 * have these HARTs busy spin in sbi_wait_for_boot_hart_first() until
+	 * coldboot path is completed.
 	 */
-	wake_coldboot_harts(scratch);
+	sbi_signal_boot_hart_first_done(true, &coldboot_done);
 
 	rc = sbi_platform_early_init(plat, true);
 	if (rc)
@@ -498,7 +485,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 {
 	int hstate;
 
-	wait_for_coldboot(scratch);
+	sbi_wait_for_boot_hart_first(false, &coldboot_done);
 
 	hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(), hartid);
 	if (hstate < 0)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
