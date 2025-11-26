Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E38D10F58
	for <opensbi@archiver.kernel.org>; Wed, 26 Nov 2025 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qz0DkhjpY6xsIf9BC1VZ1Z0/bOxjNabBJqNpb67uonA=; b=cXYfo1pduSqY62
	lAL89fftyaFkQz26hwDswG6Gg0FnndhjHhSvBh0pyFqUoUE1gOylD7HS7vfVR6Hd5Zrkn6eTTt6qK
	/UKDaVkB4G2RzSX98yxK9yx5fZnN+4JRV/oht7BmwE0yMAFIAWiN/4jcz2vyCyl33wy9HvuH3NhsK
	qiTxPBTBqf6KCcoE91cERudUmh0uA2+JVpNwi4pDmUmJYSw0msucw5d0W3ve1uxVeaAC/Mm4vym4L
	X4KQiVVg2tDiTQ9HQFSAnBfnWJmfk+0ZDsNLWsQVcRwUVTNERyALm2i7IRo2zA/QmAg2vyGiJNVvw
	c8cZc8s9i/V6DR3PP9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMW-0000000F5pF-3Azz;
	Wed, 26 Nov 2025 14:19:16 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMT-0000000F5ny-3cUC
	for opensbi@lists.infradead.org;
	Wed, 26 Nov 2025 14:19:15 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso1136971eec.1
        for <opensbi@lists.infradead.org>; Wed, 26 Nov 2025 06:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764166753; x=1764771553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fE7mnYa+ZiWmS5EiOpi+0p9mvbo4yW9AXn9e7Dsc+DI=;
        b=n90QlR0gr2Z9BI15MrfPABJE0nw6r9qx3MRMQjfQcaoc8Q7sxJRPyFYChf3rtpdR+R
         D9KhzOJt8SayxuoYaCMevZuQbIfkOc21oCCm7kA+P5c36HW7CeixOaFw4zcd1uReukPH
         jVHeAxdpjESusB21laejl2ld2v5arQAKPoPLOZHjsxxgEKrFVlfn3hrfaUfHP9e3WI0w
         Y/iOa8yRE1h2bOoFWuRSfxa7Oh8X/9icgmNkQ9ygQPNFT7do4Zj5n8VYKnUQ5776sZ19
         ftGlUMo469SUbRv+Wpi4OX5KW9NBqnnLMqccMEp5EuVAxTfFeg3nM79OdR0RHwzW/Zb7
         Z/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166753; x=1764771553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fE7mnYa+ZiWmS5EiOpi+0p9mvbo4yW9AXn9e7Dsc+DI=;
        b=mJ/dTe9d8ldqVc2uhl0cIdyoaWZAOTBuBVETTOQvdUYDq5fhnrUu+Osa9Ps8cth2VI
         bZrXC7MyWncdl/LdDPlcw125rP4hTSgRSIX5WzDfaUQ6Q5R5FXRM/imRn/bQkkuBmlXL
         LEWXpSCZAjwkllCwDxhNvNvnAN6H4haazRRBiykIsllC2fVrJRm5C8cyQ3/sTg2cs/JE
         Iy5GSZ0+7hmh43UVppOmtI0cC03SZDRcMesmnltT9uZNira0xKM6GEIJ+10ThzbPjM6t
         77pyNmphZWLRx2YjhVlHqWmH5Buj903CMyWsMNiu1e/DzQfe02sMYv22/xzAU2w3z7Bi
         KoWg==
X-Forwarded-Encrypted: i=1; AJvYcCUGMNl9J49AJHN2v6eOw/7z1OEF7NmVba+K4o5CnH7wpkB/b5v41xyMjGgn3tzqDId2H7F48Xw4@lists.infradead.org
X-Gm-Message-State: AOJu0YxmW71A/cXxIZAUpw6n24C7y2FhV5V/M+o1mKPSPnv1JKj+f1ci
	9bIw/R+Zhfwf2YfXC+C6vkpeRBKfD0Fkmlp4t1VjRNQLCHzHTps8GsQDRRmfmv7AROJM1sb7/57
	iPNStq/KcdtNU
X-Gm-Gg: ASbGncslIXx7Isr6U41sd5BSzFEi0MjUqybTl1uj/dRTxsGayPk6aEIVfG9MwsJTgFQ
	ZOvarlTslkY6V4G+7SQ6vA2UWLwyQfeRHR8pxNm1LrZQdes3ED8bXdiPJZe68TTNRVKyTjmhi+R
	SoPxZ0EwQ3jZDZYvX71Ua+zRKAo8ghGQhC1rOtNICcx82Y+XtA4Fl3yFa6RD2BCN+I892UfM6CS
	JbARVluSjfkkzkyJmhZE+lXpcmhSP609pmrPqKfxJ6tlhcWmdTBRVVoZR0I0pXqKG9M+fmhGs8H
	L9hHzIjHtDtCETXpUdqvzLvwiGzFsHebcqx3ZW0Tve1pSqlAx9haS2NBNQXKOp620BDAxGPOUBy
	2ME3wQPumNTS5phcTc26IzclpiT8Tu+MkB5MiRVf3xW/hrYV+OT/FZZfFjg9DzNjCzTIejHGaBR
	nnwGBEGW34fdBlJhtHI1gp/IqzwqNJaRMvikKc0KakUUcszAgjVA==
X-Google-Smtp-Source: AGHT+IHAvD3SRukzrI3mdrymQp/FPCO+PxpQfWjhULmU08us4C8uUu5NEQ1IwQQLJ3PMYUZllVvACw==
X-Received: by 2002:a05:7301:4382:b0:2a4:5ff6:4438 with SMTP id 5a478bee46e88-2a6ff5307b5mr9853141eec.1.1764166752672;
        Wed, 26 Nov 2025 06:19:12 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm103679339eec.2.2025.11.26.06.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:19:12 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/5] lib: sbi: Factor-out PMP programming into separate sources
Date: Wed, 26 Nov 2025 19:48:44 +0530
Message-ID: <20251126141845.248697-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126141845.248697-1-apatel@ventanamicro.com>
References: <20251126141845.248697-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_061913_932729_4BE6BEB2 
X-CRM114-Status: GOOD (  26.15  )
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
 lib/sbi/sbi_hart.c         | 335 +---------------------------------
 lib/sbi/sbi_hart_pmp.c     | 356 +++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c         |   1 +
 6 files changed, 383 insertions(+), 352 deletions(-)
 create mode 100644 include/sbi/sbi_hart_pmp.h
 create mode 100644 lib/sbi/sbi_hart_pmp.c

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 539f95de..81019f73 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -105,21 +105,6 @@ enum sbi_hart_csrs {
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
@@ -132,6 +117,9 @@ struct sbi_hart_features {
 	unsigned int mhpm_bits;
 };
 
+extern unsigned long hart_features_offset;
+#define sbi_hart_features_ptr(__s)	sbi_scratch_offset_ptr(__s, hart_features_offset)
+
 struct sbi_scratch;
 
 int sbi_hart_reinit(struct sbi_scratch *scratch);
@@ -142,11 +130,7 @@ extern void (*sbi_hart_expected_trap)(void);
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
index 3fdf1047..d9151569 100644
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
@@ -272,30 +267,6 @@ unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch)
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
@@ -304,308 +275,6 @@ unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
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
-	if (!sbi_hart_pmp_count(scratch))
-		return 0;
-
-	rc = sbi_hart_protection_register(&pmp_protection);
-	if (rc)
-		return rc;
-
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
-		rc = sbi_hart_protection_register(&epmp_protection);
-		if (rc)
-			return rc;
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
index 00000000..ab96e2fa
--- /dev/null
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -0,0 +1,356 @@
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
+	if (!sbi_hart_pmp_count(scratch))
+		return 0;
+
+	rc = sbi_hart_protection_register(&pmp_protection);
+	if (rc)
+		return rc;
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
+		rc = sbi_hart_protection_register(&epmp_protection);
+		if (rc)
+			return rc;
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
