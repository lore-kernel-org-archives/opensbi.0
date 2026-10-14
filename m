Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87924CC6B2F
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BepQJHVIqkpAPTi7Ctb7A0mugEP5XK8JCGdXkeCMQpA=; b=MIbb6bt6oGF5Or
	PjElFeJNbkRMcjXt0YEi42EVBvdXnCZ5bK42wZ1R/hU6KK+kugr0O4X7REd6vv6VUmET3qS1w6LXy
	kR+vN9Lr3wH0zvOJABlrKAzSK7BMaSTrOG1HbGwSJXt09CgxUIqWvK8WXzKTCYhmObW8noHIJGBuK
	2pYNozap0MKezvtlcHReXXoxXbJOot9VCs1Yln3mi8tnrKlEGl5Z4RPOf0rianMeSnz2AT5Va3Fad
	Lvbvx8odufEoc/z6NdOj12KH0rz13nGDRqTqyMohnjlbm0twP3wK90L3P+vZDjaWDLOj4qSYERIvE
	fLDsmV2QDBbVqdKn0sjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCS-0000000FLRJ-2vLL;
	Wed, 14 Oct 2026 11:31:12 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCP-0000000FLNq-0MU8
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:31:11 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-15168a20b47so2581010c88.1
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977468; x=1792582268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVQ0BkK3fcFQV74wwDYOeqOCD/+nS6uu9j3yyNL/QFM=;
        b=m8W9Ke2bd89mpwqe37w8NrzuPu4dP5vY65S9Ayu40sfeDhwmcxGcQGyZ0p4GrJI0+j
         XYKAt42mv5UQ7/FW/xfo8y0yfe3Wp/1ONPYhPmyJM98tXGUVb18qNewjgzzSOim3GSat
         AzDzQcf7xhYYUd9zJhV74x1EvBDHAxg/JqupqaOuKNeIsupppU0naQpzLcJsyVsPz5ue
         JVJNfXFFPlaXVA4rIDXyHCHFMGNYDUYSxpnDgfHYqcC9VeNnjEADztRHMcYF64zjvpaq
         tZ607FP70MmfJFRmzyEsmuLAke65IKBa07hGrUzmWvuOVDLCWY33soKN86di686rP4gd
         Lgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977468; x=1792582268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVQ0BkK3fcFQV74wwDYOeqOCD/+nS6uu9j3yyNL/QFM=;
        b=D9ZuDZh5jYony8o2dRkFxUiYgYwYQOOzgG/PyyI0I2TYovYzxjlqxT9x+vrqWwPiLC
         hYqxuvNSJEXxRvY02vVEYAqdYdhPZFhxd77ukGjO+W41YxlxGNPhiBE38yfEqZ9iVcBC
         vtFvNelR29NJAfQOypXjzvv/V+EwtVB/PmTd2HaVLAJLlbZGMRnjIZJZR+9pV6q2IjgK
         D2nRhqexEefUeZClmEXIEAn2lna8lCCH4dGVBUtwVVmYN0ybRDdOcAr497kG32LNui4k
         CCHk6OrczQheKNJrRpCVZSFKt2Ul4HBsLVABTgC//SUcOD8R9nC/7jbWScJFf17E6VBW
         lZOw==
X-Gm-Message-State: AFq9FYKVEN2l6dCBiz44b4Aoz/GGihAcXhK7zFA33pvrOAzG0cZ5JlP7
	MWQNuBO5GBqW4/R/ULsTUf/eH7S4bWm+tWCziIZk8O0iSatffQ0qyXLkDsy/APmv/xT9hZrz8me
	llAW53cRjErE5BXNuTUsNWhroqsosZs22DDYDuuoZJUw13VQEit4W7p1VglQJhizej8XpZ8JnI6
	PgfjcVHnxtyZykmw4i5eiEhC5vlKjojfoSuWS5ds53Oe5+YqcstIjzRY0=
X-Gm-Gg: AYBFou3BXNVE+JfF4oV/bz183i/rXgpaYWmFZvJMD3p067InmYJyzXjE+OWZ/c5dtgW
	N7RMEN9id3J+sWcbGxaw/HJVwxrGW+qky1VdOXIcwirC6q8kOOsEHEztofLMVL3V6/D1uh8uEuX
	9ucW3O+Agd0ZVfSmneqp2Y70cMFr7TR68h44WjbDnVbi/sXnpe3q84KECt3At3RLNm5ENJsHLIA
	ErxJrDG8ops/TTojb8dTSOkiRvp3nuJOzvnHcl0Txgw4p/K04CZOdavTYG3tmm+O1JDEtUqCclE
	yrCBdTjBUEiOiT94R6ENOCHBDGto9Cdwzosl+WBd2zXF6Wdki95Fmwk5xZF3H2OGOLR5KvvmL2g
	JbjNNvwGA0qiVzPw6I6TKVlElJk/WaBTZAIZiX5NLBzxrFgYSH1uPTKtCYmV+3+ui992LPM55xO
	kZtkM5fD2wbXExyZN2pkaSmiKUPrdD8dPhCOjBanIX5A0THlID/dbUG5eOc1ipEV3KRfnyTRj9H
	gvTTnoxF+Q2r7lW5QJz
X-Received: by 2002:a05:701b:2803:b0:16a:b995:dc7c with SMTP id a92af1059eb24-16ab995dd20mr21484880c88.21.1791977467821;
        Wed, 14 Oct 2026 04:31:07 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm71207996c88.18.2026.10.14.04.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:31:07 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 5/7] lib: utils/fdt: Used cached CPU DT information
Date: Wed, 14 Oct 2026 04:30:22 -0700
Message-ID: <20261014113100.2192229-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014113100.2192229-1-samuel.holland@sifive.com>
References: <20261014113100.2192229-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043109_156639_3C2A4DA5 
X-CRM114-Status: GOOD (  19.80  )
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

Use the cached information to look up the DT node offset of a hart, or
the hart index from a DT phandle, instead of parsing the DT each time.

The logic should otherwise be equivalent.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Do not use cached offsets in fdt_domain_fixup()
 - Also use the cache in CMO library and TMC0 driver

Changes in v2:
 - Add missing include of fdt_cpu.h in fdt_helper.c

 lib/utils/cache/fdt_cmo_helper.c    | 21 +++++----------
 lib/utils/fdt/fdt_domain.c          | 41 +++++++++--------------------
 lib/utils/fdt/fdt_helper.c          | 24 +++++------------
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c | 23 +++++-----------
 4 files changed, 32 insertions(+), 77 deletions(-)

diff --git a/lib/utils/cache/fdt_cmo_helper.c b/lib/utils/cache/fdt_cmo_helper.c
index bdc5fe19..28034d51 100644
--- a/lib/utils/cache/fdt_cmo_helper.c
+++ b/lib/utils/cache/fdt_cmo_helper.c
@@ -10,6 +10,7 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/cache/fdt_cache.h>
 #include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
 static unsigned long flc_offset;
@@ -67,22 +68,12 @@ int fdt_cmo_llc_enable(bool enable)
 
 static int fdt_cmo_cold_init(const void *fdt)
 {
-	struct sbi_scratch *scratch;
 	struct cache_device *dev;
-	int cpu_offset, cpus_offset, rc;
-	u32 hartid;
+	int cpu_offset, rc;
 
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return SBI_EINVAL;
-
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (rc)
-			continue;
-
-		scratch = sbi_hartid_to_scratch(hartid);
-		if (!scratch)
+	sbi_for_each_hartindex(i) {
+		cpu_offset = fdt_cpu_hartindex_to_offset(i);
+		if (cpu_offset < 0)
 			continue;
 
 		rc = fdt_next_cache_get(fdt, cpu_offset, &dev);
@@ -91,7 +82,7 @@ static int fdt_cmo_cold_init(const void *fdt)
 		if (rc == SBI_ENOENT)
 			dev = NULL;
 
-		set_hart_flc(scratch, dev);
+		set_hart_flc(sbi_hartindex_to_scratch(i), dev);
 	}
 
 	return SBI_OK;
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 575fbdf0..f143d514 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
@@ -296,6 +297,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 {
 	u32 val32;
 	u64 val64;
+	u32 hartindex;
 	const u32 *val;
 	const char *inherit;
 	struct sbi_domain *dom;
@@ -303,7 +305,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	struct parse_region_data preg;
 	struct sbi_domain_memregion *reg;
 	int inheritance_mode = FDT_ROOT_REGION_INHERIT_M_ONLY;
-	int i, err = 0, len, cpu_offset;
+	int err = 0, len;
 
 	dom = sbi_zalloc(sizeof(*dom));
 	if (!dom)
@@ -342,25 +344,11 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	SBI_HARTMASK_INIT(mask);
 	dom->possible_harts = mask;
 	val = fdt_getprop(fdt, domain_offset, "possible-harts", &len);
-	len = len / sizeof(u32);
-	if (val && len) {
-		for (i = 0; i < len; i++) {
-			cpu_offset = fdt_node_offset_by_phandle(fdt,
-							fdt32_to_cpu(val[i]));
-			if (cpu_offset < 0) {
-				err = cpu_offset;
-				goto fail_free_all;
-			}
-
-			err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
-			if (err)
-				goto fail_free_all;
-
-			if (!fdt_node_is_enabled(fdt, cpu_offset))
-				continue;
-
-			sbi_hartmask_set_hartid(val32, mask);
-		}
+	len = val ? len / sizeof(u32) : 0;
+	for (int i = 0; i < len; i++) {
+		hartindex = fdt_cpu_phandle_to_hartindex(fdt32_to_cpu(val[i]));
+		if (sbi_hartindex_valid(hartindex))
+			sbi_hartmask_set_hartindex(hartindex, mask);
 	}
 
 	/* Setup memregions from DT */
@@ -414,15 +402,12 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	dom->fw_region_inited = root.fw_region_inited;
 
 	/* Read "boot-hart" DT property */
-	val32 = current_hartid();
 	val = fdt_getprop(fdt, domain_offset, "boot-hart", &len);
-	if (val && len >= 4) {
-		cpu_offset = fdt_node_offset_by_phandle(fdt,
-							 fdt32_to_cpu(*val));
-		if (cpu_offset >= 0 && fdt_node_is_enabled(fdt, cpu_offset))
-			fdt_parse_hart_id(fdt, cpu_offset, &val32);
-	}
-	dom->boot_hartid = val32;
+	if (val && len >= 4)
+		hartindex = fdt_cpu_phandle_to_hartindex(fdt32_to_cpu(*val));
+	else
+		hartindex = current_hartindex();
+	dom->boot_hartid = sbi_hartindex_to_hartid(hartindex);
 
 	/* Read "next-arg1" DT property */
 	val64 = 0;
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index c5d76707..34369a62 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_hart.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/aplic.h>
 #include <sbi_utils/irqchip/imsic.h>
@@ -397,32 +398,19 @@ static void fdt_parse_isa_extensions_one_hart(const char *isa,
 
 int fdt_parse_isa_extensions_all_harts(const void *fdt)
 {
-	u32 hartid;
 	const fdt32_t *val;
-	struct sbi_scratch *scratch;
 	struct sbi_hart_features *hfeatures;
-	int err, cpu_offset, cpus_offset, len;
+	int err, cpu_offset, len;
 
 	if (!fdt)
 		return SBI_EINVAL;
 
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
-
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
+	sbi_for_each_hartindex(i) {
+		cpu_offset = fdt_cpu_hartindex_to_offset(i);
+		if (cpu_offset < 0)
 			continue;
 
-		scratch = sbi_hartid_to_scratch(hartid);
-		if (!scratch)
-			return SBI_ENOENT;
-
-		hfeatures = sbi_hart_features_ptr(scratch);
+		hfeatures = sbi_hart_features_ptr(sbi_hartindex_to_scratch(i));
 		if (!hfeatures)
 			return SBI_ENOENT;
 
diff --git a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
index 911f55b1..79c50a7b 100644
--- a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_list.h>
 #include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
@@ -290,30 +291,20 @@ static struct sbi_hsm_device tmc0_hsm_dev = {
 static int sifive_tmc0_bind_cpu(struct sifive_tmc0 *tmc0)
 {
 	const void *fdt = fdt_get_address();
-	struct sbi_scratch *scratch;
-	int cpus_off, cpu_off, rc;
 	const fdt32_t *val;
-	u32 hartid;
+	int cpu_offset;
 
-	cpus_off = fdt_path_offset(fdt, "/cpus");
-	if (cpus_off < 0)
-		return SBI_ENOENT;
-
-	fdt_for_each_subnode(cpu_off, fdt, cpus_off) {
-		rc = fdt_parse_hart_id(fdt, cpu_off, &hartid);
-		if (rc)
-			continue;
-
-		scratch = sbi_hartid_to_scratch(hartid);
-		if (!scratch)
+	sbi_for_each_hartindex(i) {
+		cpu_offset = fdt_cpu_hartindex_to_offset(i);
+		if (cpu_offset < 0)
 			continue;
 
-		val = fdt_getprop(fdt, cpu_off, "power-domains", NULL);
+		val = fdt_getprop(fdt, cpu_offset, "power-domains", NULL);
 		if (!val)
 			return SBI_ENOENT;
 
 		if (tmc0->id == fdt32_to_cpu(val[0])) {
-			tmc0_ptr_set(scratch, tmc0);
+			tmc0_ptr_set(sbi_hartindex_to_scratch(i), tmc0);
 			return SBI_OK;
 		}
 	}
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
