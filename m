Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C37BF9EDF3
	for <opensbi@archiver.kernel.org>; Wed, 22 Apr 2026 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PJYs5YyTVuTvXYunUDt3CLAqMQXfXkeifOhdxZ9eGoY=; b=qbajq1pg8qj+Od
	SfwMak3HLAnS9k2WTWuTIBUr+juYEGP2AjMsKM3LvehKHaAokjAi6IuOD3J3pe0tOuvxBYNEPCTJg
	vnx1/3qhShzHbtdj/6an+6YRWXAYAJLo9Tu6rl1u5ZKmOHK7bWKrpYzWEbuCUeopDeBgk+/DhGDPa
	xN98HAepAeqHxXHE9gc3C03WfV//jtyBApiYVJppefRDE6kWKsfCIgi/sEFcfeb1UBmAx7MAlSD4G
	0wUZK1gVLKs80xYJrQ8LGvRn+1Po/bjU+2sN3v/RSf6IAcG0qfpgqFRnFol7DWVyyTVkQj8d7XUvP
	AL7f7Cq9r7P2dCY7LhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZLA-0000000AQZk-25Yx;
	Wed, 22 Apr 2026 15:18:12 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZL4-0000000AQVi-2Yp7
	for opensbi@lists.infradead.org;
	Wed, 22 Apr 2026 15:18:11 +0000
Received: from 3930813e24e9.home.arpa (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAnRNug5uhpD1rgDg--.1140S2;
	Wed, 22 Apr 2026 23:17:55 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi_domain: reject zero-size and overflowing ranges in sbi_domain_check_addr_range
Date: Wed, 22 Apr 2026 23:17:50 +0800
Message-Id: <20260422151750.3794520-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnRNug5uhpD1rgDg--.1140S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKF4DAF1xtF4ftr4rCr18AFb_yoW8JF45pF
	W3K3WUXrZ29r10yw1DKa4Fga40k3y0qw4jkay3AFZ3tw1kZr97CryrXa4q9w17ZFyfA3Wa
	va47Zrs8Zr45uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkI14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5WwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUUuHq7UUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_081807_029018_D74783DC 
X-CRM114-Status: UNSURE (   8.42  )
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

`max = addr + size` is computed without overflow detection, and a
size of zero is not rejected. In both cases the `while (addr < max)`
loop executes zero times and the function falls through to
`return true` without actually checking any region against the
domain configuration.

Reject size == 0 and detect unsigned overflow of addr + size before
entering the loop.

Fixes: eab48c33a12d ("lib: sbi: Add sbi_domain_check_addr_range() function")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
Apologies for the earlier non-standard submission; resending as a
proper patch per docs/contributing.md.

 lib/sbi/sbi_domain.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 7030848d..74a02057 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -499,12 +499,17 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 				 unsigned long mode,
 				 unsigned long access_flags)
 {
-	unsigned long max = addr + size;
+	unsigned long max;
 	const struct sbi_domain_memregion *reg, *sreg;
 
 	if (!dom)
 		return false;
 
+	if (!size || (addr + size) < addr)
+		return false;
+
+	max = addr + size;
+
 	while (addr < max) {
 		reg = find_region(dom, addr);
 		if (!reg)
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
