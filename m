From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 21 Jul 2023 22:40:08 +0530
Subject: [PATCH 4/6] lib: utils/regmap: Add simple FDT based syscon regmap driver
In-Reply-To: <20230721171010.2572232-1-apatel@ventanamicro.com>
References: <20230721171010.2572232-1-apatel@ventanamicro.com>
Message-ID: <20230721171010.2572232-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let us add a simple FDT based system regmap driver which follows the
device tree bindings already defined in the Linux kernel.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/regmap/Kconfig             |   7 +
 lib/utils/regmap/fdt_regmap_syscon.c | 262 +++++++++++++++++++++++++++
 lib/utils/regmap/objects.mk          |   3 +
 platform/generic/configs/defconfig   |   1 +
 4 files changed, 273 insertions(+)
 create mode 100644 lib/utils/regmap/fdt_regmap_syscon.c

diff --git a/lib/utils/regmap/Kconfig b/lib/utils/regmap/Kconfig
index b1ff501..62d9f93 100644
--- a/lib/utils/regmap/Kconfig
+++ b/lib/utils/regmap/Kconfig
@@ -8,6 +8,13 @@ config FDT_REGMAP
 	select REGMAP
 	default n
 
+if FDT_REGMAP
+
+config FDT_REGMAP_SYSCON
+	bool "Syscon regmap FDT driver"
+	default n
+endif
+
 config REGMAP
 	bool "Regmap support"
 	default n
diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
new file mode 100644
index 0000000..29263dd
--- /dev/null
+++ b/lib/utils/regmap/fdt_regmap_syscon.c
@@ -0,0 +1,262 @@
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
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/regmap/fdt_regmap.h>
+
+enum syscon_regmap_endian {
+	SYSCON_ENDIAN_NATIVE = 0,
+	SYSCON_ENDIAN_LITTLE,
+	SYSCON_ENDIAN_BIG,
+	SYSCON_ENDIAN_MAX
+};
+
+struct syscon_regmap {
+	u32 reg_io_width;
+	enum syscon_regmap_endian reg_endian;
+	unsigned long addr;
+	struct regmap rmap;
+};
+
+#define to_syscon_regmap(__rmap)	\
+	container_of((__rmap), struct syscon_regmap, rmap)
+
+static int regmap_syscon_read_8(struct regmap *rmap, unsigned int reg,
+				unsigned int *val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	*val = readb((volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_write_8(struct regmap *rmap, unsigned int reg,
+				 unsigned int val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	writeb(val, (volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_read_16(struct regmap *rmap, unsigned int reg,
+				unsigned int *val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	*val = readw((volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_write_16(struct regmap *rmap, unsigned int reg,
+				 unsigned int val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	writew(val, (volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_read_32(struct regmap *rmap, unsigned int reg,
+				unsigned int *val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	*val = readl((volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_write_32(struct regmap *rmap, unsigned int reg,
+				 unsigned int val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	writel(val, (volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_read_le16(struct regmap *rmap, unsigned int reg,
+				   unsigned int *val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	*val = le16_to_cpu(readw((volatile void *)(srm->addr + reg)));
+	return 0;
+}
+
+static int regmap_syscon_write_le16(struct regmap *rmap, unsigned int reg,
+				    unsigned int val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	writew(cpu_to_le16(val), (volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_read_le32(struct regmap *rmap, unsigned int reg,
+				   unsigned int *val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	*val = le32_to_cpu(readl((volatile void *)(srm->addr + reg)));
+	return 0;
+}
+
+static int regmap_syscon_write_le32(struct regmap *rmap, unsigned int reg,
+				    unsigned int val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	writel(cpu_to_le32(val), (volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_read_be16(struct regmap *rmap, unsigned int reg,
+				   unsigned int *val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	*val = be16_to_cpu(readl((volatile void *)(srm->addr + reg)));
+	return 0;
+}
+
+static int regmap_syscon_write_be16(struct regmap *rmap, unsigned int reg,
+				    unsigned int val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	writel(cpu_to_be16(val), (volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_read_be32(struct regmap *rmap, unsigned int reg,
+				   unsigned int *val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	*val = be32_to_cpu(readl((volatile void *)(srm->addr + reg)));
+	return 0;
+}
+
+static int regmap_syscon_write_be32(struct regmap *rmap, unsigned int reg,
+				    unsigned int val)
+{
+	struct syscon_regmap *srm = to_syscon_regmap(rmap);
+
+	writel(cpu_to_be32(val), (volatile void *)(srm->addr + reg));
+	return 0;
+}
+
+static int regmap_syscon_init(void *fdt, int nodeoff, u32 phandle,
+			      const struct fdt_match *match)
+{
+	struct syscon_regmap *srm;
+	uint64_t addr, size;
+	const fdt32_t *val;
+	int rc, len;
+
+	srm = sbi_zalloc(sizeof(*srm));
+	if (!srm)
+		return SBI_ENOMEM;
+
+	val = fdt_getprop(fdt, nodeoff, "reg-io-width", &len);
+	srm->reg_io_width = val ? fdt32_to_cpu(*val) : 4;
+
+	if (fdt_getprop(fdt, nodeoff, "native-endian", &len))
+		srm->reg_endian = SYSCON_ENDIAN_NATIVE;
+	else if (fdt_getprop(fdt, nodeoff, "little-endian", &len))
+		srm->reg_endian = SYSCON_ENDIAN_LITTLE;
+	else if (fdt_getprop(fdt, nodeoff, "big-endian", &len))
+		srm->reg_endian = SYSCON_ENDIAN_BIG;
+	else
+		srm->reg_endian = SYSCON_ENDIAN_NATIVE;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, &size);
+	if (rc)
+		goto fail_free_syscon;
+	srm->addr = addr;
+
+	srm->rmap.id = phandle;
+	srm->rmap.reg_shift = 0;
+	srm->rmap.reg_stride = srm->reg_io_width * 8;
+	srm->rmap.reg_base = 0;
+	srm->rmap.reg_max = size / srm->reg_io_width;
+	switch (srm->reg_io_width) {
+	case 1:
+		srm->rmap.reg_read = regmap_syscon_read_8;
+		srm->rmap.reg_write = regmap_syscon_write_8;
+		break;
+	case 2:
+		switch (srm->reg_endian) {
+		case SYSCON_ENDIAN_NATIVE:
+			srm->rmap.reg_read = regmap_syscon_read_16;
+			srm->rmap.reg_write = regmap_syscon_write_16;
+			break;
+		case SYSCON_ENDIAN_LITTLE:
+			srm->rmap.reg_read = regmap_syscon_read_le16;
+			srm->rmap.reg_write = regmap_syscon_write_le16;
+			break;
+		case SYSCON_ENDIAN_BIG:
+			srm->rmap.reg_read = regmap_syscon_read_be16;
+			srm->rmap.reg_write = regmap_syscon_write_be16;
+			break;
+		default:
+			rc = SBI_EINVAL;
+			goto fail_free_syscon;
+		}
+		break;
+	case 4:
+		switch (srm->reg_endian) {
+		case SYSCON_ENDIAN_NATIVE:
+			srm->rmap.reg_read = regmap_syscon_read_32;
+			srm->rmap.reg_write = regmap_syscon_write_32;
+			break;
+		case SYSCON_ENDIAN_LITTLE:
+			srm->rmap.reg_read = regmap_syscon_read_le32;
+			srm->rmap.reg_write = regmap_syscon_write_le32;
+			break;
+		case SYSCON_ENDIAN_BIG:
+			srm->rmap.reg_read = regmap_syscon_read_be32;
+			srm->rmap.reg_write = regmap_syscon_write_be32;
+			break;
+		default:
+			rc = SBI_EINVAL;
+			goto fail_free_syscon;
+		}
+		break;
+	default:
+		rc = SBI_EINVAL;
+		goto fail_free_syscon;
+	}
+
+	rc = regmap_add(&srm->rmap);
+	if (rc)
+		goto fail_free_syscon;
+
+	return 0;
+
+fail_free_syscon:
+	sbi_free(srm);
+	return rc;
+}
+
+static const struct fdt_match regmap_syscon_match[] = {
+	{ .compatible = "syscon" },
+	{ },
+};
+
+struct fdt_regmap fdt_regmap_syscon = {
+	.match_table = regmap_syscon_match,
+	.init = regmap_syscon_init,
+};
diff --git a/lib/utils/regmap/objects.mk b/lib/utils/regmap/objects.mk
index 5ce2373..5bd139f 100644
--- a/lib/utils/regmap/objects.mk
+++ b/lib/utils/regmap/objects.mk
@@ -10,4 +10,7 @@
 libsbiutils-objs-$(CONFIG_FDT_REGMAP) += regmap/fdt_regmap.o
 libsbiutils-objs-$(CONFIG_FDT_REGMAP) += regmap/fdt_regmap_drivers.o
 
+carray-fdt_regmap_drivers-$(CONFIG_FDT_REGMAP_SYSCON) += fdt_regmap_syscon
+libsbiutils-objs-$(CONFIG_FDT_REGMAP_SYSCON) += regmap/fdt_regmap_syscon.o
+
 libsbiutils-objs-$(CONFIG_REGMAP) += regmap/regmap.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index ad585e3..b767290 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -19,6 +19,7 @@ CONFIG_FDT_IRQCHIP_APLIC=y
 CONFIG_FDT_IRQCHIP_IMSIC=y
 CONFIG_FDT_IRQCHIP_PLIC=y
 CONFIG_FDT_REGMAP=y
+CONFIG_FDT_REGMAP_SYSCON=y
 CONFIG_FDT_RESET=y
 CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
-- 
2.34.1


