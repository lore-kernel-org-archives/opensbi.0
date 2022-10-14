From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 14 Oct 2022 08:32:47 +0800
Subject: [PATCH v4 09/14] lib: utils/reset: Add Andes fdt reset driver support
In-Reply-To: <20221014003252.17765-1-peterlin@andestech.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
Message-ID: <20221014003252.17765-10-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add ATCWDT200 as reset device of AE350 platform, this driver requires
SMU to program the reset vector registers before triggering WDT software
restart signal.

dts example:

  smu at f0100000 {
    compatible = "andestech,atcsmu";
    reg = <0x00000000 0xf0100000 0x00000000 0x00001000>;
  };

  wdt: wdt at f0500000 {
    compatible = "andestech,atcwdt200";
    reg = <0x00000000 0xf0500000 0x00000000 0x00001000>;
    interrupts = <3 4>;
    interrupt-parent = <&plic0>;
    clock-frequency = <15000000>;
  };

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/utils/reset/Kconfig               |   4 +
 lib/utils/reset/fdt_reset_atcwdt200.c | 122 ++++++++++++++++++++++++++
 lib/utils/reset/objects.mk            |   3 +
 platform/andes/ae350/Kconfig          |   2 +
 platform/andes/ae350/platform.c       |   3 +
 5 files changed, 134 insertions(+)
 create mode 100644 lib/utils/reset/fdt_reset_atcwdt200.c

diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index 2e83ff6..0e0c2c1 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -9,6 +9,10 @@ config FDT_RESET
 
 if FDT_RESET
 
+config FDT_RESET_ATCWDT200
+	bool "Andes WDT FDT reset driver"
+	default n
+
 config FDT_RESET_GPIO
 	bool "GPIO FDT reset driver"
 	depends on FDT_GPIO
diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
new file mode 100644
index 0000000..91acc9f
--- /dev/null
+++ b/lib/utils/reset/fdt_reset_atcwdt200.c
@@ -0,0 +1,122 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Andes Technology Corporation
+ *
+ * Authors:
+ *   Yu Chien Peter Lin <peterlin@andestech.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/reset/fdt_reset.h>
+
+#define ATCWDT200_WP_NUM 0x5aa5
+#define WREN_REG 0x18
+#define CTRL_REG 0x10
+#define RST_TIME_OFF 8
+#define RST_TIME_MSK (0x3 << RST_TIME_OFF)
+#define RST_CLK_128 (0 << RST_TIME_OFF)
+#define RST_CLK_256 (1 << RST_TIME_OFF)
+#define RST_CLK_512 (2 << RST_TIME_OFF)
+#define RST_CLK_1024 (3 << RST_TIME_OFF)
+#define INT_TIME_OFF 4
+#define INT_TIME_MSK (0xf << INT_TIME_OFF)
+#define INT_CLK_64 (0 << INT_TIME_OFF)
+#define INT_CLK_256 (1 << INT_TIME_OFF)
+#define INT_CLK_1024 (2 << INT_TIME_OFF)
+#define INT_CLK_2048 (3 << INT_TIME_OFF)
+#define INT_CLK_4096 (4 << INT_TIME_OFF)
+#define INT_CLK_8192 (5 << INT_TIME_OFF)
+#define INT_CLK_16384 (6 << INT_TIME_OFF)
+#define INT_CLK_32768 (7 << INT_TIME_OFF)
+#define RST_EN (1 << 3)
+#define INT_EN (1 << 2)
+#define CLK_PCLK (1 << 1)
+#define WDT_EN (1 << 0)
+
+#define FLASH_BASE 0x80000000ULL
+#define SMU_RESET_VEC_LO_OFF 0x50
+#define SMU_RESET_VEC_HI_OFF 0x60
+#define SMU_HARTn_RESET_VEC_LO(n) (SMU_RESET_VEC_LO_OFF + (n * 0x4))
+#define SMU_HARTn_RESET_VEC_HI(n) (SMU_RESET_VEC_HI_OFF + (n * 0x4))
+
+static volatile char *wdt_addr;
+static volatile char *smu_addr;
+
+static int ae350_system_reset_check(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+		return 1;
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+	default:
+		return 0;
+	}
+}
+
+static void ae350_system_reset(u32 type, u32 reason)
+{
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+
+	for (int i = 0; i < sbi_platform_hart_count(plat); i++) {
+		writel(FLASH_BASE, smu_addr + SMU_HARTn_RESET_VEC_LO(i));
+		writel(FLASH_BASE >> 32, smu_addr + SMU_HARTn_RESET_VEC_HI(i));
+	}
+
+	/* Program WDT control register  */
+	writew(ATCWDT200_WP_NUM, wdt_addr + WREN_REG);
+	writel(INT_CLK_32768 | INT_EN | RST_CLK_128 | RST_EN | WDT_EN,
+	       wdt_addr + CTRL_REG);
+
+	sbi_hart_hang();
+}
+
+static struct sbi_system_reset_device atcwdt200_reset = {
+	.name		    = "atcwdt200",
+	.system_reset_check = ae350_system_reset_check,
+	.system_reset	    = ae350_system_reset,
+};
+
+static int atcwdt200_reset_init(void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
+	uint64_t reg_addr;
+	int rc;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, NULL);
+	if (rc < 0 || !reg_addr)
+		return SBI_ENODEV;
+
+	wdt_addr = (volatile char *)(unsigned long)reg_addr;
+
+	/*
+	 * The reset device requires smu to program the reset
+	 * vector for each hart.
+	 */
+	if (fdt_parse_compat_addr(fdt, &reg_addr, "andestech,atcsmu"))
+		return SBI_ENODEV;
+
+	smu_addr = (volatile char *)(unsigned long)reg_addr;
+
+	sbi_system_reset_add_device(&atcwdt200_reset);
+
+	return 0;
+}
+
+static const struct fdt_match atcwdt200_reset_match[] = {
+	{ .compatible = "andestech,atcwdt200" },
+	{},
+};
+
+struct fdt_reset fdt_reset_atcwdt200 = {
+	.match_table = atcwdt200_reset_match,
+	.init	     = atcwdt200_reset_init,
+};
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index 8a50dd0..c9f851c 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -10,6 +10,9 @@
 libsbiutils-objs-$(CONFIG_FDT_RESET) += reset/fdt_reset.o
 libsbiutils-objs-$(CONFIG_FDT_RESET) += reset/fdt_reset_drivers.o
 
+carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_ATCWDT200) += fdt_reset_atcwdt200
+libsbiutils-objs-$(CONFIG_FDT_RESET_ATCWDT200) += reset/fdt_reset_atcwdt200.o
+
 carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_GPIO) += fdt_poweroff_gpio
 carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_GPIO) += fdt_reset_gpio
 libsbiutils-objs-$(CONFIG_FDT_RESET_GPIO) += reset/fdt_reset_gpio.o
diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
index f6f50eb..8486f08 100644
--- a/platform/andes/ae350/Kconfig
+++ b/platform/andes/ae350/Kconfig
@@ -8,6 +8,8 @@ config PLATFORM_ANDES_AE350
 	select FDT_SERIAL_UART8250
 	select FDT_TIMER
 	select FDT_TIMER_PLMT
+	select FDT_RESET
+	select FDT_RESET_ATCWDT200
 	default y
 
 if PLATFORM_ANDES_AE350
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 79736c0..c6a8eeb 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -18,6 +18,7 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/irqchip/plic.h>
+#include <sbi_utils/reset/fdt_reset.h>
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/timer/fdt_timer.h>
 #include "platform.h"
@@ -37,6 +38,8 @@ static int ae350_final_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
+	fdt_reset_init();
+
 	fdt = fdt_get_address();
 	fdt_fixups(fdt);
 
-- 
2.34.1


