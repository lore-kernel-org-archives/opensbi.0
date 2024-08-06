From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  6 Aug 2024 13:03:30 +0530
Subject: [PATCH 08/16] lib: utils: Add simple FDT based HSM driver framework
In-Reply-To: <20240806073338.1856901-1-apatel@ventanamicro.com>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
Message-ID: <20240806073338.1856901-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform can have multiple HSM drivers so add a simple
FDT based HSM driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/hsm/fdt_hsm.h      | 39 ++++++++++++
 lib/utils/Kconfig                    |  2 +
 lib/utils/hsm/Kconfig                | 10 ++++
 lib/utils/hsm/fdt_hsm.c              | 89 ++++++++++++++++++++++++++++
 lib/utils/hsm/fdt_hsm_drivers.carray |  3 +
 lib/utils/hsm/objects.mk             | 11 ++++
 platform/generic/configs/defconfig   |  1 +
 platform/generic/platform.c          |  6 ++
 8 files changed, 161 insertions(+)
 create mode 100644 include/sbi_utils/hsm/fdt_hsm.h
 create mode 100644 lib/utils/hsm/Kconfig
 create mode 100644 lib/utils/hsm/fdt_hsm.c
 create mode 100644 lib/utils/hsm/fdt_hsm_drivers.carray
 create mode 100644 lib/utils/hsm/objects.mk

diff --git a/include/sbi_utils/hsm/fdt_hsm.h b/include/sbi_utils/hsm/fdt_hsm.h
new file mode 100644
index 00000000..7076873c
--- /dev/null
+++ b/include/sbi_utils/hsm/fdt_hsm.h
@@ -0,0 +1,39 @@
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
+
+#ifdef CONFIG_FDT_HSM
+
+struct fdt_hsm {
+	const struct fdt_match *match_table;
+	int (*fdt_fixup)(void *fdt);
+	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*warm_init)(void);
+	void (*exit)(void);
+};
+
+int fdt_hsm_fixup(void *fdt);
+
+void fdt_hsm_exit(void);
+
+int fdt_hsm_init(bool cold_boot);
+
+#else
+
+static inline int fdt_hsm_fixup(void *fdt) { return 0; }
+static inline void fdt_hsm_exit(void) { }
+static inline int fdt_hsm_init(bool cold_boot) { return 0; }
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
index 00000000..7166dce8
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm.c
@@ -0,0 +1,89 @@
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
+#include <sbi_utils/hsm/fdt_hsm.h>
+
+/* List of FDT HSM drivers generated at compile time */
+extern struct fdt_hsm *fdt_hsm_drivers[];
+extern unsigned long fdt_hsm_drivers_size;
+
+static struct fdt_hsm *current_driver = NULL;
+
+int fdt_hsm_fixup(void *fdt)
+{
+	if (current_driver && current_driver->fdt_fixup)
+		return current_driver->fdt_fixup(fdt);
+	return 0;
+}
+
+void fdt_hsm_exit(void)
+{
+	if (current_driver && current_driver->exit)
+		current_driver->exit();
+}
+
+static int fdt_hsm_warm_init(void)
+{
+	if (current_driver && current_driver->warm_init)
+		return current_driver->warm_init();
+	return 0;
+}
+
+static int fdt_hsm_cold_init(void)
+{
+	int pos, noff, rc;
+	struct fdt_hsm *drv;
+	const struct fdt_match *match;
+	void *fdt = fdt_get_address();
+
+	for (pos = 0; pos < fdt_hsm_drivers_size; pos++) {
+		drv = fdt_hsm_drivers[pos];
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
+			 * We can have multiple HSM devices on multi-die or
+			 * multi-socket systems so we cannot break here.
+			 */
+		}
+	}
+
+	/*
+	 * On some single-hart system there is no need for HSM,
+	 * so we cannot return a failure here
+	 */
+	return 0;
+}
+
+int fdt_hsm_init(bool cold_boot)
+{
+	int rc;
+
+	if (cold_boot) {
+		rc = fdt_hsm_cold_init();
+		if (rc)
+			return rc;
+	}
+
+	return fdt_hsm_warm_init();
+}
diff --git a/lib/utils/hsm/fdt_hsm_drivers.carray b/lib/utils/hsm/fdt_hsm_drivers.carray
new file mode 100644
index 00000000..21396db2
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/hsm/fdt_hsm.h
+TYPE: struct fdt_hsm
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
index 138a54c2..bcd7133b 100644
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
@@ -236,6 +237,8 @@ static int generic_early_init(bool cold_boot)
 			return rc;
 	}
 
+	fdt_hsm_init(cold_boot);
+
 	if (!generic_plat || !generic_plat->early_init)
 		return 0;
 
@@ -261,6 +264,7 @@ static int generic_final_init(bool cold_boot)
 	fdt_cpu_fixup(fdt);
 	fdt_fixups(fdt);
 	fdt_domain_fixup(fdt);
+	fdt_hsm_fixup(fdt);
 
 	if (generic_plat && generic_plat->fdt_fixup) {
 		rc = generic_plat->fdt_fixup(fdt, generic_plat_match);
@@ -287,6 +291,8 @@ static int generic_vendor_ext_provider(long funcid,
 
 static void generic_early_exit(void)
 {
+	fdt_hsm_exit();
+
 	if (generic_plat && generic_plat->early_exit)
 		generic_plat->early_exit(generic_plat_match);
 }
-- 
2.34.1


