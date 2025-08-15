Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AD3CA0ED1
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htswaVRdJ6dUm6Z2Z86Cq8E+K/R8pquALAzeszRw+t8=; b=Ywmti6ICpruSny
	IGemZ6T51Ht/aF/KKT4YcfRbAlQTDweblNnAKgutd3ZSiV6BujQMCCtfCmQs0qKJhID8OKce4HHXT
	adLuaxAQXAxS1HmR4R9Dx8Qp56TZRvTjFQBS7O/2QMA3zsKtH3tDILZjQLFjN9F7rMOhO8PY/5wpt
	1VGy+Bk7NtYYjDu5WNqYmZ5D7iNTBARzz3R6jhIV8uHGSgNQLphfIhhrnSsWQyzR6TODV+4vzTyD1
	EvQY1LuQXm04wGijT86Oe0oaEo2GmzSqcHayEiCNzV9Z/zWAMWVSoqpHWPiPxZJicXOG77x5k35WJ
	7n/DSHqcWnpHI+8mZ7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGa-00000002YN8-3huL;
	Fri, 15 Aug 2025 13:14:44 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFh-000000028l1-0GG5
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-323267872f3so1699439a91.1
        for <opensbi@lists.infradead.org>; Fri, 15 Aug 2025 03:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755252096; x=1755856896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2uxXxjyXD4MvUeb20uVTJ5G3CsFL/9+3oZihwjRojE=;
        b=ZlTPMyioWLWNFRfun/LTy0YmMjIkGFT62ziECuSjg8qBvZyQ3hQcYVKTU02aR5VKUo
         zN+cpj4AzrNe5bz7ozinwRFzlA+ZtL4kpGv5ikZnU3+rqyLAiY0m8gaqW2VPpQMSr2Pd
         3rDSsDJrlGLntgkJp0NsfIMSvAVn6welrrQuwlJa7G2iAqcv8gIW4Dbu1Mw3Qg6ofBQc
         5ovg/4+QSj1cFqUVUodD3gO/+8eyTmsd3GFmljzKAcajIAlsWkVtYPk6LQBa9EIclslD
         B+5HtQRrh+8nINIUABUldMthssygN2goAl9VMPui4fk1IkZzLuds+6b51LaOKoBMtV3n
         RN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755252096; x=1755856896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2uxXxjyXD4MvUeb20uVTJ5G3CsFL/9+3oZihwjRojE=;
        b=SWwLR2m/wzZ/UxOqaGayYkkd2C/dcz4BFu5bamamw9Y9zRFVeEXnCRf+VD9jqqFzsR
         cdB5TmjKBjIFJA/oWfNMsqaloRYfym9p6A7oWzvwK5tJVbvJSGM9yMI9TteWBEnlBrkV
         EXYhybw2LRqJxDOuB9K2S5m4sydcHO/nMFVk6k/f8rINiRj82S7kdI5tt3Z2q5z3Q1cc
         h8ubtHSEDDRjVU+Jnou7EQVNQn1mVHcuVEr/zNSk9OlqCv2wYyml2Qd57zO9/MbOWWkM
         4pAKg9KHJaVC/iSbJj0YDVBCFrBCFKd6F8SLGQTlERfJbalk2SZEhZCsQwwYXZeTAmcC
         u/3Q==
X-Gm-Message-State: AOJu0Yxt7hD1C9SgTxpbRVdvwRLtQG2f1zhdXtNNfUGOayVqkp8b9sMB
	WME9swVnUu5C/pwzhsv498F2+a6ekGyVN6KkqjByj7IjCx/cPnAXD61TWsfYYzKiKkIqrzDKDmV
	x4j+BEkmp1utmxxouJ2+cvg2TpkQzWQ3G8iZysqr/VVJfqdUopL0ew7fdDXWvf0VSZYNI3/6Uw1
	imc4PBjiBEbyB+ctB1QHNyU31WmEM1C3lxrtCHLq/o5KhtN/DGHMlDmg==
X-Gm-Gg: ASbGnctDPOSHjjek1SZkunydfj+8wQmeVnyCwEnwwnr0FThsbd+EdyOyhurDXmsozao
	epkV/t4PAweZvdduK5ff53hvDn/pgqs/gjIX+oWewFxplRx43Ti2ouxO5ytBzKtFVPBiHQ+HFaI
	uu7taydRoIS5I0j56gOt8mkF7OJtg7s2qfL2G8TryT+C8kzd4CvaFHnBmfsHcH32aZqK2SjyYhI
	Hw1XjSDpmZaoBeLQ3dcfEHlkVEQoVzSuPyrOzUCTs00XXYBnOEbOURlXdsJ7TGsYFK1yNxupn1/
	pyPaldv9TV17O775qtCSoC1FrDWMeT2S+mA/+6O5eY+U0DG3OpRQKOBICNJLlOXAhySnv4vJBDH
	FTXK0MoBOXR+XYDZE30xlYejMh0SV0oiTze9bxWI/iTr4zvk=
X-Google-Smtp-Source: AGHT+IGxCBgMlEreami9+qLQ1NRYima4orb+hoRpIzEShwLjBv9KVdIgV80SRnAjFC6kCoPgchvRKg==
X-Received: by 2002:a17:90b:4b4f:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-32342163f5cmr2488768a91.2.1755252095747;
        Fri, 15 Aug 2025 03:01:35 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a7a40sm879220a12.9.2025.08.15.03.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:01:35 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH 6/7] lib: sbi: sbi_hart: extend PMP handling to support multiple reserved entries
Date: Fri, 15 Aug 2025 18:01:14 +0800
Message-ID: <20250815100116.27776-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815100116.27776-1-peter.lin@sifive.com>
References: <20250815100116.27776-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030137_105623_AA75563C 
X-CRM114-Status: GOOD (  21.69  )
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
Cc: greentime.hu@sifive.com, Yu-Chien Peter Lin <peter.lin@sifive.com>, zong.li@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Previously, OpenSBI supported only a single reserved PMP entry. This
change adds support for multiple reserved PMP entries, configurable
via the `reserved-pmp-count` DT property in the opensbi-config.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_hart.h       | 15 ----------
 lib/sbi/sbi_domain_context.c |  6 +++-
 lib/sbi/sbi_hart.c           | 56 +++++++++++++++++++++++++++---------
 3 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 82b19dcf..86c2675b 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -101,21 +101,6 @@ enum sbi_hart_csrs {
 	SBI_HART_CSR_MAX,
 };
 
-/*
- * Smepmp enforces access boundaries between M-mode and
- * S/U-mode. When it is enabled, the PMPs are programmed
- * such that M-mode doesn't have access to S/U-mode memory.
- *
- * To give M-mode R/W access to the shared memory between M and
- * S/U-mode, first entry is reserved. It is disabled at boot.
- * When shared memory access is required, the physical address
- * should be programmed into the first PMP entry with R/W
- * permissions to the M-mode. Once the work is done, it should be
- * unmapped. sbi_hart_map_saddr/sbi_hart_unmap_saddr function
- * pair should be used to map/unmap the shared memory.
- */
-#define SBI_SMEPMP_RESV_ENTRY		0
-
 struct sbi_hart_features {
 	bool detected;
 	int priv_version;
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index fb04d81d..a78bd28c 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -101,6 +101,7 @@ static void switch_to_next_domain_context(struct hart_context *ctx,
 	struct sbi_domain *current_dom = ctx->dom;
 	struct sbi_domain *target_dom = dom_ctx->dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	/* Assign current hart to target domain */
@@ -115,7 +116,10 @@ static void switch_to_next_domain_context(struct hart_context *ctx,
 	spin_unlock(&target_dom->assigned_harts_lock);
 
 	/* Reconfigure PMP settings for the new domain */
-	for (int i = 0; i < pmp_count; i++) {
+	for (int i = plat->reserved_pmp_count; i < pmp_count; i++) {
+		if (pmp_is_fw_region(i, current_dom))
+			continue;
+
 		sbi_platform_pmp_disable(sbi_platform_thishart_ptr(), i);
 		pmp_disable(i);
 	}
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6a2d7d6f..e8762084 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_csr_detect.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_init.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
@@ -30,6 +31,7 @@ extern void __sbi_expected_trap_hext(void);
 void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
 
 static unsigned long hart_features_offset;
+static unsigned int saddr_pmp_id;
 
 static void mstatus_init(struct sbi_scratch *scratch)
 {
@@ -393,6 +395,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 				     unsigned long pmp_addr_max)
 {
 	struct sbi_domain_memregion *reg;
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx, pmp_flags;
 
@@ -402,16 +405,19 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	 */
 	csr_set(CSR_MSECCFG, MSECCFG_RLB);
 
-	/* Disable the reserved entry */
-	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	/* Disable the reserved entries */
+	for (int i = 0; i < plat->reserved_pmp_count; i++)
+		pmp_disable(i);
 
 	/* Program M-only regions when MML is not set. */
 	pmp_idx = 0;
 	sbi_domain_for_each_memregion(dom, reg) {
 		/* Skip reserved entry */
-		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
-			pmp_idx++;
-		if (pmp_count <= pmp_idx)
+		if (pmp_idx < plat->reserved_pmp_count)
+			pmp_idx += plat->reserved_pmp_count;
+		if (pmp_count <= pmp_idx) {
+			sbi_printf("%s: ERR: region %#lx cannot be protected - "
+				   "insufficient PMP entries\n", __func__, reg->base);
 			break;
 
 		/* Skip shared and SU-only regions */
@@ -435,9 +441,11 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	pmp_idx = 0;
 	sbi_domain_for_each_memregion(dom, reg) {
 		/* Skip reserved entry */
-		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
-			pmp_idx++;
-		if (pmp_count <= pmp_idx)
+		if (pmp_idx < plat->reserved_pmp_count)
+			pmp_idx += plat->reserved_pmp_count;
+		if (pmp_count <= pmp_idx) {
+			sbi_printf("%s: ERR: region %#lx cannot be protected - "
+				   "insufficient PMP entries\n", __func__, reg->base);
 			break;
 
 		/* Skip M-only regions */
@@ -468,13 +476,19 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 				     unsigned long pmp_addr_max)
 {
 	struct sbi_domain_memregion *reg;
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx = 0;
 	unsigned int pmp_flags;
 	unsigned long pmp_addr;
 
 	sbi_domain_for_each_memregion(dom, reg) {
-		if (pmp_count <= pmp_idx)
+		/* Skip reserved entry */
+		if (pmp_idx < plat->reserved_pmp_count)
+			pmp_idx += plat->reserved_pmp_count;
+		if (pmp_count <= pmp_idx) {
+			sbi_printf("%s: ERR: region %#lx cannot be protected - "
+				   "insufficient PMP entries\n", __func__, reg->base);
 			break;
 
 		pmp_flags = 0;
@@ -510,6 +524,19 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 	return 0;
 }
 
+/*
+ * Smepmp enforces access boundaries between M-mode and
+ * S/U-mode. When it is enabled, the PMPs are programmed
+ * such that M-mode doesn't have access to S/U-mode memory.
+ *
+ * To give M-mode R/W access to the shared memory between M and
+ * S/U-mode, high-priority entry is reserved. It is disabled at boot.
+ * When shared memory access is required, the physical address
+ * should be programmed into the reserved PMP entry with R/W
+ * permissions to the M-mode. Once the work is done, it should be
+ * unmapped. sbi_hart_map_saddr/sbi_hart_unmap_saddr function
+ * pair should be used to map/unmap the shared memory.
+ */
 int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 {
 	/* shared R/W access for M and S/U mode */
@@ -521,8 +548,9 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
-	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
+	if (reserved_pmp_alloc(&saddr_pmp_id)) {
 		return SBI_ENOSPC;
+	}
 
 	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
 	     order <= __riscv_xlen; order++) {
@@ -538,10 +566,10 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 		}
 	}
 
-	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
+	sbi_platform_pmp_set(sbi_platform_ptr(scratch), saddr_pmp_id,
 			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
 			     pmp_flags, base, order);
-	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
+	pmp_set(saddr_pmp_id, pmp_flags, base, order);
 
 	return SBI_OK;
 }
@@ -553,8 +581,8 @@ int sbi_hart_unmap_saddr(void)
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
-	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
-	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), saddr_pmp_id);
+	return pmp_disable(saddr_pmp_id);
 }
 
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
