From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 21 Jul 2023 22:40:07 +0530
Subject: [PATCH 3/6] lib: utils/regmap: Add simple FDT based regmap framework
In-Reply-To: <20230721171010.2572232-1-apatel@ventanamicro.com>
References: <20230721171010.2572232-1-apatel@ventanamicro.com>
Message-ID: <20230721171010.2572232-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add a simple FDT based regmap framework which is built on top of
generic regmap library. The phandle of FDT regmap DT node is treated
as unique regmap ID. The FDT based regmap drivers will be probed
on-demand from fdt_regmap_get_by_phandle() and fdt_regmap_get()
called by the regmap client drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/regmap/fdt_regmap.h      | 31 +++++++
 lib/utils/regmap/Kconfig                   |  6 ++
 lib/utils/regmap/fdt_regmap.c              | 94 ++++++++++++++++++++++
 lib/utils/regmap/fdt_regmap_drivers.carray |  3 +
 lib/utils/regmap/objects.mk                |  3 +
 platform/generic/configs/defconfig         |  2 +-
 6 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/regmap/fdt_regmap.h
 create mode 100644 lib/utils/regmap/fdt_regmap.c
 create mode 100644 lib/utils/regmap/fdt_regmap_drivers.carray

diff --git a/include/sbi_utils/regmap/fdt_regmap.h b/include/sbi_utils/regmap/fdt_regmap.h
new file mode 100644
index 0000000..0672162
--- /dev/null
+++ b/include/sbi_utils/regmap/fdt_regmap.h
@@ -0,0 +1,31 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#ifndef __FDT_REGMAP_H__
+#define __FDT_REGMAP_H__
+
+#include <sbi_utils/regmap/regmap.h>
+
+struct fdt_phandle_args;
+
+/** FDT based regmap driver */
+struct fdt_regmap {
+	const struct fdt_match *match_table;
+	int (*init)(void *fdt, int nodeoff, u32 phandle,
+		    const struct fdt_match *match);
+};
+
+/** Get regmap instance based on phandle */
+int fdt_regmap_get_by_phandle(void *fdt, u32 phandle,
+			      struct regmap **out_rmap);
+
+/** Get regmap instance based on "regmap' property of the specified DT node */
+int fdt_regmap_get(void *fdt, int nodeoff, struct regmap **out_rmap);
+
+#endif
diff --git a/lib/utils/regmap/Kconfig b/lib/utils/regmap/Kconfig
index 8db5c8b..b1ff501 100644
--- a/lib/utils/regmap/Kconfig
+++ b/lib/utils/regmap/Kconfig
@@ -2,6 +2,12 @@
 
 menu "Regmap Support"
 
+config FDT_REGMAP
+	bool "FDT based regmap drivers"
+	depends on FDT
+	select REGMAP
+	default n
+
 config REGMAP
 	bool "Regmap support"
 	default n
diff --git a/lib/utils/regmap/fdt_regmap.c b/lib/utils/regmap/fdt_regmap.c
new file mode 100644
index 0000000..fffac1d
--- /dev/null
+++ b/lib/utils/regmap/fdt_regmap.c
@@ -0,0 +1,94 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/regmap/fdt_regmap.h>
+
+/* List of FDT regmap drivers generated at compile time */
+extern struct fdt_regmap *fdt_regmap_drivers[];
+extern unsigned long fdt_regmap_drivers_size;
+
+static int fdt_regmap_init(void *fdt, int nodeoff, u32 phandle)
+{
+	int pos, rc;
+	struct fdt_regmap *drv;
+	const struct fdt_match *match;
+
+	/* Try all I2C drivers one-by-one */
+	for (pos = 0; pos < fdt_regmap_drivers_size; pos++) {
+		drv = fdt_regmap_drivers[pos];
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
+static int fdt_regmap_find(void *fdt, int nodeoff, u32 phandle,
+			   struct regmap **out_rmap)
+{
+	int rc;
+	struct regmap *rmap = regmap_find(phandle);
+
+	if (!rmap) {
+		/* Regmap not found so initialize matching driver */
+		rc = fdt_regmap_init(fdt, nodeoff, phandle);
+		if (rc)
+			return rc;
+
+		/* Try to find regmap again */
+		rmap = regmap_find(phandle);
+		if (!rmap)
+			return SBI_ENOSYS;
+	}
+
+	if (out_rmap)
+		*out_rmap = rmap;
+
+	return 0;
+}
+
+int fdt_regmap_get_by_phandle(void *fdt, u32 phandle,
+			      struct regmap **out_rmap)
+{
+	int pnodeoff;
+
+	if (!fdt || !out_rmap)
+		return SBI_EINVAL;
+
+	pnodeoff = fdt_node_offset_by_phandle(fdt, phandle);
+	if (pnodeoff < 0)
+		return pnodeoff;
+
+	return fdt_regmap_find(fdt, pnodeoff, phandle, out_rmap);
+}
+
+int fdt_regmap_get(void *fdt, int nodeoff, struct regmap **out_rmap)
+{
+	int len;
+	const fdt32_t *val;
+
+	if (!fdt || (nodeoff < 0) || !out_rmap)
+		return SBI_EINVAL;
+
+	val = fdt_getprop(fdt, nodeoff, "regmap", &len);
+	if (!val)
+		return SBI_ENOENT;
+
+	return fdt_regmap_get_by_phandle(fdt, fdt32_to_cpu(*val), out_rmap);
+}
diff --git a/lib/utils/regmap/fdt_regmap_drivers.carray b/lib/utils/regmap/fdt_regmap_drivers.carray
new file mode 100644
index 0000000..c2f1c9d
--- /dev/null
+++ b/lib/utils/regmap/fdt_regmap_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/regmap/fdt_regmap.h
+TYPE: struct fdt_regmap
+NAME: fdt_regmap_drivers
diff --git a/lib/utils/regmap/objects.mk b/lib/utils/regmap/objects.mk
index 5d1bead..5ce2373 100644
--- a/lib/utils/regmap/objects.mk
+++ b/lib/utils/regmap/objects.mk
@@ -7,4 +7,7 @@
 #   Anup Patel <apatel@ventanamicro.com>
 #
 
+libsbiutils-objs-$(CONFIG_FDT_REGMAP) += regmap/fdt_regmap.o
+libsbiutils-objs-$(CONFIG_FDT_REGMAP) += regmap/fdt_regmap_drivers.o
+
 libsbiutils-objs-$(CONFIG_REGMAP) += regmap/regmap.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index d8793ea..ad585e3 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -18,7 +18,7 @@ CONFIG_FDT_IRQCHIP=y
 CONFIG_FDT_IRQCHIP_APLIC=y
 CONFIG_FDT_IRQCHIP_IMSIC=y
 CONFIG_FDT_IRQCHIP_PLIC=y
-CONFIG_REGMAP=y
+CONFIG_FDT_REGMAP=y
 CONFIG_FDT_RESET=y
 CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
-- 
2.34.1


