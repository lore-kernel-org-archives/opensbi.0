Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0886CD6E45
	for <opensbi@archiver.kernel.org>; Fri, 29 May 2026 08:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+MPvdyV0ioQ7UZMZLC+8gBgdkAQ/XzxDCZAg8UwGXUw=; b=FaGPOu9jmlkqO3
	fIgrP6S9SAFEwKQIEFe0Ge6ZxAweYIlxYFJBW9+4lajhH0tKp2TfrrjLLoeRPlN1dKY1BzT3Y0Jqu
	ZQqG3ZrZSnCa2I/8hlMdu48DfTK9/0QCHbIX4OIFCm+1hRfSArZV8RB1R2cxpXgBIIlbwH6FEawID
	zftO+FYG51ZVz+9WRMlh3BxfB8IbjXx/uIn0roGXo7eqZXMp84aGrwzUKuZVm8/33YnjG+aVKHXRB
	3XrOWbB5FzjlxKuegT1RjHe1AODu3InnQEVDnLaakEYuIM6NeM//Sg2EI1JYgWaMZd28HlLiqTP0r
	yfgEl3grtwmv2OeFBosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsxf-000000070qP-0f4u;
	Fri, 29 May 2026 08:52:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsxb-000000070pn-2o8v
	for opensbi@lists.infradead.org;
	Fri, 29 May 2026 08:52:57 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36ad15213fbso3209176a91.0
        for <opensbi@lists.infradead.org>; Fri, 29 May 2026 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780044775; x=1780649575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7nzxHGr/4cPhzp5A/edIkU6UOIj/x0zvCpSPVbkuve8=;
        b=f58dn1BpJRxeHE9U2DVgSGPkxb+dbgnvoprM1+QhMB/x6prP2F54atbICyM2GS2GrW
         Ami1UiRMEFCjB+9CWcdqNIIdSu42I1mDhwo5KvSyinHgts8LyR4DkXjWbOyCaKy8Us3g
         GcJF4jYFh9ibK3NhIbgML440+Tm1hK5i3jQZLk67JDHayy3zgqS/eIY2ZC/eK12gxq7s
         1uqGTeQNu3BJVFbPqyJc8S2MPLkMOG9RO4hWgD4UlcUaBY3dBAtfeTAwhTUEga/HY2n0
         B+mwKglI4t4/cCIxk0iAQRlOfdjXn7+Jnrtzr6/s3/Tb79OO3zh9nUT3URUhtx8kOl5+
         Z77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044775; x=1780649575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nzxHGr/4cPhzp5A/edIkU6UOIj/x0zvCpSPVbkuve8=;
        b=GpW1WjHT84MUYSip8fXFjc4kaw5FhPXh/b4wP/UWm73Aan4ScCgf+U8z0CMCe42yM/
         9lHt08iMJwn0yGxyL62sCBp+Dc+5/i+fyHAwRkFD0DTViDxpFRhacyIAE9Qm6mrnIhrd
         S6NFvIUIlbJYx8/zF+Nt3+0nIB+cNIIn2yiXRE6IRBXk9/dPhtyrKC5xi3TorYipBwLe
         oPLS8mFlfLFu8YMczgQnkZS7LqLi1kwcjGNa+O7sAT3mw2IGjII2LV3Bgxfa6nIr1YGO
         BJj5E28yqcBz/7WOyz07zHx9uJyNvFGunnvpZ+ZZ8N4eFFkCsG3EGK+tYtOVqNfO9QxK
         GLhg==
X-Gm-Message-State: AOJu0YzzywooCel3pNOMoRIJoyf32xyZJ92p59YxbqqCQJk70I+9K40F
	77X0R1fTIAgdZ69u7JC79GEupDTS9s6gBN2vLuZoKaUn58z2w8Jd8goWdSebHVsr
X-Gm-Gg: Acq92OGQ2KpEjb760gNGvhNzeFsTeJq/Ez0jZL75f2HyTCyM+n2G8rZFZh5fYdfJ17y
	3QCIuTGoL4VVeBEA5Mr8QgVDLJ+HJiDOCGMa2UUuSocyZFCn/ytg6drVG4R0y9gMPyTZRQJ5O2b
	Mg0YkGrj56+dgyKc8c2i6SeMn3uEA7cfojiQVC10iOQ/0xsWx36RBsLPJGldHrAw2sG/U5m+650
	FuTau66adkLCpKxeYBsd7pnLlaRr0ixw7X1JDvME+aPCM7aqSVDWLZFrmR+wQJfWFHkjRrLugY4
	v/SBzoedogNEcq40ArsA7BR4kvXP2Hyllfcpi9sK0KqYtCsMuCYjPkjlKRTY4gQjPmP2qBK1RHe
	Dsl0Q3awwA4INJYfHzlUNCy+QfqiCL7SC7yC4QEVA9N8AEMrbOPliX72aWzu2fUniCccjEQBVpn
	CYoDtseN4WWMshU1/grmanOw9N5ogWWFtpy2P5C+lxMR3p
X-Received: by 2002:a17:90b:17c9:b0:36b:9184:ea49 with SMTP id 98e67ed59e1d1-36bbd13ac3cmr2269620a91.26.1780044774693;
        Fri, 29 May 2026 01:52:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbe150323sm854950a91.4.2026.05.29.01.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:52:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: opensbi@lists.infradead.org,
	"Gabriel L . Somlo" <gsomlo@gmail.com>,
	florent@enjoy-digital.fr
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: [PATCH] lib: utils/reset: Add litex SoC reset driver
Date: Fri, 29 May 2026 16:52:32 +0800
Message-ID: <20260529085234.1682842-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_015255_710917_84D7EE5F 
X-CRM114-Status: GOOD (  16.13  )
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

Litex SoC controller supports reboot function by toggling the first
bit of the ctrl register. Add a reset driver so other software can
use it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 lib/utils/reset/Kconfig            |  5 +++
 lib/utils/reset/fdt_reset_litex.c  | 66 ++++++++++++++++++++++++++++++
 lib/utils/reset/objects.mk         |  3 ++
 platform/generic/configs/defconfig |  1 +
 4 files changed, 75 insertions(+)
 create mode 100644 lib/utils/reset/fdt_reset_litex.c

diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index f98926e5..b2ac120e 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -24,6 +24,11 @@ config FDT_RESET_HTIF
 	select SYS_HTIF
 	default n

+config FDT_RESET_LITEX
+	bool "LITEX SoC reset driver"
+	depends on FDT_GPIO
+	default n
+
 config FDT_RESET_RPMI
 	bool "RPMI FDT reset driver"
 	depends on FDT_MAILBOX && RPMI_MAILBOX
diff --git a/lib/utils/reset/fdt_reset_litex.c b/lib/utils/reset/fdt_reset_litex.c
new file mode 100644
index 00000000..287745f0
--- /dev/null
+++ b/lib/utils/reset/fdt_reset_litex.c
@@ -0,0 +1,66 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+#define RESET_CTRL			0x0
+
+static volatile u32 *litex_soc_base;
+
+static int litex_reset_check(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		return 255;
+	}
+
+	return 0;
+}
+
+static void litex_do_reset(u32 type, u32 reason)
+{
+	writel_relaxed(0x1, litex_soc_base + RESET_CTRL);
+}
+
+static struct sbi_system_reset_device litex_reset = {
+	.name = "litex-reset",
+	.system_reset_check = litex_reset_check,
+	.system_reset = litex_do_reset
+};
+
+static int litex_reset_init(const void *fdt, int nodeoff,
+			    const struct fdt_match *match)
+{
+	uint64_t reg_addr;
+	int rc;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, NULL);
+	if (rc < 0 || !reg_addr)
+		return SBI_ENODEV;
+
+
+	litex_soc_base = (volatile u32 *)(unsigned long)reg_addr;
+
+	sbi_system_reset_add_device(&litex_reset);
+
+	return 0;
+}
+
+static const struct fdt_match litex_reset_match[] = {
+	{ .compatible = "litex,soc-controller" },
+	{ },
+};
+
+const struct fdt_driver fdt_reset_litex = {
+	.match_table = litex_reset_match,
+	.init = litex_reset_init,
+};
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index 3c681c27..38b4e306 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -17,6 +17,9 @@ libsbiutils-objs-$(CONFIG_FDT_RESET_GPIO) += reset/fdt_reset_gpio.o
 carray-fdt_early_drivers-$(CONFIG_FDT_RESET_HTIF) += fdt_reset_htif
 libsbiutils-objs-$(CONFIG_FDT_RESET_HTIF) += reset/fdt_reset_htif.o

+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_LITEX) += fdt_reset_litex
+libsbiutils-objs-$(CONFIG_FDT_RESET_LITEX) += reset/fdt_reset_litex.o
+
 carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += fdt_reset_sg2042_mcu
 libsbiutils-objs-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += reset/fdt_reset_sg2042_hwmon_mcu.o

diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 818b71f4..969639e3 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -49,6 +49,7 @@ CONFIG_FDT_REGMAP_SYSCON=y
 CONFIG_FDT_RESET=y
 CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
+CONFIG_FDT_RESET_LITEX=y
 CONFIG_FDT_RESET_HTIF=y
 CONFIG_FDT_RESET_RPMI=y
 CONFIG_FDT_RESET_SG2042_HWMON_MCU=y
--
2.54.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
