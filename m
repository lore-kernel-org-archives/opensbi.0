Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2C5CA0EFD
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NBLGA7M0v/Co0GhEdMqWiOFVnS9ao9TFM+yojhCGt2Q=; b=GEI8VMZAgKD43dBlstZVul9JsL
	Q0k3plKywx98zw3Ay/HHF9RTnFdeI5KYSpLjl6ZIwVAuPyEqYVZksrEKeVVHgmH1n5VdMu4rCcTIb
	sgz4mqUmPNu1FQ7bN42bE5QrS2Knp4o+BLGD21WHbFoPkcODkK7yHwWGkVhKC4AvmXUGZeZsjuJSE
	hlivfszCR5l+wpk2m0Q8u0DKs4PE6AZHY/FO7qll732TfKSv+7B1lJKuICuaAVDfOLbdr/u2AIWcm
	+hNs6+DmZ7CEwl0bFFfmsuM13q2ryPQumRB8pkUt1oj9sLhpRY0/50q2Kl8F0e2LZYUDpzERbLEOj
	q8/Gx9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbH-0000000CHOH-1O1Y;
	Wed, 20 Aug 2025 03:34:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZR-0000000CHAw-1gOC
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76e93370ab8so129752b3a.1
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660784; x=1756265584; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/hlAgnUysU4/3BSmUGEsouJWSIa4WqP2kiyhRaPeYQ=;
        b=L0En2h90Jr7ED0YJZSCAuMITPOtg1+v9qzgHftjsbi8ucofWuUZGdAXBsea02xAkCZ
         D1uJShZ+9eA/eSFRGLB3DEUiNv7UhpgNK0emem20sbmy3OWWqjyhBpNd7y3ayTnfReEI
         C17cE3GhBAEtUIWFCiZGFAccEcPCepwlKHjR96JMM5Fo2/1Y+frGRsBVQlQUXd1snyQM
         OtC9VWO930YUJDuBLPGav00GXZKEkuvERRWw59U5fly1mfE8ydybXVefmetGt2qJBj1k
         HHb7/OcGMhsdmD/JuIpjhx6bjcytuCwXQb73GPg893SjJTr+qSPSvHBY1RChEXBe4V6U
         v1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660784; x=1756265584;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/hlAgnUysU4/3BSmUGEsouJWSIa4WqP2kiyhRaPeYQ=;
        b=kKRNIIGFjV0mznwUf5JdipZc9kLAXvSlmP1Z7EK06J/UPvFylvTr9iVfaXmY31cnlt
         SvXVTMqpuhtB8paXMXTlEBG7P5g32n6XSjNGgfyCqwqSMpI61A1bDaKCOCMmlFfulE1/
         P6Fw0OjkuKzbys69T2/95LgOIU9PIH7Wpgg5dW/1caJJ2gvDwNvmlHUYJc2R38+t5K5H
         aFplYZRdvt6uCKnyNOav3aOeRVxruSpSk6NMfkzb5HcpzPg7T0UWWQI7V4Ilt33uTh19
         NY3xkmYOApyXHCdulUaCkQLT1pyAhWHVx8eS7Wk+fGZrksAw1Nv2z7KZZrdpNj/pRj7F
         e04Q==
X-Gm-Message-State: AOJu0Yyh6BQ/z13sK5497ist8mX1ncaofEnMXX9zcZenWQYJh1DsQs4b
	YO9odGq8Bgf7iHVqWvM8uHhJaiFbc0e5SO6pNasVago8eqO//lDoqLaDD0Gzje85kLEPPchWDUx
	/82yhfq2iWSa1oDWh2bIWC8B0eDuiuhnGelc0oay9MvHpcqi1Uin3ahmGH4CXkutGIzBWQmqSCW
	aYIMjOG8KfqAY7vEOYDDNL1KSUj8LK25oh2luiIYAKh0t0gw==
X-Gm-Gg: ASbGncsVcHCM9eEhIZcnLjCcUKxQJRQYJGi2bN46hUX1Tnjd7/iDlXU645LskRz38rr
	9dNzLNoRTe3Hj+JQ4Qx1EKmo4tZBw0PyWz5Kj0TN+0xBiH4D/5M/U9aeHbPGIEjgERrUMqUAJzV
	WELXNRO/2ie/aN6ek6MbqdDfQsOsMRluzYkV/GjXwj7yrfTLnRqM3ObOKBs8YNWeHeG/F43ZKo6
	yg2WWG8tuzjk7N8SLCj+A/HV5zE/hGll4EGwpC2NT6NBV+EzpIzd4WBqk32vdVgcXqV13XBXnUI
	YPdXg2SaXrRFv2RWZ+u4BRA+Mj/MH/9psai6MAOKF0q1xHVTzCCxhMIOOdBSClUkpHSt+Ve1Vx2
	LrbKtltyfux8Ff46Vbc66UDYiGtCw40mg7PIbmwARK2dI
X-Google-Smtp-Source: AGHT+IHFgySeMhueq1Y8DAfhq+kEfLhDl97r+60w51I9qMAPqmwrtcoSAfVTHwZCJUzmkPTtRQJKOw==
X-Received: by 2002:a05:6a20:3ca7:b0:232:22a4:bd2b with SMTP id adf61e73a8af0-2431b93a316mr2508275637.33.1755660784287;
        Tue, 19 Aug 2025 20:33:04 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:03 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 01/11] lib: utils: Add cache flush library
Date: Wed, 20 Aug 2025 11:32:40 +0800
Message-Id: <20250820033250.544-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203305_439867_04118A51 
X-CRM114-Status: GOOD (  17.87  )
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

The current RISC-V CMO only defines how to flush a cache block. However,
certain use cases, such as power management, may require flushing the
entire cache. Therefore, a framework is being introduced to allow vendors
to flush the entire cache using their own methods.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
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
