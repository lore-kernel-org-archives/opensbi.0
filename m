Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDE1C71157
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdlfCdsEHaBItELHYJGAWgLahV9WJUZuFMkLxmEQBy4=; b=jVl5JMrVXEWGUN
	ixN/mW8OcybGB9trg/Kw6pF9ZM5NwdRX33a5zm7i84cxyrDHYFAfdTbX+heSYJINDqpxtM5HYNykK
	wBg2lG2XXTiBE0apSPab7CifZS8fpgNzdyijLmyPlGL+qgp9IXNNXtkH60VoV741rn01vt6dzeOBn
	yX96nA2qjHoDuWG+ST/qrELJKmL7nP1hH4tOzOA2qvwTucqWhBxCk+pDs+axQMn9XBwwnLxDp1ZtK
	8c0L4gmunjtcXnbI7T4OqSBE5lv8mDw0CKNAFBuks7i/ihcl9tIsJZ0js62gUnDnl8anvycPI8+Xn
	YHlBDXn3L7kpV+u0Uo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyk-0000000H605-146n;
	Sat, 21 Jun 2025 04:37:22 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSplB-0000000H50J-06lv
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hq
	a2j1F44hb3z+GgggIGM/vvKikm4mA8XmxDnKFGjqw=; b=eUFMGkbV6eaMgCrBrl
	ig9vgQo0AiaZzZXtAyIfO0cbqGoSaWWJjtoo+CGE1/L8aMroDuX5rZxR3NVOE5Ml
	NfTP7sb4Lark891fwId9sJDHW+64173DcsLrAibWe2gxoJUajcH5jdEdI0r9ldEX
	ZdfzwjDxeQkDYLN+sEMXFdE5k=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S11;
	Sat, 21 Jun 2025 12:23:12 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 9/9] lib: sbi: Add sbi_double_trap_init to init_warm_startup
Date: Sat, 21 Jun 2025 12:22:57 +0800
Message-ID: <20250621042302.160802-10-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S11
X-Coremail-Antispam: 1Uf129KBjvdXoW5KFyfKw15JryUKFW7ZF4Utwb_yoWxXrg_Zr
	yxZw1kKFsxWa1qqw1jyr13Jry0kwsYq3W8Xry7trs8Gr4IyrZ8Jry8Krnag3Z8WFy2vFyq
	ganrWrW8Zr9I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRGAp0JUUUUU==
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5BJzOmhWMwUHpgAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212321_363636_FDB6226C 
X-CRM114-Status: UNSURE (   6.04  )
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
be registered. So Add sbi_double_trap_init to init_warm_startup.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5c017cda..b64916fd 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -416,6 +416,8 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
+	sbi_double_trap_init(scratch);
+
 	rc = sbi_irqchip_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
