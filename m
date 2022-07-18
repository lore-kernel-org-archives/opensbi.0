From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Jul 2022 20:26:01 +0530
Subject: [PATCH v2 04/14] lib: utils/reset: Use kconfig for enabling/disabling drivers
In-Reply-To: <20220718145611.2211638-1-apatel@ventanamicro.com>
References: <20220718145611.2211638-1-apatel@ventanamicro.com>
Message-ID: <20220718145611.2211638-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update reset drivers makefile to use kconfig for enabling/disabling
drivers. To avoid compile errors, we also enable appropriate reset
drivers for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/reset/fdt_reset.h | 12 +++++++++++
 lib/utils/Kconfig                   |  2 ++
 lib/utils/reset/Kconfig             | 33 +++++++++++++++++++++++++++++
 lib/utils/reset/objects.mk          | 28 ++++++++++++------------
 platform/generic/configs/defconfig  |  6 ++++++
 5 files changed, 67 insertions(+), 14 deletions(-)
 create mode 100644 lib/utils/reset/Kconfig

diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
index e7f7350..ea8063b 100644
--- a/include/sbi_utils/reset/fdt_reset.h
+++ b/include/sbi_utils/reset/fdt_reset.h
@@ -17,6 +17,8 @@ struct fdt_reset {
 	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
 };
 
+#ifdef CONFIG_FDT_RESET
+
 /**
  * fdt_reset_driver_init() - initialize reset driver based on the device-tree
  */
@@ -29,4 +31,14 @@ int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv);
  */
 void fdt_reset_init(void);
 
+#else
+
+static inline int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
+{
+	return 0;
+}
+static inline void fdt_reset_init(void) { }
+
+#endif
+
 #endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 0341fa7..3a6389b 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -2,6 +2,8 @@
 
 menu "Utils and Drivers Support"
 
+source "$OPENSBI_SRC_DIR/lib/utils/reset/Kconfig"
+
 source "$OPENSBI_SRC_DIR/lib/utils/serial/Kconfig"
 
 endmenu
diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
new file mode 100644
index 0000000..845a1ae
--- /dev/null
+++ b/lib/utils/reset/Kconfig
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "System Reset Support"
+
+config FDT_RESET
+	bool "FDT based reset drivers"
+	default n
+
+if FDT_RESET
+
+config FDT_RESET_GPIO
+	bool "GPIO FDT reset driver"
+	default n
+
+config FDT_RESET_HTIF
+	bool "Host transfer interface (HTIF) FDT reset driver"
+	default n
+
+config FDT_RESET_SIFIVE_TEST
+	bool "SiFive Test FDT reset driver"
+	default n
+
+config FDT_RESET_SUNXI_WDT
+	bool "Sunxi WDT FDT reset driver"
+	default n
+
+config FDT_RESET_THEAD
+	bool "T-HEAD FDT reset driver"
+	default n
+
+endif
+
+endmenu
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index 8cddcdf..8a50dd0 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -7,22 +7,22 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-y += reset/fdt_reset.o
-libsbiutils-objs-y += reset/fdt_reset_drivers.o
+libsbiutils-objs-$(CONFIG_FDT_RESET) += reset/fdt_reset.o
+libsbiutils-objs-$(CONFIG_FDT_RESET) += reset/fdt_reset_drivers.o
 
-carray-fdt_reset_drivers-y += fdt_poweroff_gpio
-carray-fdt_reset_drivers-y += fdt_reset_gpio
-libsbiutils-objs-y += reset/fdt_reset_gpio.o
+carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_GPIO) += fdt_poweroff_gpio
+carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_GPIO) += fdt_reset_gpio
+libsbiutils-objs-$(CONFIG_FDT_RESET_GPIO) += reset/fdt_reset_gpio.o
 
-carray-fdt_reset_drivers-y += fdt_reset_htif
-libsbiutils-objs-y += reset/fdt_reset_htif.o
+carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_HTIF) += fdt_reset_htif
+libsbiutils-objs-$(CONFIG_FDT_RESET_HTIF) += reset/fdt_reset_htif.o
 
-carray-fdt_reset_drivers-y += fdt_reset_sifive_test
-libsbiutils-objs-y += reset/fdt_reset_sifive_test.o
+carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SIFIVE_TEST) += fdt_reset_sifive_test
+libsbiutils-objs-$(CONFIG_FDT_RESET_SIFIVE_TEST) += reset/fdt_reset_sifive_test.o
 
-carray-fdt_reset_drivers-y += fdt_reset_sunxi_wdt
-libsbiutils-objs-y += reset/fdt_reset_sunxi_wdt.o
+carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SUNXI_WDT) += fdt_reset_sunxi_wdt
+libsbiutils-objs-$(CONFIG_FDT_RESET_SUNXI_WDT) += reset/fdt_reset_sunxi_wdt.o
 
-carray-fdt_reset_drivers-y += fdt_reset_thead
-libsbiutils-objs-y += reset/fdt_reset_thead.o
-libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
+carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_THEAD) += fdt_reset_thead
+libsbiutils-objs-$(CONFIG_FDT_RESET_THEAD) += reset/fdt_reset_thead.o
+libsbiutils-objs-$(CONFIG_FDT_RESET_THEAD) += reset/fdt_reset_thead_asm.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index ce70c59..9778665 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,3 +1,9 @@
+CONFIG_FDT_RESET=y
+CONFIG_FDT_RESET_GPIO=y
+CONFIG_FDT_RESET_HTIF=y
+CONFIG_FDT_RESET_SIFIVE_TEST=y
+CONFIG_FDT_RESET_SUNXI_WDT=y
+CONFIG_FDT_RESET_THEAD=y
 CONFIG_FDT_SERIAL=y
 CONFIG_FDT_SERIAL_GAISLER=y
 CONFIG_FDT_SERIAL_HTIF=y
-- 
2.34.1


