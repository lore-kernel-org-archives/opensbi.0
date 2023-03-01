From: Ben Dooks <ben.dooks@sifive.com>
Date: Wed,  1 Mar 2023 12:25:25 +0000
Subject: [PATCH] gpio/desginware: add Synopsys DesignWare APB GPIO support
Message-ID: <20230301122525.213751-1-ben.dooks@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a driver for the Synopsys DesignWare APB GPIO IP block found in many
SoCs.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 lib/utils/gpio/Kconfig               |   4 +
 lib/utils/gpio/fdt_gpio_designware.c | 140 +++++++++++++++++++++++++++
 lib/utils/gpio/objects.mk            |   2 +
 platform/generic/configs/defconfig   |   1 +
 4 files changed, 147 insertions(+)
 create mode 100644 lib/utils/gpio/fdt_gpio_designware.c

diff --git a/lib/utils/gpio/Kconfig b/lib/utils/gpio/Kconfig
index 38a9d75..f229928 100644
--- a/lib/utils/gpio/Kconfig
+++ b/lib/utils/gpio/Kconfig
@@ -14,6 +14,10 @@ config FDT_GPIO_SIFIVE
 	bool "SiFive GPIO FDT driver"
 	default n
 
+config FDT_GPIO_DESIGNWARE
+	bool "DesignWare GPIO driver"
+	default n
+
 endif
 
 config GPIO
diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
new file mode 100644
index 0000000..6223d7e
--- /dev/null
+++ b/lib/utils/gpio/fdt_gpio_designware.c
@@ -0,0 +1,140 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 SiFive
+ *
+ * GPIO driver for Synopsys DesignWare APB GPIO
+ *
+ * Authors:
+ *   Ben Dooks <ben.dooks@sifive.com>
+ */
+
+#include <libfdt.h>
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/gpio/fdt_gpio.h>
+
+#define DW_GPIO_CHIP_MAX	4	/* need 1 per bank in use */
+#define DW_GPIO_PINS_MAX	32
+
+#define DW_GPIO_DDR	0x4
+#define DW_GPIO_DR	0x0
+#define DW_GPIO_BIT(_b)	(1UL << (_b))
+
+struct dw_gpio_chip {
+	void *dr;
+	void *ext;
+	struct gpio_chip chip;
+};
+
+extern struct fdt_gpio fdt_gpio_designware;
+
+static unsigned int dw_gpio_chip_count;
+static struct dw_gpio_chip dw_gpio_chip_array[DW_GPIO_CHIP_MAX];
+
+#define pin_to_chip(__p) container_of((__p)->chip, struct dw_gpio_chip, chip);
+
+static int dw_gpio_direction_output(struct gpio_pin *gp, int value)
+{
+	struct dw_gpio_chip *chip = pin_to_chip(gp);
+	unsigned long v;
+
+	v = readl(chip->dr + DW_GPIO_DR);
+	if (!value)
+		v &= ~DW_GPIO_BIT(gp->offset);
+	else
+		v |= DW_GPIO_BIT(gp->offset);
+	writel(v, chip->dr + DW_GPIO_DR);
+
+	/* the DR is output only so we can set it then the DDR to set
+	 * the data direction, to avoid glitches.
+	 */
+	v = readl(chip->dr + DW_GPIO_DDR);
+	v |= DW_GPIO_BIT(gp->offset);
+	writel(v, chip->dr + DW_GPIO_DDR);
+
+	return 0;
+}
+
+static void dw_gpio_set(struct gpio_pin *gp, int value)
+{
+	struct dw_gpio_chip *chip = pin_to_chip(gp);
+	unsigned long v;
+
+	v = readl(chip->dr + DW_GPIO_DR);
+	if (!value)
+		v &= ~DW_GPIO_BIT(gp->offset);
+	else
+		v |= DW_GPIO_BIT(gp->offset);
+	writel(v, chip->dr + DW_GPIO_DR);
+}
+
+/* notes:
+ * each sub node is a bank and has ngpios or snpns,nr-gpios and a reg property
+ * with the compatible `snps,dw-apb-gpio-port`.
+ * bank A is the only one with irq support but we're not using it here
+*/
+
+static int dw_gpio_init_bank(void *fdt, int nodeoff, u32 phandle,
+			     const struct fdt_match *match)
+{
+	struct dw_gpio_chip *chip;
+	const fdt32_t *val;
+	uint64_t addr;
+	int rc, poff, nr_pins, bank, len;
+
+	if (dw_gpio_chip_count >= DW_GPIO_CHIP_MAX)
+		return SBI_ENOSPC;
+
+	/* need to get parent for the address property  */
+	poff = fdt_parent_offset(fdt, nodeoff);
+	if (poff < 0)
+		return SBI_EINVAL;
+
+	rc = fdt_get_node_addr_size(fdt, poff, 0, &addr, NULL);
+	if (rc)
+		return rc;
+
+	val = fdt_getprop(fdt, nodeoff, "reg", &len);
+	if (!val || len <= 0)
+		return SBI_EINVAL;
+	bank = fdt32_to_cpu(*val);
+
+	val = fdt_getprop(fdt, nodeoff, "snps,nr-gpios", &len);
+	if (!val)
+		val = fdt_getprop(fdt, nodeoff, "ngpios", &len);
+	if (!val || len <= 0)
+		return SBI_EINVAL;
+	nr_pins = fdt32_to_cpu(*val);
+
+	chip = &dw_gpio_chip_array[dw_gpio_chip_count];
+
+	chip->dr = (void *)addr + (bank * 0xc);
+	chip->ext = (void *)addr + (bank * 4) + 0x50;
+	chip->chip.driver = &fdt_gpio_designware;
+	chip->chip.id = phandle;
+	chip->chip.ngpio = nr_pins;
+	chip->chip.set = dw_gpio_set;
+	chip->chip.direction_output = dw_gpio_direction_output;
+	rc = gpio_chip_add(&chip->chip);
+	if (rc)
+		return rc;
+
+	dw_gpio_chip_count++;
+	return 0;
+}
+
+/* since we're only probed when used, match on port not main controller node */
+static const struct fdt_match dw_gpio_match[] = {
+	{ .compatible = "snps,dw-apb-gpio-port" },
+	{ },
+};
+
+struct fdt_gpio fdt_gpio_designware = {
+	.match_table = dw_gpio_match,
+	.xlate = fdt_gpio_simple_xlate,
+	.init = dw_gpio_init_bank,
+};
diff --git a/lib/utils/gpio/objects.mk b/lib/utils/gpio/objects.mk
index eedd699..00ea7af 100644
--- a/lib/utils/gpio/objects.mk
+++ b/lib/utils/gpio/objects.mk
@@ -11,6 +11,8 @@ libsbiutils-objs-$(CONFIG_FDT_GPIO) += gpio/fdt_gpio.o
 libsbiutils-objs-$(CONFIG_FDT_GPIO) += gpio/fdt_gpio_drivers.o
 
 carray-fdt_gpio_drivers-$(CONFIG_FDT_GPIO_SIFIVE) += fdt_gpio_sifive
+carray-fdt_gpio_drivers-$(CONFIG_FDT_GPIO_DESIGNWARE) += fdt_gpio_designware
 libsbiutils-objs-$(CONFIG_FDT_GPIO_SIFIVE) += gpio/fdt_gpio_sifive.o
+libsbiutils-objs-$(CONFIG_FDT_GPIO_DESIGNWARE) += gpio/fdt_gpio_designware.o
 
 libsbiutils-objs-$(CONFIG_GPIO) += gpio/gpio.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 4b0842e..759caaa 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -5,6 +5,7 @@ CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_FDT_GPIO=y
+CONFIG_FDT_GPIO_DESIGNWARE=y
 CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
-- 
2.39.2


