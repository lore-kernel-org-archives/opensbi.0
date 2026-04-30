Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A05FF8875
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uP8xmn/48k1h0sVsfof/h1wuIjhHkQCjB4A90uI5sOs=; b=0cuGNeJcarwg8q
	tBwvj4mC4319ci1l7cWRZF6/jPQ8ksjdSqnurbc1dnJyf/wNCZt4JvGTY4inZFZJruUTvy+jiUX3h
	ccYwX2cNA797hNN1YMXhfG/jqUOyziQeSat9EFEm04gDAX5DOQn8nAh6SdXoqCuo3CPG4UEMXAwMo
	pNdDYmMpvv3DD82Q8KgmKnWZ8UR4FLJ2YPzh8av/8p7w7hScUK0kAKk20FMQ4Diz1G4iSRehL+TWs
	ii/st9eZYdi+LDa8nezsyaHrdjoxesi3kh0b6S42wPcbYbNUhUqK3G38STSkbf1PAezFy+fxAm4Nm
	avSv4QG8iGil/SiVR55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRe-00000004gFK-3499;
	Thu, 30 Apr 2026 04:56:14 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRc-00000004gEW-1UEl
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:56:13 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c79506f3c40so162303a12.1
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524970; x=1778129770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wzDogUQvoSkhk9vFb3XQ8fdLIe6z+NsDYZSHynFcmI=;
        b=gDWdxUbcvEFvIdDOdmnP/JDsW5IpQmKwqPYbXfKydsfbL0g8wW8O01s+oyo8A6zKox
         IJJLcmm+axZ/qMGcbTtKwC439dg45YsZc9SvsXJj4sOhE15kQkVj2tSi04X8NuEYup4l
         9r+8ei6so1pFkZFZ5xBx6T8dI+Luk9kqGlyRZE63hZOCyR05iHEJaAs8OpxLyvKzFXcb
         fhytN2Sokw9yM9XcjVfRCWL156kkKBnX/zAcE9t6PONUwgj0HCUPGZOPxDW17Rf8w3y2
         6h/ONnu6gfiiXrPFjq9Hc/ByMHoo/gKNnSGkxidZ/PLhs5CLqEr2euWs48bBzUwE9l4v
         9IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524970; x=1778129770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wzDogUQvoSkhk9vFb3XQ8fdLIe6z+NsDYZSHynFcmI=;
        b=CdRWSH1zaEBwg73YOatfljJnp+XsV4/H4s/jhkP4sEYkl+Ery74neUVYI9J7qq3GqY
         Vkg16loybJoT3JvJ81iwBDpk8VLNfkwq+liplegaFb+56NmhN/OJwFVYHu7AA4ezarP+
         LTCnGo+9brMQ4yTTw44iHZsDDA2VA9UfRTe3g8V6UFn2Wxxan5+BRSmX7D/SU7tfs1+e
         wv24YDYcKNc4qtDAw3EhMuCRQJ6lTwMf3vPWBzvfwRA95ybqn12ujCVFYlWTLg+Hvc0Q
         2yXzlowgYuXq+cgMiU9BPitninyWvToJlfOq6YFxFwUi37K/T9QRWbiV9hJJFum1Kd/n
         68Rw==
X-Gm-Message-State: AOJu0Yx/pZEP0MIPvJkwSEBjwUt8BFTjX6+Lte5Pe+JTXEI0P3rHEYgm
	6oxPws36iSynPnXYIe/bQgahFXX5qnugbhrGkoqca/x4rLIsxx0ZPAXfdkr+kQ==
X-Gm-Gg: AeBDiesFtz5wnhGhqdOs3xxZfKwncRWxxzhcuxh6/F/dc9TQvUz5n6oRXQtg3cEcUcB
	Z8QHr7qGKW8OgEVh/zRWyRwPykAQtCQjuAMvH5I7syK6Zrl9B3VqtcVnUOtSG4z/e1jp2ek9XOo
	2ksIzyNEpGLFO4kuK0z3jPJb+3QSlTXbXybT1EPc0/gGs9LTnsLi9kYHag0k5st/8Kq44RfH67o
	7fmjRPZMe3ECR7Fl0vVPN6lQL/Kiv2t0aVwP1g+JXipWH8f5BKeB4RbOHi8CKhLhbVBOWot1L6P
	E15guz79JA8uo7vWp3TmtuCh0fQ1Jn5evi4W+u5ztCp0vK57uhrTYmukJvuFI7vev2A66AwqSee
	6o9nTphG5+LC6rE6+vyNVcWwl+0apbD/AHI/gEJMgWXB8HGYV8PnNLPWT/JYy+ziWEorkqU2Efy
	geI4RGNixc82jFhxZMtl7ZugyDSkrH4dXuw2jFHPe7T3c=
X-Received: by 2002:a05:6a21:3086:b0:398:8d38:c60c with SMTP id adf61e73a8af0-3a3cf7f1e01mr1488680637.55.1777524970284;
        Wed, 29 Apr 2026 21:56:10 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd5e6cf20sm3746277a12.3.2026.04.29.21.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:56:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 6/7] lib: sbi: Add hart_ prefix to PMP functions
Date: Thu, 30 Apr 2026 14:55:24 +1000
Message-ID: <20260430045528.420437-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
References: <20260430045528.420437-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_215612_401798_B759DC6D 
X-CRM114-Status: GOOD (  16.78  )
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

PMP functions that deal with hart PMP CSRs are given a hart_ prefix, to
distinguish from RISC-V PMP encoding functions.

The is_pmp_entry_mapped() function is changed a little more, to align
with other PMP conventions, and made to return a bool to make it more
obvious that it returns a bool and not an SBI_ return code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/riscv_asm.h          | 10 +++++----
 lib/sbi/riscv_asm.c              | 10 ++++-----
 lib/sbi/sbi_hart_pmp.c           | 18 ++++++++--------
 platform/generic/eswin/eic770x.c | 36 ++++++++++++++++----------------
 4 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 0cf3fc37..f845320b 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -81,6 +81,8 @@
 
 #ifndef __ASSEMBLER__
 
+#include <sbi/sbi_types.h>
+
 #define csr_swap(csr, val)                                              \
 	({                                                              \
 		register unsigned long __v = (unsigned long)(val);      \
@@ -210,15 +212,15 @@ int misa_xlen(void);
 void misa_string(int xlen, char *out, unsigned int out_sz);
 
 /* Disable pmp entry at a given index */
-int pmp_disable(unsigned int n);
+int hart_pmp_disable(unsigned int n);
 
 /* Check if the matching field is set */
-int is_pmp_entry_mapped(unsigned long entry);
+bool hart_is_pmp_enabled(unsigned int n);
 
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
+int hart_pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
 
-int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
+int hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len);
 
 #endif /* !__ASSEMBLER__ */
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c0ad4dbe..98a93462 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -332,7 +332,7 @@ static int hart_pmp_write(pmp_t *pmp, unsigned int n)
 	return SBI_OK;
 }
 
-int pmp_disable(unsigned int n)
+int hart_pmp_disable(unsigned int n)
 {
 	pmp_t pmp;
 	int rc;
@@ -346,17 +346,17 @@ int pmp_disable(unsigned int n)
 	return hart_pmp_write(&pmp, n);
 }
 
-int is_pmp_entry_mapped(unsigned long entry)
+bool hart_is_pmp_enabled(unsigned int n)
 {
 	pmp_t pmp;
 
-	if (hart_pmp_read(&pmp, entry) != SBI_OK)
+	if (hart_pmp_read(&pmp, n) != SBI_OK)
 		return false;
 
 	return pmp_is_enabled(&pmp);
 }
 
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
+int hart_pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len)
 {
 	pmp_t pmp;
@@ -369,7 +369,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	return hart_pmp_write(&pmp, n);
 }
 
-int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
+int hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len)
 {
 	pmp_t pmp;
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 02a3b3c4..8b7b091c 100644
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
@@ -206,7 +206,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
 	}
 	/* Disable remaining PMP entries */
 	for(; pmp_idx < pmp_count; pmp_idx++)
-		pmp_disable(pmp_idx);
+		hart_pmp_disable(pmp_idx);
 
 	/*
 	 * All entries are programmed.
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
@@ -291,7 +291,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
 	}
 	/* Disable remaining PMP entries */
 	for(; pmp_idx < pmp_count; pmp_idx++)
-		pmp_disable(pmp_idx);
+		hart_pmp_disable(pmp_idx);
 
 	sbi_hart_pmp_fence();
 	return 0;
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
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
