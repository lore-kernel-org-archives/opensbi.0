Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FD6EA719F
	for <opensbi@archiver.kernel.org>; Sun, 19 Apr 2026 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uYYT6nJ9cMxFI2a8y6NeGBV0RLYBjJPbNDVBNsuo98=; b=f78GoDQg/02iSa
	ck7tMLMcGt+COB2KlLInrbDZo+HQFy5632E4MXdk8IcViumcxeYRPNg8QYdvtbaMXQAoXbNvxTd3p
	eA1TEAvNoA6983o6MN6arOoTHhffdlZVezDx424WMzg9mp408bTYsFb1gZWDJbfSPzTTNeENhueej
	pxChnZ/OfJu2IshX599hYTdwAaPSBDqPfOmbSA+7tVM8/iQKX+OuFBw0QtC06JfHjvllVdC4hGQ/g
	XSGsxFfZ/b7sq0fQJc5ryCt2MbTVFNqIiAhWJwT4yfw9xnMxdVAEVwLMvZVVgBwqx7AlvJQ3bVqgb
	JCCOrBTqsNbScQQp2pYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wETlt-00000005sEj-2l6s;
	Sun, 19 Apr 2026 15:09:17 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wETlq-00000005sDh-3efJ
	for opensbi@lists.infradead.org;
	Sun, 19 Apr 2026 15:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=o5SeCtw89wWdCv2Aojtx42l0VpfqzBNXcnHFTU1Xpac=; b=xrshYe9e2WpQx5wtmPpnb1RrjR
	dezAnvUYuLiBISN3jDmx6gyyaoPvNYRobVojjz6QHGNxHjK1b6JYFQuUc5cyC+hWEyBwJVNnWJFst
	/p1Dw4Vf24tGb8HdqBo9Uk8UBAC1ev2MPDWXt5YL7wZc+0i6XcPNVcDvC1pUt/g3XzL4nOSVXZBAG
	qBFAm1u2dw7wow43rQn3Qjil3rCGvuLOeIJG5ngsnYivO2IS54Lc0xFwkpPK+qXXpqQg1SKbTfL2G
	JBZPYFn6UwD4ykjHSsC65uARnezLPaGoQSEb3IKUjeoZ+DiEKnnqO4soJvjH7Lb9J3DiWsz3hpkB9
	SwC7yekA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wETli-0000000CKQs-04kA;
	Sun, 19 Apr 2026 17:09:06 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: opensbi@lists.infradead.org
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 2/2] lib: utils/reset: add SpacemiT P1 PMIC support
Date: Sun, 19 Apr 2026 16:49:20 +0200
Message-ID: <20260419150857.2705843-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419150857.2705843-1-aurelien@aurel32.net>
References: <20260419150857.2705843-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_080914_916884_FA57FD7C 
X-CRM114-Status: GOOD (  17.25  )
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

The SpacemiT P1 is a PMIC commonly found with SpacemiT CPU like K1. Add
a reset driver for it.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 lib/utils/reset/Kconfig                 |   4 +
 lib/utils/reset/fdt_reset_spacemit_p1.c | 112 ++++++++++++++++++++++++
 lib/utils/reset/objects.mk              |   3 +
 platform/generic/configs/defconfig      |   1 +
 4 files changed, 120 insertions(+)
 create mode 100644 lib/utils/reset/fdt_reset_spacemit_p1.c

diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index 4835921f..f98926e5 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -33,6 +33,10 @@ config FDT_RESET_SG2042_HWMON_MCU
 	bool "Sophgo SG2042 hwmon MCU FDT reset driver"
 	default n
 
+config FDT_RESET_SPACEMIT_P1
+	bool "SpacemiT P1 reset driver"
+	default n
+
 config FDT_RESET_SUNXI_WDT
 	bool "Sunxi WDT FDT reset driver"
 	default n
diff --git a/lib/utils/reset/fdt_reset_spacemit_p1.c b/lib/utils/reset/fdt_reset_spacemit_p1.c
new file mode 100644
index 00000000..5312e741
--- /dev/null
+++ b/lib/utils/reset/fdt_reset_spacemit_p1.c
@@ -0,0 +1,112 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Aurelien Jarno
+ * Authors:
+ *   Aurelien Jarno <aurelien@aurel32.net>
+ */
+
+#include <libfdt.h>
+#include <platform_override.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/i2c/fdt_i2c.h>
+
+/* SpacemiT P1 Power Control Register 2 */
+#define PWR_CTRL2		0x7e
+#define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
+#define PWR_CTRL2_RST		BIT(1)	/* Reset request */
+
+static struct i2c_adapter *p1_adapter = NULL;
+static uint32_t p1_reg = 0;
+
+static int p1_system_reset_check(uint32_t type, uint32_t reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+		return 1;
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		return 255;
+	}
+
+	return 0;
+}
+
+static void p1_ops(uint32_t type)
+{
+	uint8_t byte;
+	int rc;
+
+	rc = i2c_adapter_reg_read(p1_adapter, p1_reg, PWR_CTRL2, &byte);
+	if (rc) {
+		sbi_printf("%s: cannot read P1 Power Control Register 2\n", __func__);
+		return;
+	}
+
+	if (type == SBI_SRST_RESET_TYPE_SHUTDOWN)
+		byte |= PWR_CTRL2_SHUTDOWN;
+	else
+		byte |= PWR_CTRL2_RST;
+
+	rc = i2c_adapter_reg_write(p1_adapter, p1_reg, PWR_CTRL2, byte);
+	if (rc)
+		sbi_printf("%s: cannot write P1 Power Control Register 2\n", __func__);
+}
+
+static void p1_system_reset(uint32_t type, uint32_t reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		p1_ops(type);
+		break;
+	}
+}
+
+static struct sbi_system_reset_device p1_reset = {
+	.name = "spacemit-p1-reset",
+	.system_reset_check = p1_system_reset_check,
+	.system_reset = p1_system_reset
+};
+
+static int p1_reset_init(const void *fdt, int nodeoff,
+			 const struct fdt_match *match)
+{
+	int rc, i2c_bus;
+	uint64_t addr;
+
+	/* we are spacemit,p1 node */
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
+	if (rc)
+		return rc;
+
+	p1_reg = addr;
+
+	/* find i2c bus parent node */
+	i2c_bus = fdt_parent_offset(fdt, nodeoff);
+	if (i2c_bus < 0)
+		return i2c_bus;
+
+	/* i2c adapter get */
+	rc = fdt_i2c_adapter_get(fdt, i2c_bus, &p1_adapter);
+	if (rc)
+		return rc;
+
+	sbi_system_reset_add_device(&p1_reset);
+
+	return 0;
+}
+
+static const struct fdt_match p1_reset_match[] = {
+	{ .compatible = "spacemit,p1", .data = (void *)true },
+	{ },
+};
+
+const struct fdt_driver fdt_reset_spacemit_p1 = {
+	.match_table = p1_reset_match,
+	.init = p1_reset_init,
+};
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index ac38b49d..3c681c27 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -20,6 +20,9 @@ libsbiutils-objs-$(CONFIG_FDT_RESET_HTIF) += reset/fdt_reset_htif.o
 carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += fdt_reset_sg2042_mcu
 libsbiutils-objs-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += reset/fdt_reset_sg2042_hwmon_mcu.o
 
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SPACEMIT_P1) += fdt_reset_spacemit_p1
+libsbiutils-objs-$(CONFIG_FDT_RESET_SPACEMIT_P1) += reset/fdt_reset_spacemit_p1.o
+
 carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SUNXI_WDT) += fdt_reset_sunxi_wdt
 libsbiutils-objs-$(CONFIG_FDT_RESET_SUNXI_WDT) += reset/fdt_reset_sunxi_wdt.o
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index a9cb0f06..ae278856 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
 CONFIG_FDT_RESET_RPMI=y
 CONFIG_FDT_RESET_SG2042_HWMON_MCU=y
+CONFIG_FDT_RESET_SPACEMIT_P1=y
 CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SYSCON=y
 CONFIG_FDT_SERIAL=y
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
