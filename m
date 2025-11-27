Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393E5D11183
	for <opensbi@archiver.kernel.org>; Thu, 27 Nov 2025 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zW1h8gH11c/uFkL2ONBBjpo+jbXDjzwdiqX//c1VHGU=; b=xP0tdM8c28+I08
	33z09nF66AK6N/2Q/+N+gGvfy1aBmQ49o0tYfViuSruuyRpWicx/PxGDHpfJkLj97knekPsX04R61
	Fab32wh9lMP+M/8uDgyjCwaef5pw/RDp8bDPdg4Z8gxqZ++TXJR1C8Gx1bWqHCSehOnF8lmFoQIOT
	B+aMroEBHgFU2UWgQ4XAxrU3Y4tEotOMT3FgVM8OCsWp/GtUgy88j5ze8hryOv9EWYrxlXcgcbRlF
	0HyOCuCgqGhGrWa4ecM6uHH6ZNi4QZMZeDjC9WjFO8Subjt+QxkPnyQmLoZiKLo+2YnwH19Ild4Su
	DpbDXZMJumL6LKemVesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa4C-0000000GRmY-03jH;
	Thu, 27 Nov 2025 11:21:40 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa49-0000000GRlr-3H93
	for opensbi@lists.infradead.org;
	Thu, 27 Nov 2025 11:21:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2953ad5517dso7740735ad.0
        for <opensbi@lists.infradead.org>; Thu, 27 Nov 2025 03:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764242497; x=1764847297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcGaV2Qp3mVBKvcAYADC0hiCzv6wdTA1uoCwpxgnwVE=;
        b=oVXfedjoHNmZrlJlesZ3z+4i/tcwxf07U/3dGJAKQoJW2Dz/6bqxsy0Vvn2areYnqU
         IOzJu97u8w2zCI0e/fTtaa8nk9PTjJuW+bx/fjMsdprTG7pdaxnYju1BB4PaePnG9Dii
         NimBDFeRHtRTgs5pWSt/6uXhbGeEFeM94lYyvcdcjniErEW7WYMCuHS/6/cciGuuULJ1
         MChKeyGb/NWw4BG5aiMFP00Bi6GBeUWgFMQpkEQY8/rSNIUsL3DQCNKKSU26yHNZ/bUI
         ocLU3G+f6Bh4zshsmwK5jbO6kbJCY/koJ2XehluQY1wcGh6LLDzf1s0AxxTHZO6sZ1Wo
         KYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764242497; x=1764847297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mcGaV2Qp3mVBKvcAYADC0hiCzv6wdTA1uoCwpxgnwVE=;
        b=OU/jrjGYEPR5tIo19z/THFHaHrI3bPf+7NrWgtN33QfmLoEU6TihB27ILtV1eb2PS/
         VHGfnUu8dcJnhQUmHsjovoGu00+GMG4Ai3et5/AWkfvjTegrvvlkOTE039bN82BWUrwB
         cwFqYwja4q88NQneKI0j/c7Uw1i7NlcgJ1ONoiPFJWlflUp7eOri54F4u4j0Ybv1H3IN
         OG3a00cieMvE/38WcTIQ5p838uIm/4QNdGEo2f4FySV9R+mwHzJQQHakEhgijOzdMMei
         MLFq/XuivPKWMfm/np8FgGknWvVEXQh/MXOcnFvl+2qQ73ulZ7Hic/iowjYBTMpNffUJ
         6+og==
X-Forwarded-Encrypted: i=1; AJvYcCW/50oAEJAe2apZtEhfbuEL626msbBpyFZi2A4B6nRYot23TzKj/y6TljMVz35cQx+dOLhUzcFS@lists.infradead.org
X-Gm-Message-State: AOJu0YwCHzH2UaKVtLOqVlM6hUo2My9kgF+hSOnDJibMc9IHqHQYAXPT
	VJjOr5P6Lqe++0Plwm6NdodYN8JS+T5KY/nV+Bw3hpWEmLGMjMrm5/lGYHo/tPgTgnE=
X-Gm-Gg: ASbGncs1dty4gQvpdGxtaoowCUt16l6EPtWoqaz6f0e9puTFAWR/FL8m4Xe7DDtvRhk
	uCcUcI3q8o3fk82lC5XFOuwg5RXZ3hWES5UEZAjQGvzGht7Vu6cpg4R1W2QDp258BeO+qTRtuQF
	7k920sUEz4+ZJGxU5L68GraPD7nOAgvemjH26iZP+vI/8SnImwFvx4iPIXHENB6v5EbtugSzQPz
	kDbUNprxstODDFrhEEIlsC/ggp+riR5W7hFsIaOfk047KG5LUVAPitS7wWsieGV24yeLjfdNV+5
	0qiFi8OKGKiDp/uqTelyzxr8UEU4PtNM0Q7LWkphGRZje8RV5T7RjVp0NdrbbvsE4RkBptYBd12
	+c9NOLvF0wzT18wSep2L5clPlgT9Xuv1W0eyRKxD633FR7Ovzihcwyg9RWGSM7yKfPDeynPcLmh
	gFPk9ftXb4ongDepYZygh6HgJK0Jdo3nWmsceUQEWZ8Q==
X-Google-Smtp-Source: AGHT+IEIFQ229/GxdE7CA5hETI/7OAHUhE5iSHtQTHML+R1y9J9svCg/YdPWAP5STdh8w+k9edLuEg==
X-Received: by 2002:a17:902:daca:b0:295:59ef:df96 with SMTP id d9443c01a7336-29baaf8aa2fmr109357035ad.13.1764242496861;
        Thu, 27 Nov 2025 03:21:36 -0800 (PST)
Received: from localhost.localdomain ([122.171.21.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27598sm15194125ad.62.2025.11.27.03.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 03:21:36 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Andrew Waterman <andrew@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] lib: sbi: Expose __sbi_sfence_vma_all() function
Date: Thu, 27 Nov 2025 16:51:20 +0530
Message-ID: <20251127112121.334023-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127112121.334023-1-apatel@ventanamicro.com>
References: <20251127112121.334023-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_032137_829585_A883F6C3 
X-CRM114-Status: GOOD (  13.04  )
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

From: Andrew Waterman <andrew@sifive.com>

The __sbi_sfence_vma_all() can be shared by different parts of
OpenSBI so rename __tlb_flush_all() to __sbi_sfence_vma_all()
and make it global function.

Signed-off-by: Andrew Waterman <andrew@sifive.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_tlb.h  | 2 ++
 lib/sbi/sbi_hart_pmp.c | 3 ++-
 lib/sbi/sbi_tlb.c      | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_tlb.h b/include/sbi/sbi_tlb.h
index 2c50fe85..3936e857 100644
--- a/include/sbi/sbi_tlb.h
+++ b/include/sbi/sbi_tlb.h
@@ -54,6 +54,8 @@ do { \
 
 #define SBI_TLB_INFO_SIZE		sizeof(struct sbi_tlb_info)
 
+void __sbi_sfence_vma_all();
+
 int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo);
 
 int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot);
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index ab96e2fa..1655d87c 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_hfence.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_tlb.h>
 #include <sbi/riscv_asm.h>
 
 /*
@@ -74,7 +75,7 @@ static void sbi_hart_pmp_fence(void)
 	 * conditions.
 	 */
 	if (misa_extension('S')) {
-		__asm__ __volatile__("sfence.vma");
+		__sbi_sfence_vma_all();
 
 		/*
 		 * If hypervisor mode is supported, flush caching
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 01b31f4e..ada60c32 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -29,7 +29,7 @@ static unsigned long tlb_fifo_off;
 static unsigned long tlb_fifo_mem_off;
 static unsigned long tlb_range_flush_limit;
 
-static void tlb_flush_all(void)
+void __sbi_sfence_vma_all(void)
 {
 	__asm__ __volatile("sfence.vma");
 }
@@ -86,7 +86,7 @@ static void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_RCVD);
 
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
-		tlb_flush_all();
+		__sbi_sfence_vma_all();
 		return;
 	}
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
