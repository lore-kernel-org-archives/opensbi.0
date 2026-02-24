Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8691EFB7EB
	for <opensbi@archiver.kernel.org>; Tue, 24 Feb 2026 03:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wpYXgoKRobcvp8wnoT737sqogEn0bmGA7iASJ84htTQ=; b=DhQgholQEsSFX7
	4wa1jpTef45pKyFlmKQa9O3ZRsTQUcUC0tNmpDloF2uDcAukg7AmPxPen114Hy2nxXrgl6V59JskS
	bOp7waqsESaS5YFMFIYRTYNbhxG6D58+mlxEfZeGKK67lTgY3Ofz78Wb6BtLNzUxmD87UuKIDj6qW
	xXyFa4IJWPRZsI7065/X+zO/5LAfgHAVCa9+ma9puyJ0hGkT6Rofzfk7sqDqNQVSO084HNXnyqURI
	XLLXKCu1/YX9TOy4ddIiLygQc4weEb9/kprLVyOvudf6BWHbXKsuF3/iKSPjJRh9c2YL2GSWugntm
	JAclDDBiZlx+cdyeJrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuivk-00000001OmE-0lvu;
	Tue, 24 Feb 2026 03:17:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuivh-00000001Ok6-0zj4
	for opensbi@lists.infradead.org;
	Tue, 24 Feb 2026 03:17:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48375f10628so32391105e9.1
        for <opensbi@lists.infradead.org>; Mon, 23 Feb 2026 19:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771903063; x=1772507863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AujnSR/ja4Wiye0HvMwKrXwUwmSXBnTCm5XhgTlPRB0=;
        b=g7NWVNNVFfwNo11Q2mN9GV6nQZVlHEuou37rpM+Su6rXGMWTEBq32gEGlmyE1sLwWl
         09WlQ0tTM4z9IO4L1E/kXVHz17gZ/z4LhEVQ1x5dyhETompk0NN2sn4Xiux26jzLQ0nA
         Ta1mcRFin3rEiyco1t7+u24EusR3lhuaiFNYdhTKLQSXq/Y0cXv0w2tCaVAPFSolHHSa
         tqnjsax+KF6vDewzpZcPkeCNMQpGX0OHSXbqsbHrI7RAsSy68UDtlHkCB2mcb3XECrD2
         rNNCAIkDT4thieexc1TBLXKiQTF33FIIBZUrl/juxsQpPS/CAcQF67/hRYXXKoZErhAm
         Echw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771903063; x=1772507863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AujnSR/ja4Wiye0HvMwKrXwUwmSXBnTCm5XhgTlPRB0=;
        b=l4/RtNSUp2Ej857FbYzWB4ibwx2lrshJoZT0wRODrPdHOEHwtvNnRh+JbPVbVBCkMY
         +Dv4OkOxZwm81JDlnP3bgkO7d5iNlTOW7jbts9+jEDn0VeXQPH8dLibZLIPAPcEXdjhA
         4P7w/LffD8O3WhpkgjIRjUDzObLTfK7EWJOSviolSAQfwTb5qujGae7Y8s88RXIScCMb
         173JovPCIlf3wgzyWBPHcClvLcZ0ZSe12ePPflCCtxG0Jx1Z58QVdc8nSclIOO7plKO+
         ZzJZ6PLfiX3o6FDpqWGFuEU20D0fS/r+MR7m9oN7jRY3OG0V1SaPH/+OL9okzEqo0xju
         TuYA==
X-Gm-Message-State: AOJu0YxeRgAeUL9D6wJyaM9PpQdCqb0nPENiqJF/XhLqkSDu2x9e74Rn
	aExfNJh+WCzI/FHpJ6byKAlgEX8VcVjUfye92bbbdtf2MiDAngcfLHy2fj6DpCmQPDmMCArj4FE
	H9oYsiWFBBSIcaQ7r0WKXPHtMwglkFvMgqUjQcN0Lmhi31nyYgea9arToYozAyFLjsN+esXg3+u
	AWwR2qjvB249Zd7bjEkmFCwBo2AEhWWrpcRSQMZ0OOaJ/6OsU4
X-Gm-Gg: AZuq6aLgJ+aJDKZsbBboAxK7p9Mrzuk0HX5mXpsMgxlnJmEnWLkMxy/ZIlNc+GfOH9Y
	Ny3WtfVUJ8Zksq8GBYJTkynD5zLFQIIYgF7ebH4ickoJJwbIn1e5OfBqouuGH9qKP4kbrLrHc+4
	NPb3pqllDUE1PmcTCyY+V2kyENKFbMWR6P1aWmxTh8k/ggwl70KVkvDNcErUprF7nz6e6KjIgYM
	xvp77HWcsBNu6YdN6Ipz8rSKXM9dpbg9kBsbd3LpKsDW8BhrmYsVHAF2ihFhJYQ3WR79M/OWUNX
	WKhAvpoQ3T83tgKFSqHBor8BtFvKe551AXT9iI5b+6KWFG4RQG17isExgBwe7QhfJxj4KHlRM35
	U3i0m2mC/P6alBRcB4IhV0a+MikoJceXYd6fha+Ca92I8tk0z0kXhRg178Uil155w9ohNF56q5B
	n/Yq+pfz7pKF2DU/ZXeQvOLjdwh5QVXYyZr6oHlINDHqF3U8w=
X-Received: by 2002:a05:600c:3b0a:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-483a95be7c9mr210509645e9.13.1771903062831;
        Mon, 23 Feb 2026 19:17:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm22907889f8f.23.2026.02.23.19.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 19:17:42 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 1/3] platform: sifive: Add initial support for SiFive development platform
Date: Tue, 24 Feb 2026 11:17:31 +0800
Message-ID: <20260224031733.3817148-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_191745_320518_B307DFF6 
X-CRM114-Status: GOOD (  13.55  )
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

Add initial platform support for SiFive development platforms
with the "sifive-dev" compatible string.

Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 platform/generic/Kconfig                      |  4 ++++
 platform/generic/configs/defconfig            |  1 +
 platform/generic/sifive/objects.mk            |  3 +++
 platform/generic/sifive/sifive_dev_platform.c | 23 +++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 platform/generic/sifive/sifive_dev_platform.c

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 0c11fbd2c..eaa972b73 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -66,6 +66,10 @@ config PLATFORM_RENESAS_RZFIVE
 	select ANDES_PMU
 	default n
 
+config PLATFORM_SIFIVE_DEV
+	bool "SiFive development platform support"
+	default n
+
 config PLATFORM_SIFIVE_FU540
 	bool "SiFive FU540 support"
 	default n
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 19a73a247..347ca56d9 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -5,6 +5,7 @@ CONFIG_PLATFORM_ESWIN_EIC770X=y
 CONFIG_PLATFORM_OPENHWGROUP_ARIANE=y
 CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
+CONFIG_PLATFORM_SIFIVE_DEV=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
diff --git a/platform/generic/sifive/objects.mk b/platform/generic/sifive/objects.mk
index d75e444ab..d32e1273d 100644
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
index 000000000..facc044f1
--- /dev/null
+++ b/platform/generic/sifive/sifive_dev_platform.c
@@ -0,0 +1,23 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#include <platform_override.h>
+
+static int sifive_platform_init(const void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
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
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
