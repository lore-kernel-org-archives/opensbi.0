Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D29C3ABA5
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7otl66YCl1VvGuppQi6hv6xF4QABvSQgmQO6+1CN80=; b=BrnfqLTHjbTXCs
	4rthMtpvZkvg04HfahIQE+o9AYiMVlC1gTaSCLS2LvRW3K9j3oZuLECwnhizKFTy3WgCbM3mr10JZ
	cqh8FKpq/MeCljPZsIEaqsOOqNnvrKKFXR7bADW0x377TvREfga6MHeZ6qwPcTrzM1DVW1kWS0Kqg
	qxxFfG6jXHcWi7Sxcs7/+5GUwZzoGelbqRV3shw+dX7ZI8NyzitZGgveVgugehB5yc3kgIrcxPBic
	2xmggDn0Hno/6ciSs/4TlHP1FiDGga4X5sI5oVwnlIWfx8gT/2q+HYtGT1JKj+w66klVRQpCCZe/A
	6ZWwSdk6u6LdiK4XLYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyx-0000000BDpv-04Ug;
	Wed, 30 Apr 2025 00:07:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyu-0000000BDmW-0hUV
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 00:07:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224019ad9edso100081615ad.1
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 17:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745971638; x=1746576438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoKERWf3RZmhqc8EsOfQP+cQyYyfMoVvZzCS5YJupHw=;
        b=DRkTOkyrM7xmU1XDnl/Hu4QN1Z0eHO6VPqfFqVufYhpj517j2bLSuU61I70MQwsAoK
         9G5AVXqROMA7IUQThXhM2qeUxhRtshuO1EQJNhT29G1nnwxZgQHQXGVMC2/mVm+FQuVK
         54h6w8fiJ//84YcBUAEClBCyS3KaGnOAI3tStu76kwE9wjY55hR+ljEIbV18rngXN5uG
         uC9h/gXrL0rBi3O3thkJrysmce1ib/yEm0PusPx0hLW9CwxwgKrUd+BT0jNVM9dJCERe
         Y1o608SWqQs3+4ZlK0/hwMu74Lrz30hlafVfU+/M/qKL/CLoAW1SCb5wGOuwp7p0zTtV
         6R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971638; x=1746576438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoKERWf3RZmhqc8EsOfQP+cQyYyfMoVvZzCS5YJupHw=;
        b=GaUpWyZ8TSbHgODSNzDBcRuf6fV2MNm1eOWTycHAKsMErAhmEmhUr/7mbG9pq4VULc
         4sT4k1QmIwdflNI30r0ywynYnHjoqPSczTN5rqRZH1OOQ93u4gAXXztOwC91RzX7OpYE
         lbXHyBkxem/IEM7aA74Rn6fSbfvokaVHk4qT9/W75HJQY8FAfS8U5XEXKHpDimrz02D8
         SMELjH2fX26BeJdcT+O4wH+tCS1iOTwAJ1eqxkihTxkzjFT5J9gVk0KYe7tzmssh/j/z
         ThnUodZsLijLgfzn7pxpzhkAKmjoVKFp3XkGum79RLcp8uEKQgsCRghop9iE0tqv2Xa6
         TiYw==
X-Gm-Message-State: AOJu0Yz4lZvl8ftMBs0Pmi5IOzNIgZgytJnoJf7UF2HFAOawy/xldUji
	dEYFHf+pC4VKxzeIQh3YqMuXFmrUvRZHX7ENoFYjaFcLkecMTuC0qDy+pA==
X-Gm-Gg: ASbGncsLeYteOcGkU/hj0GdiqGOSvg5Vgh/CLV12nXEmEaR6ZgR43vKkTnOv4ChH36C
	mBpwjmCTBVmL4ahL00PoUUJpq8KCfU++oQjYXtSVVFDw06nTz9Bm7INeEKnCUJzZgAJ/mdrsQw5
	0Jk6QLR3ZTBvni7ilklxvD6/FK8SmANkmyudvT6odXObGxoNIQMbclAcWFCUGpptXjn+o7NoFs8
	hhq7M8TEIwKhRUD2+R0llVS+9BlysPQd/hNC1lH243mAmJbXDJ9/ayTZssypB5mxu2316QBzi1f
	39YhDjdvVSpK5wgstXmQtBdyOt2eYFz/ErFjkqt3A5Zb6QVk+GdBej5/p2Fj2Sr6
X-Google-Smtp-Source: AGHT+IGc+MWGK6IRl+sisa5k+LXDJV0HycJzTPpih/cP2YCDuRawQTujT2l/y+ruZ/WCAg3DY0x5xQ==
X-Received: by 2002:a17:903:948:b0:21f:35fd:1b6c with SMTP id d9443c01a7336-22df35d356emr17244875ad.45.1745971638438;
        Tue, 29 Apr 2025 17:07:18 -0700 (PDT)
Received: from localhost.localdomain ([50.247.98.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm108953815ad.114.2025.04.29.17.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:07:17 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v4 8/8] Initialize MIPS custom PMA registers
Date: Tue, 29 Apr 2025 16:29:28 -0700
Message-ID: <20250429232928.6499-9-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_170720_237613_574A02C8 
X-CRM114-Status: GOOD (  12.07  )
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
