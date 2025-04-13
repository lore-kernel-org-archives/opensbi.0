Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2FFC3601E
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxLnyoM48hHeuEXpDX3ty0MUJ8FbG154eP97a1T/Ldc=; b=WDFyrEKOY5WCUK
	YvMVRc4aeJgyBG8zHzenBxFlOrkWs4jRi7IS64u1k1ol6hdp+dhefI/79X71tv/0ihtfro/Ld7frm
	OvgoeTWrH3wGX9yQSsTRwa/pDPNO+658WNmUSU42lBb/msRm1uEPApjsE202WjRXDnavMNoYXZvKe
	1a3Bt5HNQdYnnPZfcGNnZcuzEnF1ChZkSb1r89EPAlTfDtXY8YoiqYw7YefOZfNyRu2e8dtBNdhjl
	WK+0nf8BWURzN9SRe88gadPE4bFbu2JgiWuSECepy+ECJQXW3fll++FOebDTIc3swkhRSA/Su6mgP
	hQjHlhmAyqd/p84KIvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yv4-0000000HIiD-1yEF;
	Sun, 13 Apr 2025 15:06:50 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yuz-0000000HIfs-22e1
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 15:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=saSTr
	RlpdNfV8PAxuK3IpgVoKmedtQ6mayJi1f0nLz4=; b=Jl55MQzUm0oGK4R5fMIE3
	126/eWuxRsHVGeeLSLrCG5VvcprgPSjfbCmxCpjYq+I12LJ9V46wJxs1ZMCAN4XG
	ZGO3EwXtCBAenktVtWpXmq3g2PupzGuBYJp2zmeyfIiWMWPiHgFiJT7fbVXnrL/x
	xrz9WRxmtNjFE1Z1ehsleE=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P+H30vtnZUv4Aw--.52201S4;
	Sun, 13 Apr 2025 23:06:34 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 2/5] lib: sbi: Add error message for sbi_timer_event_start
Date: Sun, 13 Apr 2025 23:06:17 +0800
Message-ID: <20250413150628.75614-3-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250413150628.75614-1-wxjstz@126.com>
References: <20250413150628.75614-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P+H30vtnZUv4Aw--.52201S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW5JFW5Ar15Gr1xtF4DCFg_yoW3KrXEka
	40va4vgFZ5JFZrt3y5tw1qq3y2kw4xKa18ur47JrZFkFWrtF4DAr1UAw1DuFy8Zan0gF1D
	twsxGFyIqF1F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNdb1UUUUUU==
X-Originating-IP: [112.83.182.169]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1xkuOmf7x0Dt8gABsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_080645_875577_502B39A6 
X-CRM114-Status: UNSURE (   6.29  )
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

Added error message output when no timer device is available.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_timer.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 7ad12bff..14e5ee46 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -145,11 +145,17 @@ void sbi_timer_event_start(u64 next_event)
 #else
 		csr_write(CSR_STIMECMP, next_event);
 #endif
-	} else if (timer_dev && timer_dev->timer_event_start) {
+		return;
+	}
+
+	if (timer_dev && timer_dev->timer_event_start) {
 		timer_dev->timer_event_start(next_event);
 		csr_clear(CSR_MIP, MIP_STIP);
 		csr_set(CSR_MIE, MIP_MTIP);
+		return;
 	}
+
+	sbi_printf("%s: called without timer device\n", __func__);
 }
 
 void sbi_timer_process(void)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
