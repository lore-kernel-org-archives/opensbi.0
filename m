From: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
Date: Fri,  8 Jul 2022 13:50:05 +0800
Subject: [PATCH] lib: utils: serial: Add Cadence UART driver
Message-ID: <20220708055005.26295-1-junliang.tan@linux.starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add Cadence UART driver

Signed-off-by: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
Signed-off-by: Wei Liang Lim <weiliang.lim@linux.starfivetech.com>
---
 include/sbi_utils/fdt/fdt_helper.h      |   3 +
 include/sbi_utils/serial/cadence-uart.h |  16 +++
 lib/utils/fdt/fdt_helper.c              |  35 +++++++
 lib/utils/serial/cadence-uart.c         | 125 ++++++++++++++++++++++++
 lib/utils/serial/fdt_serial.c           |   2 +
 lib/utils/serial/fdt_serial_cadence.c   |  35 +++++++
 lib/utils/serial/objects.mk             |   2 +
 7 files changed, 218 insertions(+)
 create mode 100644 include/sbi_utils/serial/cadence-uart.h
 create mode 100644 lib/utils/serial/cadence-uart.c
 create mode 100644 lib/utils/serial/fdt_serial_cadence.c

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 24fee7a..1166208 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -53,6 +53,9 @@ int fdt_parse_max_hart_id(void *fdt, u32 *max_hartid);
 
 int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq);
 
+int fdt_parse_cadence_uart_node(void *fdt, int nodeoffset,
+				struct platform_uart_data *uart);
+
 int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
diff --git a/include/sbi_utils/serial/cadence-uart.h b/include/sbi_utils/serial/cadence-uart.h
new file mode 100644
index 0000000..e75fb95
--- /dev/null
+++ b/include/sbi_utils/serial/cadence-uart.h
@@ -0,0 +1,16 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
+ */
+
+#ifndef __SERIAL_CADENCE_UART_H__
+#define __SERIAL_CADENCE_UART_H__
+
+#include <sbi/sbi_types.h>
+
+int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate);
+
+#endif
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 5bf4021..3ad0a5e 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -290,6 +290,41 @@ int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq)
 	return 0;
 }
 
+int fdt_parse_cadence_uart_node(void *fdt, int nodeoffset,
+				struct platform_uart_data *uart)
+{
+	int len, rc;
+	const fdt32_t *val;
+	u64 reg_addr, reg_size;
+
+	if (nodeoffset < 0 || !uart || !fdt)
+		return SBI_ENODEV;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
+	if (rc < 0 || !reg_addr || !reg_size)
+		return SBI_ENODEV;
+	uart->addr = reg_addr;
+
+	/**
+	 * UART address is mandatory. clock-frequency and current-speed
+	 * may not be present. Don't return error.
+	 */
+	val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "clock-frequency", &len);
+	if (len > 0 && val)
+		uart->freq = fdt32_to_cpu(*val);
+	else
+		uart->freq = DEFAULT_UART_FREQ;
+
+	val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "current-speed", &len);
+	if (len > 0 && val)
+		uart->baud = fdt32_to_cpu(*val);
+	else
+		uart->baud = DEFAULT_UART_BAUD;
+
+	return 0;
+}
+
 int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 				struct platform_uart_data *uart)
 {
diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
new file mode 100644
index 0000000..ffa79f8
--- /dev/null
+++ b/lib/utils/serial/cadence-uart.c
@@ -0,0 +1,125 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi_utils/serial/cadence-uart.h>
+
+/* clang-format off */
+
+#define UART_REG_OFFSET_CTRL		0x00	/* Control register */
+#define UART_REG_OFFSET_MODE		0x04	/* Mode register */
+#define UART_REG_OFFSET_CH_STS		0x2C	/* Channel status register */
+#define UART_REG_OFFSET_RX_TX_FIFO	0x30	/* RX and TX FIFO register */
+#define UART_REG_OFFSET_INT_DIS		0x0C	/* Interrupt disable register */
+#define UART_REG_OFFSET_BRG	0x18	/* Baud rate generator register */
+#define UART_REG_OFFSET_BRD	0x34	/* Baud rate divider register */
+
+/* Control register, 0x00 */
+#define UART_CR_TX_DIS	0x00000020	/* TX disabled, bit 5 */
+#define UART_CR_TX_EN	0x00000010	/* TX enabled, bit 4 */
+#define UART_CR_RX_DIS	0x00000008	/* RX disabled, bit 3 */
+#define UART_CR_RX_EN	0x00000004	/* RX enabled, bit 2*/
+#define UART_CR_TXRST	0x00000002	/* TX logic reset, bit 1 */
+#define UART_CR_RXRST	0x00000001	/* RX logic reset, bit 0 */
+
+/* Channel status register, 0x2C */
+#define	UART_CHSR_TXFULL	0x00000010	/* TX FIFO full, bit 4 */
+#define	UART_CHSR_RXEMPTY	0x00000002	/* RX FIFO empty, bit 1 */
+
+/* Mode register, 0x04 */
+#define UART_MR_PARITY_NONE	0x00000020	/* No parity set */
+
+/* Baud rate generator register, 0x18 */
+#define UART_BRG_CLK_DIVISOR	0x00000001	/* baud_sample = sel_clk */
+
+/* clang-format on */
+
+static volatile void *uart_base;
+static u32 uart_in_freq;
+static u32 uart_baudrate;
+
+/**
+ * Find minimum divisor divides in_freq to max_target_hz;
+ * Based on SiFive UART driver (sifive-uart.c)
+ */
+static inline unsigned int uart_min_clk_divisor(uint64_t in_freq,
+						uint64_t max_target_hz)
+{
+	uint64_t quotient = (in_freq + max_target_hz - 1) / (max_target_hz);
+	/* Avoid underflow */
+	if (quotient == 0)
+		return 0;
+	else
+		return quotient - 1;
+}
+
+static u32 get_reg(u32 offset)
+{
+	return readl(uart_base + offset);
+}
+
+static void set_reg(u32 offset, u32 val)
+{
+	writel(val, uart_base + offset);
+}
+
+static void cadence_uart_putc(char ch)
+{
+	while (get_reg(UART_REG_OFFSET_CH_STS) & UART_CHSR_TXFULL)
+		;
+
+	set_reg(UART_REG_OFFSET_RX_TX_FIFO, ch);
+}
+
+static int cadence_uart_getc(void)
+{
+	u32 ret = get_reg(UART_REG_OFFSET_CH_STS);
+
+	if (!(ret & UART_CHSR_RXEMPTY))
+		return get_reg(UART_REG_OFFSET_RX_TX_FIFO);
+	return -1;
+}
+
+static struct sbi_console_device cadence_console = {
+	.name = "cadence_uart",
+	.console_putc = cadence_uart_putc,
+	.console_getc = cadence_uart_getc
+};
+
+int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
+{
+	uart_base     = (volatile void *)base;
+	uart_in_freq  = in_freq;
+	uart_baudrate = baudrate;
+
+	/* Disable interrupts */
+	set_reg(UART_REG_OFFSET_INT_DIS, 0xFFFFFFFF);
+	/* Disable TX RX */
+	set_reg(UART_REG_OFFSET_CTRL, UART_CR_TX_DIS | UART_CR_RX_DIS);
+	/* Configure baudrate */
+	if (in_freq) {
+		set_reg(UART_REG_OFFSET_BRG, UART_BRG_CLK_DIVISOR);
+		set_reg(UART_REG_OFFSET_BRD,
+			uart_min_clk_divisor(in_freq, baudrate));
+	}
+	/* Software reset TX RX data path and enable TX RX */
+	set_reg(UART_REG_OFFSET_CTRL, UART_CR_TXRST | UART_CR_RXRST
+		| UART_CR_TX_EN | UART_CR_RX_EN);
+	/* Set:
+	 * 1 stop bit, bits[07:06] = 0x00,
+	 * no parity set, bits[05:03] = 0x100,
+	 * 8 bits character length, bits[02:01] = 0x00,
+	 * sel_clk = uart_clk, bit[0] = 0x0
+	 */
+	set_reg(UART_REG_OFFSET_MODE, UART_MR_PARITY_NONE);
+
+	sbi_console_set_device(&cadence_console);
+
+	return 0;
+}
diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index f73d26a..460f516 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -13,6 +13,7 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/serial/fdt_serial.h>
 
+extern struct fdt_serial fdt_serial_cadence;
 extern struct fdt_serial fdt_serial_uart8250;
 extern struct fdt_serial fdt_serial_sifive;
 extern struct fdt_serial fdt_serial_litex;
@@ -21,6 +22,7 @@ extern struct fdt_serial fdt_serial_shakti;
 extern struct fdt_serial fdt_serial_gaisler;
 
 static struct fdt_serial *serial_drivers[] = {
+	&fdt_serial_cadence,
 	&fdt_serial_uart8250,
 	&fdt_serial_sifive,
 	&fdt_serial_litex,
diff --git a/lib/utils/serial/fdt_serial_cadence.c b/lib/utils/serial/fdt_serial_cadence.c
new file mode 100644
index 0000000..f6f13d6
--- /dev/null
+++ b/lib/utils/serial/fdt_serial_cadence.c
@@ -0,0 +1,35 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
+ */
+
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/serial/fdt_serial.h>
+#include <sbi_utils/serial/cadence-uart.h>
+
+static int serial_cadence_init(void *fdt, int nodeoff,
+			       const struct fdt_match *match)
+{
+	int rc;
+	struct platform_uart_data uart;
+
+	rc = fdt_parse_cadence_uart_node(fdt, nodeoff, &uart);
+	if (rc)
+		return rc;
+
+	return cadence_uart_init(uart.addr, uart.freq, uart.baud);
+}
+
+static const struct fdt_match serial_cadence_match[] = {
+	{ .compatible = "cdns,uart-r1p12" },
+	{ .compatible = "starfive,jh8100-uart" },
+	{ },
+};
+
+struct fdt_serial fdt_serial_cadence = {
+	.match_table = serial_cadence_match,
+	.init = serial_cadence_init
+};
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index 4f751ba..c201d76 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -8,12 +8,14 @@
 #
 
 libsbiutils-objs-y += serial/fdt_serial.o
+libsbiutils-objs-y += serial/fdt_serial_cadence.o
 libsbiutils-objs-y += serial/fdt_serial_gaisler.o
 libsbiutils-objs-y += serial/fdt_serial_htif.o
 libsbiutils-objs-y += serial/fdt_serial_shakti.o
 libsbiutils-objs-y += serial/fdt_serial_sifive.o
 libsbiutils-objs-y += serial/fdt_serial_litex.o
 libsbiutils-objs-y += serial/fdt_serial_uart8250.o
+libsbiutils-objs-y += serial/cadence-uart.o
 libsbiutils-objs-y += serial/gaisler-uart.o
 libsbiutils-objs-y += serial/shakti-uart.o
 libsbiutils-objs-y += serial/sifive-uart.o
-- 
2.25.1



