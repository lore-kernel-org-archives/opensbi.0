Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13051606A31E
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QIFVnX7H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wmNIwM/aD7fQwxrtCCky8pH4Q7xS0iAFt3KiDn7j2OU=; b=QIFVnX7Hy8uqlYJMPE1eQVId45
	j0ewWP2eyQPzQgQx3gX5NT548ow3Qtbtt8dcMXT6CGO99YGKoai1NBvN9Xw52O5QeAc4VVkfH3Jic
	DqHSkG49DeueDcKykiR6JQ5LWnToM5pHiYCsfJFx0jrHGLKbYtP+1Ak/1QKZT0CfEmgpAvosg2ad/
	i9CX67Lq7NP0+jFi07QjhIdXDf+a4/bJV9+yfn672Y3fiZLVcWHI93xeXbgP8E+l7uj5fgv6PZfhR
	mFhT5+CSy+ylUErY6dA40U4ruukQFLhMW2eso0HpnjDC2G5BcgjEoGlZ9v0L603Yq7rHyiTRYTNRo
	bKJWA4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1OH-00000006ooF-1ZMM;
	Wed, 28 Oct 2026 11:00:21 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1OE-00000006omw-0fPx
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 11:00:20 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 69SB0365088596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Oct 2026 19:00:03 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Wed, 28 Oct
 2026 19:00:03 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Oct
 2026 19:00:03 +0800
From: Randolph Lin <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
CC: Randolph Lin <randolph.sklin@gmail.com>,
        Randolph Lin
	<randolph@andestech.com>
Subject: [PATCH] platform: generic/andes: flush data caches before setting PMA regions
Date: Wed, 28 Oct 2026 18:59:56 +0800
Message-ID: <20261028105956.484721-1-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 69SB0365088596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_040018_651268_433AA10D 
X-CRM114-Status: GOOD (  13.02  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Non-cacheable accesses do not remove the lines a region left in the
caches while it was cacheable. When andes_sbi_set_pma() or
andes_pma_setup_regions() makes such a region non-cacheable, memory
and the caches can disagree: data stored by the CPU can stay in a
cache line that a non-coherent DMA master never sees, and a dirty
line can be written back later over data stored by the DMA master.

Write back and invalidate the L1 data cache of the calling hart and
the last level cache before programming the PMA entries. The PMA CSRs
are per hart, so a caller that sets a region on every hart also
flushes every L1 data cache.

Assisted-by: Claude:claude-opus-5-5
---
 platform/generic/andes/andes_pma.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index 28d33a2f..594c3324 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -15,6 +15,7 @@
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_error.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
 static inline bool not_napot(unsigned long addr, unsigned long size)
@@ -111,6 +112,22 @@ static bool has_pma_region_overlap(unsigned long start, unsigned long size)
 	return false;
 }
 
+/*
+ * Non-cacheable accesses do not remove the lines a region left in the
+ * caches while it was cacheable, so write back and invalidate the data
+ * caches before a region changes its PMA.
+ */
+static void andes_pma_flush_dcache(void)
+{
+	if ((csr_read(CSR_MMSC_CFG) & MMSC_CFG_CCTLCSR_MASK) &&
+	    (csr_read(CSR_MDCM_CFG) & MDCM_CFG_DSZ_MASK))
+		csr_write(CSR_MCCTLCOMMAND, MCCTLCOMMAND_L1D_WBINVAL_ALL);
+
+#ifdef CONFIG_FDT_CACHE
+	fdt_cmo_llc_flush_all();
+#endif
+}
+
 static unsigned long andes_pma_setup(const struct andes_pma_region *pma_region,
 				     unsigned int entry_id)
 {
@@ -257,6 +274,8 @@ int andes_pma_setup_regions(void *fdt,
 	if (!andes_sbi_probe_pma())
 		return SBI_ENOTSUPP;
 
+	andes_pma_flush_dcache();
+
 	/* Configure the PMA regions */
 	dt_populate_cnt = 0;
 	for (i = 0; i < pma_regions_count; i++) {
@@ -326,6 +345,8 @@ int andes_sbi_set_pma(unsigned long pa, unsigned long size, u8 flags)
 		return SBI_ERR_FAILED;
 	}
 
+	andes_pma_flush_dcache();
+
 	rc = andes_pma_setup(&region, entry_id);
 	if (rc == SBI_EINVAL) {
 		sbi_printf("ERROR %s(): Failed to set PMAADDR%d\n",
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
