Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B13CFF886F
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lv9a4nszYfjpeDVwu68CnkMNSmKmP/GYCi6/PecebPM=; b=piB/gqNTPG/Q65
	tGP21tNqO3KbTo5TDDxyu7bSFq7ZQBA2bE29nOKTYIr193u1wdqf9fstd96w/SxiXW8+jd81bHrlg
	msbbD5Mm44F3wD7W22ereVth29u/6svlO7mSR0OiLuyvYlGLQcHon5x6rwCvVdIA6Ch2izqSIpi/1
	uVJBYT8cYcnpI2EuyEmf1hZiqdU8EkslJ99bWIeQl4ek3o0JprIFQ38R8GA+dG60yho+IwwLlRRh7
	J3e9jyWFINqV8AKM7DtCrmFliSIEcYM/9/V7gA1+ou6iEUYv3qfeWaosCiabgBTyYrt0efZwzXqcW
	l38VQ/TBPI3kXMQZD/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRP-00000004g9N-0mdw;
	Thu, 30 Apr 2026 04:55:59 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRM-00000004g81-42GJ
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:55:58 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c79662668bbso158512a12.1
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524955; x=1778129755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kmUs9vb/vcr2mUVAAZf1T7BVHH8HGZpC2peAj4cQSM=;
        b=XIDeq9DkVP4dmpKbV3u0grTItijwmk2CEUA97y9aytm7vtUFEOTpkcGIbrs2CTyJJL
         nCkvr7etj9DZ5y4Gc38s0iy2PpnghdC1mMxnN1xBZxytvePpleIuCvpPQDjH+ZDxieNv
         ECKjbFYn+ab5E1gAmrFMxwk2w93hj2zcjTAYkZDeRZZ0IsejGZAlr5G5bJyldnR02gif
         PiCwHGm9aUCOJE3qphO3Ujk6ZGibpiTzuIcSW46InVWVstIKoqXMYnnJgAfO3b/b3dzP
         chrikus+CcxeXECHXOwtiwH8fA6rSp7zYrq8yYUxo5q7sg6Tez/WN78loU/XJtzmd6pT
         FidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524955; x=1778129755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4kmUs9vb/vcr2mUVAAZf1T7BVHH8HGZpC2peAj4cQSM=;
        b=OyuAhQVyDAhM0xLj7AzTBsnIod4+L+NqQwLeXv/0XmutsYiaAW+AB1kGkHBJrLUB5h
         4pNaQ46lqc4NB/kHKbVWZHNfmo0sDQNl9m1h1Pr+2RF9kJHPG8175VqewkTB97aEUEF8
         OJOIhW2ObjOf6cEfHgGfAl0wpigFzJnUjO6MQ4hl1umM97AurhNSXfkX6KZOgF22qgXi
         CgB70U3jZsU3G37lFJLBGPoyJrINw292p0rtqINWVOgAu/4iwQTE4SPzyDz8hlYGA6ft
         IHOzrKBGAGyn0+l09OQ1qhYrWn/wZUtutXCEk0kbV+giJE7WJhNsn6FSxraN7CTwGCPo
         0HKQ==
X-Gm-Message-State: AOJu0YzHP76ioGc8L/jLxFwxe8ZgZDwk6Jm0xOIJ7axw3EGE0gEimaB9
	ULKV4SjuT/eb2KZEdpMtYoAOgFAnMyXgUukQcYCsiyJsei2l4Ngd/diVv3homw==
X-Gm-Gg: AeBDieuZcv4AmGe2nVnrtsmgiAKGgmLbfJBzlsL+gzm2Ei+6AS8IAfDealoub3gaUam
	aH+dBpa0ky9yDmz75rTkP+J61tpZIHcLYkDMe64i0D+zF8yzQOy04OQ8ePZI7ZgWIozY2lQK20/
	PmO7Yz7nOWz6SFlnoWUDPI1XLIQziTSJvYxqpqQbOORt9hwnlpj9xFmhWcPx7gLHP+gsxyKUSHn
	tHQuwWfAkOz7VN59kKVB9UGClz+5EdCvC22GycoUKPQy26wPh2FKcG9XdUENcUgR54EZ4DQWxmy
	rJhtO99c5tWSpjc2Bnw0MLk4149sCutR68nkbkEulRT2OwwiwbnTZ8K8PPhzqM6VvMJ02JsE8K1
	EuW4chIgGWxEX40bvqwV+AY+dURo5EdQt/goxFaDewLh1xkFFczrVd0uwEWu7BGnTC9B6YqrIcr
	l5pwOs+MQicj5pwXHjkZ5IkyFBXnr5XUYMl5KT7Pn9epw=
X-Received: by 2002:a05:6a20:7f82:b0:3a2:ecb8:56d7 with SMTP id adf61e73a8af0-3a3cf8612c3mr1433331637.45.1777524955387;
        Wed, 29 Apr 2026 21:55:55 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506f0csm4504626a12.27.2026.04.29.21.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:55:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 3/7] lib: sbi: Move non-HART PMP functions to sbi_pmp.c
Date: Thu, 30 Apr 2026 14:55:21 +1000
Message-ID: <20260430045528.420437-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
References: <20260430045528.420437-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_215557_008917_E55041A4 
X-CRM114-Status: GOOD (  19.99  )
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

Create a new file for handling the RISC-V PMP format.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/sbi_pmp.h | 22 ++++++++++
 lib/sbi/objects.mk    |  1 +
 lib/sbi/riscv_asm.c   | 89 +--------------------------------------
 lib/sbi/sbi_pmp.c     | 96 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 120 insertions(+), 88 deletions(-)
 create mode 100644 include/sbi/sbi_pmp.h
 create mode 100644 lib/sbi/sbi_pmp.c

diff --git a/include/sbi/sbi_pmp.h b/include/sbi/sbi_pmp.h
new file mode 100644
index 00000000..66a5cc75
--- /dev/null
+++ b/include/sbi/sbi_pmp.h
@@ -0,0 +1,22 @@
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
+	unsigned long addr;
+	u8 cfg;
+};
+typedef struct pmp pmp_t;
+
+int pmp_encode(pmp_t *pmp, unsigned long prot, unsigned long addr,
+	       unsigned long log2len);
+int pmp_decode(pmp_t *pmp, unsigned long *prot, unsigned long *addr,
+	       unsigned long *log2len);
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
index e33e3c36..9b45805c 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_pmp.h>
 
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
@@ -272,27 +273,6 @@ void csr_write_num(int csr_num, unsigned long val)
 #undef switchcase_csr_write
 }
 
-struct pmp {
-	unsigned long addr;
-	u8 cfg;
-};
-typedef struct pmp pmp_t;
-
-static unsigned long ctz(unsigned long x)
-{
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
 int pmp_disable(unsigned int n)
 {
 	int pmpcfg_csr, pmpcfg_shift;
@@ -336,35 +316,6 @@ int is_pmp_entry_mapped(unsigned long entry)
 	return false;
 }
 
-static int pmp_encode(pmp_t *pmp, unsigned long prot, unsigned long addr,
-		      unsigned long log2len)
-{
-	/* check parameters */
-	if (log2len > __riscv_xlen || log2len < PMP_SHIFT)
-		return SBI_EINVAL;
-
-	/* encode PMP config */
-	prot &= ~PMP_A;
-	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
-	pmp->cfg = prot;
-
-	/* encode PMP address */
-	if (log2len == PMP_SHIFT) {
-		pmp->addr = (addr >> PMP_SHIFT);
-	} else {
-		if (log2len == __riscv_xlen) {
-			pmp->addr = -1UL;
-		} else {
-			unsigned long addrmask;
-			addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
-			pmp->addr = ((addr >> PMP_SHIFT) & ~addrmask);
-			pmp->addr |= (addrmask >> 1);
-		}
-	}
-
-	return SBI_OK;
-}
-
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len)
 {
@@ -403,44 +354,6 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	return 0;
 }
 
-static int pmp_decode(pmp_t *pmp, unsigned long *prot_out, unsigned long *addr_out,
-		      unsigned long *log2len)
-{
-	unsigned long prot;
-	unsigned long t1, addr, len;
-
-	/* check parameters */
-	if (!prot_out || !addr_out || !log2len)
-		return SBI_EINVAL;
-	*prot_out = *addr_out = *log2len = 0;
-
-	/* decode PMP config */
-	prot = pmp->cfg;
-
-	/* decode PMP address */
-	if ((prot & PMP_A) == PMP_A_NAPOT) {
-		addr = pmp->addr;
-		if (addr == -1UL) {
-			addr	= 0;
-			len	= __riscv_xlen;
-		} else {
-			t1	= ctz(~addr);
-			addr	= (addr & ~((1UL << t1) - 1)) << PMP_SHIFT;
-			len	= (t1 + PMP_SHIFT + 1);
-		}
-	} else {
-		addr	= pmp->addr << PMP_SHIFT;
-		len	= PMP_SHIFT;
-	}
-
-	/* return details */
-	*prot_out    = prot;
-	*addr_out    = addr;
-	*log2len     = len;
-
-	return SBI_OK;
-}
-
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len)
 {
diff --git a/lib/sbi/sbi_pmp.c b/lib/sbi/sbi_pmp.c
new file mode 100644
index 00000000..91eab87f
--- /dev/null
+++ b/lib/sbi/sbi_pmp.c
@@ -0,0 +1,96 @@
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
+static unsigned long ctz(unsigned long x)
+{
+	unsigned long ret = 0;
+
+	if (x == 0)
+		return 8 * sizeof(x);
+
+	while (!(x & 1UL)) {
+		ret++;
+		x = x >> 1;
+	}
+
+	return ret;
+}
+
+int pmp_encode(pmp_t *pmp, unsigned long prot, unsigned long addr,
+	       unsigned long log2len)
+{
+	/* check parameters */
+	if (log2len > __riscv_xlen || log2len < PMP_SHIFT)
+		return SBI_EINVAL;
+
+	/* encode PMP config */
+	prot &= ~PMP_A;
+	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
+	pmp->cfg = prot;
+
+	/* encode PMP address */
+	if (log2len == PMP_SHIFT) {
+		pmp->addr = (addr >> PMP_SHIFT);
+	} else {
+		if (log2len == __riscv_xlen) {
+			pmp->addr = -1UL;
+		} else {
+			unsigned long addrmask;
+			addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
+			pmp->addr = ((addr >> PMP_SHIFT) & ~addrmask);
+			pmp->addr |= (addrmask >> 1);
+		}
+	}
+
+	return SBI_OK;
+}
+
+int pmp_decode(pmp_t *pmp, unsigned long *prot_out, unsigned long *addr_out,
+	       unsigned long *log2len)
+{
+	unsigned long prot;
+	unsigned long t1, addr, len;
+
+	/* check parameters */
+	if (!prot_out || !addr_out || !log2len)
+		return SBI_EINVAL;
+	*prot_out = *addr_out = *log2len = 0;
+
+	/* decode PMP config */
+	prot = pmp->cfg;
+
+	/* decode PMP address */
+	if ((prot & PMP_A) == PMP_A_NAPOT) {
+		addr = pmp->addr;
+		if (addr == -1UL) {
+			addr	= 0;
+			len	= __riscv_xlen;
+		} else {
+			t1	= ctz(~addr);
+			addr	= (addr & ~((1UL << t1) - 1)) << PMP_SHIFT;
+			len	= (t1 + PMP_SHIFT + 1);
+		}
+	} else {
+		addr	= pmp->addr << PMP_SHIFT;
+		len	= PMP_SHIFT;
+	}
+
+	/* return details */
+	*prot_out    = prot;
+	*addr_out    = addr;
+	*log2len     = len;
+
+	return SBI_OK;
+}
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
