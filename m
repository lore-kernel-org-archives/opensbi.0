Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE997C369AB
	for <opensbi@archiver.kernel.org>; Thu, 24 Apr 2025 03:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=39L7KZZKO6D84IkwO2EOYKwL6jmUhWtUbdV+Z1jXE5s=; b=aSTjLOW5QUw7GSf2onK+fc+HYh
	4F3RLjffsaWYvL4rXJHevOmAqNdd4ZuYvDsttdHgFTnlak2i4x8qDFVHzBt/zQu6pBU4Et3BilVt1
	BgG+HtHd9rtuTkK6V94GyWN1LkfSUrv/10aVAKHXOAxC/J7fppcy0REQVszCPWP6QHAFsXrPnfRhR
	1W+teIwjn/P67GXfPGh7e5u8n+2TS7Epc9IUS969kBZ99bKCS37izlRzr5zR73X0G57mZke/EcMmh
	eEQwFbmOrFl3BdDSeni9KgOVEryVpDfL9+V4qIY1mKQGDxuGwI4rdJOTAfiW/ec8Wh65XTD0JmegE
	31FZppqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRw-0000000Ckka-0BCO;
	Thu, 24 Apr 2025 03:40:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nRt-0000000Cki8-2VGm
	for opensbi@lists.infradead.org;
	Thu, 24 Apr 2025 03:40:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2243803b776so9129165ad.0
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 20:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745466029; x=1746070829; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/3S67xqwRZe5faWlyHPC1lDIaFBHVBbPj9MSDfEXttI=;
        b=WJQhvWCWdMeWgrYyjK5KpdmEesfKwm+hAWk1zs6osaTnbZz/VfTVZpQ+duMzqxKAlc
         dzdh4S0/LP6aFnhewkfXjirHK/R7DYULIYgOZxjizMbdrC5RrLM5A0sP4Wz3j2jyi3v3
         P1R942yjlGM2b6QLBVrbjXV/D+AsPDuZ88/aKnpY+/EQE7F3e36Ym6NHHTtSvqM8hOOC
         tpvis+2/sVgz12tBmrlYKmXo0VUMLB+lubT4i/ZgbktP36k5mq0mAxtu/p0Skkc0JNXe
         q8UdXqyDAii5Ow/9SQ3mzpQBC7BX3tcGBdUvcRHcwQxgMmO+v0TA8VyfkwSP44kiyPAU
         odXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745466029; x=1746070829;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3S67xqwRZe5faWlyHPC1lDIaFBHVBbPj9MSDfEXttI=;
        b=b5hHxXESDdKxEzqbJIE7A5UIqn9Rmp+CiELfdwkaEhvHETsAemQQT8Jq50RAnD6CBp
         cKbL6VP2XyhzLpyXLEVKIwPAjXMRidxh2ShGgVkTmBmioj+fcxm6n4AJi86Mnox287mJ
         EhEovcWemfuaSYHrseQY+nb42W3kiwAy/B3m0GbPrVNOr6HqS6d6k8H/ypnE2/fQGV2E
         jgX1cGvnN7JfobGKP51nyUb78GppmCHvXOqLud501ne4X2eXnwWSb8bsPep3Lq+aupO1
         UJej6E+PSvLi3hx24K1seCoEqv08AmQePmvYv1oGgCWb68npZ4boU81ccLKoKnFNTRpE
         QyEw==
X-Gm-Message-State: AOJu0Yx1coWLbjsIo2o3lL5Q8AZNtsXJSzzfh/a7luoCPucBLJGMa4zg
	sR2xEQh0dbsVKBVqfcGwm5htXr44DE61cstZy7iuuNCigoKnrZLDQCzdSkzNGUu+iRMYfpaTu2H
	hapo5y4OxnelbPiRNUMP6tRzyEt3cYNwM0uLSrl0PEeEdF41S7YsNJfR9JL7xwhkmREMmN5IPDv
	1q0m559INa/KU6QQ7rMLPVj9uW4InniqYRE+20bde3nA==
X-Gm-Gg: ASbGncsWJr8lpa1n9DhSTHtWXjOVPOAj8z3lKXJswFQndW/mVuB2vtrP7xBGzmVDNm9
	7ZXCFOjItUAF/nivXzo5d3SSObPAdMHctmolAqXTTKl24tj9rhJl969tYLng+JvGEzCPWkVugfF
	lppswQyXjfqSI3+3I/RekIJolwCpRBuFQkw33ifXXlxL408IZ4d3o2mAvg/PfLWByYpvX1USlGa
	MnXe218qAuf4t1PfvbpoGQaUGGRd/nHZSOrIf9D6ka77rpXaIuuJ9nYkElPrSJa+vyNDBbq7hgA
	GGaMo/rxAfmrbzPdl445vXxH0vYfP0bZ0RU5kymtUnNG4zp9Fq2rHq6K3B7jDTM=
X-Google-Smtp-Source: AGHT+IHT3f/S1QNkvQ+OTqkKSQYjZ0O6dQ1gDi7s199CFt22DRW+SP21R7h3kX0uuyQXQ1gZRIsx7w==
X-Received: by 2002:a17:903:1950:b0:22c:336f:cb54 with SMTP id d9443c01a7336-22db3c14fa3mr14500715ad.29.1745466028630;
        Wed, 23 Apr 2025 20:40:28 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd5f2sm2632025ad.66.2025.04.23.20.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 20:40:28 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v2 5/5] platform: generic: Add SiFive development platform
Date: Thu, 24 Apr 2025 11:40:03 +0800
Message-Id: <20250424034003.28522-6-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250424034003.28522-1-nick.hu@sifive.com>
References: <20250424034003.28522-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_204029_638552_A879D85E 
X-CRM114-Status: GOOD (  15.18  )
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
index 688da3f4..e27cb50e 100644
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
index 09807207..39869c08 100644
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
