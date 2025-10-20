Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE8BCCD193
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0zR5Ez8AJw1VnZ6Gau8RUwXqWFxkt7Q914E7NwtXxM=; b=JcmFrTla2K2kbn
	4ICE4fAqDaAk3MIyDZqXu/zdajZGyGEo2b0mHwkQRfVIKCp6YJ+Qh7dg/DszK3Mq8U+H9AxcF9tdU
	TI24N65Cuz9zlqMBTbM4+Xl76pa2gxsMtlzJVIJ3/1yUgA0uc74T7gj6jXoLJtPauSMXEdNh2iGk0
	Rph1SAy4aIGLHjV0a9gqEZ2SuNmVdZSEtHZmbUiWREzGGDAUWBL+0FqTkEn5oNtG7BrCpxlGnADiC
	ahtkZrncAcvGZjmIiGbee8+A9Uzf7gV05A5KBOOpGNhb6k9th64sEWw2Xw69bt7zSS2dlxpq9/5JR
	mV0du4zVnrwYEA8xVXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM6-0000000C1t1-1JcP;
	Mon, 20 Oct 2025 06:26:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM3-0000000C1rk-0UMe
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:26:52 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-791c287c10dso3074550b3a.1
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941610; x=1761546410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1S0eep8Aeq+o/0b64iP3QPNTlfHJeUF3780onuRPsW4=;
        b=ftG8unByTjRsL6BGWRx0mjJlfwnQlAR7aB8dxSie0WBbjAcBfvxAPzymPX2DIzWRHM
         6Etx84QsUZDaG+pjh19J3Dd1BFV9JFrZmU2SEizeBuX13koTBm+hiyT20hAvXLz7/9jc
         m1F6lwvoxzHrZBLn6qMwBPy1IsjvNL8cOQSt8WY8IZpyVBDOgzF6o/L6QBLjNKDvXtd4
         I3FnNbYuv3iHsjMmRW4kGHv/mcSB+J+XDmU+bJ2YW5P7OCuaRG1MKyTjRD3hfVT7Xy2h
         9kxRe08oLtZpcWZg6mUgLSiyOkKKK6v1BlIhXnFrRvlIcAEbUIwyL8MY6GxCXYaYjQZb
         5k4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941610; x=1761546410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1S0eep8Aeq+o/0b64iP3QPNTlfHJeUF3780onuRPsW4=;
        b=MauzGWvj8rP0hfw6XbG8Zu3B5ZlXQLJVsgZRvUZ9Uc6ka5ytEGRSEnaArYxMOvpTta
         dnM8JP60YoC5/eRq5Mm4vMd2ypMoLcXkduw13lOzPXeBUfy1g9mFz2biLIRrtrHdnQjE
         NdTeuh2CQ+NSQsYR+9iBjm7VVWiie8qilR9bFM0kR+rKgKIVyA8XLVE6+1rmfEGgSu13
         2P8lHJrjFgd3YhFSJQjwOfuvv/njaDHZb29/kRpHRNEnLOthKYYYnVroLfv3ZcpSJLiK
         EBWD9jktRzT/+v7uxHFk1eOudAVWCcNUnSWUb84SmLjFD20XOzGgGlJHkXpsaJIbD+HY
         hTRg==
X-Gm-Message-State: AOJu0YwPlc3fsL+CEuiwt0jyRZvPjfKWtTJNwIfMyd7axGQ/6RMljexW
	DSOD19xxDjK0xT+Io/CIyVYfhLptMtGPOW19M8VgmqNXUZtDv6+zYbyUazE1Z0AmVABujQYfUu0
	nWszG
X-Gm-Gg: ASbGncvYkdgNERh3H7aqXUhyAIiasveP1kAF+vPEkgxhNRLpR7MXSjW86w23UWmaBik
	cNNXtcUJ2k5+DfwORnz9+IgElhGZjdyWsqI/3pWJqYG9lBBDaCIJK93v3v+QfwsXpBr2Pz3GKxL
	C1dkHXd/HXm3Xwibj3Y8B86OXzLpU3QNS+AZLqxN9HTXTn8kW2yzTw+aOGrRTMSAmoZpZc4RNYQ
	/PMvrEoSPdrAWM3Jrj9WGV4hi/o0WiPeEpTjg0FBJegV1kPx+SBBNEdxPzIsqwOzQky85ZUCnEI
	m8kT2zx8mWtw7myzA1XjC90X2GNb8TnZF0SV8nbDzmDEOQRvGZ3AEh0Ht1j07YVbeKQu3CEOY8g
	fTJ3ZbGkzA6eTbK+K7peTzEBV6+Y9I+Mk2MGlb+5ZsC1F/kpFMgj9AG2+U8GxGQwDPoBQUNVbfw
	==
X-Google-Smtp-Source: AGHT+IFqAS/ZWFjLfloZbGxgG9CX1G/XFamz+gYWW11LXI9ASUcdPXykUFkCdYdl+1hnSLLXja0hPA==
X-Received: by 2002:a05:6a00:2d8d:b0:77d:a490:269c with SMTP id d2e1a72fcca58-7a220b23f7fmr14370877b3a.29.1760941610150;
        Sun, 19 Oct 2025 23:26:50 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:26:49 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:03 +0800
Subject: [PATCH v7 01/12] lib: utils: Add cache flush library
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-1-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232651_164778_F7BE71B4 
X-CRM114-Status: GOOD (  15.45  )
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

The current RISC-V CMO only defines how to flush a cache block. However,
certain use cases, such as power management, may require flushing the
entire cache. Therefore, a framework is being introduced to allow vendors
to flush the entire cache using their own methods.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi_utils/cache/cache.h | 69 +++++++++++++++++++++++++++++++++++++++++
 lib/utils/Kconfig               |  2 ++
 lib/utils/cache/Kconfig         |  9 ++++++
 lib/utils/cache/cache.c         | 46 +++++++++++++++++++++++++++
 lib/utils/cache/objects.mk      |  7 +++++
 5 files changed, 133 insertions(+)

diff --git a/include/sbi_utils/cache/cache.h b/include/sbi_utils/cache/cache.h
new file mode 100644
index 0000000000000000000000000000000000000000..70d9286f9a0a63b8fe13827925163db84f88bdc2
--- /dev/null
+++ b/include/sbi_utils/cache/cache.h
@@ -0,0 +1,69 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __CACHE_H__
+#define __CACHE_H__
+
+#include <sbi/sbi_list.h>
+#include <sbi/sbi_types.h>
+
+#define CACHE_NAME_LEN	32
+
+struct cache_device;
+
+struct cache_ops {
+	/** Warm init **/
+	int (*warm_init)(struct cache_device *dev);
+	/** Flush entire cache **/
+	int (*cache_flush_all)(struct cache_device *dev);
+};
+
+struct cache_device {
+	/** Name of the device **/
+	char name[CACHE_NAME_LEN];
+	/** List node for search **/
+	struct sbi_dlist node;
+	/** Point to the next level cache **/
+	struct cache_device *next;
+	/** Cache Management Operations **/
+	struct cache_ops *ops;
+	/** CPU private cache **/
+	bool cpu_private;
+	/** The unique id of this cache device **/
+	u32 id;
+};
+
+/**
+ * Find a registered cache device
+ *
+ * @param id unique ID of the cache device
+ *
+ * @return the cache device or NULL
+ */
+struct cache_device *cache_find(u32 id);
+
+/**
+ * Register a cache device
+ *
+ * cache_device->id must be initialized already and must not change during the life
+ * of the cache_device object.
+ *
+ * @param dev the cache device to register
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int cache_add(struct cache_device *dev);
+
+/**
+ * Flush the entire cache
+ *
+ * @param dev the cache to flush
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int cache_flush_all(struct cache_device *dev);
+
+#endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 901ba564610ce8619f585b31cca3e9eadc358b31..5a5b3b1e0f1c0ce2f638593bcf186b617803110d 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -2,6 +2,8 @@
 
 menu "Utils and Drivers Support"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/cache/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/cppc/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/fdt/Kconfig"
diff --git a/lib/utils/cache/Kconfig b/lib/utils/cache/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..24aa41bcf966cd42c719d995fa2f9f6ab62ad904
--- /dev/null
+++ b/lib/utils/cache/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "Cache Support"
+
+config CACHE
+	bool "Cache support"
+	default n
+
+endmenu
diff --git a/lib/utils/cache/cache.c b/lib/utils/cache/cache.c
new file mode 100644
index 0000000000000000000000000000000000000000..6bc3d10e9347e03ad08dcf86f36b77846446e71b
--- /dev/null
+++ b/lib/utils/cache/cache.c
@@ -0,0 +1,46 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi_utils/cache/cache.h>
+
+static SBI_LIST_HEAD(cache_list);
+
+struct cache_device *cache_find(u32 id)
+{
+	struct cache_device *dev;
+
+	sbi_list_for_each_entry(dev, &cache_list, node) {
+		if (dev->id == id)
+			return dev;
+	}
+
+	return NULL;
+}
+
+int cache_add(struct cache_device *dev)
+{
+	if (!dev)
+		return SBI_ENODEV;
+
+	if (cache_find(dev->id))
+		return SBI_EALREADY;
+
+	sbi_list_add(&dev->node, &cache_list);
+
+	return SBI_OK;
+}
+
+int cache_flush_all(struct cache_device *dev)
+{
+	if (!dev)
+		return SBI_ENODEV;
+
+	if (!dev->ops || !dev->ops->cache_flush_all)
+		return SBI_ENOTSUPP;
+
+	return dev->ops->cache_flush_all(dev);
+}
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
new file mode 100644
index 0000000000000000000000000000000000000000..21d30ce8e18236eb90d666b884e10918a9a8fa0b
--- /dev/null
+++ b/lib/utils/cache/objects.mk
@@ -0,0 +1,7 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2025 SiFive
+#
+
+libsbiutils-objs-$(CONFIG_CACHE) += cache/cache.o

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
