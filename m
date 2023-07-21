From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 21 Jul 2023 22:40:06 +0530
Subject: [PATCH 2/6] lib: utils/regmap: Add generic regmap access library
In-Reply-To: <20230721171010.2572232-1-apatel@ventanamicro.com>
References: <20230721171010.2572232-1-apatel@ventanamicro.com>
Message-ID: <20230721171010.2572232-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add generic regmap access library which is independent of
hardware description format (FDT or ACPI). The OpenSBI platform
support or regmap drivers can register regmap instances which
can be discovered by different regmap clients based on the
unique ID of regmap instances.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/regmap/regmap.h  |  67 +++++++++++++++++
 lib/utils/Kconfig                  |   2 +
 lib/utils/regmap/Kconfig           |   9 +++
 lib/utils/regmap/objects.mk        |  10 +++
 lib/utils/regmap/regmap.c          | 114 +++++++++++++++++++++++++++++
 platform/generic/configs/defconfig |   3 +-
 6 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/regmap/regmap.h
 create mode 100644 lib/utils/regmap/Kconfig
 create mode 100644 lib/utils/regmap/objects.mk
 create mode 100644 lib/utils/regmap/regmap.c

diff --git a/include/sbi_utils/regmap/regmap.h b/include/sbi_utils/regmap/regmap.h
new file mode 100644
index 0000000..58084fd
--- /dev/null
+++ b/include/sbi_utils/regmap/regmap.h
@@ -0,0 +1,67 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#ifndef __REGMAP_H__
+#define __REGMAP_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+
+/** Representation of a regmap instance */
+struct regmap {
+	/** Uniquie ID of the regmap instance assigned by the driver */
+	unsigned int id;
+
+	/** Configuration of regmap registers */
+	int reg_shift;
+	int reg_stride;
+	unsigned int reg_base;
+	unsigned int reg_max;
+
+	/** Read a regmap register */
+	int (*reg_read)(struct regmap *rmap, unsigned int reg,
+			unsigned int *val);
+
+	/** Write a regmap register */
+	int (*reg_write)(struct regmap *rmap, unsigned int reg,
+			 unsigned int val);
+
+	/** Read-modify-write a regmap register */
+	int (*reg_update_bits)(struct regmap *rmap, unsigned int reg,
+			       unsigned int mask, unsigned int val);
+
+	/** List */
+	struct sbi_dlist node;
+};
+
+static inline struct regmap *to_regmap(struct sbi_dlist *node)
+{
+	return container_of(node, struct regmap, node);
+}
+
+/** Find a registered regmap instance */
+struct regmap *regmap_find(unsigned int id);
+
+/** Register a regmap instance */
+int regmap_add(struct regmap *rmap);
+
+/** Un-register a regmap instance */
+void regmap_remove(struct regmap *rmap);
+
+/** Read a register in a regmap instance */
+int regmap_read(struct regmap *rmap, unsigned int reg, unsigned int *val);
+
+/** Write a register in a regmap instance */
+int regmap_write(struct regmap *rmap, unsigned int reg, unsigned int val);
+
+/** Read-modify-write a register in a regmap instance */
+int regmap_update_bits(struct regmap *rmap, unsigned int reg,
+		       unsigned int mask, unsigned int val);
+
+#endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 5a71e75..de8b4eb 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -14,6 +14,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/irqchip/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/libfdt/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/regmap/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/serial/Kconfig"
diff --git a/lib/utils/regmap/Kconfig b/lib/utils/regmap/Kconfig
new file mode 100644
index 0000000..8db5c8b
--- /dev/null
+++ b/lib/utils/regmap/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "Regmap Support"
+
+config REGMAP
+	bool "Regmap support"
+	default n
+
+endmenu
diff --git a/lib/utils/regmap/objects.mk b/lib/utils/regmap/objects.mk
new file mode 100644
index 0000000..5d1bead
--- /dev/null
+++ b/lib/utils/regmap/objects.mk
@@ -0,0 +1,10 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2023 Ventana Micro Systems Inc.
+#
+# Authors:
+#   Anup Patel <apatel@ventanamicro.com>
+#
+
+libsbiutils-objs-$(CONFIG_REGMAP) += regmap/regmap.o
diff --git a/lib/utils/regmap/regmap.c b/lib/utils/regmap/regmap.c
new file mode 100644
index 0000000..a2180c8
--- /dev/null
+++ b/lib/utils/regmap/regmap.c
@@ -0,0 +1,114 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi_utils/regmap/regmap.h>
+
+static SBI_LIST_HEAD(regmap_list);
+
+struct regmap *regmap_find(unsigned int id)
+{
+	struct sbi_dlist *pos;
+
+	sbi_list_for_each(pos, &(regmap_list)) {
+		struct regmap *rmap = to_regmap(pos);
+
+		if (rmap->id == id)
+			return rmap;
+	}
+
+	return NULL;
+}
+
+int regmap_add(struct regmap *rmap)
+{
+	if (!rmap)
+		return SBI_EINVAL;
+	if (regmap_find(rmap->id))
+		return SBI_EALREADY;
+
+	sbi_list_add(&(rmap->node), &(regmap_list));
+
+	return 0;
+}
+
+void regmap_remove(struct regmap *rmap)
+{
+	if (!rmap)
+		return;
+
+	sbi_list_del(&(rmap->node));
+}
+
+static bool regmap_reg_valid(struct regmap *rmap, unsigned int reg)
+{
+	if ((reg >= rmap->reg_max) ||
+	    (reg & (rmap->reg_stride - 1)))
+		return false;
+	return true;
+}
+
+static unsigned int regmap_reg_addr(struct regmap *rmap, unsigned int reg)
+{
+	reg += rmap->reg_base;
+
+	if (rmap->reg_shift > 0)
+		reg >>= rmap->reg_shift;
+	else if (rmap->reg_shift < 0)
+		reg <<= -(rmap->reg_shift);
+
+	return reg;
+}
+
+int regmap_read(struct regmap *rmap, unsigned int reg, unsigned int *val)
+{
+	if (!rmap || !regmap_reg_valid(rmap, reg))
+		return SBI_EINVAL;
+	if (!rmap->reg_read)
+		return SBI_ENOSYS;
+
+	return rmap->reg_read(rmap, regmap_reg_addr(rmap, reg), val);
+}
+
+int regmap_write(struct regmap *rmap, unsigned int reg, unsigned int val)
+{
+	if (!rmap || !regmap_reg_valid(rmap, reg))
+		return SBI_EINVAL;
+	if (!rmap->reg_write)
+		return SBI_ENOSYS;
+
+	return rmap->reg_write(rmap, regmap_reg_addr(rmap, reg), val);
+}
+
+int regmap_update_bits(struct regmap *rmap, unsigned int reg,
+		       unsigned int mask, unsigned int val)
+{
+	int rc;
+	unsigned int reg_val;
+
+	if (!rmap || !regmap_reg_valid(rmap, reg))
+		return SBI_EINVAL;
+
+	if (rmap->reg_update_bits) {
+		return rmap->reg_update_bits(rmap, regmap_reg_addr(rmap, reg),
+					     mask, val);
+	} else if (rmap->reg_read && rmap->reg_write) {
+		reg = regmap_reg_addr(rmap, reg);
+
+		rc = rmap->reg_read(rmap, reg, &reg_val);
+		if (rc)
+			return rc;
+
+		reg_val &= ~mask;
+		reg_val |= val & mask;
+		return rmap->reg_write(rmap, reg, reg_val);
+	}
+
+	return SBI_ENOSYS;
+}
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 671281b..d8793ea 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -18,6 +18,7 @@ CONFIG_FDT_IRQCHIP=y
 CONFIG_FDT_IRQCHIP_APLIC=y
 CONFIG_FDT_IRQCHIP_IMSIC=y
 CONFIG_FDT_IRQCHIP_PLIC=y
+CONFIG_REGMAP=y
 CONFIG_FDT_RESET=y
 CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
@@ -35,7 +36,7 @@ CONFIG_FDT_SERIAL_SIFIVE=y
 CONFIG_FDT_SERIAL_LITEX=y
 CONFIG_FDT_SERIAL_UART8250=y
 CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
+CONFIG_SERIAL_SEMIHOSTING=y
 CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
 CONFIG_FDT_TIMER_PLMT=y
-CONFIG_SERIAL_SEMIHOSTING=y
-- 
2.34.1


