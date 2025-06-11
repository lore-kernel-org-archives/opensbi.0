Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C176C71133
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWpFip0GSf3HCFX3MpKteegrNtWm1f7IViU6gIyEbjg=; b=gEXW2vDhBwky6n
	6cfBBpFCS2+LOqfb/9s7LhMUzfhk1Ae61vucv5Q1IRmKGry6fJFIU5gBa2NqwegkWb3kuToUZQB0C
	eCZTgK7syjXY6I+X1QCfFDvpUlkhQiV3tmP6RJIfN+RtqEtdvpOPsdvDzU2j3BuTvzU8WuBAVISYb
	f+9N7aLjAZF5QQR58Xe+MJPpMpGHdiAT/GYZWYwfTGJ2AvIIP/WdpLDgf3OodAmdCpU2LstCXrlpg
	mWSbOlixoBxqs8Vp2ZGwMT7n+6UuQfDl2XTzE1ES9S7+v4elXoz+VOnoqg6Ky8b7kYehXH/DPH0fb
	VfHpfS7MEZfBx2a2TwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNNC-0000000AOlo-1483;
	Wed, 11 Jun 2025 15:28:18 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKNQ-00000009pOB-0hdN
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tV
	cml+KA4M1xR5reuNcXpIQztikwBC1SJu0okn3XgQU=; b=JzpMjPe+z6wQqPqoES
	oTbZmmqjNE39DmzkUoOD2dQDXnlqMFPSkKatwpeUrNZaZ6EwRjpcNM+tHEdB6wW4
	X+RIaHmQFerSm7wxc8pYr/TZnjAkUgTwjBOXScs4vvicBgM9btjUt5QWSRtwifDJ
	mj89CokiiKMTY+ssOuYMoEze0=
Received: from T490.lan (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnZ1KNc0lo+7EtAA--.29653S2;
	Wed, 11 Jun 2025 20:16:13 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 12/12] lib: sbi: Remove cold_boot from sbi_double_trap_init
Date: Wed, 11 Jun 2025 20:16:02 +0800
Message-ID: <20250611121610.938004-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: PykvCgDnZ1KNc0lo+7EtAA--.29653S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF17Kw1fKF1kZF4rWF15urg_yoW8ZFWrpF
	y7KF17Gr40qr97XrykAa1UXr48C3y0gwn3GrW5Cw1vqw4kua4Fqr1UAw1jyr4DGr4Sya42
	9w4vvr4UKF4avw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRg_-9UUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFwtpOmhJa81dBAACsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_051620_514713_06201C6F 
X-CRM114-Status: UNSURE (   8.51  )
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

As long as there is a HART supporting Ssdbltrp, sse event must to
be registered. So remove cold_boot from sbi_double_trap_init.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_double_trap.h | 2 +-
 lib/sbi/sbi_double_trap.c     | 9 ++++++---
 lib/sbi/sbi_init.c            | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_double_trap.h b/include/sbi/sbi_double_trap.h
index 1c9f6472..c3d64dfd 100644
--- a/include/sbi/sbi_double_trap.h
+++ b/include/sbi/sbi_double_trap.h
@@ -15,6 +15,6 @@
 
 int sbi_double_trap_handler(struct sbi_trap_context *tcntx);
 
-void sbi_double_trap_init(struct sbi_scratch *scratch, bool cold_boot);
+void sbi_double_trap_init(struct sbi_scratch *scratch);
 
 #endif
diff --git a/lib/sbi/sbi_double_trap.c b/lib/sbi/sbi_double_trap.c
index 0e3951b8..301a4d2f 100644
--- a/lib/sbi/sbi_double_trap.c
+++ b/lib/sbi/sbi_double_trap.c
@@ -30,10 +30,13 @@ int sbi_double_trap_handler(struct sbi_trap_context *tcntx)
 	return sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
 }
 
-void sbi_double_trap_init(struct sbi_scratch *scratch, bool cold_boot)
+void sbi_double_trap_init(struct sbi_scratch *scratch)
 {
-	if (!cold_boot)
-		return;
+	/*
+	 * As long as there is a HART supporting Ssdbltrp,
+	 * sse event must to be registered.
+	 * This function need run all HARTs
+	 */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSDBLTRP))
 		sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, NULL);
 }
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 73d35933..41f96bc5 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -294,7 +294,7 @@ static void __noreturn init_startup(struct sbi_scratch *scratch, u32 hartid, boo
 	if (cold_boot)
 		sbi_boot_print_banner(scratch);
 
-	sbi_double_trap_init(scratch, cold_boot);
+	sbi_double_trap_init(scratch);
 
 	rc = sbi_irqchip_init(scratch, cold_boot);
 	if (rc) {
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
