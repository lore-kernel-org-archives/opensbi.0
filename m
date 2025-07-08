Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6429BC83F12
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MnxW6UTbLvPP58nxX7Yn0aO0qGKOdRoaBL8KFrlGzLA=; b=1WkiXSmn7PbcuHuoIbMGkaHAzr
	sOwMfzjDDvZ5F7Q4BbiXJ2o3p5xBem0iH0HoHoypN1NI5Dhl6j0o1mOZSZxZr8Vw/RWWMlUxl68E8
	6d3PHCxDMvJGH65i3/rY1gvwICw8eJfjv7OjL/S7+HVvDcfyhctDCXkUj/5Zzo7Hcy05V8eQjSKl9
	9sDjuKEleDBGwOuk7teaeNLeOPGqpdBLEOCz0sIOXz8+gHWiTyjl2l/oRDFrht5p6GSlxqyvW4jVP
	KaBMUVu/WCWgMV0aPWcGAT4ZCShIQ0owm3/FurnjbMr8iHUuHV2qrLx8rQ4AqI9KCOS8udeFUvKYF
	E5Xeig/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3CG-00000004epL-0NDm;
	Tue, 08 Jul 2025 07:57:00 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35T-00000004dIr-333Y
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:00 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so33773946d6.0
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751960998; x=1752565798; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3CS2UR0sUNExsezC6V5hj7SvCw11q9Ru7HWOVrVb2o=;
        b=mgBqr9h9ToWjp8xlrKzwu8MoEoP0UNrlUF8Xty6hmYc5Ap+iWT/Y3PnP4vN10SAAgZ
         /0DkKkWRZddYXnneuCnPdh8tq9clmAgrEJz2QEAtupPCpsSjqN/rWT4ruwdRElhpDlhJ
         TUnHGvqL7Mvx9sM8n4vwnan5QAJdVErvfemchTv1M6X02bde/+hq5rdddwKO/u1EsH5T
         iGVxgaADFEZ3OHY14uoRJDQwhul7l7z4eo7aAKQmLQ9iymT69QRM9GMoKihsLizx/QYv
         K3RXdnI+/DAkv07q+3y/j+fYSXYtEFMlzeQ1UTFCGUe//Jy3+CWnsf7FHpLR4Vptx2an
         K2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960998; x=1752565798;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3CS2UR0sUNExsezC6V5hj7SvCw11q9Ru7HWOVrVb2o=;
        b=fs+22fPae9VFjCuGNGbE5+jlnTenIodft7pXlQ9Hogs1ged7vHLsJPc1ockoKmCgbx
         5CB/bMVnwfQQALqzGbC02gVqqzlu4XRDbNONVLAYIxWhIWAHKnAANwK2qYzm7b+mkeMZ
         1YQiyhM4FCgCbNAmL+Lk82iCYvXcJ189wxaLyYTl9hIVLwkUwYSTbECxO66z0hehnk/i
         Q3GGaf3c0yl2yY91HT8KpSVGXRbQg2kG6QLJXIdf80JH02hDg3Bqb+whBeKF9uCjGuLq
         sqN10q13DWi5AmIb/WE4IbPy9T+H62W58eAiIvnBXpuOc3nr2CXXAkA/gdzzWkv4H5Hy
         ymNg==
X-Gm-Message-State: AOJu0Yxq9B78lFzk8ydvBdc+9H5BNfhToWJ2/U0xwHtRdcLsHACk5Lwg
	SxhzWodixDNadZcn+JRsnJaRwl6olkn2mk4fKRdOK/sYZoSFc/gVMaPgbDlYe4BEa5DLc1nmibh
	aXCL6oqRxG2Pp7cdDSueCK5/PmjuYxwzU5G/CcwxZnDEg1V4f2WyfA/xx3Oy6vDMnCFBWAX/r8k
	OXZ75I0izJKuVO1F3CumZYl7o9JTDLg06/muJPuYlpn4Ij6g==
X-Gm-Gg: ASbGncsped5xq7QMnQcp8D+Ml2BhJM20ZV8OIBAazzz4cXXC7xGwmxKapwrYoubQGDL
	n5V3GwfyYhDWWqM3YGOJDrXNONQ7xSkUt/Ubsh8ATjNESe1uOFvj0x9zOot9p0tOrEtEEe47qSt
	UCTBBjo2Iq6sZWbRoaItXLFR0HRokhWs0f3GgfO0nlnS/tTqUnbBLtxbcg+fUrrwI/346lAE+tU
	xsT5R2t9ukqagRrKEpy5sFYjE9tLLAi+ZRtkElUcKqmTpOegnzdTEJlrE+rQ1hC/+3aw/3opH6+
	0U23pa34R/J7LqlkYchWY7FarqbGhbEIyYGMvUZ4rRwnBd7UCMcyYs7MMeb0I6ppBLs2FRnzb6q
	1nfQTlin1
X-Google-Smtp-Source: AGHT+IEbEIQg08O+Aq1dmWonrYkaCZu6JwD+FGi6XnmGuUPPVa7fOc8kf9BCLUWfFM0ab7ITmevIrQ==
X-Received: by 2002:a05:6214:5348:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-7047dae8f99mr31155286d6.31.1751960998412;
        Tue, 08 Jul 2025 00:49:58 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:49:58 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 02/12] lib: utils: Add FDT cache library
Date: Tue,  8 Jul 2025 15:49:30 +0800
Message-Id: <20250708074940.10904-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_004959_769834_B0D25D0F 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>, Andy Chiu <andy.chiu@sifive.com>
MIME-Version: 1.0
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
---
 include/sbi_utils/cache/fdt_cache.h      | 34 +++++++++
 lib/utils/cache/Kconfig                  |  6 ++
 lib/utils/cache/fdt_cache.c              | 87 ++++++++++++++++++++++++
 lib/utils/cache/fdt_cache_drivers.carray |  3 +
 lib/utils/cache/objects.mk               |  3 +
 platform/generic/configs/defconfig       |  1 +
 6 files changed, 134 insertions(+)
 create mode 100644 include/sbi_utils/cache/fdt_cache.h
 create mode 100644 lib/utils/cache/fdt_cache.c
 create mode 100644 lib/utils/cache/fdt_cache_drivers.carray

diff --git a/include/sbi_utils/cache/fdt_cache.h b/include/sbi_utils/cache/fdt_cache.h
new file mode 100644
index 00000000..b377d6f5
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
index 24aa41bc..10602176 100644
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
index 00000000..e1c6f67c
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
index 00000000..c1b1791c
--- /dev/null
+++ b/lib/utils/cache/fdt_cache_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/cache/fdt_cache.h
+TYPE: const struct fdt_driver
+NAME: fdt_cache_drivers
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
index 21d30ce8..2fcf9666 100644
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
index c7a6531e..b5a7993d 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -7,6 +7,7 @@ CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
+CONFIG_FDT_CACHE=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
