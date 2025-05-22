Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50158C54ED1
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 21:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVHOF68nOv0NY5OrwwEQ6Ek76goJZcbHOuBEPgukNgI=; b=cyjico/oep6Z7G
	lUg00a6oChEwCepVptohPU6MoNHDWjK6LoUSYNxu2BrQ4Hnx6ntFy/HAFXlu0IuXPDxckUpr9IY0e
	U/HjH9TGQdoLhtUUba6VeTMIZjvm5kBHpASSGrV6Tk2wimqcEcOUhz+Vaz9yH7A4AaBN0cd0BLjeC
	e9JvEVVvnSuaQetvpD3TjuwWrSxE5zcRq7+GduYNgZ399RkWj0pGioVZb4xlV/gtGVt3f3+gzsK9O
	SPvz6S4VUskgEcCnWhuEqbI5f9GEYbcu0oNazYgL1RwM2LMwLGgTKbLXqQN+HalgnVtVeDixRQ8xW
	HyNLY/QnquqMR5G30qKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMc-00000002C4I-0YOq;
	Thu, 22 May 2025 21:22:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMY-00000002C01-1cvl
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 21:22:03 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7399838db7fso301627b3a.0
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 14:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747948921; x=1748553721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0BV69g64jA4dSO4GsGLyg+gQrs469MIjVlNrc1edcI=;
        b=Q8g8ujwlMY9sqZwMHQh6nay7L+CDNJ0+c4uaUwOwrilfvzR1qpLfa2EW/JA3xTnnxK
         jbt8Yc8Kt44EnbRf/nzUMY/2zmT7bsRgKvfqoetpSzmadk+k8/dMApUAO16lK2qH+jWR
         SPyDZY+DB0pAjbSHWtsWSGzHNR5+czjt9yl73RTqzkwq0HxNoZjyWqkOe438kLdClX5P
         GvU1mn1Rq0hJ7Ck2hIuZQOJ6rIAWZ78e2Ih43NAmpygU/DAoLKk4EsGdY9q0gTo7RbA4
         sk1UkD/FKl13ia2aq6/SkWlKdhgIo0t3S5JBje6JyMmbihs4BnYmgd5ixx9T5kd3IExY
         wMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948921; x=1748553721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0BV69g64jA4dSO4GsGLyg+gQrs469MIjVlNrc1edcI=;
        b=VYaXjzQXBGtmUCSzpt/O1lv/Cp5cOSZ/whetD7YRAgI5fqDDt4EhoYMJ3UdYMuiip4
         TVXjxQjBzr1qWOWWFWtarBU52f1oyROyMDWu2TWVXqr+JnmflW1RxSB7dXPmIu8XbCyk
         aaBbFTG56Lg+heJBKaFe4XJSg4uAvVWMw3YqX6+34l/UbyVYQ+WwqTnE84KBAgzF8PzM
         rAm6OMLHspEGyyn7dKPfolvkImuuURNeTHFCMo2FI7mCnHVKScU9epANdPsS+IlbgFC+
         MWqPMvct2IHMUjnuAWLnxBtEzIgHhPACElP6Q+pQhv64ZTq5vuHIbcvX/+Q6DLrtT2Wz
         ef6A==
X-Gm-Message-State: AOJu0YxztBJ//jDAkgbL1KcaD0bKeAKciHJ2tpz7D19RxA3jEQKThXpl
	FbPL9HOaGHuFyy/xe+5FfWrPbzdtwLgGIwk7jwbEodnqC+noyfA2xb1Tu5D8f7P0
X-Gm-Gg: ASbGncvfyuT07lO5A4DrVfY2PUHofxBMQ1EXlVFNbhCpVd5ItFn+lb4nOgGCYCrDykD
	lzcpoggW/0hEJ3zMdoKqrn1PVekEFQ1k4Rh2js3WBKq/sUXI/vnDhn1vTFP95QGdlmOMX++nlgV
	xk+5L9Pwn8nIeCDO34aM9jLctsrLA0lScAWhSvlM0ch947gbox0EP/ohBErKClEUTvaG3fgQOg9
	ZlXdJcI/m4L6Avjm4ETJAWBcobPm8XdZZeH+xcHou8XNRPOda4DSY9UDxXOCOGSZuSjGoiEGJcj
	ov6El5o85bATuv/GvRkRR0KIWizYnP5vAOCdy2jPDK+uDqNBfpT2w/JZKni2rUENMQ==
X-Google-Smtp-Source: AGHT+IF5SolD/i7+Q/FtIrUGve9wtwwQK5HWSh41IFncH2BAZ0776XtRC558t5/p6SRc77KzCpH0YQ==
X-Received: by 2002:a05:6a00:e06:b0:742:b31e:e9c1 with SMTP id d2e1a72fcca58-745ece8e3c9mr1218616b3a.11.1747948921327;
        Thu, 22 May 2025 14:22:01 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e1fc3sm11629766b3a.8.2025.05.22.14.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:22:00 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@wavecomp.com>,
	Chao-ying Fu <cfu@mips.com>
Subject: [MIPS P8700 v6 7/7] lib: sbi_platform: Add the platform pma_set function to set up cacheability
Date: Thu, 22 May 2025 14:21:40 -0700
Message-ID: <20250522212141.3198-8-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_142202_429616_EE8437ED 
X-CRM114-Status: GOOD (  16.61  )
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

From: Chao-ying Fu <cfu@wavecomp.com>

Before the corresponding PMP is changed, we allow platforms to set up PMA.
Add mips_p8700_pma_set.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 include/sbi/sbi_platform.h    | 19 ++++++++
 lib/sbi/riscv_asm.c           |  3 ++
 platform/generic/mips/p8700.c | 91 +++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 08ece32..b3a5eda 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -142,6 +142,9 @@ struct sbi_platform_operations {
 	/** platform specific handler to fixup store fault */
 	int (*emulate_store)(int wlen, unsigned long addr,
 			     union sbi_ldst_data in_val);
+
+	/** platform specific pma set up */
+	void (*pma_set)(unsigned int n, unsigned long prot, unsigned long addr);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -644,6 +647,22 @@ static inline int sbi_platform_emulate_store(const struct sbi_platform *plat,
 	return SBI_ENOTSUPP;
 }
 
+/**
+ * PMA set up for cacheability based on the corresponding PMP
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param n index of the pmp/pma entry
+ * @param prot attribute of the pmp entry
+ * @param addr address of the pmp entry
+ */
+static inline void sbi_platform_pma_set(const struct sbi_platform *plat,
+					unsigned int n, unsigned long prot,
+					unsigned long addr)
+{
+	if (plat && sbi_platform_ops(plat)->pma_set)
+		sbi_platform_ops(plat)->pma_set(n, prot, addr);
+}
+
 #endif
 
 #endif
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c7d75ac..3b0cde5 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -312,6 +312,9 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
 		return SBI_EINVAL;
 
+	/* Allow the platform to set up PMA if needed */
+	sbi_platform_pma_set(sbi_platform_thishart_ptr(), n, prot, addr);
+
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
 	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 6b68717..8ca497f 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -16,6 +16,96 @@
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
 
+static unsigned long mips_csr_read_num(int csr_num)
+{
+#define switchcase_csr_read(__csr_num, __val)		\
+	case __csr_num:					\
+		__val = csr_read(__csr_num);		\
+		break;
+#define switchcase_csr_read_2(__csr_num, __val)		\
+	switchcase_csr_read(__csr_num + 0, __val)	\
+	switchcase_csr_read(__csr_num + 1, __val)
+#define switchcase_csr_read_4(__csr_num, __val)		\
+	switchcase_csr_read_2(__csr_num + 0, __val)	\
+	switchcase_csr_read_2(__csr_num + 2, __val)
+#define switchcase_csr_read_8(__csr_num, __val)		\
+	switchcase_csr_read_4(__csr_num + 0, __val)	\
+	switchcase_csr_read_4(__csr_num + 4, __val)
+#define switchcase_csr_read_16(__csr_num, __val)	\
+	switchcase_csr_read_8(__csr_num + 0, __val)	\
+	switchcase_csr_read_8(__csr_num + 8, __val)
+
+	unsigned long ret = 0;
+
+	switch(csr_num) {
+	switchcase_csr_read_16(CSR_MIPSPMACFG0, ret)
+
+	default:
+		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
+		break;
+	}
+
+	return ret;
+
+#undef switchcase_csr_read_16
+#undef switchcase_csr_read_8
+#undef switchcase_csr_read_4
+#undef switchcase_csr_read_2
+#undef switchcase_csr_read
+}
+
+static void mips_csr_write_num(int csr_num, unsigned long val)
+{
+#define switchcase_csr_write(__csr_num, __val)		\
+	case __csr_num:					\
+		csr_write(__csr_num, __val);		\
+		break;
+#define switchcase_csr_write_2(__csr_num, __val)	\
+	switchcase_csr_write(__csr_num + 0, __val)	\
+	switchcase_csr_write(__csr_num + 1, __val)
+#define switchcase_csr_write_4(__csr_num, __val)	\
+	switchcase_csr_write_2(__csr_num + 0, __val)	\
+	switchcase_csr_write_2(__csr_num + 2, __val)
+#define switchcase_csr_write_8(__csr_num, __val)	\
+	switchcase_csr_write_4(__csr_num + 0, __val)	\
+	switchcase_csr_write_4(__csr_num + 4, __val)
+#define switchcase_csr_write_16(__csr_num, __val)	\
+	switchcase_csr_write_8(__csr_num + 0, __val)	\
+	switchcase_csr_write_8(__csr_num + 8, __val)
+
+	switch(csr_num) {
+	switchcase_csr_write_16(CSR_MIPSPMACFG0, val)
+
+	default:
+		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
+		break;
+	}
+
+#undef switchcase_csr_write_16
+#undef switchcase_csr_write_8
+#undef switchcase_csr_write_4
+#undef switchcase_csr_write_2
+#undef switchcase_csr_write
+}
+
+static void mips_p8700_pma_set(unsigned int n, unsigned long prot, unsigned long addr)
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
+	pmacfg = (mips_csr_read_num(pmacfg_csr) & cfgmask);
+	cca = (prot & PMP_MMIO) ? CCA_CACHE_DISABLE :
+				  CCA_CACHE_ENABLE | PMA_SPECULATION;
+	pmacfg |= ((cca << pmacfg_shift) & ~cfgmask);
+	mips_csr_write_num(pmacfg_csr, pmacfg);
+}
+
 #if CLUSTERS_IN_PLATFORM > 1
 static void power_up_other_cluster(u32 hartid)
 {
@@ -255,6 +345,7 @@ static int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct f
 	generic_platform_ops.early_init = mips_p8700_early_init;
 	generic_platform_ops.final_init = mips_p8700_final_init;
 	generic_platform_ops.nascent_init = mips_p8700_nascent_init;
+	generic_platform_ops.pma_set = mips_p8700_pma_set;
 
 	return 0;
 }
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
