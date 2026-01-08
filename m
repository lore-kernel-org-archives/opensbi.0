Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898F3D1D478
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FTcSUYWDsmW5DnJvLgUU3+jOENmPLu+dnRHe/3KY5ao=; b=S464k5h4hVZBh3
	MW4AkCKj3ANz7cC6H3B12wswQXIgOIiwJwUBv7lboUAWBXfLR7b4OZiEnjWN/gREXwHHZ5XEA2623
	tDq7G8Ntjgy2dUzpwsg3l738eaQhy21LoJourGZA+0jvxFj35p1Y0EIh4MafJ64rC6UeuwaydQVZb
	ulcjlbD4AeRAc0azXb9/i8G0UHyzvacmHHZ1sXFV+FTvxlEBKuSPYeUFhhLbRmTexiNmd21g9MgZm
	E8qlpXyWjqMC2tQQHuE+9rGfrl39pVyzUJPcHonODmTRFqBJ4jZMKTRH7oMS8ZHu4ii67GmToIFle
	Cu8uoYuJ7Aqvw+HWVu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsUV-000000003Bn-47uJ;
	Thu, 08 Jan 2026 16:04:03 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsUS-000000003A3-1gxF
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 16:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pE
	GOugoIxnKmsU1AkyPFwhbwGF39gJMegqxYySy/YM0=; b=DX9bM2YETR/m60y3BV
	1o6kbCHCs+OOsNr9s9Zmj3zGYUMvwg03a7U0eCONt1UbT+7B6+D9k92o0/ulwT0h
	7UzMLOW5rVjCFsqHFFf+HIGyG7kQa8BiBHHN6TzNXGvz/UYRHhKIElXhEH46wkUO
	EuPTF/s+MeaKIU6VXsfCCqw7Q=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3t7NP1V9pxHU3Bg--.16361S2;
	Fri, 09 Jan 2026 00:03:28 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	thomas.perrot@bootlin.com,
	daniel.barboza@oss.qualcomm.com,
	Xiang W <wxjstz@126.com>,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [PATCH] lib: sbi: warning when PMP is not present.
Date: Fri,  9 Jan 2026 00:03:16 +0800
Message-ID: <20260108160316.912497-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: _____wD3t7NP1V9pxHU3Bg--.16361S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw13Kw13uw1fJr15uw1xXwb_yoWkurb_Aa
	48Zwn5GwsIqw4DZ3Wayr43KFWj9rsYq3W0gF1Uta9xJr43t3y5JF1ktFs3ZF4kWF9Fyry2
	kwsxuF4xAr43WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR6OGe7UUUUU==
X-Originating-IP: [61.170.160.17]
X-CM-SenderInfo: pz0m23b26rjloofrz/xtbBpBC79Wlf1VDosQAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_080401_063533_6DB10E4B 
X-CRM114-Status: UNSURE (   8.07  )
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

We need to output a warning message if PMP is not present.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/sbi/sbi_hart_protection.c | 2 +-
 lib/sbi/sbi_init.c            | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index fbebfd1a..1965eb20 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -54,7 +54,7 @@ int sbi_hart_protection_configure(struct sbi_scratch *scratch)
 	struct sbi_hart_protection *hprot = sbi_hart_protection_best();
 
 	if (!hprot)
-		return 0;
+		return SBI_ENODEV;
 	if (!hprot->configure)
 		return SBI_ENOSYS;
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5259064b..34880b5f 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -397,7 +397,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc) {
 		sbi_printf("%s: hart isolation configure failed (error %d)\n",
 			   __func__, rc);
-		sbi_hart_hang();
+		if (rc != SBI_ENODEV)
+			sbi_hart_hang();
 	}
 
 	count = sbi_scratch_offset_ptr(scratch, init_count_offset);
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
