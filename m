Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE41CFF8875
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aACMbQZhbF0UB7gRnYxKVkNOlyZHIG5h17nFxZJAsuc=; b=renor2CMz4Nf0L
	Fy4NMyc886IW1JgR9KQxP0dX+32ZlDDYw8+j1CafwUXJ77FliDDio0uE8W1ujTcHR9SZphEU+qfWy
	xbhKNTZc8dtpY/+oyx5Dke9GJxqpBUcXoTnK6M/yHM0QU6YpMmBkOgmCh/Fd+N8Q3324IXvJmkBXw
	/w+/InbNNNGRXHolbqfZiIILqfMn1TcLJJoenzmSMg4/vTbLvIRWFHslGe8uEM6u+4E8GiaL7ve2T
	dIvegtPGJmPC1cWZjnNWOk0u1gFXa2bHzV2sbUmwEag77cwkFT4DdZpkYNxkzbK65SnyfvZoGylzc
	d1wJ4kgtMuH4jcw2S9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRl-00000004gIt-3Gp0;
	Thu, 30 Apr 2026 04:56:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRl-00000004gIR-0Sqh
	for opensbi@bombadil.infradead.org;
	Thu, 30 Apr 2026 04:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LkDous2/iMCynyzTMJFz68Dw24FI8Z3E+U3aZWla2As=; b=bkUzbbvvUah2EQnGvBkwSmHLbV
	h9JkjjEQQnVawbf8zuLPZPDE/Ep505ug4OtW1mQh46IVMvsugv3tiP+Kj8VxY/ontNPyOxpLqsK24
	jhgJtQORYjzV3HQEngTnbjmiLFzZtEpTVw8xKOWxSkCc0cvL+CP7+QGxezkTkEfjWFob8SunHRumb
	cNf7vCKxhMiEUgwl9cP8/9HBGyKKcd/dc19ZtYvm6kWefPanlfWMYXX1637/BcPMYzjeS23Kb0D5H
	IsHKYX+dWjVza6hfOSY1bp0QsnbCJA/qYLPzv4ECEbH+0/lFCdt7Tu8BrXd/5b8C0hpBDYcbWe9R2
	yb5RaAxQ==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRi-00000006deE-0619
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:56:19 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b458ca2296so3212105ad.0
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524975; x=1778129775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkDous2/iMCynyzTMJFz68Dw24FI8Z3E+U3aZWla2As=;
        b=lNihaMrk2v1rhBrSWfOSAzL6jB+7QFXSdVek4qjqEJNXZfVk89yWBrOWMJ+HUktd0G
         ScZDbNTmqf0/Aczz09QNjvc/iaB0dnOFsoHBjOXok0fvrGh/SCqgt/YqvD3G2QUWN0bf
         4TQ/Cmabe9JZH6JuR8eyVmoqKYN8Q3Gl0vi90n4z3QMiTJ+M9GHVl0BaX8feTXfOo5Uv
         Nmj15URvjSqibRDNobzsKCCyPW+ckYkyaH6aUkdinFcoVnCcKkHikBr2xpJYIdeLl+KS
         1FVbTic/Tz04rfhMMyN+oYyR4YmObbIUmLslne0b+bxa6pjnUMx2ZzP4ZderJ5UITFSS
         I9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524975; x=1778129775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LkDous2/iMCynyzTMJFz68Dw24FI8Z3E+U3aZWla2As=;
        b=S4kgbFLUPstBM0jg8Y93BG9QKFRw8hLsps+TyrznFE6vmQ0xnAL48+roE6YwAXA1Uw
         HF1nSSvwKrKa/f6w2vehWUW/R953vW6KW10rUW3Hm4Cp+p/R5rCVyv4XWf4OAL3dwYV9
         3zV0ZxUvjfERsfMQXXg+eOhGsKMB+vFrik/qPMhV/siExFZu87Rj2QqRy6571QMtm/GB
         x6EZbWDA8lOzXFiAkrEQ4Hk99zP79KKufIVSDBa0JxwTbdrTTDoFn7AT8Tw8senaFw0P
         QvsHOg2lYXMePFvYwwx5NGTm9NxJ0Y4KzgcWuG6KblOm9L9n22IRDVLdGvGxBdiuiAxg
         l5CA==
X-Gm-Message-State: AOJu0YytbYXYqh3rOEZ7DN5opwmvghjXmMmEapBN+9LykWb0PDT/pPhs
	Xu6K5Cr6bVlnz2VwebNDgduoIFLrJ0/l744491mMJVAe76OpwEZXjVW7fXqW3Q==
X-Gm-Gg: AeBDiet25QninFVMAS2Np5Go39c1Ie6mq/CEegWUT8ZK+yaQnyC7vBi/k9aXNM8rHdF
	BuFD2BM5jT50AmgkEyYja25e/hczD+U0Po2pTFHU7pvQVW6sU1WxqhZdoSlGR3SbbKzOlhbnWOB
	FhI/THdXfZ99+miabfBsaZPO+bG2r5h0r0+M19k+yaUgJDHcv0cfP3UM9aArt0AJST3gqPzgEx/
	Sn6ezI9hamvc4bLW0r2rCvHVGIvpxr9wqELh9iMJtJwv4GuAadRCbhbwRtf5N5ISJFK5KB17tjh
	buG0Ih74IkdfmklElBfzfOiNfWKj9P9R5yI1cdAWcAGoEGKO3LYcLcmug1eekj4zv9Tua1bYy94
	T8QeZrlIPLkB6r65Q5SKFUyz390SvHVlfPG8E8F+uVdl5E01MQK1CZ1F864Fk3DXXi7bCF+Y5gL
	A3cDGEqDBi3GKZy9eyWvL8FIt0zEPH4aR/GtZpnDAAfFA=
X-Received: by 2002:a17:902:ef10:b0:2b9:4941:7f6e with SMTP id d9443c01a7336-2b9a2319b9cmr13498535ad.2.1777524975003;
        Wed, 29 Apr 2026 21:56:15 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f0b7sm42259725ad.40.2026.04.29.21.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:56:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 7/7] lib: sbi: Move hart PMP functions to sbi_hart_pmp.c
Date: Thu, 30 Apr 2026 14:55:25 +1000
Message-ID: <20260430045528.420437-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
References: <20260430045528.420437-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_055618_412770_A169EEE6 
X-CRM114-Status: GOOD (  14.77  )
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

The sbi_hart_pmp.c looks like a good place for the hart PMP CSR
access functions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/riscv_asm.h    |  14 -----
 include/sbi/sbi_hart_pmp.h |  12 ++++
 lib/sbi/riscv_asm.c        | 109 ------------------------------------
 lib/sbi/sbi_hart_pmp.c     | 110 +++++++++++++++++++++++++++++++++++++
 4 files changed, 122 insertions(+), 123 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index f845320b..7765edb7 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -81,8 +81,6 @@
 
 #ifndef __ASSEMBLER__
 
-#include <sbi/sbi_types.h>
-
 #define csr_swap(csr, val)                                              \
 	({                                                              \
 		register unsigned long __v = (unsigned long)(val);      \
@@ -211,18 +209,6 @@ int misa_xlen(void);
 /* Get RISC-V ISA string representation */
 void misa_string(int xlen, char *out, unsigned int out_sz);
 
-/* Disable pmp entry at a given index */
-int hart_pmp_disable(unsigned int n);
-
-/* Check if the matching field is set */
-bool hart_is_pmp_enabled(unsigned int n);
-
-int hart_pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len);
-
-int hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *log2len);
-
 #endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/include/sbi/sbi_hart_pmp.h b/include/sbi/sbi_hart_pmp.h
index a7765d17..3e0219ac 100644
--- a/include/sbi/sbi_hart_pmp.h
+++ b/include/sbi/sbi_hart_pmp.h
@@ -9,6 +9,18 @@
 
 #include <sbi/sbi_types.h>
 
+/* Disable pmp entry at a given index */
+int hart_pmp_disable(unsigned int n);
+
+/* Check if the matching field is set */
+bool hart_is_pmp_enabled(unsigned int n);
+
+int hart_pmp_set(unsigned int n, unsigned long prot,
+		 unsigned long addr, unsigned long log2len);
+
+int hart_pmp_get(unsigned int n, unsigned long *prot_out,
+		 unsigned long *addr_out, unsigned long *log2len);
+
 struct sbi_scratch;
 
 unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 98a93462..a1e0f2f8 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -272,112 +272,3 @@ void csr_write_num(int csr_num, unsigned long val)
 #undef switchcase_csr_write_2
 #undef switchcase_csr_write
 }
-
-static int hart_pmp_read(pmp_t *pmp, unsigned int n)
-{
-	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask;
-
-	/* check parameters */
-	if (n >= PMP_COUNT)
-		return SBI_EINVAL;
-
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
-	cfgmask = (0xffUL << pmpcfg_shift);
-	pmp->cfg = (csr_read_num(pmpcfg_csr) & cfgmask) >> pmpcfg_shift;
-	pmp->addr = csr_read_num(pmpaddr_csr);
-
-	return SBI_OK;
-}
-
-static int hart_pmp_write(pmp_t *pmp, unsigned int n)
-{
-	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask, pmpcfg;
-
-	/* check parameters */
-	if (n >= PMP_COUNT)
-		return SBI_EINVAL;
-
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
-	/* write csrs */
-	csr_write_num(pmpaddr_csr, pmp->addr);
-	cfgmask = ~(0xffUL << pmpcfg_shift);
-	pmpcfg  = (csr_read_num(pmpcfg_csr) & cfgmask);
-	pmpcfg |= (((unsigned long)pmp->cfg << pmpcfg_shift) & ~cfgmask);
-	csr_write_num(pmpcfg_csr, pmpcfg);
-
-	return SBI_OK;
-}
-
-int hart_pmp_disable(unsigned int n)
-{
-	pmp_t pmp;
-	int rc;
-
-	rc = hart_pmp_read(&pmp, n);
-	if (rc)
-		return rc;
-
-	pmp.cfg = 0;
-
-	return hart_pmp_write(&pmp, n);
-}
-
-bool hart_is_pmp_enabled(unsigned int n)
-{
-	pmp_t pmp;
-
-	if (hart_pmp_read(&pmp, n) != SBI_OK)
-		return false;
-
-	return pmp_is_enabled(&pmp);
-}
-
-int hart_pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len)
-{
-	pmp_t pmp;
-	int rc;
-
-	rc = pmp_encode(&pmp, prot, addr, log2len);
-	if (rc)
-		return rc;
-
-	return hart_pmp_write(&pmp, n);
-}
-
-int hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *log2len)
-{
-	pmp_t pmp;
-	int rc;
-
-	rc = hart_pmp_read(&pmp, n);
-	if (rc)
-		return rc;
-
-	return pmp_decode(&pmp, prot_out, addr_out, log2len);
-}
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 8b7b091c..54cfd0cb 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -12,9 +12,119 @@
 #include <sbi/sbi_hfence.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmp.h>
 #include <sbi/sbi_tlb.h>
 #include <sbi/riscv_asm.h>
 
+static int hart_pmp_read(pmp_t *pmp, unsigned int n)
+{
+	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
+	unsigned long cfgmask;
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
+	pmp->cfg = (csr_read_num(pmpcfg_csr) & cfgmask) >> pmpcfg_shift;
+	pmp->addr = csr_read_num(pmpaddr_csr);
+
+	return SBI_OK;
+}
+
+static int hart_pmp_write(pmp_t *pmp, unsigned int n)
+{
+	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
+	unsigned long cfgmask, pmpcfg;
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
+	/* write csrs */
+	csr_write_num(pmpaddr_csr, pmp->addr);
+	cfgmask = ~(0xffUL << pmpcfg_shift);
+	pmpcfg  = (csr_read_num(pmpcfg_csr) & cfgmask);
+	pmpcfg |= (((unsigned long)pmp->cfg << pmpcfg_shift) & ~cfgmask);
+	csr_write_num(pmpcfg_csr, pmpcfg);
+
+	return SBI_OK;
+}
+
+int hart_pmp_disable(unsigned int n)
+{
+	pmp_t pmp;
+	int rc;
+
+	rc = hart_pmp_read(&pmp, n);
+	if (rc)
+		return rc;
+
+	pmp.cfg = 0;
+
+	return hart_pmp_write(&pmp, n);
+}
+
+bool hart_is_pmp_enabled(unsigned int n)
+{
+	pmp_t pmp;
+
+	if (hart_pmp_read(&pmp, n) != SBI_OK)
+		return false;
+
+	return pmp_is_enabled(&pmp);
+}
+
+int hart_pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
+	    unsigned long log2len)
+{
+	pmp_t pmp;
+	int rc;
+
+	rc = pmp_encode(&pmp, prot, addr, log2len);
+	if (rc)
+		return rc;
+
+	return hart_pmp_write(&pmp, n);
+}
+
+int hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
+	    unsigned long *log2len)
+{
+	pmp_t pmp;
+	int rc;
+
+	rc = hart_pmp_read(&pmp, n);
+	if (rc)
+		return rc;
+
+	return pmp_decode(&pmp, prot_out, addr_out, log2len);
+}
+
 /*
  * Smepmp enforces access boundaries between M-mode and
  * S/U-mode. When it is enabled, the PMPs are programmed
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
