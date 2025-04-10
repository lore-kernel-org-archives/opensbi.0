Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D53C3601E
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7otl66YCl1VvGuppQi6hv6xF4QABvSQgmQO6+1CN80=; b=NgZfEJiEzzZ0BE
	HERQ5HfVDnAl0A7cwjt2o8yu8YuNG1ZPDaUREcpzNmy7Usjjzx0/ItGCJ9JsMOMkCwpk56X4m5czF
	B9nXW7DnCqGvpk/0FaH0bX3+u3oOPvNjwkatEKyJqS2rCQip7vNbj7VmRQ6HsSJ+g4JY6IlXsopPL
	eV2PDEO8DOiqMLXPpZr2nXVaGAMuzvt100uKlXG22md5dcKG/wrvYZJR+40EDAVdnPK3gGvp75VjU
	6kUkpo02xu0fNNY6iwwl37iNZt9AExZ4dNMIiyv0STOAfu5OTgr1soOQW2imLGYhGBwduRvg170ut
	XZQ9pxu4MRyaOHiIJ12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Rj-0000000C4Cq-2ii4;
	Thu, 10 Apr 2025 23:36:35 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Rh-0000000C4AL-1siI
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:34 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227a8cdd241so16814665ad.3
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328192; x=1744932992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoKERWf3RZmhqc8EsOfQP+cQyYyfMoVvZzCS5YJupHw=;
        b=cZ1YR0YZqR4YfxTc0yZDZVeOEiSABPYkgBtAJ/fZQtjA8cCkZQ0vLdjwKokdBh7E+Z
         xladon/0sfoqwphLUX+ublzjRRCktOyVV5gNNp88KDFR76rEnKj2HgLVmhJ9NPYDVKg/
         pHrdFKjIun4UegUV1WU4FBN3LWff4TQVveuK46zyjjLn3p53jbC+Pb1+Mf4jUE7QJ1RC
         P5oK7spqDT2EVpwT3la6mJd2J7RQypx7YNjXId41YmjYQReonGFspB4s1+4vZPOCjqCL
         IczzEgbSTmPaKfUGvI8E5tcSY9AbxM5QBKE0ZV+MBeSzK1fDegCg21/tLyLDgcPWSTs8
         dOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328192; x=1744932992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoKERWf3RZmhqc8EsOfQP+cQyYyfMoVvZzCS5YJupHw=;
        b=kPehBPYmAfzm9qIxm2oo3nlvo1qkf85aqbqIfo8gfdAJM/hhRDI/yoMyfo3wi6T4zs
         BfsWoaCUysZJAmD49ExvzfEaAKnr+98/eNQTyHE1jM79hTjvVT8tORnIToQziOm+8+M1
         E8aEAZZagdstjZ/iwj1U4wP8QDQCQS0lCFPhMD6EecsR92XA2Q/4/RFVk5tLNk5eEJKQ
         X2v3U/Oa1yZyH5Hgvs+ruKhpNq7mu00tdCM7knKYRlc3nIS3pqAvzplWIVwnETPyGfur
         QZbyz7mzUSWIS1uxDJ+BpXuFi80WwzJe9PvnEZC0a4C98QjweM+V+6A/2BpURaawUokI
         W1tQ==
X-Gm-Message-State: AOJu0YwdEuKBBhOY85oKZ2+HmmbNAmVCTm7z1fTZgsWDmPc/MyIQgQ66
	/GL14RA84AMQMYjUPDUKCdKaaVN2tWeh8MXaPhg4xqrSzeHj/IC0EcSnq/Su
X-Gm-Gg: ASbGnctp0n9cOlmN6vK2MDg5v5Gn9dXFNTW5Sb6J44gnUJmhiF6mqbCnUpGFA09/EBx
	YWxmCudIS8YFrw72Kyg4iH+DvsAEC1E25YYCXfMov312Rxk7yRg6Ht4+Wfq8HTNayFUKm7GhmXD
	39m3DU3qJAOmy9854GAQPqilpxFm+u7dOS1WeKpUyFxSRQzNPFZE4HIgqiPWBVJXFMx3t75v6Mp
	fDKSjyfzwbNDGGom+gt0tP246i+4CSFeEPnWcXQ2nvqk74GGKj7PfnXFBObvTllVyQT/5PdWq8z
	AyPT60YNpy1K9TE5RPDDrPKNelzP5UfshxP414/ysKyLN6VTS0NlD++CuXKLMbWXAJ99SrHqOcc
	nGRSbC/Podgyd
X-Google-Smtp-Source: AGHT+IFP09nEzTtzYQ0M9eA8thmzVB7YfdDOpqwBS04fVu+v+16QI4pOztm2S9uLAKvAO6teYMxW/Q==
X-Received: by 2002:a17:903:3ba5:b0:21f:52e:939e with SMTP id d9443c01a7336-22bea4bcef4mr9435255ad.28.1744328191886;
        Thu, 10 Apr 2025 16:36:31 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:31 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 9/9] Initialize MIPS custom PMA registers
Date: Thu, 10 Apr 2025 15:45:35 -0700
Message-ID: <20250410224536.25021-10-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163633_497439_07A9B91F 
X-CRM114-Status: GOOD (  11.51  )
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

Before PMP set up, we need to set up MIPS custom PMA registers
to have correct cacheable or uncacheable execution for pmp regions.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 lib/sbi/riscv_asm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c7d75ac..ca7edbe 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -12,6 +12,9 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_console.h>
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+#include <mips/p8700.h>
+#endif
 
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
@@ -119,6 +122,9 @@ unsigned long csr_read_num(int csr_num)
 	unsigned long ret = 0;
 
 	switch (csr_num) {
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	switchcase_csr_read_16(CSR_MIPSPMACFG0, ret)
+#endif
 	switchcase_csr_read_16(CSR_PMPCFG0, ret)
 	switchcase_csr_read_64(CSR_PMPADDR0, ret)
 	switchcase_csr_read(CSR_MCYCLE, ret)
@@ -199,6 +205,9 @@ void csr_write_num(int csr_num, unsigned long val)
 	switchcase_csr_write_32(__csr_num + 32, __val)
 
 	switch (csr_num) {
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	switchcase_csr_write_16(CSR_MIPSPMACFG0, val)
+#endif
 	switchcase_csr_write_16(CSR_PMPCFG0, val)
 	switchcase_csr_write_64(CSR_PMPADDR0, val)
 	switchcase_csr_write(CSR_MCYCLE, val)
@@ -301,6 +310,29 @@ int is_pmp_entry_mapped(unsigned long entry)
 	return false;
 }
 
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+extern unsigned long _fw_start;
+static void pma_set(unsigned int n, unsigned long addr)
+{
+	int pmacfg_csr, pmacfg_shift;
+	unsigned long cfgmask;
+	unsigned long pmacfg, cca;
+
+	pmacfg_csr = (CSR_MIPSPMACFG0 + (n >> 2)) & ~1;
+	pmacfg_shift = (n & 7) << 3;
+	cfgmask = ~(0xffUL << pmacfg_shift);
+
+	/* Read pmacfg to change cacheability */
+        pmacfg  = (csr_read_num(pmacfg_csr) & cfgmask);
+        if (addr >= (unsigned long)&_fw_start)
+                cca = CCA_CACHE_ENABLE | PMA_SPECULATION;
+        else
+                cca = CCA_CACHE_DISABLE;
+        pmacfg |= ((cca << pmacfg_shift) & ~cfgmask);
+        csr_write_num(pmacfg_csr, pmacfg);
+}
+#endif
+
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len)
 {
@@ -312,6 +344,10 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
 		return SBI_EINVAL;
 
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	pma_set(n, addr);
+#endif
+
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
 	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
