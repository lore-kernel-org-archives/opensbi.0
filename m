Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4081FC369AB
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 06:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NYZeAQPa9TeaqaEh3/PWg57gihXm+DUbBvF1edm+BJ0=; b=h3bEaq662HtjtFwQrHbTCl7Bkv
	BaNv1QMOeA8LiRkRjXBh8BOO6Dlm8Y0sXwtUO3YGjJ2e5ZkgfPN1PB0/u0m1fj0OQNaJB4cPkOOI1
	UtiIen1gPwditmDpu7BqjxFOPXqGp6v85hzWtXS3NADCmXoucRZGB3S2RShI31s2S4IImIrOkpa46
	h+6HXpd4toTyK3LBn60Pygl4JH6PMOp6B52BzcVm7MshKSihO1V2E7l74dPbAzvGnTdp3xVV6CDA6
	86RpgzXXja7m80rfe5qZ0OF7WtcT0S+5fOpgBPZbzm0Ec/rZPGQkVrKk7sQ9Wbhmv8bQo0SDmUsi0
	BrfzdzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kb6-00000003haH-0Np9;
	Mon, 21 Apr 2025 06:25:40 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kb3-00000003hYm-3F2F
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 06:25:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso4324702b3a.0
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 23:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745216737; x=1745821537; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTTH1LlaFiGTALTGFAGbFFAN0/VXiIxAPP4sR++d0tw=;
        b=XXn620ctcI5L8uQU1+JiPaEUtfp+32ynXwAGB+l6BAdIBDJGQM0MMzcBTf6gknPNyS
         3Yw3qGvouEaByo/b0mYpFnUYHLL+TayUmk2F61yD+gNOWiYJ4ok9DuIfvkTcTGT/+YTx
         KFDTaj0JEjFSvfBlXYC7nnvYNOlDgNbxP2Cpk7KGkV6DvhrKnefqRaSatpjZxwM20Qgd
         vukt3Mbgmxh5lebV2neUJ6X+2OCk4UE2tNtVZDjMGNRYuSGvk1go1rLWOzFqTU4qj+py
         bMJJK/I3kTV+2nv0AA0fUGmtbxcXyRmh4+QmnQ+F3XyXbJRvN+tD6RJjC9RcxEe8F4kY
         A7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745216737; x=1745821537;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTTH1LlaFiGTALTGFAGbFFAN0/VXiIxAPP4sR++d0tw=;
        b=DZebFTE/mosejbuJRCp7oQSe9lWaZqbmsirjg9gGnOqGNOfRnhbZwGsa7MWIMNTlKY
         dCNIINQ6YW2m30hhlETnyBEng0wzmA2+fvzXXtsLZN2JGfEIp3FO3LsWgONuImTw4bqp
         kDHueFDavXfsPiFYwm+4TgzNfaZ3wNZmYz3fUpp5BRaRx+VitnbcfMmTZJYGebbp2d1E
         DiTZhqLKNzBikUoP6XJHJ6oEnJMGDbnpdD7o9D3V9K1ZTKk+oY2PMOPLtuWHmMF1tLFv
         Vp+tGThWeaeBpNsZyrS9iQvJBzJ8ug+722D9z+4fLISO0U14rlds0pf7pfX8nEpTiOWy
         y0ng==
X-Gm-Message-State: AOJu0Yz8JZ2vsIn+SSWuiW1vOua0SgdFeJ5vJmg9S7610d9uomal9J+3
	0TrUUOp8zKV64qLV1zvDUL7Sn3Xt98U4e8dfXSbsD21okQEhfO8Cqd5qfjIAk8aLz2UfdMW4CvP
	1pWxUYV522DQ7UxR62OYxqntGLo5qpvZDI3nJS6lFOjmbqKpiQ/Ox3ShuX6uPuFmfVaG9C2CqrO
	KjeBaY80dsLeMBxvVLFi6CT4BjSpMIxHPCsCmFNVGwHg==
X-Gm-Gg: ASbGncsI71c+3+6/2learM0EFZp3fp/qYwV4033f46wFC85BOBfeXlObh5JRV7Dcers
	N1iHwgqtMbs02ccm7vyl22uwDQssxEaydA2cHZGcnCBMLVwkj/ZqUsAGzecNx+9S+vtAH77yiby
	zfgGOBHADILvCrPfWNAwt3VkXWgLkLPoFy8hZxJH+oikFn96MluIYfMOjAEhOKr064igZGVYHPT
	f9cKhO5Gu/mB5upyJcodSjfmApTNy/AJmrdTLWAJC9MB7zrMuLoRibkDOPPujLrCCxnTcloQ1Si
	LRvhlO3ekmqPrg2MIXrvX04UNyGrnK0BdE3OUkTxYiOiT1upnZN6/S3UcBPEUHjpk73Gdobh2g=
	=
X-Google-Smtp-Source: AGHT+IG4Jir9AP4WvsiSTrl++0tnjhum8lqkQ4KO33BVy1hFZTZvZoSTtbBVOl4kb85FGB3owlCdBA==
X-Received: by 2002:a05:6a00:3914:b0:736:4644:86ee with SMTP id d2e1a72fcca58-73dc14c7ef8mr14716514b3a.14.1745216736510;
        Sun, 20 Apr 2025 23:25:36 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf3dsm5961043b3a.134.2025.04.20.23.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 23:25:36 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 2/5] lib: utils/cache: Add FDT cache library
Date: Mon, 21 Apr 2025 14:25:05 +0800
Message-Id: <20250421062508.21187-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421062508.21187-1-nick.hu@sifive.com>
References: <20250421062508.21187-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_232537_813188_80D87153 
X-CRM114-Status: GOOD (  18.91  )
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
Cc: vincent.chen@sifive.com, Nick Hu <nick.hu@sifive.com>, Andy Chiu <andy.chiu@sifive.com>
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
