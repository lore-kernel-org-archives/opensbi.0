From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:45 +0530
Subject: [PATCH v2 10/17] lib: utils: Add simple FDT based HSM driver framework
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-11-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform can have multiple HSM drivers so add a simple
FDT based HSM driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/hsm/fdt_hsm.h      | 26 ++++++++++++++++++++++++++
 lib/utils/Kconfig                    |  2 ++
 lib/utils/hsm/Kconfig                | 10 ++++++++++
 lib/utils/hsm/fdt_hsm.c              | 22 ++++++++++++++++++++++
 lib/utils/hsm/fdt_hsm_drivers.carray |  3 +++
 lib/utils/hsm/objects.mk             | 11 +++++++++++
 platform/generic/configs/defconfig   |  1 +
 platform/generic/platform.c          |  2 ++
 8 files changed, 77 insertions(+)
 create mode 100644 include/sbi_utils/hsm/fdt_hsm.h
 create mode 100644 lib/utils/hsm/Kconfig
 create mode 100644 lib/utils/hsm/fdt_hsm.c
 create mode 100644 lib/utils/hsm/fdt_hsm_drivers.carray
 create mode 100644 lib/utils/hsm/objects.mk

diff --git a/include/sbi_utils/hsm/fdt_hsm.h b/include/sbi_utils/hsm/fdt_hsm.h
new file mode 100644
index 00000000..58061afc
--- /dev/null
+++ b/include/sbi_utils/hsm/fdt_hsm.h
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
+#ifndef __FDT_HSM_H__
+#define __FDT_HSM_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+
+#ifdef CONFIG_FDT_HSM
+
+void fdt_hsm_init(const void *fdt);
+
+#else
+
+static inline void fdt_hsm_init(const void *fdt) { }
+
+#endif
+
+#endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 3f32c1ca..c860a185 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -6,6 +6,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/fdt/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/gpio/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/hsm/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/i2c/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/ipi/Kconfig"
diff --git a/lib/utils/hsm/Kconfig b/lib/utils/hsm/Kconfig
new file mode 100644
index 00000000..31506116
--- /dev/null
+++ b/lib/utils/hsm/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "HSM Device Support"
+
+config FDT_HSM
+	bool "FDT based HSM drivers"
+	depends on FDT
+	default n
+
+endmenu
diff --git a/lib/utils/hsm/fdt_hsm.c b/lib/utils/hsm/fdt_hsm.c
new file mode 100644
index 00000000..162b9867
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm.c
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
+#include <sbi_utils/hsm/fdt_hsm.h>
+
+/* List of FDT HSM drivers generated at compile time */
+extern const struct fdt_driver *const fdt_hsm_drivers[];
+
+void fdt_hsm_init(const void *fdt)
+{
+	/*
+	 * Platforms might have multiple HSM devices or might
+	 * not have any so probe all and don't fail.
+	 */
+	fdt_driver_init_all(fdt, fdt_hsm_drivers);
+}
diff --git a/lib/utils/hsm/fdt_hsm_drivers.carray b/lib/utils/hsm/fdt_hsm_drivers.carray
new file mode 100644
index 00000000..73680a25
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/hsm/fdt_hsm.h
+TYPE: const struct fdt_driver
+NAME: fdt_hsm_drivers
diff --git a/lib/utils/hsm/objects.mk b/lib/utils/hsm/objects.mk
new file mode 100644
index 00000000..49337bf5
--- /dev/null
+++ b/lib/utils/hsm/objects.mk
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
+libsbiutils-objs-$(CONFIG_FDT_HSM) += hsm/fdt_hsm.o
+libsbiutils-objs-$(CONFIG_FDT_HSM) += hsm/fdt_hsm_drivers.carray.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 54300fb5..2efc7136 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -10,6 +10,7 @@ CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_DESIGNWARE=y
 CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_GPIO_STARFIVE=y
+CONFIG_FDT_HSM=y
 CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
 CONFIG_FDT_I2C_DW=y
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 30da839f..48228e67 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -21,6 +21,7 @@
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_pmu.h>
+#include <sbi_utils/hsm/fdt_hsm.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
 #include <sbi_utils/serial/fdt_serial.h>
@@ -249,6 +250,7 @@ static int generic_early_init(bool cold_boot)
 	if (cold_boot) {
 		fdt_reset_init(fdt);
 		fdt_suspend_init(fdt);
+		fdt_hsm_init(fdt);
 
 		if (semihosting_enabled())
 			rc = semihosting_init();
-- 
2.43.0


