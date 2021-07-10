From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 10 Jul 2021 11:28:27 +0530
Subject: [PATCH v3 5/5] lib: utils/reset: Add generic GPIO reset driver
In-Reply-To: <20210710055827.1535906-1-anup.patel@wdc.com>
References: <20210710055827.1535906-1-anup.patel@wdc.com>
Message-ID: <20210710055827.1535906-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Green Wan <green.wan@sifive.com>

We add generic GPIO reset driver inspired from gpio-restart
and gpio-poweroff drivers of Linux kernel.

Signed-off-by: Green Wan <green.wan@sifive.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/utils/reset/fdt_reset.c      |   2 +
 lib/utils/reset/fdt_reset_gpio.c | 141 +++++++++++++++++++++++++++++++
 lib/utils/reset/objects.mk       |   1 +
 3 files changed, 144 insertions(+)
 create mode 100644 lib/utils/reset/fdt_reset_gpio.c

diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 48a49fb..aa5f59f 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -12,11 +12,13 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/reset/fdt_reset.h>
 
+extern struct fdt_reset fdt_reset_gpio;
 extern struct fdt_reset fdt_reset_sifive_test;
 extern struct fdt_reset fdt_reset_htif;
 extern struct fdt_reset fdt_reset_thead;
 
 static struct fdt_reset *reset_drivers[] = {
+	&fdt_reset_gpio,
 	&fdt_reset_sifive_test,
 	&fdt_reset_htif,
 	&fdt_reset_thead,
diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
new file mode 100644
index 0000000..083076f
--- /dev/null
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -0,0 +1,141 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 SiFive
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Green Wan <green.wan@sifive.com>
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/gpio/fdt_gpio.h>
+#include <sbi_utils/reset/fdt_reset.h>
+
+struct gpio_reset {
+	struct gpio_pin pin;
+	u32 active_delay;
+	u32 inactive_delay;
+};
+
+static struct gpio_reset poweroff = {
+	.active_delay = 100,
+	.inactive_delay = 100
+};
+
+static struct gpio_reset restart = {
+	.active_delay = 100,
+	.inactive_delay = 100
+};
+
+/* Custom mdelay function until we have a generic mdelay() API */
+static void gpio_mdelay(unsigned long msecs)
+{
+	volatile int i;
+	while (msecs--)
+		for (i = 0; i < 10000; i++) ;
+}
+
+static int gpio_system_reset_check(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		return 1;
+	}
+
+	return 0;
+}
+
+static void gpio_system_reset(u32 type, u32 reason)
+{
+	struct gpio_reset *reset = NULL;
+
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+		reset = &poweroff;
+		break;
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		reset = &restart;
+		break;
+	}
+
+	if (reset) {
+		if (!reset->pin.chip) {
+			sbi_printf("%s: gpio pin not available\n", __func__);
+			goto skip_reset;
+		}
+
+		/* drive it active, also inactive->active edge */
+		gpio_direction_output(&reset->pin, 1);
+		gpio_mdelay(reset->active_delay);
+
+		/* drive inactive, also active->inactive edge */
+		gpio_set(&reset->pin, 0);
+		gpio_mdelay(reset->inactive_delay);
+
+		/* drive it active, also inactive->active edge */
+		gpio_set(&reset->pin, 1);
+
+skip_reset:
+		/* hang !!! */
+		sbi_hart_hang();
+	}
+}
+
+static struct sbi_system_reset_device gpio_reset = {
+	.name = "gpio-reset",
+	.system_reset_check = gpio_system_reset_check,
+	.system_reset = gpio_system_reset
+};
+
+static int gpio_reset_init(void *fdt, int nodeoff,
+			   const struct fdt_match *match)
+{
+	int rc, len;
+	const fdt32_t *val;
+	bool is_restart = (ulong)match->data;
+	const char *dir_prop = (is_restart) ? "open-source" : "input";
+	struct gpio_reset *reset = (is_restart) ? &restart : &poweroff;
+
+	rc = fdt_gpio_pin_get(fdt, nodeoff, 0, &reset->pin);
+	if (rc)
+		return rc;
+
+	if (fdt_getprop(fdt, nodeoff, dir_prop, &len)) {
+		rc = gpio_direction_input(&reset->pin);
+		if (rc)
+			return rc;
+	}
+
+	val = fdt_getprop(fdt, nodeoff, "active-delay-ms", &len);
+	if (len > 0)
+		reset->active_delay = fdt32_to_cpu(*val);
+
+	val = fdt_getprop(fdt, nodeoff, "inactive-delay-ms", &len);
+	if (len > 0)
+		reset->inactive_delay = fdt32_to_cpu(*val);
+
+	sbi_system_reset_set_device(&gpio_reset);
+
+	return 0;
+}
+
+static const struct fdt_match gpio_reset_match[] = {
+	{ .compatible = "gpio-poweroff", .data = (void *)FALSE },
+	{ .compatible = "gpio-restart", .data = (void *)TRUE },
+	{ },
+};
+
+struct fdt_reset fdt_reset_gpio = {
+	.match_table = gpio_reset_match,
+	.init = gpio_reset_init,
+};
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index 672aad9..4215396 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -8,6 +8,7 @@
 #
 
 libsbiutils-objs-y += reset/fdt_reset.o
+libsbiutils-objs-y += reset/fdt_reset_gpio.o
 libsbiutils-objs-y += reset/fdt_reset_htif.o
 libsbiutils-objs-y += reset/fdt_reset_thead.o
 libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
-- 
2.25.1


