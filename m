Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411DECF8577
	for <opensbi@archiver.kernel.org>; Thu, 20 Nov 2025 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlqpBsCQdRMvfkbKAv0V+/RvvklNtZ+YPrGNo4h1s3Y=; b=Er+szd6chSdo+B
	SO4RPGA8X3fLxk2kRC+VhLHbEaxS1FsZ6jvqQzWSp4f2Jc7amS5hn9vJ/QwX9zFqFX4D9vfNuKpcC
	MoqWtmF24NvOuU85+Ggp+xOQy3V4m7pNKJ4U2KNADGkr0R2FkQMP0sWwi19+eAPZkBvZavhZeCVrf
	9i5dfC3WZIBxUcA3JMiu7SB7ATWEL5J4l3PKT1hZ7ppi8hR2fPTB2tsZIfEBjayxwIGY4lZRohnX4
	HwuRdx9HoFB+uaCiB9EGVmHDAhtSZsQxtAUzRMsFBHi535gP6rMXN/F1ko0nYClU4f0oY3FG6PO6+
	mCliv5/NjgiI+KExViig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM15h-00000006QoT-3neV;
	Thu, 20 Nov 2025 09:36:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM15f-00000006QnZ-3AbO
	for opensbi@lists.infradead.org;
	Thu, 20 Nov 2025 09:36:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29558061c68so9496155ad.0
        for <opensbi@lists.infradead.org>; Thu, 20 Nov 2025 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763631394; x=1764236194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81eCKNJUil88K14qZyPKwgwApPc60Y5Fuyb/DfpJU30=;
        b=TT6jGVsB9FLEF70MIvOELw2xwLjHBNxk7jIfCSPtsLwxb7ABFpcQoMJsrR4/CMcR8w
         0UfWLNvyCO0wr216ci1SZIOa8RHhQvH+YTnj+VCG+ko6GsSAR/g17dqWcyBTqc4VlcI0
         0vM39jmLP+ClR2szNfVK6OysxS34wl3eTymIVj3uqY2PwByWevo4JbZJVPOFyR8vW3dJ
         65+6lmVzOdFtcoxMi6QuCp0fA7SfF0sg865z3TQSQOKoP4QkJBg/Io/OnwADG2Z5PbUu
         U6uZssbb4hHz3+WM0d5Qkuxm8zBGt4KeHmO1oaEU304O3eKE+HZ8P1mGCdnca/K8USDi
         KYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631394; x=1764236194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=81eCKNJUil88K14qZyPKwgwApPc60Y5Fuyb/DfpJU30=;
        b=AqZSpZNuYkyuv6UZP27oIYiHSFI2JfkqamLShsYMmEr3am/VjxDHriYOL3QCxfHxQA
         2/sHhU/k7ZAaqYWl+6hMrHFVvLP363QdfFseXi2tUJ3bLrJ4ofsmvPDvankh+2E6ra47
         1AeDE/OgTFRmJX3ckTW/j/IQdmHdk4Nw8+44AHuMqbVse4+Neg96/aVkTUP28XzrF5Ls
         jrEyyi5YC6sJdB42buPM0Uy/WT2doT7jhBY+F7cp3/MEcow4dTwPVKDpeWyaEOeAjsAv
         QYJ92TUWUt9UxGhKNqDUSDqkqPxgP69YWPNSvNIGaQzMQBWOrOqLX9W0iLF6/ZXrRKUn
         HjNg==
X-Gm-Message-State: AOJu0YwbFYV1c0OEgf/DdA66ux387Ou2OIPr41emjfg55NAleVa5tLYc
	XShDyvGCn0BGEuPVvlhpuBuP8Ln05RTdTD6IO9DRB3Wy4mvqHqQLZGuN3uNbILnI
X-Gm-Gg: ASbGnctaIHwxIGmX7hYrfxvswjVrP8r2EjVouNvTj2IlAQUww+tSz/hWi6Zez76Tbtn
	8ApKzfYRBzt13XUxnkCU1Ke/EYdOdT4Arh0G/+9fVPvFf5fNuFpdxGvKSZRRam9smkPy9+zHRd9
	TrmZmS6H8reEPquVpY4Bzafv8CQ0vdzeds1hCyDR2hMCPj+S+3Up4PIQkffZBbY9/STC7dtnvMx
	35SQKCLO/sN9/HScncHVtlqRrXZou36U+Do7+rXOr8bWPPrUcI3NF6Vkjt1J+B+Nlym/N9C7py+
	BlWuFcEHFl8m9t74LtXYqKzR89rUrhCHhquAxd+vM0Gy3oIPG6XQ/m5REiZl99uyE2+wx3bi5w9
	CvTbmVyE/SWUCLgLJbkApHYCbGZV4x7btSt1l+RrW0au+jLldfBBoWPncDOlcS6pzM1Buxosbyt
	NvSLRlBKUtK2msswHjpTzVnfQ=
X-Google-Smtp-Source: AGHT+IGhk/XQ1eT7yumXNi5sSt/vvWdfN09/bbyaSPniYAzPacPMd/Y8S0xpy1RRSr30VNtoNYkPNg==
X-Received: by 2002:a17:90b:3bc3:b0:340:ba29:d3b6 with SMTP id 98e67ed59e1d1-3472a8e9fa5mr1808978a91.6.1763631394451;
        Thu, 20 Nov 2025 01:36:34 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34726696b52sm2019042a91.1.2025.11.20.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:36:33 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v3 1/4] lib: sbi: allow platform to override PMP (un)configuration
Date: Thu, 20 Nov 2025 01:34:37 -0800
Message-Id: <20251120093440.4533-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120093440.4533-1-ganboing@gmail.com>
References: <20251120093440.4533-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_013635_804898_69D070FD 
X-CRM114-Status: GOOD (  21.95  )
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

Platform sometimes wants to override the entire PMP (un)config phase,
not just performing additional work for each individual PMP entry. This
allows platforms to insert SoC/core specific PMP entries in a way that
works together with the existing ones set by lib/ code, not conflicting.
platform can also choose to merge or skip memory regions in a reasonable
way in case there's a shortage of PMP entries.

In addition, logic for determining flags in `sbi_hart_oldpmp_configure`
is abstracted out as sbi_domain_get_oldpmp_flags, analogous to the
`sbi_domain_get_smepmp_flags` for smepmp. so platform with traditional
PMP can leverage it in its own `pmp_configure`

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_domain.h     |  7 +++++
 include/sbi/sbi_hart.h       |  3 ++
 include/sbi/sbi_platform.h   | 53 ++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_domain.c         | 21 ++++++++++++++
 lib/sbi/sbi_domain_context.c | 11 +-------
 lib/sbi/sbi_hart.c           | 45 ++++++++++++++++++------------
 6 files changed, 113 insertions(+), 27 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 1196d609..3360e090 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -253,6 +253,13 @@ void sbi_domain_memregion_init(unsigned long addr,
 				unsigned long flags,
 				struct sbi_domain_memregion *reg);
 
+/**
+ * Return the oldpmp pmpcfg LRWX encoding for the flags in @reg.
+ *
+ * @param reg pointer to memory region; its flags field encodes permissions.
+ */
+unsigned int sbi_domain_get_oldpmp_flags(struct sbi_domain_memregion *reg);
+
 /**
  * Return the Smepmp pmpcfg LRWX encoding for the flags in @reg.
  *
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e66dd52f..c0bf79e0 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -133,6 +133,8 @@ struct sbi_hart_features {
 };
 
 struct sbi_scratch;
+struct sbi_domain;
+struct sbi_domain_memregion;
 
 int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
@@ -147,6 +149,7 @@ unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
+void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
 int sbi_hart_map_saddr(unsigned long base, unsigned long size);
 int sbi_hart_unmap_saddr(void);
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index d75c12de..a53e1797 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -146,6 +146,18 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+
+	/** platform pmp configure override on current HART */
+	int (*pmp_configure)(unsigned int pmp_count,
+			     unsigned int pmp_log2gran,
+			     unsigned long pmp_addr_max);
+	/**
+	 * You need both pmp_configure/unconfigure to properly
+	 * provide platform override
+	 */
+
+	/** platform pmp unconfigure override on current HART */
+	void (*pmp_unconfigure)(void);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -666,6 +678,47 @@ static inline void sbi_platform_pmp_disable(const struct sbi_platform *plat,
 		sbi_platform_ops(plat)->pmp_disable(n);
 }
 
+/**
+ * Check if platform wants to override PMP (un)configuration
+ *
+ * @param plat pointer to struct sbi_platform
+ */
+static inline bool sbi_platform_pmp_override(const struct sbi_platform *plat)
+{
+	return plat &&
+		sbi_platform_ops(plat)->pmp_configure &&
+		sbi_platform_ops(plat)->pmp_unconfigure;
+}
+
+/**
+ * Platform PMP configuration override
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param pmp_count number of PMP entries
+ * @param pmp_log2gran PMP granularity
+ * @param pmp_addr_max largest value pmpaddr(x) can hold
+ */
+static inline int sbi_platform_pmp_configure(const struct sbi_platform *plat,
+					     unsigned int pmp_count,
+					     unsigned int pmp_log2gran,
+					     unsigned long pmp_addr_max)
+{
+	return sbi_platform_ops(plat)->pmp_configure(pmp_count,
+						     pmp_log2gran,
+						     pmp_addr_max);
+}
+
+/**
+ * Platform PMP unconfiguration override
+ *
+ * @param plat pointer to struct sbi_platform
+ */
+static inline void sbi_platform_pmp_unconfigure(
+					const struct sbi_platform *plat)
+{
+	return sbi_platform_ops(plat)->pmp_unconfigure();
+}
+
 #endif
 
 #endif
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index da0f0557..32e4c882 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -122,6 +122,27 @@ void sbi_domain_memregion_init(unsigned long addr,
 	}
 }
 
+unsigned int sbi_domain_get_oldpmp_flags(struct sbi_domain_memregion *reg)
+{
+	unsigned int pmp_flags = 0;
+
+	/*
+	 * If permissions are to be enforced for all modes on
+	 * this region, the lock bit should be set.
+	 */
+	if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
+		pmp_flags |= PMP_L;
+
+	if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+		pmp_flags |= PMP_R;
+	if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+		pmp_flags |= PMP_W;
+	if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+		pmp_flags |= PMP_X;
+
+	return pmp_flags;
+}
+
 unsigned int sbi_domain_get_smepmp_flags(struct sbi_domain_memregion *reg)
 {
 	unsigned int pmp_flags = 0;
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 74ad25e8..ea7f741b 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -102,7 +102,6 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom, *target_dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	if (!ctx || !dom_ctx || ctx == dom_ctx)
 		return SBI_EINVAL;
@@ -120,15 +119,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	sbi_hartmask_set_hartindex(hartindex, &target_dom->assigned_harts);
 	spin_unlock(&target_dom->assigned_harts_lock);
 
-	/* Reconfigure PMP settings for the new domain */
-	for (int i = 0; i < pmp_count; i++) {
-		/* Don't revoke firmware access permissions */
-		if (sbi_hart_smepmp_is_fw_region(i))
-			continue;
-
-		sbi_platform_pmp_disable(sbi_platform_thishart_ptr(), i);
-		pmp_disable(i);
-	}
+	sbi_hart_pmp_unconfigure(scratch);
 	sbi_hart_pmp_configure(scratch);
 
 	/* Save current CSR context and restore target domain's CSR context */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index a91703b4..b39f4de9 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -448,23 +448,9 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
 			return SBI_EFAIL;
 
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
+		pmp_flags = sbi_domain_get_oldpmp_flags(reg);
 		pmp_addr = reg->base >> PMP_SHIFT;
+
 		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
 			sbi_platform_pmp_set(sbi_platform_ptr(scratch),
 					     pmp_idx, reg->flags, pmp_flags,
@@ -528,12 +514,34 @@ int sbi_hart_unmap_saddr(void)
 	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
 }
 
+void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
+{
+	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+
+	if (sbi_platform_pmp_override(plat)) {
+		sbi_platform_pmp_unconfigure(plat);
+		return;
+	}
+
+	/* Reconfigure PMP settings for the new domain */
+	for (unsigned int i = 0; i < pmp_count; i++) {
+		/* Don't revoke firmware access permissions */
+		if (sbi_hart_smepmp_is_fw_region(i))
+			continue;
+
+		sbi_platform_pmp_disable(sbi_platform_thishart_ptr(), i);
+		pmp_disable(i);
+	}
+}
+
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 {
 	int rc;
 	unsigned int pmp_bits, pmp_log2gran;
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 	unsigned long pmp_addr_max;
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (!pmp_count)
 		return 0;
@@ -542,7 +550,10 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
 	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
 
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
+	if (sbi_platform_pmp_override(plat))
+		rc = sbi_platform_pmp_configure(plat, pmp_count,
+						pmp_log2gran, pmp_addr_max);
+	else if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		rc = sbi_hart_smepmp_configure(scratch, pmp_count,
 						pmp_log2gran, pmp_addr_max);
 	else
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
