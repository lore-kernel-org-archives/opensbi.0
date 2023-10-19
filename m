From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 20 Oct 2023 07:57:18 +0800
Subject: [PATCH v4] platform: generic: Add Sophgo sg2042 platform support
Message-ID: <IA1PR20MB4953FC1436930F92BA765847BBD4A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add Sophgo sg2042 soc support

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
This patch depends these patchs:
1. platform: generic: add T-HEAD th1520 soc support
2. lib: sbi: Add sub-regions check for sanitizing domain
3. lib: utils: Add T-HEAD C900 ACLINT
4. platform: generic: thead: improve tlb flush errata

Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005676.html
Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005705.html
Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005736.html
Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005712.html
Link: https://lore.kernel.org/linux-riscv/cover.1696433229.git.unicorn_wang at outlook.com/

Changed from v3:
1. remove unused variable to avoid compile failed

Changed from v2:
1. replace hart count with number 16 when calculating the timer area.
   The sg2042 have a fixed number of timer, see the kernel dt in the link.
2. fix typo
3. move the c900 aclint patch out of this series.
4. move the tlb size change patch out of this series.

Changed from v1:
1. make number of entries in tlb fifo auto deteted.

---
 platform/generic/Kconfig           |  6 +++
 platform/generic/configs/defconfig |  1 +
 platform/generic/sophgo/objects.mk |  9 +++++
 platform/generic/sophgo/sg2042.c   | 62 ++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 platform/generic/sophgo/objects.mk
 create mode 100644 platform/generic/sophgo/sg2042.c

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index f9e7ed2..a902cf3 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -49,6 +49,12 @@ config PLATFORM_SIFIVE_FU740
 	depends on FDT_RESET && FDT_I2C
 	default n

+config PLATFORM_SOPHGO_SG2042
+	bool "Sophgo sg2042 support"
+	select THEAD_C9XX_ERRATA
+	select THEAD_C9XX_PMU
+	default n
+
 config PLATFORM_STARFIVE_JH7110
 	bool "StarFive JH7110 support"
 	default n
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index c432bc2..e1b76c8 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -3,6 +3,7 @@ CONFIG_PLATFORM_ANDES_AE350=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
+CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_FDT_GPIO=y
diff --git a/platform/generic/sophgo/objects.mk b/platform/generic/sophgo/objects.mk
new file mode 100644
index 0000000..3d2908a
--- /dev/null
+++ b/platform/generic/sophgo/objects.mk
@@ -0,0 +1,9 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+# Copyright (C) 2023 Alibaba Group Holding Limited.
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_SOPHGO_SG2042) += sophgo_sg2042
+platform-objs-$(CONFIG_PLATFORM_SOPHGO_SG2042) += sophgo/sg2042.o
diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
new file mode 100644
index 0000000..9c6acdb
--- /dev/null
+++ b/platform/generic/sophgo/sg2042.c
@@ -0,0 +1,62 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#include <platform_override.h>
+#include <thead/c9xx_errata.h>
+#include <thead/c9xx_pmu.h>
+#include <sbi/sbi_const.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
+
+#define SOPHGO_SG2042_TIMER_BASE	0x70ac000000UL
+#define SOPHGO_SG2042_TIMER_SIZE	0x10000UL
+#define SOPHGO_SG2042_TIMER_NUM		16
+
+static int sophgo_sg2042_early_init(bool cold_boot,
+				    const struct fdt_match *match)
+{
+	thead_register_tlb_flush_trap_handler();
+
+	/*
+	 * Sophgo sg2042 soc use separate 16 timers while initiating,
+	 * merge them as a single domain to avoid wasting.
+	 */
+	if (cold_boot)
+		return sbi_domain_root_add_memrange(SOPHGO_SG2042_TIMER_BASE,
+						SOPHGO_SG2042_TIMER_SIZE *
+						SOPHGO_SG2042_TIMER_NUM,
+						MTIMER_REGION_ALIGN,
+						(SBI_DOMAIN_MEMREGION_MMIO |
+						 SBI_DOMAIN_MEMREGION_M_READABLE |
+						 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+
+
+	return 0;
+}
+
+static int sophgo_sg2042_extensions_init(const struct fdt_match *match,
+					 struct sbi_hart_features *hfeatures)
+{
+	thead_c9xx_register_pmu_device();
+	return 0;
+}
+
+static const struct fdt_match sophgo_sg2042_match[] = {
+	{ .compatible = "sophgo,sg2042" },
+	{ },
+};
+
+const struct platform_override sophgo_sg2042 = {
+	.match_table		= sophgo_sg2042_match,
+	.early_init		= sophgo_sg2042_early_init,
+	.extensions_init	= sophgo_sg2042_extensions_init,
+};
--
2.42.0


