From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Jul 2022 18:11:59 +0530
Subject: [PATCH 03/14] lib: utils/serial: Use kconfig for enabling/disabling drivers
In-Reply-To: <20220718124210.2177576-1-apatel@ventanamicro.com>
References: <20220718124210.2177576-1-apatel@ventanamicro.com>
Message-ID: <20220718124210.2177576-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update serial drivers makefile to use kconfig for enabling/disabling
drivers. To avoid compile errors, we also enable appropriate serial
drivers for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/serial/fdt_serial.h |  8 +++
 lib/utils/Kconfig                     |  6 +++
 lib/utils/serial/Kconfig              | 71 +++++++++++++++++++++++++++
 lib/utils/serial/objects.mk           | 44 ++++++++---------
 platform/andes/ae350/Kconfig          |  1 +
 platform/fpga/ariane/Kconfig          |  1 +
 platform/fpga/openpiton/Kconfig       |  1 +
 platform/generic/configs/defconfig    |  8 +++
 platform/kendryte/k210/Kconfig        |  1 +
 platform/nuclei/ux600/Kconfig         |  1 +
 platform/template/Kconfig             |  1 +
 11 files changed, 121 insertions(+), 22 deletions(-)
 create mode 100644 lib/utils/serial/Kconfig

diff --git a/include/sbi_utils/serial/fdt_serial.h b/include/sbi_utils/serial/fdt_serial.h
index 6451c23..daa2e4f 100644
--- a/include/sbi_utils/serial/fdt_serial.h
+++ b/include/sbi_utils/serial/fdt_serial.h
@@ -12,6 +12,8 @@
 
 #include <sbi/sbi_types.h>
 
+#ifdef CONFIG_FDT_SERIAL
+
 struct fdt_serial {
 	const struct fdt_match *match_table;
 	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
@@ -19,4 +21,10 @@ struct fdt_serial {
 
 int fdt_serial_init(void);
 
+#else
+
+static inline int fdt_serial_init(void) { return 0; }
+
+#endif
+
 #endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index f66554c..464bd03 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -1 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+menu "Utils and Drivers Support"
+
+source "$OPENSBI_SRC_DIR/lib/utils/serial/Kconfig"
+
+endmenu
diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
new file mode 100644
index 0000000..9e6b6fc
--- /dev/null
+++ b/lib/utils/serial/Kconfig
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menu "Serial Device Support"
+
+config FDT_SERIAL
+	bool "FDT based serial drivers"
+	default n
+
+if FDT_SERIAL
+
+config FDT_SERIAL_GAISLER
+	bool "Gaisler UART FDT driver"
+	select SERIAL_GAISLER
+	default n
+
+config FDT_SERIAL_HTIF
+	bool "Host transfer interface (HTIF) UART FDT driver"
+	default n
+
+config FDT_SERIAL_SHAKTI
+	bool "Shakti UART FDT driver"
+	select SERIAL_SHAKTI
+	default n
+
+config FDT_SERIAL_SIFIVE
+	bool "SiFive UART FDT driver"
+	select SERIAL_SIFIVE
+	default n
+
+config FDT_SERIAL_LITEX
+	bool "LiteX UART FDT driver"
+	select SERIAL_LITEX
+	default n
+
+config FDT_SERIAL_UART8250
+	bool "8250 UART FDT driver"
+	select SERIAL_UART8250
+	default n
+
+config FDT_SERIAL_XILINX_UARTLITE
+	bool "Xilinx UART Lite FDT driver"
+	select SERIAL_XILINX_UARTLITE
+	default n
+
+endif
+
+config SERIAL_GAISLER
+	bool "Gaisler UART support"
+	default n
+
+config SERIAL_SHAKTI
+	bool "Shakti UART support"
+	default n
+
+config SERIAL_SIFIVE
+	bool "SiFive UART support"
+	default n
+
+config SERIAL_LITEX
+	bool "LiteX UART support"
+	default n
+
+config SERIAL_UART8250
+	bool "8250 UART support"
+	default n
+
+config SERIAL_XILINX_UARTLITE
+	bool "Xilinx UART Lite support"
+	default n
+
+endmenu
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index d26a74e..fa9f5a3 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -7,33 +7,33 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-y += serial/fdt_serial.o
-libsbiutils-objs-y += serial/fdt_serial_drivers.o
+libsbiutils-objs-$(CONFIG_FDT_SERIAL) += serial/fdt_serial.o
+libsbiutils-objs-$(CONFIG_FDT_SERIAL) += serial/fdt_serial_drivers.o
 
-carray-fdt_serial_drivers-y += fdt_serial_gaisler
-libsbiutils-objs-y += serial/fdt_serial_gaisler.o
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_GAISLER) += fdt_serial_gaisler
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_GAISLER) += serial/fdt_serial_gaisler.o
 
-carray-fdt_serial_drivers-y += fdt_serial_htif
-libsbiutils-objs-y += serial/fdt_serial_htif.o
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_HTIF) += fdt_serial_htif
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_HTIF) += serial/fdt_serial_htif.o
 
-carray-fdt_serial_drivers-y += fdt_serial_shakti
-libsbiutils-objs-y += serial/fdt_serial_shakti.o
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_SHAKTI) += fdt_serial_shakti
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_SHAKTI) += serial/fdt_serial_shakti.o
 
-carray-fdt_serial_drivers-y += fdt_serial_sifive
-libsbiutils-objs-y += serial/fdt_serial_sifive.o
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_SIFIVE) += fdt_serial_sifive
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_SIFIVE) += serial/fdt_serial_sifive.o
 
-carray-fdt_serial_drivers-y += fdt_serial_litex
-libsbiutils-objs-y += serial/fdt_serial_litex.o
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_LITEX) += fdt_serial_litex
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_LITEX) += serial/fdt_serial_litex.o
 
-carray-fdt_serial_drivers-y += fdt_serial_uart8250
-libsbiutils-objs-y += serial/fdt_serial_uart8250.o
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_UART8250) += fdt_serial_uart8250
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_UART8250) += serial/fdt_serial_uart8250.o
 
-carray-fdt_serial_drivers-y += fdt_serial_xlnx_uartlite
-libsbiutils-objs-y += serial/fdt_serial_xlnx_uartlite.o
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += fdt_serial_xlnx_uartlite
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_XILINX_UARTLITE) += serial/fdt_serial_xlnx_uartlite.o
 
-libsbiutils-objs-y += serial/gaisler-uart.o
-libsbiutils-objs-y += serial/shakti-uart.o
-libsbiutils-objs-y += serial/sifive-uart.o
-libsbiutils-objs-y += serial/litex-uart.o
-libsbiutils-objs-y += serial/uart8250.o
-libsbiutils-objs-y += serial/xlnx-uartlite.o
+libsbiutils-objs-$(CONFIG_SERIAL_GAISLER) += serial/gaisler-uart.o
+libsbiutils-objs-$(CONFIG_SERIAL_SHAKTI) += serial/shakti-uart.o
+libsbiutils-objs-$(CONFIG_SERIAL_SIFIVE) += serial/sifive-uart.o
+libsbiutils-objs-$(CONFIG_SERIAL_LITEX) += serial/litex-uart.o
+libsbiutils-objs-$(CONFIG_SERIAL_UART8250) += serial/uart8250.o
+libsbiutils-objs-$(CONFIG_SERIAL_XILINX_UARTLITE) += serial/xlnx-uartlite.o
diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
index 349c1d3..0048c1b 100644
--- a/platform/andes/ae350/Kconfig
+++ b/platform/andes/ae350/Kconfig
@@ -2,4 +2,5 @@
 
 config PLATFORM_ANDES_AE350
 	bool
+	select SERIAL_UART8250
 	default y
diff --git a/platform/fpga/ariane/Kconfig b/platform/fpga/ariane/Kconfig
index 26f9beb..797af74 100644
--- a/platform/fpga/ariane/Kconfig
+++ b/platform/fpga/ariane/Kconfig
@@ -2,4 +2,5 @@
 
 config PLATFORM_ARIANE_FPGA
 	bool
+	select SERIAL_UART8250
 	default y
diff --git a/platform/fpga/openpiton/Kconfig b/platform/fpga/openpiton/Kconfig
index 8bfa85a..09b658a 100644
--- a/platform/fpga/openpiton/Kconfig
+++ b/platform/fpga/openpiton/Kconfig
@@ -2,4 +2,5 @@
 
 config PLATFORM_OPENPITON_FPGA
 	bool
+	select SERIAL_UART8250
 	default y
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index e69de29..ce70c59 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -0,0 +1,8 @@
+CONFIG_FDT_SERIAL=y
+CONFIG_FDT_SERIAL_GAISLER=y
+CONFIG_FDT_SERIAL_HTIF=y
+CONFIG_FDT_SERIAL_SHAKTI=y
+CONFIG_FDT_SERIAL_SIFIVE=y
+CONFIG_FDT_SERIAL_LITEX=y
+CONFIG_FDT_SERIAL_UART8250=y
+CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
diff --git a/platform/kendryte/k210/Kconfig b/platform/kendryte/k210/Kconfig
index 726423a..bc921c8 100644
--- a/platform/kendryte/k210/Kconfig
+++ b/platform/kendryte/k210/Kconfig
@@ -2,4 +2,5 @@
 
 config PLATFORM_KENDRYTE_K210
 	bool
+	select SERIAL_SIFIVE
 	default y
diff --git a/platform/nuclei/ux600/Kconfig b/platform/nuclei/ux600/Kconfig
index bb8410f..c4da266 100644
--- a/platform/nuclei/ux600/Kconfig
+++ b/platform/nuclei/ux600/Kconfig
@@ -2,4 +2,5 @@
 
 config PLATFORM_NUCLEI_UX600
 	bool
+	select SERIAL_SIFIVE
 	default y
diff --git a/platform/template/Kconfig b/platform/template/Kconfig
index bd95ea0..e01fb31 100644
--- a/platform/template/Kconfig
+++ b/platform/template/Kconfig
@@ -2,4 +2,5 @@
 
 config PLATFORM_TEMPLATE
 	bool
+	select SERIAL_UART8250
 	default y
-- 
2.34.1


