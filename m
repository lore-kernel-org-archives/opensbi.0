Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1C5CA0EDC
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Lvyy17nZfSx5GjZuJbdYyNAuf7uEe57kyCICjXRgPgY=; b=T7Lzig0Si+7P8TM+0uuJZXOWUk
	/jzNRpq/T+iNd78XZFV3S3AmVbEqDCCUkHWM43rg8J2B/RBYCc2glQc3M4I8UzIJlXoR7nuFMw54k
	37fS0MjLCiebx7gaHzx13r2WMr+X6eEIPpmZtQZmzFIO6LlSRBkGpMrc1XKjX0UIsby09hzPWsyhf
	hblNJLynj4igmjpBce1HwPwHmt4g2mkVVEn2csb4b7tDgGm4jj1Czs5B0oqkY4fekYXvdxc0ZaG+k
	b82/Uc5J3Kl1mX+D/oC5rHPH5/jLlYT50uL0sg0gkbFX2aprBxW9GydTXA9GFQmgXk3adVmC6y0Kp
	97642mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbJ-0000000CHPc-0Ksh;
	Wed, 20 Aug 2025 03:35:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZW-0000000CHCd-0l8t
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-324e3a0482dso99145a91.2
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660789; x=1756265589; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+LMtZtq/bDLvkrqCRbVpTs4E0PBzM0KMjASmhc9W3YI=;
        b=etZNZW/mP1soPZYe7Rj4mEW8v/RfV7ppqirI650uvnnD4njf/5vNG3ECYcaPDiI6hM
         WiUDE389fHhkXxKbhXvl2FzvRzgQwzdwsBNgrYa2pPz4XC6zyYJBUXdgoIxFgYaZMR5b
         955Dlw/MD30XZDth6qLp9Gs5NgMs+PduQcPN+u1HEGTy+yHlHj/Hwxmqh4wcFOMNQ2ig
         3P9wdSwOzw+fV63riGdqpiYvCO5TGOzuRPwzhXiR0axkjLUOMP2lgRWzW3sojhpm6yQA
         nardeCbuXT47WWTnsnBz8Bi6+v5evZSPVqW8fnnfTmxK4fUWsVvxJNpT0KjN5ZVmxKmT
         sTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660789; x=1756265589;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LMtZtq/bDLvkrqCRbVpTs4E0PBzM0KMjASmhc9W3YI=;
        b=Na/gCKBjNpLXmmC82pdjisUxtTCWZrvNhWIUvPR6+rN/maIr7Kk0UBPJCWjBngWVKT
         ynqWX5SbYyVFiQnQa/Rl57pfO2ynn+CtSRJBYw01hc3wwJEFXG/q0f4fwfzLEXJSTVf+
         U5ed4dFfhI9sxc6nvV7Pz+MF3iTRMTf9sPOhVBl2m5fIziJ/aguk2NuiBXdVE9LsvU+g
         9x3xpk+VoLL06TjtbmeMOntV0+mp7HvCHFnHWpTszaF08tANZPdBLHLGyEkGWUK9+B+4
         OBr6lXBp5yhTox1bu7iktpZXeoO6spCIc1QdUm9lEIp0AClDdNZ7FgLyvt0nCkCBNspE
         mI7A==
X-Gm-Message-State: AOJu0Yx8Jqg0B727lrRe10Y7hTyaPXEThKf0VV7uLv4MMe+f6yDJi0Pg
	V+cj91coGM3JdfB0SfZon3CMTa3mxYTD2WespRJc5JaFulmQyuj+SPArN3eHXfgQjc1YUL7QA/n
	obLnnouHBvD/4DfubJyimq4NGWDGAMTCieH1gSnlL5DwvehPrEtWeH0Y3nDCqRdVxiG8OivZkla
	HhSo0uAAopsORzDhCcrMgqq/FVOUmsZhoy6kZ2CL8IJmRpdw==
X-Gm-Gg: ASbGncvMYDsSxAJu4bpYez/RBqFgOKGhiOhZ48Kchm2VV7rszCjpckugfAuPFKUdJDO
	zcQqaIzZvHZyPEg4Sgvl0ZYqnuCkUsPWs1jS5iN3/cJuTXZpBKeHd04cDXd7sZ+zV2FKhMeDXuy
	aDcCKp0duVO3nnxgalhQKvE8XbGx/LwHjNfl8VIhHPSuIL9xklLxF976TXUBrn1n7QHmtN5+j5u
	SWsRXX+K4tT8d5M5tV4170mnH9CPuy1NnCy62rNbKnN84E4s6iJ5yWPSxzu+FBFJPzNWWacspmR
	+wP5NVA9t1GbD07MmSIaeugU9ZpRjofEUZJwItDGIvO8I/iI8RcDZD+njgfej5ILORIDvku6GEX
	ZesBUhw2AIrnhPpcCV2uBCn/FUe0N6tr0BfuZhGYZvKVT
X-Google-Smtp-Source: AGHT+IElsPie2w1vWKAVrcvNy+6KZgeiqZJVkWb403316EU0E/xCdtr+npZUbTJilPvfmsH+kWtj3Q==
X-Received: by 2002:a17:90b:4986:b0:323:265e:d9d6 with SMTP id 98e67ed59e1d1-324e12e76acmr2004625a91.6.1755660788970;
        Tue, 19 Aug 2025 20:33:08 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:08 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 04/11] lib: utils/cache: Add fdt cmo helpers
Date: Wed, 20 Aug 2025 11:32:43 +0800
Message-Id: <20250820033250.544-5-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203310_222705_76A15DD5 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
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
 include/sbi_utils/cache/fdt_cmo_helper.h |  34 +++++++
 lib/utils/cache/fdt_cmo_helper.c         | 112 +++++++++++++++++++++++
 lib/utils/cache/objects.mk               |   1 +
 platform/generic/platform.c              |   3 +-
 4 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/cache/fdt_cmo_helper.h
 create mode 100644 lib/utils/cache/fdt_cmo_helper.c

diff --git a/include/sbi_utils/cache/fdt_cmo_helper.h b/include/sbi_utils/cache/fdt_cmo_helper.h
new file mode 100644
index 00000000..4275725e
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
index 00000000..6d2e853d
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
index a343eb8c..6829a966 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -6,6 +6,7 @@
 
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache.o
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache_drivers.carray.o
+libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cmo_helper.o
 
 carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += fdt_sifive_ccache
 libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += cache/fdt_sifive_ccache.o
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 47e771ad..de40791b 100644
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
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
