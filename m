Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9DDC369D2
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kDwl2tkm3FJNcdw3jDlknYDbwycUDNDsBn5091iQvxE=; b=ykpz0BdcEyWmMVgP/BPXg41gj/
	CB+QKYaOFamfTlBOXpEem2KdNHPXX1j8K/u0QuCHGcb8ZfWm6JN/cX3ixrdUp8VpiZOjGYmJdf317
	U1/Tx7pD8XZEBWLm/ad+HxxwjjGLcf7s2AXeks7koMz7LJqq+beKy3815HftyK8WhHjjNEbFNTXzN
	3BefIb2kt6C/xdi0CkksDGYSn+m2xRqBdElX3E/taLzkDynZMHWyXJbhTQpB1PvIT3WFtuR5vqWXN
	put18/1B2bGZr/yjSp6hwkdQHCkUGCfGcLgjaP2Q7c5Yrbyqz1D9b1Z1uh8ryKhKUBA/k5QMtMNdZ
	9kvufNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kb3-00000003hYn-1aqj;
	Mon, 21 Apr 2025 06:25:37 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kb0-00000003hY9-42tD
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 06:25:36 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736c1138ae5so3248008b3a.3
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745216734; x=1745821534; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QbNx1pxFkEn8bvXIHDi0izS4SvbWXBdyXAF68xbjGTs=;
        b=SVzPQkttrjTxGJLZ5dGZPmrSweJC3xr/1Ihmzq7Wv+2per59sbT+pilAx+1wGnjZwc
         ZW82Wi5Xh/iTo1rdDLAmnpt3MknAgKaBk3+d3BoF6b/qNQgweli9wshGlbOCEYsnpzph
         MDdeV4R2Au4DfYiddG67NqM3wtrHa8VHae7z0FyRZfvgz7B6DHIy2etGEOF51gydQNla
         dCJOyVdRoaAEw5vMjA5z0o9yKEd2vpwMgtmwxBBAqRNkGBP/6lJitVh87q9vMLtAk6su
         jUW68daBbKpUAroTE2Tv9q2eSEMLwGul98cDm173K+pxBEtVuCJigqGfJ4jeWRNXEuv3
         ZTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745216734; x=1745821534;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbNx1pxFkEn8bvXIHDi0izS4SvbWXBdyXAF68xbjGTs=;
        b=afUe+KWkGdXsTkbE1zuiZsxtetvCFXTYAmkZYuk44WNGNDk4I8rg6vxOAtCwiKVq+g
         4Y/HW9BMDf+VtPGmPXMdEsWLYCgz2gZy2bBkbwpHzS9trT0E+apKdr/eDqS9HORbJes7
         mIyYfZvH+3wDz+V/oanie2FEVyRh6U1fCyR6+RIs50Ua5j7cMmzBcYLzCKIv8GCJnCCs
         7wRmbhBp/tN8oYRIMgLvTS/nXdyyRZ43YlZ5dKmsv3hGESP2jk7R/dkro9zW+c6sQftE
         KotkBfCpm+2OY6SAzj484V1iMfI7jmOHrzEWPkLUjP/AnwUS8m0Ntn6/h+GJ/l/bBa6j
         IgPQ==
X-Gm-Message-State: AOJu0Yw76XBZo0tyt5gj2XZfUaZoz7MDTsar1Ltpo+AV/OukGcaly537
	2TuaAK2Q939jhqo+4n3GFn7lXzVPP9EWT/SMDri4Q9X+eSZX4n/u3FfQwOD5BzycuVLZ2pFn0ed
	cNDLBp1FkqEE1Y4yDq7Lf4qA/6T01bG0ibKTHDV7p2MkbMC+chtU3xFHGhRtbOcdr+dSBXrG8vU
	AkwF7fCxbcxBWBVHJz/VHUboBtGd1x+hnlsjYjYhSuYg==
X-Gm-Gg: ASbGncuwj+hq2CMiEkA9qIneNQXrGbHy6yHkq3l7xjblSep4vLP9Gn1gLgFwzDJzZ6k
	c85Zj5KkJjE/1SeprmlSAWzYNBm+3NONidVQLYYJ+MxLIFrCxl5YxWCm4n+wpQsRLyRfJon+7xR
	fY0YFPvYTTcC6kX8r8IlQElefodhNWkrTpSfwTWCY8zIB0LfpSEgAbQ0w5U/KXoftdS+p8UZuTC
	fnxImK5QO60ECpiV8we7sH2ED8YkJQ17PNqbUmgjX/7ywJZTFp0tW/7he0l6CwrcnePt3cAXI1h
	gVVvJYANajQSthOIVsei1Sml2+q+okjlMT32/+CdxIQlKi7g9maMQjMV3PgKEdC9BfMXIxu3bg=
	=
X-Google-Smtp-Source: AGHT+IEJVrzZERu1hPcOcWJAH4s9MSRqw0GSdpwmf+pOIsK/IPyLfvxFMHK3WtRxsgS86t6h9sklLA==
X-Received: by 2002:a05:6a00:114d:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-73dc14cd3bbmr13413374b3a.14.1745216733681;
        Sun, 20 Apr 2025 23:25:33 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf3dsm5961043b3a.134.2025.04.20.23.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 23:25:33 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 1/5] lib: utils/cache: Add cache flush library
Date: Mon, 21 Apr 2025 14:25:04 +0800
Message-Id: <20250421062508.21187-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421062508.21187-1-nick.hu@sifive.com>
References: <20250421062508.21187-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_232535_003975_F1ED7FC0 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: vincent.chen@sifive.com, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
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
---
 include/sbi_utils/cache/cache.h | 69 +++++++++++++++++++++++++++++++++
 lib/utils/Kconfig               |  2 +
 lib/utils/cache/Kconfig         |  9 +++++
 lib/utils/cache/cache.c         | 46 ++++++++++++++++++++++
 lib/utils/cache/objects.mk      |  7 ++++
 5 files changed, 133 insertions(+)
 create mode 100644 include/sbi_utils/cache/cache.h
 create mode 100644 lib/utils/cache/Kconfig
 create mode 100644 lib/utils/cache/cache.c
 create mode 100644 lib/utils/cache/objects.mk

diff --git a/include/sbi_utils/cache/cache.h b/include/sbi_utils/cache/cache.h
new file mode 100644
index 00000000..70d9286f
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
index 901ba564..5a5b3b1e 100644
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
index 00000000..24aa41bc
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
index 00000000..6bc3d10e
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
index 00000000..21d30ce8
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
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
