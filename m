Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C38C71135
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 05:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rFcIPp0LoEJZ7QMoHq9gxItMGXgw9E3V42mKckQimAQ=; b=Iax
	uLpyQ8igDOoiqK5ZASl8kE1e6EX51aT4vGJR0hPXy+IsJ+i2tTL58nv4axYkzRF3xt0FxMwHuYYCA
	XYKBhcOssFDdC+MAIZFTvLBgPlLZu/hZDnHl253qerHJ4z4pzfRRhDI4sIxtZXqVQavLpSyRbyaT9
	CFiOs/xtIUiudanbEpqgIS7Z4uwxD9bQPflD7qFVw4eKu/Q76vb9SKOMsogQdz8qgw4etwuvE1W6t
	5S5+eEOEC+A5GifQJ/CiN4Oo75kCdXrgRIgyxnq73CSZgV4ygFBJ5QmgdgX8ASbEKOA5l9jPnWdwn
	BeIuXMnR6XgdTetsj5hZbpdR8BNjE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2qt-00000003Sri-2wG8;
	Mon, 16 Jun 2025 05:57:51 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2pw-00000003SnN-01OL
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 05:56:53 +0000
Received: by mail-oo1-xc41.google.com with SMTP id 006d021491bc7-605fda00c30so2543750eaf.1
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 22:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750053410; x=1750658210; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ILlAt/UYmTtbZVdeMQWMu3oWvvH73NGuyc7AuMxiZyI=;
        b=VAVF5m2vixJ6imEfQMXTSM2Ylu8g8MHDrrbPdzqdGzX3H5VWTXgOqf6DeF74QJ5nbU
         Ian0CUAO4up8xHQGecqQ8S070cKZEH1yQuPk7y3Ek8bamEVKQfilkciRj60REn4VujKA
         P2hoxXbJtaxHXP36dLDMWjKhD/oYom3UfFOwk+qRzHU9rUcJjUWs3rzYmy1rx9boo1bE
         L1JTRYkBqdYpAhuvIH7U7EaE5N7rvL0YBwWQhv8BZkycfqL2knWf67icofSF5/M7afwl
         D1DK6sBM0eotV/wJMp0G+BtVbVXa/bdbdLiWoG8GMOTj8XOLxek22JEQkd6FwcjCiDUD
         GSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750053410; x=1750658210;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILlAt/UYmTtbZVdeMQWMu3oWvvH73NGuyc7AuMxiZyI=;
        b=Lt8bfo9CbZYqfGTV5dsT7wD64XMGmBBS4NZzWRVXu/0RzGuadmqZNiMHwG62+/qbBl
         BKLdf8ewgLda17u/58dPzVLhsskGBKrJXb1g6xgyiM5DuoZ2EXYzugGjeN5nI21DEa9K
         5RiD27rxwazNqYJTa8q3SZIgC7++s5zuzDxdKCvA4tsPnfSLw/HZLNyivJfoeu0HGhA8
         JNjLT3ptFUYzfAL3c2Bn10hq4jv3TT2eYTMdu13O0RV2fCijqyAiS8wtduLJLaY+jGy1
         K0F42PX7HIPGCXOdKPeGxU12lCVPkE72FJZr4Gmg1z/tyiEbF95dg9vsbHRUeGBdp7A1
         5gjQ==
X-Gm-Message-State: AOJu0YyfY4+0NMN9J1W5rVjB6jJkrzjSaOj56XstlWSpmyfklM6KTw6t
	p9HGa0LR8+JBeGLv/U45dOqMffWHWy2BHn2PaTL0tzPD5X/y5g2JbbgPujKtv9qvVX5NRPmCb19
	K+2PKYlj/RzD3BYiovYn2aj5flui2s2a0Jp9Vqrk=
X-Gm-Gg: ASbGnctNcC5gblyA4TVRcXUjqH5Be62du3aE5zj/suHY9KlVwuoRgsEVsVFLHNQgY+e
	cb59LnOH+Djw1InEE0SUVUHf5SbZWd7JrbPR3QjJVB774pcUCb6IbGcX04wZHadjoJsyoXZjglp
	2vg7j/vhVmKNuUilHv1HsQoiETb/uhpmiDu0mvJ7jqVPs=
X-Google-Smtp-Source: AGHT+IHGHZ+dNyLFgrHWd1F9Z4q/WMGHpdaajVglI+SGC1QRhozxn4KBbjUAPKlW34aogyl6d0dTQyjUq6UvdBn3soM=
X-Received: by 2002:a05:6820:1628:b0:60b:ca08:a73c with SMTP id
 006d021491bc7-61110f9a33bmr4865432eaf.6.1750053410562; Sun, 15 Jun 2025
 22:56:50 -0700 (PDT)
MIME-Version: 1.0
From: Neo <neopimail@gmail.com>
Date: Mon, 16 Jun 2025 13:56:38 +0800
X-Gm-Features: AX0GCFt00VKLLLMwhVS2mocfMw7Kni-b4cqaFCN3Q9MNZIpujpgcMr40YiUU67Q
Message-ID: <CAFPVDjSstmSEeF=YLzVrV2mUSAU1UVO4_zu4RyUzgvE1g_awYQ@mail.gmail.com>
Subject: [PATCH] platform: generic: Add support for UltraRISC DP1000 SoC platform
To: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_225652_060301_91B0CC04 
X-CRM114-Status: GOOD (  14.11  )
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

This patch adds initial platform support for the UltraRISC DP1000 SoC
to OpenSBI.

The UltraRISC DP1000 is a multi-core RISC-V 64-bit SoC developed by
UltraRISC Technology (Shanghai) Co., Ltd.

We intend to upstream DP1000 support to align with OpenSBI's mission
of supporting diverse RISC-V platforms and to simplify support for
Linux and U-Boot on UltraRISC hardware.

Signed-off-by: Yi Pei <neopimail@gmail.com>
---
platform/generic/Kconfig | 4 ++++
platform/generic/configs/defconfig | 1 +
platform/generic/ultrarisc/dp1000.c | 17 +++++++++++++++++
platform/generic/ultrarisc/objects.mk | 8 ++++++++
4 files changed, 36 insertions(+)
create mode 100644 platform/generic/ultrarisc/dp1000.c
create mode 100644 platform/generic/ultrarisc/objects.mk
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 688da3f4..54f1674d 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -68,6 +68,10 @@ config PLATFORM_THEAD
select THEAD_C9XX_PMU
default n
+config PLATFORM_ULTRARISC_DP1000
+ bool "UltraRISC DP1000 support"
+ default n
+
source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
diff --git a/platform/generic/configs/defconfig
b/platform/generic/configs/defconfig
index bb260626..717906ef 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -6,6 +6,7 @@ CONFIG_PLATFORM_SIFIVE_FU740=y
CONFIG_PLATFORM_SOPHGO_SG2042=y
CONFIG_PLATFORM_STARFIVE_JH7110=y
CONFIG_PLATFORM_THEAD=y
+CONFIG_PLATFORM_ULTRARISC_DP1000=y
CONFIG_FDT_CPPC=y
CONFIG_FDT_CPPC_RPMI=y
CONFIG_FDT_GPIO=y
diff --git a/platform/generic/ultrarisc/dp1000.c
b/platform/generic/ultrarisc/dp1000.c
new file mode 100644
index 00000000..f21b2875
--- /dev/null
+++ b/platform/generic/ultrarisc/dp1000.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (C) 2025 UltraRISC,Inc
+ */
+
+#include <platform_override.h>
+#include <sbi/sbi_platform.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+static const struct fdt_match ultrarisc_dp1000_match[] = {
+ {.compatible = "ultrarisc,dp1000"},
+ {},
+};
+
+const struct platform_override ultrarisc_dp1000 = {
+ .match_table = ultrarisc_dp1000_match,
+};
diff --git a/platform/generic/ultrarisc/objects.mk
b/platform/generic/ultrarisc/objects.mk
new file mode 100644
index 00000000..71e66f35
--- /dev/null
+++ b/platform/generic/ultrarisc/objects.mk
@@ -0,0 +1,8 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (C) 2025 UltraRISC,Inc
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_ULTRARISC_DP1000)
+= ultrarisc_dp1000
+platform-objs-$(CONFIG_PLATFORM_ULTRARISC_DP1000) += ultrarisc/dp1000.o
-- 
2.34.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
