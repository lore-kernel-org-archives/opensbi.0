From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 31 Jul 2022 10:26:46 +0530
Subject: [PATCH v4 08/15] lib: utils/ipi: Use kconfig for enabling/disabling drivers
In-Reply-To: <20220731045653.165058-1-apatel@ventanamicro.com>
References: <20220731045653.165058-1-apatel@ventanamicro.com>
Message-ID: <20220731045653.165058-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update ipi drivers makefile to use kconfig for enabling/disabling
drivers. To avoid compile errors, we also enable appropriate ipi
drivers for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/ipi/fdt_ipi.h    |  9 +++++++++
 lib/utils/Kconfig                  |  2 ++
 lib/utils/ipi/Kconfig              | 22 ++++++++++++++++++++++
 lib/utils/ipi/objects.mk           | 10 +++++-----
 platform/fpga/ariane/Kconfig       |  1 +
 platform/fpga/openpiton/Kconfig    |  1 +
 platform/generic/configs/defconfig |  2 ++
 platform/kendryte/k210/Kconfig     |  1 +
 platform/nuclei/ux600/Kconfig      |  1 +
 platform/template/Kconfig          |  1 +
 10 files changed, 45 insertions(+), 5 deletions(-)
 create mode 100644 lib/utils/ipi/Kconfig

diff --git a/include/sbi_utils/ipi/fdt_ipi.h b/include/sbi_utils/ipi/fdt_ipi.h
index 9337353..1dd9062 100644
--- a/include/sbi_utils/ipi/fdt_ipi.h
+++ b/include/sbi_utils/ipi/fdt_ipi.h
@@ -12,6 +12,8 @@
 
 #include <sbi/sbi_types.h>
 
+#ifdef CONFIG_FDT_IPI
+
 struct fdt_ipi {
 	const struct fdt_match *match_table;
 	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
@@ -23,4 +25,11 @@ void fdt_ipi_exit(void);
 
 int fdt_ipi_init(bool cold_boot);
 
+#else
+
+static inline void fdt_ipi_exit(void) { }
+static inline int fdt_ipi_init(bool cold_boot) { return 0; }
+
+#endif
+
 #endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 6561d0b..50d9770 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -2,6 +2,8 @@
 
 menu "Utils and Drivers Support"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/ipi/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/serial/Kconfig"
diff --git a/lib/utils/ipi/Kconfig b/lib/utils/ipi/Kconfig
new file mode 100644
index 0000000..c0634d3
--- /dev/null
+++ b/lib/utils/ipi/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "IPI Device Support"
+
+config FDT_IPI
+	bool "FDT based ipi drivers"
+	default n
+
+if FDT_IPI
+
+config FDT_IPI_MSWI
+	bool "ACLINT MSWI FDT driver"
+	select IPI_MSWI
+	default n
+
+endif
+
+config IPI_MSWI
+	bool "ACLINT MSWI support"
+	default n
+
+endmenu
diff --git a/lib/utils/ipi/objects.mk b/lib/utils/ipi/objects.mk
index 0b0bc2d..0600cac 100644
--- a/lib/utils/ipi/objects.mk
+++ b/lib/utils/ipi/objects.mk
@@ -7,10 +7,10 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-y += ipi/aclint_mswi.o
+libsbiutils-objs-$(CONFIG_IPI_MSWI) += ipi/aclint_mswi.o
 
-libsbiutils-objs-y += ipi/fdt_ipi.o
-libsbiutils-objs-y += ipi/fdt_ipi_drivers.o
+libsbiutils-objs-$(CONFIG_FDT_IPI) += ipi/fdt_ipi.o
+libsbiutils-objs-$(CONFIG_FDT_IPI) += ipi/fdt_ipi_drivers.o
 
-carray-fdt_ipi_drivers-y += fdt_ipi_mswi
-libsbiutils-objs-y += ipi/fdt_ipi_mswi.o
+carray-fdt_ipi_drivers-$(CONFIG_FDT_IPI_MSWI) += fdt_ipi_mswi
+libsbiutils-objs-$(CONFIG_FDT_IPI_MSWI) += ipi/fdt_ipi_mswi.o
diff --git a/platform/fpga/ariane/Kconfig b/platform/fpga/ariane/Kconfig
index a7fd758..0bc1597 100644
--- a/platform/fpga/ariane/Kconfig
+++ b/platform/fpga/ariane/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_ARIANE_FPGA
 	bool
+	select IPI_MSWI
 	select SERIAL_UART8250
 	select TIMER_MTIMER
 	default y
diff --git a/platform/fpga/openpiton/Kconfig b/platform/fpga/openpiton/Kconfig
index a7f09e4..0e4e3ba 100644
--- a/platform/fpga/openpiton/Kconfig
+++ b/platform/fpga/openpiton/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_OPENPITON_FPGA
 	bool
+	select IPI_MSWI
 	select SERIAL_UART8250
 	select TIMER_MTIMER
 	default y
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 9b96a4f..e218c32 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,3 +1,5 @@
+CONFIG_FDT_IPI=y
+CONFIG_FDT_IPI_MSWI=y
 CONFIG_FDT_RESET=y
 CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
diff --git a/platform/kendryte/k210/Kconfig b/platform/kendryte/k210/Kconfig
index 90db649..685a5cd 100644
--- a/platform/kendryte/k210/Kconfig
+++ b/platform/kendryte/k210/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_KENDRYTE_K210
 	bool
+	select IPI_MSWI
 	select SERIAL_SIFIVE
 	select TIMER_MTIMER
 	default y
diff --git a/platform/nuclei/ux600/Kconfig b/platform/nuclei/ux600/Kconfig
index dec2654..cd995a3 100644
--- a/platform/nuclei/ux600/Kconfig
+++ b/platform/nuclei/ux600/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_NUCLEI_UX600
 	bool
+	select IPI_MSWI
 	select SERIAL_SIFIVE
 	select TIMER_MTIMER
 	default y
diff --git a/platform/template/Kconfig b/platform/template/Kconfig
index ce463ea..672b6e7 100644
--- a/platform/template/Kconfig
+++ b/platform/template/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_TEMPLATE
 	bool
+	select IPI_MSWI
 	select SERIAL_UART8250
 	select TIMER_MTIMER
 	default y
-- 
2.34.1


