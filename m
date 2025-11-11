Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B053CCFA1E
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 03:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fKNQxUmeWwaiCvPWnzWUZ40qRwbj8Yr5KsXa1rNkHo=; b=Dr/JSrIYxsQGCi
	bYyQ63di8uuMDDdJBbOfSVNNchhPCkwrcOfePLmxw4pH4FJyJ38qz2OAe441s1VpfLkk0OEqrKAIS
	lcjKAJFiasGXufB/3hv3m3ZFfVap/VxM4qAMlgxFfeKDqdo289GttO9Wxr0oY90FxNPB0eKxWXEfw
	VklYrZW/OOrjB5C9yQJ7L7+iJiGjjENWuy9CL2vEFMZm6TwGDbdpEu8TWM03P88XCyywPoTv1Afz8
	DIhNhHQulxagJ4LDwMV8BR6A9ysebk79bSIWQJBn9Ld+asoP02PBKaeFfDEegPqqfPcyaw+FKsG7A
	TbVVbS/zFeIODCFG2nHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHJ-00000006SNt-402b;
	Tue, 11 Nov 2025 03:42:45 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHI-00000006SMu-0zn9
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 03:42:45 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3436d6aa66dso359221a91.1
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 19:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762832563; x=1763437363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtsN4oHL+tkMoNrGpgKlH5kOFpaq5YKLolTNwo9A+E0=;
        b=PppKrRBUHJgVhI+LCBivEC9SRaBctd59phGS6O0XLPv5ERAtd9o51sWirE+/+8hpYu
         mJkVSpaR311C8bJ1V7CbXzAwFDh0ISLEMt3rg1d634RISXdxT57TclVJzcYOhaUHV0M3
         bofR1P7cYfXJmUrqKWHkl9DCYToT3CPtuazsTwBEKG11OqE8mMc1sRGPWOWYlUWH34KJ
         kN3Rjn8tB6IIMpIPyxf1TvCMWjmD06hDYigSIa/ijqq6Bcrr0/FwW0yqHhXIH3l9hSia
         c0tAR/iF1O9TRfZ57/NoO7LhKvJ/nwR6C1CoRExMQU2fzBndKn9xdRmCA4fF66aYIPKs
         Jt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762832563; x=1763437363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtsN4oHL+tkMoNrGpgKlH5kOFpaq5YKLolTNwo9A+E0=;
        b=CnJdqPyYmcQZh+zczps14GXC9sSjX+MrDIHNrUcdCqXvSM5ZS4HYoHC/usCClAw+Sn
         nxy+3NAGITrP8BEj9pNox9dHrP5HjufMq+5xxZtwjDX0TLS/A7B6y19FvHnZX/xOZj6L
         wq9YoI1IHSflaASFM3FW1eC4eI4PAnNPG0NKeZ5vzh0lgU9DX4WimIgLOc+eN/6Y5xt3
         z0PmuWXchU1GMN8dgTz62vO6PLkUFVakedFsusgWTLY2xQTZhof/CE0tz4RqvevRSvP7
         92hpskgMsxxltTdUc3v1DK5gU/oVYgQkPGk9h+9m585/Nfpx68F5C2FcHDSssb+zMsgL
         MQow==
X-Gm-Message-State: AOJu0Yw7mcWManM3bmEOO1hGe0yJ4zSrdCft8hx/3d8yczOiDnOmTVFl
	Vq2wG9Qf7TQMlcgqBNXw6rn+3G3/VFNIW3Unswza/WuDBY+z/5yYu/AqJT/ghQ==
X-Gm-Gg: ASbGncv1tShT7ZBDiWBNyXyp56qfNQmISNXM2yNVoG1H1XLQ+XoGHhjyZ+6+9XyL2DX
	F20CirvswIpXSgSQH3YRawiYYZlv2JiSbX8Motmz1L6PT4XIR0QVnUd42HbzGtTjY3DOXbvgJQ8
	9aMBeXwIHTim1Tq1cyDEWUqlBsWzceAjee4l3tybtsgl64HjVyjYS8M9g1PuPYj+C72xqAQW+pX
	A62necJF57sPOjn6xJ9KffUZfI2CDY1JjGM+iHEeqT7LHfrEFJxSAWTT5XSzV3oISmU4ehM+cBn
	7bKr+il/a+KYcXEYpXoJn0qMxvOaeH1mslImMFuTOqxbAbucX2Z8n2n4WIHZw4Gs8qFikOqMub3
	dUYgeNYvrTNBQ/A7DMlnx+T6B6GzSXA8E6ppsswm3ceVTkpjSRbpMGQGyjKCff4j0jOyIOu2O72
	UQKQ==
X-Google-Smtp-Source: AGHT+IHxrtZLGosCv0ICYOklwFWjztSubwLWsU2PZem0mZe8Eu3dJ/uCiUdws1FEvbBDSPLupUNiUA==
X-Received: by 2002:a17:90b:584f:b0:343:87b3:6fbb with SMTP id 98e67ed59e1d1-343bf0bd8bdmr2087918a91.8.1762832562690;
        Mon, 10 Nov 2025 19:42:42 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68bf37bsm19434060a91.7.2025.11.10.19.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:42:42 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org
Subject: [PATCH 2/3] lib: sbi: Add pmp_set_tor for setting TOR regions
Date: Mon, 10 Nov 2025 19:41:10 -0800
Message-Id: <20251111034111.43973-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111034111.43973-1-ganboing@gmail.com>
References: <20251111034111.43973-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_194244_283040_7CE43125 
X-CRM114-Status: GOOD (  15.45  )
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

It's advised to only use them in platform code where the caller can
ensure the index and order of every pmp region especially when there's
a mixture of TOR/NA4/NAPOT.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/riscv_asm.h |  4 +++
 lib/sbi/riscv_asm.c     | 75 +++++++++++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index ef48dc89..c23feab6 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -218,6 +218,10 @@ int is_pmp_entry_mapped(unsigned long entry);
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
 
+/* Top of range (TOR) matching mode. pmpaddr(n-1) will also be changed */
+int pmp_set_tor(unsigned int n, unsigned long prot, unsigned long addr,
+		unsigned long size);
+
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len);
 
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 3e44320f..8f64f2b5 100644
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
+int pmp_set_tor(unsigned int n, unsigned long prot, unsigned long addr,
+		unsigned long size)
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
