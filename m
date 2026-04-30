Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B571CD1297
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXcvS1FBC214W6eukLD7vhHKJHFT+z1w+dXWbRzERzE=; b=Wzt8NOY4iCrpsk
	2zdfWXI0l8KnLcw0Ulej/C/fdA7FuJOFr9Z7JPHCAeOzRKvWf1cul6GL2tOiR1wnfCytSrDohGqll
	av8lTlREf3V38EeD6jcEnGWY8I72guKdj/8GfUuXYrl+rkhJYP5AjbmkwJ/Xb1rNPAIyOuDyYHj8c
	qj89mY+dI8l7LYK/iGqICux8ZdZlteOdz3G0cr2QBOj/p6gQoFbL6yZpmQCV8DIp9wk+bFs5Tyb6o
	5uRMYycxEbrB73w4TYY5AYAqDq4vtt91aT8vvZR1cufLEuyGZ9zbl9icOwK38oPHVetnX3CGP3gnv
	1EirK6XE6nDQGowq1fBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRL-00000004g76-1q1R;
	Thu, 30 Apr 2026 04:55:55 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRI-00000004g5y-0pRC
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:55:53 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c6e2355739dso164288a12.2
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524951; x=1778129751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAnhRo1GxKPWg4HsNx3Qs6h3tWHZjxc6ikn+qpfz1So=;
        b=WgP4/hCpZsqVW3Cn9LtIVw4lIu9i9h/omh6zXY4wFAmpxDwPv21dZ6zjubW6jZwZ4f
         lvlnmnKDj+41iEcsFlsLTrQnkK96y/OrqvjnDzwlVtlDwH1FG2hLUO0qJfrGA96GAE7Z
         R0lbrQeurDP2Jml9XvaxAA5VBoSsjV1dYKk3NC1mhHMcsHrVuCzCDLAABEK0e3h9JlDa
         TtC8gtf/sQhsBEmBeO48HymUUfzBGjWHO/M6QFS+rKFkDTLAL+XlMd6qE6gr2kTeLOJ2
         tWCXZNrSDj2WAyWbovksEP5vizzTQooUDFGheOKOHqLkU1s26MusnkP5EZBVo5o6bSnk
         XzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524951; x=1778129751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JAnhRo1GxKPWg4HsNx3Qs6h3tWHZjxc6ikn+qpfz1So=;
        b=Mvz98AV0uA7yMtxgpfgdyXfXfbgirjpn+t+esJeuruyCK/3ZsXm597COXgLVBWg3xu
         WZ4dfLt3kSBfOmuDOmeN8dnqKN/pTmjp2CZQeLxOM+6EKF28CbMJqEVCDP4zAsye9Vkq
         dEwssE0tQDb6pc3vXl0NrkX8EP3e38dxT7YgezH8nnh+/lGfd2GO2iTRKC+f4/y2eQVh
         ma8xW9sZKjo6qYBTGQuvoQqq7+UaUUawcB33bAKX+0dE6TQP4yzfYzEukwCqeFyHUXZp
         XcSu/PCQ22diIJqmD37KJTIKtIohIarvc84UDCqLS7aHgpjYTcW7UrcLXgX0CRLPwSfH
         izZA==
X-Gm-Message-State: AOJu0Yx+I3Qi5XrTPkQVsXa2n7PWRdmtgCc/5PL5TX/wB0XzouTuiZS5
	WDzHlN34g9HxyHiAxi3F5OQPRZc95tNvVWdCwYvOBMSaIGhULn2bA2CTe+IZTQ==
X-Gm-Gg: AeBDieuLGBl6NvSIZOoCKwSlNjQfxiU5G5LvM6cnPYj7BCQT1clc/s4BQezuf+ekA3W
	oc6hQzdTcMI3W01P+sjmhtP3DmhYmN3aCLnjS9wNPj8w0hi/JlZgmtQj+cE/MKoOtTY29bL8BKC
	2eiS2sYQJqHdNEqyPJSoLxdFMENxCiYzFtm6pWgZFnI+WsZ2ihjZU4/MJPq0+G1Q9tXo4l+Ulax
	MPqXNhloI2KsTtl/HMRXDHITfrT+85qSxyVXUIFYbE7O4S3pZPUtIPtyQ/VoCqDNjl1lwsPzMVB
	zFLi8KJ1/Es/7Ho8T4ZKMXYLqwIQ6JjnkJ5/LCqDbL4OS05XiBeR4bx+1KbTTdE21h3ljRNFUCU
	UyPhipY2sg4JCLti87yFitED8LWvSeB9awoNnYZaTwJc2Fzacx7dpjLv34/YdJo8cbv78FVfTrh
	TWWqqCQ9cAf62iBbpoVd/FHD/wWzh3mM6SjV5xvOI81B5Ft415AfVF0A==
X-Received: by 2002:a05:6a20:734f:b0:3a2:d79c:4149 with SMTP id adf61e73a8af0-3a3cf7c1702mr1581166637.28.1777524950594;
        Wed, 29 Apr 2026 21:55:50 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd64f21b4sm3678364a12.21.2026.04.29.21.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:55:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 3/7] lib: sbi: Move RISC-V PMP encoding functions to sbi_pmp.c
Date: Thu, 30 Apr 2026 14:55:20 +1000
Message-ID: <20260430045528.420437-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
References: <20260430045528.420437-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_215552_246066_3007673D 
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

Create a new file for handling the RISC-V PMP format and the new pmp_t
type, as opposed to hart PMP CSR specific access.

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
