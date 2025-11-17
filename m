Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1215CEBF91
	for <opensbi@archiver.kernel.org>; Mon, 17 Nov 2025 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRxzoD46n2XjQtDFl7QfGbe9MILm5a5X7zYeCYpyiB0=; b=bXzLh45Lf56Ufe
	ZVQZwXGVTizB8zekfOBuMUWfZQQLw/0qaKc2Y6N8rnefhOeX0DPEdWKWzMK8xmFWwwmG24Ae/FAtZ
	N4611VS4D8rLdsVhAPMr1gSZ29mkYa5/7pDwfeKvOEXSBCAginC9sA81hpsqEvUT3/HOEhcmfObs2
	V0Lix3Vsj8ok2ksFiGUt3YmtW1v4BWgUXgJ6Yg9SDuiHyVlCYB34Qmw5bhESDbz38MaujpqLEQchN
	iB5s/8KtZ3zNSFQHsxVPrsfUnOBAb7h24U8umQPfYcLYwZMS2JbK17JzYNHB1Sf3IB+oGzHVSPlSV
	HmowIEPkpPWy+i141Nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8E-0000000FT5q-1S27;
	Mon, 17 Nov 2025 05:50:30 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8C-0000000FT4v-0DlS
	for opensbi@lists.infradead.org;
	Mon, 17 Nov 2025 05:50:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so3233482b3a.0
        for <opensbi@lists.infradead.org>; Sun, 16 Nov 2025 21:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763358627; x=1763963427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbVXSQ65/B30BL82vjW85AhOjbljOqQztRcfowyYFh8=;
        b=E3mHkc4xXOojNrUP5yfoGvAYVr6T/sNXVKtskFWl/v2q65+/wON08zbK95FxpWjDBK
         2A2pNYq95M+yvvMy5cHbC93o/WO9H6gUyO1oRRY1730yAnziswV44d6GUYcv1SB+d2XE
         VYuAt4ReekkdCaDbWbreDt29cqN8jQf+MV6lnQmNSte/5oMkm8DOmnle7CSTzwNP7kXx
         ktNsoC8fNtcOo7hAfwrHpB76spF7DBwB3xuow9KEP27PkZjz3CcHL9Fb5Tv1DhQkv2Bu
         kD4SLwiDQNVu2UbYve8pvdp9fiv9KAyZqeeweIoKMIq6NjO2kwMvekJg2AEtf+Ht7HUF
         XUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763358627; x=1763963427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbVXSQ65/B30BL82vjW85AhOjbljOqQztRcfowyYFh8=;
        b=pi8axJzDW511nfHO0BOHB0GXpLGS7qh+W2fKlkKmC5C4nlp8n0DsshtBjHMfi4Pw4Y
         EmQuiKo1W9ANQ1w8SUXHRD4tCnr/GwGDlv2Ah905t/uqtkNImWoUCmqDY5azfiKw24d4
         VAHo5NDneT40Pa6H1R7A1NZxwyrlplrZZzxtePY9LJWeE9x1G1UT/1FRg2nWOPIkpvGi
         E8vS1TpBA27YEOPGTnZsY7LCY2tRSk6Im9gkMQ20z1v/P0n9irfaj9W+yP9nugvZ4nBG
         8PJCXlYMgMP4pdDPpgMvCr7e+0EbbO5s+topGOryO+ic5WsF/rJsuk1lqhaMw7cQMkjG
         +w+A==
X-Gm-Message-State: AOJu0YzO+iM7Tr4vlW0ZuA/Mt39wGC4CxuOZbG5EBbjlyN4ZnqBmDZYO
	IwIKe5fw3uzt0Q0Uexd4c5z4J5LiWVq/VXJXlKVNMsSC32PpR6Wo3Di+fvdmTQ==
X-Gm-Gg: ASbGnctrh/OpGdzgDfbs7AeorYp5Zx4Q89bbMXpzE6Wap0UZdoYBejNv++t+FNjkf2z
	FnjPBzcvOLr++QPcUyBW54GuOCYrHW9zoPdUb4AhC4gUphTWDUR5d12CCtMjSrrk6+u/UvPKgEA
	RYiDOwhS1w3YUQSZPGFy97bvJh0TGaFM8k9DOoI6/SjSrmqsvE3iC301vpECntD5vxzxV28iovu
	4NdwrKvHloXxULxenopJ7UezZsNg7MRRIasNaf/qxPc7P1GBD7o/N+QkziB3MiOSjIi2cfMPbh5
	qzS2MbuHMJMRKXBoB5PdV+JBomAHgMkz8RUQ/dEHhwCx6nFIV2YjAyomnlUhOh9cif8GrySyfTE
	vwPgLCBqh+4PBdMUZZ65/TwNYtWHc/mnsw+9Aoayo7NqJyJDyw6WPRuBQige4T3JjaqyTvYAkYV
	GIntLF5GJwV7Z2
X-Google-Smtp-Source: AGHT+IGyIA8AWkHYG6sKEQGI5L1EFnMzTq649sOWmyRR+G5fJlWomj97PB13sy3OwKGqugrkouSjxg==
X-Received: by 2002:a05:6a21:998d:b0:35d:f625:7e87 with SMTP id adf61e73a8af0-35df625825emr5968039637.22.1763358626880;
        Sun, 16 Nov 2025 21:50:26 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924cd89bcsm11719856b3a.15.2025.11.16.21.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:50:26 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v2 2/5] lib: sbi: Add __pmp_set_tor for setting TOR regions
Date: Sun, 16 Nov 2025 21:48:43 -0800
Message-Id: <20251117054846.1335-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117054846.1335-1-ganboing@gmail.com>
References: <20251117054846.1335-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_215028_097013_0FBA755B 
X-CRM114-Status: GOOD (  15.39  )
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

TOR can be utilized to cover memory regions that are not aligned with
their sizes. Given that the address matching is formed bt 2 consecutive
pmpaddr, i.e., pmpaddr(i-1) and pmpaddr(i), TOR should not be used
generically to avoid pmpaddr conflict with other NA4/NAPOT regions.

Only use them in platform PMP (un)configure override code where the
caller can ensure the index and order of every pmp region especially when
there's a mixture of TOR/NA4/NAPOT. Don't use TOR in lib/ code. For lib/
code, maintain the 1:1 PMP entry <-> memory region correspondence.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/riscv_asm.h |  7 ++++
 lib/sbi/riscv_asm.c     | 75 +++++++++++++++++++++++++++++++----------
 2 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index ef48dc89..04ecf5c1 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -215,6 +215,13 @@ int pmp_disable(unsigned int n);
 /* Check if the matching field is set */
 int is_pmp_entry_mapped(unsigned long entry);
 
+/**
+ * Top of range (TOR) matching mode. pmpaddr(n-1) will also be changed.
+ * Use it *very* carefully.
+ */
+int __pmp_set_tor(unsigned int n, unsigned long prot, unsigned long addr,
+		  unsigned long size);
+
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
 
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 3e44320f..557e1c82 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -330,16 +330,10 @@ int is_pmp_entry_mapped(unsigned long entry)
 	return false;
 }
 
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len)
+static void pmp_set_prot(unsigned int n, unsigned long prot)
 {
-	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
+	int pmpcfg_csr, pmpcfg_shift;
 	unsigned long cfgmask, pmpcfg;
-	unsigned long addrmask, pmpaddr;
-
-	/* check parameters */
-	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
-		return SBI_EINVAL;
 
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
@@ -351,15 +345,29 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 #else
 # error "Unexpected __riscv_xlen"
 #endif
-	pmpaddr_csr = CSR_PMPADDR0 + n;
-
-	/* encode PMP config */
-	prot &= ~PMP_A;
-	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
 	cfgmask = ~(0xffUL << pmpcfg_shift);
 	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
 	pmpcfg |= ((prot << pmpcfg_shift) & ~cfgmask);
 
+	csr_write_num(pmpcfg_csr, pmpcfg);
+}
+
+static void pmp_set_addr(unsigned int n, unsigned long pmpaddr)
+{
+	int pmpaddr_csr = CSR_PMPADDR0 + n;
+
+	csr_write_num(pmpaddr_csr, pmpaddr);
+}
+
+int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
+	    unsigned long log2len)
+{
+	unsigned long addrmask, pmpaddr;
+
+	/* check parameters */
+	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
+		return SBI_EINVAL;
+
 	/* encode PMP address */
 	if (log2len == PMP_SHIFT) {
 		pmpaddr = (addr >> PMP_SHIFT);
@@ -373,10 +381,41 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 		}
 	}
 
+	/* encode PMP config */
+	prot &= ~PMP_A;
+	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
+
 	/* write csrs */
-	csr_write_num(pmpaddr_csr, pmpaddr);
-	csr_write_num(pmpcfg_csr, pmpcfg);
+	pmp_set_addr(n, pmpaddr);
+	pmp_set_prot(n, prot);
+	return 0;
+}
+
+int __pmp_set_tor(unsigned int n, unsigned long prot, unsigned long addr,
+		  unsigned long size)
+{
+	unsigned long pmpaddr, pmpaddrp;
+
+	/* check parameters */
+	if (n >= PMP_COUNT)
+		return SBI_EINVAL;
+
+	if (n == 0 && addr != 0)
+		return SBI_EINVAL;
+
+	/* encode PMP address */
+	pmpaddrp = addr >> PMP_SHIFT;
+	pmpaddr = (addr + size) >> PMP_SHIFT;
 
+	/* encode PMP config */
+	prot &= ~PMP_A;
+	prot |= PMP_A_TOR;
+
+	/* write csrs */
+	if (n)
+		pmp_set_addr(n - 1, pmpaddrp);
+	pmp_set_addr(n, pmpaddr);
+	pmp_set_prot(n, prot);
 	return 0;
 }
 
@@ -420,10 +459,12 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 			addr	= (addr & ~((1UL << t1) - 1)) << PMP_SHIFT;
 			len	= (t1 + PMP_SHIFT + 1);
 		}
-	} else {
+	} else if ((prot & PMP_A) == PMP_A_NA4) {
 		addr	= csr_read_num(pmpaddr_csr) << PMP_SHIFT;
 		len	= PMP_SHIFT;
-	}
+	} else
+		/* Error out for TOR region */
+		return SBI_EINVAL;
 
 	/* return details */
 	*prot_out    = prot;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
