Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85840CA5FBB
	for <opensbi@archiver.kernel.org>; Wed, 30 Sep 2026 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1LOX+1HUgnsgarrNcKbSdH+t04y3z1Jomk2WYxfU6Q=; b=AwKzMSOOvzqzFg
	VSTl6Vm0r3C2VCo966qrGEUPVDiikj7QzkUDzYU1wX3t5BqjVMtfgZ2RdYofvSHkwY+zNffFqMhbO
	xgsG6ikZbklXE5R7iSW1Ap6J21DZeRKf/qtO1x0DQ5kxjuttp+YlnwnYF4v2Dh32/Hyty1YHmrK5r
	o+SwKJ5XaToC83YlopHaQdw71A6awJxd/HSS/L3nsBUfriQlcVcuq1OxtfwJDbYXqUjeUopQHAHYr
	s7nisplLrXvw6jaSNvFpptfezohyenJwuK0FF/svsKJwJ+/h23vcMAjC70beJlgqW28Wfx8Jgajqt
	Jp5bo3ENwpXwPS/KFUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5J-000000054Fi-3Rts;
	Wed, 30 Sep 2026 05:42:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5H-000000054Eh-1vJ1
	for opensbi@bombadil.infradead.org;
	Wed, 30 Sep 2026 05:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=doYBwcvr2rZIKa9LyizcodXRcNSUuR5edgWaspBPLDQ=; b=F2POSj2MjpCWJpEKzQL0az6xD0
	686m7Y0nimKUe9mwmB4uI0sdft/+OToKdjE+y2+c7Cd8qx+vx75rK3f0iC9NMpM3ks7Zgdf+5J1ZN
	aWZP79w7WW6ZWr0PilVvYkNkYxNdBuc4zex6L23v387vC0A3W9VR3FZTpmo3rNT8ELV7eeHuYg9RH
	OTS9S1WB7kIqwSC44Z/IKUgdTJwOtLBgC9mVyvjDxOfrcAkXM1+0zq0A4maEN4m7GVmv/7QyT2AZS
	aO2clWq8XJrdWtxGoVMJHHJHH07DmQm0b8MrLUTTdd4L9+BCER/2P6forItbqgpOBtJuiN+5aWbm+
	PtR4bsUA==;
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBn5E-00000003NuH-28p9
	for opensbi@lists.infradead.org;
	Wed, 30 Sep 2026 05:42:26 +0000
Received: by mail-dy2-x10.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so6405895eec.1
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 22:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790746943; x=1791351743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=doYBwcvr2rZIKa9LyizcodXRcNSUuR5edgWaspBPLDQ=;
        b=Q+bbxQfdAuUKDtwGPVl4vSWHQuuxOUAZ+lOZooWH6jaWRO1dsnBXZp/OfcuxQTXeh1
         RceCJDiFSoeJ2P1CHSZ9UnkaHoKiVYqCducFF6uXLRVFqZUiD7/lzv4NG3ku/7yHxLTc
         K00X1WcB3pu8/5N22GfXSq0og+m9BbutBGOfXbov3vrdO+NutLAyQ06cOBa9zt95vopY
         b6FkpY5jx5oqyAvp4Cu01Tciqt9C1Lx4zXTkxf8XtEo+9QlZUwDxrajPjZwjIYj6sB8v
         VJJJpujJLhdSru6WFJHES8XCZ+T7J56D0NVFwjFns3CbZRThrEaxjIOkZyT0uDXeTrKp
         hUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746943; x=1791351743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=doYBwcvr2rZIKa9LyizcodXRcNSUuR5edgWaspBPLDQ=;
        b=zU2L6uM3pQeIQAtwJJAH0GrcS8NRvZ6OMmGn9zDAC7HuaV/v4+miGo4ZBJblJAYA5G
         lB3WZXH0o2vCSp6Dj7yr4wwPVYB8X7J/GrbQgEqoWQgOnsV1WUVo3sfDVtW6TbNP+iMo
         8x09XOig4oFECuLkaZpZtlbbRhF4sVmxn1yw6Wm6/fhaZGbRDeEdB3kdgmJF6JC7GkGr
         iLRfQoEUtj6bUbTohAc70QHeGhX9aSbpFhIP1cNZB/K4FHtD/xbU6rMfHuVIvI/0Dnw6
         ofxTcnQrV0qiXtytdCPRZVKWEzoPDncUeVJ3LqiY47vEfQkj21Xk0fni6cxwSfJTXYKy
         coAA==
X-Gm-Message-State: AFuF++nWR/R7hs2s8V5BjQsRDVYPKdOT7SpYQloDEy/iC0eP2LHfegYV
	UJ3Zv76K9tykPPNYLNvvU0uIB0O+f7p+DS2w7XA7fTib9QKZyTy/An3ifEKRvd3o8m9cFbtMlON
	KHD9YfkLfPbRWbEHg2sgDb86e25+oqjGbLb4xWl9Na6JSLo4ntDYqZLDV5fxhI44/QTHPCn2Vz3
	AYRfR8po75qu1jIThkU9NBEbkLsXA5MMEQB0p+UY0oLBT2ZHVHA0U=
X-Gm-Gg: AYBFou3RjwB6KmfsLiYuYmAV8NBWKlK/hMn0NKci/q+6NzXlc8Kp59qH01l9h0pDDc1
	a+oTSKNFS9h3oZN9O80awy9T0nHbRPMcBhz2LLpS2YOCXBgDFyjNPDjCwnk7uOpcDBjrxMlyhvR
	QLw8VfysD0//GK94fvMDStp8Is6BCwW98kYiDutuVX1OJVzukOh04Nog9vrWqBOMDgnAyUjD9Lt
	BTlBGedYbrXmfr5z/jz8nw3SaCciWjEoqjPUZ3JjWA16zIrz/zsaM0KLnoPSqL5vgOx6Z6dLSy3
	WSQSGNIlodCov47Rg/RKqb5JysoIN4CliYgcxtFgJ/JDjRyG6JUaeTwRTGHNQAeryEgCsKPX2T+
	pGa58N+zRonVwS/9cR9nrImsl2LxPnCP9XPDCb2UC6PZ25Ri1lHHx6CHSeX2LxrIWrWxQPKzDZ9
	4HE9zpotx+i8VDU/NTljthH+HEQziemmKFNq9WqoeVyRDlBi75kQ2MXtiDLmVnanpC73HZrMky8
	3UiKycomoUAog==
X-Received: by 2002:a05:7301:5408:b0:33e:633c:7f86 with SMTP id 5a478bee46e88-34ce0c2e69amr578310eec.30.1790746942403;
        Tue, 29 Sep 2026 22:42:22 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a60283sm910797eec.6.2026.09.29.22.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:42:21 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	leo.liang@sifive.com
Subject: [PATCH 2/5] lib: utils: Add vendor feature-configuration driver support
Date: Tue, 29 Sep 2026 22:42:07 -0700
Message-ID: <20260930054210.3498806-3-leo.liang@sifive.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930054210.3498806-1-leo.liang@sifive.com>
References: <20260930054210.3498806-1-leo.liang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_064224_839443_12232D6D 
X-CRM114-Status: GOOD (  21.87  )
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

Add the vendor half of the feature-configuration mechanism: the driver
interface, the carray that registers drivers, and feature_config_probe(),
which matches the current hart's mvendorid against a registered driver
and calls its init() callback.

A driver declares the mvendorid it supports and a init() callback
that caches the CSR values that hart needs. Returning nonzero is a
hard failure; an unrecognised hart is left untouched, which is not
an error.

Keeping the driver interface here rather than in lib/sbi lets
libsbi.a stay self-contained: it depends only on the
feature_config_init platform operation, not on vendor-specific code.

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Assisted-by: LLM
---
 include/sbi_utils/feature/feature_config.h    | 71 +++++++++++++++++++
 lib/utils/Kconfig                             |  2 +
 lib/utils/feature/Kconfig                     |  5 ++
 lib/utils/feature/feature_config.c            | 36 ++++++++++
 .../feature/feature_config_drivers.carray     |  3 +
 lib/utils/feature/objects.mk                  |  8 +++
 6 files changed, 125 insertions(+)
 create mode 100644 include/sbi_utils/feature/feature_config.h
 create mode 100644 lib/utils/feature/Kconfig
 create mode 100644 lib/utils/feature/feature_config.c
 create mode 100644 lib/utils/feature/feature_config_drivers.carray
 create mode 100644 lib/utils/feature/objects.mk

diff --git a/include/sbi_utils/feature/feature_config.h b/include/sbi_utils/feature/feature_config.h
new file mode 100644
index 00000000..b57873dd
--- /dev/null
+++ b/include/sbi_utils/feature/feature_config.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * feature_config.h - Vendor feature-configuration drivers.
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#ifndef __FEATURE_CONFIG_H__
+#define __FEATURE_CONFIG_H__
+
+#include <sbi/sbi_types.h>
+
+/**
+ * A single feature-configuration CSR programming request
+ */
+struct feature_config_csr {
+	unsigned long csr_num;
+	unsigned long value;
+};
+
+/**
+ * Vendor feature-configuration driver
+ *
+ * Registered through the feature_config_drivers carray, so adding a
+ * vendor never requires touching common code.
+ */
+struct feature_config_driver {
+	const char *name;
+	/** mvendorid of the harts this driver applies to */
+	unsigned long mvendorid;
+	/**
+	 * Match the current hart's identity and cache its CSR write
+	 * via sbi_hart_feature_config_set().
+	 * No match is not an error: the hart is left untouched.
+	 *
+	 * @return 0 on success or a negative error code on failure
+	 */
+	int (*init)(void);
+};
+
+extern const struct feature_config_driver *const feature_config_drivers[];
+
+/**
+ * Match and cache the current hart's feature-configuration values
+ *
+ * Matches the hart's mvendorid against the registered drivers and
+ * calls the matching driver's init().
+ *
+ * Meant to be wired up as a platform's feature_config_init operation,
+ * called on every hart so a heterogeneous or AMP system picks the
+ * right driver per hart.
+ *
+ * No matching vendor is not an error: the hart is left at its reset
+ * configuration.
+ *
+ * @return 0 on success or a negative error code on failure
+ */
+#ifdef CONFIG_FEATURE_CONFIG
+
+int feature_config_probe(void);
+
+#else
+
+static inline int feature_config_probe(void)
+{
+	return 0;
+}
+
+#endif
+
+#endif /* __FEATURE_CONFIG_H__ */
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 5a5b3b1e..0c1d157e 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -8,6 +8,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/cppc/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/fdt/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/feature/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/gpio/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/hsm/Kconfig"
diff --git a/lib/utils/feature/Kconfig b/lib/utils/feature/Kconfig
new file mode 100644
index 00000000..f6760564
--- /dev/null
+++ b/lib/utils/feature/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "Feature Configuration Support"
+
+endmenu
diff --git a/lib/utils/feature/feature_config.c b/lib/utils/feature/feature_config.c
new file mode 100644
index 00000000..11be2bbf
--- /dev/null
+++ b/lib/utils/feature/feature_config.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * feature_config.c - Vendor feature-configuration drivers.
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ * Matches the current hart's mvendorid against the registered vendor
+ * drivers and hands off to the matching driver's init().
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi_utils/feature/feature_config.h>
+
+int feature_config_probe(void)
+{
+	unsigned long mvendorid = csr_read(CSR_MVENDORID);
+
+	for (int i = 0; feature_config_drivers[i]; i++) {
+		const struct feature_config_driver *drv =
+						feature_config_drivers[i];
+
+		if (drv->mvendorid != mvendorid)
+			continue;
+
+		return drv->init();
+	}
+
+	/* Unknown vendor: leave the hart at its reset configuration */
+	sbi_dprintf("hart%lu: no driver registered for mvendorid 0x%lx\n",
+		     current_hartindex(), mvendorid);
+
+	return 0;
+}
diff --git a/lib/utils/feature/feature_config_drivers.carray b/lib/utils/feature/feature_config_drivers.carray
new file mode 100644
index 00000000..5f3c219e
--- /dev/null
+++ b/lib/utils/feature/feature_config_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/feature/feature_config.h
+TYPE: const struct feature_config_driver
+NAME: feature_config_drivers
diff --git a/lib/utils/feature/objects.mk b/lib/utils/feature/objects.mk
new file mode 100644
index 00000000..4ed7a97b
--- /dev/null
+++ b/lib/utils/feature/objects.mk
@@ -0,0 +1,8 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2026 SiFive Inc.
+#
+
+libsbiutils-objs-$(CONFIG_FEATURE_CONFIG) += feature/feature_config.o
+libsbiutils-objs-$(CONFIG_FEATURE_CONFIG) += feature/feature_config_drivers.carray.o
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
