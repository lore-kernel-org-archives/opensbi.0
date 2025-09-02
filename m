Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A0CA1002
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 02:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZnDOFbvz3IpaQgIVtSJVpUMPrGXxhYFnug17Nx+oSQ=; b=sypEyL2o8acQ6O
	iN3JdDo3tsRR6FAQmFR5ikRsu74DJfmg9H+9dVtulXcS5CipFiFrWLApLKP4Qx6gcszskpxSRQNuP
	VRXeUqN1SvFH82IAaAlxeZUmN2W2VKcg/ZIj4QCwpG09FNcRzaceIRSNmO6shtoK/BYjLXsFks2TU
	oV2QwF280LdaMfEU0oJ/eTv5NclceL73ntW0pvSnTvJmA76pnmdtZDJThOvpdj+w5e700Op1+4ojo
	A2lVIOrZ13hFjPEfjfEwDdHPMGnOvS8lx3gtIPUIa3RPVqjUMHw0kMeTEYOaYdCToGYc67f0jND9e
	6JljDZ3IRLlh2DRG7m4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbr-0000000Epaj-22FC;
	Tue, 02 Sep 2025 02:18:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbp-0000000EpZC-2v5W
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:18:58 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24af8cd99ddso9211385ad.0
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779537; x=1757384337; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7dGe1xmT31UDeOVYx/kmO90Th1H20E2QBOhGZWa2MA=;
        b=V1dgx/oHgK6GYpOibyijvNxwhUccb8+bA4hDyQCRgqhzfMFua2RSACHCM2Vxu/iLWE
         zlmf1TOktc7YCAp1aXllpY/7orTG3pHV842Y9rTvuVOH6LOSNEGXwj2BL8sgo5b8fu63
         EwI1CwZKF8lv56RG/nj8A727AZPlyZSq1yJ6r9dgJSLxnJc4XvLD8eDe1lgMftfntMoW
         fM2Soo8yKJPaDW9b/CMy8OibvRBc6NOgRKy9uMgmP81RSTOGnTnLMfffx0grx7iRk8hq
         6L+VtbIzLTEz3ICx4Fv4PPANoHIKS0Ai+jJVcNGajWzHw0EKFF5wkFDe/ToWtgXhqjVF
         9imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779537; x=1757384337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7dGe1xmT31UDeOVYx/kmO90Th1H20E2QBOhGZWa2MA=;
        b=REscjSX4J10GYWeLezuFLaLafU2/b1uCQku33wyXiICPA/Y3GU2xVFpc+Zap2+JfbD
         ukL6oHIBb+hxLlRPvERo8N4V2RCyZ9W4Jg1wYEivADCHkwQJrBRiNfCx1tSi4WsPHwFk
         LEM+CrPzG1l/+y2vRnM1lU+s/Vhc1gCEIS+/mGV8nujXtlSBy+NDU0qIJravxZZJI03n
         uzZxgMEcAxJ3UfL+HFMalAsW6cN+vm289wezqQA3nStBLFF/9P8wbv+zH6FlQOsihCuA
         OlTReJi7N1L250IDUAwi2QEYutpXn9OxwRvDw28jcB9kqr20M4gVvknwYpLSI3qA7206
         pxiA==
X-Gm-Message-State: AOJu0YycozE2NOPtkeTEhZlAT8N32X4yISUslA0miwM+IiSq2SI3woYe
	cmYnHsjefeM5nf0OnJPzJEj59n8L0ZHCkGUHsAqH01nYsWlV0LYYOCN4swr69eEQ4BJBL4/JbZW
	RfupBt9l2LVjQVmZxNclU3zD+sMjYqv6QODJWWpvsfz+A77s+aiONcoAN/5WNIZv86O+gHM+5/A
	OMfYD60oyg95nzoL2synVN1yozxZTtFQewKJhe9AeQHRXYDQ==
X-Gm-Gg: ASbGncvwMfG9Dnq7PP7XsIX30hQipkhUJMcVuMyMXgRgiVdidNsmPjNU7BGa2Dtu+Y9
	+5wC1AKDWY4vI+fTYLTa1dpUT6QNuQFGhaWeJf63WTQvlcs3mHeLZ0YDCy58syvh7NhCnV0x/j/
	izjrZY5GzTSfh1uRbQlsyjIzOc/zoCoj/PJVp83CHJrZpm3WOoSFLvTcw07neIQIR+X4CjHsnGm
	rLBY6gL2vzgih4wzhXFFWCqftSqrq6tOs9772i+PUcqheEejrxfr4zUZF1xOMxUVh8VDkndJ0lN
	bYzd6AG/59M22Ea3FeqGW8IYQ6JnObANjH9iS0MOblTh1GKf7a5UzpTQycTz0m3L0EMzv/LAiAW
	MGQaLRJ3ZFq0cXukeRuL4
X-Google-Smtp-Source: AGHT+IGjXSJiY4ABEewS6i8CsOFpsieZiX/VJLLdm/MA8BnBiCgSjJpKVRtjuDi3PSoQ5s6Dm81nTQ==
X-Received: by 2002:a17:903:1252:b0:23f:f96f:9de7 with SMTP id d9443c01a7336-24944b62e7amr108735415ad.51.1756779536529;
        Mon, 01 Sep 2025 19:18:56 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:18:56 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:43 +0800
Subject: [PATCH v5 04/11] lib: utils/cache: Add fdt cmo helpers
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-4-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191857_743880_AE35C997 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add the helpers to build up the cache hierarchy via FDT and provide some
cmo functions for the user who want to flush the entire cache.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi_utils/cache/fdt_cmo_helper.h |  34 ++++++++++
 lib/utils/cache/fdt_cmo_helper.c         | 112 +++++++++++++++++++++++++++++++
 lib/utils/cache/objects.mk               |   1 +
 platform/generic/platform.c              |   3 +-
 4 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/cache/fdt_cmo_helper.h b/include/sbi_utils/cache/fdt_cmo_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..4275725e1e299625306198beb2a268af9c56703c
--- /dev/null
+++ b/include/sbi_utils/cache/fdt_cmo_helper.h
@@ -0,0 +1,34 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_CMO_HELPER_H__
+#define __FDT_CMO_HELPER_H__
+
+/**
+ * Flush the private first level cache of the current hart
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_private_flc_flush_all(void);
+
+/**
+ * Flush the last level cache of the current hart
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_llc_flush_all(void);
+
+/**
+ * Initialize the cache devices for each hart
+ *
+ * @param fdt devicetree blob
+ * @param cold_boot cold init or warm init
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_init(bool cold_boot);
+
+#endif
diff --git a/lib/utils/cache/fdt_cmo_helper.c b/lib/utils/cache/fdt_cmo_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..6d2e853dd735735092c57db2398f97a64de3ab5e
--- /dev/null
+++ b/lib/utils/cache/fdt_cmo_helper.c
@@ -0,0 +1,112 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi_utils/cache/fdt_cache.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+static unsigned long flc_offset;
+
+#define get_hart_flc(_s) \
+	sbi_scratch_read_type(_s, struct cache_device *, flc_offset)
+#define set_hart_flc(_s, _p) \
+	sbi_scratch_write_type(_s, struct cache_device *, flc_offset, _p)
+
+int fdt_cmo_private_flc_flush_all(void)
+{
+	struct cache_device *flc = get_hart_flc(sbi_scratch_thishart_ptr());
+
+	if (!flc || !flc->cpu_private)
+		return SBI_ENODEV;
+
+	return cache_flush_all(flc);
+}
+
+int fdt_cmo_llc_flush_all(void)
+{
+	struct cache_device *llc = get_hart_flc(sbi_scratch_thishart_ptr());
+
+	if (!llc)
+		return SBI_ENODEV;
+
+	while (llc->next)
+		llc = llc->next;
+
+	return cache_flush_all(llc);
+}
+
+static int fdt_cmo_cold_init(const void *fdt)
+{
+	struct sbi_scratch *scratch;
+	struct cache_device *dev;
+	int cpu_offset, cpus_offset, rc;
+	u32 hartid;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return SBI_EINVAL;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (rc)
+			continue;
+
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			continue;
+
+		rc = fdt_next_cache_get(fdt, cpu_offset, &dev);
+		if (rc)
+			return rc;
+
+		set_hart_flc(scratch, dev);
+	}
+
+	return SBI_OK;
+}
+
+static int fdt_cmo_warm_init(void)
+{
+	struct cache_device *cur = get_hart_flc(sbi_scratch_thishart_ptr());
+	int rc;
+
+	while (cur) {
+		if (cur->ops && cur->ops->warm_init) {
+			rc = cur->ops->warm_init(cur);
+			if (rc)
+				return rc;
+		}
+
+		cur = cur->next;
+	}
+
+	return SBI_OK;
+}
+
+int fdt_cmo_init(bool cold_boot)
+{
+	const void *fdt = fdt_get_address();
+	int rc;
+
+	if (cold_boot) {
+		flc_offset = sbi_scratch_alloc_type_offset(struct cache_device *);
+		if (!flc_offset)
+			return SBI_ENOMEM;
+
+		rc = fdt_cmo_cold_init(fdt);
+		if (rc)
+			return rc;
+	}
+
+	rc = fdt_cmo_warm_init();
+	if (rc)
+		return rc;
+
+	return SBI_OK;
+}
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
index a343eb8c4bd495a1596845c1fd02420277023430..6829a966784732127d93180b3eb46ed24de5bc7d 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -6,6 +6,7 @@
 
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache.o
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache_drivers.carray.o
+libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cmo_helper.o
 
 carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += fdt_sifive_ccache
 libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += cache/fdt_sifive_ccache.o
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 889d69052108ba5d45625180a55594ccaf6ba466..15d2e8c04eef67f0b37bec913447d3d5c34cda4b 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_tlb.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -231,7 +232,7 @@ int generic_early_init(bool cold_boot)
 		fdt_driver_init_all(fdt, fdt_early_drivers);
 	}
 
-	return 0;
+	return fdt_cmo_init(cold_boot);
 }
 
 int generic_final_init(bool cold_boot)

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
