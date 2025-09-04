Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABD8CA1002
	for <opensbi@archiver.kernel.org>; Thu,  4 Sep 2025 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UE1z7R5PBvX97+Fu3wE4NV8ebOmZYfqt+Yx8p7Bo+QY=; b=ZUzy1Xj+320H85
	jvTxttq71CFrpE05ugNKXNN7lQAON3t604DVuZQIu719prmz/Y13uvY5Zjoimb4VxHV1jzAejzITr
	r84EFDxYUDWl+Nh9WMCzkMisLY83OVwDYXsBwEVa7mWZB0qnHDH3VzodoPF1/+M5YF7+qxO4HgoHk
	gmHBfwEvZMSolgN4rJRYUfEbhhxeOcLNd0nOcdxyfJ/pWCy0iy/+jmwWSiyVdIqbChGER6dZWKm+m
	B0vXBcXUEN8SCSTxdf4D5DzYYeUZH/iBRR2T/fBO7/OrfYANLS0g5qQcgwE1fUudG/n5npOdwy8ei
	q7ZOYkwYWheTl1l6TuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7dy-0000000B2yo-4BVy;
	Thu, 04 Sep 2025 10:56:43 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6gJ-0000000AhP3-0GLy
	for opensbi@lists.infradead.org;
	Thu, 04 Sep 2025 09:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1756979695; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qUHxFwrDgKrdHE9LWIIUWoYdaYiYelRtIjBhff05XKs=;
	b=aIoSeNWHhblVseZFkaJ9Fh5rK9w1Z2OfMzyF+VhXUPhnS83t3vCWRHNAP6i9aYhWaF+6ZMVHZ9vIYqNur/2dFgYfmsfK+gAeMdcAGP8pSukYKFRH41nAUXTjE64M/mDeECiq+5vZNvXhBi0YIKZIqBWXztmY8KyII6odTgNXc4w=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WnFf8JT_1756979689 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 04 Sep 2025 17:54:54 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] lib: sbi: Flush cache entries after writing PMP CSRs
Date: Thu,  4 Sep 2025 17:54:47 +0800
Message-ID: <20250904095447.1885-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_025503_644276_483BEDC7 
X-CRM114-Status: GOOD (  12.70  )
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

The original implementation does not cover all possible cases. For
example, the sbi_hart_map_saddr function calls pmp_set but does not
execute the SFENCE.VMA instruction. This patch covers sbi_hart_map_saddr
and sbi_hart_unmap_saddr, ensuring that dbtr, sse and other modules can
safely update pmpcfg.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 lib/sbi/sbi_hart.c | 54 ++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6a2d7d6..33bba38 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -364,6 +364,30 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 	return pmp_flags;
 }
 
+static void pmp_flush(void)
+{
+	/*
+	 * As per section 3.7.2 of privileged specification v1.12,
+	 * virtual address translations can be speculatively performed
+	 * (even before actual access). These, along with PMP traslations,
+	 * can be cached. This can pose a problem with CPU hotplug
+	 * and non-retentive suspend scenario because PMP states are
+	 * not preserved.
+	 * It is advisable to flush the caching structures under such
+	 * conditions.
+	 */
+	if (misa_extension('S')) {
+		__asm__ __volatile__("sfence.vma");
+
+		/*
+		 * If hypervisor mode is supported, flush caching
+		 * structures in guest mode too.
+		 */
+		if (misa_extension('H'))
+			__sbi_hfence_gvma_all();
+	}
+}
+
 static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				struct sbi_domain *dom,
 				struct sbi_domain_memregion *reg,
@@ -543,18 +567,25 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 			     pmp_flags, base, order);
 	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
 
+	pmp_flush();
+
 	return SBI_OK;
 }
 
 int sbi_hart_unmap_saddr(void)
 {
+	int rc;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
 	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
-	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	rc = pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+
+	pmp_flush();
+
+	return rc;
 }
 
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
@@ -578,26 +609,7 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 		rc = sbi_hart_oldpmp_configure(scratch, pmp_count,
 						pmp_log2gran, pmp_addr_max);
 
-	/*
-	 * As per section 3.7.2 of privileged specification v1.12,
-	 * virtual address translations can be speculatively performed
-	 * (even before actual access). These, along with PMP traslations,
-	 * can be cached. This can pose a problem with CPU hotplug
-	 * and non-retentive suspend scenario because PMP states are
-	 * not preserved.
-	 * It is advisable to flush the caching structures under such
-	 * conditions.
-	 */
-	if (misa_extension('S')) {
-		__asm__ __volatile__("sfence.vma");
-
-		/*
-		 * If hypervisor mode is supported, flush caching
-		 * structures in guest mode too.
-		 */
-		if (misa_extension('H'))
-			__sbi_hfence_gvma_all();
-	}
+	pmp_flush();
 
 	return rc;
 }
-- 
2.49.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
