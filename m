From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 13 Oct 2022 10:29:47 +0800
Subject: [PATCH v3 09/13] platform: andes/ae350: Use fdt irqchip driver
In-Reply-To: <20221013022951.5206-1-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com>
Message-ID: <20221013022951.5206-10-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andes PLIC is compatible with plic driver. The PLIC base address and
number of source can be obtained by parsing the device tree.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v2 -> v3
  - No change since v2
---
 platform/andes/ae350/Kconfig    |  3 ++-
 platform/andes/ae350/platform.c | 24 ++----------------------
 platform/andes/ae350/platform.h |  3 ---
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
index 8486f08..084b27f 100644
--- a/platform/andes/ae350/Kconfig
+++ b/platform/andes/ae350/Kconfig
@@ -3,13 +3,14 @@
 config PLATFORM_ANDES_AE350
 	bool
 	select FDT
-	select IRQCHIP_PLIC
 	select FDT_SERIAL
 	select FDT_SERIAL_UART8250
 	select FDT_TIMER
 	select FDT_TIMER_PLMT
 	select FDT_RESET
 	select FDT_RESET_ATCWDT200
+	select FDT_IRQCHIP
+	select FDT_IRQCHIP_PLIC
 	default y
 
 if PLATFORM_ANDES_AE350
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index c6a8eeb..98acaaa 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -17,7 +17,7 @@
 #include <sbi/sbi_trap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
-#include <sbi_utils/irqchip/plic.h>
+#include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/reset/fdt_reset.h>
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/timer/fdt_timer.h>
@@ -25,11 +25,6 @@
 #include "plicsw.h"
 #include "cache.h"
 
-static struct plic_data plic = {
-	.addr = AE350_PLIC_ADDR,
-	.num_src = AE350_PLIC_NUM_SOURCES,
-};
-
 /* Platform final initialization. */
 static int ae350_final_init(bool cold_boot)
 {
@@ -46,21 +41,6 @@ static int ae350_final_init(bool cold_boot)
 	return 0;
 }
 
-/* Initialize the platform interrupt controller for current HART. */
-static int ae350_irqchip_init(bool cold_boot)
-{
-	u32 hartid = current_hartid();
-	int ret;
-
-	if (cold_boot) {
-		ret = plic_cold_irqchip_init(&plic);
-		if (ret)
-			return ret;
-	}
-
-	return plic_warm_irqchip_init(&plic, 2 * hartid, 2 * hartid + 1);
-}
-
 static struct sbi_ipi_device plicsw_ipi = {
 	.name = "ae350_plicsw",
 	.ipi_send = plicsw_ipi_send,
@@ -134,7 +114,7 @@ const struct sbi_platform_operations platform_ops = {
 
 	.console_init = fdt_serial_init,
 
-	.irqchip_init = ae350_irqchip_init,
+	.irqchip_init = fdt_irqchip_init,
 
 	.ipi_init     = ae350_ipi_init,
 
diff --git a/platform/andes/ae350/platform.h b/platform/andes/ae350/platform.h
index 6a29fe5..3264b6f 100644
--- a/platform/andes/ae350/platform.h
+++ b/platform/andes/ae350/platform.h
@@ -13,9 +13,6 @@
 
 #define AE350_HART_COUNT		4
 
-#define AE350_PLIC_ADDR			0xe4000000
-#define AE350_PLIC_NUM_SOURCES		71
-
 #define AE350_PLICSW_ADDR		0xe6400000
 
 #define AE350_L2C_ADDR			0xe0500000
-- 
2.34.1


