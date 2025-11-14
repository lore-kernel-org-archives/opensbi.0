Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D275CDB478
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 03:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQeGY8Ly0aE8sDA9uUrzNZ7ok5M7W9dGv+U9vFC0iLY=; b=gZDYmkHF3ROZzj
	FowYhP4CmdsYfpp6Vzm2y0KopvVNpRADeOXPOsZjYsJsqJoDya/O9a2jNV/u3vuwcM+3G9S3Kr8Y3
	my9V8Zbh6GKIccUPRjC1eyRWn8XTUAvG97aROqxQ/YlL+uICxFeKNoMOvY2UVQdxBeLSybLQzUi1k
	q06yk4HjGwlOUUNh6fIfuHsnR/TIZY4eDg26H85eFOmVEcRwyrjTjZD2WH/mXQ9Pz7PKhlK5Do/bf
	QangQe4vJeYy0jjARIcKTkvAPszmHuZZxfMn8A6z+KTgMdf8g47dyjE7ht2NzntqBmBrRo1Av/PqO
	+Btim7/aDc+1oIyxmn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkI5-0000000BSSI-2XBR;
	Fri, 14 Nov 2025 03:16:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkI3-0000000BSRL-0uHG
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 03:16:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-34182b1c64bso1010919a91.3
        for <opensbi@lists.infradead.org>; Thu, 13 Nov 2025 19:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763090158; x=1763694958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGENBtMHnVK7UILjWxMrQgjPWugjVCrhxv+7cKHGqc4=;
        b=O91q4X9TOEdcyLxBiLaRJNZPj/d5QrVMgs/6yd25GIp2WpwinXnqkcqWJI0u8fuJ4F
         v5L8jt6SizBAW99eCkJbexJJJkow+QTxHgpfvE+eS2GI0WGTUPndQW1+IWAYz9IlVRS7
         zASgCxtWvZQp2lkJOlVkh5cdVaG8q2f4MBBMfoWu0Hx91/x7ukbOREObvTnbe3nMTrJw
         Z4TiYt80lUBsKjecIhPtXwOd6R6e/OROpjekV38hZse9/crKoTdk6wI+2oRSSSe9jr3y
         MCnRksyK9hf1djRdAU9DAw/axLjliThH61q+koy+20gaIJhsQMDKOh8f7aWr9aiTFnkx
         NmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763090158; x=1763694958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WGENBtMHnVK7UILjWxMrQgjPWugjVCrhxv+7cKHGqc4=;
        b=wIC6Y84oHeEMTrWPOzqNeYPMyo3KZ1uwt5R31f4oy8C1lB6OyQa6NScWWJB4vUg/Uw
         GRkHp08uhZzjXxDLBi5PT1l59a5QIjN/Fx4uEU6mbZka+MjXP0561bsIkZdFK3zAqCj4
         icr83eVUe3zbsj67pjClZosPsaXzkAHRDRAtSonxOJWAdvJcJ8cIGcADRW9nzqP/N+7r
         g/Ezv5kJ9EkprUr73CTHxz2SN134aik+u10ktQBeCQlPtSiz3CAHcaavbj4B3ywpvSsa
         1oByKlgZU6n69QfVPIrlSe+0B4JIboW/Y7PB4qqQssLIrEEYSYISiNUw+y/7vMGPE1oo
         TzPg==
X-Gm-Message-State: AOJu0YxY+6BV0LziHOCbKgMqTjRYIdnUOztaR9FCCXAfiEwobvD8GM0A
	XxJoHad0jKEN/JIgwF/bdaQdbsk0qT+ALzaXP/2p7LsylwziDGMNrpc6fVu+DyXds2J+LhL7sgS
	BDErY1I0yCXL6zNFowaQUcrDwqDuQCkKc2GiXBlQakReNx8RVpEx0tWOM+ro1ES+SgN4QpieX6f
	kQgrSwPcLfhRCqzuqqrhSi9KKgR8E03ORYd4EuG9+GS3dlFg==
X-Gm-Gg: ASbGncuYaNDUsU9ThYHr1+iJ7F0gJwO2yz2pKxA4QjY1XgHhelE8oSkoR9YWxRJE6Pi
	YRsqqbHw/zS+3LgUOkCWKSa1p7qvEgB/q7j5OITej01comKz0PJUwXBQMR/V+S+rRgBs3Lx+K1o
	9r7r1a4nF5IQaPkVrq0pA1y3cvRBCDZcJRtcPyS7AbA4mnRTKpxdOfhX7lvngIdwAzkLq4KJWQE
	jrmT/H1MzOGs7BFTKEa335TuRlPTjKWrIyuuuiOav3mQs7SdMi986f87/mPczQjCpvOoD0Z2Ypc
	JzjAHdWNrqjYVjSxvXXeNnCKO+RTtJyZTUsToa3stNxYyCfS8t4RD0O6gufOw9fnDpfhGgr2bnx
	n30MR+S13tGGoZK6GZduHKOyRTviTF/VaCiZc2xPy7P8nCTJTEKJ3j+xw0s08PKQ5q12rrnebvQ
	==
X-Google-Smtp-Source: AGHT+IH/koH3RlyjGJIdeJP91ZRLgDZeqH7KJkEPuFKEr3ekPLbxQdsK/6SsZeG56l5X8vLdl3Fgcg==
X-Received: by 2002:a17:90b:1d43:b0:340:bfcd:6af8 with SMTP id 98e67ed59e1d1-343f9e906d0mr1664130a91.4.1763090158051;
        Thu, 13 Nov 2025 19:15:58 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db22439sm3538606a12.4.2025.11.13.19.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:15:57 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 14 Nov 2025 11:22:46 +0800
Subject: [PATCH 2/3] lib: utils/cache: Add SiFive PL2 controller
MIME-Version: 1.0
Message-Id: <20251114-sifive-cache-drivers-v1-2-8423a721924c@sifive.com>
References: <20251114-sifive-cache-drivers-v1-0-8423a721924c@sifive.com>
In-Reply-To: <20251114-sifive-cache-drivers-v1-0-8423a721924c@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, Eric Lin <eric.lin@sifive.com>, 
 Zong Li <zong.li@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_191559_270122_B3AD9AC3 
X-CRM114-Status: GOOD (  16.61  )
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

SiFive Private L2(PL2) cache is a private cache owned by each hart. Add
this driver to support private cache flush operations via the MMIO
registers.

Co-developed-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 lib/utils/cache/Kconfig            |   4 ++
 lib/utils/cache/fdt_sifive_pl2.c   | 139 +++++++++++++++++++++++++++++++++++++
 lib/utils/cache/objects.mk         |   3 +
 platform/generic/configs/defconfig |   1 +
 4 files changed, 147 insertions(+)

diff --git a/lib/utils/cache/Kconfig b/lib/utils/cache/Kconfig
index 1c7abdc9ad93319569807b4e25623cac871c6ce3..e28262fa2e81328460c8ee9a34b841454d03d776 100644
--- a/lib/utils/cache/Kconfig
+++ b/lib/utils/cache/Kconfig
@@ -14,6 +14,10 @@ config FDT_CACHE_SIFIVE_CCACHE
 	bool "SiFive CCACHE FDT cache driver"
 	default n
 
+config FDT_CACHE_SIFIVE_PL2
+	bool "SiFive PL2 FDT cache driver"
+	default n
+
 endif
 
 config CACHE
diff --git a/lib/utils/cache/fdt_sifive_pl2.c b/lib/utils/cache/fdt_sifive_pl2.c
new file mode 100644
index 0000000000000000000000000000000000000000..afe5d6796dbf3504604642643b49cbb4ccc858c6
--- /dev/null
+++ b/lib/utils/cache/fdt_sifive_pl2.c
@@ -0,0 +1,139 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/cache/fdt_cache.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+
+#define FLUSH64_CMD_TARGET_ALL		(0x2 << 3)
+#define FLUSH64_CMD_TYPE_FLUSH		0x3ULL
+
+#define SIFIVE_PL2CACHE_CMD_QLEN	0xff
+
+#define SIFIVE_PL2CACHE_FLUSH64_OFF	0x200ULL
+#define SIFIVE_PL2CACHE_STATUS_OFF	0x208ULL
+#define SIFIVE_PL2CACHE_CONFIG1_OFF	0x1000ULL
+#define SIFIVE_PL2CACHE_CONFIG0_OFF	0x1008ULL
+
+#define FLUSH64_CMD_POS			56
+#define REGIONCLOCKDISABLE_MASK		BIT(3)
+
+#define CONFIG0_ACCEPT_DIRTY_DATA_ENABLE	BIT(24)
+
+struct sifive_pl2_quirks {
+	bool no_dirty_fill;
+};
+
+struct sifive_pl2 {
+	struct cache_device dev;
+	void *addr;
+	bool no_dirty_fill;
+};
+
+#define to_pl2(_dev) container_of(_dev, struct sifive_pl2, dev)
+
+static int sifive_pl2_flush_all(struct cache_device *dev)
+{
+	struct sifive_pl2 *pl2_dev = to_pl2(dev);
+	char *addr = pl2_dev->addr;
+	u64 cmd = (FLUSH64_CMD_TARGET_ALL | FLUSH64_CMD_TYPE_FLUSH) << FLUSH64_CMD_POS;
+	u32 config0;
+
+	/*
+	 * While flushing pl2 cache, a speculative load might causes a dirty line pull into PL2. It
+	 * will cause the SiFive SMC0 refuse to enter the power gating. Disable the
+	 * ACCEPT_DIRTY_DATA_ENABLE to avoid the issue.
+	 */
+	if (pl2_dev->no_dirty_fill) {
+		config0 = readl((void *)addr + SIFIVE_PL2CACHE_CONFIG0_OFF);
+		config0 &= ~CONFIG0_ACCEPT_DIRTY_DATA_ENABLE;
+		writel(config0, (void *)addr + SIFIVE_PL2CACHE_CONFIG0_OFF);
+	}
+
+#if __riscv_xlen != 32
+	writeq(cmd, addr + SIFIVE_PL2CACHE_FLUSH64_OFF);
+#else
+	writel((u32)cmd, addr + SIFIVE_PL2CACHE_FLUSH64_OFF);
+	writel((u32)cmd >> 32, addr + SIFIVE_PL2CACHE_FLUSH64_OFF + sizeof(u32));
+#endif
+	do {} while (readl(addr + SIFIVE_PL2CACHE_STATUS_OFF) & SIFIVE_PL2CACHE_CMD_QLEN);
+
+	return 0;
+}
+
+static int sifive_pl2_warm_init(struct cache_device *dev)
+{
+	struct sifive_pl2 *pl2_dev = to_pl2(dev);
+	char *addr = pl2_dev->addr;
+	u32 val;
+
+	/* Enabling the clock gating */
+	val = readl(addr + SIFIVE_PL2CACHE_CONFIG1_OFF);
+	val &= (~REGIONCLOCKDISABLE_MASK);
+	writel(val, addr + SIFIVE_PL2CACHE_CONFIG1_OFF);
+
+	return 0;
+}
+
+static struct cache_ops sifive_pl2_ops = {
+	.warm_init = sifive_pl2_warm_init,
+	.cache_flush_all = sifive_pl2_flush_all,
+};
+
+static int sifive_pl2_cold_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	const struct sifive_pl2_quirks *quirk = match->data;
+	struct sifive_pl2 *pl2_dev;
+	struct cache_device *dev;
+	u64 reg_addr;
+	int rc;
+
+	/* find the pl2 control base address */
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, NULL);
+	if (rc < 0 && reg_addr)
+		return SBI_ENODEV;
+
+	pl2_dev = sbi_zalloc(sizeof(*pl2_dev));
+	if (!pl2_dev)
+		return SBI_ENOMEM;
+
+	dev = &pl2_dev->dev;
+	dev->ops = &sifive_pl2_ops;
+	dev->cpu_private = true;
+
+	rc = fdt_cache_add(fdt, nodeoff, dev);
+	if (rc)
+		return rc;
+
+	pl2_dev->addr = (void *)(uintptr_t)reg_addr;
+	if (quirk)
+		pl2_dev->no_dirty_fill = quirk->no_dirty_fill;
+
+	return 0;
+}
+
+static const struct sifive_pl2_quirks pl2cache2_quirks = {
+	.no_dirty_fill = true,
+};
+
+static const struct sifive_pl2_quirks pl2cache0_quirks = {
+	.no_dirty_fill = false,
+};
+
+static const struct fdt_match sifive_pl2_match[] = {
+	{ .compatible = "sifive,pl2cache2", .data = &pl2cache2_quirks },
+	{ .compatible = "sifive,pl2cache1", .data = &pl2cache0_quirks },
+	{ .compatible = "sifive,pl2cache0", .data = &pl2cache0_quirks },
+	{},
+};
+
+struct fdt_driver fdt_sifive_pl2 = {
+	.match_table = sifive_pl2_match,
+	.init = sifive_pl2_cold_init,
+};
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
index 6829a966784732127d93180b3eb46ed24de5bc7d..37d250d1001bc647e3ae05304b2278e5dc608cae 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -11,4 +11,7 @@ libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cmo_helper.o
 carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += fdt_sifive_ccache
 libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += cache/fdt_sifive_ccache.o
 
+carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_PL2) += fdt_sifive_pl2
+libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_PL2) += cache/fdt_sifive_pl2.o
+
 libsbiutils-objs-$(CONFIG_CACHE) += cache/cache.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 3896b0e03268ad3520a3d1586b652e38c0b54ceb..1bb14c78b9f0fc98493961023703a1ed2a24eea8 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -13,6 +13,7 @@ CONFIG_PLATFORM_MIPS_P8700=y
 CONFIG_PLATFORM_SPACEMIT_K1=y
 CONFIG_FDT_CACHE=y
 CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
+CONFIG_FDT_CACHE_SIFIVE_PL2=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
