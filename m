Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AA5C369D5
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Iy/bo7wD9o/UpLY+SfTxmCho3wNhwEEGrD2iw7ub170=; b=JYoHORFkEOUXy2qwi+r6ELQb8M
	OSRMIVtde9pEchvAEPhKBGA6XQI4xHP897KyjRTgpeHVLAja9Km0EOJaqwJh/zb9ND2pOkeuhb1yn
	mUftg5B8Dr0JI0SQG1ljAZtw2MhnPjwHSdFQiuUN2LGYLoL28fzHpQhDmyMjyhOFmcuPMlS+LAbyd
	WT4z3gtefl5ZtLEWiKnJo+kF5YmNAq5YL2qxpNGxuc8e7ZZaqH+kXoN6CCG7R98L6OT1kzzhAgH3S
	kyJZU7l+WiM/PwbalrnalDRyhddZjC1nIm1XXpw0uVnBPdNcSVo5ZauwaTvZCKMd0rzq3fSpTGtKu
	lfRdLzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kbD-00000003hgk-3Pyb;
	Mon, 21 Apr 2025 06:25:47 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kbB-00000003hdy-1izZ
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 06:25:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3255789b3a.1
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 23:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745216744; x=1745821544; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ywK7tq74JJxI3cbKm4f/dPky6XAVb4M57+in7JVaZJs=;
        b=a/OUrjq3M/K0j+FmC/zovynNMCkpwxD2WgAw4FhZjfO/rFiVPtyexudIZr1FfEiiFN
         E4kCN25cHB0GUYjTRK7ZO0fD250lBmzWKbxKimxs4AFZm63WeZ1X+CCVWmeiAfIi3xV8
         MHyfkAXGG13Rjd/ywcc/J61dG92F2IDKkwHA1WA9GtUpqudjF9QhjfgTsFRzKkyQpKfb
         dh0bHmMCHZTjMqOrbJiHkTRgAa73Kj2suyH58vc4YbFlq7h4usxQ5JzkTWRxYD285+fX
         gG+Kcvv7rn+QFmFvIs4UuFewUVOOFvYJwFjHSeGCbULpWK2ZVniU5RfDJbkoSXRkCyX6
         uGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745216744; x=1745821544;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywK7tq74JJxI3cbKm4f/dPky6XAVb4M57+in7JVaZJs=;
        b=B9IDQLRVdSR+Jg+bKVIWnXmbA8nORwYY9mIPuFbrKS/EG4JEPdOCHqjnYdPg3XI6Zp
         U9wad5RZk6x8sjK7J1NfqpymTzpqrV1FPodMBQ7xrqZseDzib4Ch/lrL7QkZvYp8tXsI
         I0T9l+2mtifZfePFpjcEs41tSRsdYRxIej7myZMiB3XhLztxDPfjGSgg/JR7JF2CJ5rJ
         37e8yG9+mvLi6/XrgSb23fjw6pNnNyQQOn7VzX5OsHcSk77KtVzY/XxGtnxTYcbXv/9V
         rc7SLL2hsNTwwEDLabIeIHIGsff/b0bE8Vh9j7mOg3+nYrUmdTlwnrOfsx5t0sA0VdP1
         cQnQ==
X-Gm-Message-State: AOJu0YztzveNqn6LfVuBwNSV1ksFgIfgy7yh22Xk/gvtvsY69VUXcZrQ
	uZzNZd+S7ThQ6oesZ7/txkT+ATXuxLB3EArw6bF+Ck76i3D31JZ5zvJkGiYzgQnWdp3rfFVM/KT
	WDbQfaZjHzr6YabOmFvHZ8QthH8+9KodE6vvtwo0Kdoer6a5Hz7L+IwdzYhbiUl8JlH+oxZAPbu
	KvhqMx5nce0hUbGgTckygHg9qomTnesmbSgtXdd3btYA==
X-Gm-Gg: ASbGncvopaYoLqkDMk21IOWaUaG10txK/e26JYFaabA4NscZg7uYTKn72U7dThmCKk5
	cCQxMJ6krfOno0+moJcvh4IrG62KDkO8J2/N9nxSJKTp+vDKKmXVDIymgNGm2SLfVBgRtQipYm9
	UlSJH78DjMkogcl9sqk5LE29kuhlfytsJLK1bq+vPC4kBH7ufHY3HnWGSukj20oI1CD4lZlUX3k
	C1udE5GJxT4rN5twHdTVqFl5pLvilbgd8PRd/XvRFhQgQ/GoIvt3so/+uyf9w77gyKu6LfMZuo3
	0kqRFvIiWUh7riglChwl04VS0iDshVywlQI7Nko553T1drHVYsTmJPzqO4/1Uw8=
X-Google-Smtp-Source: AGHT+IHFpT0CFSTkCA1udxVUx1YQMFr7jFzJKqa+NgxZWvry0QTj8aG1VON4jyqVu9lGGuJpMGJEVA==
X-Received: by 2002:a05:6a21:2d07:b0:1f5:77ed:40b9 with SMTP id adf61e73a8af0-203cbd488b0mr17683744637.40.1745216744042;
        Sun, 20 Apr 2025 23:25:44 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf3dsm5961043b3a.134.2025.04.20.23.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 23:25:43 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 5/5] platform: generic: Add SiFive development platform
Date: Mon, 21 Apr 2025 14:25:08 +0800
Message-Id: <20250421062508.21187-6-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421062508.21187-1-nick.hu@sifive.com>
References: <20250421062508.21187-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_232545_454409_128CE539 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: vincent.chen@sifive.com, Nick Hu <nick.hu@sifive.com>
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
 platform/generic/sifive/sifive_dev_platform.c | 31 +++++++++++++++++++
 4 files changed, 40 insertions(+)
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
index 00000000..2506c932
--- /dev/null
+++ b/platform/generic/sifive/sifive_dev_platform.c
@@ -0,0 +1,31 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <platform_override.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+static int sifive_early_init(bool cold_boot, const void *fdt,
+			     const struct fdt_match *match)
+{
+	int rc;
+
+	rc = fdt_cmo_init(fdt, cold_boot);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static const struct fdt_match sifive_dev_platform_match[] = {
+	{ .compatible = "sifive-dev" },
+	{ },
+};
+
+const struct platform_override sifive_dev_platform = {
+	.match_table = sifive_dev_platform_match,
+	.early_init = sifive_early_init,
+};
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
