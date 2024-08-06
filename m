From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  6 Aug 2024 13:03:28 +0530
Subject: [PATCH 06/16] lib: utils: Add simple FDT based system suspend driver framework
In-Reply-To: <20240806073338.1856901-1-apatel@ventanamicro.com>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
Message-ID: <20240806073338.1856901-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform can have multiple system suspend drivers so add a
simple FDT based system suspend driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/suspend/fdt_suspend.h      | 45 +++++++++++++++++++
 lib/utils/Kconfig                            |  2 +
 lib/utils/suspend/Kconfig                    | 10 +++++
 lib/utils/suspend/fdt_suspend.c              | 46 ++++++++++++++++++++
 lib/utils/suspend/fdt_suspend_drivers.carray |  3 ++
 lib/utils/suspend/objects.mk                 | 11 +++++
 platform/generic/configs/defconfig           |  1 +
 platform/generic/platform.c                  |  2 +
 8 files changed, 120 insertions(+)
 create mode 100644 include/sbi_utils/suspend/fdt_suspend.h
 create mode 100644 lib/utils/suspend/Kconfig
 create mode 100644 lib/utils/suspend/fdt_suspend.c
 create mode 100644 lib/utils/suspend/fdt_suspend_drivers.carray
 create mode 100644 lib/utils/suspend/objects.mk

diff --git a/include/sbi_utils/suspend/fdt_suspend.h b/include/sbi_utils/suspend/fdt_suspend.h
new file mode 100644
index 00000000..cb6fb719
--- /dev/null
+++ b/include/sbi_utils/suspend/fdt_suspend.h
@@ -0,0 +1,45 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#ifndef __FDT_SUSPEND_H__
+#define __FDT_SUSPEND_H__
+
+#include <sbi/sbi_types.h>
+
+struct fdt_suspend {
+	const struct fdt_match *match_table;
+	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
+};
+
+#ifdef CONFIG_FDT_SUSPEND
+
+/**
+ * fdt_suspend_driver_init() - initialize suspend driver based on the device-tree
+ */
+int fdt_suspend_driver_init(void *fdt, struct fdt_suspend *drv);
+
+/**
+ * fdt_suspend_init() - initialize reset drivers based on the device-tree
+ *
+ * This function shall be invoked in final init.
+ */
+void fdt_suspend_init(void);
+
+#else
+
+static inline int fdt_suspend_driver_init(void *fdt, struct fdt_suspend *drv)
+{
+	return 0;
+}
+
+static inline void fdt_suspend_init(void) { }
+
+#endif
+
+#endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 6aa7843c..3f32c1ca 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -22,6 +22,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/serial/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/suspend/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/sys/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/timer/Kconfig"
diff --git a/lib/utils/suspend/Kconfig b/lib/utils/suspend/Kconfig
new file mode 100644
index 00000000..416ae795
--- /dev/null
+++ b/lib/utils/suspend/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "System Suspend Support"
+
+config FDT_SUSPEND
+	bool "FDT based suspend drivers"
+	depends on FDT
+	default n
+
+endmenu
diff --git a/lib/utils/suspend/fdt_suspend.c b/lib/utils/suspend/fdt_suspend.c
new file mode 100644
index 00000000..029d6476
--- /dev/null
+++ b/lib/utils/suspend/fdt_suspend.c
@@ -0,0 +1,46 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/suspend/fdt_suspend.h>
+
+/* List of FDT suspend drivers generated at compile time */
+extern struct fdt_suspend *fdt_suspend_drivers[];
+extern unsigned long fdt_suspend_drivers_size;
+
+int fdt_suspend_driver_init(void *fdt, struct fdt_suspend *drv)
+{
+	int noff, rc = SBI_ENODEV;
+	const struct fdt_match *match;
+
+	noff = fdt_find_match(fdt, -1, drv->match_table, &match);
+	if (noff < 0)
+		return SBI_ENODEV;
+
+	if (drv->init) {
+		rc = drv->init(fdt, noff, match);
+		if (rc && rc != SBI_ENODEV) {
+			sbi_printf("%s: %s init failed, %d\n",
+				   __func__, match->compatible, rc);
+		}
+	}
+
+	return rc;
+}
+
+void fdt_suspend_init(void)
+{
+	int pos;
+	void *fdt = fdt_get_address();
+
+	for (pos = 0; pos < fdt_suspend_drivers_size; pos++)
+		fdt_suspend_driver_init(fdt, fdt_suspend_drivers[pos]);
+}
diff --git a/lib/utils/suspend/fdt_suspend_drivers.carray b/lib/utils/suspend/fdt_suspend_drivers.carray
new file mode 100644
index 00000000..8793e4cf
--- /dev/null
+++ b/lib/utils/suspend/fdt_suspend_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/suspend/fdt_suspend.h
+TYPE: struct fdt_suspend
+NAME: fdt_suspend_drivers
diff --git a/lib/utils/suspend/objects.mk b/lib/utils/suspend/objects.mk
new file mode 100644
index 00000000..30d897d1
--- /dev/null
+++ b/lib/utils/suspend/objects.mk
@@ -0,0 +1,11 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2024 Ventana Micro Systems Inc.
+#
+# Authors:
+#   Anup Patel <apatel@ventanamicro.com>
+#
+
+libsbiutils-objs-$(CONFIG_FDT_SUSPEND) += suspend/fdt_suspend.o
+libsbiutils-objs-$(CONFIG_FDT_SUSPEND) += suspend/fdt_suspend_drivers.carray.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 48f8df4c..ec439d74 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -44,6 +44,7 @@ CONFIG_FDT_SERIAL_LITEX=y
 CONFIG_FDT_SERIAL_UART8250=y
 CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
 CONFIG_SERIAL_SEMIHOSTING=y
+CONFIG_FDT_SUSPEND=y
 CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
 CONFIG_FDT_TIMER_PLMT=y
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 3470474a..138a54c2 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -24,6 +24,7 @@
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
 #include <sbi_utils/serial/fdt_serial.h>
+#include <sbi_utils/suspend/fdt_suspend.h>
 #include <sbi_utils/timer/fdt_timer.h>
 #include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/reset/fdt_reset.h>
@@ -225,6 +226,7 @@ static int generic_early_init(bool cold_boot)
 
 	if (cold_boot) {
 		fdt_reset_init();
+		fdt_suspend_init();
 
 		if (semihosting_enabled())
 			rc = semihosting_init();
-- 
2.34.1


