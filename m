Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF003C83F0F
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kDwl2tkm3FJNcdw3jDlknYDbwycUDNDsBn5091iQvxE=; b=vKaU8wfUhDfAA01bHSUoDQFARt
	lfsM9jawA/Ibn43N1GHfreLbSYFCvOoV6Vuj1uTQLnJpp+ymd4ZUIXc+CVypYmtc/ctyAXTv01HgM
	dy0KUli66i3LZgLO3unFxSZw7PKlAvMpJIboVE6nG2YiDtiwJSPUKC1FvVUUuu4sk2SEDaqHsSPUQ
	TLL58FaIq4Snd72dPcFey/z2+NJpOkp8yEWuV9XFVyTwKhUOuXEOu34pDTFUzTtiD73g26Dy6RA6d
	qYMgQV37/Wj3uS8PQr7bu+6MGHGu+AM8rJMjgQoYOHn/lECcxqyOZVesCq3OaukhuyKCSbsT275ts
	MyJUlPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3CF-00000004ep9-2fPQ;
	Tue, 08 Jul 2025 07:56:59 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35R-00000004dHs-0dQO
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:49:58 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6faf66905adso29674286d6.2
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751960996; x=1752565796; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QbNx1pxFkEn8bvXIHDi0izS4SvbWXBdyXAF68xbjGTs=;
        b=jd0iClLFVOO/5yVHIk6GuHkrkNwNa6vMPEtWgfYrxkf2VH42Npiex5Tx4bKzJVgJPQ
         4lpqMWnXAa3c5mC1ko7jk2QBwvFxccAspxxq1iRq0AKrrQV2UHy6wyQxZZ1hRYtFFY4L
         3ygyMTIu7b2xbyjnki1qTBhR2L1UrUaFo4Dm9WXfMCwDWWjCfF7h+w0jnWXTkO1gwkZM
         xIVFjPISY7TJZddVE5/XpfyiE+EHrTQD4lUO4NpRn1Wgqrt/O2uRmiG+Qr6hjQA0hUG8
         U7XNW+NCsnGCN2BAmFuqz+259DtePZtqlNvrBt3QdhZ34IqkRb0sKXfKWFhDbN/E6KX/
         gyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960996; x=1752565796;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbNx1pxFkEn8bvXIHDi0izS4SvbWXBdyXAF68xbjGTs=;
        b=LjqHK4E7jRu4MWspFPV5ONLLahGDUiuFjK/Rq1cfxkCRgbOWL1kHcgqVZm3F8Kw0lv
         TWuif0iJHNwTu0psie1uJ0MdsIZo3+cvT/Rub4a4I1rN+FeenpD88MVDe9L/5eOxuZvM
         mIp4st7U1sKeqMaW1nsgPUvsouwO60eThVpSs2czmaGUHX7r21jzWQU141FUVzPiKSxi
         65dXsz55Phu3+NYNkbqviQ4l1UfLu00++xXUX0F35uqK2MC6RCfSzoX0RFn/SQCN8igu
         kym1VDDn4oauTMW7aGqvNMcD3vM0hCCERMASKVN2fK3TCCLXCbD3sBkiNcyiaLfACuMi
         VIzQ==
X-Gm-Message-State: AOJu0YykFKzPvk/frcknaXlbSkbPexVJuNC7X8blZWCbxnJiT4hA4lI1
	7i+ByWR+KODdFAf1GwFYx220VxIRZbKROOcWH7DBGp9GL2xiiskf9m71E61IctlNuCgyJbD4VqP
	spHmEVh3ba8oNoCYGdzTTj3ir2neuP5wWE0UXAwQ++g4+B8fzTwVQTqD10Ozh6NWHOUWqKNKbgX
	HB8oKNhYS1p6byBEh2LIFEsZ80qduQXA3Oep+USgpYfMrAjQ==
X-Gm-Gg: ASbGnct/MLNYZrUfGfSorV/ces+2K3aTfneE79ZTKEiROsbaO7Qv7OLPek85uGcgANl
	VqV03+PtbsyzADP3hiXKfawklK52fk9G9lg9R7czlMkdwLeX3kG5M5Zi6Lh3plgoUIMXADre28L
	Mkco0rnB6/EtJwxeCq6rz4OWDb79fu/fd5zLHuKYZkyTPH76XYWQ75kgRPXbZN9x007NjWVvGaq
	p58k1wNghYk/+HCFFB7cs2SnTg5QFSbk+l+GxiUQC+D2QjHk3P04wwVshe9wV0YLCK6LCd6tQzM
	4aDu3w56nhLYz+O7hy4IKNjTUAZbn36Pr/JL8opSRjXEP0cns1Wjs92yaNUrO+MINuXWOSYdNWq
	8f0rWIAhY
X-Google-Smtp-Source: AGHT+IH8o5Kqvt5qvKSEpPRu6W37drt92M9mVnKv7nCgd4omKzV4QneDh6OYh4xTjFi3XuFs8D50Jg==
X-Received: by 2002:a05:6214:23cb:b0:6fa:cb9b:a793 with SMTP id 6a1803df08f44-702c8bcf0afmr226456146d6.26.1751960995965;
        Tue, 08 Jul 2025 00:49:55 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:49:55 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 01/12] lib: utils: Add cache flush library
Date: Tue,  8 Jul 2025 15:49:29 +0800
Message-Id: <20250708074940.10904-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_004957_293150_FA471F48 
X-CRM114-Status: GOOD (  18.58  )
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
