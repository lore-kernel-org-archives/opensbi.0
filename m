From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:51 +0530
Subject: [PATCH v2 16/17] lib: utils: Add simple FDT based MPXY driver framework
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-17-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform can have multiple MPXY drivers so add a simple
FDT based MPXY driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mpxy/fdt_mpxy.h      | 26 ++++++++++++++++++++++++++
 lib/utils/Kconfig                      |  2 ++
 lib/utils/mpxy/Kconfig                 | 10 ++++++++++
 lib/utils/mpxy/fdt_mpxy.c              | 22 ++++++++++++++++++++++
 lib/utils/mpxy/fdt_mpxy_drivers.carray |  3 +++
 lib/utils/mpxy/objects.mk              | 11 +++++++++++
 platform/generic/configs/defconfig     |  1 +
 platform/generic/platform.c            | 10 ++++++++++
 8 files changed, 85 insertions(+)
 create mode 100644 include/sbi_utils/mpxy/fdt_mpxy.h
 create mode 100644 lib/utils/mpxy/Kconfig
 create mode 100644 lib/utils/mpxy/fdt_mpxy.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_drivers.carray
 create mode 100644 lib/utils/mpxy/objects.mk

diff --git a/include/sbi_utils/mpxy/fdt_mpxy.h b/include/sbi_utils/mpxy/fdt_mpxy.h
new file mode 100644
index 00000000..2ba9d28f
--- /dev/null
+++ b/include/sbi_utils/mpxy/fdt_mpxy.h
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
+#ifndef __FDT_MPXY_H__
+#define __FDT_MPXY_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+
+#ifdef CONFIG_FDT_MPXY
+
+void fdt_mpxy_init(const void *fdt);
+
+#else
+
+static inline void fdt_mpxy_init(const void *fdt) { }
+
+#endif
+
+#endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 002d6f8f..901ba564 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -32,4 +32,6 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/sys/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/timer/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/mpxy/Kconfig"
+
 endmenu
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
new file mode 100644
index 00000000..d084b09a
--- /dev/null
+++ b/lib/utils/mpxy/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "MPXY Device Support"
+
+config FDT_MPXY
+	bool "FDT based MPXY drivers"
+	depends on FDT
+	default n
+
+endmenu
diff --git a/lib/utils/mpxy/fdt_mpxy.c b/lib/utils/mpxy/fdt_mpxy.c
new file mode 100644
index 00000000..6984ec74
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy.c
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
+#include <sbi_utils/mpxy/fdt_mpxy.h>
+
+/* List of FDT MPXY drivers generated at compile time */
+extern const struct fdt_driver *const fdt_mpxy_drivers[];
+
+void fdt_mpxy_init(const void *fdt)
+{
+	/*
+	 * Platforms might have multiple MPXY devices or might not
+	 * have any MPXY devices so don't fail.
+	 */
+	fdt_driver_init_all(fdt, fdt_mpxy_drivers);
+}
diff --git a/lib/utils/mpxy/fdt_mpxy_drivers.carray b/lib/utils/mpxy/fdt_mpxy_drivers.carray
new file mode 100644
index 00000000..3cac0155
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/mpxy/fdt_mpxy.h
+TYPE: const struct fdt_driver
+NAME: fdt_mpxy_drivers
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
new file mode 100644
index 00000000..43e73c94
--- /dev/null
+++ b/lib/utils/mpxy/objects.mk
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
+libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy.o
+libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy_drivers.carray.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 384918f9..1f0880ee 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -53,3 +53,4 @@ CONFIG_FDT_SUSPEND_RPMI=y
 CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
 CONFIG_FDT_TIMER_PLMT=y
+CONFIG_FDT_MPXY=y
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 6f830744..f7888b43 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_tlb.h>
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/cppc/fdt_cppc.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -414,6 +415,14 @@ static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
 	return evt_val;
 }
 
+static int generic_mpxy_init(void)
+{
+	const void *fdt = fdt_get_address();
+
+	fdt_mpxy_init(fdt);
+	return 0;
+}
+
 const struct sbi_platform_operations platform_ops = {
 	.cold_boot_allowed	= generic_cold_boot_allowed,
 	.nascent_init		= generic_nascent_init,
@@ -430,6 +439,7 @@ const struct sbi_platform_operations platform_ops = {
 	.get_tlbr_flush_limit	= generic_tlbr_flush_limit,
 	.get_tlb_num_entries	= generic_tlb_num_entries,
 	.timer_init		= fdt_timer_init,
+	.mpxy_init		= generic_mpxy_init,
 	.vendor_ext_check	= generic_vendor_ext_check,
 	.vendor_ext_provider	= generic_vendor_ext_provider,
 };
-- 
2.43.0


