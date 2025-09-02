Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3325CA100D
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 03:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0zR5Ez8AJw1VnZ6Gau8RUwXqWFxkt7Q914E7NwtXxM=; b=COj8v4mdr48hnz
	2TjX0f09yHetX4Fq7htQWMV3ed1dYSBP0YOgPRzFOizT6DV1Wk3CIzbhKv07Q7G1PNxxnDjJd9UJz
	FZ/aRHZvs8QORr5yBb1989JHqEEoijFY5PgaMFfRrCZFMX1Z31F7Uz6LBNLe/B4rMU/TtkCpStSw5
	R5BYNrUHfZeJsRBf1kHy+S3SlVOwcwkWTGCrnR0gFONGj7ruoVTNF8LuRVVj8tKZzfmCpWFYHUUwc
	2ilGUD0ed5we5PiaU0dx3qUvz8unOQ2yotqUCz7MjTrgAjgm7/YCQFOIn/gTFQSU5CzbbZ10JdxFX
	72n3Q0zXLQTqgwKis7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utHeK-0000000F1QJ-0jSL;
	Tue, 02 Sep 2025 03:25:36 +0000
Received: from mail-pg1-f179.google.com ([209.85.215.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbl-0000000EpWq-0gKU
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:18:54 +0000
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so3336141a12.0
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779532; x=1757384332; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1S0eep8Aeq+o/0b64iP3QPNTlfHJeUF3780onuRPsW4=;
        b=iphvDZcYx0S9s0lZwOJGt9dcQ9ZN9K7oguou2S8Upz253YsYURylz+VVzY7BT2h7sz
         AkUhDhkaRulWOUk9N+U4tUD08A1l9JOMqDrzeuvKwapE2aKsV6jo6zn0Q8wRvhHhEKo8
         JnxictJZaKDkYbAD/vEpeG5x86+c4t+kbVJVQ2vPL2cEL8jgZ50aDnRp9GOuEQ8EczTi
         5NOIQnmT8PxWo1ZS6+BiSdB/XBoBazFia06WFlvKyJY2XFX2weMiujPm8Ct4n6611B9L
         mwgjg6f2YbUlotpE+LoQymRINWg02LDEabQ4qIwlTuOS2TRIxmk9XyflgRqsrG4JviXj
         usAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779532; x=1757384332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1S0eep8Aeq+o/0b64iP3QPNTlfHJeUF3780onuRPsW4=;
        b=Frk6XxQCHolT996hCcXRlJdqy1e7adwDHE2lrV0PjlbPSIlL/tc9wKtcJ7Var72cuY
         v1TzFUveRbE9uTvRwN9Hw3hNaoAGB96gGZF+HCOnJg6Zjg+TZTttLtr7qa/MSnq3GNQR
         qwOHw8b7/zEwXbCXvB3c9ZHJ8LRiJnh9+FdpiBuEOidMDAnR5x/li6i6Er0WuA2HAPLp
         WMv+y97RIkIxsrzrJ95uFuobzaGd+zyJhbak1h79qB8EWopDWCpaVgTZz1EJmSoiCGht
         Z6rJ3EVcjstQqmdnMqYG8kW4dXyw+0Y6mmdtqb+7uvBy0DzTXOk6ONFzDvaJ9XfIhWHd
         SNhA==
X-Gm-Message-State: AOJu0Yysp0E/wyDm1LeLzUHs8JwbDDwlJXHmNTUXMoSYILqKNwA+tIa+
	06yxI1b47VFrS2yjRryFKda1eqaEau2EMJ4vfEzCcpmQLf+twK/X60ZKzoECWnpyo0aP7wdmKxK
	8VPcScn/4uIL3zXUxTxa7Kj/woZJRn8oEaWwPim6hMB+3JEz7fWISMKygDl7+kITDwDX+v1R+so
	+PY7e0WLOqP83U6xPKGc3L07YHv+2AyDDkDfuUOpr8+dHw5A==
X-Gm-Gg: ASbGncvUAwjHZK1o3jiupfwLY6UCz0enfnJJ5377rlHYrRbu0NvvDtul0t+jZdusfZS
	CTYuPzL/46qEAVqvzZGElr45nClSvOMChwgjQYBKW8+WicKi8wRhkpdvKokXfaddnJ2//8+dhlJ
	feiyQKuIO8aiwgWXFErnYaPy/YTtfCs28y+dnC1ns8zn07uTaMLeChYexJQ7ZFixO964pYL6ynZ
	2HfYM8rhvUCDexkTqwwOYe8az2vs7nt9FUITFiQ3teUH5cmnrqmH6dllfdb1aIcwXvdtc+Fl+Ex
	b4r4h6AUHwqpOoASzRx8zzpPFUqE0Rfh45aJQ7FRvrqCkfJVZroDVKoNzB3x+EoiCzgCCyhGJ6I
	T4Itmj6t89aMQSkDL63zDkAylDaegkJg=
X-Google-Smtp-Source: AGHT+IGEDcXtrNs0Y6ilDyZwAh+AGoBuJS8Mzv685rBa7BgB/TkuxX/YNhBKvtZHfwMoG5RLoIttJQ==
X-Received: by 2002:a17:903:244e:b0:249:3eec:15bc with SMTP id d9443c01a7336-24944a44010mr129116475ad.19.1756779531937;
        Mon, 01 Sep 2025 19:18:51 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:18:51 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:40 +0800
Subject: [PATCH v5 01/11] lib: utils: Add cache flush library
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-1-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191853_208383_3CE0CE5D 
X-CRM114-Status: GOOD (  15.85  )
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
