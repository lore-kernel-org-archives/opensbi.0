From: Zong Li <zong.li@sifive.com>
Date: Fri,  8 Apr 2022 07:36:28 +0000
Subject: [PATCH] lib: utils/serial: support 'reg-offset' property
Message-ID: <20220408073628.8962-1-zong.li@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

reg-offset property is used for offset to apply to the mapbase
from the start of the registers in 8250 UART. In Linux kernel,
it has been handled in 8250 UART driver.

dt-bindinds:
<linux>/Documentation/devicetree/bindings/serial/8250.yaml

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 include/sbi_utils/fdt/fdt_helper.h     | 1 +
 include/sbi_utils/serial/uart8250.h    | 2 +-
 lib/utils/fdt/fdt_helper.c             | 7 +++++++
 lib/utils/serial/fdt_serial_uart8250.c | 3 ++-
 lib/utils/serial/uart8250.c            | 4 ++--
 platform/andes/ae350/platform.c        | 3 ++-
 platform/andes/ae350/platform.h        | 1 +
 platform/fpga/ariane/platform.c        | 4 +++-
 platform/fpga/openpiton/platform.c     | 4 +++-
 platform/template/platform.c           | 2 +-
 10 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 41ee826..2279f96 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -31,6 +31,7 @@ struct platform_uart_data {
 	unsigned long baud;
 	unsigned long reg_shift;
 	unsigned long reg_io_width;
+	unsigned long reg_offset;
 };
 
 const struct fdt_match *fdt_match_node(void *fdt, int nodeoff,
diff --git a/include/sbi_utils/serial/uart8250.h b/include/sbi_utils/serial/uart8250.h
index 6b9b48b..d4a8c13 100644
--- a/include/sbi_utils/serial/uart8250.h
+++ b/include/sbi_utils/serial/uart8250.h
@@ -13,6 +13,6 @@
 #include <sbi/sbi_types.h>
 
 int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
-		  u32 reg_width);
+		  u32 reg_width, u32 reg_offset);
 
 #endif
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 4dd0602..9a35969 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -21,6 +21,7 @@
 #define DEFAULT_UART_BAUD		115200
 #define DEFAULT_UART_REG_SHIFT		0
 #define DEFAULT_UART_REG_IO_WIDTH	1
+#define DEFAULT_UART_REG_OFFSET		0
 
 #define DEFAULT_SIFIVE_UART_FREQ		0
 #define DEFAULT_SIFIVE_UART_BAUD		115200
@@ -449,6 +450,12 @@ int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
 	else
 		uart->reg_io_width = DEFAULT_UART_REG_IO_WIDTH;
 
+	val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "reg-offset", &len);
+	if (len > 0 && val)
+		uart->reg_offset = fdt32_to_cpu(*val);
+	else
+		uart->reg_offset = DEFAULT_UART_REG_OFFSET;
+
 	return 0;
 }
 
diff --git a/lib/utils/serial/fdt_serial_uart8250.c b/lib/utils/serial/fdt_serial_uart8250.c
index 36f364c..544b741 100644
--- a/lib/utils/serial/fdt_serial_uart8250.c
+++ b/lib/utils/serial/fdt_serial_uart8250.c
@@ -22,7 +22,8 @@ static int serial_uart8250_init(void *fdt, int nodeoff,
 		return rc;
 
 	return uart8250_init(uart.addr, uart.freq, uart.baud,
-			     uart.reg_shift, uart.reg_io_width);
+			     uart.reg_shift, uart.reg_io_width,
+			     uart.reg_offset);
 }
 
 static const struct fdt_match serial_uart8250_match[] = {
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 141bd45..38ea11a 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -91,11 +91,11 @@ static struct sbi_console_device uart8250_console = {
 };
 
 int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
-		  u32 reg_width)
+		  u32 reg_width, u32 reg_offset)
 {
 	u16 bdiv;
 
-	uart8250_base      = (volatile char *)base;
+	uart8250_base      = (volatile char *)base + reg_offset;
 	uart8250_reg_shift = reg_shift;
 	uart8250_reg_width = reg_width;
 	uart8250_in_freq   = in_freq;
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 01232d0..6bd0a69 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -69,7 +69,8 @@ static int ae350_console_init(void)
 			     AE350_UART_FREQUENCY,
 			     AE350_UART_BAUDRATE,
 			     AE350_UART_REG_SHIFT,
-			     AE350_UART_REG_WIDTH);
+			     AE350_UART_REG_WIDTH,
+			     AE350_UART_REG_OFFSET);
 }
 
 /* Initialize the platform interrupt controller for current HART. */
diff --git a/platform/andes/ae350/platform.h b/platform/andes/ae350/platform.h
index f34ca0f..9b54816 100644
--- a/platform/andes/ae350/platform.h
+++ b/platform/andes/ae350/platform.h
@@ -28,6 +28,7 @@
 #define AE350_UART_BAUDRATE		38400
 #define AE350_UART_REG_SHIFT		2
 #define AE350_UART_REG_WIDTH		0
+#define AE350_UART_REG_OFFSET		0
 
 /*Memory and Miscellaneous Registers*/
 #define CSR_MILMB		0x7c0
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index c6f0ffd..3fdc03b 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -23,6 +23,7 @@
 #define ARIANE_UART_BAUDRATE			115200
 #define ARIANE_UART_REG_SHIFT			2
 #define ARIANE_UART_REG_WIDTH			4
+#define ARIANE_UART_REG_OFFSET			0
 #define ARIANE_PLIC_ADDR			0xc000000
 #define ARIANE_PLIC_NUM_SOURCES			3
 #define ARIANE_HART_COUNT			1
@@ -92,7 +93,8 @@ static int ariane_console_init(void)
 			     ARIANE_UART_FREQ,
 			     ARIANE_UART_BAUDRATE,
 			     ARIANE_UART_REG_SHIFT,
-			     ARIANE_UART_REG_WIDTH);
+			     ARIANE_UART_REG_WIDTH,
+			     ARIANE_UART_REG_OFFSET);
 }
 
 static int plic_ariane_warm_irqchip_init(int m_cntx_id, int s_cntx_id)
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 59c6702..15e289a 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -22,6 +22,7 @@
 #define OPENPITON_DEFAULT_UART_BAUDRATE		115200
 #define OPENPITON_DEFAULT_UART_REG_SHIFT	0
 #define OPENPITON_DEFAULT_UART_REG_WIDTH	1
+#define OPENPITON_DEFAULT_UART_REG_OFFSET	0
 #define OPENPITON_DEFAULT_PLIC_ADDR		0xfff1100000
 #define OPENPITON_DEFAULT_PLIC_NUM_SOURCES	2
 #define OPENPITON_DEFAULT_HART_COUNT		3
@@ -127,7 +128,8 @@ static int openpiton_console_init(void)
 			     uart.freq,
 			     uart.baud,
 			     OPENPITON_DEFAULT_UART_REG_SHIFT,
-			     OPENPITON_DEFAULT_UART_REG_WIDTH);
+			     OPENPITON_DEFAULT_UART_REG_WIDTH,
+			     OPENPITON_DEFAULT_UART_REG_OFFSET);
 }
 
 static int plic_openpiton_warm_irqchip_init(int m_cntx_id, int s_cntx_id)
diff --git a/platform/template/platform.c b/platform/template/platform.c
index d6806e6..5524847 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -79,7 +79,7 @@ static int platform_console_init(void)
 {
 	/* Example if the generic UART8250 driver is used */
 	return uart8250_init(PLATFORM_UART_ADDR, PLATFORM_UART_INPUT_FREQ,
-			     PLATFORM_UART_BAUDRATE, 0, 1);
+			     PLATFORM_UART_BAUDRATE, 0, 1, 0);
 }
 
 /*
-- 
2.17.1


