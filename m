Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D84606A31B
	for <opensbi@archiver.kernel.org>; Wed, 21 Oct 2026 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CKFl2bzg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ljUHLzW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H6KbDqj2l3zQOY0fLm6Qn2+GF3yHFDgZDxG8a6b2fYg=; b=CKFl2bzg5lLBuX
	YSQ2enXNhn7JoH5dhjzSDL0JPyaCsew0R0dbjCnxiNEwuCK4GjUB5g6IHevEQTSLC9fTFCMie01rz
	p0/NxFcqqtHP0ddVS5EGv/oXXyQ/zIhsfh/j7mv1ERJnqMX6V0ULhHxMXpWxOu+frn4d3S75sMiuC
	nR3Ysi1fmYsJlaTrVU9vCC22hOsRS37smp3wWH9BDFV+VFAwyBD3cT6vt7UmDZOxtcHiSsSci+VZu
	KB/8umrzv6JYUQEY30hhVL2fC+1vvWXF0LWZHYsCW7rj6KF+Ud6u8UJG5rSTtSSex9+xXYeXT7K89
	nZV/qvM45D4Q/pewyIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUpx-0000000Bkat-08Qo;
	Wed, 21 Oct 2026 11:50:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUpu-0000000BkaH-2yS0
	for opensbi@lists.infradead.org;
	Wed, 21 Oct 2026 11:50:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e608cd460eso3954055ad.3
        for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 04:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583425; x=1793188225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XPorl3hpdrHLH6wNx+pCmq9YXNLlM/rtAzoS+We41XY=;
        b=ljUHLzW8s7qlxbUxw4yT8t6lEw1eZDp9GYluuzTa4NeV9Vo5bM5AfvOrC/7BY2LvX7
         PXI2Ac09vB3CauRUA1zrKNZ7rjs3JrJC6d6XPql1qVSM9yj1w3HIpae1EelgwAzvbzsZ
         P8SFK64+fB6x5bcMN5MxilyejKpk5o1ETeDoJ+xsmINY8OZPVpRe0YKLpo7T/Fd2dMjg
         C0pbIi+0EjzQnctW9qhHgB+F9IQAXKYs9kvfjSPybtRSDtL85OQ5zDkFKWnNMH0Tc7OT
         h8ufjMiNAGrI+74sjxFp4q3dRBLJSSDfUw0z7HXSWdOluE9qkpKDyGZhjxl3tvCHUTbw
         J65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583425; x=1793188225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPorl3hpdrHLH6wNx+pCmq9YXNLlM/rtAzoS+We41XY=;
        b=jBW0qDsi/1t4mqhpuXRxnCXG9MrH2QyUNVDg/AUSiNW0GBMBE1YuDDvWRsOxJboPV6
         LdfQsRWjTUA/pwMm5oDYC6fkTtuW5YahsYgAUQuw4Qa8xwy8oBevdgEcZA3r3uSq8CND
         HIba+KtZ7SPqXwnnHAgPbyo8kst8BdJrQv30gxAjDOthpGqBXKqHkVsQf/o6K0G1uRAM
         98MxWaB12XuLLWNaZBuqsmaInGgHiS9jzjU3aQ+tiXJD6Djlw+G36EvjEgfPVlVMj7FS
         Yz95qjvdnZkiCAqujhyuOjsTDFYTYvQX8I2yvrWpKRUxUGIj0OHsHcNWGvkGnjMVWK2D
         C/fg==
X-Gm-Message-State: AFq9FYLBPuGXERZjZr6j+RLG7NKsDnePBa12fCuo675HxWBJRdYwbbzf
	vyZKkw0tnq+bK6lPQMqENdUJ42UojMQk6yQLu/o0yY17/JXrVBPuZIIsjxT+Hxga
X-Gm-Gg: AYBFou2avvGAlgKEpslja9GcY6NYBfpLZmDh92BTAZu/+xBXhsl8xZS5kXFZz33F2Gc
	hrl/1Pbl7xPys7mYM5OTUXs5mo2aPs+MpakrBE0sg2+NuOnQZzX2waWbksnS+sekx1BTqpW/zt4
	sC5q7ZcUAzWJCdzYtQMSqfDay96DvYhAFvzFIjbtax5rAkYWFDCAISwO0+7X6yik0vrL2p9c0jx
	kB+WLbAxEMy06xwz3tqYUUPonIqpHxAsVdI3r59P+ztfnpc6E6iRlE0YAnDTt663oqMB9sEvrBw
	csv/1DrBAK5aJkUgwuW4QwmU+wIMAEitbgVk4IzLUuFeOssdNRg31lCw4zmaAa7CQCOC+obJL6h
	CCd4ZBmmO5umf3+2+5DS1RYFCyItZbQMA5nfxhHQvEW0rKWk67UpHpeDbTOVNh6RCnT9wytVwyH
	p4j2ZAQYp4TeSfdE93f3h5eg1leHiy2PyL7pYmrRI/MbrM2pkYriPV+hac4tU+UnmF62R7DyCiP
	2e6tfCLnnuAiHnA9gD0nRUoLy3KIAGD0XNuq2gZP4wZaHY9xzDhvS9NoJy/nDFePtKe
X-Received: by 2002:a17:902:f78f:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ea43c5fedfmr12930015ad.30.1792583425216;
        Wed, 21 Oct 2026 04:50:25 -0700 (PDT)
Received: from localhost.localdomain ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b486965sm10136865ad.63.2026.10.21.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:50:24 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Kwanghoon Son <asdfkwang@gmail.com>
Subject: [PATCH] lib: utils/serial: Add Bouffalo Lab BL808 UART driver
Date: Wed, 21 Oct 2026 07:50:17 -0400
Message-ID: <20261021115017.19344-1-asdfkwang@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_045026_756434_7D07731E 
X-CRM114-Status: GOOD (  22.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a polling UART driver for the Bouffalo Lab BL808 SoC and its
FDT frontend, matching bflb,bl808-uart. Read the register base, input
clock and baud rate from the device tree and register the SBI console.

The preceding firmware must enable the UART input clock and configure
the pinmux before entering OpenSBI. The driver only configures the UART
peripheral; it does not change SoC clocks or board pin routing.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
The BL808 is also used on the PINE64 Ox64 [1]. Zephyr already provides
a Bouffalo Lab UART driver using the "bflb,uart" compatible [2], and
supports the M1S Dock's E907 core [3].

This patch provides a polling UART console driver for OpenSBI.
Testing was performed on the Sipeed M1s Dock's C906 D0 core using
UART3 at 2 Mbaud, with the input clock and pinmux configured by
the preceding firmware.

The FDT frontend currently requires reg, clock-frequency and
current-speed. This patch does not add board initialization or
T-Head PMU support.

Validation:
- RV32 and RV64 cross-builds passed with the driver enabled.
- UART output through the OpenSBI banner and handoff to S-mode
  U-Boot was verified on the UART-only implementation.
- The board-tested revision was 6b317b61. The submitted revision
  differs only by leaving the driver disabled in generic defconfig;
  the UART driver sources are unchanged.
- UART RX, operation on the Ox64, and repeated cold boots remain
  untested.

[1] https://pine64.org/documentation/Ox64/
[2] https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
[3] https://docs.zephyrproject.org/latest/boards/sipeed/m1s_dock/doc/index.html

 include/sbi_utils/serial/bl808-uart.h |  11 +++
 lib/utils/serial/Kconfig              |   9 +++
 lib/utils/serial/bl808-uart.c         | 107 ++++++++++++++++++++++++++
 lib/utils/serial/fdt_serial_bl808.c   |  44 +++++++++++
 lib/utils/serial/objects.mk           |   4 +
 5 files changed, 175 insertions(+)
 create mode 100644 include/sbi_utils/serial/bl808-uart.h
 create mode 100644 lib/utils/serial/bl808-uart.c
 create mode 100644 lib/utils/serial/fdt_serial_bl808.c

diff --git a/include/sbi_utils/serial/bl808-uart.h b/include/sbi_utils/serial/bl808-uart.h
new file mode 100644
index 00000000..aa6281db
--- /dev/null
+++ b/include/sbi_utils/serial/bl808-uart.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+
+#ifndef __SERIAL_BL808_UART_H__
+#define __SERIAL_BL808_UART_H__
+
+#include <sbi/sbi_types.h>
+
+/* The caller must enable the input clock and configure the pinmux. */
+int bl808_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
+
+#endif
diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
index 21619d0d..15ede441 100644
--- a/lib/utils/serial/Kconfig
+++ b/lib/utils/serial/Kconfig
@@ -14,6 +14,11 @@ config FDT_SERIAL_ALTR_JUART
 	select SERIAL_ALTR_JUART
 	default n
 
+config FDT_SERIAL_BL808
+	bool "Bouffalo Lab BL808 UART FDT driver"
+	select SERIAL_BL808
+	default n
+
 config FDT_SERIAL_CADENCE
 	bool "Cadence UART FDT driver"
 	select SERIAL_CADENCE
@@ -65,6 +70,10 @@ config SERIAL_ALTR_JUART
 	bool "Altera JTAG UART support"
 	default n
 
+config SERIAL_BL808
+	bool "Bouffalo Lab BL808 UART support"
+	default n
+
 config SERIAL_CADENCE
 	bool "Cadence UART support"
 	default n
diff --git a/lib/utils/serial/bl808-uart.c b/lib/utils/serial/bl808-uart.c
new file mode 100644
index 00000000..e1f1ffbf
--- /dev/null
+++ b/lib/utils/serial/bl808-uart.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: BSD-2-Clause
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/serial/bl808-uart.h>
+
+#define UART_TX_CONFIG		0x00
+#define UART_RX_CONFIG		0x04
+#define UART_BIT_PERIOD		0x08
+#define UART_DATA_CONFIG	0x0c
+#define UART_SW_MODE		0x1c
+#define UART_INT_MASK		0x24
+#define UART_INT_CLEAR		0x28
+#define UART_INT_ENABLE		0x2c
+#define UART_FIFO_CONFIG0	0x80
+#define UART_FIFO_CONFIG1	0x84
+#define UART_FIFO_WDATA		0x88
+#define UART_FIFO_RDATA		0x8c
+
+#define UART_TX_ENABLE		BIT(0)
+#define UART_RX_ENABLE		BIT(0)
+#define UART_TX_FREE_RUN		BIT(2)
+#define UART_TX_DATA_BITS	(7 << 8)
+#define UART_TX_STOP_BITS	BIT(11)
+#define UART_RX_DATA_BITS	(7 << 8)
+#define UART_INT_MASK_ALL	0xfff
+#define UART_INT_CLEAR_ALL	0xf33
+#define UART_TX_FIFO_CLEAR	BIT(2)
+#define UART_RX_FIFO_CLEAR	BIT(3)
+#define UART_TX_FIFO_COUNT	0x3f
+#define UART_RX_FIFO_COUNT	(0x3f << 8)
+
+static volatile void *uart_base;
+
+static void bl808_uart_putc(char ch)
+{
+	while (!(readl(uart_base + UART_FIFO_CONFIG1) & UART_TX_FIFO_COUNT))
+		;
+
+	writeb(ch, uart_base + UART_FIFO_WDATA);
+}
+
+static int bl808_uart_getc(void)
+{
+	if (!(readl(uart_base + UART_FIFO_CONFIG1) & UART_RX_FIFO_COUNT))
+		return -1;
+
+	return readb(uart_base + UART_FIFO_RDATA);
+}
+
+static struct sbi_console_device bl808_console = {
+	.name = "bl808_uart",
+	.console_putc = bl808_uart_putc,
+	.console_getc = bl808_uart_getc,
+};
+
+int bl808_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
+{
+	u64 divisor;
+	u32 period;
+	int rc;
+
+	if (!base || (base & 3) || base > -1UL - PAGE_SIZE ||
+	    !in_freq || !baudrate)
+		return SBI_EINVAL;
+
+	divisor = ((u64)in_freq + baudrate / 2) / baudrate;
+	if (!divisor || divisor > 0x10000)
+		return SBI_EINVAL;
+
+	rc = sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
+					  (SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+	if (rc)
+		return rc;
+
+	uart_base = (void *)base;
+	writel(0, uart_base + UART_TX_CONFIG);
+	writel(0, uart_base + UART_RX_CONFIG);
+
+	/* The TX and RX period fields both encode divisor minus one. */
+	period = divisor - 1;
+	writel(period | (period << 16), uart_base + UART_BIT_PERIOD);
+	writel(UART_TX_FREE_RUN | UART_TX_DATA_BITS | UART_TX_STOP_BITS,
+	       uart_base + UART_TX_CONFIG);
+	writel(UART_RX_DATA_BITS, uart_base + UART_RX_CONFIG);
+	writel(0, uart_base + UART_DATA_CONFIG);
+	writel(0, uart_base + UART_SW_MODE);
+
+	/* Polling only: mask interrupts, disable DMA, and clear both FIFOs. */
+	writel(UART_INT_MASK_ALL, uart_base + UART_INT_MASK);
+	writel(0, uart_base + UART_INT_ENABLE);
+	writel(UART_INT_CLEAR_ALL, uart_base + UART_INT_CLEAR);
+	writel(UART_TX_FIFO_CLEAR | UART_RX_FIFO_CLEAR,
+	       uart_base + UART_FIFO_CONFIG0);
+	writel(0, uart_base + UART_FIFO_CONFIG1);
+
+	writel(UART_TX_FREE_RUN | UART_TX_DATA_BITS | UART_TX_STOP_BITS |
+	       UART_TX_ENABLE, uart_base + UART_TX_CONFIG);
+	writel(UART_RX_DATA_BITS | UART_RX_ENABLE, uart_base + UART_RX_CONFIG);
+
+	sbi_console_set_device(&bl808_console);
+
+	return 0;
+}
diff --git a/lib/utils/serial/fdt_serial_bl808.c b/lib/utils/serial/fdt_serial_bl808.c
new file mode 100644
index 00000000..99e19bae
--- /dev/null
+++ b/lib/utils/serial/fdt_serial_bl808.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: BSD-2-Clause
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/serial/bl808-uart.h>
+#include <sbi_utils/serial/fdt_serial.h>
+
+static int serial_bl808_init(const void *fdt, int nodeoff,
+			     const struct fdt_match *match)
+{
+	const fdt32_t *val;
+	u64 addr, size;
+	u32 freq, baud;
+	int len, rc;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, &size);
+	if (rc)
+		return rc;
+	if (size < 0x90 || addr != (unsigned long)addr)
+		return SBI_EINVAL;
+
+	val = fdt_getprop(fdt, nodeoff, "clock-frequency", &len);
+	if (!val || len != sizeof(*val))
+		return SBI_EINVAL;
+	freq = fdt32_to_cpu(*val);
+
+	val = fdt_getprop(fdt, nodeoff, "current-speed", &len);
+	if (!val || len != sizeof(*val))
+		return SBI_EINVAL;
+	baud = fdt32_to_cpu(*val);
+
+	return bl808_uart_init(addr, freq, baud);
+}
+
+static const struct fdt_match serial_bl808_match[] = {
+	{ .compatible = "bflb,bl808-uart" },
+	{ },
+};
+
+const struct fdt_driver fdt_serial_bl808 = {
+	.match_table = serial_bl808_match,
+	.init = serial_bl808_init,
+};
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index 94cf3a4b..d8659602 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -13,6 +13,9 @@ libsbiutils-objs-$(CONFIG_FDT_SERIAL) += serial/fdt_serial_drivers.carray.o
 carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_ALTR_JUART) += fdt_serial_altr_juart
 libsbiutils-objs-$(CONFIG_FDT_SERIAL_ALTR_JUART) += serial/fdt_serial_altr_juart.o
 
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_BL808) += fdt_serial_bl808
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_BL808) += serial/fdt_serial_bl808.o
+
 carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_CADENCE) += fdt_serial_cadence
 libsbiutils-objs-$(CONFIG_FDT_SERIAL_CADENCE) += serial/fdt_serial_cadence.o
 
@@ -41,6 +44,7 @@ carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += fdt_serial_xln
 libsbiutils-objs-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += serial/fdt_serial_xlnx_uartlite.o
 
 libsbiutils-objs-$(CONFIG_SERIAL_ALTR_JUART) += serial/altr-juart.o
+libsbiutils-objs-$(CONFIG_SERIAL_BL808) += serial/bl808-uart.o
 libsbiutils-objs-$(CONFIG_SERIAL_CADENCE) += serial/cadence-uart.o
 libsbiutils-objs-$(CONFIG_SERIAL_GAISLER) += serial/gaisler-uart.o
 libsbiutils-objs-$(CONFIG_SERIAL_RENESAS_SCIF) += serial/renesas_scif.o

base-commit: 6ad246a1494807ee91e36ffcf60e4c30bb309d45
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
