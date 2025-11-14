Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F16DCDB481
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 03:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rfr1xsjjoWusiHuXaRrtpQDVA+QMxOO0CryoyuKQU1U=; b=TwU3WHtYuoJ+Gt
	rADlcjKy2tXjWAjeCSAMHWgbsjQ1w9HS6/ggRXiW42qtuX7ktuhLl9e5mAl9QB3bCg8nh6SuH+zcC
	U0TjxdR2CCUjyaAsGDGoW+n95aX4HINS0jiNH+cjg89ZU+wpkPxfXHAzZ4Y7O3lC327VJ30MNwvSP
	o7JpnPN2wV3m2GvUzGGeHsT2J1IUcTzLNF00sRgnt/JKMAqXZK0GiIMi3vCfvfPzbbQH+R3RvPNhS
	7S8Qk2CWlIGp/If3mDkz+ZMbnTyZGNuKygJTdQlHBSKVkpKT6tu12YztGZRnxpnmACKLyvwbJOz0k
	UfINCh6IVngPfI67ojAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkI6-0000000BSTE-3kv9;
	Fri, 14 Nov 2025 03:16:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkI4-0000000BSS0-4APF
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 03:16:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-298145fe27eso18021115ad.1
        for <opensbi@lists.infradead.org>; Thu, 13 Nov 2025 19:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763090160; x=1763694960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMOuix+rS4eKrmwFe0r+yaAb80VSOUj79bI1aRjBNl8=;
        b=JLtKS1UeaILg2z1ipj+oR8VztT02FKgkbVRcneM8+EStwE3uBu7VyyloNA9S3BsDmV
         NcSmF6HlftoGCogD0A2g6Wzi86c2qBwFgk7bqf4JWAoWkWALckaeG8uE8V7kI5pmw1ul
         z0Li/iDbAoPWlZ+nOhLuA7ClAKWkgkc8wJyQQL+hZBr8KrUREliaMVg8JY3EcCL/p+J/
         KFFY3JQJ8wLVytUQurfiMtIqTjjMh7hVDviIRrhW53X4huEjuaIxSEsZ/T/3Dbgkw1rS
         yMs6WWBt4G0YeUAyFTp6rZY3GAHLNVWO5DFKbyeWUQ88UuVkXTsx48HsLR0yQA+YYmw9
         atXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763090160; x=1763694960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lMOuix+rS4eKrmwFe0r+yaAb80VSOUj79bI1aRjBNl8=;
        b=vgy2fa8q1in9y1noObXl2U5ln1yT9E05cpE5FaFpaNOzuFhEdY+ERJ2rjXggRJg1WS
         Znw6m2ww/1JCG16uZssr7qinPb6760ZZ2jG+sRDlQq6XgarIk0GW2ZTbiIt6wwLQhl8u
         gIjP9nX+CY6ce7YxFVMmcOaUpIRPLD8jr6244jBseD6vHkl40mkg7FiK6EYSfiAoG38p
         Rbx46IsJ2C4/1ctuW6yx+unzz2XKXKwiCVB0u9cZXmnz7GTDhyR455YYlrCPi7hCrQ5i
         Ok7CWhEYYESAyvGDCzINa2xQdyVcc53qwroy0wWLdCgo1ZumBiLBZz04WP7kfRXifojJ
         77Yg==
X-Gm-Message-State: AOJu0Yz2L8i51YoNdDtzW1lOLhxIIZm4oaWNfoyCtM26Yy726E25fNXe
	rReuNJh0AvpEn4wI4tCkIpD3hlN03Gf+auX8pLBQ5AALC/qMUXVA2DnHFfEqHe1FseESiZqRdpW
	ibVwSri5DKWz4bFg2GAyUxzS4Is2v+H9sPddB6Sj0RFlmuE5uqhPpuSdd06tbRt/xuEH8jDbk9W
	FkbxRwGi8K7tjy3XbKYaoJIzBoqnwYVgvyEt8l5DVDvx7pWQ==
X-Gm-Gg: ASbGncvk6+qn/3raUl5Km/oLNCc3rhehj0gh2oZlL2TuNlVmGB5ZRvlk+rTV85wPZAy
	aRDo9BAtSAptYBAnFmc15oSETOUC+MsHORCfsZWy/hMbbpgL1jBFbKKmx3SMEg2H41qIlzOid0M
	Q15jVJbKr5JijX7ngjYZB0WqZ73uEyYy58InjuJn9rx9aGBzL2ugtuFpATu/4davInW1IO73yYL
	IXkMVu+mTf3ouzjz5Q4Nm8qAX2LM79ZfuHMSc00c7t/NxOQvsH8nRX/dk2VnlH2RSPRbjcmjT2K
	LVeGTfsrhNqMGyNa8zPjFwB40HrenGhxhcOq9OB5mukBL5ZRaEQLjPNfCMyUyQ2vtXpBCWhgUTQ
	U9NrfZ8dbbizVhqv5qCN/rbcMksYK3G8uv75p6JDbGI0YrzU+Mc1Alb4l9TY2YNLfKIqbfI7agw
	==
X-Google-Smtp-Source: AGHT+IH4zPQy3pdLtvoqvkZH3+Fns8gxb60W2hDNoI1DY9xDDWML/lNfTzHUdIOP+R6d5K0zayyUAw==
X-Received: by 2002:a17:902:f602:b0:298:5736:de9b with SMTP id d9443c01a7336-2986a7668f6mr14616385ad.50.1763090159884;
        Thu, 13 Nov 2025 19:15:59 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db22439sm3538606a12.4.2025.11.13.19.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:15:59 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 14 Nov 2025 11:22:47 +0800
Subject: [PATCH 3/3] lib: utils/cache: Add SiFive Extensible Cache (EC)
 driver
MIME-Version: 1.0
Message-Id: <20251114-sifive-cache-drivers-v1-3-8423a721924c@sifive.com>
References: <20251114-sifive-cache-drivers-v1-0-8423a721924c@sifive.com>
In-Reply-To: <20251114-sifive-cache-drivers-v1-0-8423a721924c@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_191601_041546_3F0F4E62 
X-CRM114-Status: GOOD (  18.54  )
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

Add support for SiFive Extensible Cache (EC) controller with multi-slice
architecture. The driver implements cache maintenance operations through
MMIO register interface.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Co-developed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 lib/utils/cache/Kconfig            |   4 +
 lib/utils/cache/fdt_sifive_ec.c    | 194 +++++++++++++++++++++++++++++++++++++
 lib/utils/cache/objects.mk         |   3 +
 platform/generic/configs/defconfig |   1 +
 4 files changed, 202 insertions(+)

diff --git a/lib/utils/cache/Kconfig b/lib/utils/cache/Kconfig
index e28262fa2e81328460c8ee9a34b841454d03d776..be7d57c37d2477e60fb793d42bd6cf2cd830b846 100644
--- a/lib/utils/cache/Kconfig
+++ b/lib/utils/cache/Kconfig
@@ -14,6 +14,10 @@ config FDT_CACHE_SIFIVE_CCACHE
 	bool "SiFive CCACHE FDT cache driver"
 	default n
 
+config FDT_CACHE_SIFIVE_EC
+	bool "SiFive EC FDT cache driver"
+	default n
+
 config FDT_CACHE_SIFIVE_PL2
 	bool "SiFive PL2 FDT cache driver"
 	default n
diff --git a/lib/utils/cache/fdt_sifive_ec.c b/lib/utils/cache/fdt_sifive_ec.c
new file mode 100644
index 0000000000000000000000000000000000000000..53ef6edb24aee316652cbaf83fd34c7c159aba59
--- /dev/null
+++ b/lib/utils/cache/fdt_sifive_ec.c
@@ -0,0 +1,194 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_platform.h>
+#include <sbi_utils/cache/fdt_cache.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+
+#define SIFIVE_EC_FEATURE_DISABLE_OFF	0x100UL
+#define SIFIVE_EC_FLUSH_CMD_OFF		0x800UL
+#define SIFIVE_EC_FLUSH_STATUS_OFF	0x808UL
+#define SIFIVE_EC_FLUSH_ADDR_OFF	0x810UL
+#define SIFIVE_EC_MODE_CTRL		0xa00UL
+
+#define SIFIVE_EC_FLUSH_COMPLETION_MASK	BIT(0)
+
+#define SIFIVE_EC_CLEANINV_ALL_CMD	0x3
+
+#define SIFIVE_EC_FEATURE_DISABLE_VAL	0
+
+struct sifive_ec_quirks {
+	bool two_mode;
+	char *reg_name;
+};
+
+struct sifive_ec_slice {
+	void *addr;
+	bool last_slice;
+};
+
+struct sifive_ec {
+	struct cache_device dev;
+	struct sifive_ec_slice *slices;
+};
+
+#define to_ec(_dev) container_of(_dev, struct sifive_ec, dev)
+
+static int sifive_ec_flush_all(struct cache_device *dev)
+{
+	struct sifive_ec *ec_dev = to_ec(dev);
+	struct sifive_ec_slice *slices = ec_dev->slices;
+	u32 cmd = SIFIVE_EC_CLEANINV_ALL_CMD, i = 0;
+	void *addr;
+
+	do {
+		addr = slices[i].addr;
+
+		writel((int)-1, addr + SIFIVE_EC_FLUSH_ADDR_OFF);
+		writel((int)-1, addr + SIFIVE_EC_FLUSH_ADDR_OFF + sizeof(u32));
+		writel(cmd, addr + SIFIVE_EC_FLUSH_CMD_OFF);
+	} while (!slices[i++].last_slice);
+
+	i = 0;
+	do {
+		addr = slices[i].addr;
+		do {} while (!(readl(addr + SIFIVE_EC_FLUSH_STATUS_OFF) &
+				SIFIVE_EC_FLUSH_COMPLETION_MASK));
+	} while (!slices[i++].last_slice);
+
+	return 0;
+}
+
+int sifive_ec_warm_init(struct cache_device *dev)
+{
+	struct sifive_ec *ec_dev = to_ec(dev);
+	struct sifive_ec_slice *slices = ec_dev->slices;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	int i = 0;
+
+	if (dom->boot_hartid == current_hartid()) {
+		do {
+			writel(SIFIVE_EC_FEATURE_DISABLE_VAL,
+			       slices[i].addr + SIFIVE_EC_FEATURE_DISABLE_OFF);
+		} while (!slices[i++].last_slice);
+	}
+
+	return SBI_OK;
+}
+
+static struct cache_ops sifive_ec_ops = {
+	.warm_init = sifive_ec_warm_init,
+	.cache_flush_all = sifive_ec_flush_all,
+};
+
+static int sifive_ec_slices_cold_init(const void *fdt, int nodeoff, struct sifive_ec_slice *slices,
+				      const struct sifive_ec_quirks *quirks)
+{
+	int rc, subnode, slice_idx = -1;
+	u64 reg_addr, size, start_addr = -1, end_addr = 0;
+
+	fdt_for_each_subnode(subnode, fdt, nodeoff) {
+		rc = fdt_get_node_addr_size_by_name(fdt, subnode, quirks->reg_name, &reg_addr,
+						    &size);
+		if (rc < 0)
+			return SBI_ENODEV;
+
+		if (reg_addr < start_addr)
+			start_addr = reg_addr;
+
+		if (reg_addr + size > end_addr)
+			end_addr = reg_addr + size;
+
+		slices[++slice_idx].addr = (void *)(uintptr_t)reg_addr;
+	}
+	slices[slice_idx].last_slice = true;
+
+	/* Only enable the pmp to protect the EC m-mode region when it support two mode */
+	if (quirks->two_mode) {
+		rc = sbi_domain_root_add_memrange((unsigned long)start_addr,
+						  (unsigned long)(end_addr - start_addr),
+						  BIT(12),
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+	}
+
+	return SBI_OK;
+}
+
+static int sifive_ec_cold_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	const struct sifive_ec_quirks *quirks = match->data;
+	struct sifive_ec_slice *slices;
+	struct sifive_ec *ec_dev;
+	struct cache_device *dev;
+	int subnode, rc = SBI_ENOMEM;
+	u32 slice_count = 0;
+
+	/* Count the number of slices */
+	fdt_for_each_subnode(subnode, fdt, nodeoff)
+		slice_count++;
+
+	/* Need at least one slice */
+	if (!slice_count)
+		return SBI_EINVAL;
+
+	ec_dev = sbi_zalloc(sizeof(*ec_dev));
+	if (!ec_dev)
+		return SBI_ENOMEM;
+
+	slices = sbi_zalloc(slice_count * sizeof(*slices));
+	if (!slices)
+		goto free_ec;
+
+	rc = sifive_ec_slices_cold_init(fdt, nodeoff, slices, quirks);
+	if (rc)
+		goto free_slice;
+
+	dev = &ec_dev->dev;
+	dev->ops = &sifive_ec_ops;
+	rc = fdt_cache_add(fdt, nodeoff, dev);
+	if (rc)
+		goto free_slice;
+
+	ec_dev->slices = slices;
+
+	return SBI_OK;
+
+free_slice:
+	sbi_free(slices);
+free_ec:
+	sbi_free(ec_dev);
+	return rc;
+}
+
+static const struct sifive_ec_quirks sifive_extensiblecache0_quirks = {
+	.two_mode = false,
+	.reg_name = "control",
+};
+
+static const struct sifive_ec_quirks sifive_extensiblecache4_quirks = {
+	.two_mode = true,
+	.reg_name = "m_mode",
+};
+
+static const struct fdt_match sifive_ec_match[] = {
+	{ .compatible = "sifive,extensiblecache4", .data = &sifive_extensiblecache4_quirks },
+	{ .compatible = "sifive,extensiblecache3", .data = &sifive_extensiblecache0_quirks },
+	{ .compatible = "sifive,extensiblecache2", .data = &sifive_extensiblecache0_quirks },
+	{ .compatible = "sifive,extensiblecache0", .data = &sifive_extensiblecache0_quirks },
+	{},
+};
+
+struct fdt_driver fdt_sifive_ec = {
+	.match_table = sifive_ec_match,
+	.init = sifive_ec_cold_init,
+};
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
index 37d250d1001bc647e3ae05304b2278e5dc608cae..aa76adc2e3bc5efbaa32b4ead9849d8b62bb7747 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -14,4 +14,7 @@ libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += cache/fdt_sifive_ccache.o
 carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_PL2) += fdt_sifive_pl2
 libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_PL2) += cache/fdt_sifive_pl2.o
 
+carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_EC) += fdt_sifive_ec
+libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_EC) += cache/fdt_sifive_ec.o
+
 libsbiutils-objs-$(CONFIG_CACHE) += cache/cache.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 1bb14c78b9f0fc98493961023703a1ed2a24eea8..d0e2ec26bd60ad9394f631dd4d2870f5f2b90fd0 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -13,6 +13,7 @@ CONFIG_PLATFORM_MIPS_P8700=y
 CONFIG_PLATFORM_SPACEMIT_K1=y
 CONFIG_FDT_CACHE=y
 CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
+CONFIG_FDT_CACHE_SIFIVE_EC=y
 CONFIG_FDT_CACHE_SIFIVE_PL2=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
