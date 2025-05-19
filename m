Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E08C3DA6D
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5iclFfczpB5xCBYjOnuHhF7Sk9dWNlYXwoApvGNPF0=; b=ORKhaJCYJb6/kT
	I5jYjXAG0bxBAjyDJZk4vnYdjsdkleCJmgHZBAoDkyExkcUUoZTCY2+VcINDyISr9FieFrzCHecZz
	GXtcWJzR0358MdBX55jffhm7rf/oqqAbloUsVgUCx3L+0jujEv3HmS88Gh26WEMGXG1VaXvLUVEMT
	8IyN2E70Q7kvUIZajmx6MjbP8YieuaZZ4ix+wiKQvoAFcxzX8j2IMo6TMcWVyr8mgm2rihAaz2Ek+
	aD3ZDnql8U48/60ilUMYUEcmJ1Lb9YVcxw6pIT8VjLd9aMkeDIyhPyJUbSPu4J1tKm1/5UKV4lhOb
	WSO+MqHM5cPhC9MshSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vt-0000000AgHG-09xw;
	Mon, 19 May 2025 21:59:13 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vq-0000000AgBv-07sJ
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b26f5eb16a5so2708785a12.0
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691949; x=1748296749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpE+o0x2ul3gParXfGneVlEjtn1K6F54ZP+OiKBefHk=;
        b=PJOc6pl1B1P3b9Fz1KYr7Hz84fbiOKOsEF4a/zV1nufC+GsJDVQ3QeP1CO7UDBFfh8
         qDoBeRJHbAqonwmCfcwd9aJ8GspqPqGt8R5+hfX6ZIfQ6nBqlaN5QD/fGyxZaQLqgwIp
         lj83MH6ANIvzWlXOdfFqGit2Cp6FX8PMZ1JOecbv4K0ngUac7JIBvyfM5S/wUZT5t1Hy
         PH6RfOHSdS5fE9O0g8VMoMy67JeLarPyrmVJxtuCLd6Fjz3huYr6HMh+x7WmI468+zdC
         ItjUrztMofXFxpSKOkENBN3I+OLAUFYlEwhccUsLYOv/qasJZsmuMtXzsrOGCd+V4FCZ
         i5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691949; x=1748296749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpE+o0x2ul3gParXfGneVlEjtn1K6F54ZP+OiKBefHk=;
        b=SZCYM+HvcpoRe87LL3+pKQW8XKjS6Q9oYi/pQH5HXlCpaJHhqt7bnWfOh3XKs+3DZr
         +fRLN2mwJYgycYH3Mp7xhe/SxmPFrTDSRYHzBT2T3mO9izEXo67rSBCzSEGsIkIaxKpQ
         3+wUKJIfY+bZ62W86VxFxsUBhi3BfUENjluFwi1Zn3kmtDT6xnfHHDzcaj17NcCuJRMu
         QUCpO3+fiq/G1zAr2rllj4fmB9J+gbgKorXKW1ObdSlJ9puPMPCZgymgRe9bj9UCUD7R
         0ssBOYAS9rP+RY5dFFCxItM9bCVWHpcunxRqHhEv6czq3+aNAWcNJ74dbr+YDk3uvXNP
         JZIg==
X-Gm-Message-State: AOJu0YwbcE6AGLl0YQSNF0EbwXpC6lQRZ8aexBCfEuBnd0iUyZoQ9S2+
	1kZBYP3Yj8+vtqFX/90AP/fBPzpNlwKNJoMe5GwI0UmgC6RjE/EpLfhViD2Rgl/5
X-Gm-Gg: ASbGnctfNDPiFn00cYQAfbAppYJKP5RMlNjfDknCcBzYhnrIwBeoXdm/ZhAqUiENqUG
	hvBfVujFLrIzKhlaZhm5+T+WVw37QdTTzmk3kFs6JP8qmBKb5HeLB8THA4SpXG1KcH4Vvb9Lats
	bkH4TsPA/IyLK0UYX1iggmXBtUTnQe14leIoYv4qXubEKcWPFO59sr2oRC9zPzlFFvKF63zsVFO
	NRxPmx6IOtgSxmVl3sZLiAkEfok8cIt6ASWm2ntLYUlIr7bPqMV+CmAyn5ZdByw2hSTIS16wv3f
	jZXCZoNEhUBA2gzNzayHM2gie34STOQ1cgkArQgFDAOTrBsUt1eve++h48NrHaEj4aKFM6+FVlo
	6
X-Google-Smtp-Source: AGHT+IFfgUCKC+xDsIUoZgqdx8bpa9NMUgF7FwYr6R4r07NCrzm5w1KE4D/sl6WZY9iFzIXtq26/OA==
X-Received: by 2002:a17:902:ce90:b0:232:5d3:aa73 with SMTP id d9443c01a7336-23205d3ae44mr149759935ad.13.1747691948706;
        Mon, 19 May 2025 14:59:08 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:08 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 07/10] Initialize MIPS custom PMA registers
Date: Mon, 19 May 2025 14:58:44 -0700
Message-ID: <20250519215848.27569-8-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145910_098114_D701A702 
X-CRM114-Status: GOOD (  12.03  )
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
index c7d75ac..7eb02cf 100644
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
+	pmacfg  = (csr_read_num(pmacfg_csr) & cfgmask);
+	if (addr >= (unsigned long)&_fw_start)
+		cca = CCA_CACHE_ENABLE | PMA_SPECULATION;
+	else
+		cca = CCA_CACHE_DISABLE;
+	pmacfg |= ((cca << pmacfg_shift) & ~cfgmask);
+	csr_write_num(pmacfg_csr, pmacfg);
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
