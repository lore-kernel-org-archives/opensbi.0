Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19731C369AB
	for <opensbi@archiver.kernel.org>; Thu, 24 Apr 2025 03:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kDwl2tkm3FJNcdw3jDlknYDbwycUDNDsBn5091iQvxE=; b=KnavFViYdrU2g9i+yRJrssZ6EA
	/x8ufhOYm0qYKCSt6V7Nn1VG+9b1WRKPqd9QIjQKkvMCJvW6YZXnPjjRkAUm3xmZZnzmEOc0IJONz
	e8HUkghHEkvX8lqtbSn4qMtCq/lbv3Q2M8A00TpRIO+FpO/B8/zBw2E5wlzrCFp65iXWhf3ZyQbFo
	kRStNJPAAsNUlS5Kr31RH0fAJYFCzuGVGrtmxztKNr85D8Cy1nSrN+kauzAzZCYt3CVjLcSDRntuh
	pkqU/spSXN8G4wqepd1of8jL3wvjVGxfRCVxBmEMSKR4QeWlEbsBRwL0fpHG50Do2t+HB7qY1d7zZ
	S/uK1eag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRn-0000000CkdS-3Eiy;
	Thu, 24 Apr 2025 03:40:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRj-0000000Ckc7-1wTC
	for opensbi@lists.infradead.org;
	Thu, 24 Apr 2025 03:40:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-225df540edcso18015385ad.0
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 20:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745466018; x=1746070818; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QbNx1pxFkEn8bvXIHDi0izS4SvbWXBdyXAF68xbjGTs=;
        b=K1uWm15X47TNvQNqSItUxYu7eIuxyWTwAwSoFT4UlGc6HMHmz6T1Fi7NKUyXc7GHx5
         S0rCIOOoRwoO+ADyIM/sFRNPtg7gvuMjSKc73589h+sdwlS/aUaCNcRBtdC1Rbbywv1r
         awcfABYLTS1nqMUUUdRndyQX43n8L8NqN26xYnyUHy0J4xgIz3LetUea9D2iQju/ccSF
         seA7f6YKQ238A6maNmiVWreU5oYkG+zThGdob33/5EH3s4xj+Yy/eGsukyutJ069wpNp
         mCRqp242Bkv5viMsG1b1Kgt9SolVPxBVWEbaVgg+/G4BstcBMI05r/Fy1hOTUF/Gru2F
         SIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745466018; x=1746070818;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbNx1pxFkEn8bvXIHDi0izS4SvbWXBdyXAF68xbjGTs=;
        b=apgc8B2cm29aJtNYo7Rk4EIfM6dYUyj8feuKaYaWEPfGcAaLIXukiOykx+t5oydRaC
         D/G8cbJCwr2xgzgxu1x1dYSohAgJuALUIck+zzzkLwPdgDaKN4uNWZ9NhyxbFTqyvHam
         Z81h4kowXmghpC9exWL+JFn4oxAiJQuxvghpjXQSB3wMkwtK8Pgmjrk8EH+HyE2q90ax
         tarlICtjiXidcPiaFURAxbpmYtykczuPgT6onZ47Z0hu7ns2KbR5ScAbR7TKDwfJOHo6
         6egImp7OulCb/AxBnTxHM1FgF1x6m105glL3d+57yaWOi/r+WZkWReilmA39mRBvegQm
         8frg==
X-Gm-Message-State: AOJu0Yz49ckzxg464mn4SA6s0Kmx6/ZxhIP7r4PubWpOgfiSQ0jynoga
	LNEXKgwj7tljU7KIVYShEAYoSed+l5PHxyRLKdawOYGmX+pEE88sGHga7Y3ZApRNzUi1HpwzH+X
	OCoInbIppJTzBXosZ0AHaCQe1vtY+l7PEf1GhbQR75R8EfHoX4FGPX3aYax9H9CLc8t7NdBYzyV
	sJmQXygYGBTesRLVjGf7SlPWhkdF4uHut1ZzAV3w9sXQ==
X-Gm-Gg: ASbGnctVWskJA0DdtkGpKTXuoHISAT/5kigxm5cPHxW2qjDbWNDLnEjasd+uiq2wia1
	CT2BiEnDGC+K5ZXKLDFDvFwtGUysgSEYxZGCKEqCRI9Rffcxpw0G+UOAbdydJmE0R+wzKVxKb1I
	YCbzfJALCqtQuaioRQO+bzyL5zml1ZJLBTZ2aWq4wetnlt+uryZE/wr42xLSxw4yWsTr2eR9Gzp
	VYTmVnc+yjYkU64e/kZ1tMsS+H2MwRWycxLXRdxovt0gJej6lxyNb4fuS5R1V7sI2d4PfJ9gqMY
	DQSfjTHcy9GZUHy0NA8hHTkR3t1nS6P4y5cjHQqNWSdIuOV4VdVVVkQR67o7aUkeRkgVebEm5A=
	=
X-Google-Smtp-Source: AGHT+IHe5LLP2br/RylxujZw52+oxgr6Ac5B+VVqUYXsHiSZOZgyuhSSIGmfKg48Jm0oH3CCYRSg8Q==
X-Received: by 2002:a17:903:4052:b0:215:a303:24e9 with SMTP id d9443c01a7336-22db47aeb1dmr11086395ad.3.1745466018001;
        Wed, 23 Apr 2025 20:40:18 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd5f2sm2632025ad.66.2025.04.23.20.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 20:40:17 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v2 1/5] lib: utils: Add cache flush library
Date: Thu, 24 Apr 2025 11:39:59 +0800
Message-Id: <20250424034003.28522-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250424034003.28522-1-nick.hu@sifive.com>
References: <20250424034003.28522-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_204020_063720_2A4E0BFE 
X-CRM114-Status: GOOD (  17.79  )
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
