From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 13 Oct 2022 10:29:44 +0800
Subject: [PATCH v3 06/13] platform: andes/ae350: Use fdt serial driver
In-Reply-To: <20221013022951.5206-1-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com>
Message-ID: <20221013022951.5206-7-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andes UART is compatible with uart8250 driver. We can use
fdt_serial_init() as platform console init hook.

dts example:

  serial0: serial at f0300000 {
    compatible = "andestech,uart16550", "ns16550a";
    reg = <0x00000000 0xf0300000 0x00000000 0x00001000>;
    interrupts = <9 4>;
    interrupt-parent = <&plic0>;
    clock-frequency = <19660800>;
    current-speed = <38400>;
    reg-shift = <2>;
    reg-offset = <32>;
    reg-io-width = <4>;
    no-loopback-test = <1>;
  };

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v2 -> v3
  - No change since v2
---
 platform/andes/ae350/Kconfig    |  3 ++-
 platform/andes/ae350/platform.c | 15 ++-------------
 platform/andes/ae350/platform.h |  8 --------
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
index 3abad04..8dd8ebe 100644
--- a/platform/andes/ae350/Kconfig
+++ b/platform/andes/ae350/Kconfig
@@ -4,7 +4,8 @@ config PLATFORM_ANDES_AE350
 	bool
 	select FDT
 	select IRQCHIP_PLIC
-	select SERIAL_UART8250
+	select FDT_SERIAL
+	select FDT_SERIAL_UART8250
 	default y
 
 if PLATFORM_ANDES_AE350
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index c07f6be..04428d1 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -18,7 +18,7 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/irqchip/plic.h>
-#include <sbi_utils/serial/uart8250.h>
+#include <sbi_utils/serial/fdt_serial.h>
 #include "platform.h"
 #include "plicsw.h"
 #include "plmt.h"
@@ -43,17 +43,6 @@ static int ae350_final_init(bool cold_boot)
 	return 0;
 }
 
-/* Initialize the platform console. */
-static int ae350_console_init(void)
-{
-	return uart8250_init(AE350_UART_ADDR,
-			     AE350_UART_FREQUENCY,
-			     AE350_UART_BAUDRATE,
-			     AE350_UART_REG_SHIFT,
-			     AE350_UART_REG_WIDTH,
-			     AE350_UART_REG_OFFSET);
-}
-
 /* Initialize the platform interrupt controller for current HART. */
 static int ae350_irqchip_init(bool cold_boot)
 {
@@ -155,7 +144,7 @@ static int ae350_vendor_ext_provider(long extid, long funcid,
 const struct sbi_platform_operations platform_ops = {
 	.final_init = ae350_final_init,
 
-	.console_init = ae350_console_init,
+	.console_init = fdt_serial_init,
 
 	.irqchip_init = ae350_irqchip_init,
 
diff --git a/platform/andes/ae350/platform.h b/platform/andes/ae350/platform.h
index 9b54816..c699b7f 100644
--- a/platform/andes/ae350/platform.h
+++ b/platform/andes/ae350/platform.h
@@ -22,14 +22,6 @@
 
 #define AE350_L2C_ADDR			0xe0500000
 
-#define AE350_UART_ADDR_OFFSET		0x20
-#define AE350_UART_ADDR			(0xf0300000 + AE350_UART_ADDR_OFFSET)
-#define AE350_UART_FREQUENCY		19660800
-#define AE350_UART_BAUDRATE		38400
-#define AE350_UART_REG_SHIFT		2
-#define AE350_UART_REG_WIDTH		0
-#define AE350_UART_REG_OFFSET		0
-
 /*Memory and Miscellaneous Registers*/
 #define CSR_MILMB		0x7c0
 #define CSR_MDLMB		0x7c1
-- 
2.34.1


