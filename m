Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EC4FF886F
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak23gEq5SYtpPu47vzXmsnYE51LESIZ4YaipvWx/xtQ=; b=bhI8tzVXoianJ6
	CUD8PJNBkAIwIYQEJKHvITXvo9jBNu5ZVffekU+fGwd27D0waywMNy7ogj10OH3YgiB4RJsj9nzf6
	2cddLYk/NxZeO5THy02B5F/NAdv4lcmWe2jOQh4db6EVVeb/LKF+TElI8kUHqK9mcNTdG3J9jve3p
	ifjFvQt0UeX0HDaQJLyt1F9MV7ON61MtUOagvr+LnaS65jlAIPxmzM1L9pe1P4BHxKPGojCUYRcTn
	wZEXQ33PKv9nFCVp225869NF8O0JoNhZVzmlZnFeptECQNnqTejhOOAJDnZ/q8ugOaFMla3SNoq5Z
	bPlhLdDxKUcjl9ggJb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRF-00000004g4y-0e24;
	Thu, 30 Apr 2026 04:55:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRC-00000004g41-3dEV
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:55:47 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-362e30526f8so186378a91.3
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524945; x=1778129745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ro9xvv1ROICGclp3fS2EhmhM42xM78dx6XTJNFMixs=;
        b=sjP5fpO49Fw5LMi8mzzcYz5+GrNVARhGtyZx55o4WyfIkd9UOd+5KCk8Y4E0nyDrsK
         dcU0ZDdHHJEYmVFO3swmpnKsK/P6EUsuWg4kK51Wd5HhJn0BVmSINJj3DLCFrSaaPO7g
         5/Ej9uPy6XOnbazEQ63vkh1+tpwz7YBoguqv/Er7Yz0U0Z5Q2aKUnTOGQ2VB48eoZJlS
         W+klg6aNWqhiReWSH1/IRRqSmcskyZLKGcVtjzYbuwvIgplTgtqwyqmGU++hQU0loBXp
         fbc0c+tNaEbfr5TiKC8n7BxN4+WpftBzyEndNsGcEdw8YQkshrDdUBiHvweJvl+q/z8k
         GcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524945; x=1778129745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ro9xvv1ROICGclp3fS2EhmhM42xM78dx6XTJNFMixs=;
        b=ruPfjANeFZjkM39J2fJmxpQTrK40xUn+aEz5FB2434Nj6ewwLLDRzQgRHjZGO29OqP
         MQDLauCXeEeWpeTUtIYUozISfOyxwDr97wDLJBhuJepxE4xxqTadXHmGBiw6BljwAKP5
         sGm9+gbmnWwp6Cg7IX33D9RAeQ0gsRvo6sUC2+UC7ZppYgmWnhHApG3gIwfulkBeuKzW
         lubwF8diz2VvjCpKb5VUTiL5m5kajdY7I62UvS5p9k+NpUxxTU2gj1pjNtXH9Z0r0zOf
         mWHeTFqb/3G8CR7kUOR1ADvVC9O5unZGWPuZjU/8QHQAPNr+UmhbETJcAg3F3xAcOeq9
         WurQ==
X-Gm-Message-State: AOJu0YyLrFYIPxO3tVLGHo7V7FKbIM/8UUzXnCPYPKfnvyVYRhhZ0uVD
	vgTHWJwUqf3Yx+BQl1cadAzc89No9Fpjye5qM2SIhGFn7cp+6a1zHSkFShdTew==
X-Gm-Gg: AeBDietYKh9oVEBk4kbjotRTolKJTBK77SZMff9anSYZl+Tsjv2azAcEExMCcfJlw2S
	uTSynldCh/1iugW7z9pTUt1fEUviqOHcbw7ZGcx7D7MJKzG4wPAi2uxVszbooStfJIsgxErQHba
	/mAiUlCvDvBwZLdRbFM40Ra+/rZQUhN2ezCJtJa3LoYeLH1k4z+6X0fehRG9EZNjgLIANuvNB6l
	2isHa2wsOT69QqLqMInu3OxRrJy/jkPToCtCjWPpEBHMixxiBVp+KzcvLE7twAOUb4Yxq2s80u5
	E0xFldn/gZBN93GtYygSj068QwXeaj+nc0O3hfcwXGk5HvAy/CWp33W9ftVKZa5pqmv0La+XQ/K
	i2HXk43qKD4R+byostJ0o+CCeytbIYnThfev1JW1D0FjXSlqAES9ELYbu0S6ezKpxNV0/1xGApD
	oVVSz9CI9+qcl88MXzRNx1Lr7OaGzd6rz100XgSEaOE6o=
X-Received: by 2002:a17:90b:5830:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-364c2f23000mr1376483a91.4.1777524945385;
        Wed, 29 Apr 2026 21:55:45 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b168sm1245524a91.12.2026.04.29.21.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:55:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/7] lib: sbi: split PMP encoding and CSR access
Date: Thu, 30 Apr 2026 14:55:19 +1000
Message-ID: <20260430045528.420437-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
References: <20260430045528.420437-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_215546_911215_4B5B92FE 
X-CRM114-Status: GOOD (  14.39  )
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

Allow PMP encoding functions to be shared with non-hart PMP manipulation
by splitting encoding / decoding and hart PMP CSR access into their own
functions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/riscv_asm.c | 119 +++++++++++++++++++++++++++-----------------
 1 file changed, 73 insertions(+), 46 deletions(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index acb6b5e6..e33e3c36 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -336,70 +336,50 @@ int is_pmp_entry_mapped(unsigned long entry)
 	return false;
 }
 
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len)
+static int pmp_encode(pmp_t *pmp, unsigned long prot, unsigned long addr,
+		      unsigned long log2len)
 {
-	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask, pmpcfg;
-	unsigned long addrmask;
-	pmp_t pmp;
-
 	/* check parameters */
-	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
+	if (log2len > __riscv_xlen || log2len < PMP_SHIFT)
 		return SBI_EINVAL;
 
-	/* calculate PMP register and offset */
-#if __riscv_xlen == 32
-	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
-	pmpcfg_shift = (n & 3) << 3;
-#elif __riscv_xlen == 64
-	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
-	pmpcfg_shift = (n & 7) << 3;
-#else
-# error "Unexpected __riscv_xlen"
-#endif
-	pmpaddr_csr = CSR_PMPADDR0 + n;
-
 	/* encode PMP config */
 	prot &= ~PMP_A;
 	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
-	pmp.cfg = prot;
+	pmp->cfg = prot;
 
 	/* encode PMP address */
 	if (log2len == PMP_SHIFT) {
-		pmp.addr = (addr >> PMP_SHIFT);
+		pmp->addr = (addr >> PMP_SHIFT);
 	} else {
 		if (log2len == __riscv_xlen) {
-			pmp.addr = -1UL;
+			pmp->addr = -1UL;
 		} else {
+			unsigned long addrmask;
 			addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
-			pmp.addr = ((addr >> PMP_SHIFT) & ~addrmask);
-			pmp.addr |= (addrmask >> 1);
+			pmp->addr = ((addr >> PMP_SHIFT) & ~addrmask);
+			pmp->addr |= (addrmask >> 1);
 		}
 	}
 
-	/* write csrs */
-	csr_write_num(pmpaddr_csr, pmp.addr);
-	cfgmask = ~(0xffUL << pmpcfg_shift);
-	pmpcfg  = (csr_read_num(pmpcfg_csr) & cfgmask);
-	pmpcfg |= (((unsigned long)pmp.cfg << pmpcfg_shift) & ~cfgmask);
-	csr_write_num(pmpcfg_csr, pmpcfg);
-
-	return 0;
+	return SBI_OK;
 }
 
-int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *log2len)
+int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
+	    unsigned long log2len)
 {
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask, prot;
-	unsigned long t1, addr, len;
+	unsigned long cfgmask, pmpcfg;
 	pmp_t pmp;
+	int rc;
 
 	/* check parameters */
-	if (n >= PMP_COUNT || !prot_out || !addr_out || !log2len)
+	if (n >= PMP_COUNT)
 		return SBI_EINVAL;
-	*prot_out = *addr_out = *log2len = 0;
+
+	rc = pmp_encode(&pmp, prot, addr, log2len);
+	if (rc)
+		return rc;
 
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
@@ -413,16 +393,33 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 #endif
 	pmpaddr_csr = CSR_PMPADDR0 + n;
 
-	cfgmask = (0xffUL << pmpcfg_shift);
-	pmp.cfg = (csr_read_num(pmpcfg_csr) & cfgmask) >> pmpcfg_shift;
-	pmp.addr = csr_read_num(pmpaddr_csr);
+	/* write csrs */
+	csr_write_num(pmpaddr_csr, pmp.addr);
+	cfgmask = ~(0xffUL << pmpcfg_shift);
+	pmpcfg  = (csr_read_num(pmpcfg_csr) & cfgmask);
+	pmpcfg |= (((unsigned long)pmp.cfg << pmpcfg_shift) & ~cfgmask);
+	csr_write_num(pmpcfg_csr, pmpcfg);
+
+	return 0;
+}
+
+static int pmp_decode(pmp_t *pmp, unsigned long *prot_out, unsigned long *addr_out,
+		      unsigned long *log2len)
+{
+	unsigned long prot;
+	unsigned long t1, addr, len;
+
+	/* check parameters */
+	if (!prot_out || !addr_out || !log2len)
+		return SBI_EINVAL;
+	*prot_out = *addr_out = *log2len = 0;
 
 	/* decode PMP config */
-	prot = pmp.cfg;
+	prot = pmp->cfg;
 
 	/* decode PMP address */
 	if ((prot & PMP_A) == PMP_A_NAPOT) {
-		addr = pmp.addr;
+		addr = pmp->addr;
 		if (addr == -1UL) {
 			addr	= 0;
 			len	= __riscv_xlen;
@@ -432,7 +429,7 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 			len	= (t1 + PMP_SHIFT + 1);
 		}
 	} else {
-		addr	= pmp.addr << PMP_SHIFT;
+		addr	= pmp->addr << PMP_SHIFT;
 		len	= PMP_SHIFT;
 	}
 
@@ -441,5 +438,35 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	*addr_out    = addr;
 	*log2len     = len;
 
-	return 0;
+	return SBI_OK;
+}
+
+int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
+	    unsigned long *log2len)
+{
+	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
+	unsigned long cfgmask;
+	pmp_t pmp;
+
+	/* check parameters */
+	if (n >= PMP_COUNT)
+		return SBI_EINVAL;
+
+	/* calculate PMP register and offset */
+#if __riscv_xlen == 32
+	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
+	pmpcfg_shift = (n & 3) << 3;
+#elif __riscv_xlen == 64
+	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
+	pmpcfg_shift = (n & 7) << 3;
+#else
+# error "Unexpected __riscv_xlen"
+#endif
+	pmpaddr_csr = CSR_PMPADDR0 + n;
+
+	cfgmask = (0xffUL << pmpcfg_shift);
+	pmp.cfg = (csr_read_num(pmpcfg_csr) & cfgmask) >> pmpcfg_shift;
+	pmp.addr = csr_read_num(pmpaddr_csr);
+
+	return pmp_decode(&pmp, prot_out, addr_out, log2len);
 }
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
