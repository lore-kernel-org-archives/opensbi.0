From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue,  9 Nov 2021 15:41:25 +0300
Subject: [PATCH v3 3/6] lib: utils/i2c: Add generic I2C configuration library
In-Reply-To: <20211109124128.19666-1-nikita.shubin@maquefel.me>
References: <20211109124128.19666-1-nikita.shubin@maquefel.me>
Message-ID: <20211109124128.19666-4-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

Helper library to keep track of registered I2C adapters,
identified by dts offset, basic send/read functions and
adapter configuration (enable, set dividers, etc...).

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
v2->v3:
- dropped configure
---
 include/sbi_utils/i2c/i2c.h | 97 +++++++++++++++++++++++++++++++++++++
 lib/utils/i2c/i2c.c         | 75 ++++++++++++++++++++++++++++
 lib/utils/i2c/objects.mk    | 10 ++++
 3 files changed, 182 insertions(+)
 create mode 100644 include/sbi_utils/i2c/i2c.h
 create mode 100644 lib/utils/i2c/i2c.c
 create mode 100644 lib/utils/i2c/objects.mk

diff --git a/include/sbi_utils/i2c/i2c.h b/include/sbi_utils/i2c/i2c.h
new file mode 100644
index 0000000..09e5f0e
--- /dev/null
+++ b/include/sbi_utils/i2c/i2c.h
@@ -0,0 +1,97 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 YADRO
+ *
+ * Authors:
+ *   Nikita Shubin <nshubin@yadro.com>
+ */
+
+#ifndef __I2C_H__
+#define __I2C_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+
+/** Representation of a I2C adapter */
+struct i2c_adapter {
+	/** Pointer to I2C driver owning this I2C adapter */
+	void *driver;
+
+	/** Uniquie ID of the I2C adapter assigned by the driver */
+	int id;
+
+	/**
+	 * Configure I2C adapter
+	 *
+	 * Enable, set dividers, etc...
+	 *
+	 * @return 0 on success and negative error code on failure
+	 */
+	int (*configure)(struct i2c_adapter *ia);
+
+	/**
+	 * Send buffer to given address, register
+	 *
+	 * @return 0 on success and negative error code on failure
+	 */
+	int (*write)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
+		    uint8_t *buffer, int len);
+
+	/**
+	 * Read buffer from given address, register
+	 *
+	 * @return 0 on success and negative error code on failure
+	 */
+	int (*read)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
+		    uint8_t *buffer, int len);
+
+	/** List */
+	struct sbi_dlist node;
+};
+
+static inline struct i2c_adapter *to_i2c_adapter(struct sbi_dlist *node)
+{
+	return container_of(node, struct i2c_adapter, node);
+}
+
+/** Find a registered I2C adapter */
+struct i2c_adapter *i2c_adapter_find(int id);
+
+/** Register I2C adapter */
+int i2c_adapter_add(struct i2c_adapter *ia);
+
+/** Un-register I2C adapter */
+void i2c_adapter_remove(struct i2c_adapter *ia);
+
+/** Configure I2C adapter prior to send/read */
+int i2c_adapter_configure(struct i2c_adapter *ia);
+
+/** Send to device on I2C adapter bus */
+int i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
+		      uint8_t *buffer, int len);
+
+/** Read from device on I2C adapter bus */
+int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
+		     uint8_t *buffer, int len);
+
+static inline int i2c_adapter_reg_write(struct i2c_adapter *ia, uint8_t addr,
+				 uint8_t reg, uint8_t val)
+{
+	return i2c_adapter_write(ia, addr, reg, &val, 1);
+}
+
+static inline int i2c_adapter_reg_read(struct i2c_adapter *ia, uint8_t addr,
+				       uint8_t reg, uint8_t *val)
+{
+	uint8_t buf;
+	int ret = i2c_adapter_read(ia, addr, reg, &buf, 1);
+
+	if (ret)
+		return ret;
+
+	*val = buf;
+	return 0;
+}
+
+#endif
diff --git a/lib/utils/i2c/i2c.c b/lib/utils/i2c/i2c.c
new file mode 100644
index 0000000..1f5072c
--- /dev/null
+++ b/lib/utils/i2c/i2c.c
@@ -0,0 +1,75 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 YADRO
+ *
+ * Authors:
+ *   Nikita Shubin <nshubin@yadro.com>
+ *
+ * derivate: lib/utils/gpio/gpio.c
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi_utils/i2c/i2c.h>
+
+static SBI_LIST_HEAD(i2c_adapters_list);
+
+struct i2c_adapter *i2c_adapter_find(int id)
+{
+	struct sbi_dlist *pos;
+
+	sbi_list_for_each(pos, &(i2c_adapters_list)) {
+		struct i2c_adapter *adap = to_i2c_adapter(pos);
+
+		if (adap->id == id)
+			return adap;
+	}
+
+	return NULL;
+}
+
+int i2c_adapter_add(struct i2c_adapter *ia)
+{
+	if (!ia)
+		return SBI_EINVAL;
+
+	if (i2c_adapter_find(ia->id))
+		return SBI_EALREADY;
+
+	sbi_list_add(&(ia->node), &(i2c_adapters_list));
+
+	return 0;
+}
+
+void i2c_adapter_remove(struct i2c_adapter *ia)
+{
+	if (!ia)
+		return;
+
+	sbi_list_del(&(ia->node));
+}
+
+int i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
+		     uint8_t *buffer, int len)
+{
+	if (!ia)
+		return SBI_EINVAL;
+	if (!ia->write)
+		return SBI_ENOSYS;
+
+	return ia->write(ia, addr, reg, buffer, len);
+}
+
+
+int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
+		     uint8_t *buffer, int len)
+{
+	if (!ia)
+		return SBI_EINVAL;
+	if (!ia->read)
+		return SBI_ENOSYS;
+
+	return ia->read(ia, addr, reg, buffer, len);
+}
diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
new file mode 100644
index 0000000..16a70da
--- /dev/null
+++ b/lib/utils/i2c/objects.mk
@@ -0,0 +1,10 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2021 YADRO
+#
+# Authors:
+#   Nikita Shubin <nshubin@yadro.com>
+#
+
+libsbiutils-objs-y += i2c/i2c.o
-- 
2.31.1


