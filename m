Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C36ED10F5A
	for <opensbi@archiver.kernel.org>; Wed, 26 Nov 2025 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDJsoywp7IHew3cH7oHxUYAUnLTP7VA/Y3prVwfUxd4=; b=egGkyoFuqqZUFh
	WzAFEIDgYmBWYGYlpBc3LDR7oDIbLr8xTHklZVtQrqTjyfY2lsr3+ioSCkHvDUXULhRduHhC7a/GN
	gq3oWjRuCeWgGQOUhRf9A9yeoY6cu0+heJa2MataqfF009K789Pa08+sSCySgH9bnj+6+4l2eQRda
	gsSDKl436E/IqMgmccWdaQlxGg8/o6+t1NJGNn3nks/+Hl98vqqyk3D6UsMzv910f/6r+KYgMgYhi
	j5tyDVpLNIwI7R8/13rja89nybMfpZAvF8NH8ENcqSVFCYT7w+M4DvKy/Yv3cgKLMaA8PcbggWeS7
	FhiwCM64FW7rVyWjo3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMP-0000000F5mB-3Vqq;
	Wed, 26 Nov 2025 14:19:09 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMM-0000000F5l1-2V47
	for opensbi@lists.infradead.org;
	Wed, 26 Nov 2025 14:19:07 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-bc0d7255434so3774683a12.0
        for <opensbi@lists.infradead.org>; Wed, 26 Nov 2025 06:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764166746; x=1764771546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gy9oV7zm1Nan5z5QnPIWyM0gTGRwrh4+I95dBiQico=;
        b=RDiw1+9hqJqB1NbL5WXky2tpk5QV05sS8Owomhqr3VNFQXnfGtqaUwlJIrnusbDm0n
         KCMJYnx9WbHKfdCGq70OOHJ+l4C5DNfwecg9IkANuc42WHuzB5AtPdHy8v+V1Fk90dOx
         b4df1q6WrqLo1VqWgXG0DrjbX238NevbBtuPq9OLbTXG9rp4fDt2CiKO1G9GmaDH8N+Y
         UxAL/98q1LdimJQeltBgyL9U1vfbFVyMgm2WGr0ebuN/eJnr8c0eFtLWfXtftpzSx3KC
         W33HoEr82mP7g3KKJuRx/puX0ZBrAcZhDMmw7ewS+43hfrtSGTMo7ME+kK9YsnQ7QPUu
         95Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166746; x=1764771546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3gy9oV7zm1Nan5z5QnPIWyM0gTGRwrh4+I95dBiQico=;
        b=tkjvwpZJlhKBAeH+xniRfFTVAfB7/sgiUzZJuiiIyBuVb3kdW7taTVXrOY7j5/PEVA
         TkWNdnNHK3w6slKxJBLipAk0FwG4Kx141YKYpuY7H4yFQf4VfxBrhwMeFXCpjFEg0Pll
         WrkSyDG+4PCqWzIp+RYdkl5TuWJ/uIy0gSxnNqVLAARCiTKYRQy/NJ9lcvs7Flx3XCFh
         4xtuY4yuVLxu+SjdS8tLz6xq3gEk1hYxofaZ6ep50ZkeTmUfXZmGO5mqWV2c/o4+r6nM
         F7drTnI4zxwWJO51KRGnu2R1XKH7AlFOEJIJcnaLOv9ouqSuARhS+Fru6e+TRKRRSphG
         4KvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP677jZz1ulcpiLvr46k3TaqynyP0aGm0+taK57znM/Zs2gWwTOXgx9QN6HyNg+Ne7tQOKxTGz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Bq7Fm5rlsXEd1cRBFw2YsAsT/TfeCY3BX/oMaDM/QDah80HS
	ntsfwLOBe8PnqQegXdfWWp3Q0uS0LR9Y7BFOKV1QMo+COIUmuffSlsDXerWGff0jMUU=
X-Gm-Gg: ASbGncvtKp7m8k7ysSQKdNW/41DmeUpvwDHj6MbF+ylAywcD6nweiK8MqTcVfsYk2yP
	ImBq5TzvwhnGw52FjtWIm0CvKHygc49PkFqC0rlGfunMchYiaPHsmPBKT+T+YeyEYkEkkHm2Iv2
	VIwfD40JDHC64uaxyVBI1J7KEcrAH90kurHrfncrYhNIBvKwgz3tUinKXqEpdCF896qakr0dhC5
	ghR/YEuUcnVyODf8FtpsMPWclazSYOw38Rz0R4e2INJl+pTXM4sP8l1Ho24tfWb3Nw9az8FqMtg
	jeFspC/RwR7L9HuXTGZEkZul3DF26vKAfxX7KNYWO3Vp9luFOMi8pD8mO9iNHeQJJvCTWRzJazr
	drDD+kSStfdrEcV/m9HEn1jx1J+zKDunjPsoWZYwIP4cV/VzLFexJ6wBJhPfJULcLKF7Q3BTmBP
	RMgA1cgJTcLvP7mg8HxOI1cyWavMHYUdoM1zj8yC5qCgNs6iD/LA==
X-Google-Smtp-Source: AGHT+IENKeqT3xV0Dr92UiVFEo6YY/asCmkLWpGRIotCiN/0l5Xwo44cmM0iMQKi4Apmy5oDrEQ8iQ==
X-Received: by 2002:a05:7300:230b:b0:2a4:3593:4678 with SMTP id 5a478bee46e88-2a94175510cmr6116412eec.20.1764166745392;
        Wed, 26 Nov 2025 06:19:05 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm103679339eec.2.2025.11.26.06.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:19:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/5] lib: sbi: Implement hart protection for PMP and ePMP
Date: Wed, 26 Nov 2025 19:48:42 +0530
Message-ID: <20251126141845.248697-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126141845.248697-1-apatel@ventanamicro.com>
References: <20251126141845.248697-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_061906_905328_CCE295F1 
X-CRM114-Status: GOOD (  20.51  )
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

Implement PMP and ePMP based hart protection abstraction so
that usage of sbi_hart_pmp_xyz() functions can be replaced
with sbi_hart_protection_xyz() functions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 209 ++++++++++++++++++++++++++++-----------------
 1 file changed, 133 insertions(+), 76 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c5a8d248..8869839d 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_csr_detect.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
@@ -311,6 +312,30 @@ bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
 	return bitmap_test(fw_smepmp_ids, pmp_idx) ? true : false;
 }
 
+static void sbi_hart_pmp_fence(void)
+{
+	/*
+	 * As per section 3.7.2 of privileged specification v1.12,
+	 * virtual address translations can be speculatively performed
+	 * (even before actual access). These, along with PMP traslations,
+	 * can be cached. This can pose a problem with CPU hotplug
+	 * and non-retentive suspend scenario because PMP states are
+	 * not preserved.
+	 * It is advisable to flush the caching structures under such
+	 * conditions.
+	 */
+	if (misa_extension('S')) {
+		__asm__ __volatile__("sfence.vma");
+
+		/*
+		 * If hypervisor mode is supported, flush caching
+		 * structures in guest mode too.
+		 */
+		if (misa_extension('H'))
+			__sbi_hfence_gvma_all();
+	}
+}
+
 static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				struct sbi_domain *dom,
 				struct sbi_domain_memregion *reg,
@@ -343,14 +368,19 @@ static bool is_valid_pmp_idx(unsigned int pmp_count, unsigned int pmp_idx)
 	return false;
 }
 
-static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
-				     unsigned int pmp_count,
-				     unsigned int pmp_log2gran,
-				     unsigned long pmp_addr_max)
+static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch)
 {
 	struct sbi_domain_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned int pmp_idx, pmp_flags;
+	unsigned int pmp_log2gran, pmp_bits;
+	unsigned int pmp_idx, pmp_count;
+	unsigned long pmp_addr_max;
+	unsigned int pmp_flags;
+
+	pmp_count = sbi_hart_pmp_count(scratch);
+	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
+	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
+	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
 
 	/*
 	 * Set the RLB so that, we can write to PMP entries without
@@ -430,20 +460,64 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	 * Keep the RLB bit so that dynamic mappings can be done.
 	 */
 
+	sbi_hart_pmp_fence();
 	return 0;
 }
 
-static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
-				     unsigned int pmp_count,
-				     unsigned int pmp_log2gran,
-				     unsigned long pmp_addr_max)
+static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
+				     unsigned long addr, unsigned long size)
+{
+	/* shared R/W access for M and S/U mode */
+	unsigned int pmp_flags = (PMP_W | PMP_X);
+	unsigned long order, base = 0;
+
+	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
+		return SBI_ENOSPC;
+
+	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
+	     order <= __riscv_xlen; order++) {
+		if (order < __riscv_xlen) {
+			base = addr & ~((1UL << order) - 1UL);
+			if ((base <= addr) &&
+			    (addr < (base + (1UL << order))) &&
+			    (base <= (addr + size - 1UL)) &&
+			    ((addr + size - 1UL) < (base + (1UL << order))))
+				break;
+		} else {
+			return SBI_EFAIL;
+		}
+	}
+
+	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
+			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
+			     pmp_flags, base, order);
+	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
+
+	return SBI_OK;
+}
+
+static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
+				       unsigned long addr, unsigned long size)
+{
+	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
+	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+}
+
+static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
 {
 	struct sbi_domain_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned int pmp_idx = 0;
+	unsigned long pmp_addr, pmp_addr_max;
+	unsigned int pmp_log2gran, pmp_bits;
+	unsigned int pmp_idx, pmp_count;
 	unsigned int pmp_flags;
-	unsigned long pmp_addr;
 
+	pmp_count = sbi_hart_pmp_count(scratch);
+	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
+	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
+	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
+
+	pmp_idx = 0;
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (!is_valid_pmp_idx(pmp_count, pmp_idx))
 			return SBI_EFAIL;
@@ -478,43 +552,19 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 		}
 	}
 
+	sbi_hart_pmp_fence();
 	return 0;
 }
 
 int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 {
-	/* shared R/W access for M and S/U mode */
-	unsigned int pmp_flags = (PMP_W | PMP_X);
-	unsigned long order, base = 0;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	/* If Smepmp is not supported no special mapping is required */
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
-	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
-		return SBI_ENOSPC;
-
-	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
-	     order <= __riscv_xlen; order++) {
-		if (order < __riscv_xlen) {
-			base = addr & ~((1UL << order) - 1UL);
-			if ((base <= addr) &&
-			    (addr < (base + (1UL << order))) &&
-			    (base <= (addr + size - 1UL)) &&
-			    ((addr + size - 1UL) < (base + (1UL << order))))
-				break;
-		} else {
-			return SBI_EFAIL;
-		}
-	}
-
-	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
-			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
-			     pmp_flags, base, order);
-	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
-
-	return SBI_OK;
+	return sbi_hart_smepmp_map_range(scratch, addr, size);
 }
 
 int sbi_hart_unmap_saddr(void)
@@ -524,53 +574,18 @@ int sbi_hart_unmap_saddr(void)
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
 		return SBI_OK;
 
-	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
-	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	return sbi_hart_smepmp_unmap_range(scratch, 0, 0);
 }
 
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 {
-	int rc;
-	unsigned int pmp_bits, pmp_log2gran;
-	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
-	unsigned long pmp_addr_max;
-
-	if (!pmp_count)
+	if (!sbi_hart_pmp_count(scratch))
 		return 0;
 
-	pmp_log2gran = sbi_hart_pmp_log2gran(scratch);
-	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
-	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
-
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
-		rc = sbi_hart_smepmp_configure(scratch, pmp_count,
-						pmp_log2gran, pmp_addr_max);
+		return sbi_hart_smepmp_configure(scratch);
 	else
-		rc = sbi_hart_oldpmp_configure(scratch, pmp_count,
-						pmp_log2gran, pmp_addr_max);
-
-	/*
-	 * As per section 3.7.2 of privileged specification v1.12,
-	 * virtual address translations can be speculatively performed
-	 * (even before actual access). These, along with PMP traslations,
-	 * can be cached. This can pose a problem with CPU hotplug
-	 * and non-retentive suspend scenario because PMP states are
-	 * not preserved.
-	 * It is advisable to flush the caching structures under such
-	 * conditions.
-	 */
-	if (misa_extension('S')) {
-		__asm__ __volatile__("sfence.vma");
-
-		/*
-		 * If hypervisor mode is supported, flush caching
-		 * structures in guest mode too.
-		 */
-		if (misa_extension('H'))
-			__sbi_hfence_gvma_all();
-	}
-
-	return rc;
+		return sbi_hart_oldpmp_configure(scratch);
 }
 
 void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
@@ -587,6 +602,42 @@ void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
 	}
 }
 
+static struct sbi_hart_protection pmp_protection = {
+	.name = "pmp",
+	.rating = 100,
+	.configure = sbi_hart_oldpmp_configure,
+	.unconfigure = sbi_hart_pmp_unconfigure,
+};
+
+static struct sbi_hart_protection epmp_protection = {
+	.name = "epmp",
+	.rating = 200,
+	.configure = sbi_hart_smepmp_configure,
+	.unconfigure = sbi_hart_pmp_unconfigure,
+	.map_range = sbi_hart_smepmp_map_range,
+	.unmap_range = sbi_hart_smepmp_unmap_range,
+};
+
+static int sbi_hart_pmp_init(struct sbi_scratch *scratch)
+{
+	int rc;
+
+	if (!sbi_hart_pmp_count(scratch))
+		return 0;
+
+	rc = sbi_hart_protection_register(&pmp_protection);
+	if (rc)
+		return rc;
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
+		rc = sbi_hart_protection_register(&epmp_protection);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
 int sbi_hart_priv_version(struct sbi_scratch *scratch)
 {
 	struct sbi_hart_features *hfeatures =
@@ -1051,6 +1102,12 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 	if (rc)
 		return rc;
 
+	if (cold_boot) {
+		rc = sbi_hart_pmp_init(scratch);
+		if (rc)
+			return rc;
+	}
+
 	rc = delegate_traps(scratch);
 	if (rc)
 		return rc;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
