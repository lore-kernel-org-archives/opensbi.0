From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Nov 2024 14:02:46 -0800
Subject: [PATCH v2 02/11] lib: utils/fdt: Add helpers for generic driver initialization
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <20241111220304.1228821-3-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, each driver subsystem contains its own code for matching
drivers against the platform's devicetree blob. This bloats firmware
size because the several FDT scanning loops are almost exact copies of
each other, and is confusing because the loops do have some subtle
differences. Furthermore, the existing match algorithm is inefficient:
it scans the FDT structure separately for each driver in the list. A
faster algorithm scans the FDT blob only once, matching all drivers in
the list for each `compatible` property seen.

Add new helpers implementing this faster algorithm. Since they must
iterate through the list of drivers, the driver structure cannot be
opaque. However, since the driver list is an array of pointers, the
`struct fdt_driver` can be embedded in a subsystem-specific driver
structure if needed. These three helpers cover all existing use cases
for driver initialization within OpenSBI.

An additional benefit of centralized driver initialization is the
consistent use of fdt_node_is_enabled().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 include/sbi_utils/fdt/fdt_driver.h | 59 ++++++++++++++++++++++
 lib/utils/fdt/fdt_driver.c         | 80 ++++++++++++++++++++++++++++++
 lib/utils/fdt/objects.mk           |  1 +
 3 files changed, 140 insertions(+)
 create mode 100644 include/sbi_utils/fdt/fdt_driver.h
 create mode 100644 lib/utils/fdt/fdt_driver.c

diff --git a/include/sbi_utils/fdt/fdt_driver.h b/include/sbi_utils/fdt/fdt_driver.h
new file mode 100644
index 00000000..f6fd26f9
--- /dev/null
+++ b/include/sbi_utils/fdt/fdt_driver.h
@@ -0,0 +1,59 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * fdt_driver.h - Generic support for initializing drivers from DT nodes.
+ *
+ * Copyright (c) 2024 SiFive
+ */
+
+#ifndef __FDT_DRIVER_H__
+#define __FDT_DRIVER_H__
+
+#include <sbi_utils/fdt/fdt_helper.h>
+
+struct fdt_driver {
+	const struct fdt_match *match_table;
+	int (*init)(const void *fdt, int nodeoff,
+		    const struct fdt_match *match);
+};
+
+/**
+ * Initialize a driver instance for a specific DT node
+ *
+ * @param fdt devicetree blob
+ * @param nodeoff offset of a node in the devicetree blob
+ * @param drivers NULL-terminated array of drivers to match against this node
+ *
+ * @return 0 if a driver was matched and successfully initialized or a negative
+ * error code on failure
+ */
+int fdt_driver_init_by_offset(const void *fdt, int nodeoff,
+			      const struct fdt_driver *const *drivers);
+
+/**
+ * Initialize a driver instance for each DT node that matches any of the
+ * provided drivers
+ *
+ * @param fdt devicetree blob
+ * @param drivers NULL-terminated array of drivers to match against each node
+ *
+ * @return 0 if drivers for all matches (if any) were successfully initialized
+ * or a negative error code on failure
+ */
+int fdt_driver_init_all(const void *fdt,
+			const struct fdt_driver *const *drivers);
+
+/**
+ * Initialize a driver instance for the first DT node that matches any of the
+ * provided drivers
+ *
+ * @param fdt devicetree blob
+ * @param drivers NULL-terminated array of drivers to match against each node
+ *
+ * @return 0 if a driver was matched and successfully initialized or a negative
+ * error code on failure
+ */
+int fdt_driver_init_one(const void *fdt,
+			const struct fdt_driver *const *drivers);
+
+#endif /* __FDT_DRIVER_H__ */
diff --git a/lib/utils/fdt/fdt_driver.c b/lib/utils/fdt/fdt_driver.c
new file mode 100644
index 00000000..586ea8aa
--- /dev/null
+++ b/lib/utils/fdt/fdt_driver.c
@@ -0,0 +1,80 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 SiFive
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+int fdt_driver_init_by_offset(const void *fdt, int nodeoff,
+			      const struct fdt_driver *const *drivers)
+{
+	const struct fdt_driver *driver;
+	const struct fdt_match *match;
+	const void *prop;
+	int len, rc;
+
+	if (!fdt_node_is_enabled(fdt, nodeoff))
+		return SBI_ENODEV;
+
+	prop = fdt_getprop(fdt, nodeoff, "compatible", &len);
+	if (!prop)
+		return SBI_ENODEV;
+
+	while ((driver = *drivers++)) {
+		for (match = driver->match_table; match->compatible; match++) {
+			if (!fdt_stringlist_contains(prop, len, match->compatible))
+				continue;
+
+			rc = driver->init(fdt, nodeoff, match);
+			if (rc < 0) {
+				const char *name;
+
+				name = fdt_get_name(fdt, nodeoff, NULL);
+				sbi_printf("%s: %s (%s) init failed: %d\n",
+					   __func__, name, match->compatible, rc);
+			}
+
+			return rc;
+		}
+	}
+
+	return SBI_ENODEV;
+}
+
+static int fdt_driver_init_scan(const void *fdt,
+				const struct fdt_driver *const *drivers,
+				bool one)
+{
+	int nodeoff, rc;
+
+	for (nodeoff = fdt_next_node(fdt, -1, NULL);
+	     nodeoff >= 0;
+	     nodeoff = fdt_next_node(fdt, nodeoff, NULL)) {
+		rc = fdt_driver_init_by_offset(fdt, nodeoff, drivers);
+		if (rc == SBI_ENODEV)
+			continue;
+		if (rc < 0)
+			return rc;
+		if (one)
+			return 0;
+	}
+
+	return one ? SBI_ENODEV : 0;
+}
+
+int fdt_driver_init_all(const void *fdt,
+			const struct fdt_driver *const *drivers)
+{
+	return fdt_driver_init_scan(fdt, drivers, false);
+}
+
+int fdt_driver_init_one(const void *fdt,
+			const struct fdt_driver *const *drivers)
+{
+	return fdt_driver_init_scan(fdt, drivers, true);
+}
diff --git a/lib/utils/fdt/objects.mk b/lib/utils/fdt/objects.mk
index 5cede811..1a2298be 100644
--- a/lib/utils/fdt/objects.mk
+++ b/lib/utils/fdt/objects.mk
@@ -7,4 +7,5 @@
 libsbiutils-objs-$(CONFIG_FDT_DOMAIN) += fdt/fdt_domain.o
 libsbiutils-objs-$(CONFIG_FDT_PMU) += fdt/fdt_pmu.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_helper.o
+libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_driver.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_fixup.o
-- 
2.45.1


