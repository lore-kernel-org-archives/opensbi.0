From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Tue, 18 Aug 2020 17:48:37 +0200
Subject: [PATCH] platform: kendryte/k210: fixup FDT
Message-ID: <20200818154837.4190-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When passing the device tree to the next stage we should apply necessary
device tree fix-ups first. These include:

* fix up the CPU node in the device tree
* fix up the PLIC node in the device tree
* fix up the reserved memory node in the device tree

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 platform/kendryte/k210/platform.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index 5c28fd9..75883ed 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_const.h>
 #include <sbi/sbi_platform.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/irqchip/plic.h>
 #include <sbi_utils/serial/sifive-uart.h>
 #include <sbi_utils/sys/clint.h>
@@ -67,6 +68,21 @@ static u32 k210_get_clk_freq(void)
 	return pll0_freq / div;
 }

+static int k210_final_init(bool cold_boot)
+{
+	void *fdt;
+
+	if (!cold_boot)
+		return 0;
+
+	fdt = sbi_scratch_thishart_arg1_ptr();
+
+	fdt_cpu_fixup(fdt);
+	fdt_fixups(fdt);
+
+	return 0;
+}
+
 static int k210_console_init(void)
 {
 	return sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
@@ -122,6 +138,8 @@ static int k210_system_reset(u32 type)
 }

 const struct sbi_platform_operations platform_ops = {
+	.final_init	= k210_final_init,
+
 	.console_init	= k210_console_init,
 	.console_putc	= sifive_uart_putc,
 	.console_getc	= sifive_uart_getc,
--
2.28.0


