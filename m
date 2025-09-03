Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D463CCA100C
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 04:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LH/VkYW4Wpxw3h1wrZAOD9nB+44CdqFrr9IyGv3NI1I=; b=MRvJtxPucDYfdL
	vKd8jYMPmXvmVdLDk8APjW4crDeZscq8sM8tNE3wL8ktnxhbjP0ahgqzdnhHDS8GA81LYp+YtwO/V
	jpWRciKZy+mZDDbeDxxgS8FdkAthHeX9GDisXsQGX1cXFjDLepfAYoCI6ip0/H+5dOaqaI13zHdPA
	urawRzNEQO/B8+ymk2fYhDLbuGHmerKQdklEJujrHWxkHKNlc4OGuEN5Fn30lMJt+25svYp5R+5F8
	l91pi21M++kn4ttY4TO8i+jJVKpwMYRZbnl23ry6uBJNDhueMe5214jj+QiFa+TWetzu88lsWadN0
	QsYIiWih+irepBABpz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfOQ-00000003wbZ-211c;
	Wed, 03 Sep 2025 04:46:46 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfOM-00000003wY6-2rlp
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 04:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0r
	Bng5APITtT/CKbWB8NbzkOHVyBZYFytEZwAl/BwJ0=; b=cSv18FlMPrYEaq7eRl
	WMgjgAuRGkHzHGxXeaSyL7dcDbIDjMMXFM3TmnKpn2VITK2nLjoR5Zje+g97Q+ui
	uFmHv+aoEZJP1a0+QK6mw8my6tK2a1DJkKd6R4qdU95iQ8Y/EQ+nCVBIYMEY+NFl
	GITLeGozRSJ8ezkBXXB/xLy4Y=
Received: from T490.lan (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDX_5AdyLdoha5eCQ--.15985S4;
	Wed, 03 Sep 2025 12:46:23 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 2/3] lib: sbi: Add hart context init when first call enter
Date: Wed,  3 Sep 2025 12:46:03 +0800
Message-ID: <20250903044619.394019-3-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250903044619.394019-1-wxjstz@126.com>
References: <20250903044619.394019-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: PykvCgDX_5AdyLdoha5eCQ--.15985S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW8uFWrCF1kuw1kKr1Utrb_yoW5GFW3pF
	1UGFnayr4qqFyfZ3Z0ya1Ivryak3y8t3W8G3sIyw1fAryFkryDGr1Utw1YyryDZFy8ZFyY
	yr4qqF47W3Waya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxR67UUUUU=
X-Originating-IP: [2408:823c:b211:2a61:ded2:c9ec:9c16:bbca]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5AK9Omi3twjrJwAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_214643_025971_41800AF2 
X-CRM114-Status: GOOD (  12.06  )
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

When entering sbi_domain_context_enter for the first time, the hart
context may not be initialized. Add initialization code.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain_context.c | 58 +++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index fffb6a48..992aad35 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -165,11 +165,48 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	return 0;
 }
 
+static int hart_context_init(u32 hartindex)
+{
+	struct hart_context *ctx;
+	struct sbi_domain *dom;
+	sbi_domain_for_each(dom) {
+		if (!sbi_hartmask_test_hartindex(hartindex,
+						 dom->possible_harts))
+			continue;
+
+		ctx = sbi_zalloc(sizeof(struct hart_context));
+		if (!ctx)
+			return SBI_ENOMEM;
+
+		/* Bind context and domain */
+		ctx->dom = dom;
+		hart_context_set(dom, hartindex, ctx);
+	}
+	return 0;
+}
+
 int sbi_domain_context_enter(struct sbi_domain *dom)
 {
+	int rc;
+	struct hart_context *dom_ctx;
 	struct hart_context *ctx = hart_context_thishart_get();
-	struct hart_context *dom_ctx = hart_context_get(dom, current_hartindex());
 
+	/*
+	 * If it's first time to call `enter` on the current hart, no
+	 * context allocated before. Allocate context for each valid
+	 * domain on the current hart.
+	 */
+	if (!ctx) {
+		rc = hart_context_init(current_hartindex());
+		if (rc)
+			return rc;
+
+		ctx = hart_context_thishart_get();
+		if (!ctx)
+			return SBI_EINVAL;
+	}
+
+	dom_ctx = hart_context_get(dom, current_hartindex());
 	/* Validate the domain context existence */
 	if (!dom_ctx)
 		return SBI_EINVAL;
@@ -182,6 +219,7 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
 
 int sbi_domain_context_exit(void)
 {
+	int rc;
 	u32 hartindex = current_hartindex();
 	struct sbi_domain *dom;
 	struct hart_context *ctx = hart_context_thishart_get();
@@ -193,21 +231,13 @@ int sbi_domain_context_exit(void)
 	 * its context on the current hart if valid.
 	 */
 	if (!ctx) {
-		sbi_domain_for_each(dom) {
-			if (!sbi_hartmask_test_hartindex(hartindex,
-							 dom->possible_harts))
-				continue;
-
-			dom_ctx = sbi_zalloc(sizeof(struct hart_context));
-			if (!dom_ctx)
-				return SBI_ENOMEM;
-
-			/* Bind context and domain */
-			dom_ctx->dom = dom;
-			hart_context_set(dom, hartindex, dom_ctx);
-		}
+		rc = hart_context_init(current_hartindex());
+		if (rc)
+			return rc;
 
 		ctx = hart_context_thishart_get();
+		if (!ctx)
+			return SBI_EINVAL;
 	}
 
 	dom_ctx = ctx->prev_ctx;
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
