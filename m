Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EA5CE8D6B
	for <opensbi@archiver.kernel.org>; Mon, 17 Nov 2025 05:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yi/l2lFy/78MHDqV369OzVeDOzUpgpyfLWtpTVgmWmU=; b=YZAouKSIzjJ42g
	WRPE3b1bwCxtEeSyasY4EwUX8JoW8cmHYREGaOP25uUG968rv0sDVpdBPWOKjHKrr9TFvSY4Na5qT
	j8U+xEUmht4gBk4CKpudcM3p/7cS5vnCfgHMvUldbtD47Ww3ZfPsP5ZTPc7exQrjex1LtdBt6pQjq
	Ya3YcFkLXT09aFispX9lsG+jjEMTxOyMlfjaOljnEr4cwVdd2YwGn6DGAg0oN/kMP24Covtper8bK
	7zQIR6cYwTnLLeJ426WSteSESq659HBNPamhrhrSWYWKtWJO9yJYQMcDNtD5pJ5xjvaDPLSDtDp5/
	t9xfqNx4438u1j9bL8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8C-0000000FT5K-4B5s;
	Mon, 17 Nov 2025 05:50:28 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8A-0000000FT4X-4BO7
	for opensbi@lists.infradead.org;
	Mon, 17 Nov 2025 05:50:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7b80fed1505so3149060b3a.3
        for <opensbi@lists.infradead.org>; Sun, 16 Nov 2025 21:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763358626; x=1763963426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDJY2jf0mHXD92S+RUjn5yVbKR6MQ3HTTWD4wg0CRlg=;
        b=Q7h0Fr9ELZK+wH4Kg+y/Q8U9RwT8UoRZxBxFKQD3SnDeubvZdZrNc5owsJDOd5g2Vz
         yKIS8fVm+8TTFdu4Fte1cxEzj6AEeUEm0DKvflJ4EAli4jsBmy7GCa/hHugHNl+Ae8PQ
         fkRcYhOIoxFN0len2vxdIx6QPA8kzOeDHGfpYI0RVIGQyGcqcZ4Uu4PatRgVE1cAChgW
         Dj7hyww5i/nOyPPg/dCEqhjNIlornEb1uhj3FXytxn4uGScTJcJm1zw0H965v7pc4TPu
         jwvla3CSIh3iZtbnJEyS/ljBSm4LqwV94Ugv+Ed9TLwRi7qZmhdWc3bfydVyS2GgRExJ
         xHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763358626; x=1763963426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RDJY2jf0mHXD92S+RUjn5yVbKR6MQ3HTTWD4wg0CRlg=;
        b=Gj1JiFDj1W6IhDqTMCZIaD58eCCErIlfkOxzAfTnUD8HZzW5voaMQXO4EPuhUtSaOl
         xcLCd9xZHMFd0V2Wwt57joaJvBUwrU7AG49DCKUA7jD5BCORGGV5lgaGhW8WPAyT6Q5a
         /a4eP3dKhmJyyhwpUxmzWzXRbyhWct4FcCJz3WwVsoF9/SVTlz/bRYVfPHbOP9IaQ4Ye
         sr1emcHwyG97AVCZg8oPtICTcMc92uvHMk8fPSMXf9kOOZErtPKj0gOw2Pr1NtrHl4Jx
         aABqK3Ce73FlFIwcw/IGL83cqI048nqXpaCXQa/7rlHCpMfFmncHkTvcLMvb9DQlpaqT
         LpRA==
X-Gm-Message-State: AOJu0Yywzf90ecROZnVyZ42mzVMeH/9es+L0XypQ2f3Ao3SrdShcd0pN
	yINg/4vudUbfHaO30SkECT5hm45HrlU/X/hvDkHfeg/2qhigNQyZyZbJKQ3Nmg==
X-Gm-Gg: ASbGnctqeMn4iBGjFro3S5f72GeajEHgNnyDnFPW2mTH23ThFSI+KNSrbOUbHlr7dpZ
	z/aunSs4+rheIVC1lRG5nYinSIoVma6ob897cx6RiB1b4Z9FzIYXMPbBAFCMVqQsVqNQQYlmxNq
	oxgQe/fZXzj9uTto2D8zQE60tD0DNYE+5oh65NeVK+tgoVw9ep89+pmritpyZ54x17snVEmhwTK
	lcK9sH8uo7yy1chMf8XrdbpNQQdJSmwu41bR8es96+2qg+zO1u3D9IGFRLe7qyyyFTzBjsIEup+
	2CQlSzCvt7Hq1YHAzRXASRaSlo2Tpw+jShTUcH9V36yf7s5A6qQhlsaQWC8otVKkTo+WwvETR8M
	8Yd+mLKNfrhU4gdmMZKho7msCJqwWa0nH9N+lq66WBJZ+gK38aeS9820zdHTrRsByuEYni/34NI
	rGmC8WUBVrRFoB
X-Google-Smtp-Source: AGHT+IG9UpuWgPeNEKJFdrcWi0DTAlMdRHK713hn7TQm8bqwTVJinhcnoc2zNtQujYj9mEk967f7fQ==
X-Received: by 2002:a05:6a00:c91:b0:7ba:13f4:a985 with SMTP id d2e1a72fcca58-7ba3b0aea0bmr9913292b3a.23.1763358625689;
        Sun, 16 Nov 2025 21:50:25 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924cd89bcsm11719856b3a.15.2025.11.16.21.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:50:24 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v2 1/5] lib: sbi: allow platform to override PMP (un)configuration
Date: Sun, 16 Nov 2025 21:48:42 -0800
Message-Id: <20251117054846.1335-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117054846.1335-1-ganboing@gmail.com>
References: <20251117054846.1335-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_215027_045740_20C62CF8 
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

In addition, logic in `sbi_hart_oldpmp_configure` is abstracted out as
`sbi_hart_oldpmp_set`, and made public, so platform with traditional PMP
can leverage it in its own `pmp_configure`

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_hart.h       |  9 ++++
 include/sbi/sbi_platform.h   | 53 ++++++++++++++++++++
 lib/sbi/sbi_domain_context.c | 11 +---
 lib/sbi/sbi_hart.c           | 97 ++++++++++++++++++++++++------------
 4 files changed, 129 insertions(+), 41 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e66dd52f..8ece6342 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -133,6 +133,8 @@ struct sbi_hart_features {
 };
 
 struct sbi_scratch;
+struct sbi_domain;
+struct sbi_domain_memregion;
 
 int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
@@ -147,7 +149,14 @@ unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
+void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
+void sbi_hart_oldpmp_set(struct sbi_scratch *scratch,
+			 struct sbi_domain *dom,
+			 struct sbi_domain_memregion *reg,
+			 unsigned int pmp_idx,
+			 unsigned int pmp_log2gran,
+			 unsigned long pmp_addr_max);
 int sbi_hart_map_saddr(unsigned long base, unsigned long size);
 int sbi_hart_unmap_saddr(void);
 int sbi_hart_priv_version(struct sbi_scratch *scratch);
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
index a91703b4..b68b18d4 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -433,6 +433,44 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	return 0;
 }
 
+void sbi_hart_oldpmp_set(struct sbi_scratch *scratch,
+			 struct sbi_domain *dom,
+			 struct sbi_domain_memregion *reg,
+			 unsigned int pmp_idx,
+			 unsigned int pmp_log2gran,
+			 unsigned long pmp_addr_max)
+{
+	unsigned int pmp_flags = 0;
+	unsigned long pmp_addr;
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
+	pmp_addr = reg->base >> PMP_SHIFT;
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
 static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 				     unsigned int pmp_count,
 				     unsigned int pmp_log2gran,
@@ -441,41 +479,13 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 	struct sbi_domain_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx = 0;
-	unsigned int pmp_flags;
-	unsigned long pmp_addr;
 
 	sbi_domain_for_each_memregion(dom, reg) {
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
+		sbi_hart_oldpmp_set(scratch, dom, reg, pmp_idx++,
+				    pmp_log2gran, pmp_addr_max);
 	}
 
 	return 0;
@@ -528,12 +538,34 @@ int sbi_hart_unmap_saddr(void)
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
@@ -542,7 +574,10 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
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
