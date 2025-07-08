Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3455BC83F14
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JuuDOnvTT+K3PAcdztxyhuU2yRJTHs7ugY2kmOAA4rE=; b=NFzYH+Q5TfMmtUnFGhFIcaHfbW
	9TVF7DBID1PeBKfpH9G/8gf1OEjAe16KPjZQHwlJg8G/5ymG/AeO0VZU7UY0ljxRMsbSu7tL6gNak
	MRGb6zqQxc4t49/F2QUkLj0xeFLD3lIxoLWMHgxoYQ8ZolBJRNLwXUL3UvksBs8zl55Oj4JGAElEH
	LjfIlGusif8FfDDEi0DgAKFYDT7UIEH9rh6kuK5OaxKKD+B54v6OQ3z2TLWwRuLFgqzuxvB+apT9D
	IstZT3EaAktFsnYWThAjX1fR3DzrdY6g/VGCEZxYYStAtdY3F5ERa4XVDjL0T7XQIySNIx0AwGkAw
	pCek0P3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3EZ-00000004fPn-0qmm;
	Tue, 08 Jul 2025 07:59:23 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35a-00000004dMF-2c1V
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:07 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7d9e2f85b2cso81227385a.2
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961005; x=1752565805; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tcAvlyTJ4GdgcoPsG3s/6606dLT6OO1c4H7JiiT6RtE=;
        b=Gkyb+NN4Q9y+RDkCwr01QZZJ4SzLXAXkTluNARIU3VNBujmRcrDByKb2oGfaLIbh9G
         7kNFDf9pOvHUnwqBHP4FQIy0kXZfOIO2sQ9TbJCupK9QTHBNjA9q50V+HWmGYDUGhqdA
         lswT1SJX1EX84QN7T/U/AJEFlZR4pWKUHw9rMPn9XzB0XpFwCOQiLo2CfuwApYEbZDMP
         DPgBuIopqdOHBuc5f16uy2B3RZtTT/FUWsRxn/fG72J+IKSF9YJRKl95X3OfToQvpnCX
         p+TgU0dQzmk550ToEiiwFLhF5M2Eh31Z5CcF5HkOqJPY7qRcYRAWLMnYoZs0ddZmzMQi
         xt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961005; x=1752565805;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tcAvlyTJ4GdgcoPsG3s/6606dLT6OO1c4H7JiiT6RtE=;
        b=WhM3f4iOC4hsy+s1zXkE7RJNr2pzr2OFYAG1JXYeL79BawEe9a8C/B5H6Crwxp5VbF
         WM+akxlH0Lri/Hehg+6HTcXL0l9HJj50a1w2dO/lvz8/QD4AEGy9VF0c+HqArPcA0UAX
         CxcETeEG1C3NRCZ32UdjTIbE64Z+ecj/gVOUyFCCVOf2Iy+aLKG0AvRXbIl0XzaNoiOU
         rbgpBxkrYCp9JHvD14MVd4Z0iT+WwzL4Sr6fHtpAn8AfecjVrrNHcNyKjpYFPhFZK/3M
         G9NLwscOfzUc8hlfK9Ohbr8S/xpUlWHohlEC4cg+Mdm7hWgkBtfrRg1j8bBApTPUJqSZ
         26eQ==
X-Gm-Message-State: AOJu0Yw/SrOjervKs0hKeDYTLBCWsivJo/vsIoaDTRtO+0JXUbqd3nYo
	+fa2qg3W8eTaqdO/F3xOl/ymYNIruIsbvOF7u65iC+OSaBIAfyfx70+/cJJdyLB2e1c1IBjyx2N
	ThmnUG42BFZRlJaL5DmabjNVl7BhmHkDVaBjl6xezgsPXtbw2n+/ZouwiuX6jqGOXeajUBYbrlI
	DWxJ006louULhWU7D85LXWjeO9+ZlnggbY1cVQgp3N3I4EwA==
X-Gm-Gg: ASbGncskFYS+e/GgEbJx22B3/sIM8AuTaFcjqo16tL0s8kL0XHqjunplVSokscnBhId
	FxwILnKzvNoa8Wv9hQuporZ9nJJsVnKEevcsddIdrvCPvUzEgC3xsxzGXVbNC6KiPKc4vFj40LE
	b8DtMcXm/suYkN1VJ6gK9R+6MUpP8g3LCjfsX3kr1OU8xoV13J/L9J0J1FEkrqVCkJF8I7ft3Cq
	JTEQ6YO1wTPTqxnUbhvGp2DvgGp7Q9o2CY+FuFKBlA8Dk5q7QQ38B+mGztFDUetG0O+hW8qQclR
	nsjnsvN75pV7c8+JjkAo3dtgPRFmA5mFxDr45vF8dT6qkObPVI3w0/MuhuBU6Iu7awAFXDRaacc
	9EnpGUKhVgURvcQOcTu0=
X-Google-Smtp-Source: AGHT+IG4j9k/vP/2NxV0SGJKL9g1uHSyWUPdrZezENz5LoPOibODdh9YMLoe4jAflF+Ccrupx1tolA==
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id af79cd13be357-7d5dcc7295dmr2139769385a.12.1751961005116;
        Tue, 08 Jul 2025 00:50:05 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:04 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 05/12] platform: generic: Add SiFive development platform
Date: Tue,  8 Jul 2025 15:49:33 +0800
Message-Id: <20250708074940.10904-6-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005006_662307_3EB05CCC 
X-CRM114-Status: GOOD (  16.17  )
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

From: Vincent Chen <vincent.chen@sifive.com>

The sifive_dev_platform is a new platform which is compatible to the
generic platform to place some features which are only for the SiFive
development machine.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 platform/generic/Kconfig                      |  5 +++
 platform/generic/configs/defconfig            |  1 +
 platform/generic/sifive/objects.mk            |  3 ++
 platform/generic/sifive/sifive_dev_platform.c | 41 +++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 platform/generic/sifive/sifive_dev_platform.c

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index a24d6ab2..20c25a83 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -43,6 +43,11 @@ config PLATFORM_RENESAS_RZFIVE
 	select ANDES_PMU
 	default n
 
+config PLATFORM_SIFIVE_DEV
+	bool "SiFive development platform support"
+	depends on FDT_CACHE
+	default n
+
 config PLATFORM_SIFIVE_FU540
 	bool "SiFive FU540 support"
 	default n
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 6b219cfb..42e7ef75 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,6 +1,7 @@
 CONFIG_PLATFORM_ALLWINNER_D1=y
 CONFIG_PLATFORM_ANDES_AE350=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
+CONFIG_PLATFORM_SIFIVE_DEV=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
diff --git a/platform/generic/sifive/objects.mk b/platform/generic/sifive/objects.mk
index d75e444a..d32e1273 100644
--- a/platform/generic/sifive/objects.mk
+++ b/platform/generic/sifive/objects.mk
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: BSD-2-Clause
 #
 
+carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_DEV) += sifive_dev_platform
+platform-objs-$(CONFIG_PLATFORM_SIFIVE_DEV) += sifive/sifive_dev_platform.o
+
 carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive_fu540
 platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive/fu540.o
 
diff --git a/platform/generic/sifive/sifive_dev_platform.c b/platform/generic/sifive/sifive_dev_platform.c
new file mode 100644
index 00000000..ac659868
--- /dev/null
+++ b/platform/generic/sifive/sifive_dev_platform.c
@@ -0,0 +1,41 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <platform_override.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+
+static int sifive_early_init(bool cold_boot)
+{
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
+	rc = fdt_cmo_init(cold_boot);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int sifive_platform_init(const void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
+	generic_platform_ops.early_init = sifive_early_init;
+
+	return 0;
+}
+
+static const struct fdt_match sifive_dev_platform_match[] = {
+	{ .compatible = "sifive-dev" },
+	{ },
+};
+
+const struct fdt_driver sifive_dev_platform = {
+	.match_table = sifive_dev_platform_match,
+	.init = sifive_platform_init,
+};
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
