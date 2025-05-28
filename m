Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4BAC5B54E
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 05:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfjizjjB1+fe/0C0nLb8oXmD7Aed+2iIT6IWQWA3PBs=; b=1F6MkqubqkSjri
	OTtFS6Grg54XBJ9Qzu9nXl4p+Gp5RCPeISv2+FdW7+Ajya8P60Z6RlQfx0kEx5SzSJ+ko2GJesUEa
	8vogc3zJ+/zBtnWfwRnoTCAyh1RseKPrZsJ2ksLzJ03s9vGmScG8cgYCsFITEEamh9dSgMkZQDvu2
	0rytQt+or/legV2EM7pSyVyqGSJ7ubaMSjF3h3RF+sTLL2vTRJR5Bi3GyBa2F3Xm2sdzWGKJt59Et
	/JA5qAJPwldUWaKrljHY2sY8KoPH+1+3kihPhmEnbzkPnmlZ+KuwzIAHdBN0WFdgM7sVMturR9hW+
	WIwUbkfi4kyI5RXyMz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9k0-0000000CEtx-3vKK;
	Wed, 28 May 2025 05:54:16 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9jy-0000000CEsN-1EaS
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 05:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kk
	veYjpKUXztbh3vi769wJy6UWseLbConWIhLzpvSVw=; b=n0uE46XZemsIteNkNO
	FqXeOTIr5X9sfpPFFsbhTmze0zpMTzyeCp7DK+lmC9lm4kBBUc+L6k1/Whbtz2gX
	++4KwSJlq+h9xs+ATbvdVCDB9M+lt29QYYrYwpWCnNq26mNbBnutVuO7agLhim40
	b+hqvRK1ZU7mHpSKzCsIvH4r0=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX_5j3pDZo96cmAw--.22074S5;
	Wed, 28 May 2025 13:54:01 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 3/4] lib: utils: Simplify time_event_stop
Date: Wed, 28 May 2025 13:53:52 +0800
Message-ID: <20250528055356.547392-4-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528055356.547392-1-wxjstz@126.com>
References: <20250528055356.547392-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_5j3pDZo96cmAw--.22074S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw4rJryfAr45Xw47Cr15Arb_yoW5GrWDpr
	W7Gry3tFsYqFWSqr1ktw4kuw13CFW8J34vywn7Kw1xAF43Zry3GF18GryrAFW3JFWv9FyS
	kayvyr13JayUWFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEt8n5UUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFwNbOmg2l733CwAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_225414_792820_4972E9C6 
X-CRM114-Status: UNSURE (   8.03  )
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

The code of time_event_stop is basically the same as time_event_start,
except for the values written into the registers. This patch
implements time_event_stop by calling time_event_start.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/timer/aclint_mtimer.c | 21 +++++----------------
 lib/utils/timer/andes_plmt.c    | 21 +++++----------------
 2 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 3db3c3be..ad4c10b3 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -69,22 +69,6 @@ static u64 mtimer_value(void)
 	return mt->time_rd((void *)mt->mtime_addr);
 }
 
-static void mtimer_event_stop(void)
-{
-	u32 target_hart = current_hartid();
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	struct aclint_mtimer_data *mt;
-	u64 *time_cmp;
-
-	mt = mtimer_get_hart_data_ptr(scratch);
-	if (!mt)
-		return;
-
-	/* Clear MTIMER Time Compare */
-	time_cmp = (void *)mt->mtimecmp_addr;
-	mt->time_wr(true, -1ULL, &time_cmp[target_hart - mt->first_hartid]);
-}
-
 static void mtimer_event_start(u64 next_event)
 {
 	u32 target_hart = current_hartid();
@@ -102,6 +86,11 @@ static void mtimer_event_start(u64 next_event)
 		    &time_cmp[target_hart - mt->first_hartid]);
 }
 
+static void mtimer_event_stop(void)
+{
+	mtimer_event_start(-1ULL);
+}
+
 static struct sbi_timer_device mtimer = {
 	.name = "aclint-mtimer",
 	.timer_value = mtimer_value,
diff --git a/lib/utils/timer/andes_plmt.c b/lib/utils/timer/andes_plmt.c
index d034feb9..04206705 100644
--- a/lib/utils/timer/andes_plmt.c
+++ b/lib/utils/timer/andes_plmt.c
@@ -32,22 +32,6 @@ static u64 plmt_timer_value(void)
 #endif
 }
 
-static void plmt_timer_event_stop(void)
-{
-	u32 target_hart = current_hartid();
-
-	if (plmt.hart_count <= target_hart)
-		ebreak();
-
-	/* Clear PLMT Time Compare */
-#if __riscv_xlen == 64
-	writeq_relaxed(-1ULL, &plmt.time_cmp[target_hart]);
-#else
-	writel_relaxed(-1UL, &plmt.time_cmp[target_hart]);
-	writel_relaxed(-1UL, (void *)(&plmt.time_cmp[target_hart]) + 0x04);
-#endif
-}
-
 static void plmt_timer_event_start(u64 next_event)
 {
 	u32 target_hart = current_hartid();
@@ -67,6 +51,11 @@ static void plmt_timer_event_start(u64 next_event)
 #endif
 }
 
+static void plmt_timer_event_stop(void)
+{
+	plmt_timer_event_start(-1ULL);
+}
+
 static int plmt_warm_timer_init(void)
 {
 	if (!plmt.time_val)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
