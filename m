Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4FBEA71A2
	for <opensbi@archiver.kernel.org>; Sun, 19 Apr 2026 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NY8qntMEu5W9WlpBwCExF17LlUPhDeJHrzIF931nQiU=; b=wqXwlaYeJvl/Yj
	OzYGhor+6p/3/e/8mNl22+8VA3nOvDWKr5NYDIMzQUZ0KsU42hcos611paf47qSTRHMXqXibueOWC
	cAIC03zV2QQgFNXWc3aiKWwkK/44nDlMQVMhMLNgBGCjWu3QtbfvYJzvQXaF3EZXRwwn1RRCUcoTI
	Jo7nk6E7DvnJEy8wxmgCkdc/z2PceAKA/nKDZ8r2tvsJwIr0yog7yrFE5rniqB+f44H3bafLDbY8e
	teh5ZNjBaCo7fUVZ7ZQrMNyVZulfMx4pAaQFEfCNLsqIB49nko6y3L/LLX6DwOsaDSp+0WmbujCh/
	qS6KiXXq0rr6sqRkyuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wETlu-00000005sFB-1Hzl;
	Sun, 19 Apr 2026 15:09:18 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wETlq-00000005sDi-3L4p
	for opensbi@lists.infradead.org;
	Sun, 19 Apr 2026 15:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=iri5KGkp/slv6HhjVn/aZZjwIDTF7TECFoCLFHO7Cno=; b=wqj82zpbBcfK4V50oknagg41EE
	M/f7v61JuyMPt5JKN6P1cVtlXwvr5CmoXvzdrJxdIdkLgqqD6/Ttz1IUrwg4Z27xO6ulySivQZlHs
	CCgjUcCdQ3JraPlZPM6r2ZUpL0fWkzhgfiNgPjJAMT0CQX9bXMnu8Ycds7OMeRBJr6txkxDltEDba
	bAw0CwjYXtfC2ikH91GQZhEQ/hxvt2BaXOzU86vt5ETiHaBVESs4JWY9dhD/tAXAQYJ0k4v3SNRkd
	d+90lpMFhc0Xy78CWl9gfRPp/sR3M2TT4TiCyh/8nYYC/jKnceiDKpLlPf9bpWvEy/VSf9ddJdJIA
	JmQbtJeg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wETlh-0000000CKQr-434Z;
	Sun, 19 Apr 2026 17:09:05 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: opensbi@lists.infradead.org
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 1/2] lib: utils/i2c: add minimal SpacemiT I2C driver
Date: Sun, 19 Apr 2026 16:49:19 +0200
Message-ID: <20260419150857.2705843-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419150857.2705843-1-aurelien@aurel32.net>
References: <20260419150857.2705843-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_080914_969309_67F3313F 
X-CRM114-Status: GOOD (  20.97  )
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

Add a simple SpacemiT I2C driver for basic byte transfers over the I2C
bus, prioritizing simplicity over performance. The driver operates in
PIO mode and does not use interrupts, FIFO, or DMA.

The controller is reset at the start of each transaction to ensure a
known initial state, regardless of prior configuration by the kernel.
This also avoids the need for additional error recovery code.

This will be used for communication with onboard PMIC to reset and
power-off the board.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 lib/utils/i2c/Kconfig              |   4 +
 lib/utils/i2c/fdt_i2c_spacemit.c   | 220 +++++++++++++++++++++++++++++
 lib/utils/i2c/objects.mk           |   3 +
 platform/generic/configs/defconfig |   1 +
 4 files changed, 228 insertions(+)
 create mode 100644 lib/utils/i2c/fdt_i2c_spacemit.c

diff --git a/lib/utils/i2c/Kconfig b/lib/utils/i2c/Kconfig
index 7fa32fcf..bdaaff62 100644
--- a/lib/utils/i2c/Kconfig
+++ b/lib/utils/i2c/Kconfig
@@ -14,6 +14,10 @@ config FDT_I2C_SIFIVE
 	bool "SiFive I2C FDT driver"
 	default n
 
+config FDT_I2C_SPACEMIT
+	bool "SpacemiT I2C FDT driver"
+	default n
+
 config FDT_I2C_DW
 	bool "Synopsys Designware I2C FDT driver"
 	select I2C_DW
diff --git a/lib/utils/i2c/fdt_i2c_spacemit.c b/lib/utils/i2c/fdt_i2c_spacemit.c
new file mode 100644
index 00000000..9009b6b6
--- /dev/null
+++ b/lib/utils/i2c/fdt_i2c_spacemit.c
@@ -0,0 +1,220 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Aurelien Jarno
+ *
+ * Authors:
+ *   Aurelien Jarno <aurelien@aurel32.net>
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_timer.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/i2c/fdt_i2c.h>
+
+/* Controller registers */
+#define ICR_OFFSET	0x00		/* I2C control register */
+#define IDBR_OFFSET	0x0c		/* I2C data buffer register */
+
+/* Control register bits */
+#define ICR_START	BIT(0)		/* start */
+#define ICR_STOP	BIT(1)		/* stop */
+#define ICR_ACKNAK	BIT(2)		/* ACK(0) or NAK(1) */
+#define ICR_TB		BIT(3)		/* transfer byte */
+#define ICR_UR		BIT(10)		/* unit reset */
+#define ICR_SCLE	BIT(13)		/* SCL enable  */
+#define ICR_IUE		BIT(14)		/* unit enable */
+
+/* Timing */
+#define I2C_RESET_US	10
+#define I2C_TIMEOUT_US	1000
+
+struct spacemit_i2c_adapter {
+	unsigned long base;
+	struct i2c_adapter adapter;
+};
+
+static inline void spacemit_i2c_set_reg(struct spacemit_i2c_adapter *adap,
+					uint8_t reg, uint32_t val)
+{
+	writel(val, (void *)adap->base + reg);
+}
+
+static inline uint32_t spacemit_i2c_get_reg(struct spacemit_i2c_adapter *adap,
+					    uint32_t reg)
+{
+	return readl((void *)adap->base + reg);
+}
+
+static void spacemit_i2c_reset(struct spacemit_i2c_adapter *adap)
+{
+	/* disable unit */
+	spacemit_i2c_set_reg(adap, ICR_OFFSET, 0);
+	sbi_timer_udelay(I2C_RESET_US);
+
+	/* reset unit */
+	spacemit_i2c_set_reg(adap, ICR_OFFSET, ICR_UR);
+	sbi_timer_udelay(I2C_RESET_US);
+
+	/* clear reset and enable unit and SCL */
+	spacemit_i2c_set_reg(adap, ICR_OFFSET, ICR_IUE | ICR_SCLE);
+}
+
+static int spacemit_i2c_wait_xfer_done(struct spacemit_i2c_adapter *adap)
+{
+	for (int i = 0; i < I2C_TIMEOUT_US; i++) {
+		uint32_t val = spacemit_i2c_get_reg(adap, ICR_OFFSET);
+
+		if (!(val & ICR_TB))
+			return 0;
+
+		sbi_timer_udelay(1);
+	};
+
+	return SBI_ETIMEDOUT;
+}
+
+static void spacemit_i2c_start_xfer(struct spacemit_i2c_adapter *adap,
+				    uint32_t ctrl)
+{
+	const uint32_t ctrl_mask = ICR_START | ICR_STOP | ICR_ACKNAK;
+	uint32_t val;
+
+	val = spacemit_i2c_get_reg(adap, ICR_OFFSET);
+	val &= ~ctrl_mask;
+	val |= (ctrl & ctrl_mask);
+	val |= ICR_TB;
+
+	spacemit_i2c_set_reg(adap, ICR_OFFSET, val);
+}
+
+static int spacemit_i2c_xfer_write(struct spacemit_i2c_adapter *adap,
+				   uint8_t byte, uint32_t ctrl)
+{
+	spacemit_i2c_set_reg(adap, IDBR_OFFSET, byte);
+	spacemit_i2c_start_xfer(adap, ctrl);
+
+	return spacemit_i2c_wait_xfer_done(adap);
+}
+
+static int spacemit_i2c_xfer_read(struct spacemit_i2c_adapter *adap,
+				  uint8_t *byte, uint32_t ctrl)
+{
+	int rc;
+
+	spacemit_i2c_start_xfer(adap, ctrl);
+
+	rc = spacemit_i2c_wait_xfer_done(adap);
+	if (rc)
+		return rc;
+
+	*byte = spacemit_i2c_get_reg(adap, IDBR_OFFSET);
+	return 0;
+}
+
+static int spacemit_i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr,
+				      uint8_t reg, uint8_t *buffer, int len)
+{
+	struct spacemit_i2c_adapter *adap =
+		container_of(ia, struct spacemit_i2c_adapter, adapter);
+	int rc;
+
+	/* reset controller to a known state */
+	spacemit_i2c_reset(adap);
+
+	/* send device address (in write mode) */
+	rc = spacemit_i2c_xfer_write(adap, addr << 1, ICR_START);
+	if (rc)
+		return rc;
+
+	/* send register + data bytes */
+	for (int i = 0; i < len + 1; i++) {
+		uint32_t ctrl = (i == len) ? ICR_STOP : 0;
+		uint8_t byte = (i == 0) ? reg : buffer[i - 1];
+
+		rc = spacemit_i2c_xfer_write(adap, byte, ctrl);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int spacemit_i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
+				     uint8_t reg, uint8_t *buffer, int len)
+{
+	struct spacemit_i2c_adapter *adap =
+		container_of(ia, struct spacemit_i2c_adapter, adapter);
+	int rc;
+
+	/* reset controller to a known state */
+	spacemit_i2c_reset(adap);
+
+	/* send device address (in write mode) */
+	rc = spacemit_i2c_xfer_write(adap, addr << 1, ICR_START);
+	if (rc)
+		return rc;
+
+	/* send register */
+	rc = spacemit_i2c_xfer_write(adap, reg, 0);
+	if (rc)
+		return rc;
+
+	/* repeated start and send device address (in read mode) */
+	rc = spacemit_i2c_xfer_write(adap, (addr << 1) | 1, ICR_START);
+	if (rc)
+		return rc;
+
+	/* read data bytes */
+	for (int i = 0; i < len; i++) {
+		uint32_t ctrl = (i == len - 1) ? (ICR_ACKNAK | ICR_STOP) : 0;
+
+		rc = spacemit_i2c_xfer_read(adap, &buffer[i], ctrl);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int spacemit_i2c_init(const void *fdt, int nodeoff,
+			     const struct fdt_match *match)
+{
+	struct spacemit_i2c_adapter *adapter;
+	uint64_t base;
+	int rc;
+
+	adapter = sbi_zalloc(sizeof(*adapter));
+	if (!adapter)
+		return SBI_ENOMEM;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &base, NULL);
+	if (rc) {
+		sbi_free(adapter);
+		return rc;
+	}
+
+	adapter->base = base;
+	adapter->adapter.id = nodeoff;
+	adapter->adapter.write = spacemit_i2c_adapter_write;
+	adapter->adapter.read = spacemit_i2c_adapter_read;
+	rc = i2c_adapter_add(&adapter->adapter);
+	if (rc) {
+		sbi_free(adapter);
+		return rc;
+	}
+
+	return 0;
+}
+
+static const struct fdt_match spacemit_i2c_match[] = {
+	{ .compatible = "spacemit,k1-i2c" },
+	{ },
+};
+
+const struct fdt_driver fdt_i2c_adapter_spacemit = {
+	.match_table = spacemit_i2c_match,
+	.init = spacemit_i2c_init,
+};
diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
index d34d6648..91ac17ec 100644
--- a/lib/utils/i2c/objects.mk
+++ b/lib/utils/i2c/objects.mk
@@ -15,6 +15,9 @@ libsbiutils-objs-$(CONFIG_FDT_I2C) += i2c/fdt_i2c_adapter_drivers.carray.o
 carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_SIFIVE) += fdt_i2c_adapter_sifive
 libsbiutils-objs-$(CONFIG_FDT_I2C_SIFIVE) += i2c/fdt_i2c_sifive.o
 
+carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_SPACEMIT) += fdt_i2c_adapter_spacemit
+libsbiutils-objs-$(CONFIG_FDT_I2C_SPACEMIT) += i2c/fdt_i2c_spacemit.o
+
 carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_DW) += fdt_i2c_adapter_dw
 libsbiutils-objs-$(CONFIG_FDT_I2C_DW) += i2c/fdt_i2c_dw.o
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 1d3431e7..a9cb0f06 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -31,6 +31,7 @@ CONFIG_FDT_HSM_RPMI=y
 CONFIG_FDT_HSM_SIFIVE_TMC0=y
 CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
+CONFIG_FDT_I2C_SPACEMIT=y
 CONFIG_FDT_I2C_DW=y
 CONFIG_FDT_IPI=y
 CONFIG_FDT_IPI_MSWI=y
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
