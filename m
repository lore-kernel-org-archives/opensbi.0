From: Green Wan <green.wan@sifive.com>
Date: Thu,  1 Jul 2021 15:39:57 +0800
Subject: [RFC PATCH 3/4] lib: utils: add gpio generic interface
In-Reply-To: <20210701073958.15558-1-green.wan@sifive.com>
References: <20210701073958.15558-1-green.wan@sifive.com>
Message-ID: <20210701073958.15558-4-green.wan@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add generic interface for GPIO driver and add SiFive GPIO
driver as an example. Currently, driver supports gpio output
function only.

lib/utils/gpio/fdt_gpio.c:
  - contains GPIO generic interfaces.

lib/utils/gpio/sifive_gpio.c:
  - contains sifive GPIO driver.

platform/generic/platform.c:
  - add entry of gpio init

Signed-off-by: Green Wan <green.wan@sifive.com>
---
 include/sbi/sbi_gpio.h            | 23 ++++++++++
 include/sbi_utils/gpio/fdt_gpio.h | 32 ++++++++++++++
 lib/utils/gpio/fdt_gpio.c         | 55 ++++++++++++++++++++++++
 lib/utils/gpio/objects.mk         | 11 +++++
 lib/utils/gpio/sifive_gpio.c      | 70 +++++++++++++++++++++++++++++++
 platform/generic/platform.c       |  3 ++
 6 files changed, 194 insertions(+)
 create mode 100644 include/sbi/sbi_gpio.h
 create mode 100644 include/sbi_utils/gpio/fdt_gpio.h
 create mode 100644 lib/utils/gpio/fdt_gpio.c
 create mode 100644 lib/utils/gpio/objects.mk
 create mode 100644 lib/utils/gpio/sifive_gpio.c

diff --git a/include/sbi/sbi_gpio.h b/include/sbi/sbi_gpio.h
new file mode 100644
index 0000000..67ef9a9
--- /dev/null
+++ b/include/sbi/sbi_gpio.h
@@ -0,0 +1,23 @@
+/*
+ * SPDX-License-Identifier: GPL 2.0+
+ *
+ * Copyright (c) 2021 SiFive.
+ *
+ * Authors:
+ *   Green Wan <green.wan@sifive.com>
+ */
+
+#ifndef __SBI_GPIO_H__
+#define __SBI_GPIO_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_scratch;
+
+/* Initialize gpio */
+int sbi_gpio_init(struct sbi_scratch *scratch, bool cold_boot);
+
+/* Exit gpio */
+void sbi_gpio_exit(struct sbi_scratch *scratch);
+
+#endif
diff --git a/include/sbi_utils/gpio/fdt_gpio.h b/include/sbi_utils/gpio/fdt_gpio.h
new file mode 100644
index 0000000..c66380a
--- /dev/null
+++ b/include/sbi_utils/gpio/fdt_gpio.h
@@ -0,0 +1,32 @@
+/*
+ * SPDX-License-Identifier: GPL 2.0+
+ *
+ * Copyright (c) 2021 SiFive
+ *
+ * Authors:
+ *   Green Wan <green.wan@sifive.com>
+ */
+
+#ifndef __FDT_GPIO_H__
+#define __FDT_GPIO_H__
+
+#include <sbi/sbi_types.h>
+
+/**
+ * Make a GPIO an output, and set its value.
+ *
+ * @param gpio  GPIO number
+ * @param value GPIO value (0 for low or 1 for high)
+ * @return 0 if ok, -1 on error
+ */
+int gpio_direction_output(unsigned int gpio, unsigned int value);
+
+struct fdt_gpio {
+	const struct fdt_match *match_table;
+	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*direction_output)(unsigned int gpio, unsigned int value);
+};
+
+int fdt_gpio_init(void);
+
+#endif
diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
new file mode 100644
index 0000000..732598b
--- /dev/null
+++ b/lib/utils/gpio/fdt_gpio.c
@@ -0,0 +1,55 @@
+/*
+ * SPDX-License-Identifier: GPL 2.0+
+ *
+ * Copyright (c) 2021 SiFive
+ *
+ * Authors:
+ *   Green Wan <green.wan@sifive.com>
+ */
+
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_console.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/gpio/fdt_gpio.h>
+
+extern struct fdt_gpio sifive_gpio;
+
+static struct fdt_gpio *gpio_drivers[] = {
+	&sifive_gpio
+};
+
+static struct fdt_gpio *current_driver;
+
+int gpio_direction_output(unsigned int gpio, unsigned int value)
+{
+	if (current_driver->direction_output)
+		return current_driver->direction_output(gpio, value);
+
+	return 0;
+}
+
+int fdt_gpio_init(void)
+{
+	int pos, noff, rc;
+	struct fdt_gpio *drv;
+	const struct fdt_match *match;
+	void *fdt = sbi_scratch_thishart_arg1_ptr();
+
+	for (pos = 0; pos < array_size(gpio_drivers); pos++) {
+		drv = gpio_drivers[pos];
+
+		noff = -1;
+		while ((noff = fdt_find_match(fdt, noff,
+					      drv->match_table,
+					      &match)) >= 0) {
+			if (drv->init) {
+				rc = drv->init(fdt, noff, match);
+				if (rc)
+					return rc;
+			}
+			current_driver = drv;
+		}
+	}
+
+	return 0;
+}
diff --git a/lib/utils/gpio/objects.mk b/lib/utils/gpio/objects.mk
new file mode 100644
index 0000000..727c567
--- /dev/null
+++ b/lib/utils/gpio/objects.mk
@@ -0,0 +1,11 @@
+#
+# SPDX-License-Identifier: GPL 2.0+
+#
+# Copyright (c) 2020 SiFive Inc.
+#
+# Authors:
+#   Green Wan <green.wan@sifive.com>
+#
+
+libsbiutils-objs-y += gpio/fdt_gpio.o
+libsbiutils-objs-y += gpio/sifive_gpio.o
diff --git a/lib/utils/gpio/sifive_gpio.c b/lib/utils/gpio/sifive_gpio.c
new file mode 100644
index 0000000..714e127
--- /dev/null
+++ b/lib/utils/gpio/sifive_gpio.c
@@ -0,0 +1,70 @@
+/*
+ * SPDX-License-Identifier: GPL 2.0+
+ *
+ * Copyright (c) 2021 SiFive
+ *
+ * Authors:
+ *   Green Wan <green.wan@sifive.com>
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/gpio/fdt_gpio.h>
+
+#define GPIO_OUTEN				0x8
+#define GPIO_OUTVAL				0xC
+#define GPIO_BIT(b)				(1UL << (b))
+
+static struct platform_gpio_data gpio_data = {
+	.addr = 0x0
+};
+
+static int sifive_gpio_init(void *fdt, int nodeoff,
+			    const struct fdt_match *match)
+{
+	int rc;
+
+	rc = fdt_parse_gpio_node(fdt, nodeoff, &gpio_data);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int sifive_gpio_direction_output(unsigned int gpio,
+					unsigned int out)
+{
+	if (gpio_data.addr != 0) {
+		unsigned int val;
+
+		val = readl((volatile void *)(gpio_data.addr + GPIO_OUTEN));
+		val |= GPIO_BIT(gpio);
+		writel(val, (volatile void *)(gpio_data.addr + GPIO_OUTEN));
+
+		val = readl((volatile void *)(gpio_data.addr + GPIO_OUTVAL));
+
+		if (!out)
+			val &= ~GPIO_BIT(gpio);
+		else
+			val |= GPIO_BIT(gpio);
+
+		writel(val, (volatile void *)(gpio_data.addr + GPIO_OUTVAL));
+
+		return 0;
+	}
+
+	return SBI_EINVAL;
+}
+
+static const struct fdt_match sifive_gpio_match[] = {
+	{ .compatible = "sifive,gpio0" },
+	{ },
+};
+
+struct fdt_gpio sifive_gpio = {
+	.match_table = sifive_gpio_match,
+	.init = sifive_gpio_init,
+	.direction_output = sifive_gpio_direction_output,
+};
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index da0c1af..39017f0 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -16,6 +16,7 @@
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/gpio/fdt_gpio.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/timer/fdt_timer.h>
@@ -128,6 +129,8 @@ static int generic_early_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
+	fdt_gpio_init();
+
 	return fdt_reset_init();
 }
 
-- 
2.17.1


