Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CF9CA0FFE
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 03:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YoYRh0shcpRZVvnGLSHymNWBYD3cYAG9jTCo0h9SvQ=; b=N7ELkSV83b/4pA
	Txggv5aeVkrywBDluszMxomK06HKLRg+g8r2cDkV0/oWJXWJenCoh42Z654afFlswgh3VLOch1/YP
	7kEdwynZ0NNgqy8adqz1eBYSR0vnoegtybEauwDy7ofOXKMY9Z2tLWjXz/x7vgY/R/wDqZUZVCz0N
	dF+baVJQfLFdK7dbvs1AB7koGGKMB/XGZC5YLOo/HcphBLeo/5/M+XD1WQwbwxIT7EP6Mro+T5PEB
	ltWWZSuXgldc9y665JK0DZjGHsHR6AYVUvZlfz21yYB5RRTDiUOSXlZ13yV7bW4u4urASucynVOBK
	UihugFWdEd5IOiSTF5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utHeK-0000000F1QQ-2Uj7;
	Tue, 02 Sep 2025 03:25:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbm-0000000EpXY-1ZMG
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:18:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-24a9ccbf10dso19674275ad.3
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779534; x=1757384334; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT0qq69AHct33vFJO/qXqfBLOovB8QGFAriGJZGy2po=;
        b=faniWHWW8y/YJFJ3bDyaGWTf/1yA/4gt9ihcTn9PYOOlS6GBexyFltKuI/IKNK5sCT
         i7/0T4E+vg4BQOrT69tXuHeRhNHYLYkZk4EuVOjtsGnlucRumFwkd3ix9L3qo6axiuCV
         JM/TUEUtU42hEl83VHV22bwsiQjkYUDRl+kBeBncgHLNK/l4cEDyGfDyJmFZoVJVOEHe
         0ivGQ5B636WFs7366rgNTjduff8Oe9GcADMUaaggXAjn5cJfYOmkUrtnPAWMjmyuFSkZ
         NDIti8lzqW0yd3b90iarS9ExrXtQiuJwZXYnar6Nsi1HsCvT3JqERoocSqIllqdc99C1
         12+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779534; x=1757384334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT0qq69AHct33vFJO/qXqfBLOovB8QGFAriGJZGy2po=;
        b=YvYUdHN4CKXcJKcekZzJH3c8dU2HSvauye9f/wgXG1TeB6zZzqWaGJGoUF7D6nuuvj
         rIQA/Z6+DuGrsS7zUadiVKCj8J3/G7BsxK/cR3wdK8PWRAQOet8fXcKS5l70L8QS4a4h
         D5KEf4RuawAmDgQKbkMPHNTrc9jFv3MBRLSQ83lRTVOnGyt4nJ0Q4hRu0wG76dOxGKHt
         U50LDCfn15fPK4pkDO4ucsegdrbuRJZbqmjqzRixmRSKjOZf5Km1wZhySMy6O5oGOqte
         Yu/E48sUxnquoFLKjJOK3kfolWJLNl2rwjjNndB8Q99jpgFVaa2uFfYJcWyx3kEYjYlE
         qH1Q==
X-Gm-Message-State: AOJu0Ywj75tFSyuUqlqH3wkjDGxB6PikB3BwDrK9LWHYs5g5VHmDjSX0
	02XuuyQFReFawk+CxFlg+neNawVHDqZaJyhY69LLsGL7yVxuh7GRJnYtDNc+c8rAQj0=
X-Gm-Gg: ASbGncvjV7fbiGB54TBpQALGhrTcuFQfz7i0daMahy+IBsN85Jly5GDvEqSsobB/NJ9
	oNsbtbVfIJlQLByTVM+R4iBB0+jeGa/hARmWebnFWMC9uF53CMN9OQktLNsrG/Xrp1DuIbKhcEJ
	uXdl7R/Y1S75ztn232J1ZxOKdf6HX1MqAWZFzPwuW5p48maOvFn5iqB3xPwbEK6OO/e72POFSeA
	L5ucIjGX6vkfnIkF2gshejQzeXdpF8k3YYZUVfzgklMTC8ESamvFyp73hFb7aRSOLUwU3u6C4Dq
	091lozxoqPUlgWEfNbKbAoU0RtamNpYqspxFXTfODHGu1opZ8zbnCLFxIQ56vEpGUxEMU5T/J/W
	9s5O0gt7jLHptuSVuL2K9
X-Google-Smtp-Source: AGHT+IGpyKJGTcxhmUaSRHvfgvHjcGgwuTOnpz3bIHvfAZ9rz8DpenxIbtHqkXqJ4y33MCaA2x5r1w==
X-Received: by 2002:a17:903:8c8:b0:24b:25f:5f7f with SMTP id d9443c01a7336-24b025f66f6mr28674155ad.60.1756779533572;
        Mon, 01 Sep 2025 19:18:53 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:18:53 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:41 +0800
Subject: [PATCH v5 02/11] lib: utils: Add FDT cache library
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-2-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191854_422851_A29FAF82 
X-CRM114-Status: GOOD (  17.92  )
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
Cc: Vincent Chen <vincent.chen@sifive.com>, Anup Patel <anup@brainfault.org>, Andy Chiu <andy.chiu@sifive.com>, Nick Hu <nick.hu@sifive.com>
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
index 4b93d0bc55233f83a907ff81234c78540e33d828..6470a511fe216b8bba1feb467738eb871f5738d4 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -8,6 +8,7 @@ CONFIG_PLATFORM_STARFIVE_JH7110=y
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
