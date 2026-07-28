Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704FDC54F52
	for <opensbi@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J47VvTNaqN+Ktv/PDYWILqLeddmqnNdhfKKoaKxoj4M=; b=rtkIIcLR+ufqs5
	OBCD4pg8C1Ya7hx60jet4UcUY+SPonyIyMPw3pPhv3S583sxYGgHf5+el7VguaRn7xoCl5zuCKtcU
	/F+ekbB26W6PSJy0awlpL9N9htNXhL3cubb+151wHLkKcFpkz1W6s7mCGnigmeJ3rRoPUZxFHRdD/
	bcSeIhQxDZ9lAaxX9lwBnBSLsKyKSgN2cLYupG0200OU6lSoTqjZqs6X/LF7Asg+wlSs2XTJEDAEs
	uUwI7bGZiQjrW2/JAG0osV3Aod+UPH3Pc1cT/RGWKoUkqUKT9BcY7CXeoppGB3WwdT2wOKJs0HyHa
	L7laltI11rz+kM6gZY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocty-00000004gOU-0jbY;
	Tue, 28 Jul 2026 08:11:02 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woctv-00000004gMk-1TeG
	for opensbi@lists.infradead.org;
	Tue, 28 Jul 2026 08:11:00 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66S8AjMH069149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Tue, 28 Jul 2026 16:10:45 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jul
 2026 16:10:45 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 2/7] lib: utils/andes: add the SMU and LLC registers to the root domain
Date: Tue, 28 Jul 2026 16:10:36 +0800
Message-ID: <20260728081041.2724668-3-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728081041.2724668-1-ben717@andestech.com>
References: <20260728081041.2724668-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66S8AjMH069149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_011059_749869_C2110F75 
X-CRM114-Status: GOOD (  14.54  )
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

When a hart implements Smepmp, S-mode and U-mode cannot reach either
device unless its region is shared explicitly. Suspend and resume then
take an access violation as soon as the supervisor touches the SMU or
the LLC.

Share both regions, and take their sizes from the DT nodes rather than
ignoring them.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 lib/utils/cache/fdt_andes_llcache.c  | 18 +++++++++++++++---
 lib/utils/hsm/fdt_hsm_andes_atcsmu.c | 17 +++++++++++++----
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/lib/utils/cache/fdt_andes_llcache.c b/lib/utils/cache/fdt_andes_llcache.c
index a3a2d37feb82..7a61b6abe481 100644
--- a/lib/utils/cache/fdt_andes_llcache.c
+++ b/lib/utils/cache/fdt_andes_llcache.c
@@ -5,8 +5,11 @@
  */
 
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi_utils/cache/fdt_cache.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/hsm/fdt_hsm_andes_atcsmu.h>
@@ -116,13 +119,13 @@ static struct cache_ops andes_llcache_ops = {
 static int andes_llcache_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	int rc;
-	u64 llcache_base = 0;
+	u64 llcache_base = 0, size;
 	struct andes_llcache *llcache;
 	struct cache_device *dev;
 	uint32_t llcache_cfg;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &llcache_base, NULL);
-	if (rc < 0 || !llcache_base)
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &llcache_base, &size);
+	if (rc < 0 || !llcache_base || !size)
 		return SBI_ENODEV;
 
 	llcache = sbi_zalloc(sizeof(*llcache));
@@ -151,6 +154,15 @@ static int andes_llcache_probe(const void *fdt, int nodeoff, const struct fdt_ma
 		llcache->status_core_stride = 4;
 	}
 
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SMEPMP)) {
+		rc = sbi_domain_root_add_memrange(
+			(unsigned long)llcache->base, (unsigned long)size, PAGE_SIZE,
+			SBI_DOMAIN_MEMREGION_MMIO |
+			SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW);
+		if (rc)
+			return rc;
+	}
+
 	/* Wait for the hardware initialization done */
 	while (!andes_llcache_init_done(llcache))
 		;
diff --git a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
index 115916d5b99e..ae1d88892f14 100644
--- a/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
+++ b/lib/utils/hsm/fdt_hsm_andes_atcsmu.c
@@ -184,18 +184,27 @@ static const struct sbi_hsm_device hsm_andes_atcsmu = {
 static int hsm_andes_atcsmu_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	int poff, rc;
-	u64 addr;
+	u64 addr, size;
 
 	/* Need to find the parent for the address property  */
 	poff = fdt_parent_offset(fdt, nodeoff);
 	if (poff < 0)
 		return SBI_EINVAL;
 
-	rc = fdt_get_node_addr_size(fdt, poff, 0, &addr, NULL);
-	if (rc < 0 || !addr)
+	rc = fdt_get_node_addr_size(fdt, poff, 0, &addr, &size);
+	if (rc < 0 || !addr || !size)
 		return SBI_ENODEV;
-	atcsmu_base = addr;
 
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SMEPMP)) {
+		rc = sbi_domain_root_add_memrange(
+			(unsigned long)addr, (unsigned long)size, PAGE_SIZE,
+			SBI_DOMAIN_MEMREGION_MMIO |
+			SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW);
+		if (rc)
+			return rc;
+	}
+
+	atcsmu_base = addr;
 	sbi_hsm_set_device(&hsm_andes_atcsmu);
 	return 0;
 }
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
