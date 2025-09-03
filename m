Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03591CA0FF2
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 04:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVmgUEKwtO3FtYTXoEsrYQWpPNBnURPYAI1m2twipkU=; b=sQqsMNPQpy06np
	Vwrd+GOGDDGjjFTTPpZIiXahcLw6xcB7igyDxc+euf7KMZTucoh/mSVJmk/UX4YA1x0e35Z2YXLim
	gXJ7XY2dbPLmz/rHKm7KHg9AFquSLpMCAP89mfVzbRNhFwKVolaa/rkP4M6d3Mu4u8XOpuNt+/QOA
	gcVb81bNEC6/YxyENVP/vDukjYD5Et9q2iLy5uw34XW6vsQ1NhfLYTE6wMvBTB3GvTWP6zXSPHAMj
	mMJfiXxvf5v2pQZ4+hdlFKeDrtbnUZauP3prt7FQiB7WYc9lGA1uuLu/MCinpzulcoq3AChe/23Aw
	g+jKNuWdFohpfCctumlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfOP-00000003wbF-2dPd;
	Wed, 03 Sep 2025 04:46:45 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfOM-00000003wY4-0OXs
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 04:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7J
	zqBfLg7wm8JaYt5Vgg3287s94NDJ4t3aiXhT6lKfE=; b=ka6WXJacAOV/pOE1+I
	SsFJS/+5i6N4kXh6JnhKRsp1A8tAQf15kjUDLwJgCuaYBwnfXRYZUYzyjP1ZvcFk
	DzFMEY65DKc/V8NMHIzr4DOu2qI+FBLvAAcBmEc9Uxz3kLk7n162COl7PY3k5xoa
	v8DIIxuTXlReXJyZaAMbNuGAI=
Received: from T490.lan (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDX_5AdyLdoha5eCQ--.15985S5;
	Wed, 03 Sep 2025 12:46:24 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 3/3] lib: sbi: Prevent target domain same as the current
Date: Wed,  3 Sep 2025 12:46:04 +0800
Message-ID: <20250903044619.394019-4-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250903044619.394019-1-wxjstz@126.com>
References: <20250903044619.394019-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: PykvCgDX_5AdyLdoha5eCQ--.15985S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF47WFWfGw1xWryUCrykKrg_yoWfXrc_Ar
	1xAFZxKws8AFZFvwn2yrnIvr97ur4UAr1vq3srtFWDXFW2qw18tr15trn3XFyfAr4jqr9r
	CFnxCF1furyYvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjTUDJUUUUU==
X-Originating-IP: [2408:823c:b211:2a61:ded2:c9ec:9c16:bbca]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1xK9Omi3wPhUyAACs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_214642_449231_71839264 
X-CRM114-Status: UNSURE (   7.44  )
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, Anup Patel <anup@brainfault.org>, Chao-ying Fu <cfu@mips.com>, Qingyu Shang <2931013282@sjtu.edu.cn>, Alvin Chang <alvinga@andestech.com>, Xiang W <wxjstz@126.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add error handling code to sbi_domain_context_enter to prevent the
target domain from being the same as the current domain.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain_context.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 992aad35..eead3987 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -191,6 +191,9 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
 	struct hart_context *dom_ctx;
 	struct hart_context *ctx = hart_context_thishart_get();
 
+	/* target domain must not equal current domain */
+	if (!dom || dom == sbi_domain_thishart_ptr())
+		return SBI_EINVAL;
 	/*
 	 * If it's first time to call `enter` on the current hart, no
 	 * context allocated before. Allocate context for each valid
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
