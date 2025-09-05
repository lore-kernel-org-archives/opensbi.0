Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE60CA1012
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 03:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0zR5Ez8AJw1VnZ6Gau8RUwXqWFxkt7Q914E7NwtXxM=; b=qTjt2cz0S2KXdw
	Ptme1dy7BbwvWa98xq5b1k8cZDO1ws7PJteWHAnWFSQrX0zeNC8HmNaSVdvB7X622ivpxk9FlCZ/y
	ofyumcq1ua80hpdE/Z36jcWhGQ0jyBlhancn6quQP2DdEBgyQjoQ3tflLve62aV3y4SOZlXzk04Ex
	ZZrOWE3k7HrtGQ87/GCJlF3nfSQwm4/zP3xPHTM6t9YdoUc8QBpaLjFdzxVEBzyN4D6ZKoC6/CFpa
	x800HMlD+0bi9KqkYoeWRDtiKEN/86QLaQN0iyvm4J1gXrmhZ4LjY2i0a1CVm1OlUkPobtgGH1Rd8
	Nf6rFipP/0ru6dNB2ddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN5Y-0000000GRAR-1zML;
	Fri, 05 Sep 2025 03:26:12 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM09-0000000Fxc0-2Xo9
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24456ce0b96so18251295ad.0
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038593; x=1757643393; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1S0eep8Aeq+o/0b64iP3QPNTlfHJeUF3780onuRPsW4=;
        b=PrX8D6GYXNXKQ1vTOvEpFF5G9wIqUnzdhb6wiACICXM8er5VYqQjtZdctl6i2xnTlG
         JO1GL/7DCQf1eHqVN+6f+5/boNE6XnyC2Md9Up0Th3gKN/1b+lC0Ds4O4Ka9sczz1y5T
         TD/GwaEDw46bbZ/pym11fAQK3uAEBre48w2F4chELm/HcGJw/dXOLX6NzPip540OrxS5
         l5i2qUjWiR1uJU2GH4k32n8BytqjI1PbBz4UAwotQosNv8ljdL0XKwNtXXWzgfNfeZfi
         qXt7zgtRo0bLFjL5/2GRSrX2plSGU6XiA8Ubpv0IFsrfJZ+k6BJE7ps0HxohVA5g0E2k
         +zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038593; x=1757643393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1S0eep8Aeq+o/0b64iP3QPNTlfHJeUF3780onuRPsW4=;
        b=U0jA4EbiUKNleDDU1VyQiXyxTjVpaVjJf4y4oXaLaXOg4p0tX69P9+2Z2cKC5hmmpo
         dTlDekBg+BU0fOuPVEdqbZ6bZiTvGePOOrN1CBO8PHlV+gP7BIvTAF2PWXnURYhVPufC
         oLlP780IwI5aw4KD/ccINYq7ge8Hn2yo4k9bA6lpYPlPtyUMoaJ/h4FfqEiVtfP2fisB
         twoRARrEpkUGisOI1b3D1EmoHhutNF8WpD0gmXtAmRWUr3eMCTPE0QSBWJBXSpHFtybv
         w+CHqoeoOwWCD3DYFPQXkFUl8O8DFFZRzL+KyrWJx9p92F/IErWly3xNFBGKNCAk35gp
         3eyw==
X-Gm-Message-State: AOJu0Yzd1oNdMS5Laj3BRL1SW+owgc4wTwU9iYWnmkydpE52yifMXdM/
	doqQ3fKAZTbUyFOr/BEJtpnlk5Dqxw9nU8KfifVuCNU55qSwyDUfFXw3EdsFYfc3c8Of9KRxry5
	lvQcvxxxUF8TFDd5NCxbia9rFhAkNQQpazVyT9Cd9fMCJJ9D3SCp6mYTkbkuVSMOGkILD/KCiYY
	z4FBEtQk/V9y0yA8HdO/qx1xJUUEq8N1fX5i8T0d7tEsgupXiP
X-Gm-Gg: ASbGncso5KtjZzbpicf+kOIoy1rOmyFrvqgebmz1ZH5niMK51IfuebT1bc1kpq5CgQh
	uC6K4avPN7FC4GHrUUg43rggJeudJhng9pWWVhZYp5pl1uZt2mT6pq8KX5Rg6lRwdYgLZ35sjg1
	ftFzUT4B0gveZI+6pr3MhD79Cjf1No/v4RWg3qJMYheBY+0EXQFlih9QZBu3QSlMHEHP21tTUax
	484uANGTpXnDnz9g5H+ogCiqaFshrtyxNH903+plYEmxyMYOHvody5t1RilVKvsbBDvGqkCGk07
	W/t0rv1i9U97FNIHtI/PSTEHOmlxIrprLhpnStB/V4VQSjtqF63ejaoCyHzkt2b5nckyAmhnyF7
	YZo1ykkgvILFUjrNyB+XV
X-Google-Smtp-Source: AGHT+IFYma3Ci3ejGj2Oj47/6VPJdy6+eOS58xxE3kfWtDr0VQ6smmAa882PzXwTv/wCXLjjqezQ1g==
X-Received: by 2002:a17:903:2f81:b0:240:5bf7:97ac with SMTP id d9443c01a7336-24cef527904mr18186965ad.16.1757038592301;
        Thu, 04 Sep 2025 19:16:32 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:31 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:34 +0800
Subject: [PATCH v6 01/11] lib: utils: Add cache flush library
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-1-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191633_653207_8A83B2F6 
X-CRM114-Status: GOOD (  15.67  )
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
