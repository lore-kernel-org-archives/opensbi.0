From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  6 Aug 2024 13:03:37 +0530
Subject: [PATCH 15/16] lib: utils: Add simple FDT based MPXY driver framework
In-Reply-To: <20240806073338.1856901-1-apatel@ventanamicro.com>
References: <20240806073338.1856901-1-apatel@ventanamicro.com>
Message-ID: <20240806073338.1856901-16-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform can have multiple MPXY drivers so add a simple
FDT based MPXY driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/mpxy/fdt_mpxy.h      | 31 ++++++++++++++++
 lib/utils/Kconfig                      |  2 ++
 lib/utils/mpxy/Kconfig                 | 10 ++++++
 lib/utils/mpxy/fdt_mpxy.c              | 50 ++++++++++++++++++++++++++
 lib/utils/mpxy/fdt_mpxy_drivers.carray |  3 ++
 lib/utils/mpxy/objects.mk              | 11 ++++++
 platform/generic/configs/defconfig     |  1 +
 platform/generic/platform.c            |  2 ++
 8 files changed, 110 insertions(+)
 create mode 100644 include/sbi_utils/mpxy/fdt_mpxy.h
 create mode 100644 lib/utils/mpxy/Kconfig
 create mode 100644 lib/utils/mpxy/fdt_mpxy.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_drivers.carray
 create mode 100644 lib/utils/mpxy/objects.mk

diff --git a/include/sbi_utils/mpxy/fdt_mpxy.h b/include/sbi_utils/mpxy/fdt_mpxy.h
new file mode 100644
index 00000000..7ea26055
--- /dev/null
+++ b/include/sbi_utils/mpxy/fdt_mpxy.h
@@ -0,0 +1,31 @@
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
+
+#ifdef CONFIG_FDT_MPXY
+
+struct fdt_mpxy {
+	const struct fdt_match *match_table;
+	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	void (*exit)(void);
+};
+
+int fdt_mpxy_init(void);
+
+#else
+
+static inline int fdt_mpxy_init(void) { return 0; }
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
index 00000000..41753fab
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy.c
@@ -0,0 +1,50 @@
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
+#include <sbi_utils/mpxy/fdt_mpxy.h>
+
+/* List of FDT MPXY drivers generated at compile time */
+extern struct fdt_mpxy *fdt_mpxy_drivers[];
+extern unsigned long fdt_mpxy_drivers_size;
+
+int fdt_mpxy_init(void)
+{
+	int pos, noff, rc;
+	struct fdt_mpxy *drv;
+	const struct fdt_match *match;
+	void *fdt = fdt_get_address();
+
+	for (pos = 0; pos < fdt_mpxy_drivers_size; pos++) {
+		drv = fdt_mpxy_drivers[pos];
+
+		noff = -1;
+		while ((noff = fdt_find_match(fdt, noff,
+					drv->match_table, &match)) >= 0) {
+			/* drv->init must not be NULL */
+			if (drv->init == NULL)
+				return SBI_EFAIL;
+
+			rc = drv->init(fdt, noff, match);
+			if (rc == SBI_ENODEV)
+				continue;
+			if (rc)
+				return rc;
+
+			/*
+			 * We will have multiple MPXY devices so we
+			 * cannot break here.
+			 */
+		}
+	}
+
+	/* Platforms might not have any MPXY devices so don't fail */
+	return 0;
+}
diff --git a/lib/utils/mpxy/fdt_mpxy_drivers.carray b/lib/utils/mpxy/fdt_mpxy_drivers.carray
new file mode 100644
index 00000000..d930753a
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/mpxy/fdt_mpxy.h
+TYPE: struct fdt_mpxy
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
index d085647d..89bd3af9 100644
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
@@ -418,6 +419,7 @@ const struct sbi_platform_operations platform_ops = {
 	.get_tlb_num_entries	= generic_tlb_num_entries,
 	.timer_init		= fdt_timer_init,
 	.timer_exit		= fdt_timer_exit,
+	.mpxy_init		= fdt_mpxy_init,
 	.vendor_ext_check	= generic_vendor_ext_check,
 	.vendor_ext_provider	= generic_vendor_ext_provider,
 };
-- 
2.34.1


