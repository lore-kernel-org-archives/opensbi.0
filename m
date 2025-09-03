Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900F8CA1007
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 04:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kx96zV8ISBVdpi2P3FDC8dcvCduqSWwtLFUJGzEQHwY=; b=DUitkNICQuQpYw
	qMM8+/HJWP7uQAK8OD/zaEeUdWkuOk/ShVaFO5mDZhm1M5okXJjmWznQXRguNZ5IOZQbRCy5xE1NT
	i+hMnZyTC+MaCvDHNknu1kXIeeJhd0S10BvAyaEw5dWadVr1XZozPiWPrT1l53ihq3HjUQ/rPq8uv
	wLUbHN+568z1WbocO7EPsRpa+x96tGkzst8PbmKk8Pz4wqqZ19jei5BM7tU9gJrZlWX0g2ZbVyepv
	eBNbHfuCe5fV1uJ9kjGJBI5ySwIomu0mO6dxUj0EEMdRifsFVDfG2mgKl+P3r84abKAQrpY5Wgnu1
	Q4Ns6QPY0aqn01pXqUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfOQ-00000003wbO-0Bz2;
	Wed, 03 Sep 2025 04:46:46 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfOM-00000003wY5-04xH
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 04:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tj
	dGze9AJ+OyyTx/W1Us6sIdfERxoSqU1yu1x3weoN0=; b=YHEXXddA0ovCbqj9/m
	cm6QCjD7nyfhHqoHIAYsVeFh11NJdvFzj6Q9xn0DIZRxWrU/kRD3Z57KxulIyNg+
	q82hjf25B6d6ttCcu2JZQkzP23Kc1jI6MpDeHWfMPGH3+XnicmHSAs+sp7OWwX2W
	1v7AFz0j019Zowji++TchO+l0=
Received: from T490.lan (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDX_5AdyLdoha5eCQ--.15985S3;
	Wed, 03 Sep 2025 12:46:23 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 1/3] lib: sbi: Add error handling to switch_to_next_domain_context
Date: Wed,  3 Sep 2025 12:46:02 +0800
Message-ID: <20250903044619.394019-2-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250903044619.394019-1-wxjstz@126.com>
References: <20250903044619.394019-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: PykvCgDX_5AdyLdoha5eCQ--.15985S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryfuryDKF1xZw17Xw4UCFg_yoW5JF4DpF
	1UGF1xZrs2qF42va4DCa1qv34akrW8t3WUK3sxK3s7JrW0yr98Gr1Utw1YvryUZFyxXr1Y
	yF4qyFW7ua1SyFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4OJ5UUUUU=
X-Originating-IP: [2408:823c:b211:2a61:ded2:c9ec:9c16:bbca]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFxK9Omi3uajGFQAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_214642_449569_3202CA10 
X-CRM114-Status: GOOD (  10.90  )
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

Add error handling to switch_to_next_domain_context to ensure
legal input. When switching contexts, ensure that the target to
be switched is different from the current one.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain_context.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index fb04d81d..fffb6a48 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -92,17 +92,23 @@ static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
  *
  * @param ctx pointer to the current HART context
  * @param dom_ctx pointer to the target domain context
+ *
+ * @return 0 on success and negative error code on failure
  */
-static void switch_to_next_domain_context(struct hart_context *ctx,
+static int switch_to_next_domain_context(struct hart_context *ctx,
 					  struct hart_context *dom_ctx)
 {
 	u32 hartindex = current_hartindex();
 	struct sbi_trap_context *trap_ctx;
-	struct sbi_domain *current_dom = ctx->dom;
-	struct sbi_domain *target_dom = dom_ctx->dom;
+	struct sbi_domain *current_dom, *target_dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
+	if (!ctx || !dom_ctx || ctx == dom_ctx)
+		return SBI_EINVAL;
+
+	current_dom = ctx->dom;
+	target_dom = dom_ctx->dom;
 	/* Assign current hart to target domain */
 	spin_lock(&current_dom->assigned_harts_lock);
 	sbi_hartmask_clear_hartindex(hartindex, &current_dom->assigned_harts);
@@ -156,6 +162,7 @@ static void switch_to_next_domain_context(struct hart_context *ctx,
 		else
 			sbi_hsm_hart_stop(scratch, true);
 	}
+	return 0;
 }
 
 int sbi_domain_context_enter(struct sbi_domain *dom)
@@ -170,9 +177,7 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
 	/* Update target context's previous context to indicate the caller */
 	dom_ctx->prev_ctx = ctx;
 
-	switch_to_next_domain_context(ctx, dom_ctx);
-
-	return 0;
+	return switch_to_next_domain_context(ctx, dom_ctx);
 }
 
 int sbi_domain_context_exit(void)
@@ -226,9 +231,7 @@ int sbi_domain_context_exit(void)
 	if (!dom_ctx)
 		dom_ctx = hart_context_get(&root, hartindex);
 
-	switch_to_next_domain_context(ctx, dom_ctx);
-
-	return 0;
+	return switch_to_next_domain_context(ctx, dom_ctx);
 }
 
 int sbi_domain_context_init(void)
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
