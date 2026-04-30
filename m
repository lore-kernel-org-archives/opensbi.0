Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F14FF8875
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 04:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTX88+rWtXnkDhF4pELdykMOAghwi/nze8nN/alXf38=; b=j5LvNGNLI7KhiQ
	IedkBszXKIGo07jTB2jArfmCD0TpJE8QNL7a3fYC+j7yfLOwbb0VJnD9P04NKu5HTrz398DT9LATq
	8s+o1I3jEFlWbSBcx4AQBz000WflqQkT7hqIRj1apeDthZpb+qjGCDGQpjwzFrgYRDimzGnJi2mCr
	fxAfJ74gntlLFHhsAh/domDKwWQNQuPByXfoC80tqfYb8/m+RxRhPX+I3DqHcWyec7VuQnCj8anYx
	HFkrNuYEU+TDCJsvOm5I64ccvwXm8/LnvlKW5ARKUTryM1qFTCYpLkV+eGRqNC0v21N7M5nGPSc5M
	MWXormvPKRzfu91pQh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJRA-00000004g3M-3hbu;
	Thu, 30 Apr 2026 04:55:44 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJR8-00000004g2d-3epp
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 04:55:43 +0000
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83178c0f29cso367755b3a.0
        for <opensbi@lists.infradead.org>; Wed, 29 Apr 2026 21:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777524941; x=1778129741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1LLKCFvi1GEObqYGvHfiap+a5f2X0XLlziBBakRm+c=;
        b=jA07QGVnvtfEW6OXL+9Gb7TAVszjG5HIQ+WoKIr/CvlTaJehfqVOnfPu+UAsL2Krqa
         D1Wm/A4nBdFVY9WJHtKzOO0yYVazv1OO80mkQifiB6gmb8CzJAQIdzLn8SJQqQOuWwph
         ZGOukpqIIC+oEolDLXaNH1Ehfe94l1MT/U997Vcp7Auqwq8/PqhP6sR/inK/ZHrG7eav
         fcEbpwnvYXZqm9i/jBV92uBtWEypL7E9wmWcyvVHt9QCYPa2nP9A30bK/LHriMscWkfc
         hFjyJw53mTa66kAZmUhVTqp9/ep+tqpiSXf058KyFqCJzp7hHwGEfQeKcDCqWLm8Tox9
         fZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524941; x=1778129741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1LLKCFvi1GEObqYGvHfiap+a5f2X0XLlziBBakRm+c=;
        b=du7kCNNZuZDQsQYBaXlF6EBdkGtq6hhWgvcR1IdRBzYwVxw5fvuWbS6xNUH5yooJCR
         i/g+/5oNlAm46c8KvStm1W+ACwSQJLwmTub05X+6CTvhujllo73qN0cI7WNHHH6EAxKq
         PD7dINQwlesCIPgFXmGp+7wZFKK412PcZelSVcCk+pHl1Q5aTW+awkr3QNQU8tAx+u01
         tq4GOapWz+eg/4p/z4QwyL7mD+kxGUEQ2uCdl+Kr6Oa3sDYjFC+p7KXe8960hh3HlMcP
         kw1VDMqXbcM/Az+vBYzVxVR8ahAvfW31rP7guBitMBd/MjJcpuBN7mRfIsbDChQ6v9aM
         Z0VQ==
X-Gm-Message-State: AOJu0YxLh53sXey63zCcbn7cpptIKqNmw39wMx19DleGnXIdGtYllGuJ
	IltyAXAetNC5KgTIsziCXZrs96WK9N3ubOOR/VtVjyTn4Pgt8dxW4IE5CTPErg==
X-Gm-Gg: AeBDietnzwc8Ok8Snwakjh+X4xEkqF/HTZ1VBualvBlhhaeT8ccmHFcKj0HJCFPo6Rm
	j0ncyDeChpa3u978aO3WIxX91iA7D490TvjQVdHfKLVorCD/AoxzbYVjH4Io59A+ZLf8rFIGmTb
	VIswXYLysDzvoC0qKurhJI6ohbAKzJ36xXQbYSVg/Itr4xEPqGI7fEMbzXkjZXt8ONE2fFHZ7tp
	sA07jCMnooJipfrMPytysJ+4yi1POy4nrV3HgwJsmBpHKHVyDSKYyazW3ucusiSYye1YQ1dxn7E
	kgV41ykMSp6bOk5pL/BFUFrltIiWPmCQq0HJx1sBqlekuuyLlIwuSFDFgaj/xSXUw1ZFMYqVtLw
	O/M57zuVfRI2JfovCYVV8r0ZRA4L3qtbQv59U6rGckwqaUhGTUALccvhU8saMsYGsJvEkryWHhy
	Kwd7bat2SN/zVSF+rQaNG6xu1vNDNdrCZZVDuwFgd+1U8/nIEyuqd3xg==
X-Received: by 2002:a05:6a00:1a8b:b0:82f:6e9:d1ba with SMTP id d2e1a72fcca58-834fdc480bcmr1667516b3a.37.1777524941021;
        Wed, 29 Apr 2026 21:55:41 -0700 (PDT)
Received: from localhost ([124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80ec94sm3805750b3a.52.2026.04.29.21.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:55:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/7] lib: sbi: Introduce pmp_t type
Date: Thu, 30 Apr 2026 14:55:18 +1000
Message-ID: <20260430045528.420437-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
References: <20260430045528.420437-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_215542_914094_28FF926D 
X-CRM114-Status: GOOD (  12.66  )
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

To help abstract details of PMP encoding and access, add a new pmp_t
type which contains address and cfg in the format of the riscv CSRs.
There is no functional change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/riscv_asm.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 3e44320f..acb6b5e6 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -272,6 +272,12 @@ void csr_write_num(int csr_num, unsigned long val)
 #undef switchcase_csr_write
 }
 
+struct pmp {
+	unsigned long addr;
+	u8 cfg;
+};
+typedef struct pmp pmp_t;
+
 static unsigned long ctz(unsigned long x)
 {
 	unsigned long ret = 0;
@@ -335,7 +341,8 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 {
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 	unsigned long cfgmask, pmpcfg;
-	unsigned long addrmask, pmpaddr;
+	unsigned long addrmask;
+	pmp_t pmp;
 
 	/* check parameters */
 	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
@@ -356,25 +363,26 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	/* encode PMP config */
 	prot &= ~PMP_A;
 	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
-	cfgmask = ~(0xffUL << pmpcfg_shift);
-	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
-	pmpcfg |= ((prot << pmpcfg_shift) & ~cfgmask);
+	pmp.cfg = prot;
 
 	/* encode PMP address */
 	if (log2len == PMP_SHIFT) {
-		pmpaddr = (addr >> PMP_SHIFT);
+		pmp.addr = (addr >> PMP_SHIFT);
 	} else {
 		if (log2len == __riscv_xlen) {
-			pmpaddr = -1UL;
+			pmp.addr = -1UL;
 		} else {
 			addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
-			pmpaddr	 = ((addr >> PMP_SHIFT) & ~addrmask);
-			pmpaddr |= (addrmask >> 1);
+			pmp.addr = ((addr >> PMP_SHIFT) & ~addrmask);
+			pmp.addr |= (addrmask >> 1);
 		}
 	}
 
 	/* write csrs */
-	csr_write_num(pmpaddr_csr, pmpaddr);
+	csr_write_num(pmpaddr_csr, pmp.addr);
+	cfgmask = ~(0xffUL << pmpcfg_shift);
+	pmpcfg  = (csr_read_num(pmpcfg_csr) & cfgmask);
+	pmpcfg |= (((unsigned long)pmp.cfg << pmpcfg_shift) & ~cfgmask);
 	csr_write_num(pmpcfg_csr, pmpcfg);
 
 	return 0;
@@ -384,8 +392,9 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len)
 {
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask, pmpcfg, prot;
+	unsigned long cfgmask, prot;
 	unsigned long t1, addr, len;
+	pmp_t pmp;
 
 	/* check parameters */
 	if (n >= PMP_COUNT || !prot_out || !addr_out || !log2len)
@@ -404,14 +413,16 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 #endif
 	pmpaddr_csr = CSR_PMPADDR0 + n;
 
-	/* decode PMP config */
 	cfgmask = (0xffUL << pmpcfg_shift);
-	pmpcfg	= csr_read_num(pmpcfg_csr) & cfgmask;
-	prot	= pmpcfg >> pmpcfg_shift;
+	pmp.cfg = (csr_read_num(pmpcfg_csr) & cfgmask) >> pmpcfg_shift;
+	pmp.addr = csr_read_num(pmpaddr_csr);
+
+	/* decode PMP config */
+	prot = pmp.cfg;
 
 	/* decode PMP address */
 	if ((prot & PMP_A) == PMP_A_NAPOT) {
-		addr = csr_read_num(pmpaddr_csr);
+		addr = pmp.addr;
 		if (addr == -1UL) {
 			addr	= 0;
 			len	= __riscv_xlen;
@@ -421,7 +432,7 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 			len	= (t1 + PMP_SHIFT + 1);
 		}
 	} else {
-		addr	= csr_read_num(pmpaddr_csr) << PMP_SHIFT;
+		addr	= pmp.addr << PMP_SHIFT;
 		len	= PMP_SHIFT;
 	}
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
