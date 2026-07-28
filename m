Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29C8C54F4D
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48QUcNSoZQ7+UPmnDsYyxIbtqhAa0rm6l7d1uKu7nh8=; b=ZAQbS+0/neh1tn
	+43geVQmCZm8N60RB9Y0b6wkFDLhDmLpxRKRkFE8HGWTcgr9rB6+M2hXb+fJzY7Eu8nAz3ls1sGHi
	Cx4KhVQW8D4oxf41/ln0tDfBmaxjFO2cR/poGjZm2RvcoeF+Eux/ja33dOjIq0FPrMwyrEanJO17e
	OnZ89dGpI2eq+iiW0+oeNUctXjpwr0VzqnH+80JT2+4JtdxVkuOZH6/ajI25MM51nGaKZXbBrarSN
	nCqCHgAU12YrPpMlmr4I67+3h7Fnza0l78ck/bDnG3o7dpcgVSGwx7tBjCXfnq4TCvrjR9HbvpqKy
	bTdVCH1rrXuz0pMeDb7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woctv-00000004gN0-0Qco;
	Tue, 28 Jul 2026 08:10:59 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woctr-00000004gMB-2MUX
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 08:10:57 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66S8AiFp069148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 16:10:44 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jul
 2026 16:10:44 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 1/7] lib: utils/cache: fix andes_llcache_enable() return value
Date: Tue, 28 Jul 2026 16:10:35 +0800
Message-ID: <20260728081041.2724668-2-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728081041.2724668-1-ben717@andestech.com>
References: <20260728081041.2724668-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66S8AiFp069148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_011055_945965_5AD75CD6 
X-CRM114-Status: UNSURE (   9.77  )
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

The driver returned 1 on success where callers expect 0, so the suspend
to RAM aborted right after disabling the LLC and before flushing it.

Fixes: 82b0961821e4 ("lib: utils/cache: add Andes last level cache controller")
Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 lib/utils/cache/fdt_andes_llcache.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/utils/cache/fdt_andes_llcache.c b/lib/utils/cache/fdt_andes_llcache.c
index 490503ee611c..a3a2d37feb82 100644
--- a/lib/utils/cache/fdt_andes_llcache.c
+++ b/lib/utils/cache/fdt_andes_llcache.c
@@ -102,7 +102,10 @@ static int andes_llcache_enable(struct cache_device *dev, bool enable)
 	}
 
 	llcache_ctrl = readl(ctrl_addr);
-	return enable == EXTRACT_FIELD(llcache_ctrl, LLCACHE_REG_CTRL_EN_MASK);
+	if (enable != EXTRACT_FIELD(llcache_ctrl, LLCACHE_REG_CTRL_EN_MASK))
+		return SBI_EFAIL;
+
+	return SBI_OK;
 }
 
 static struct cache_ops andes_llcache_ops = {
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
