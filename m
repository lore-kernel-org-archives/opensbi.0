Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031C5C369D7
	for <opensbi@archiver.kernel.org>; Thu, 24 Apr 2025 03:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NYZeAQPa9TeaqaEh3/PWg57gihXm+DUbBvF1edm+BJ0=; b=4brCy2KD74nbuQnR7cOQOHoe/c
	D6ZKxoNrekY+D26JxGf5e8jzRfFksI4VK3YikBaLU6dQzI0qxx0ZPjxJrxiuQfWZuhpl4tA2PbcR1
	39avQvQ69xj7WqiHRA1EVUUbtm1WYeEt/KwJlIP0+af6ysURKq+aV4C/85fVlORofk3P7EZqga874
	KhTQ9TptD1GXRH2ry+j1MslXJ6VOo07IyiY/Ojg0HL7VCXBgyNCD+oqKAqnLA07yQlIodKjrOCgze
	Q4J5SbVQFtabWwr2aan/aLxLvsw4ZGTSv0dLLBnWwyEJ37JkHc6Krqi0d6Is9dn9Ol5PL3PKFl+vW
	A01wOxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRp-0000000CkeD-0yEy;
	Thu, 24 Apr 2025 03:40:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRl-0000000CkcV-2fR4
	for opensbi@lists.infradead.org;
	Thu, 24 Apr 2025 03:40:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22c33e5013aso6603555ad.0
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 20:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745466020; x=1746070820; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTTH1LlaFiGTALTGFAGbFFAN0/VXiIxAPP4sR++d0tw=;
        b=ReSaS/wquwBD6aEZErUm3ZTnQq4alDCL1EqaN+sW4HOqtn/EuCEPW+vQhavYi53IbA
         YmgSkGYHsiU+8Kl/MTqllzaGBE9S0+ILJmHaeXCLTGgT2szUkYjohOQqKCr5N1thq5zb
         uPYz9bTCtM6yEWgzjZDSAjx2wE/K3m7Kd5aMLVtrdFs84Ufj/PvAIdVa8zqw6X6tgt71
         zAQkv/VNea1+MPO4wHX27+W2N2BulA0EK16znPchRUc6NZxNT7oit+GxCnuNbKTAmquA
         RC5EI7lwctIo8XEw6V1+/iBgiyBiPLzvX88o7rna3ntWO45657jhvOJ5CNGqWytZjCXe
         QnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745466020; x=1746070820;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTTH1LlaFiGTALTGFAGbFFAN0/VXiIxAPP4sR++d0tw=;
        b=dpXk1ej0S3/bQMsdiltL4eSwhhmWWOhNhlG4RrLtFYqiFBV512QdOAujU22YS0Qxu7
         9j1f+xr/ogX7cIjde8H5wA2QP1nttMduEsZj8N09Z2IFbKF71ll/Er3oIhJxPG7Bf9m9
         /C1XfJeKVvY+0nXJYywXCluNw6+gUykHQ8psCAaNAk/rQF45VpqTU46+9+OThe3h6+X1
         CYNXJ62cK1K9RWULiuRw2q7oiSj+nHVEK0H3U5EHxst1X7olr7pJGGksY8bQRGqSQ5I+
         u4J46RsjwKEULYsofvN+1yxP8mnRELQOD8793WEsg+uKitwWguvZCyjVKFU2Q/EsnUUK
         MeXw==
X-Gm-Message-State: AOJu0YysjnIpTIOtNzeGOcUrWavOFpyxEpdJSn1JGQy5e4tUjRyeNWbN
	heb7TVygT5M/sNhEyFYbTbsE7hp4ijmEl+TEbJgoY6qp0oA3lrc8CLGCOHZoSDHlaGUzWvxVGny
	jzjSHPj6/cU2vZGYQn+d2eVyTCe4BhCvjSmzid/JwAtadZemh2J2tRk8vWZVKu/2irGrRUzp4Vb
	DanRiJyW4anrcUkeQiuDhE42+V8TVg33XpbhLXHbpxTA==
X-Gm-Gg: ASbGncuE4vE4e3Lx16+xhXbsOzI5FVaboeRbfl3r+uQXP2XkQ39k2xqGSE26mOrfm7K
	XRq7wC7dFf79qL4QMgD2JPz1vKJBFrKEqOZ/UPvipXfZ6QaY47mGDPkQt0z8+6kt1frtJbkIUlv
	OJ+xElbKxx7c0CgAT4ArzytH4fDgrJTMLXqWCDTnSIgZ072WaZwTUNN647R/E71ztdZ378VGyq+
	WWFdtCwjhSPkC68Rg4BaGCN0Vz3yAANLyxDN4+K6UdQkXhRyA+2YWaP9XRTnexyedSvj/cF4F+U
	ktqI9TRkkRmDqgDYvBOmw08qgoPKlwHeboa5cFUIX5p9MFs7Duj1wcg5h9P1WJ0=
X-Google-Smtp-Source: AGHT+IFgzH2aUQ43B5AJVRQgjoIZWhv0JAEwxQJjNb8Fz2hhtnsAC9m2kSix1KxF5mOkcnaHf7Zx9Q==
X-Received: by 2002:a17:903:90e:b0:22d:b305:e076 with SMTP id d9443c01a7336-22db3bb6b08mr12931565ad.3.1745466020379;
        Wed, 23 Apr 2025 20:40:20 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd5f2sm2632025ad.66.2025.04.23.20.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 20:40:20 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v2 2/5] lib: utils: Add FDT cache library
Date: Thu, 24 Apr 2025 11:40:00 +0800
Message-Id: <20250424034003.28522-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250424034003.28522-1-nick.hu@sifive.com>
References: <20250424034003.28522-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_204022_376825_D6CB43A9 
X-CRM114-Status: GOOD (  18.68  )
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
index bb260626..7b62faff 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -6,6 +6,7 @@ CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
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
