From: Samuel Holland <samuel@sholland.org>
Date: Wed,  8 Sep 2021 21:10:09 -0500
Subject: [PATCH 2/2] lib: utils/reset: Add a sunxi watchdog reset driver
In-Reply-To: <20210909021009.29553-1-samuel@sholland.org>
References: <20210909021009.29553-1-samuel@sholland.org>
Message-ID: <20210909021009.29553-2-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

One of the watchdogs in the D1 SoC provides a "soft reset" function,
which allows software to immediately reset the entire SoC. Add a driver
so it can implement the SBI system reset function.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 lib/utils/reset/fdt_reset.c           |  2 +
 lib/utils/reset/fdt_reset_sunxi_wdt.c | 77 +++++++++++++++++++++++++++
 lib/utils/reset/objects.mk            |  1 +
 3 files changed, 80 insertions(+)
 create mode 100644 lib/utils/reset/fdt_reset_sunxi_wdt.c

diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 7f4b02a..168bb0c 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -16,6 +16,7 @@ extern struct fdt_reset fdt_poweroff_gpio;
 extern struct fdt_reset fdt_reset_gpio;
 extern struct fdt_reset fdt_reset_htif;
 extern struct fdt_reset fdt_reset_sifive_test;
+extern struct fdt_reset fdt_reset_sunxi_wdt;
 extern struct fdt_reset fdt_reset_thead;
 
 static struct fdt_reset *reset_drivers[] = {
@@ -23,6 +24,7 @@ static struct fdt_reset *reset_drivers[] = {
 	&fdt_reset_gpio,
 	&fdt_reset_htif,
 	&fdt_reset_sifive_test,
+	&fdt_reset_sunxi_wdt,
 	&fdt_reset_thead,
 };
 
diff --git a/lib/utils/reset/fdt_reset_sunxi_wdt.c b/lib/utils/reset/fdt_reset_sunxi_wdt.c
new file mode 100644
index 0000000..d057c00
--- /dev/null
+++ b/lib/utils/reset/fdt_reset_sunxi_wdt.c
@@ -0,0 +1,77 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/reset/fdt_reset.h>
+
+#define WDT_KEY_VAL			0x16aa0000
+
+#define WDT_SOFT_RST_REG		0x08
+#define WDT_SOFT_RST_EN			BIT(0)
+
+#define WDT_MODE_REG			0x18
+
+static volatile void *sunxi_wdt_base;
+
+static int sunxi_wdt_system_reset_check(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		return 1;
+	}
+
+	return 0;
+}
+
+static void sunxi_wdt_system_reset(u32 type, u32 reason)
+{
+	/* Disable the watchdog. */
+	writel_relaxed(WDT_KEY_VAL,
+		       sunxi_wdt_base + WDT_MODE_REG);
+
+	/* Trigger soft reset. */
+	writel_relaxed(WDT_KEY_VAL | WDT_SOFT_RST_EN,
+		       sunxi_wdt_base + WDT_SOFT_RST_REG);
+}
+
+static struct sbi_system_reset_device sunxi_wdt_reset = {
+	.name = "sunxi-wdt-reset",
+	.system_reset_check = sunxi_wdt_system_reset_check,
+	.system_reset = sunxi_wdt_system_reset,
+};
+
+static int sunxi_wdt_reset_init(void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
+	unsigned long reg_addr;
+	int rc;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, NULL);
+	if (rc < 0 || !reg_addr)
+		return SBI_ENODEV;
+
+	sunxi_wdt_base = (volatile void *)reg_addr;
+
+	sbi_system_reset_set_device(&sunxi_wdt_reset);
+
+	return 0;
+}
+
+static const struct fdt_match sunxi_wdt_reset_match[] = {
+	{ .compatible = "allwinner,sun20i-d1-wdt-reset" },
+	{ },
+};
+
+struct fdt_reset fdt_reset_sunxi_wdt = {
+	.match_table = sunxi_wdt_reset_match,
+	.init = sunxi_wdt_reset_init,
+};
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index bb33179..6c95db3 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -11,5 +11,6 @@ libsbiutils-objs-y += reset/fdt_reset.o
 libsbiutils-objs-y += reset/fdt_reset_gpio.o
 libsbiutils-objs-y += reset/fdt_reset_htif.o
 libsbiutils-objs-y += reset/fdt_reset_sifive_test.o
+libsbiutils-objs-y += reset/fdt_reset_sunxi_wdt.o
 libsbiutils-objs-y += reset/fdt_reset_thead.o
 libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
-- 
2.31.1


