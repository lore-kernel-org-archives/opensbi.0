From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 23 May 2023 14:36:03 +0800
Subject: [PATCH 3/3] platform: generic: thead: add pmu detection for th1520
In-Reply-To: <20230523063603.1836508-1-inochiama@outlook.com>
References: <20230523063603.1836508-1-inochiama@outlook.com>
Message-ID: <IA1PR20MB49535C3C771DF662F5A497EBBB409@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Manually set the pmu configuration of T-HEAD th1520.

T-HEAD th1520 soc has four c910 cores which have 29 pmu events
counter, but auto-detection only show 16, so fix it in the soc
setup.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 platform/generic/Kconfig           |  6 ++++++
 platform/generic/configs/defconfig |  1 +
 platform/generic/thead/objects.mk  |  3 +++
 platform/generic/thead/th1520.c    | 34 ++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 platform/generic/thead/th1520.c

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 426fd99..b03d784 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -53,6 +53,12 @@ config PLATFORM_STARFIVE_JH7110
 	bool "StarFive JH7110 support"
 	default n
 
+config PLATFORM_THEAD_TH1520
+	bool "T-HEAD TH1520 support"
+	depends on FDT_IRQCHIP_PLIC
+	select THEAD_C9XX_PMU
+	default n
+
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index ee0df38..e00c4ad 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -4,6 +4,7 @@ CONFIG_PLATFORM_RENESAS_RZFIVE=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
+CONFIG_PLATFORM_THEAD_TH1520=y
 CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_GPIO_STARFIVE=y
diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
index 509ed56..499b3d5 100644
--- a/platform/generic/thead/objects.mk
+++ b/platform/generic/thead/objects.mk
@@ -3,3 +3,6 @@
 #
 
 platform-objs-$(CONFIG_THEAD_C9XX_PMU) += thead/c9xx_pmu.o
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD_TH1520) += thead_th1520
+platform-objs-$(CONFIG_PLATFORM_THEAD_TH1520) += thead/th1520.o
diff --git a/platform/generic/thead/th1520.c b/platform/generic/thead/th1520.c
new file mode 100644
index 0000000..7e461e3
--- /dev/null
+++ b/platform/generic/thead/th1520.c
@@ -0,0 +1,34 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <platform_override.h>
+#include <thead/c9xx_encoding.h>
+#include <thead/c9xx_pmu.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+static int thead_th1520_extensions_init(const struct fdt_match *match,
+					struct sbi_hart_features *hfeatures)
+{
+	sbi_pmu_set_device(&thead_c9xx_pmu_device);
+
+	/* auto-detection only find 16 bits, the real is 29 */
+	hfeatures->mhpm_count = 29;
+	hfeatures->mhpm_bits = 64;
+
+	return 0;
+}
+
+static const struct fdt_match thead_th1520_match[] = {
+	{ .compatible = "thead,th1520" },
+	{ },
+};
+
+const struct platform_override thead_th1520 = {
+	.match_table         = thead_th1520_match,
+	.extensions_init     = thead_th1520_extensions_init,
+};
-- 
2.40.1


