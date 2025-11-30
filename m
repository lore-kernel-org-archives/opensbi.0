Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890BECFD376
	for <opensbi@archiver.kernel.org>; Sun, 30 Nov 2025 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVrC28EPdCuQeQhDnCjhsIZHMFKlDnDvGFB+o+iuvj0=; b=FiCJdxkWVnogNj
	LLAj673ZeWonW9R6uZRnmraH76L2Jfd0HhdMU4vD/MqyX56IYbFydbyrUTdo3dTvsjBWAh8zbnB2T
	CFqBK2bvVUSLICHZjILbIbC7C2DmSpttr1ij5AA9zQ76tk28xuFNKqnmpy4bZnt+zPFXL8457v1RO
	irb9DKyBSoUP03PB+3RWLWXsFM/o8knrJk7ntEv2boRdFoeO5F7i/lKvpEaYKWJyHrRTDuslvmf3L
	zGX6d+xdexOH42TC/3ekL7A0ZRDk7tytANeXm6h8rCj08rgvrBmVcgXQKe48li+tPzoBPnUf0HaAm
	rlC+UJPnrMYELHxA9kmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQL-00000002FB0-1Ups;
	Sun, 30 Nov 2025 11:17:01 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQI-00000002F9f-0zyG
	for opensbi@lists.infradead.org;
	Sun, 30 Nov 2025 11:16:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so2788367b3a.3
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 03:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764501417; x=1765106217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NqOPBAzOtPh2mJ20WFaA367RdcfoPBYdzvqZTZ3afI=;
        b=Ch+yBN19ErPtQfXR1JfALWiPubV5+1FEkuva6HWPuockUR/+djaBmF3j3hNxx90n1z
         DLeLG00ZFdaP0ajmdWucG98v0/NXKYkVW+6v1ZTESvEGUM2L2neJyZmkvn9GL3clxBt/
         iPKWbU6zrQ+64zOXBPQhTfVoDztIBQ3mLdZtTnpsvRGUS69XOMbR9n0mH3UalRnnLAt3
         AmVi6ee7SSKJn3MPX6jhLyTzPywsWY5mPhwLsQXUzWtrG9y0sz9TU8yl0VWisdi3ISi6
         YN7qS8xxhE5eLmxSW4KGbEC+WoEVeE5NN8NCYMFiJ+MiG6pdQujJqwpBfCCHyag/h+29
         khMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764501417; x=1765106217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7NqOPBAzOtPh2mJ20WFaA367RdcfoPBYdzvqZTZ3afI=;
        b=YWovnsa5ncoWHLqCPss7zIB1PcodL+7WQBHBKWBPES4LyUd2RqbZpjoMXgxUDj32DW
         uToBVtyHNPr9b1E0HcrtQGOQcbSjjNI/StuKEHNwhp/M63eAc85CwjS6JYYYbaUxIXuQ
         llHqMA3IBZnQjMcDz5d3AgzCIRLBnaLmd2mTg4ohimK2beuOW31l9w9VdXDVHbcjbzwB
         a0jqkfaTXsRELTQrmBxTl0iD5w91yqRbrkTFlOIl2xiTtDlL9fSZsikFpwbUZ0kmVAiP
         y7sjmbatPpg5CJhZ9LuUYW3qq+5XMAIp/OgPU0Q2nkciVzPrbCRWAiQxJpimcdwrJo10
         LZhw==
X-Gm-Message-State: AOJu0YxfwoJVCRm6ItTPfEdb/PuUYMp60kKuy8lwd5Y/WLRQrKqdiB2U
	EKNDZgMUMhzbBMrMuAAoMFkkskMJOed4chv7kmaYafuHocTiSntKRQ2ne8VkfgxV4PI+S+o5Ez7
	P+/rKE3OI8w26kF3zRYGb1dDzVD9HjStGj3D/rKpQ0Ho5NxwBCLb82HUKXBbvnI9siE5EF3K1N8
	zhBa9QhFSOlluqRXo9N4fe8gv74ngw5f6J6yaBIMYjKLy56lKI
X-Gm-Gg: ASbGncsRvkY1ViVZQM7k9PJZzqox1PomRDcKyg2dqj0gBpvp0wzUcsVTS7XIFup1sxA
	JOOcRbVV8vHa3ZX9SEURilFAlmxYtxdO64vpyCCIDaU5+MSwJfQ9rKXd1sEk9l0lCRX+UDaaacf
	ECAqmaAPCQJRqiu/Mh6Q1cJwLCSmjiGWlrW/A2MuzgLs/MmvF278dkBIXrA7VA7cQaE5gNF5LeS
	DQR/WjmBarGA1hOjfdQovtemNf+pqTTxEnH+ZX9za2qJwj4G2FuC/noehaVI04XDsn+NwHR3rUj
	K4YgYJnt6Urdt0zxLD8OGP4/MASz/mTIvEZ8HcaFAjw2x0SD3Fn8b76iYKb7rUD13+g0HtS5kmn
	DZQLyiGf8KAbShC+aMSQDtdEiQ/g8tFlPZcoaQcO9vy5vcUGhok9QvsJF98V1LvmU01lcxDIlUL
	qE57xF6yBosMI8blM1eteyAtcDpIWFja62QdY=
X-Google-Smtp-Source: AGHT+IGdW16MAj5avhZRt1sVUf7aIRZUwrHe/vwLhTJAhF+wBdMvW8EDn9aeKxxeAoHZrl+BWlScLw==
X-Received: by 2002:a05:6a21:3288:b0:361:4f83:10f5 with SMTP id adf61e73a8af0-3637e0a57edmr23985401637.48.1764501416978;
        Sun, 30 Nov 2025 03:16:56 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1819277c5sm10027050b3a.4.2025.11.30.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 03:16:56 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 4/6] lib: sbi: sbi_hart: extend PMP handling to support multiple reserved entries
Date: Sun, 30 Nov 2025 19:16:41 +0800
Message-ID: <20251130111643.1291462-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251130111643.1291462-1-peter.lin@sifive.com>
References: <20251130111643.1291462-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_031658_298542_E0266383 
X-CRM114-Status: GOOD (  21.07  )
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

Previously, OpenSBI supported only a single reserved PMP entry. Add
support for multiple reserved PMP entries, with the count determined
by the platform-specific sbi_platform_reserved_pmp_count() function.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_hart.h       | 15 ----------
 lib/sbi/sbi_domain_context.c |  6 ++--
 lib/sbi/sbi_hart.c           | 53 +++++++++++++++++++++++++-----------
 3 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e66dd52f..6d5d0be7 100644
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
- * unmapped. sbi_hart_map_saddr/sbi_hart_unmap_saddr function
- * pair should be used to map/unmap the shared memory.
- */
-#define SBI_SMEPMP_RESV_ENTRY		0
-
 struct sbi_hart_features {
 	bool detected;
 	int priv_version;
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 74ad25e8..d2269529 100644
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
@@ -102,6 +103,8 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom, *target_dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	u32 reserved_pmp_count = sbi_platform_reserved_pmp_count(plat);
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	if (!ctx || !dom_ctx || ctx == dom_ctx)
@@ -121,11 +124,10 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	spin_unlock(&target_dom->assigned_harts_lock);
 
 	/* Reconfigure PMP settings for the new domain */
-	for (int i = 0; i < pmp_count; i++) {
+	for (int i = reserved_pmp_count; i < pmp_count; i++) {
 		/* Don't revoke firmware access permissions */
 		if (sbi_hart_smepmp_is_fw_region(i))
 			continue;
-
 		sbi_platform_pmp_disable(sbi_platform_thishart_ptr(), i);
 		pmp_disable(i);
 	}
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 548fdecd..a7235758 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -32,6 +32,7 @@ void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
 static unsigned long hart_features_offset;
 static DECLARE_BITMAP(fw_smepmp_ids, PMP_COUNT);
 static bool fw_smepmp_ids_inited;
+static unsigned int saddr_pmp_id;
 
 static void mstatus_init(struct sbi_scratch *scratch)
 {
@@ -349,6 +350,8 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 				     unsigned long pmp_addr_max)
 {
 	struct sbi_domain_memregion *reg;
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	u32 reserved_pmp_count = sbi_platform_reserved_pmp_count(plat);
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx, pmp_flags;
 
@@ -358,15 +361,13 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	 */
 	csr_set(CSR_MSECCFG, MSECCFG_RLB);
 
-	/* Disable the reserved entry */
-	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	/* Disable the reserved entries */
+	for (int i = 0; i < reserved_pmp_count; i++)
+		pmp_disable(i);
 
 	/* Program M-only regions when MML is not set. */
-	pmp_idx = 0;
+	pmp_idx = reserved_pmp_count;
 	sbi_domain_for_each_memregion(dom, reg) {
-		/* Skip reserved entry */
-		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
-			pmp_idx++;
 		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
 			return SBI_EFAIL;
 
@@ -405,11 +406,8 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	csr_set(CSR_MSECCFG, MSECCFG_MML);
 
 	/* Program shared and SU-only regions */
-	pmp_idx = 0;
+	pmp_idx = reserved_pmp_count;
 	sbi_domain_for_each_memregion(dom, reg) {
-		/* Skip reserved entry */
-		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
-			pmp_idx++;
 		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
 			return SBI_EFAIL;
 
@@ -439,11 +437,14 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 				     unsigned long pmp_addr_max)
 {
 	struct sbi_domain_memregion *reg;
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	u32 reserved_pmp_count = sbi_platform_reserved_pmp_count(plat);
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned int pmp_idx = 0;
+	unsigned int pmp_idx;
 	unsigned int pmp_flags;
 	unsigned long pmp_addr;
 
+	pmp_idx = reserved_pmp_count;
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
 			return SBI_EFAIL;
@@ -481,6 +482,19 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
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
@@ -492,8 +506,9 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
-	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
+	if (reserved_pmp_alloc(&saddr_pmp_id)) {
 		return SBI_ENOSPC;
+	}
 
 	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
 	     order <= __riscv_xlen; order++) {
@@ -509,23 +524,29 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
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
