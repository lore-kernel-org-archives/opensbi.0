Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FD8CD4F21
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 07:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BcFBUUqgJkSMHqHXHuUolUClrb9FXI0SbEyNLTpVpO0=; b=v5au8NNAcBfvB8
	BaOFvmfubcxPCAOpyLFXFkL2Hc/U0q6kNK69GdBpCDj6gBC9pWBkfBJIUptCjhZkMxkfEunDW3KEo
	5ts5KLLzmHtxOadhp+4Vm82JCkFLcXbC2KuzSauEjuinNbhlimbPzWL94aJ3pKYYkRTZhcRaN2XZr
	shovT4gcobYoC24/MsGloxboxF5CTYWfoeizF1qai81k2c1PuwgiHFeLQGAYK1FXMOa+c47x0+6XB
	gaQ42BwdXbiqDI/o9d4EjGiU6xwJVdHOOl4zIfYuINPxBrN1c7lvwoxGqx6QpHMuoQQ4ExeibgnRN
	Fs4Cxwt7sGN4JE+LO53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO9SZ-0000000AM48-0gks;
	Sat, 16 May 2026 07:29:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO9SW-0000000AM3V-3sU0
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 07:29:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48d146705b4so5584335e9.3
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778916555; x=1779521355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZWkHGCEQuk9D44V4e85xP/So+1MK2DiIQtJSxE5MMc=;
        b=kVIuAY8DPpCFrgsF8pWQEoKA7lEIxGM79Yu4w1iS5zWlm06nPVFqds3JodY25fJMNM
         ELMPHoBEJ9mHFmonYNaoqrac8AjQY5k0cdeeDFEyfFivToyjD6hIwRBXhtKQOKDlNgOJ
         vZLvKI2/YAMmNA4tjaRJI3rc2nZV4gVEIkHMWELNtwSVI9fC5OjINQ9iLNdZb396GH4/
         jX5tdRjgVKUbBfaGXyf0m7K8GiF22xzxqh656Ny72RS8dKm19pvHA6s9yl8kPUwyMjmo
         2FzyHq1uLHwP4eF8WFk72/rWkIs74v/ofoFBFCbjYabNbIU7wMTeh/YcvLjJm3tcI80r
         Tu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778916555; x=1779521355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZWkHGCEQuk9D44V4e85xP/So+1MK2DiIQtJSxE5MMc=;
        b=tKjsK0cttEifAqBf0dKH8lPFGtF+NWiHZtexFF0Jaa52/Agb3auttVstO3nJfLau6/
         FBRcf8hICdefGriigUYy3jHpL1jRAKrY68e1RiLE/nBN0NlN+eTmQF93zcdzXasz9AV3
         j8JqRiM9lS+jF3arrPf1iJOJspFGLZV3R72YbgA5ikhd1lIkcG8PQtNzn7WN0vW4D40D
         NhMFKG9cm90WIytg9q+3UeiejWcl1HzKyXRWCfIRVuRPlgUvMT8dDlCBGrh/t0B1srcr
         tn9Est6DuJmyu/QdtFVO3bbZy3sPJHBz5wb2Apo+Y7nM2CVovB7Ypg2d4NLutc6cifo0
         TsQw==
X-Gm-Message-State: AOJu0YxRbc83TOyNW6TOCcbieuXEa3wvxfh+kAUcKTtOPHa1nmcMjplU
	GUnqkQ8Tq4igSXxY/h6ggxSljszjIXpX5+kAJGwbMC3O1m0xz5nJ46EU+jJkf2kJNJtvWzxt0OG
	eMR4jD4DiKOyHmLmF6gxzujhk1mgpgIWGpQCCCqOJrf0jcWO1dFQL1iT98FQn+OpOg+LqNWMlu6
	Rk7Ahima6Webyn8SaoGp5RjpQRKY8S4+aBekP0+chRvwfpZZuvUfo=
X-Gm-Gg: Acq92OFAC0HcFbAeOf8k8e/wnpKn9xVWYOGVTmYCjsbQq0MfYiK15iqF/jNXQBhG/Wk
	VqFhen2ZjY/bLwO7kPHRxwkRN+zrAE9j2jt00bmhY9zCHTnQn6WJ2pd1drh6M2dd5lKJopL/NWR
	Pw9i0xoU+NX4yoJasuSJyaiwqcSR1lq+uu3jK16BMW7fLBPluedNZT9/G9Ed3aLPldeX6PL5QB3
	bQOxKsFXZWNoxd0LHrrZoLUohTD+ab5QyDkCi5Q9z+3TWtGFIKJEFL2aczIk42nnKJHluk6Pha5
	kNDeFN3Myo4YSQroAbkxmFQ/OCf+TBAw75d9rcqbRQ7Gctm2oMGiV+rTpoJVbXbZGDhBIwf/P3D
	qfFpGd5fLThkcfVzXw+JUHoiFO15cPJAkt2nHNEUKZNxXOhbcJK0xF6qnhJJwF/UY7yvFvtWNCZ
	4WsAp92uBKQGhakfXeIAZ9lSyBAWZGcu/fZpB6nV4nP6seP1o=
X-Received: by 2002:a05:600c:34c4:b0:48a:89d9:a419 with SMTP id 5b1f17b1804b1-48fe60ecdafmr101466775e9.11.1778916554537;
        Sat, 16 May 2026 00:29:14 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm178752225e9.1.2026.05.16.00.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 00:29:13 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v3] lib: utils: fdt_domain: add root-regions-inheritance policy
Date: Sat, 16 May 2026 15:29:06 +0800
Message-ID: <20260516072906.1427203-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_002916_997742_898D335D 
X-CRM114-Status: GOOD (  16.47  )
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

Introduce root-regions-inheritance DT property to control
copying of root domain memregions. Support 'all' and 'm-only'
modes, always inheriting firmware and M-only regions; behavior
matches m-only policy when property is absent.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v1->v2:
- Addressed feedback from Anup: https://lists.infradead.org/pipermail/opensbi/2026-May/009850.html
Changes v2->v3:
- Fail early when unsupported value is found
---
 docs/domain_support.md     |  7 +++++
 lib/utils/fdt/fdt_domain.c | 53 ++++++++++++++++++++++++++++----------
 2 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 93186c4a..77122330 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -159,6 +159,13 @@ The DT properties of a domain instance DT node are as follows:
 * **possible-harts** (Optional) - The list of CPU DT node phandles for the
   the domain instance. This list represents the possible HARTs of the
   domain instance.
+* **root-regions-inheritance** (Optional) - A string property controlling
+  how memory regions are inherited from **the ROOT domain**, which are then
+  overlaid with regions specified in the **regions** property for additional
+  restrictions. The allowed values are:
+  * "all" - inherit all memory regions from **the ROOT domain**
+  * "m-only" - inherit M-mode only memory regions from **the ROOT domain**
+  If this DT property is absent, behavior is the same as "m-only".
 * **regions** (Optional) - The list of domain memory region DT node phandle
   and access permissions for the domain instance. Each list entry is a pair
   of DT node phandle and access permissions. The access permissions are
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index b2fa8633..b31254af 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -10,6 +10,7 @@
 
 #include <libfdt.h>
 #include <libfdt_env.h>
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
@@ -237,7 +238,9 @@ skip_device_disable:
 	fdt_nop_node(fdt, poffset);
 }
 
-#define FDT_DOMAIN_REGION_MAX_COUNT	16
+#define FDT_DOMAIN_REGION_MAX_COUNT		16
+#define FDT_ROOT_REGION_INHERIT_M_ONLY		0
+#define FDT_ROOT_REGION_INHERIT_ALL		1
 
 struct parse_region_data {
 	struct sbi_domain *dom;
@@ -309,12 +312,14 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	u32 val32;
 	u64 val64;
 	const u32 *val;
+	const char *inherit;
 	struct sbi_domain *dom;
 	struct sbi_hartmask *mask;
 	struct sbi_hartmask assign_mask;
 	struct parse_region_data preg;
 	int *cold_domain_offset = opaque;
 	struct sbi_domain_memregion *reg;
+	int inheritance_mode = FDT_ROOT_REGION_INHERIT_M_ONLY;
 	int i, err = 0, len, cpus_offset, cpu_offset, doffset;
 
 	dom = sbi_zalloc(sizeof(*dom));
@@ -373,20 +378,42 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	if (err)
 		goto fail_free_all;
 
-	/*
-	 * Copy over root domain memregions which don't allow
-	 * read, write and execute from lower privilege modes.
-	 *
-	 * These root domain memregions without read, write,
-	 * and execute permissions include:
-	 * 1) firmware region protecting the firmware memory
-	 * 2) mmio regions protecting M-mode only mmio devices
-	 */
+	/* Determine root domain regions inheritance behavior. */
+	inherit = fdt_getprop(fdt, domain_offset,
+			       "root-regions-inheritance", &len);
+	if (inherit && len > 0) {
+		if (!strcmp(inherit, "all"))
+			inheritance_mode = FDT_ROOT_REGION_INHERIT_ALL;
+		else if (!strcmp(inherit, "m-only"))
+			inheritance_mode = FDT_ROOT_REGION_INHERIT_M_ONLY;
+		else {
+			sbi_printf("%s: domain \"%s\" has unsupported "
+				   "root-regions-inheritance=\"%s\"\n",
+				   __func__, dom->name, inherit);
+			err = SBI_EINVAL;
+			goto fail_free_all;
+		}
+	}
+
+	/* Copy over root domain memregions according to inheritance_mode. */
 	sbi_domain_for_each_memregion(&root, reg) {
-		if ((reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE) ||
-		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE) ||
-		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
+		bool copy = false;
+
+		switch (inheritance_mode) {
+		case FDT_ROOT_REGION_INHERIT_ALL:
+			copy = true;
+			break;
+		case FDT_ROOT_REGION_INHERIT_M_ONLY:
+			if (SBI_DOMAIN_MEMREGION_IS_FIRMWARE(reg->flags) ||
+			    SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+				copy = true;
+			}
+			break;
+		}
+
+		if (!copy)
 			continue;
+
 		if (preg.max_regions <= preg.region_count) {
 			err = SBI_EINVAL;
 			goto fail_free_all;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
