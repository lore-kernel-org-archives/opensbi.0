From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  6 Aug 2024 13:03:33 +0530
Subject: [PATCH 11/16] lib: utils: Add simple FDT based CPPC driver framework
In-Reply-To: <20240806073338.1856901-1-apatel@ventanamicro.com>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
Message-ID: <20240806073338.1856901-12-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform can have multiple CPPC drivers so add a simple
FDT based CPPC driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/cppc/fdt_cppc.h      | 35 +++++++++++
 lib/utils/Kconfig                      |  2 +
 lib/utils/cppc/Kconfig                 | 10 ++++
 lib/utils/cppc/fdt_cppc.c              | 82 ++++++++++++++++++++++++++
 lib/utils/cppc/fdt_cppc_drivers.carray |  3 +
 lib/utils/cppc/objects.mk              | 11 ++++
 platform/generic/configs/defconfig     |  1 +
 platform/generic/platform.c            |  3 +
 8 files changed, 147 insertions(+)
 create mode 100644 include/sbi_utils/cppc/fdt_cppc.h
 create mode 100644 lib/utils/cppc/Kconfig
 create mode 100644 lib/utils/cppc/fdt_cppc.c
 create mode 100644 lib/utils/cppc/fdt_cppc_drivers.carray
 create mode 100644 lib/utils/cppc/objects.mk

diff --git a/include/sbi_utils/cppc/fdt_cppc.h b/include/sbi_utils/cppc/fdt_cppc.h
new file mode 100644
index 00000000..af0cdc41
--- /dev/null
+++ b/include/sbi_utils/cppc/fdt_cppc.h
@@ -0,0 +1,35 @@
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
+
+#ifdef CONFIG_FDT_CPPC
+
+struct fdt_cppc {
+	const struct fdt_match *match_table;
+	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*warm_init)(void);
+	void (*exit)(void);
+};
+
+void fdt_cppc_exit(void);
+
+int fdt_cppc_init(bool cold_boot);
+
+#else
+
+static inline void fdt_cppc_exit(void) { }
+static inline int fdt_cppc_init(bool cold_boot) { return 0; }
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
index 00000000..de11f0e1
--- /dev/null
+++ b/lib/utils/cppc/fdt_cppc.c
@@ -0,0 +1,82 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/cppc/fdt_cppc.h>
+
+/* List of FDT CPPC drivers generated at compile time */
+extern struct fdt_cppc *fdt_cppc_drivers[];
+extern unsigned long fdt_cppc_drivers_size;
+
+static struct fdt_cppc *current_driver = NULL;
+
+void fdt_cppc_exit(void)
+{
+	if (current_driver && current_driver->exit)
+		current_driver->exit();
+}
+
+static int fdt_cppc_warm_init(void)
+{
+	if (current_driver && current_driver->warm_init)
+		return current_driver->warm_init();
+	return 0;
+}
+
+static int fdt_cppc_cold_init(void)
+{
+	int pos, noff, rc;
+	struct fdt_cppc *drv;
+	const struct fdt_match *match;
+	void *fdt = fdt_get_address();
+
+	for (pos = 0; pos < fdt_cppc_drivers_size; pos++) {
+		drv = fdt_cppc_drivers[pos];
+
+		noff = -1;
+		while ((noff = fdt_find_match(fdt, noff,
+					drv->match_table, &match)) >= 0) {
+			/* drv->cold_init must not be NULL */
+			if (drv->cold_init == NULL)
+				return SBI_EFAIL;
+
+			rc = drv->cold_init(fdt, noff, match);
+			if (rc == SBI_ENODEV)
+				continue;
+			if (rc)
+				return rc;
+			current_driver = drv;
+
+			/*
+			 * We can have multiple CPPC devices on multi-die or
+			 * multi-socket systems so we cannot break here.
+			 */
+		}
+	}
+
+	/*
+	 * On some single-hart system there is no need for CPPC,
+	 * so we cannot return a failure here
+	 */
+	return 0;
+}
+
+int fdt_cppc_init(bool cold_boot)
+{
+	int rc;
+
+	if (cold_boot) {
+		rc = fdt_cppc_cold_init();
+		if (rc)
+			return rc;
+	}
+
+	return fdt_cppc_warm_init();
+}
diff --git a/lib/utils/cppc/fdt_cppc_drivers.carray b/lib/utils/cppc/fdt_cppc_drivers.carray
new file mode 100644
index 00000000..c2a9af2c
--- /dev/null
+++ b/lib/utils/cppc/fdt_cppc_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/cppc/fdt_cppc.h
+TYPE: struct fdt_cppc
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
index bcd7133b..d085647d 100644
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
@@ -238,6 +239,7 @@ static int generic_early_init(bool cold_boot)
 	}
 
 	fdt_hsm_init(cold_boot);
+	fdt_cppc_init(cold_boot);
 
 	if (!generic_plat || !generic_plat->early_init)
 		return 0;
@@ -291,6 +293,7 @@ static int generic_vendor_ext_provider(long funcid,
 
 static void generic_early_exit(void)
 {
+	fdt_cppc_exit();
 	fdt_hsm_exit();
 
 	if (generic_plat && generic_plat->early_exit)
-- 
2.34.1


