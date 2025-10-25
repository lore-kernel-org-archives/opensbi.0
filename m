Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799BCCCF9E3
	for <opensbi@archiver.kernel.org>; Sat, 25 Oct 2025 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mE0lDr7i9NY9miEAj8wR1BfHLM3jKAWaw4biIrD0DM4=; b=UDct/J3tRcfBIG
	KgkM6QPfz/iGRbGFQNUlvBiH9IfSVZB1MQ4qFlP2gjy+/ef9aTp7UNktUFrZbosY3CuMfpCCVGUTp
	g2LbTdSywU1oxVVCaYRcjFaiv87lxgkQHGAqWyquti+dsBN8VNxMZD4pGSHxi3M4vs4GMN62Jjzg9
	lXh1Kc1xA9BR/1/WllhcVMt+duKtxrgNor7kPwMGW48dycAqh+zRlJOvpAIeA6EAEBbkUuPfni+vv
	l/SdahiMMzsLn21FZbNf+bHGnKMunZx87ibZGEGPxk6soRDlALannRoYbfJe0tQTW4w2CMEd7S5l7
	P7xXNmZYIaWhHSxy5CRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ4-0000000B9oy-3k9W;
	Sat, 25 Oct 2025 09:18:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ3-0000000B9mr-0WLO
	for opensbi@lists.infradead.org;
	Sat, 25 Oct 2025 09:18:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-290b48e09a7so36318985ad.0
        for <opensbi@lists.infradead.org>; Sat, 25 Oct 2025 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1761383918; x=1761988718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHOndBRZs3LKPRyPcxbHv/UKuwEqZRyLBQPFxI8PcdY=;
        b=bkNSzLEYGgutpYeKUwQBUBmWRePbxLTGLHjVnPOFaL38qiRHhkcZtPIyaPBc8/KYIG
         HnkRm8tKNO3mjE/nRQb3oKt+UTA1C8tqpuKHuvNKg1nCM+mwaOBv6Z53f4MtuGQI0txm
         svDRbF+m5+VpGU0qEqGiQST19sEbuz1mREgpbeMo5oe6oe2xyIVsDQkWpiuoT0VJGff7
         N8Lyj+lGIyID2J4OKiTFD+1pn0lQZZjnYNDJo2fb0pe27EuLfp04hi8TXz5+ImPZHtAE
         rlZJmbPZT1f9TmoM9IlDZmaPTeeLaqd7nOd+zQigcV/u5yGqSxtVlNIdu3OR0llG0Gfj
         fA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761383918; x=1761988718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHOndBRZs3LKPRyPcxbHv/UKuwEqZRyLBQPFxI8PcdY=;
        b=XQahW6kX+zKaATyq8jN3ip4Coy2+d01JWaIa4r8n8Mnb+3TeAKtmGZQgJB1u3gpyim
         tiAeBQG/+UC4kgEkWit87aIlch0G0vCXjJXmzv4w6A7y/i26BgWFZZUOsnQZHS9iV5HA
         tKPdU5CatVu4Sqlk+NLMA3VPeXoz4L/lpAZzcbb0DhfzCfVoIvv1FSH5T3r9DcprsB/f
         GH53HYEuGaXnoCESFTGhcaNIEIDqFvcLFELGdu7sLX1JDkqS2ChVrFw5s8HZX/NH5g4/
         M02F+pKpVFRlBOOFIHInW6lHsCTlGNoiRYETCGI858EK0p9iK7tDyhxIdmv6jZKkeBET
         +MuA==
X-Gm-Message-State: AOJu0Yzg9S99Ud5eQFFFeW8ul0eP0NSEG+ShbrJjmeRylhAuSQJ7n5si
	e3G30XLSK0hjYYz2v+/dDBmMxnH5varqSNGmNBYLYSwHh37efGOXYiTNiSEgwk0+2Ipw5I2Jgcj
	KAL6f53MMOIzBgYGOgxuGqmoSnqGVjpQkmoKuZZuEASysqJt2VW/Ttvm24pjR3Kj7s7vhRzEDQF
	3nFyjz9cyg7sRuvl/ybWp3DUAPFrBoFsNkb65Od0d3WOuxoX0S
X-Gm-Gg: ASbGncveUGCTsPJhHkub7d8TsHgcj8px5d4sAe272IS7LiSiby5EkuQ1U+dJhI/u6Mj
	dk1xBO6f87K4aa/9afyZsBVvBdGv/h47QS5RI33sYQfbzzmT3/o18BvemdvSqLH6tgsZ1QyiVE6
	iq1TlJMclpKKJwKvmJvyQW1raVfwAaBThmiLTDunY79XC03BM/9nYSl+Qc3zX9Uizj7lFtYwssp
	mtO6v65ObfyICQg2YFJVKxfdrZjn3Po+Lv+3P68bP/yo9g+BUFvBuvq1/w5J9p9+sktrphGJMpO
	ewjPYu850ZWARrLEM6JeZO3IbHJG5jeAqjVvDAk7S78hej9/DY5l7NJQENNv+XLSKe7tA4Peen4
	A+0ET+hOq1xnA9itW9ZubMJzGm97TRt0NQNFV8Ga9G0oxcZpW4rAzpIkJyMZ//Hsm9ODmY2sXEF
	IV99jcPAainB9XkrW5MhlK6hKB
X-Google-Smtp-Source: AGHT+IHEKIvtMRl/u0Lqd5FZ4BjcZk3yKDrXoOAkNZk1Jt/UmuD2zNih3JDQ1ff/sZQCs7tBSLk5TQ==
X-Received: by 2002:a17:902:ce12:b0:26b:da03:60db with SMTP id d9443c01a7336-290c9ca6b1cmr373327655ad.13.1761383918016;
        Sat, 25 Oct 2025 02:18:38 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f20sm1702700b3a.29.2025.10.25.02.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 02:18:37 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v2 6/7] lib: sbi: sbi_hart: extend PMP handling to support multiple reserved entries
Date: Sat, 25 Oct 2025 17:18:10 +0800
Message-ID: <20251025091811.506511-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251025091811.506511-1-peter.lin@sifive.com>
References: <20251025091811.506511-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021839_168700_B79F5EC4 
X-CRM114-Status: GOOD (  21.71  )
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

Previously, OpenSBI supported only a single reserved PMP entry. This
change adds support for multiple reserved PMP entries, configurable
via the `reserved-pmp-count` DT property in the opensbi-config.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_hart.h       | 15 -----------
 lib/sbi/sbi_domain_context.c |  4 ++-
 lib/sbi/sbi_hart.c           | 52 +++++++++++++++++++++++++-----------
 3 files changed, 39 insertions(+), 32 deletions(-)

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
index 5490df28..128bfc3c 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_domain.h>
@@ -102,6 +103,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom, *target_dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	if (!ctx || !dom_ctx || ctx == dom_ctx)
@@ -121,7 +123,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	spin_unlock(&target_dom->assigned_harts_lock);
 
 	/* Reconfigure PMP settings for the new domain */
-	for (int i = 0; i < pmp_count; i++) {
+	for (int i = plat->reserved_pmp_count; i < pmp_count; i++) {
 		sbi_platform_pmp_disable(sbi_platform_thishart_ptr(), i);
 		pmp_disable(i);
 	}
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index f173187c..012420e1 100644
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
 
@@ -402,15 +405,13 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	 */
 	csr_set(CSR_MSECCFG, MSECCFG_RLB);
 
-	/* Disable the reserved entry */
-	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	/* Disable the reserved entries */
+	for (int i = 0; i < plat->reserved_pmp_count; i++)
+		pmp_disable(i);
 
 	/* Program M-only regions when MML is not set. */
-	pmp_idx = 0;
+	pmp_idx = plat->reserved_pmp_count;
 	sbi_domain_for_each_memregion(dom, reg) {
-		/* Skip reserved entry */
-		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
-			pmp_idx++;
 		if (pmp_count <= pmp_idx)
 			break;
 
@@ -432,11 +433,8 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	csr_set(CSR_MSECCFG, MSECCFG_MML);
 
 	/* Program shared and SU-only regions */
-	pmp_idx = 0;
+	pmp_idx = plat->reserved_pmp_count;
 	sbi_domain_for_each_memregion(dom, reg) {
-		/* Skip reserved entry */
-		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
-			pmp_idx++;
 		if (pmp_count <= pmp_idx)
 			break;
 
@@ -468,11 +466,13 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 				     unsigned long pmp_addr_max)
 {
 	struct sbi_domain_memregion *reg;
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned int pmp_idx = 0;
+	unsigned int pmp_idx;
 	unsigned int pmp_flags;
 	unsigned long pmp_addr;
 
+	pmp_idx = plat->reserved_pmp_count;
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (pmp_count <= pmp_idx)
 			break;
@@ -510,6 +510,19 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
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
@@ -521,8 +534,9 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
-	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
+	if (reserved_pmp_alloc(&saddr_pmp_id)) {
 		return SBI_ENOSPC;
+	}
 
 	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
 	     order <= __riscv_xlen; order++) {
@@ -538,23 +552,29 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
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
 
 int sbi_hart_unmap_saddr(void)
 {
+	int rc;
+
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
-	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
-	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), saddr_pmp_id);
+	rc = pmp_disable(saddr_pmp_id);
+	if (rc)
+		return rc;
+
+	return reserved_pmp_free(saddr_pmp_id);
 }
 
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
