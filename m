Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490BEFCE069
	for <opensbi@archiver.kernel.org>; Thu, 26 Feb 2026 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoaWO+YIhurYQYWus5z3zHOJNzxK4wtDcv5SLy4yMYM=; b=e8ujVsxc/7PgV9
	tlSozN5+a2aHyGMJMT2S2vMHXjQJewlZnOzrpY0jHB4n6CO18eCXBSGvIFncKMThZ2SZOtWMEPz6V
	wsDmt5QwM0S0iT6ILX3Q8j8bzSI767z1gf/XwSkRyy6lfqHnsZZKJBBsh02QAxvLOrL2XFGlTSShD
	Vf1qFGvW10Rt++KhnSgHQ4oIqtY3knfh0OX3TffinKmCsw1GAyksqbinUIV4GHDZ3OGAgPERwAaK8
	1pVqhoHyj8IaWa6C/CESPD/hiSuKKT4fCV2696dOM3E7wlgJVtgwEJBckkdRoyA+Bf+htggr3WJ28
	bMpmQd8QeOGT1RJtq+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaa1-0000000680z-0uIH;
	Thu, 26 Feb 2026 12:34:57 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaZw-000000067z4-49mo
	for opensbi@lists.infradead.org;
	Thu, 26 Feb 2026 12:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772109287; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Po9cD3U9BKlEPmrx7tVPZppbpQJHQj3g4NE5CgEuS28=;
	b=gdfu6fpXgajL/aIGvLohIM93iwM0Lco7XV+eISigTUIIDN8BzEVimWutqFWpFVGTmjMsksF39w3iTTfCzfJzNFhcH9VBuHFUwYHNx/qvgf7O8W3UReCbTIuniIbdr38Kuy+DbyAJiWGBQ4eNdvMrymwpJyZE7/83+wETvbSyeeo=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WzrCT6-_1772109280 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Feb 2026 20:34:40 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	samuel.holland@sifive.com,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH v2 2/2] lib: sbi: Flush cache entries after writing PMP CSRs
Date: Thu, 26 Feb 2026 20:34:08 +0800
Message-ID: <20260226123408.1597-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226123408.1597-1-cp0613@linux.alibaba.com>
References: <20260226123408.1597-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_043453_244758_6EE1CB82 
X-CRM114-Status: UNSURE (   8.44  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

As the privileged specification states, after writing to the PMP CSRs,
a SFENCE.VMA or HFENCE.GVMA instruction should be executed with rs1=x0
and rs2=x0 to flush all address translation cache entries.

Considering the performance issues caused by flushing all address
translation cache entries, sbi_hart_pmp_fence_vma is used.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 lib/sbi/sbi_hart_pmp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 80407110..dc7f61fb 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -270,14 +270,21 @@ static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
 			     pmp_flags, base, order);
 	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
 
+	sbi_hart_pmp_fence_vma(addr, size);
+
 	return SBI_OK;
 }
 
 static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
 				       unsigned long addr, unsigned long size)
 {
+	int ret;
+
 	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
-	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	ret = pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	sbi_hart_pmp_fence_vma(addr, size);
+
+	return ret;
 }
 
 static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
@@ -333,6 +340,8 @@ static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
 		sbi_platform_pmp_disable(sbi_platform_ptr(scratch), i);
 		pmp_disable(i);
 	}
+
+	sbi_hart_pmp_fence_all();
 }
 
 static struct sbi_hart_protection pmp_protection = {
-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
