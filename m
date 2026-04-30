Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DD8FF8875
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKBmKtcCVyS3yuDEk0LD45Djnd8pe1ymdcO3XCti5gE=; b=opKvEXxREFWrLN
	lYBXjjO4NzT4t3l+92SJR+jpigMM6yJvvPo7725Lf84dU0W8piazNRxEIpjX1Vo+iWTU/2xK/6whZ
	fbtuxBLRKr3fAlqqYuvH9gmF9j4VQuPTBv6wPmyRpxCluia0CHBOWHweNAEBjpV4Px599CKkzlF60
	v3nrh8aCDBdLTqTXupmjUjO7Be+vwEGydtkvTmFKqL6QCkJVLn5eoaLencF2QZUgIfLKofb0xbTYe
	v0pD49tiHt+3Dvu79wVlBr7918uf5ibO51Bt6AgV4cGD95O59fQsBO4qv//V8S5d6EbN25PxkiiMe
	dLgXrRhQZlqSQumd/EpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRU-00000004gBj-1upA;
	Thu, 30 Apr 2026 04:56:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRS-00000004gAX-0kac
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:56:03 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82f69adeecbso221715b3a.2
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524960; x=1778129760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xbywcSBY1jqoeTsCrU3tT2P/d+N7p3jW0hJaSzyyy0=;
        b=JgMzFGcwDN3JrqVjhKjidVLuvmEqysWNQNGwMfSiZ/donm1fNaMj1FKmLI9McckV06
         2OZaf2F6cTOV75g6ItZq7sNPtNV0Vx5yQoTdAP+yp1pI44K8A/c8NiVKkNQpFua8UuEZ
         /iP01/J+enohtkDZiLD//IRd/T0SuN4Pjp6tubOMLZIpRPd8vvcXOWQw3YhhksrsSxar
         8hJC9m3Rvd84uvv7NoZt3AFhMqOPE1+05eiCgPmLNlJUqP5i4/4Jkd9ZFbPQfi2aTzo8
         7snFgoVK5MROmTkg2oKi50srOtsNTIHAZJHuYFVUNc3QuvIIKgdXp6LtjjK3P9e12Rcb
         sVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524960; x=1778129760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8xbywcSBY1jqoeTsCrU3tT2P/d+N7p3jW0hJaSzyyy0=;
        b=CLQeWuEpbFFkoW7vx824scnhhUSHjXKIX06o7CG5oiXoKda6o6Zh/7QZ+SwHQDxw5H
         TxQ3GKDW2ZxE9TOwRpSIWcG5eOR1kzqzuA5qRlLwmkkOE25UQSJTrgxmiLkaqKYeyaNc
         W/ULp/sg401xNCDqRu0GuSwM1WP9eTd4HdSS7UoEVP8veeDopS3AjH4I36YRqqo6HpLW
         t106qwORubM16SBKyxXfmW7GW91PPEbYR86AJS71iJP5bZQhfqe7F81J1fZhEvqyGW+X
         ET/e/I+hPHEofSqoJGWHYPnjQ5MaoP60WilFA/WmucqF10TEGocXO2rmTLvUjYHuq+W6
         UPFg==
X-Gm-Message-State: AOJu0YzstsVR0sfjZPXmhbev1ZgwAMyvwxBOYZYrWzSkPqUXtviGWV1l
	yX6TC7WzfgZ9SnSg2ilM0wHqsgnWYwbVCn3zEhaUsDD8S36sfgz7fE3KtN3aRA==
X-Gm-Gg: AeBDievXUqDezEofTceG+50vDFzc4EKX6NGy6WoiR+bmFy+LoByo76v8KfjP+W6wFuV
	TQcZTlxMeKA5LsKyTY2Ects1P6kmaBD6A+Ke4zRsw63k4mPkiWKlj49+tpDzbsf0b01okOD/fmj
	Ae+aLLWK2Ej+fd70YoqFWfzI0Ak8f25gUp8F8Q9FTdBkK+gzhrWqlN9GqqyXlMnrXRFidM/+e9C
	fawrO0S0eRgxU2gbvSXl2W3iNy1rJ9huhZnfkFJnkNHbNEDWGWuS8dXKlhmjU6B61Jl/ETHHorD
	gWuUr2mTFz/re8jFtFosWiTjGdkf29QlmXChsRDQZnNm5nsW18/XiUioZMTFWwypMn6vW7cN+/H
	y2UHX8hkHbyCzWhZzBdakHOYzNTEXSKd4KnG8GcWVKhftD/CZsceID7D1SX9V7tbuv1VuYiTEbx
	+aCIv/EZwmTujmvdKW0PMYZ5qRZ0qk/OU9rhz+gKRNiDA=
X-Received: by 2002:a05:6a00:3cc5:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-834fe05d00cmr1665992b3a.7.1777524960240;
        Wed, 29 Apr 2026 21:56:00 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed59fd4bsm3478563b3a.5.2026.04.29.21.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:55:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 4/7] lib: sbi: Add PMP CSR read and write accessors
Date: Thu, 30 Apr 2026 14:55:22 +1000
Message-ID: <20260430045528.420437-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
References: <20260430045528.420437-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_215602_231166_7E8AA87E 
X-CRM114-Status: GOOD (  14.16  )
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

PMPCFG CSR access is non-trivial as it requires shifting and masking, it
makes PMP manipulation code simpler if this basic CSR read/write access is
abstracted away.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/riscv_asm.c | 114 ++++++++++++++++++++++----------------------
 1 file changed, 58 insertions(+), 56 deletions(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 9b45805c..2fb0f585 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -273,14 +273,16 @@ void csr_write_num(int csr_num, unsigned long val)
 #undef switchcase_csr_write
 }
 
-int pmp_disable(unsigned int n)
+static int hart_pmp_read(pmp_t *pmp, unsigned int n)
 {
-	int pmpcfg_csr, pmpcfg_shift;
-	unsigned long cfgmask, pmpcfg;
+	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
+	unsigned long cfgmask;
 
+	/* check parameters */
 	if (n >= PMP_COUNT)
 		return SBI_EINVAL;
 
+	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
 	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
 	pmpcfg_shift = (n & 3) << 3;
@@ -290,48 +292,24 @@ int pmp_disable(unsigned int n)
 #else
 # error "Unexpected __riscv_xlen"
 #endif
+	pmpaddr_csr = CSR_PMPADDR0 + n;
 
-	/* Clear the address matching bits to disable the pmp entry */
-	cfgmask = ~(0xffUL << pmpcfg_shift);
-	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
-
-	csr_write_num(pmpcfg_csr, pmpcfg);
+	cfgmask = (0xffUL << pmpcfg_shift);
+	pmp->cfg = (csr_read_num(pmpcfg_csr) & cfgmask) >> pmpcfg_shift;
+	pmp->addr = csr_read_num(pmpaddr_csr);
 
 	return SBI_OK;
 }
 
-int is_pmp_entry_mapped(unsigned long entry)
-{
-	unsigned long prot;
-	unsigned long addr;
-	unsigned long log2len;
-
-	if (pmp_get(entry, &prot, &addr, &log2len) != 0)
-		return false;
-
-	/* If address matching bits are non-zero, the entry is enable */
-	if (prot & PMP_A)
-		return true;
-
-	return false;
-}
-
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len)
+static int hart_pmp_write(pmp_t *pmp, unsigned int n)
 {
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 	unsigned long cfgmask, pmpcfg;
-	pmp_t pmp;
-	int rc;
 
 	/* check parameters */
 	if (n >= PMP_COUNT)
 		return SBI_EINVAL;
 
-	rc = pmp_encode(&pmp, prot, addr, log2len);
-	if (rc)
-		return rc;
-
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
 	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
@@ -345,41 +323,65 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	pmpaddr_csr = CSR_PMPADDR0 + n;
 
 	/* write csrs */
-	csr_write_num(pmpaddr_csr, pmp.addr);
+	csr_write_num(pmpaddr_csr, pmp->addr);
 	cfgmask = ~(0xffUL << pmpcfg_shift);
 	pmpcfg  = (csr_read_num(pmpcfg_csr) & cfgmask);
-	pmpcfg |= (((unsigned long)pmp.cfg << pmpcfg_shift) & ~cfgmask);
+	pmpcfg |= (((unsigned long)pmp->cfg << pmpcfg_shift) & ~cfgmask);
 	csr_write_num(pmpcfg_csr, pmpcfg);
 
-	return 0;
+	return SBI_OK;
 }
 
-int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *log2len)
+int pmp_disable(unsigned int n)
 {
-	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask;
 	pmp_t pmp;
+	int rc;
 
-	/* check parameters */
-	if (n >= PMP_COUNT)
-		return SBI_EINVAL;
+	rc = hart_pmp_read(&pmp, n);
+	if (rc)
+		return rc;
 
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
+	pmp.cfg = 0;
 
-	cfgmask = (0xffUL << pmpcfg_shift);
-	pmp.cfg = (csr_read_num(pmpcfg_csr) & cfgmask) >> pmpcfg_shift;
-	pmp.addr = csr_read_num(pmpaddr_csr);
+	return hart_pmp_write(&pmp, n);
+}
+
+int is_pmp_entry_mapped(unsigned long entry)
+{
+	pmp_t pmp;
+
+	if (hart_pmp_read(&pmp, entry) != SBI_OK)
+		return false;
+
+	/* If address matching bits are non-zero, the entry is enable */
+	if (pmp.cfg & PMP_A)
+		return true;
+
+	return false;
+}
+
+int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
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
+int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
+	    unsigned long *log2len)
+{
+	pmp_t pmp;
+	int rc;
+
+	rc = hart_pmp_read(&pmp, n);
+	if (rc)
+		return rc;
 
 	return pmp_decode(&pmp, prot_out, addr_out, log2len);
 }
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
