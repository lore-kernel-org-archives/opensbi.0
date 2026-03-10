Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DBFFCC9A2
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iSYjAqECy8oJIAoIzm8u9zX8yt7Uak0Iwq4vH84GNg=; b=X+/UYNJSo7bIQ9
	hBevZRtZWsydLJFhQG5ev6ZuLFF+FIZXm2KiPkzT2iG54IiTaXBtlL9BA0ncPWqxEidQOd5xwuIhg
	KKzTY8Ok6sE3dOivTY0YV06cLXav5WM7cxkt+VVledyHPPJAqe8hXlZRVEDvuADUEP8cMPRM/CWd/
	SKvoKIzL5DLGbS8ZyCRnz7+lCnG3cgRypJcYQb2AHQHfdnJYtOttGfNq7qGiRrpunADsz8OoLO7ww
	KHads9iaK0VQFekBkqbJyhm+EqFWClvgnx+FqmfQhnxh5VJE+IuaCFMWej8MFwIJq1kyicqpuvK9s
	+7EX0QASzWgbsP7n49sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlJ6-00000008QO4-0Ko8;
	Tue, 10 Mar 2026 00:50:44 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlJ4-00000008QNH-11fc
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 00:50:43 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82990763921so4292803b3a.1
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 17:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773103841; x=1773708641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHMoAVgnPBDu7Hjs9PV1/3/jRPO16v3SxHNq0hsfqQQ=;
        b=apL2JPWgP86GYnlAWBEtzTSwMBXHQbzPFxX7hQ2JwVWyg9TXONODMujqsIGNL8dZPK
         P5FtI5dhSQTmgOCufIOLcfJ8sJxd10R03wSUJsVjMzyVd+ePZPQcS7sC1Jh6uhsgqDKR
         GoW0rn1FiDbdHCNdIeuHsMCV0GbwbPMkHNBwj10bHOgKdQM84ZVDYxe83DZEGvcrchSX
         r2VeIpICAtH6QKwLLNyTDj635FRtOoCxWhb7lBRMnYD1/zNvQrUCBoO0MkVpH/zr59bn
         2IvsnnpzkKj0HKexsJSt6PrJAnZSUQQPZQj2w1G9NqYalMWh91quBY2dYgmlB0uhR69Q
         7O7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773103841; x=1773708641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHMoAVgnPBDu7Hjs9PV1/3/jRPO16v3SxHNq0hsfqQQ=;
        b=qh/4wQ1tdZy3EUJdm1qdr3THHL0mpBnp7g7CRHjbWD5gvNm+2zr2begX8Wcy53lnQ5
         M3jDQJ5B+RGIdA16sqKC1GH3ZpRTyEcoEZYHdPROkQl/tN15817dr9RVO8Ic3+36u+d7
         ueBaLyLyaM51SgRmilAcEpzeqXZvMPzhwZm9nvJ38DcqxnEVmLE7ZFb9X+klCLwNuVoR
         eYSg9lfCzfeNxUrbVwTa74BVYxFnF4x4DxNPDWrtNtonxzcCxBAFz/k4klguMLwFEbRY
         MEj0CMbjnkzpbyLMSBQd8F1BkMewnydY80ngZkFeV3ffPp4rQ1fcjMpDRMCfF9u4sLB0
         UrfA==
X-Gm-Message-State: AOJu0YxTkHNK5kw/Z7xUnntIaDC8IqWpdb0+WpNzM2WLu0exekohdZfy
	BBGnZfb2HyrW9qVpaDOgeyIVZu67wjO210sySGbeSGSzIb3OAOOxWv4v+/3ZaQ==
X-Gm-Gg: ATEYQzy5QQzCfO77FLXD+lEhNQf4M44erndWaQT9lLk/PRK/68ffCEOv0l2nEuOzHs4
	bJGef0EaKho9V2NAcM0JgmOouvDkfkoHFubsk+Hg1DoWR3ZQrS4To1AzvQgP/117yaYX2+DZXEV
	sWUqE5CcbiIPQHePrPwDheY28wpaJGKEL4MEseCIYXImRfuwzf60588thDBMnIbToWM6R0e1RRZ
	lo63WuP4SewUOgFQBhQxBc75NN+cBhJSjurTtwe+Mll7jwN+YTIILHNIy6c5g1409QNKm5oaRRP
	HyGM3PvnA4mziUE/9Lsi9zWudj5kRNuR0ojjnDY+f9Bd6Xo5BCjj74YgGqtsRc9lfMI/bpAZxyX
	H+7tbtIz1kKWD/fCvt1ebjhuUrXdqrkRV9gUhrWPsDYq3S/evf76x6o6Uu/wilMRDPq+HkYC6Gq
	AZNMiehWxcfFi/9Do5GsS067VsbC+rOIo91LzF56nf9WxeyOeQ0iBQsCVR4Q6hzjyTx5mt
X-Received: by 2002:a05:6a00:759b:b0:829:8e63:fca0 with SMTP id d2e1a72fcca58-829a2f7ac82mr9502906b3a.35.1773103840884;
        Mon, 09 Mar 2026 17:50:40 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm11357635b3a.29.2026.03.09.17.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:50:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 3/4] lib: sbi: Add hart_ prefix to PMP functions
Date: Tue, 10 Mar 2026 10:49:56 +1000
Message-ID: <20260310005000.3837512-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310005000.3837512-1-npiggin@gmail.com>
References: <20260310005000.3837512-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_175042_305796_8253B3CB 
X-CRM114-Status: GOOD (  15.91  )
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

Give PMP functions that deal with HART CSRs a hart_ prefix, to help
distinguish from general PMP encoding functions that will be shared by
the Tenstorrent IOMMU.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/riscv_asm.h          |  8 +++----
 lib/sbi/riscv_asm.c              | 10 ++++-----
 lib/sbi/sbi_hart_pmp.c           | 14 ++++++-------
 platform/generic/eswin/eic770x.c | 36 ++++++++++++++++----------------
 4 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index b97e1880..14bc35e5 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -210,15 +210,15 @@ int misa_xlen(void);
 void misa_string(int xlen, char *out, unsigned int out_sz);
 
 /* Disable pmp entry at a given index */
-int pmp_disable(unsigned int n);
+int hart_pmp_disable(unsigned int n);
 
 /* Check if the matching field is set */
-int is_pmp_entry_mapped(unsigned int entry);
+int hart_is_pmp_enabled(unsigned int n);
 
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
+int hart_pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
 
-int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
+int hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len);
 
 #endif /* !__ASSEMBLER__ */
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c11abb1a..03c8e4d7 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -329,23 +329,23 @@ int hart_pmp_write(unsigned int n, pmp_t *pmp)
 	return SBI_OK;
 }
 
-int pmp_disable(unsigned int n)
+int hart_pmp_disable(unsigned int n)
 {
 	struct pmp pmp = { .cfg = 0, .addr = 0 };
 	return hart_pmp_write(n, &pmp);
 }
 
-int is_pmp_entry_mapped(unsigned int entry)
+int hart_is_pmp_enabled(unsigned int n)
 {
 	pmp_t pmp;
 
-	if (hart_pmp_read(entry, &pmp))
+	if (hart_pmp_read(n, &pmp))
 		return pmp_enabled(&pmp);
 
 	return false;
 }
 
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
+int hart_pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len)
 {
 	pmp_t pmp;
@@ -358,7 +358,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	return hart_pmp_write(n, &pmp);
 }
 
-int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
+int hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len)
 {
 	pmp_t pmp;
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 02a3b3c4..0aa4752f 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -100,7 +100,7 @@ static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 		sbi_platform_pmp_set(sbi_platform_ptr(scratch),
 				     pmp_idx, reg->flags, pmp_flags,
 				     reg->base, reg->order);
-		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
+		hart_pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
 	} else {
 		sbi_printf("Can not configure pmp for domain %s because"
 			   " memory region address 0x%lx or size 0x%lx "
@@ -139,7 +139,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
 	csr_set(CSR_MSECCFG, MSECCFG_RLB);
 
 	/* Disable the reserved entry */
-	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	hart_pmp_disable(SBI_SMEPMP_RESV_ENTRY);
 
 	/* Program M-only regions when MML is not set. */
 	pmp_idx = 0;
@@ -224,7 +224,7 @@ static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
 	unsigned int pmp_flags = (PMP_W | PMP_X);
 	unsigned long order, base = 0;
 
-	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
+	if (hart_is_pmp_enabled(SBI_SMEPMP_RESV_ENTRY))
 		return SBI_ENOSPC;
 
 	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
@@ -244,7 +244,7 @@ static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
 	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
 			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
 			     pmp_flags, base, order);
-	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
+	hart_pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
 
 	return SBI_OK;
 }
@@ -253,7 +253,7 @@ static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
 				       unsigned long addr, unsigned long size)
 {
 	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
-	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	return hart_pmp_disable(SBI_SMEPMP_RESV_ENTRY);
 }
 
 static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
@@ -281,7 +281,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
 			sbi_platform_pmp_set(sbi_platform_ptr(scratch),
 					     pmp_idx, reg->flags, pmp_flags,
 					     reg->base, reg->order);
-			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
+			hart_pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
 		} else {
 			sbi_printf("Can not configure pmp for domain %s because"
 				   " memory region address 0x%lx or size 0x%lx "
@@ -307,7 +307,7 @@ static void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
 			continue;
 
 		sbi_platform_pmp_disable(sbi_platform_ptr(scratch), i);
-		pmp_disable(i);
+		hart_pmp_disable(i);
 	}
 }
 
diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index 7330df9f..dfca0c41 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -254,21 +254,21 @@ static int eswin_eic7700_final_init(bool cold_boot)
 				   __func__);
 			return SBI_EFAIL;
 		}
-		pmp_set(pmp_idx++, sbi_domain_get_oldpmp_flags(reg),
-			reg->base, reg->order);
+		hart_pmp_set(pmp_idx++, sbi_domain_get_oldpmp_flags(reg),
+			     reg->base, reg->order);
 	}
 
-	pmp_set(PMP_RESERVED_A, PMP_L, EIC770X_L3_ZERO_REMOTE,
-			   log2roundup(EIC770X_L3_ZERO_SIZE));
+	hart_pmp_set(PMP_RESERVED_A, PMP_L, EIC770X_L3_ZERO_REMOTE,
+		     log2roundup(EIC770X_L3_ZERO_SIZE));
 	/**
 	 * Enable P550 internal + System Port, so OpenSBI can access
 	 * CLINT/PLIC/UART. Might be overwritten in pmp_configure.
 	 */
-	pmp_set(PMP_FREE_A_START + PMP_FREE_A_COUNT - 1, 0, 0,
-		log2roundup(EIC770X_MEMPORT_BASE));
+	hart_pmp_set(PMP_FREE_A_START + PMP_FREE_A_COUNT - 1, 0, 0,
+		     log2roundup(EIC770X_MEMPORT_BASE));
 
-	pmp_set(PMP_RESERVED_B, PMP_L, 0,
-		log2roundup(EIC770X_MEMPORT_LIMIT));
+	hart_pmp_set(PMP_RESERVED_B, PMP_L, 0,
+		     log2roundup(EIC770X_MEMPORT_LIMIT));
 	/**
 	 * These must come after the setup of PMP, as we are about to
 	 * enable speculation and HW prefetcher bits
@@ -321,13 +321,13 @@ static int eswin_eic7700_pmp_configure(struct sbi_scratch *scratch)
 		if (pmp_idx >= pmp_max)
 			goto no_more_pmp;
 
-		pmp_set(pmp_idx++, sbi_domain_get_oldpmp_flags(reg),
-			reg->base, reg->order);
+		hart_pmp_set(pmp_idx++, sbi_domain_get_oldpmp_flags(reg),
+			     reg->base, reg->order);
 		prev = reg;
 	}
 	/* Disable the rest */
 	while (pmp_idx < pmp_max)
-		pmp_disable(pmp_idx++);
+		hart_pmp_disable(pmp_idx++);
 
 	/* Process the second free range B [7-7] */
 	pmp_idx = PMP_FREE_B_START,
@@ -340,12 +340,12 @@ static int eswin_eic7700_pmp_configure(struct sbi_scratch *scratch)
 		if (pmp_idx >= pmp_max)
 			goto no_more_pmp;
 
-		pmp_set(pmp_idx++, sbi_domain_get_oldpmp_flags(reg),
-			reg->base, reg->order);
+		hart_pmp_set(pmp_idx++, sbi_domain_get_oldpmp_flags(reg),
+			     reg->base, reg->order);
 	}
 	/* Disable the rest */
 	while (pmp_idx < pmp_max)
-		pmp_disable(pmp_idx++);
+		hart_pmp_disable(pmp_idx++);
 
 	sbi_hart_pmp_fence();
 	return 0;
@@ -357,14 +357,14 @@ no_more_pmp:
 static void eswin_eic7700_pmp_unconfigure(struct sbi_scratch *scratch)
 {
 	/* Enable P550 internal + System Port */
-	pmp_set(PMP_FREE_A_START + PMP_FREE_A_COUNT - 1, 0, 0,
-		log2roundup(EIC770X_MEMPORT_BASE));
+	hart_pmp_set(PMP_FREE_A_START + PMP_FREE_A_COUNT - 1, 0, 0,
+		     log2roundup(EIC770X_MEMPORT_BASE));
 
 	for (unsigned int i = 0; i < PMP_FREE_A_COUNT - 1; i++)
-		pmp_disable(i + PMP_FREE_A_START);
+		hart_pmp_disable(i + PMP_FREE_A_START);
 
 	for (unsigned int i = 0; i < PMP_FREE_B_COUNT; i++)
-		pmp_disable(i + PMP_FREE_B_START);
+		hart_pmp_disable(i + PMP_FREE_B_START);
 }
 
 static struct sbi_hart_protection eswin_eic7700_pmp_protection = {
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
