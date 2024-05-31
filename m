From: Xiang W <wxjstz@126.com>
Date: Fri, 31 May 2024 23:33:18 +0800
Subject: [PATCH] lib: utils/serial: Improved 8250 driver
Message-ID: <20240531153401.1530927-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous 8250 driver can only be used as a console. On some
platforms, there are multiple 8250s, one of which is used as a
console, and another may be used to communicate with the MCU to
perform some operations, such as power management, obtaining
motherboard information, etc.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi_utils/serial/uart8250.h    |  17 +++-
 lib/utils/serial/fdt_serial_uart8250.c |   2 +-
 lib/utils/serial/uart8250.c            | 108 ++++++++++++++-----------
 platform/fpga/ariane/platform.c        |   2 +-
 platform/fpga/openpiton/platform.c     |   2 +-
 platform/template/platform.c           |   2 +-
 6 files changed, 79 insertions(+), 54 deletions(-)

diff --git a/include/sbi_utils/serial/uart8250.h b/include/sbi_utils/serial/uart8250.h
index d4a8c13..be9483a 100644
--- a/include/sbi_utils/serial/uart8250.h
+++ b/include/sbi_utils/serial/uart8250.h
@@ -12,7 +12,20 @@
 
 #include <sbi/sbi_types.h>
 
-int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
-		  u32 reg_width, u32 reg_offset);
+struct uart8250_device {
+	volatile char * base;
+	u32 in_freq;
+	u32 baudrate;
+	u32 reg_shift;
+	u32 reg_width;
+};
+
+void uart8250_putc(struct uart8250_device *dev, char ch);
+int uart8250_getc(struct uart8250_device *dev);
+int uart8250_init(struct uart8250_device * dev, unsigned long base, u32 in_freq,
+		  u32 baudrate, u32 reg_shift, u32 reg_width, u32 reg_offset);
+
+int uart8250_console_init(unsigned long base, u32 in_freq, u32 baudrate,
+		  u32 reg_shift, u32 reg_width, u32 reg_offset);
 
 #endif
diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
index 7b5d6a4..182bfaf 100644
--- a/lib/utils/serial/fdt_serial_uart8250.c
+++ b/lib/utils/serial/fdt_serial_uart8250.c
@@ -21,7 +21,7 @@ static int serial_uart8250_init(void *fdt, int nodeoff,
 	if (rc)
 		return rc;
 
-	return uart8250_init(uart.addr, uart.freq, uart.baud,
+	return uart8250_console_init(uart.addr, uart.freq, uart.baud,
 			     uart.reg_shift, uart.reg_io_width,
 			     uart.reg_offset);
 }
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 1fe053f..db35ec3 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -41,97 +41,109 @@
 
 /* clang-format on */
 
-static volatile char *uart8250_base;
-static u32 uart8250_in_freq;
-static u32 uart8250_baudrate;
-static u32 uart8250_reg_width;
-static u32 uart8250_reg_shift;
+static struct uart8250_device console_dev;
 
-static u32 get_reg(u32 num)
+static u32 get_reg(struct uart8250_device *dev, u32 num)
 {
-	u32 offset = num << uart8250_reg_shift;
+	u32 offset = num << dev->reg_shift;
 
-	if (uart8250_reg_width == 1)
-		return readb(uart8250_base + offset);
-	else if (uart8250_reg_width == 2)
-		return readw(uart8250_base + offset);
+	if (dev->reg_width == 1)
+		return readb(dev->base + offset);
+	else if (dev->reg_width == 2)
+		return readw(dev->base + offset);
 	else
-		return readl(uart8250_base + offset);
+		return readl(dev->base + offset);
 }
 
-static void set_reg(u32 num, u32 val)
+static void set_reg(struct uart8250_device *dev, u32 num, u32 val)
 {
-	u32 offset = num << uart8250_reg_shift;
+	u32 offset = num << dev->reg_shift;
 
-	if (uart8250_reg_width == 1)
-		writeb(val, uart8250_base + offset);
-	else if (uart8250_reg_width == 2)
-		writew(val, uart8250_base + offset);
+	if (dev->reg_width == 1)
+		writeb(val, dev->base + offset);
+	else if (dev->reg_width == 2)
+		writew(val, dev->base + offset);
 	else
-		writel(val, uart8250_base + offset);
+		writel(val, dev->base + offset);
 }
 
-static void uart8250_putc(char ch)
+void uart8250_putc(struct uart8250_device *dev, char ch)
 {
-	while ((get_reg(UART_LSR_OFFSET) & UART_LSR_THRE) == 0)
+	while ((get_reg(dev, UART_LSR_OFFSET) & UART_LSR_THRE) == 0)
 		;
 
-	set_reg(UART_THR_OFFSET, ch);
+	set_reg(dev, UART_THR_OFFSET, ch);
 }
 
-static int uart8250_getc(void)
+int uart8250_getc(struct uart8250_device *dev)
 {
-	if (get_reg(UART_LSR_OFFSET) & UART_LSR_DR)
-		return get_reg(UART_RBR_OFFSET);
+	if (get_reg(dev, UART_LSR_OFFSET) & UART_LSR_DR)
+		return get_reg(dev, UART_RBR_OFFSET);
 	return -1;
 }
 
+static void uart8250_console_putc(char ch)
+{
+	uart8250_putc(&console_dev, ch);
+}
+
+static int uart8250_console_getc(void)
+{
+	return uart8250_getc(&console_dev);
+}
+
 static struct sbi_console_device uart8250_console = {
 	.name = "uart8250",
-	.console_putc = uart8250_putc,
-	.console_getc = uart8250_getc
+	.console_putc = uart8250_console_putc,
+	.console_getc = uart8250_console_getc
 };
 
-int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
-		  u32 reg_width, u32 reg_offset)
+int uart8250_init(struct uart8250_device * dev, unsigned long base, u32 in_freq,
+		  u32 baudrate, u32 reg_shift, u32 reg_width, u32 reg_offset)
 {
 	u16 bdiv = 0;
 
-	uart8250_base      = (volatile char *)base + reg_offset;
-	uart8250_reg_shift = reg_shift;
-	uart8250_reg_width = reg_width;
-	uart8250_in_freq   = in_freq;
-	uart8250_baudrate  = baudrate;
+	dev->base      = (volatile char *)base + reg_offset;
+	dev->reg_shift = reg_shift;
+	dev->reg_width = reg_width;
+	dev->in_freq   = in_freq;
+	dev->baudrate  = baudrate;
 
-	if (uart8250_baudrate) {
-		bdiv = (uart8250_in_freq + 8 * uart8250_baudrate) /
-		       (16 * uart8250_baudrate);
-	}
+	if (baudrate)
+		bdiv = (in_freq + 8 * baudrate) / (16 * baudrate);
 
 	/* Disable all interrupts */
-	set_reg(UART_IER_OFFSET, 0x00);
+	set_reg(dev, UART_IER_OFFSET, 0x00);
 	/* Enable DLAB */
-	set_reg(UART_LCR_OFFSET, 0x80);
+	set_reg(dev, UART_LCR_OFFSET, 0x80);
 
 	if (bdiv) {
 		/* Set divisor low byte */
-		set_reg(UART_DLL_OFFSET, bdiv & 0xff);
+		set_reg(dev, UART_DLL_OFFSET, bdiv & 0xff);
 		/* Set divisor high byte */
-		set_reg(UART_DLM_OFFSET, (bdiv >> 8) & 0xff);
+		set_reg(dev, UART_DLM_OFFSET, (bdiv >> 8) & 0xff);
 	}
 
 	/* 8 bits, no parity, one stop bit */
-	set_reg(UART_LCR_OFFSET, 0x03);
+	set_reg(dev, UART_LCR_OFFSET, 0x03);
 	/* Enable FIFO */
-	set_reg(UART_FCR_OFFSET, 0x01);
+	set_reg(dev, UART_FCR_OFFSET, 0x01);
 	/* No modem control DTR RTS */
-	set_reg(UART_MCR_OFFSET, 0x00);
+	set_reg(dev, UART_MCR_OFFSET, 0x00);
 	/* Clear line status */
-	get_reg(UART_LSR_OFFSET);
+	get_reg(dev, UART_LSR_OFFSET);
 	/* Read receive buffer */
-	get_reg(UART_RBR_OFFSET);
+	get_reg(dev, UART_RBR_OFFSET);
 	/* Set scratchpad */
-	set_reg(UART_SCR_OFFSET, 0x00);
+	set_reg(dev, UART_SCR_OFFSET, 0x00);
+
+	return 0;
+}
+
+int uart8250_console_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
+		  u32 reg_width, u32 reg_offset)
+{
+	uart8250_init(&console_dev, base, in_freq, baudrate, reg_shift, reg_width, reg_offset);
 
 	sbi_console_set_device(&uart8250_console);
 
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 8be5e6c..a59b74d 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -92,7 +92,7 @@ static int ariane_final_init(bool cold_boot)
  */
 static int ariane_console_init(void)
 {
-	return uart8250_init(ARIANE_UART_ADDR,
+	return uart8250_console_init(ARIANE_UART_ADDR,
 			     ARIANE_UART_FREQ,
 			     ARIANE_UART_BAUDRATE,
 			     ARIANE_UART_REG_SHIFT,
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 2317a89..21f3ccd 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -127,7 +127,7 @@ static int openpiton_final_init(bool cold_boot)
  */
 static int openpiton_console_init(void)
 {
-	return uart8250_init(uart.addr,
+	return uart8250_console_init(uart.addr,
 			     uart.freq,
 			     uart.baud,
 			     OPENPITON_DEFAULT_UART_REG_SHIFT,
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 4b3f2ac..59a377b 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -81,7 +81,7 @@ static int platform_final_init(bool cold_boot)
 static int platform_console_init(void)
 {
 	/* Example if the generic UART8250 driver is used */
-	return uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
+	return uart8250_console_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
 			     PLATFORM_UART_BAUDRATE, 0, 1, 0);
 }
 
-- 
2.43.0


