Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897D6CA0EFC
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WfRbAIFPA8353fJTwMMZ/A1axqkxpfpwlywHN9GBhMc=; b=cWdviIm6Q2YsD5vXaUfczj3pd8
	sStMJ5+pGuMhB49zfJek4fybGqZMuNl8Lx56TNEUbUyFqcwZcSTiY0zN1yx1BMsEXx36prnqOU1iQ
	gMx/ljBZ3x2sItHK2bXTG87sE4fkN9w+pBoB+74OtyQLs27NVQLah0IggiX5pmHmz2IMqCv/Vi43q
	RBkEAjEoEUM8CNFqzreuK4ZUh/jfvHVuP+7/PdG8M+rYs8LrfJkqqTmWOvp11jF3zmr/tcelmXQSK
	ZIaD95KeLMxo/cMCT3uSKrotmMP/LzT2fJ/3gNnj+5EMwmQr+ashIGEDVvp200LzjInGN3r4yEkdH
	Su2gS5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbH-0000000CHOQ-3I9t;
	Wed, 20 Aug 2025 03:34:59 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZT-0000000CHBm-1PJf
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:08 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-323267b7dfcso5563616a91.1
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660786; x=1756265586; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyEsOXzAjWKxsA3rqPElWNR7wj3i78VSNch5OWP+qXM=;
        b=Bt3paYdL/qPynugqZI32OUAzud18tOdegruy+dGDLcuTgeK4V8UyGGeJjR/OpWWJiE
         NWz5mP5oddT5p74gdg0JW9s3sX0pBxx1gDeuz4I2QVb3kX+odlwcDjBt1qb1QPfuUe58
         K5uCLLheXCyuy8+iJvBrYYKl1AbCPcEP5x88V6l0UIfPiBIM/Z8OIjl6yLsTk+ZeovNs
         He0YQkCH2OCR6DNPLbafOqHc2VpUNyOY4diVcT8fKsORvLX1nCWHGzy/edAgo4YWNdOp
         oHNEymkfJ902oCWCDxoLCBD6n/6goP0MQHkB6yN619nl8AmWdYJGYD53j6v45GLEW+TD
         B0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660786; x=1756265586;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyEsOXzAjWKxsA3rqPElWNR7wj3i78VSNch5OWP+qXM=;
        b=KtnAJhxHzEF7WsOilEQ82FJNFgb8OSspyrJ3nNjeQTfIV7sAwokECiZIdDusL0Ko5T
         t7U4czRl9QTx45m1iAe0TVtcWvH7K1og9aGr9GtRaqePgcZVJHax6+KVBOi7fyXfEU4D
         yiettcRUWCL5gtbg0qfr63XevTWLjHgl8mOvgualknMcm7cBvtlSP4ixk0MkNzzZv1SN
         5uhH1SlkHANs1fw23mBBEdL3SJkhUDZWh1yIEeiKZg/kBsq2sEMyjmZNojbHzpbrAAhl
         BL94OPep8wzRYkq+TvmcgOu7UyCgRzSBEmx5q5j5YVnZCvAMu04g8/MKXywHupQPYZ1R
         huoQ==
X-Gm-Message-State: AOJu0YxZrQ44qx3zVX9nCLD/rOT1c9o2MOxpTNby8kHgp7CdJ5+dnySh
	F9bvTzI+8W/Wi3VU/zMdEzx7O9+O68f8muLSxmTL/VoH4i2w0zdKAznmt+nVE6lxLdesxT3dZEB
	5RaSB0UrSvVI3ZEDxxQfTiDPghHHNbc/nezhDUB5wao2fOIBetX243CPk0l2WJb5t6ItF+71h60
	NCQX8rYVPDyI0ECLj6xPUGzc42NbAhwidTlXrzWhDu4bid7w==
X-Gm-Gg: ASbGncsjzlnijxROkFw96xkBfzE5XyeNnGTTTGMspI+Afy6J7die+VJt0wHot0lzmzc
	nTWDd2dWX1ZsjP3CuQ02JxB2qRkeCE7dB76buWuGEfLoK+VD95f6/n7sR9ItFLsY//Q5IDzaj8v
	O/dS8b/fyWPqeFetv1gfBOku6LaAOzA1A6La+FgRZXjjan3YcC5szxV0pDrO1v0zvTpGFu5oNTL
	dliGNrfiepvS+DYze0DcLrM/VADFfoALEkSSZPXt6YCCY33ai1ExFJHykXG/vBGNlQmBaQnf2O1
	60MUzsQ/B6Xu4Orv5EsglbjyUhHsVLebJhE/9ePREja8A8CZjaaWuvcSguIdMCiIHCnzg4wLDvo
	3nJjaMySaUq40AvE46oIJK9fZPUtilnjrNky83Ue9ceab
X-Google-Smtp-Source: AGHT+IEUlTai3J7SD1flJ16hLepZU/+tfDDB4S2G6VHvAq0ersiiLsWGoEzVN1A0IQWTzJow1IhJxQ==
X-Received: by 2002:a17:90b:3ccf:b0:31f:5ebe:fa1c with SMTP id 98e67ed59e1d1-324e11dfc25mr2038847a91.0.1755660785942;
        Tue, 19 Aug 2025 20:33:05 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:05 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 02/11] lib: utils: Add FDT cache library
Date: Wed, 20 Aug 2025 11:32:41 +0800
Message-Id: <20250820033250.544-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203307_376871_5659EBE7 
X-CRM114-Status: GOOD (  19.05  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
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
