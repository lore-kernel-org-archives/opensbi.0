From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Jul 2022 18:12:02 +0530
Subject: [PATCH 06/14] lib: utils/timer: Use kconfig for enabling/disabling drivers
In-Reply-To: <20220718124210.2177576-1-apatel@ventanamicro.com>
References: <20220718124210.2177576-1-apatel@ventanamicro.com>
Message-ID: <20220718124210.2177576-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update timer drivers makefile to use kconfig for enabling/disabling
drivers. To avoid compile errors, we also enable appropriate timer
drivers for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/timer/fdt_timer.h |  9 +++++++++
 lib/utils/Kconfig                   |  2 ++
 lib/utils/timer/Kconfig             | 22 ++++++++++++++++++++++
 lib/utils/timer/objects.mk          | 10 +++++-----
 platform/fpga/ariane/Kconfig        |  1 +
 platform/fpga/openpiton/Kconfig     |  1 +
 platform/generic/configs/defconfig  |  2 ++
 platform/kendryte/k210/Kconfig      |  1 +
 platform/nuclei/ux600/Kconfig       |  1 +
 platform/template/Kconfig           |  1 +
 10 files changed, 45 insertions(+), 5 deletions(-)
 create mode 100644 lib/utils/timer/Kconfig

diff --git a/include/sbi_utils/timer/fdt_timer.h b/include/sbi_utils/timer/fdt_timer.h
index 36202a4..cf105fe 100644
--- a/include/sbi_utils/timer/fdt_timer.h
+++ b/include/sbi_utils/timer/fdt_timer.h
@@ -12,6 +12,8 @@
 
 #include <sbi/sbi_types.h>
 
+#ifdef CONFIG_FDT_TIMER
+
 struct fdt_timer {
 	const struct fdt_match *match_table;
 	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
@@ -23,4 +25,11 @@ void fdt_timer_exit(void);
 
 int fdt_timer_init(bool cold_boot);
 
+#else
+
+static inline void fdt_timer_exit(void) { }
+static inline int fdt_timer_init(bool cold_boot) { return 0; }
+
+#endif
+
 #endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 6442b75..e169ed4 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -8,4 +8,6 @@ source "$OPENSBI_SRC_DIR/lib/utils/serial/Kconfig"
 
 source "$OPENSBI_SRC_DIR/lib/utils/sys/Kconfig"
 
+source "$OPENSBI_SRC_DIR/lib/utils/timer/Kconfig"
+
 endmenu
diff --git a/lib/utils/timer/Kconfig b/lib/utils/timer/Kconfig
new file mode 100644
index 0000000..3b1221a
--- /dev/null
+++ b/lib/utils/timer/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menu "Timer Device Support"
+
+config FDT_TIMER
+	bool "FDT based timer drivers"
+	default n
+
+if FDT_TIMER
+
+config FDT_TIMER_MTIMER
+	bool "ACLINT MTIMER FDT driver"
+	select TIMER_MTIMER
+	default n
+
+endif
+
+config TIMER_MTIMER
+	bool "ACLINT MTIMER support"
+	default n
+
+endmenu
diff --git a/lib/utils/timer/objects.mk b/lib/utils/timer/objects.mk
index bc4073d..7f5f3ce 100644
--- a/lib/utils/timer/objects.mk
+++ b/lib/utils/timer/objects.mk
@@ -7,10 +7,10 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-y += timer/aclint_mtimer.o
+libsbiutils-objs-$(CONFIG_TIMER_MTIMER) += timer/aclint_mtimer.o
 
-libsbiutils-objs-y += timer/fdt_timer.o
-libsbiutils-objs-y += timer/fdt_timer_drivers.o
+libsbiutils-objs-$(CONFIG_FDT_TIMER) += timer/fdt_timer.o
+libsbiutils-objs-$(CONFIG_FDT_TIMER) += timer/fdt_timer_drivers.o
 
-carray-fdt_timer_drivers-y += fdt_timer_mtimer
-libsbiutils-objs-y += timer/fdt_timer_mtimer.o
+carray-fdt_timer_drivers-$(CONFIG_FDT_TIMER_MTIMER) += fdt_timer_mtimer
+libsbiutils-objs-$(CONFIG_FDT_TIMER_MTIMER) += timer/fdt_timer_mtimer.o
diff --git a/platform/fpga/ariane/Kconfig b/platform/fpga/ariane/Kconfig
index 797af74..cf60f99 100644
--- a/platform/fpga/ariane/Kconfig
+++ b/platform/fpga/ariane/Kconfig
@@ -3,4 +3,5 @@
 config PLATFORM_ARIANE_FPGA
 	bool
 	select SERIAL_UART8250
+	select TIMER_MTIMER
 	default y
diff --git a/platform/fpga/openpiton/Kconfig b/platform/fpga/openpiton/Kconfig
index 09b658a..b0e1321 100644
--- a/platform/fpga/openpiton/Kconfig
+++ b/platform/fpga/openpiton/Kconfig
@@ -3,4 +3,5 @@
 config PLATFORM_OPENPITON_FPGA
 	bool
 	select SERIAL_UART8250
+	select TIMER_MTIMER
 	default y
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 9778665..9b96a4f 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -12,3 +12,5 @@ CONFIG_FDT_SERIAL_SIFIVE=y
 CONFIG_FDT_SERIAL_LITEX=y
 CONFIG_FDT_SERIAL_UART8250=y
 CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
+CONFIG_FDT_TIMER=y
+CONFIG_FDT_TIMER_MTIMER=y
diff --git a/platform/kendryte/k210/Kconfig b/platform/kendryte/k210/Kconfig
index bc921c8..a0e6116 100644
--- a/platform/kendryte/k210/Kconfig
+++ b/platform/kendryte/k210/Kconfig
@@ -3,4 +3,5 @@
 config PLATFORM_KENDRYTE_K210
 	bool
 	select SERIAL_SIFIVE
+	select TIMER_MTIMER
 	default y
diff --git a/platform/nuclei/ux600/Kconfig b/platform/nuclei/ux600/Kconfig
index c4da266..b05c6a9 100644
--- a/platform/nuclei/ux600/Kconfig
+++ b/platform/nuclei/ux600/Kconfig
@@ -3,4 +3,5 @@
 config PLATFORM_NUCLEI_UX600
 	bool
 	select SERIAL_SIFIVE
+	select TIMER_MTIMER
 	default y
diff --git a/platform/template/Kconfig b/platform/template/Kconfig
index e01fb31..933b9e7 100644
--- a/platform/template/Kconfig
+++ b/platform/template/Kconfig
@@ -3,4 +3,5 @@
 config PLATFORM_TEMPLATE
 	bool
 	select SERIAL_UART8250
+	select TIMER_MTIMER
 	default y
-- 
2.34.1


