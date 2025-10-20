Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A5ECCD1A7
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shIms5ffRbEn7/J+Uku4F5uHIMjc/x7FRsJbW7sqyPw=; b=C+RnQbBvtGLf8E
	LgFE4m38UOSoLX7nT287+Os4IX8+8BCbu86+MsXKTHsOc/khnnvkGBOZ7+0Zt0YJC1/jqgtSTKVBW
	KBtoBEKDZJOChLf1uKTZrZiz1uCAD0KhPfq+UCl+20ekavdrXupAX6TTwwRPP6HzQ94SaHd2XagaD
	+KvtlpMBZfsoO1sm+M02HUsCnyKdr4ODIH8nDvA3G3OSbVYFMiUVb340XbWy8evkaVtP7k6qf1pTu
	nagZvF9Q0NC8eKPzci9P+XmXnWLx0YxujoGSDFn4rOC+5vAd4BpO3lu08QorGBF2Jbz8F08TtKS/7
	diIe8F6o6dB0TDC40piQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM6-0000000C1tL-2ZES;
	Mon, 20 Oct 2025 06:26:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM5-0000000C1sF-0675
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:26:54 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-796f9a8a088so3697871b3a.1
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941612; x=1761546412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6n1lAP/8BRgGNDYFckCw4Gzzxh41YDZba6lsp1ymF0=;
        b=HGn+qWIvhtS+G+rKP1TlAS+ZUnYlEVnTmrWQWzhDgn2UbOpZAzzmSd/v1Q1pAVssu/
         59I0gQr+b2q/Xs/fhFuKAWVe9EYiLpk3EVjIOid/nw5jIMlX3hSVZw6sRWLKEewCdj6b
         LKDsqkA5fkpLcvqI+CtFQC8FE1KPwmmN6Q/KCUYYHaU1p6tHgPukBtASxcHgau8/9bUI
         vYUKsxAdTjq8JPWgh6GeH6wfcgc2b7hnZ5hOLfuTcltO60rt8p492RumB/KZ21k83eaT
         Y0t4ZfPpYW2gpIH9yke28asQgf2YvGQu7EFaKCp1hgFGoEvhwpy8UjN83McagyLWStdn
         ZdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941612; x=1761546412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6n1lAP/8BRgGNDYFckCw4Gzzxh41YDZba6lsp1ymF0=;
        b=Z1gpHI6utUzHfugOaxgnN9Rh3vHX50J3ka8UwXTKDuNINj6FRIrShaNELPH0IfCdqZ
         FfgNiO/vGtJ7kbl6/vdJm1LIPiu8FQla0LLdsl2o5rZ890DSaMDjQdwfD7xtTmpGcdV7
         +bWKwI4gXr74v+LK58MXgvxMy1hUUE2PJTtlC0AeffoCvgAJhxV/j5RtWusZSSbg3zsl
         2HfnUz+CslARkzKLYQAY7umnh4xlieIpqNpn/bJArzYNcx68CoUOenLiCDiSNTta2RwJ
         CMVNQDYE8tY+8dpABIHy95ht/ow1dkSKPAGzfjEjh8RvdsdYZl5RHXiXb2bjb7ns85Oh
         tnJg==
X-Gm-Message-State: AOJu0Yz0xP+H8n77Q5v9YK+qDk/BMG1Ao7WuiGG6KaGVcJ/5yE3NYVdl
	4VVT+pprjKrI0/P1jpCDebr2F1k2dex6A13u3jLT9Yhnb006xAmvFCg7wdmrnX9BBahn0hfA+sZ
	9gat5fSdzH+Ymqg1qyMXkxmCTRflll6euDVYHPAgdP6bJfN0DqZtzERGBIdhJpqNmGgmVMp7tbY
	PnhxkT+zA3hQ91csEAAE/PYoFbgfUewFfzEhIxzbHkUR3KGw==
X-Gm-Gg: ASbGncskeY/BiXsUMbS4sGQIocrLiYfyjeH0RuXeT1IydcPyjE9nRDKsVGT68lorcrN
	rq4nlq1EM4HoUtN8QkWJw+XaqRXVY4tB03X1jPPiSjJqO9/Wf7p6ZeTcgCU1oqILM25gUg5QMm8
	xzOLnVX8lHGY0wSr3g4HKSx3iwRhyOC1I3X8G8yKBesY0cMmTS9lny0cqr7jPHgA6uqRLGfO4bg
	7Movw8B+VFXqLRcoJWGvJec9Q4Mwx4Oy3pHqSQvYcADY6MK5a8jkmXUGHUvbuGThBvx7l84lm2d
	eq6TQmbBc9keoPet6CBTVEd3NZ3sTN0BCCSlugI1taKJwhzAKn7QJ0cYzENFcou86EdxjP27LAy
	TFNjwr5v0hZBmhxDwS6Zvs+NDqml6rm6R0SzQ/r4gGEusrR/nN2l7WOE9Wkz4CLYKQBJMp9HI2w
	==
X-Google-Smtp-Source: AGHT+IFsEAnFTx5kevJjr+IH/trm2QBW4XF543hSt5fxQJIRXaAQdeamrDlljqyJ8QZik48acZYXLw==
X-Received: by 2002:aa7:8043:0:b0:782:7052:5167 with SMTP id d2e1a72fcca58-7a220a574f9mr10001531b3a.6.1760941611755;
        Sun, 19 Oct 2025 23:26:51 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:26:51 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:04 +0800
Subject: [PATCH v7 02/12] lib: utils: Add FDT cache library
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-2-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Vincent Chen <vincent.chen@sifive.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232653_072980_BE486496 
X-CRM114-Status: GOOD (  17.41  )
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

Add the FDT cache library so we can build up the cache topology via the
'next-level-cache' DT property.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi_utils/cache/fdt_cache.h      | 34 +++++++++++++
 lib/utils/cache/Kconfig                  |  6 +++
 lib/utils/cache/fdt_cache.c              | 87 ++++++++++++++++++++++++++++++++
 lib/utils/cache/fdt_cache_drivers.carray |  3 ++
 lib/utils/cache/objects.mk               |  3 ++
 platform/generic/configs/defconfig       |  1 +
 6 files changed, 134 insertions(+)

diff --git a/include/sbi_utils/cache/fdt_cache.h b/include/sbi_utils/cache/fdt_cache.h
new file mode 100644
index 0000000000000000000000000000000000000000..b377d6f502ff1496497172a7e09f3cca239003a9
--- /dev/null
+++ b/include/sbi_utils/cache/fdt_cache.h
@@ -0,0 +1,34 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_CACHE_H__
+#define __FDT_CACHE_H__
+
+#include <sbi_utils/cache/cache.h>
+
+/**
+ * Register a cache device using information from the DT
+ *
+ * @param fdt devicetree blob
+ * @param noff offset of a node in the devicetree blob
+ * @param dev cache device to register for this devicetree node
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cache_add(const void *fdt, int noff, struct cache_device *dev);
+
+/**
+ * Get the cache device referencd by the "next-level-cache" property of a DT node
+ *
+ * @param fdt devicetree blob
+ * @param noff offset of a node in the devicetree blob
+ * @param out_dev location to return the cache device
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_next_cache_get(const void *fdt, int noff, struct cache_device **out_dev);
+
+#endif
diff --git a/lib/utils/cache/Kconfig b/lib/utils/cache/Kconfig
index 24aa41bcf966cd42c719d995fa2f9f6ab62ad904..106021762f33229e66bf91c648c3c9febc4d325c 100644
--- a/lib/utils/cache/Kconfig
+++ b/lib/utils/cache/Kconfig
@@ -2,6 +2,12 @@
 
 menu "Cache Support"
 
+config FDT_CACHE
+	bool "FDT based cache drivers"
+	depends on FDT
+	select CACHE
+	default n
+
 config CACHE
 	bool "Cache support"
 	default n
diff --git a/lib/utils/cache/fdt_cache.c b/lib/utils/cache/fdt_cache.c
new file mode 100644
index 0000000000000000000000000000000000000000..e1c6f67cf6fab5232982a9479931f70b8b0d595c
--- /dev/null
+++ b/lib/utils/cache/fdt_cache.c
@@ -0,0 +1,87 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/cache/fdt_cache.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+
+/* List of FDT cache drivers generated at compile time */
+extern const struct fdt_driver *const fdt_cache_drivers[];
+
+int fdt_cache_add(const void *fdt, int noff, struct cache_device *dev)
+{
+	int rc;
+
+	dev->id = noff;
+	sbi_strncpy(dev->name, fdt_get_name(fdt, noff, NULL), sizeof(dev->name) - 1);
+	sbi_dprintf("%s: %s\n", __func__, dev->name);
+
+	rc = fdt_next_cache_get(fdt, noff, &dev->next);
+	if (rc)
+		return rc;
+
+	return cache_add(dev);
+}
+
+static int fdt_cache_add_generic(const void *fdt, int noff)
+{
+	struct cache_device *dev;
+	int rc;
+
+	dev = sbi_zalloc(sizeof(*dev));
+	if (!dev)
+		return SBI_ENOMEM;
+
+	rc = fdt_cache_add(fdt, noff, dev);
+	if (rc) {
+		sbi_free(dev);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int fdt_cache_find(const void *fdt, int noff, struct cache_device **out_dev)
+{
+	struct cache_device *dev = cache_find(noff);
+	int rc;
+
+	if (!dev) {
+		rc = fdt_driver_init_by_offset(fdt, noff, fdt_cache_drivers);
+		if (rc == SBI_ENODEV)
+			rc = fdt_cache_add_generic(fdt, noff);
+		if (rc)
+			return rc;
+
+		dev = cache_find(noff);
+		if (!dev)
+			return SBI_EFAIL;
+	}
+
+	if (out_dev)
+		*out_dev = dev;
+
+	return SBI_OK;
+}
+
+int fdt_next_cache_get(const void *fdt, int noff, struct cache_device **out_dev)
+{
+	const fdt32_t *val;
+	int len;
+
+	val = fdt_getprop(fdt, noff, "next-level-cache", &len);
+	if (!val || len < sizeof(*val))
+		return SBI_OK;
+
+	noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(val[0]));
+	if (noff < 0)
+		return noff;
+
+	return fdt_cache_find(fdt, noff, out_dev);
+}
diff --git a/lib/utils/cache/fdt_cache_drivers.carray b/lib/utils/cache/fdt_cache_drivers.carray
new file mode 100644
index 0000000000000000000000000000000000000000..c1b1791c553a69a809a0930081fbff8952d30c74
--- /dev/null
+++ b/lib/utils/cache/fdt_cache_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/cache/fdt_cache.h
+TYPE: const struct fdt_driver
+NAME: fdt_cache_drivers
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
index 21d30ce8e18236eb90d666b884e10918a9a8fa0b..2fcf9666592700ff7c1fb924c5b9ea2de722fc2a 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -4,4 +4,7 @@
 # Copyright (c) 2025 SiFive
 #
 
+libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache.o
+libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache_drivers.carray.o
+
 libsbiutils-objs-$(CONFIG_CACHE) += cache/cache.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index fb90bb3e3c561fa169d8aeb6aed80f5146f0254f..7107e225cdd78287a296ca898c33659ecc89c969 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -9,6 +9,7 @@ CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
 CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
+CONFIG_FDT_CACHE=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
