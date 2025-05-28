Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DA4C5AE59
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 05:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9DYzbsOpmT+FbY/MFWOUwlH5BnLrU/AchP56y0L90M=; b=RcyaCO0FZwd3d6
	Fz9KUyqHcNUatYJJ+ALhVc8MMnYliFIpW4Q5cF5qQaCxtv0KR51YmBauwQF/gooTeg0xSXERGp4wW
	2qZq7NDzKpnBGZDjR2H8D6adkvULabpKY5qNKDDsC2FHNvewiHxuYylXhk/9P7a/KlXNfac4qQofQ
	hQ9C8ArtgsdIaoCYx0W6wc3eBEqZWvLZDTAIvEVwllOA7+9ADOdKhq8PqvcLgIN/7n1Xy/hGUc3Up
	0uqOuAoEd+2UWf7jZ5ozVNDHguFMwq4tcENeOE6rhdRKl5zekJ9z9MeD/dSKiv3TXcdwB29Ff3BV+
	zSbMxB5v7LOC3afRJ6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9k5-0000000CEve-2Asp;
	Wed, 28 May 2025 05:54:21 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9jy-0000000CEsO-2EaL
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 05:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ke
	l7ZEoi7GXsSHf8crrNHTMOUO5XRFfrv52HpeCc3Us=; b=azmVE93zpIX6VR3OWZ
	GyfT7e1+bm+gh8Zwy1OpRdpJ9c1eYn8FryVC9Mo8vKYtx24MYvHy+BhYzhAHTMod
	FjD0SXw1SLwrSSNQEJZOfmkzlSpYeFkKkQ7eytF4cF8h9I+I/U9zoeOW8KfQvZoG
	CAeRgqzE7xVRd0V9JQcYGvR1M=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX_5j3pDZo96cmAw--.22074S4;
	Wed, 28 May 2025 13:54:01 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 2/4] lib: sbi: Add error check for sbi_timer_waitms_until
Date: Wed, 28 May 2025 13:53:51 +0800
Message-ID: <20250528055356.547392-3-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528055356.547392-1-wxjstz@126.com>
References: <20250528055356.547392-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_5j3pDZo96cmAw--.22074S4
X-Coremail-Antispam: 1Uf129KBjvJXoWruryDtFW5CF48urWrJFyDtrb_yoW8Jryfpr
	sIgasxKrWSqF4Igw10qw1kXF95JF1rJry8Ar97Gr40yw4xJ3s5XFyUtr1qqFW3GF9FqFyI
	qFyruF15Kr1UX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziknY7UUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5ABbOmg2mIjpDgABst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_225414_929918_928CFC5B 
X-CRM114-Status: UNSURE (   8.32  )
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

sbi_timer_value may always return 0 when there is no suitable device,
which may cause sbi_timer_waitms_until to fall into an infinite loop.
Add error handling to prevent this from happening

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_timer.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 3530a005..e13d6161 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -79,12 +79,18 @@ void sbi_timer_delay_loop(ulong units, u64 unit_freq,
 bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
 			    uint64_t timeout_ms)
 {
-	uint64_t start_time = sbi_timer_value();
-	uint64_t ticks =
-		(sbi_timer_get_device()->timer_freq / 1000) *
-		timeout_ms;
+	u64 start_time, ticks;
+
+	/* Do nothing if we don't have timer device */
+	if (!timer_dev || !get_time_val) {
+		sbi_printf("%s: called without timer device\n", __func__);
+		return false;
+	}
+
+	start_time = get_time_val();
+	ticks = (timer_dev->timer_freq / 1000) * timeout_ms;
 	while(!predicate(arg))
-		if (sbi_timer_value() - start_time  >= ticks)
+		if (get_time_val() - start_time  >= ticks)
 			return false;
 	return true;
 }
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
