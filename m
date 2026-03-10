Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2395EFCC9A6
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 00:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdt6S/Gx/90APKTKz1caC+MoacsAfYpWS2+cpEfYMqs=; b=OfUd8EEbvx48XZ
	Z8pSgzvPS5HFMujC2XSsiPvkk2/OFudjRKl/nUVDgYimlABmBnWTCtcv+nAGhHTiAgeRDQWji4nEL
	GQjlUEbDSPfuDEm9mPWO+YQShY8OIrnm4xGxzqqwvbi6Vzdj8sdw7OdGifbgpVz+cOEPqN9lRNxPe
	i0kqbZPRwqwGbmNbwVQRqiw9YbwDwFWwBDD2H2gP1C7TTcdsfr89iUtHaPHfY6KQ7lH8gDMdA2NW0
	i+mfsm4UwQlGgYNxGdjM/1FZ0Abb8TFqdrqMgOOl0JootKXz/gP1+pT/tzan38GzT/NZS+RouNJF4
	u8+b0KYOcJQrloZTmRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlJ4-00000008QNN-1GOx;
	Tue, 10 Mar 2026 00:50:42 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlJ1-00000008QMG-1WFr
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 00:50:40 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-829a9d08644so2002881b3a.1
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 17:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773103838; x=1773708638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dv0omhBTygLAoRNAJIwaZdwAGCEs22eA353JoTyxvD4=;
        b=aINDpz3QP9XUk5qruUEFnXeEW7stdz8EjTk/QBezYDNPuaHfFs7fNpkl3u/yFFXYxA
         BreM6O3k90MkiZgN9wrJslxek5bP6/OdxsIKjF+juAY/r3n8QLQ6SFaM6QLVBHqFXG9h
         SSB0mYxNziAEDAsAIGXAU2eHqauH4BW4oht0iS3cpZiWmUhrTdyrLKGgKOZAjKk8rUZJ
         Zp7gGsQB+SZKHJXQ/ZfYtaxNEDFMaud0BpO06V2GRjtJzABNMALKGhggkNK81GVseduG
         OuY7y98+RWHrSqBkJEo/x77LKYgiWXGtCKGG+jP5VNcD7ob+xrjlDYtfub6P3ZXu0pcH
         evuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773103838; x=1773708638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dv0omhBTygLAoRNAJIwaZdwAGCEs22eA353JoTyxvD4=;
        b=a2D5qw+k9HTmRCxn8CEVjqObp7rI1A7Bu6/uwUvh1XuAOoAQLHSUV0kIjgX8+w4Nb1
         e4OeiWkM8R7tgnAXuHKsJriC1IanS/fw3lCm8t39FpaT4HflJR94YLW53zpQgg26G80M
         3pxejq/088iahuO+rlc590lj4MyY2Va97z2FqvHJfHtvSN0nv5Tz4HUGUmH0uJiXAkxS
         8fXBR3IHTfWLj42ZVn1R+GmkyVaigAsrqLXeAfCqLTRi+1KA1m8f6btPsHA8TtSJtLXx
         C5MqnTg6l2jI2OSxf5284AYCdwiA8BU+kVPfbBxWgoLirmzCSNM+VV+mjNpiTmo+CRGR
         fNNg==
X-Gm-Message-State: AOJu0YwLZzG+gaerjq1iyVOeL8w5auKg9EX+aoNAnQ5WRp4Sa2BPhnH4
	R1NxORexxhwF8TvsAy34BKTdXtMIoDMvqir/KAwXSMC6bwZTllnWZu7JHfU3Mg==
X-Gm-Gg: ATEYQzxqmITKPwVG8xMfdiFOwXTQwVHC8yD91T6OLUoA5Sdb6I9rD4UeTv0yD2mhOuy
	4kMxahKFTrSknYkrtWyCJcoKf4NVnXqZPGhXMOE1tcnIxBaOzWJVvl2Mcm7n1HobyAuCP+4lqcr
	TkbPC4kF18h41brrHXPOpgbic1T7GzjrkIlChaDJwfOaogx2HDyEgOEFFdAnwsENWq0oLH6h7uB
	6+W1B6iZ8ZNlYq7GbCxdfGPrr3Bx0UW+ueK8D5SaZ5z+PFtyzuASTNysFLlKZKXEtF8UeWuPR4T
	1M6y6bv6VXiByOUucKiZzvjcxT0t8h7wSQJyAPlIxXxmGwOPeNsklUdHtvsmORfLtnw+1BmgelE
	cZNmUxw+q67bg5h46bfnZH43MBWTtX3Qkdmck7irpBhisjb23qV7SClcftIwyUw71sX/B48We9L
	e+P44ofm83XLlgpdJyxmhHv/ua8oY8MwmMNUuin1yfJON1i91kLUkNJO3vlQRrwFGdiU/4
X-Received: by 2002:a05:6a21:180a:b0:398:7791:fb16 with SMTP id adf61e73a8af0-3987791fdf9mr7249769637.57.1773103837861;
        Mon, 09 Mar 2026 17:50:37 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm11357635b3a.29.2026.03.09.17.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:50:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/4] lib: sbi: Move PMP encoding into a new file
Date: Tue, 10 Mar 2026 10:49:55 +1000
Message-ID: <20260310005000.3837512-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310005000.3837512-1-npiggin@gmail.com>
References: <20260310005000.3837512-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_175039_430649_0F024B5E 
X-CRM114-Status: GOOD (  23.78  )
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

The Tenstorrent RISC-V IOMMU PMP MMRs use the same encoding as PMP CSRs.
In preparation to support it, move the non hart-specific PMP operations
into their own file where they will also be used to build the IOMMU
PMPs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/riscv_asm.h |   2 +-
 include/sbi/sbi_pmp.h   |  24 +++++++
 lib/sbi/objects.mk      |   1 +
 lib/sbi/riscv_asm.c     | 156 ++++++++++++----------------------------
 lib/sbi/sbi_pmp.c       |  91 +++++++++++++++++++++++
 5 files changed, 164 insertions(+), 110 deletions(-)
 create mode 100644 include/sbi/sbi_pmp.h
 create mode 100644 lib/sbi/sbi_pmp.c

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 0cf3fc37..b97e1880 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -213,7 +213,7 @@ void misa_string(int xlen, char *out, unsigned int out_sz);
 int pmp_disable(unsigned int n);
 
 /* Check if the matching field is set */
-int is_pmp_entry_mapped(unsigned long entry);
+int is_pmp_entry_mapped(unsigned int entry);
 
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
diff --git a/include/sbi/sbi_pmp.h b/include/sbi/sbi_pmp.h
new file mode 100644
index 00000000..66664bb0
--- /dev/null
+++ b/include/sbi/sbi_pmp.h
@@ -0,0 +1,24 @@
+/*
+ * SPDX-FileCopyrightText: (c) 2025-2026 Tenstorrent USA, Inc.
+ * SPDX-License-Identifier: BSD-2-Clause
+ */
+
+#ifndef __SBI_PMP_H__
+#define __SBI_PMP_H__
+
+#include <sbi/sbi_types.h>
+
+struct pmp {
+	u8	cfg;
+	u64	addr;
+};
+typedef struct pmp pmp_t;
+
+bool pmp_enabled(pmp_t *pmp);
+
+int pmp_create(pmp_t *pmp, unsigned long prot, unsigned long addr,
+	    unsigned long log2len);
+int pmp_decode(pmp_t *pmp, unsigned long *prot, unsigned long *addr,
+	    unsigned long *log2len);
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..0e29a277 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -87,6 +87,7 @@ libsbi-objs-y += sbi_init.o
 libsbi-objs-y += sbi_ipi.o
 libsbi-objs-y += sbi_irqchip.o
 libsbi-objs-y += sbi_platform.o
+libsbi-objs-y += sbi_pmp.o
 libsbi-objs-y += sbi_pmu.o
 libsbi-objs-y += sbi_dbtr.o
 libsbi-objs-y += sbi_mpxy.o
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 3e44320f..c11abb1a 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_pmp.h>
 
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
@@ -272,24 +273,9 @@ void csr_write_num(int csr_num, unsigned long val)
 #undef switchcase_csr_write
 }
 
-static unsigned long ctz(unsigned long x)
+int hart_pmp_read(unsigned int n, pmp_t *pmp)
 {
-	unsigned long ret = 0;
-
-	if (x == 0)
-		return 8 * sizeof(x);
-
-	while (!(x & 1UL)) {
-		ret++;
-		x = x >> 1;
-	}
-
-	return ret;
-}
-
-int pmp_disable(unsigned int n)
-{
-	int pmpcfg_csr, pmpcfg_shift;
+	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 	unsigned long cfgmask, pmpcfg;
 
 	if (n >= PMP_COUNT)
@@ -304,44 +290,24 @@ int pmp_disable(unsigned int n)
 #else
 # error "Unexpected __riscv_xlen"
 #endif
+	pmpaddr_csr = CSR_PMPADDR0 + n;
+	pmp->addr = csr_read_num(pmpaddr_csr);
 
-	/* Clear the address matching bits to disable the pmp entry */
-	cfgmask = ~(0xffUL << pmpcfg_shift);
-	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
-
-	csr_write_num(pmpcfg_csr, pmpcfg);
+	cfgmask = (0xffUL << pmpcfg_shift);
+	pmpcfg = csr_read_num(pmpcfg_csr) & cfgmask;
+	pmp->cfg = pmpcfg >> pmpcfg_shift;
 
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
+int hart_pmp_write(unsigned int n, pmp_t *pmp)
 {
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 	unsigned long cfgmask, pmpcfg;
-	unsigned long addrmask, pmpaddr;
 
-	/* check parameters */
-	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
+	if (n >= PMP_COUNT)
 		return SBI_EINVAL;
 
-	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
 	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
 	pmpcfg_shift = (n & 3) << 3;
@@ -353,82 +319,54 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 #endif
 	pmpaddr_csr = CSR_PMPADDR0 + n;
 
-	/* encode PMP config */
-	prot &= ~PMP_A;
-	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
 	cfgmask = ~(0xffUL << pmpcfg_shift);
 	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
-	pmpcfg |= ((prot << pmpcfg_shift) & ~cfgmask);
-
-	/* encode PMP address */
-	if (log2len == PMP_SHIFT) {
-		pmpaddr = (addr >> PMP_SHIFT);
-	} else {
-		if (log2len == __riscv_xlen) {
-			pmpaddr = -1UL;
-		} else {
-			addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
-			pmpaddr	 = ((addr >> PMP_SHIFT) & ~addrmask);
-			pmpaddr |= (addrmask >> 1);
-		}
-	}
+	pmpcfg |= (unsigned long)pmp->cfg << pmpcfg_shift;
 
-	/* write csrs */
-	csr_write_num(pmpaddr_csr, pmpaddr);
+	csr_write_num(pmpaddr_csr, pmp->addr);
 	csr_write_num(pmpcfg_csr, pmpcfg);
 
-	return 0;
+	return SBI_OK;
 }
 
-int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *log2len)
+int pmp_disable(unsigned int n)
 {
-	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask, pmpcfg, prot;
-	unsigned long t1, addr, len;
+	struct pmp pmp = { .cfg = 0, .addr = 0 };
+	return hart_pmp_write(n, &pmp);
+}
 
-	/* check parameters */
-	if (n >= PMP_COUNT || !prot_out || !addr_out || !log2len)
-		return SBI_EINVAL;
-	*prot_out = *addr_out = *log2len = 0;
+int is_pmp_entry_mapped(unsigned int entry)
+{
+	pmp_t pmp;
 
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
+	if (hart_pmp_read(entry, &pmp))
+		return pmp_enabled(&pmp);
 
-	/* decode PMP config */
-	cfgmask = (0xffUL << pmpcfg_shift);
-	pmpcfg	= csr_read_num(pmpcfg_csr) & cfgmask;
-	prot	= pmpcfg >> pmpcfg_shift;
-
-	/* decode PMP address */
-	if ((prot & PMP_A) == PMP_A_NAPOT) {
-		addr = csr_read_num(pmpaddr_csr);
-		if (addr == -1UL) {
-			addr	= 0;
-			len	= __riscv_xlen;
-		} else {
-			t1	= ctz(~addr);
-			addr	= (addr & ~((1UL << t1) - 1)) << PMP_SHIFT;
-			len	= (t1 + PMP_SHIFT + 1);
-		}
-	} else {
-		addr	= csr_read_num(pmpaddr_csr) << PMP_SHIFT;
-		len	= PMP_SHIFT;
-	}
+	return false;
+}
+
+int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
+	    unsigned long log2len)
+{
+	pmp_t pmp;
+	int rc;
+
+	rc = pmp_create(&pmp, prot, addr, log2len);
+	if (rc)
+		return rc;
+
+	return hart_pmp_write(n, &pmp);
+}
+
+int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
+	    unsigned long *log2len)
+{
+	pmp_t pmp;
+	int rc;
 
-	/* return details */
-	*prot_out    = prot;
-	*addr_out    = addr;
-	*log2len     = len;
+	rc = hart_pmp_read(n, &pmp);
+	if (rc)
+		return rc;
 
-	return 0;
+	return pmp_decode(&pmp, prot_out, addr_out, log2len);
 }
diff --git a/lib/sbi/sbi_pmp.c b/lib/sbi/sbi_pmp.c
new file mode 100644
index 00000000..22132d81
--- /dev/null
+++ b/lib/sbi/sbi_pmp.c
@@ -0,0 +1,91 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_pmp.h>
+
+bool pmp_enabled(pmp_t *pmp)
+{
+	return pmp->cfg & PMP_A;
+}
+
+int pmp_create(pmp_t *pmp, unsigned long prot, unsigned long addr,
+	    unsigned long log2len)
+{
+	unsigned long addrmask, pmpaddr;
+
+	/* check parameters */
+	if (log2len > __riscv_xlen || log2len < PMP_SHIFT)
+		return SBI_EINVAL;
+
+	/* encode PMP config */
+	prot &= ~PMP_A;
+	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
+
+	/* encode PMP address */
+	if (log2len == PMP_SHIFT) {
+		pmpaddr = (addr >> PMP_SHIFT);
+	} else {
+		if (log2len == __riscv_xlen) {
+			pmpaddr = -1UL;
+		} else {
+			addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
+			pmpaddr	 = ((addr >> PMP_SHIFT) & ~addrmask);
+			pmpaddr |= (addrmask >> 1);
+		}
+	}
+
+	pmp->cfg = prot;
+	pmp->addr = pmpaddr;
+
+	return SBI_OK;
+}
+
+static unsigned long cto(unsigned long x)
+{
+	unsigned long ret = 0;
+
+	while (x & 1UL) {
+		ret++;
+		x = x >> 1;
+	}
+
+	return ret;
+}
+
+int pmp_decode(pmp_t *pmp, unsigned long *prot_out, unsigned long *addr_out,
+	    unsigned long *log2len)
+{
+	/* check parameters */
+	if (!pmp || !prot_out || !addr_out || !log2len)
+		return SBI_EINVAL;
+
+	if (!pmp_enabled(pmp))
+		return SBI_EINVAL;
+
+	/* decode PMP address */
+	if ((pmp->cfg & PMP_A) == PMP_A_NAPOT) {
+		if (pmp->addr == -1UL) {
+			*addr_out = 0;
+			*log2len = __riscv_xlen + 3;
+		} else {
+			unsigned long mask = ~((1UL << cto(pmp->addr)) - 1);
+			*addr_out = (pmp->addr & mask) << PMP_SHIFT;
+			*log2len = (cto(pmp->addr) + PMP_SHIFT + 1);
+		}
+	} else {
+		*addr_out = pmp->addr << PMP_SHIFT;
+		*log2len = PMP_SHIFT;
+	}
+
+	return SBI_OK;
+}
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
