From: Wei Liang Lim <weiliang.lim@starfivetech.com>
Date: Fri, 23 Dec 2022 15:07:41 +0800
Subject: [PATCH v6 4/4] generic/starfive: Add Starfive JH7110 platform implementation
In-Reply-To: <20221223070741.236271-1-weiliang.lim@starfivetech.com>
References: <20221223070741.236271-1-weiliang.lim@starfivetech.com>
Message-ID: <20221223070741.236271-5-weiliang.lim@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add Starfive JH7110 platform implementation

Signed-off-by: Wei Liang Lim <weiliang.lim@starfivetech.com>
Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
Reviewed-by: Jun Liang Tan <junliang.tan@starfivetech.com>
---
 platform/generic/Kconfig             |  4 +++
 platform/generic/configs/defconfig   |  1 +
 platform/generic/starfive/jh7110.c   | 47 ++++++++++++++++++++++++++++
 platform/generic/starfive/objects.mk |  6 ++++
 4 files changed, 58 insertions(+)
 create mode 100644 platform/generic/starfive/jh7110.c
 create mode 100644 platform/generic/starfive/objects.mk

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 62c7a2d..47c10e5 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -45,4 +45,8 @@ config PLATFORM_SIFIVE_FU740
 	depends on FDT_RESET && FDT_I2C
 	default n
 
+config PLATFORM_STARFIVE_JH7110
+	bool "StarFive JH7110 support"
+	default n
+
 endif
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 47fca95..4b0842e 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -3,6 +3,7 @@ CONFIG_PLATFORM_ANDES_AE350=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
+CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_I2C=y
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
new file mode 100644
index 0000000..70a26fe
--- /dev/null
+++ b/platform/generic/starfive/jh7110.c
@@ -0,0 +1,47 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 StarFive
+ *
+ * Authors:
+ *   Wei Liang Lim <weiliang.lim@starfivetech.com>
+ */
+
+#include <libfdt.h>
+#include <platform_override.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+static u32 selected_hartid = -1;
+
+static bool starfive_jh7110_cold_boot_allowed(u32 hartid,
+				   const struct fdt_match *match)
+{
+	if (selected_hartid != -1)
+		return (selected_hartid == hartid);
+
+	return true;
+}
+
+static void starfive_jh7110_fw_init(void *fdt, const struct fdt_match *match)
+{
+	const fdt32_t *val;
+	int len, coff;
+
+	coff = fdt_path_offset(fdt, "/chosen");
+	if (-1 < coff) {
+		val = fdt_getprop(fdt, coff, "boot-hart-id", &len);
+		if (val && len)
+			selected_hartid = (u32) fdt32_to_cpu(*val);
+	}
+}
+
+static const struct fdt_match starfive_jh7110_match[] = {
+	{ .compatible = "starfive,jh7110" },
+	{ },
+};
+
+const struct platform_override starfive_jh7110 = {
+	.match_table = starfive_jh7110_match,
+	.cold_boot_allowed = starfive_jh7110_cold_boot_allowed,
+	.fw_init = starfive_jh7110_fw_init,
+};
diff --git a/platform/generic/starfive/objects.mk b/platform/generic/starfive/objects.mk
new file mode 100644
index 0000000..0b900fb
--- /dev/null
+++ b/platform/generic/starfive/objects.mk
@@ -0,0 +1,6 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_STARFIVE_JH7110) += starfive_jh7110
+platform-objs-$(CONFIG_PLATFORM_STARFIVE_JH7110) += starfive/jh7110.o
-- 
2.25.1


