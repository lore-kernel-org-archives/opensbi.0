From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:47 +0530
Subject: [PATCH v2 12/17] lib: utils: Add simple FDT based CPPC driver framework
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-13-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform can have multiple CPPC drivers so add a simple
FDT based CPPC driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/cppc/fdt_cppc.h      | 26 ++++++++++++++++++++++++++
 lib/utils/Kconfig                      |  2 ++
 lib/utils/cppc/Kconfig                 | 10 ++++++++++
 lib/utils/cppc/fdt_cppc.c              | 22 ++++++++++++++++++++++
 lib/utils/cppc/fdt_cppc_drivers.carray |  3 +++
 lib/utils/cppc/objects.mk              | 11 +++++++++++
 platform/generic/configs/defconfig     |  1 +
 platform/generic/platform.c            |  2 ++
 8 files changed, 77 insertions(+)
 create mode 100644 include/sbi_utils/cppc/fdt_cppc.h
 create mode 100644 lib/utils/cppc/Kconfig
 create mode 100644 lib/utils/cppc/fdt_cppc.c
 create mode 100644 lib/utils/cppc/fdt_cppc_drivers.carray
 create mode 100644 lib/utils/cppc/objects.mk

diff --git a/include/sbi_utils/cppc/fdt_cppc.h b/include/sbi_utils/cppc/fdt_cppc.h
new file mode 100644
index 00000000..433c6d32
--- /dev/null
+++ b/include/sbi_utils/cppc/fdt_cppc.h
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
+#ifndef __FDT_CPPC_H__
+#define __FDT_CPPC_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+
+#ifdef CONFIG_FDT_CPPC
+
+void fdt_cppc_init(const void *fdt);
+
+#else
+
+static inline void fdt_cppc_init(const void *fdt) { }
+
+#endif
+
+#endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index c860a185..002d6f8f 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -2,6 +2,8 @@
 
 menu "Utils and Drivers Support"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/cppc/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/fdt/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/gpio/Kconfig"
diff --git a/lib/utils/cppc/Kconfig b/lib/utils/cppc/Kconfig
new file mode 100644
index 00000000..08d1c97f
--- /dev/null
+++ b/lib/utils/cppc/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "CPPC Device Support"
+
+config FDT_CPPC
+	bool "FDT based CPPC drivers"
+	depends on FDT
+	default n
+
+endmenu
diff --git a/lib/utils/cppc/fdt_cppc.c b/lib/utils/cppc/fdt_cppc.c
new file mode 100644
index 00000000..0e1ecb24
--- /dev/null
+++ b/lib/utils/cppc/fdt_cppc.c
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
+#include <sbi_utils/cppc/fdt_cppc.h>
+
+/* List of FDT CPPC drivers generated at compile time */
+extern const struct fdt_driver *const fdt_cppc_drivers[];
+
+void fdt_cppc_init(const void *fdt)
+{
+	/*
+	 * Platforms might have multiple CPPC devices or might
+	 * not have any so probe all and don't fail.
+	 */
+	fdt_driver_init_all(fdt, fdt_cppc_drivers);
+}
diff --git a/lib/utils/cppc/fdt_cppc_drivers.carray b/lib/utils/cppc/fdt_cppc_drivers.carray
new file mode 100644
index 00000000..b25c7888
--- /dev/null
+++ b/lib/utils/cppc/fdt_cppc_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/cppc/fdt_cppc.h
+TYPE: const struct fdt_driver
+NAME: fdt_cppc_drivers
diff --git a/lib/utils/cppc/objects.mk b/lib/utils/cppc/objects.mk
new file mode 100644
index 00000000..fb37478a
--- /dev/null
+++ b/lib/utils/cppc/objects.mk
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
+libsbiutils-objs-$(CONFIG_FDT_CPPC) += cppc/fdt_cppc.o
+libsbiutils-objs-$(CONFIG_FDT_CPPC) += cppc/fdt_cppc_drivers.carray.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 78fc96b6..bd18c3c1 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -6,6 +6,7 @@ CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
+CONFIG_FDT_CPPC=y
 CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_DESIGNWARE=y
 CONFIG_FDT_GPIO_SIFIVE=y
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 48228e67..6f830744 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_tlb.h>
+#include <sbi_utils/cppc/fdt_cppc.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -251,6 +252,7 @@ static int generic_early_init(bool cold_boot)
 		fdt_reset_init(fdt);
 		fdt_suspend_init(fdt);
 		fdt_hsm_init(fdt);
+		fdt_cppc_init(fdt);
 
 		if (semihosting_enabled())
 			rc = semihosting_init();
-- 
2.43.0


