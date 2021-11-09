From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue,  9 Nov 2021 15:41:26 +0300
Subject: [PATCH v3 4/6] lib: utils/i2c: Add simple FDT based I2C framework
In-Reply-To: <20211109124128.19666-1-nikita.shubin@maquefel.me>
References: <20211109124128.19666-1-nikita.shubin@maquefel.me>
Message-ID: <20211109124128.19666-5-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

FDT based I2C framework on the top of I2C library.

The drivers are probed on demand by fdt_i2c_adapter_get
function.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
v2->v3:
- dropped configure
---
 include/sbi_utils/i2c/fdt_i2c.h | 26 ++++++++++
 lib/utils/i2c/fdt_i2c.c         | 87 +++++++++++++++++++++++++++++++++
 lib/utils/i2c/objects.mk        |  1 +
 3 files changed, 114 insertions(+)
 create mode 100644 include/sbi_utils/i2c/fdt_i2c.h
 create mode 100644 lib/utils/i2c/fdt_i2c.c

diff --git a/include/sbi_utils/i2c/fdt_i2c.h b/include/sbi_utils/i2c/fdt_i2c.h
new file mode 100644
index 0000000..1f41a0f
--- /dev/null
+++ b/include/sbi_utils/i2c/fdt_i2c.h
@@ -0,0 +1,26 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 YADRO
+ *
+ * Authors:
+ *   Nikita Shubin <nshubin@yadro.com>
+ */
+
+#ifndef __FDT_I2C_H__
+#define __FDT_I2C_H__
+
+#include <sbi_utils/i2c/i2c.h>
+
+/** FDT based I2C adapter driver */
+struct fdt_i2c_adapter {
+	const struct fdt_match *match_table;
+	int (*init)(void *fdt, int nodeoff,
+		    const struct fdt_match *match);
+};
+
+/** Get I2C adapter identified by nodeoff */
+int fdt_i2c_adapter_get(void *fdt, int nodeoff,
+			struct i2c_adapter **out_adapter);
+
+#endif
diff --git a/lib/utils/i2c/fdt_i2c.c b/lib/utils/i2c/fdt_i2c.c
new file mode 100644
index 0000000..3182f56
--- /dev/null
+++ b/lib/utils/i2c/fdt_i2c.c
@@ -0,0 +1,87 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 YADRO
+ *
+ * Authors:
+ *   Nikita Shubin <nshubin@yadro.com>
+ *
+ * derivate: lib/utils/gpio/fdt_gpio.c
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/i2c/fdt_i2c.h>
+
+#include <sbi/sbi_console.h>
+
+static struct fdt_i2c_adapter *i2c_adapter_drivers[] = {
+};
+
+static int fdt_i2c_adapter_init(void *fdt, int nodeoff)
+{
+	int pos, rc;
+	struct fdt_i2c_adapter *drv;
+	const struct fdt_match *match;
+
+	/* Try all I2C drivers one-by-one */
+	for (pos = 0; pos < array_size(i2c_adapter_drivers); pos++) {
+		drv = i2c_adapter_drivers[pos];
+		match = fdt_match_node(fdt, nodeoff, drv->match_table);
+		if (match && drv->init) {
+			rc = drv->init(fdt, nodeoff, match);
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
+static int fdt_i2c_adapter_find(void *fdt, int nodeoff,
+				struct i2c_adapter **out_adapter)
+{
+	int rc;
+	struct i2c_adapter *adapter = i2c_adapter_find(nodeoff);
+
+	if (!adapter) {
+		/* I2C adapter not found so initialize matching driver */
+		rc = fdt_i2c_adapter_init(fdt, nodeoff);
+		if (rc)
+			return rc;
+
+		/* Try to find I2C adapter again */
+		adapter = i2c_adapter_find(nodeoff);
+		if (!adapter)
+			return SBI_ENOSYS;
+	}
+
+	if (out_adapter)
+		*out_adapter = adapter;
+
+	return 0;
+}
+
+int fdt_i2c_adapter_get(void *fdt, int nodeoff,
+			struct i2c_adapter **out_adapter)
+{
+	int rc;
+	struct i2c_adapter *adapter;
+
+	if (!fdt || (nodeoff < 0) || !out_adapter)
+		return SBI_EINVAL;
+
+	rc = fdt_i2c_adapter_find(fdt, nodeoff, &adapter);
+	if (rc)
+		return rc;
+
+	*out_adapter = adapter;
+
+	return 0;
+}
diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
index 16a70da..06baa65 100644
--- a/lib/utils/i2c/objects.mk
+++ b/lib/utils/i2c/objects.mk
@@ -8,3 +8,4 @@
 #
 
 libsbiutils-objs-y += i2c/i2c.o
+libsbiutils-objs-y += i2c/fdt_i2c.o
-- 
2.31.1


