Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF211C2A06C
	for <opensbi@archiver.kernel.org>; Sun,  4 Jan 2026 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Lm7pDZRDh3IjRPToX3zFllJDz0GxE9R1pnW2tla/6Y=; b=UwwGOTcZr6sJnB
	dMiSvjF47rgULs9ggeuWTKZd4sx/Voo03v1Rl3ewBnGnHv5DB/6Je7YoKsoG1ltss9nVLv+7/3zLg
	arF7IWNr83lh0sK23G79NBL6xI1NhfDXR/ckYfnzolDSiVu4Sgm+Eaaw5DkV9XzolUFwEgR5jJRD5
	x8QvdGZvDX2X5juvmYSRCMBmei0rU37zcuEuhxDRsx+aUHpNqrNKDkA5DabNQypSBaYGnHuFOZio4
	jp2O3wy8JkDAScWoQGVTRgPbLjUoqdEHsKtd3DI7HJ4HbxCYe+xaR9a+XSLxsrmwFY+z3T/SGlR34
	y9k3HQx4L7Ts4IUg/aoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcI1F-0000000A4Ev-42sj;
	Sun, 04 Jan 2026 06:55:17 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcI1C-0000000A4EW-37pW
	for opensbi@lists.infradead.org;
	Sun, 04 Jan 2026 06:55:16 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.158])
	by APP-03 (Coremail) with SMTP id rQCowAA3T9bLDlppUrRSAw--.64369S2;
	Sun, 04 Jan 2026 14:55:08 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] lib: utils/serial: Add support for Altera JTAG UART
Date: Sun,  4 Jan 2026 14:55:06 +0800
Message-ID: <20260104065506.70182-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: rQCowAA3T9bLDlppUrRSAw--.64369S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKr1DtrWxAFW7XFy7Cr4fGrg_yoW3GrW5pr
	1DKFsrtw18tFyfu3yvyF1Yga1aq3ZYyry29ry7ZryftFySyw4ftFs2yFZrtrykXrZrAFW7
	Ar95urZakFnYqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-Originating-IP: [112.94.103.158]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_225515_199849_596DCE2A 
X-CRM114-Status: GOOD (  17.43  )
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

Altera provides a JTAG UART core that provides virtual UART over JTAG
and can coexist with their virtual JTAG. [1] This core has already been
supported by Linux and the programming interface has always been stable.

Add support for it to OpenSBI to ease JTAG prototype bringing up.

The driver follows the device tree binding in mainline Linux. [2]

[1] https://docs.altera.com/r/docs/683130/25.3/embedded-peripherals-ip-user-guide/jtag-uart-core
[2] https://github.com/torvalds/linux/blob/v6.19-rc1/Documentation/devicetree/bindings/serial/altr%2Cjuart-1.0.yaml

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 include/sbi_utils/serial/altr-juart.h    | 17 ++++++
 lib/utils/serial/Kconfig                 |  9 +++
 lib/utils/serial/altr-juart.c            | 74 ++++++++++++++++++++++++
 lib/utils/serial/fdt_serial_altr_juart.c | 40 +++++++++++++
 lib/utils/serial/objects.mk              |  4 ++
 platform/generic/configs/defconfig       |  1 +
 6 files changed, 145 insertions(+)
 create mode 100644 include/sbi_utils/serial/altr-juart.h
 create mode 100644 lib/utils/serial/altr-juart.c
 create mode 100644 lib/utils/serial/fdt_serial_altr_juart.c

diff --git a/include/sbi_utils/serial/altr-juart.h b/include/sbi_utils/serial/altr-juart.h
new file mode 100644
index 00000000..1304ee08
--- /dev/null
+++ b/include/sbi_utils/serial/altr-juart.h
@@ -0,0 +1,17 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 ISCAS
+ *
+ * Authors:
+ *   Icenowy Zheng <zhengxingda@iscas.ac.cn>
+ */
+
+#ifndef __SERIAL_ALTR_JUART_H__
+#define __SERIAL_ALTR_JUART_H__
+
+#include <sbi/sbi_types.h>
+
+int altr_juart_init(unsigned long base);
+
+#endif
diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
index e3589cac..21619d0d 100644
--- a/lib/utils/serial/Kconfig
+++ b/lib/utils/serial/Kconfig
@@ -9,6 +9,11 @@ config FDT_SERIAL
 
 if FDT_SERIAL
 
+config FDT_SERIAL_ALTR_JUART
+	bool "Altera JTAG UART FDT driver"
+	select SERIAL_ALTR_JUART
+	default n
+
 config FDT_SERIAL_CADENCE
 	bool "Cadence UART FDT driver"
 	select SERIAL_CADENCE
@@ -56,6 +61,10 @@ config FDT_SERIAL_XILINX_UARTLITE
 
 endif
 
+config SERIAL_ALTR_JUART
+	bool "Altera JTAG UART support"
+	default n
+
 config SERIAL_CADENCE
 	bool "Cadence UART support"
 	default n
diff --git a/lib/utils/serial/altr-juart.c b/lib/utils/serial/altr-juart.c
new file mode 100644
index 00000000..a230a561
--- /dev/null
+++ b/lib/utils/serial/altr-juart.c
@@ -0,0 +1,74 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 ISCAS
+ *
+ * Authors:
+ *   Icenowy Zheng <zhengxingda@iscas.ac.cn>
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi_utils/serial/altr-juart.h>
+
+/* clang-format off */
+
+#define JUART_DATA_OFFSET		0x00
+# define JUART_DATA_DATA_MASK		0x000000ff
+# define JUART_DATA_RVALID		(1 << 15)
+# define JUART_DATA_RAVAIL_MASK		0xffff0000
+# define JUART_DATA_RAVAIL_SHIFT	16
+#define JUART_CTRL_OFFSET		0x04
+# define JUART_CTRL_RE			(1 << 0)
+# define JUART_CTRL_WE			(1 << 1)
+# define JUART_CTRL_RI			(1 << 8)
+# define JUART_CTRL_WI			(1 << 9)
+# define JUART_CTRL_AC			(1 << 10)
+# define JUART_CTRL_WSPACE_MASK		0xffff0000
+# define JUART_CTRL_WSPACE_SHIFT	16
+
+/* clang-format on */
+
+static volatile char *altr_juart_base;
+
+static u32 get_reg(u32 offset)
+{
+	return readl(altr_juart_base + offset);
+}
+
+static void set_reg(u32 offset, u32 val)
+{
+	writel(val, altr_juart_base + offset);
+}
+
+static void altr_juart_putc(char ch)
+{
+	while(!(get_reg(JUART_CTRL_OFFSET) & JUART_CTRL_WSPACE_MASK))
+		;
+
+	set_reg(JUART_DATA_OFFSET, (unsigned char)ch);
+}
+
+static int altr_juart_getc(void)
+{
+	u32 reg = get_reg(JUART_DATA_OFFSET);
+	if (reg & JUART_DATA_RVALID)
+		return reg & JUART_DATA_DATA_MASK;
+
+	return -1;
+}
+
+static struct sbi_console_device altr_juart_console = {
+	.name = "altr-juart",
+	.console_putc = altr_juart_putc,
+	.console_getc = altr_juart_getc
+};
+
+int altr_juart_init(unsigned long base)
+{
+	altr_juart_base = (volatile char *)base;
+
+	sbi_console_set_device(&altr_juart_console);
+
+	return 0;
+}
diff --git a/lib/utils/serial/fdt_serial_altr_juart.c b/lib/utils/serial/fdt_serial_altr_juart.c
new file mode 100644
index 00000000..7901aa57
--- /dev/null
+++ b/lib/utils/serial/fdt_serial_altr_juart.c
@@ -0,0 +1,40 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 ISCAS
+ *
+ * Authors:
+ *   Icenowy Zheng <zhengxingda@iscas.ac.cn>
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/serial/fdt_serial.h>
+#include <sbi_utils/serial/altr-juart.h>
+
+static int serial_altr_juart_init(const void *fdt, int nodeoff,
+				  const struct fdt_match *match)
+{
+	uint64_t reg_addr, reg_size;
+	int rc;
+
+	if (nodeoff < 0 || !fdt)
+		return SBI_ENODEV;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
+	/* Two 32-bit registers */
+	if (rc < 0 || !reg_addr || !reg_size || reg_size < 0x8)
+		return SBI_ENODEV;
+
+	return altr_juart_init(reg_addr);
+}
+
+static const struct fdt_match serial_altr_juart_match[] = {
+	{ .compatible = "altr,juart-1.0" },
+	{ },
+};
+
+const struct fdt_driver fdt_serial_altr_juart = {
+	.match_table = serial_altr_juart_match,
+	.init = serial_altr_juart_init,
+};
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index 7c973c83..94cf3a4b 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -10,6 +10,9 @@
 libsbiutils-objs-$(CONFIG_FDT_SERIAL) += serial/fdt_serial.o
 libsbiutils-objs-$(CONFIG_FDT_SERIAL) += serial/fdt_serial_drivers.carray.o
 
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_ALTR_JUART) += fdt_serial_altr_juart
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_ALTR_JUART) += serial/fdt_serial_altr_juart.o
+
 carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_CADENCE) += fdt_serial_cadence
 libsbiutils-objs-$(CONFIG_FDT_SERIAL_CADENCE) += serial/fdt_serial_cadence.o
 
@@ -37,6 +40,7 @@ libsbiutils-objs-$(CONFIG_FDT_SERIAL_UART8250) += serial/fdt_serial_uart8250.o
 carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += fdt_serial_xlnx_uartlite
 libsbiutils-objs-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += serial/fdt_serial_xlnx_uartlite.o
 
+libsbiutils-objs-$(CONFIG_SERIAL_ALTR_JUART) += serial/altr-juart.o
 libsbiutils-objs-$(CONFIG_SERIAL_CADENCE) += serial/cadence-uart.o
 libsbiutils-objs-$(CONFIG_SERIAL_GAISLER) += serial/gaisler-uart.o
 libsbiutils-objs-$(CONFIG_SERIAL_RENESAS_SCIF) += serial/renesas_scif.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index aab1560f..9d977960 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -49,6 +49,7 @@ CONFIG_FDT_RESET_SG2042_HWMON_MCU=y
 CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SYSCON=y
 CONFIG_FDT_SERIAL=y
+CONFIG_FDT_SERIAL_ALTR_JUART=y
 CONFIG_FDT_SERIAL_CADENCE=y
 CONFIG_FDT_SERIAL_GAISLER=y
 CONFIG_FDT_SERIAL_HTIF=y
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
