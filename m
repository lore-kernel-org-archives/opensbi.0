From: Green Wan <green.wan@sifive.com>
Date: Tue, 13 Jul 2021 10:26:47 +0800
Subject: [PATCH v4 3/5] lib: utils/gpio: Add simple FDT based GPIO framework
In-Reply-To: <20210713022649.25227-1-green.wan@sifive.com>
References: <20210713022649.25227-1-green.wan@sifive.com>
Message-ID: <20210713022649.25227-4-green.wan@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anup Patel <anup.patel@wdc.com>

We add a simple FDT based GPIO framework which is built on top
of generic GPIO library. The phandle of FDT GPIO chip DT node
is treated as unique GPIO chip ID required by the generic GPIO
library. The FDT based GPIO chip drivers will be probed on-demand
from fdt_gpio_pin_get() called by the GPIO client drivers.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi_utils/gpio/fdt_gpio.h |  34 ++++++++
 lib/utils/gpio/fdt_gpio.c         | 132 ++++++++++++++++++++++++++++++
 lib/utils/gpio/objects.mk         |   1 +
 3 files changed, 167 insertions(+)
 create mode 100644 include/sbi_utils/gpio/fdt_gpio.h
 create mode 100644 lib/utils/gpio/fdt_gpio.c

diff --git a/include/sbi_utils/gpio/fdt_gpio.h b/include/sbi_utils/gpio/fdt_gpio.h
new file mode 100644
index 0000000..19e1b58
--- /dev/null
+++ b/include/sbi_utils/gpio/fdt_gpio.h
@@ -0,0 +1,34 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#ifndef __FDT_GPIO_H__
+#define __FDT_GPIO_H__
+
+#include <sbi_utils/gpio/gpio.h>
+
+/** FDT based GPIO driver */
+struct fdt_gpio {
+	const struct fdt_match *match_table;
+	int (*xlate)(struct gpio_chip *chip,
+		     const struct fdt_phandle_args *pargs,
+		     struct gpio_pin *out_pin);
+	int (*init)(void *fdt, int nodeoff, u32 phandle,
+		    const struct fdt_match *match);
+};
+
+/** Get a GPIO pin using "gpios" DT property of client DT node */
+int fdt_gpio_pin_get(void *fdt, int nodeoff, int index,
+		     struct gpio_pin *out_pin);
+
+/** Simple xlate function to convert two GPIO FDT cells into GPIO pin */
+int fdt_gpio_simple_xlate(struct gpio_chip *chip,
+			  const struct fdt_phandle_args *pargs,
+			  struct gpio_pin *out_pin);
+
+#endif
diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
new file mode 100644
index 0000000..bff391f
--- /dev/null
+++ b/lib/utils/gpio/fdt_gpio.c
@@ -0,0 +1,132 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/gpio/fdt_gpio.h>
+
+static struct fdt_gpio *gpio_drivers[] = {
+};
+
+static struct fdt_gpio *fdt_gpio_driver(struct gpio_chip *chip)
+{
+	int pos;
+
+	if (!chip)
+		return NULL;
+
+	for (pos = 0; pos < array_size(gpio_drivers); pos++) {
+		if (chip->driver == gpio_drivers[pos])
+			return gpio_drivers[pos];
+	}
+
+	return NULL;
+}
+
+static int fdt_gpio_init(void *fdt, u32 phandle)
+{
+	int pos, nodeoff, rc;
+	struct fdt_gpio *drv;
+	const struct fdt_match *match;
+
+	/* Find node offset */
+	nodeoff = fdt_node_offset_by_phandle(fdt, phandle);
+	if (nodeoff < 0)
+		return nodeoff;
+
+	/* Check "gpio-controller" property */
+	if (!fdt_getprop(fdt, nodeoff, "gpio-controller", &rc))
+		return SBI_EINVAL;
+
+	/* Try all GPIO drivers one-by-one */
+	for (pos = 0; pos < array_size(gpio_drivers); pos++) {
+		drv = gpio_drivers[pos];
+
+		match = fdt_match_node(fdt, nodeoff, drv->match_table);
+		if (match && drv->init) {
+			rc = drv->init(fdt, nodeoff, phandle, match);
+			if (rc == SBI_ENODEV)
+				continue;
+			if (rc)
+				return rc;
+			return 0;
+		}
+	}
+
+	return SBI_ENOSYS;
+}
+
+static int fdt_gpio_chip_find(void *fdt, u32 phandle,
+			      struct gpio_chip **out_chip)
+{
+	int rc;
+	struct gpio_chip *chip = gpio_chip_find(phandle);
+
+	if (!chip) {
+		/* GPIO chip not found so initialize matching driver */
+		rc = fdt_gpio_init(fdt, phandle);
+		if (rc)
+			return rc;
+
+		/* Try to find GPIO chip again */
+		chip = gpio_chip_find(phandle);
+		if (!chip)
+			return SBI_ENOSYS;
+	}
+
+	if (out_chip)
+		*out_chip = chip;
+
+	return 0;
+}
+
+int fdt_gpio_pin_get(void *fdt, int nodeoff, int index,
+		     struct gpio_pin *out_pin)
+{
+	int rc;
+	u32 phandle;
+	struct fdt_gpio *drv;
+	struct gpio_chip *chip = NULL;
+	struct fdt_phandle_args pargs;
+
+	if (!fdt || (nodeoff < 0) || (index < 0) || !out_pin)
+		return SBI_EINVAL;
+
+	pargs.node_offset = pargs.args_count = 0;
+	rc = fdt_parse_phandle_with_args(fdt, nodeoff,
+					 "gpios", "#gpio-cells",
+					 index, &pargs);
+	if (rc)
+		return rc;
+
+	phandle = fdt_get_phandle(fdt, pargs.node_offset);
+	rc = fdt_gpio_chip_find(fdt, phandle, &chip);
+	if (rc)
+		return rc;
+
+	drv = fdt_gpio_driver(chip);
+	if (!drv || !drv->xlate)
+		return SBI_ENOSYS;
+
+	return drv->xlate(chip, &pargs, out_pin);
+}
+
+int fdt_gpio_simple_xlate(struct gpio_chip *chip,
+			  const struct fdt_phandle_args *pargs,
+			  struct gpio_pin *out_pin)
+{
+	if ((pargs->args_count < 2) || (chip->ngpio <= pargs->args[0]))
+		return SBI_EINVAL;
+
+	out_pin->chip = chip;
+	out_pin->offset = pargs->args[0];
+	out_pin->flags = pargs->args[1];
+	return 0;
+}
diff --git a/lib/utils/gpio/objects.mk b/lib/utils/gpio/objects.mk
index e99a895..dade45e 100644
--- a/lib/utils/gpio/objects.mk
+++ b/lib/utils/gpio/objects.mk
@@ -7,4 +7,5 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
+libsbiutils-objs-y += gpio/fdt_gpio.o
 libsbiutils-objs-y += gpio/gpio.o
-- 
2.17.1


