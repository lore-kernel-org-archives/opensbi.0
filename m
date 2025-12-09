Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCDDD3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQ6Y0NyWJbw7p1m3CVmUuO2eqwJiGXOnxMSOiFudGTA=; b=qBnppUFbtuD9V1
	7KrE5Ef5makcb6SBY0F4vgSWSpipelZJhwKnDlz8ZqOPY33LaAVBi5nQE0cI995w8e3BBSOL5RqIV
	/hOOf2JL7R7r7sc24YWWlfqIQN77mO1FZ9ezjCdYJCezr5XhqFOd/HrFix0Asl8Hou040Xl6s1K9y
	zMkJYVbJ85QFsEadIk+/ssRS8JR+1RI0nI5Db982zHBmgrYxu+gPf0Jhzq5hgX9nefCfphmOUgWzI
	iLBmVKvWM2a3pnDySmFBSkn7GY8UY1DH/H+jlzWUWAbR6tW1qZNOhRgc8fg2HvOxLb4TKNrMfUtRG
	ZlfDUWSVn6Fb3KrN3Xnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9M-0000000ELcB-36kN;
	Tue, 09 Dec 2025 13:53:08 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9K-0000000ELb8-1XJD
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 13:53:07 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so6047270b3a.1
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 05:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765288385; x=1765893185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/uWLSfLpLTYmPXd2g339d4RP2K2Yy3HVsnKB1mx9hI=;
        b=DezUGYou+NcIHQBOLbli2u9MZeKM/IqCzBCDaY+lVXn/UIqjFsVF/6ayO2zqjz3JG0
         o2Iuejej1gyadJ+PJg4yMIzVeCT+Vhld+5OZ+nr8Jqn8TxiDjMO4k+DDGsfhI73VY97s
         u6JQTHv4QvKmP57Bf/cTkkVOkdfgMG25XpxCQMxFWB+bn2BF4xFihAOwX+ViooZrAFiU
         IpekzqGjrgRPgpN67bFxxUYVz+GwbbwLav7rqgnSOaCcI4he46xsGUawXLshXWe/62sQ
         N7G5ahgPWxtnUyCNRf5p2Lv4YKgzhqUJbjhjvbhug/soWQeNOMkdksWCx8F+Sr3yKepv
         w+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288385; x=1765893185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c/uWLSfLpLTYmPXd2g339d4RP2K2Yy3HVsnKB1mx9hI=;
        b=iw452A3IhfQa4U7MSjqFeyV+tBlfoAIpPbAjIubrSNehKGNGmhhLwFtuRa+yrOSKRZ
         FvPyOZ8LHJRG3RwvFIYpcIIKQ3RQEZRprEFTdbTEeTGY8f/c8jJYF5kEx/o+sJUQDVk9
         TxwxtO+SotXxLEUQeKvI+9TfCpH5eIFxUfQnlPd00FML3AZMoaqbOEgJpV/V/f1yfQwj
         uV7EvXnCwazJcZ9Q/kaVFJHVghOzcErIAUi0TkO+ReX0JxSuLjg0lldBSIMPhtUnIRLe
         my9nMihbwH7OI1FQX4wh7+vLUfiL4+vhAQn4SMNd2H0C+ejzxNNp/txBz8gSsMPfN9zK
         22Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVkMx5j1+URR0Ys/Wy+lXAbLUJ/kgv0gQ6Zxr/IkiykDK263FpM/qKvbSMzk32SJ7mE+ItsB4JD@lists.infradead.org
X-Gm-Message-State: AOJu0YzpIW/3YarG8+gzD56Wo7DGnmHQVB/vWBvDl+m81WdglnFEt+Dc
	kq3wSK0yBwe6wF7kan6geSSO6cL7P8q9449xFY6krVHn4J9sznRKwgo+d4aTNtVf/zM=
X-Gm-Gg: ASbGncvCem64f6x3dOhOtidtm0xAx/HxqaNcmZtUd3TmF7eIjdaHdirVC1wZnFRhRn+
	+eUX+wod8yo7DpC/pxfBQ9rxP7BkYA3QiHNZrs9V0SHygO4vr7N4L9+Xxrr7oy97e6Mu7xtq/WS
	8IEbclz2GESgkJr9yjOwYXMfIF3aExkzcDCv/gUrwzrSUvn5map63ayjm+eWCqRlmwJzY8M2stw
	0quKBn87Bg8Y3Rt2SjEs5oPwG/7TU9ZRhv4m4dzzImbSAe+ytApjCSGCb+Z19k5gpRnxhU1plaO
	vTPtu8NjxQMQN6CnQANC37JXIXP40dL+db9+hkFmjIe3meNfdJskk+QlUDyjLiSmjAPMfgMsSoL
	Wo0k9pywZPmH/WtTljByux0MMX1savVQijio44PsmClIeAdKQspj2fl5rkLTyxtwuczKJLPx+BX
	IjoMYeztehIkPAfSlMKglvFpe7T8maGtekHROuY0D4T8ULFsI0
X-Google-Smtp-Source: AGHT+IHi9RiCrp3FT2S6gz5vXA/Cdxns8BaFqT5D7XgfejHyfbgBuAi0RNxanE7qVu+08rvpM7mY+g==
X-Received: by 2002:a05:6a21:33a1:b0:35d:8881:e6c6 with SMTP id adf61e73a8af0-36617e6c205mr11024842637.19.1765288385442;
        Tue, 09 Dec 2025 05:53:05 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf681738a34sm15023827a12.4.2025.12.09.05.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:53:02 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 3/5] lib: sbi: Implement hart protection for PMP and ePMP
Date: Tue,  9 Dec 2025 19:22:33 +0530
Message-ID: <20251209135235.423391-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209135235.423391-1-apatel@ventanamicro.com>
References: <20251209135235.423391-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_055306_513685_FEACC9AB 
X-CRM114-Status: GOOD (  20.93  )
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
 lib/sbi/sbi_hart.c | 208 ++++++++++++++++++++++++++++-----------------
 1 file changed, 132 insertions(+), 76 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4ec7a611..20ad3c6a 100644
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
@@ -316,6 +317,30 @@ bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
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
@@ -348,14 +373,19 @@ static bool is_valid_pmp_idx(unsigned int pmp_count, unsigned int pmp_idx)
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
@@ -435,20 +465,64 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
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
@@ -483,43 +557,19 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
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
@@ -529,53 +579,18 @@ int sbi_hart_unmap_saddr(void)
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
@@ -592,6 +607,41 @@ void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
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
+	if (sbi_hart_pmp_count(scratch)) {
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
+			rc = sbi_hart_protection_register(&epmp_protection);
+			if (rc)
+				return rc;
+		} else {
+			rc = sbi_hart_protection_register(&pmp_protection);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return 0;
+}
+
 int sbi_hart_priv_version(struct sbi_scratch *scratch)
 {
 	struct sbi_hart_features *hfeatures =
@@ -1057,6 +1107,12 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
