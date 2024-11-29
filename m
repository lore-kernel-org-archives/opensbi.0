From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:41 +0530
Subject: [PATCH v2 06/17] lib: utils: Add simple FDT based system suspend driver framework
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform can have multiple system suspend drivers so add a
simple FDT based system suspend driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/suspend/fdt_suspend.h      | 26 ++++++++++++++++++++
 lib/utils/Kconfig                            |  2 ++
 lib/utils/suspend/Kconfig                    | 10 ++++++++
 lib/utils/suspend/fdt_suspend.c              | 22 +++++++++++++++++
 lib/utils/suspend/fdt_suspend_drivers.carray |  3 +++
 lib/utils/suspend/objects.mk                 | 11 +++++++++
 platform/generic/configs/defconfig           |  1 +
 platform/generic/platform.c                  |  2 ++
 8 files changed, 77 insertions(+)
 create mode 100644 include/sbi_utils/suspend/fdt_suspend.h
 create mode 100644 lib/utils/suspend/Kconfig
 create mode 100644 lib/utils/suspend/fdt_suspend.c
 create mode 100644 lib/utils/suspend/fdt_suspend_drivers.carray
 create mode 100644 lib/utils/suspend/objects.mk

diff --git a/include/sbi_utils/suspend/fdt_suspend.h b/include/sbi_utils/suspend/fdt_suspend.h
new file mode 100644
index 00000000..bfc6c69a
--- /dev/null
+++ b/include/sbi_utils/suspend/fdt_suspend.h
@@ -0,0 +1,26 @@
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
+#include <sbi_utils/fdt/fdt_driver.h>
+
+#ifdef CONFIG_FDT_SUSPEND
+
+void fdt_suspend_init(const void *fdt);
+
+#else
+
+static inline void fdt_suspend_init(const void *fdt) { }
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
index 00000000..bd4691a0
--- /dev/null
+++ b/lib/utils/suspend/fdt_suspend.c
@@ -0,0 +1,22 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <sbi_utils/suspend/fdt_suspend.h>
+
+/* List of FDT suspend drivers generated at compile time */
+extern const struct fdt_driver *const fdt_suspend_drivers[];
+
+void fdt_suspend_init(const void *fdt)
+{
+	/*
+	 * Platforms might have multiple system suspend devices or
+	 * might not have any so probe all and don't fail.
+	 */
+	fdt_driver_init_all(fdt, fdt_suspend_drivers);
+}
diff --git a/lib/utils/suspend/fdt_suspend_drivers.carray b/lib/utils/suspend/fdt_suspend_drivers.carray
new file mode 100644
index 00000000..a0c857fc
--- /dev/null
+++ b/lib/utils/suspend/fdt_suspend_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/suspend/fdt_suspend.h
+TYPE: const struct fdt_driver
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
index fb074d4b..30da839f 100644
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
@@ -247,6 +248,7 @@ static int generic_early_init(bool cold_boot)
 
 	if (cold_boot) {
 		fdt_reset_init(fdt);
+		fdt_suspend_init(fdt);
 
 		if (semihosting_enabled())
 			rc = semihosting_init();
-- 
2.43.0


