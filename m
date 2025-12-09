Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE28D3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzR6wiKeeTHTohksybsW6Eas/BkaKJHGoBTEMsvFToA=; b=C4w22AZNrTZ852
	CqhrJ2gHnc3udSKiGmdEEXA8NHk5slc9P5iSvOvP+V02XNRnfDR1DmXGa1ZFITVaMe9VyVVpBJ0nM
	5bv0fPlxSchHiZ0Y5YS0LitUnXeCY8iv0wnGDeenEskzM3Zs/yBFmGFgTo627pnBWEYCGiBczguNM
	HkxFC1LoXjGFN9V5FN2WStHICCyBC8OURUu6k8eqbGmhm4I2dZHET/9nUUlMPtcRe+s5FCuntlP8O
	15rZQZ/Cvny5pD7h7tH8DaNUDWg2Y/HIjkX/f5iQV6t8d/QrJpfg+6o5sZPmSNORf79ahNAfhMu3e
	Pzj1nFn2MYzBexTMavQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9Z-0000000ELiU-23I4;
	Tue, 09 Dec 2025 13:53:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9V-0000000ELga-1W0U
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 13:53:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7e2762ad850so5909038b3a.3
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 05:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765288397; x=1765893197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaMyq8/vfVwJm08+F8c0be6dC/9i8IMUZ3yEqIjG3WI=;
        b=N2sW5LzhkzXvEhK7nRcewm09c5aXFlMaxqjhtfqBHxXuJUAzYePYlV7DG1GcgvV8xQ
         u/9bXhfBkRRL+YnqPE3fvmMEiqUtDzob/2pD06QbYcPqkLhN02K2whR1bD0IX9x1kBJo
         jJH202XVCK5KU9Tdl2FdUGfLh5ZRw0LZHzwI4eA4GAjby48MBvie7mwa+Ue0IczHWmWj
         uhvQ1NG2kHdJ9O9NkUWClIbOYuanMC1dl8lNM+1g3f4eXZOkxjCu/qxbqJOJlAMu3wK8
         JIrj2jkvj5WA+Z9eBo3MOrWcDG6oSviV8CX/dWKl7tEcvbVBTfMf2xfHxlFQOOebODZD
         f1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288397; x=1765893197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaMyq8/vfVwJm08+F8c0be6dC/9i8IMUZ3yEqIjG3WI=;
        b=FpSxUZjsOnxKlH5X0x4WP4UchPuTOFTmIoxw9iskIWgRb+Asc9n3QxF2T7bYC+elgM
         tTYB4r6OPVHMlcyYcc/9QjObjIN0DNn2QwhZapz12B9CoE48g1Rnx4TR4MMMI3JLMvLF
         oKd1tfEg/P579koeOwdoRTormJC8XYQ9b/RLUbN0lIvxjCkKsTGSo2pgTET5CvHMo90T
         1Jr3MFvwwh9FalqbVlX66Vudg09IU7f+y7rDhPjVnl++zdKr2ACtab6OZfVM0zhqrK9k
         BcoGJ085JATy+tgOaj2glZk8seqa6BZPqRgzC7HPC4hObqkEmYk48ZeaTQXRrYnqRT4H
         APDA==
X-Forwarded-Encrypted: i=1; AJvYcCXLMTpu3JTDT0VZQCz05zfjRGr5IeDZBplB5db95wNJTOkSYPudAo3iBt6fRNzLN4dseFD6NajM@lists.infradead.org
X-Gm-Message-State: AOJu0YzGxmUx1UDaxVMX2K+Rgn+//zZPQlgLvl5A1AOsD8HD+cl/X11Q
	gAE+gwVA7HWvkS3chIZoCuKxNfq6KDWADfjKwZSfGpKBeTcEqhFCHm/+vS0DqYGSST+3qu4MQ64
	qfb5AA+U=
X-Gm-Gg: ASbGnctdDeQLr2JbXOOwnBO1ctIZ8FMOrbvDKGIePFswdxk0vOaS+1D+IhbJs1U38Ym
	FChGlS8F6lHQBDZje4ME1J+Mwuur6WzCzphDKz+qxgJOXo+PxN6l5qm5yAZcmnBAxHlnQU9iL1N
	rZ7rst48e7rDdS0q4OB5W5mAMbd4WojR0ZFh8LYh8+NT7pQUaOkADRLfjLNDxoLC1CMtIc+NeDz
	/EjwHunrlmMf9cgzjFSYPpmw4YDqh8mU9h1CgCTONlnEy+8y/jAkcZYlqcRN5504a3GPd1DYOAv
	Rk0mjzFZNxtYr7G9Dn6Z6uoNs80Vzlxm/gPwvVe0GDOXG2G5UckhjYjJCpFBfRcrCfxhlM/yD5b
	6kgAxJcMYnAiHmQxKBE3+PivknGqvOkyhidFqVPqUwuT65MuVdJF46NArROWSByvsHCyxpIoIhn
	hYk+9snekHSbD0CMkHac0qYyXKQqePlIg2BmvKJdRhB6PgkJe2
X-Google-Smtp-Source: AGHT+IGiWeM6ke5wuiTngVK5khLWpH3y1k4CZwNTBUsz+TQXqknGs19foa2ijw18bGnFW0a2ATfJdQ==
X-Received: by 2002:a05:6300:218f:b0:34e:8864:793c with SMTP id adf61e73a8af0-36617e468e8mr10808519637.8.1765288396291;
        Tue, 09 Dec 2025 05:53:16 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf681738a34sm15023827a12.4.2025.12.09.05.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:53:12 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 5/5] lib: sbi: Factor-out PMP programming into separate sources
Date: Tue,  9 Dec 2025 19:22:35 +0530
Message-ID: <20251209135235.423391-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209135235.423391-1-apatel@ventanamicro.com>
References: <20251209135235.423391-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_055317_434597_F935545F 
X-CRM114-Status: GOOD (  26.44  )
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

The PMP programming is a significant part of sbi_hart.c so factor-out
this into separate sources sbi_hart_pmp.c and sbi_hart_pmp.h for better
maintainability.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart.h     |  22 +--
 include/sbi/sbi_hart_pmp.h |  20 +++
 lib/sbi/objects.mk         |   1 +
 lib/sbi/sbi_hart.c         | 334 +---------------------------------
 lib/sbi/sbi_hart_pmp.c     | 355 +++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c         |   1 +
 6 files changed, 382 insertions(+), 351 deletions(-)
 create mode 100644 include/sbi/sbi_hart_pmp.h
 create mode 100644 lib/sbi/sbi_hart_pmp.c

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index bbd8026e..a788b34c 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -107,21 +107,6 @@ enum sbi_hart_csrs {
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
- * unmapped. sbi_hart_protection_map_range/sbi_hart_protection_unmap_range
- * function pair should be used to map/unmap the shared memory.
- */
-#define SBI_SMEPMP_RESV_ENTRY		0
-
 struct sbi_hart_features {
 	bool detected;
 	int priv_version;
@@ -134,6 +119,9 @@ struct sbi_hart_features {
 	unsigned int mhpm_bits;
 };
 
+extern unsigned long hart_features_offset;
+#define sbi_hart_features_ptr(__s)	sbi_scratch_offset_ptr(__s, hart_features_offset)
+
 struct sbi_scratch;
 
 int sbi_hart_reinit(struct sbi_scratch *scratch);
@@ -144,11 +132,7 @@ extern void (*sbi_hart_expected_trap)(void);
 unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
 void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
 			      const char *prefix, const char *suffix);
-unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
-unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
-unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
-bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
 int sbi_hart_priv_version(struct sbi_scratch *scratch);
 void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
 				   char *version_str, int nvstr);
diff --git a/include/sbi/sbi_hart_pmp.h b/include/sbi/sbi_hart_pmp.h
new file mode 100644
index 00000000..f54e8b2a
--- /dev/null
+++ b/include/sbi/sbi_hart_pmp.h
@@ -0,0 +1,20 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __SBI_HART_PMP_H__
+#define __SBI_HART_PMP_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_scratch;
+
+unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
+unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
+unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
+bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
+int sbi_hart_pmp_init(struct sbi_scratch *scratch);
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 51588cd1..07d13229 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -75,6 +75,7 @@ libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
 libsbi-objs-y += sbi_fwft.o
 libsbi-objs-y += sbi_hart.o
+libsbi-objs-y += sbi_hart_pmp.o
 libsbi-objs-y += sbi_hart_protection.o
 libsbi-objs-y += sbi_heap.o
 libsbi-objs-y += sbi_math.o
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 59e846db..60e95bca 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -13,26 +13,21 @@
 #include <sbi/riscv_fp.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
-#include <sbi/sbi_domain.h>
 #include <sbi/sbi_csr_detect.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
-#include <sbi/sbi_hart_protection.h>
-#include <sbi/sbi_math.h>
+#include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
-#include <sbi/sbi_hfence.h>
 
 extern void __sbi_expected_trap(void);
 extern void __sbi_expected_trap_hext(void);
 
 void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
 
-static unsigned long hart_features_offset;
-static DECLARE_BITMAP(fw_smepmp_ids, PMP_COUNT);
-static bool fw_smepmp_ids_inited;
+unsigned long hart_features_offset;
 
 static void mstatus_init(struct sbi_scratch *scratch)
 {
@@ -277,30 +272,6 @@ unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch)
 	return hfeatures->mhpm_mask;
 }
 
-unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
-{
-	struct sbi_hart_features *hfeatures =
-			sbi_scratch_offset_ptr(scratch, hart_features_offset);
-
-	return hfeatures->pmp_count;
-}
-
-unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch)
-{
-	struct sbi_hart_features *hfeatures =
-			sbi_scratch_offset_ptr(scratch, hart_features_offset);
-
-	return hfeatures->pmp_log2gran;
-}
-
-unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch)
-{
-	struct sbi_hart_features *hfeatures =
-			sbi_scratch_offset_ptr(scratch, hart_features_offset);
-
-	return hfeatures->pmp_addr_bits;
-}
-
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
 {
 	struct sbi_hart_features *hfeatures =
@@ -309,307 +280,6 @@ unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
 	return hfeatures->mhpm_bits;
 }
 
-bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
-{
-	if (!fw_smepmp_ids_inited)
-		return false;
-
-	return bitmap_test(fw_smepmp_ids, pmp_idx) ? true : false;
-}
-
-static void sbi_hart_pmp_fence(void)
-{
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
-}
-
-static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
-				struct sbi_domain *dom,
-				struct sbi_domain_memregion *reg,
-				unsigned int pmp_idx,
-				unsigned int pmp_flags,
-				unsigned int pmp_log2gran,
-				unsigned long pmp_addr_max)
-{
-	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
-
-	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-		sbi_platform_pmp_set(sbi_platform_ptr(scratch),
-				     pmp_idx, reg->flags, pmp_flags,
-				     reg->base, reg->order);
-		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
-	} else {
-		sbi_printf("Can not configure pmp for domain %s because"
-			   " memory region address 0x%lx or size 0x%lx "
-			   "is not in range.\n", dom->name, reg->base,
-			   reg->order);
-	}
-}
-
-static bool is_valid_pmp_idx(unsigned int pmp_count, unsigned int pmp_idx)
-{
-	if (pmp_count > pmp_idx)
-		return true;
-
-	sbi_printf("error: insufficient PMP entries\n");
-	return false;
-}
-
-static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
-{
-	struct sbi_domain_memregion *reg;
-	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned int pmp_log2gran, pmp_bits;
-	unsigned int pmp_idx, pmp_count;
-	unsigned long pmp_addr_max;
-	unsigned int pmp_flags;
-
-	pmp_count = sbi_hart_pmp_count(scratch);
-	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
-	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
-	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
-
-	/*
-	 * Set the RLB so that, we can write to PMP entries without
-	 * enforcement even if some entries are locked.
-	 */
-	csr_set(CSR_MSECCFG, MSECCFG_RLB);
-
-	/* Disable the reserved entry */
-	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
-
-	/* Program M-only regions when MML is not set. */
-	pmp_idx = 0;
-	sbi_domain_for_each_memregion(dom, reg) {
-		/* Skip reserved entry */
-		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
-			pmp_idx++;
-		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
-			return SBI_EFAIL;
-
-		/* Skip shared and SU-only regions */
-		if (!SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
-			pmp_idx++;
-			continue;
-		}
-
-		/*
-		 * Track firmware PMP entries to preserve them during
-		 * domain switches. Under SmePMP, M-mode requires
-		 * explicit PMP entries to access firmware code/data.
-		 * These entries must remain enabled across domain
-		 * context switches to prevent M-mode access faults.
-		 */
-		if (SBI_DOMAIN_MEMREGION_IS_FIRMWARE(reg->flags)) {
-			if (fw_smepmp_ids_inited) {
-				/* Check inconsistent firmware region */
-				if (!sbi_hart_smepmp_is_fw_region(pmp_idx))
-					return SBI_EINVAL;
-			} else {
-				bitmap_set(fw_smepmp_ids, pmp_idx, 1);
-			}
-		}
-
-		pmp_flags = sbi_domain_get_smepmp_flags(reg);
-
-		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
-				    pmp_log2gran, pmp_addr_max);
-	}
-
-	fw_smepmp_ids_inited = true;
-
-	/* Set the MML to enforce new encoding */
-	csr_set(CSR_MSECCFG, MSECCFG_MML);
-
-	/* Program shared and SU-only regions */
-	pmp_idx = 0;
-	sbi_domain_for_each_memregion(dom, reg) {
-		/* Skip reserved entry */
-		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
-			pmp_idx++;
-		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
-			return SBI_EFAIL;
-
-		/* Skip M-only regions */
-		if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
-			pmp_idx++;
-			continue;
-		}
-
-		pmp_flags = sbi_domain_get_smepmp_flags(reg);
-
-		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
-				    pmp_log2gran, pmp_addr_max);
-	}
-
-	/*
-	 * All entries are programmed.
-	 * Keep the RLB bit so that dynamic mappings can be done.
-	 */
-
-	sbi_hart_pmp_fence();
-	return 0;
-}
-
-static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
-				     unsigned long addr, unsigned long size)
-{
-	/* shared R/W access for M and S/U mode */
-	unsigned int pmp_flags = (PMP_W | PMP_X);
-	unsigned long order, base = 0;
-
-	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
-		return SBI_ENOSPC;
-
-	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
-	     order <= __riscv_xlen; order++) {
-		if (order < __riscv_xlen) {
-			base = addr & ~((1UL << order) - 1UL);
-			if ((base <= addr) &&
-			    (addr < (base + (1UL << order))) &&
-			    (base <= (addr + size - 1UL)) &&
-			    ((addr + size - 1UL) < (base + (1UL << order))))
-				break;
-		} else {
-			return SBI_EFAIL;
-		}
-	}
-
-	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
-			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
-			     pmp_flags, base, order);
-	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
-
-	return SBI_OK;
-}
-
-static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
-				       unsigned long addr, unsigned long size)
-{
-	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
-	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
-}
-
-static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
-{
-	struct sbi_domain_memregion *reg;
-	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned long pmp_addr, pmp_addr_max;
-	unsigned int pmp_log2gran, pmp_bits;
-	unsigned int pmp_idx, pmp_count;
-	unsigned int pmp_flags;
-
-	pmp_count = sbi_hart_pmp_count(scratch);
-	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
-	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
-	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
-
-	pmp_idx = 0;
-	sbi_domain_for_each_memregion(dom, reg) {
-		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
-			return SBI_EFAIL;
-
-		pmp_flags = 0;
-
-		/*
-		 * If permissions are to be enforced for all modes on
-		 * this region, the lock bit should be set.
-		 */
-		if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
-			pmp_flags |= PMP_L;
-
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
-			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
-			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-			pmp_flags |= PMP_X;
-
-		pmp_addr = reg->base >> PMP_SHIFT;
-		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-			sbi_platform_pmp_set(sbi_platform_ptr(scratch),
-					     pmp_idx, reg->flags, pmp_flags,
-					     reg->base, reg->order);
-			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
-		} else {
-			sbi_printf("Can not configure pmp for domain %s because"
-				   " memory region address 0x%lx or size 0x%lx "
-				   "is not in range.\n", dom->name, reg->base,
-				   reg->order);
-		}
-	}
-
-	sbi_hart_pmp_fence();
-	return 0;
-}
-
-static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
-{
-	int i, pmp_count = sbi_hart_pmp_count(scratch);
-
-	for (i = 0; i < pmp_count; i++) {
-		/* Don't revoke firmware access permissions */
-		if (sbi_hart_smepmp_is_fw_region(i))
-			continue;
-
-		sbi_platform_pmp_disable(sbi_platform_ptr(scratch), i);
-		pmp_disable(i);
-	}
-}
-
-static struct sbi_hart_protection pmp_protection = {
-	.name = "pmp",
-	.rating = 100,
-	.configure = sbi_hart_oldpmp_configure,
-	.unconfigure = sbi_hart_pmp_unconfigure,
-};
-
-static struct sbi_hart_protection epmp_protection = {
-	.name = "epmp",
-	.rating = 200,
-	.configure = sbi_hart_smepmp_configure,
-	.unconfigure = sbi_hart_pmp_unconfigure,
-	.map_range = sbi_hart_smepmp_map_range,
-	.unmap_range = sbi_hart_smepmp_unmap_range,
-};
-
-static int sbi_hart_pmp_init(struct sbi_scratch *scratch)
-{
-	int rc;
-
-	if (sbi_hart_pmp_count(scratch)) {
-		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
-			rc = sbi_hart_protection_register(&epmp_protection);
-			if (rc)
-				return rc;
-		} else {
-			rc = sbi_hart_protection_register(&pmp_protection);
-			if (rc)
-				return rc;
-		}
-	}
-
-	return 0;
-}
-
 int sbi_hart_priv_version(struct sbi_scratch *scratch)
 {
 	struct sbi_hart_features *hfeatures =
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
new file mode 100644
index 00000000..2c9f15bc
--- /dev/null
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -0,0 +1,355 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <sbi/sbi_bitmap.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
+#include <sbi/sbi_hfence.h>
+#include <sbi/sbi_math.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/riscv_asm.h>
+
+/*
+ * Smepmp enforces access boundaries between M-mode and
+ * S/U-mode. When it is enabled, the PMPs are programmed
+ * such that M-mode doesn't have access to S/U-mode memory.
+ *
+ * To give M-mode R/W access to the shared memory between M and
+ * S/U-mode, first entry is reserved. It is disabled at boot.
+ * When shared memory access is required, the physical address
+ * should be programmed into the first PMP entry with R/W
+ * permissions to the M-mode. Once the work is done, it should be
+ * unmapped. sbi_hart_protection_map_range/sbi_hart_protection_unmap_range
+ * function pair should be used to map/unmap the shared memory.
+ */
+#define SBI_SMEPMP_RESV_ENTRY		0
+
+static DECLARE_BITMAP(fw_smepmp_ids, PMP_COUNT);
+static bool fw_smepmp_ids_inited;
+
+unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
+{
+	struct sbi_hart_features *hfeatures = sbi_hart_features_ptr(scratch);
+
+	return hfeatures->pmp_count;
+}
+
+unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch)
+{
+	struct sbi_hart_features *hfeatures = sbi_hart_features_ptr(scratch);
+
+	return hfeatures->pmp_log2gran;
+}
+
+unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch)
+{
+	struct sbi_hart_features *hfeatures = sbi_hart_features_ptr(scratch);
+
+	return hfeatures->pmp_addr_bits;
+}
+
+bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
+{
+	if (!fw_smepmp_ids_inited)
+		return false;
+
+	return bitmap_test(fw_smepmp_ids, pmp_idx) ? true : false;
+}
+
+static void sbi_hart_pmp_fence(void)
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
+static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
+				struct sbi_domain *dom,
+				struct sbi_domain_memregion *reg,
+				unsigned int pmp_idx,
+				unsigned int pmp_flags,
+				unsigned int pmp_log2gran,
+				unsigned long pmp_addr_max)
+{
+	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
+
+	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
+		sbi_platform_pmp_set(sbi_platform_ptr(scratch),
+				     pmp_idx, reg->flags, pmp_flags,
+				     reg->base, reg->order);
+		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
+	} else {
+		sbi_printf("Can not configure pmp for domain %s because"
+			   " memory region address 0x%lx or size 0x%lx "
+			   "is not in range.\n", dom->name, reg->base,
+			   reg->order);
+	}
+}
+
+static bool is_valid_pmp_idx(unsigned int pmp_count, unsigned int pmp_idx)
+{
+	if (pmp_count > pmp_idx)
+		return true;
+
+	sbi_printf("error: insufficient PMP entries\n");
+	return false;
+}
+
+static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
+{
+	struct sbi_domain_memregion *reg;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	unsigned int pmp_log2gran, pmp_bits;
+	unsigned int pmp_idx, pmp_count;
+	unsigned long pmp_addr_max;
+	unsigned int pmp_flags;
+
+	pmp_count = sbi_hart_pmp_count(scratch);
+	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
+	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
+	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
+
+	/*
+	 * Set the RLB so that, we can write to PMP entries without
+	 * enforcement even if some entries are locked.
+	 */
+	csr_set(CSR_MSECCFG, MSECCFG_RLB);
+
+	/* Disable the reserved entry */
+	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+
+	/* Program M-only regions when MML is not set. */
+	pmp_idx = 0;
+	sbi_domain_for_each_memregion(dom, reg) {
+		/* Skip reserved entry */
+		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
+			pmp_idx++;
+		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
+			return SBI_EFAIL;
+
+		/* Skip shared and SU-only regions */
+		if (!SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+			pmp_idx++;
+			continue;
+		}
+
+		/*
+		 * Track firmware PMP entries to preserve them during
+		 * domain switches. Under SmePMP, M-mode requires
+		 * explicit PMP entries to access firmware code/data.
+		 * These entries must remain enabled across domain
+		 * context switches to prevent M-mode access faults.
+		 */
+		if (SBI_DOMAIN_MEMREGION_IS_FIRMWARE(reg->flags)) {
+			if (fw_smepmp_ids_inited) {
+				/* Check inconsistent firmware region */
+				if (!sbi_hart_smepmp_is_fw_region(pmp_idx))
+					return SBI_EINVAL;
+			} else {
+				bitmap_set(fw_smepmp_ids, pmp_idx, 1);
+			}
+		}
+
+		pmp_flags = sbi_domain_get_smepmp_flags(reg);
+
+		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
+				    pmp_log2gran, pmp_addr_max);
+	}
+
+	fw_smepmp_ids_inited = true;
+
+	/* Set the MML to enforce new encoding */
+	csr_set(CSR_MSECCFG, MSECCFG_MML);
+
+	/* Program shared and SU-only regions */
+	pmp_idx = 0;
+	sbi_domain_for_each_memregion(dom, reg) {
+		/* Skip reserved entry */
+		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
+			pmp_idx++;
+		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
+			return SBI_EFAIL;
+
+		/* Skip M-only regions */
+		if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+			pmp_idx++;
+			continue;
+		}
+
+		pmp_flags = sbi_domain_get_smepmp_flags(reg);
+
+		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
+				    pmp_log2gran, pmp_addr_max);
+	}
+
+	/*
+	 * All entries are programmed.
+	 * Keep the RLB bit so that dynamic mappings can be done.
+	 */
+
+	sbi_hart_pmp_fence();
+	return 0;
+}
+
+static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
+				     unsigned long addr, unsigned long size)
+{
+	/* shared R/W access for M and S/U mode */
+	unsigned int pmp_flags = (PMP_W | PMP_X);
+	unsigned long order, base = 0;
+
+	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
+		return SBI_ENOSPC;
+
+	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
+	     order <= __riscv_xlen; order++) {
+		if (order < __riscv_xlen) {
+			base = addr & ~((1UL << order) - 1UL);
+			if ((base <= addr) &&
+			    (addr < (base + (1UL << order))) &&
+			    (base <= (addr + size - 1UL)) &&
+			    ((addr + size - 1UL) < (base + (1UL << order))))
+				break;
+		} else {
+			return SBI_EFAIL;
+		}
+	}
+
+	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
+			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
+			     pmp_flags, base, order);
+	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
+
+	return SBI_OK;
+}
+
+static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
+				       unsigned long addr, unsigned long size)
+{
+	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
+	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+}
+
+static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
+{
+	struct sbi_domain_memregion *reg;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	unsigned long pmp_addr, pmp_addr_max;
+	unsigned int pmp_log2gran, pmp_bits;
+	unsigned int pmp_idx, pmp_count;
+	unsigned int pmp_flags;
+
+	pmp_count = sbi_hart_pmp_count(scratch);
+	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
+	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
+	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
+
+	pmp_idx = 0;
+	sbi_domain_for_each_memregion(dom, reg) {
+		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
+			return SBI_EFAIL;
+
+		pmp_flags = 0;
+
+		/*
+		 * If permissions are to be enforced for all modes on
+		 * this region, the lock bit should be set.
+		 */
+		if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
+			pmp_flags |= PMP_L;
+
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+			pmp_flags |= PMP_R;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+			pmp_flags |= PMP_W;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+			pmp_flags |= PMP_X;
+
+		pmp_addr = reg->base >> PMP_SHIFT;
+		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
+			sbi_platform_pmp_set(sbi_platform_ptr(scratch),
+					     pmp_idx, reg->flags, pmp_flags,
+					     reg->base, reg->order);
+			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
+		} else {
+			sbi_printf("Can not configure pmp for domain %s because"
+				   " memory region address 0x%lx or size 0x%lx "
+				   "is not in range.\n", dom->name, reg->base,
+				   reg->order);
+		}
+	}
+
+	sbi_hart_pmp_fence();
+	return 0;
+}
+
+static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
+{
+	int i, pmp_count = sbi_hart_pmp_count(scratch);
+
+	for (i = 0; i < pmp_count; i++) {
+		/* Don't revoke firmware access permissions */
+		if (sbi_hart_smepmp_is_fw_region(i))
+			continue;
+
+		sbi_platform_pmp_disable(sbi_platform_ptr(scratch), i);
+		pmp_disable(i);
+	}
+}
+
+static struct sbi_hart_protection pmp_protection = {
+	.name = "pmp",
+	.rating = 100,
+	.configure = sbi_hart_oldpmp_configure,
+	.unconfigure = sbi_hart_pmp_unconfigure,
+};
+
+static struct sbi_hart_protection epmp_protection = {
+	.name = "epmp",
+	.rating = 200,
+	.configure = sbi_hart_smepmp_configure,
+	.unconfigure = sbi_hart_pmp_unconfigure,
+	.map_range = sbi_hart_smepmp_map_range,
+	.unmap_range = sbi_hart_smepmp_unmap_range,
+};
+
+int sbi_hart_pmp_init(struct sbi_scratch *scratch)
+{
+	int rc;
+
+	if (sbi_hart_pmp_count(scratch)) {
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
+			rc = sbi_hart_protection_register(&epmp_protection);
+			if (rc)
+				return rc;
+		} else {
+			rc = sbi_hart_protection_register(&pmp_protection);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return 0;
+}
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index e01d26bf..5259064b 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -18,6 +18,7 @@
 #include <sbi/sbi_fwft.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
