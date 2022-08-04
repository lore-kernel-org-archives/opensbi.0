From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  4 Aug 2022 20:01:00 +0530
Subject: [PATCH v7 11/17] lib: utils/gpio: Use kconfig for enabling/disabling drivers
In-Reply-To: <20220804143106.64599-1-apatel@ventanamicro.com>
References: <20220804143106.64599-1-apatel@ventanamicro.com>
Message-ID: <20220804143106.64599-12-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update gpio drivers makefile to use kconfig for enabling/disabling
drivers. To avoid compile errors, we also enable appropriate gpio
drivers for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/utils/Kconfig                  |  2 ++
 lib/utils/gpio/Kconfig             | 22 ++++++++++++++++++++++
 lib/utils/gpio/objects.mk          | 10 +++++-----
 lib/utils/reset/Kconfig            |  1 +
 platform/generic/configs/defconfig |  2 ++
 5 files changed, 32 insertions(+), 5 deletions(-)
 create mode 100644 lib/utils/gpio/Kconfig

diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 39452d5..673b02b 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -2,6 +2,8 @@
 
 menu "Utils and Drivers Support"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/gpio/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/i2c/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/ipi/Kconfig"
diff --git a/lib/utils/gpio/Kconfig b/lib/utils/gpio/Kconfig
new file mode 100644
index 0000000..daf7f91
--- /dev/null
+++ b/lib/utils/gpio/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "GPIO Support"
+
+config FDT_GPIO
+	bool "FDT based GPIO drivers"
+	select GPIO
+	default n
+
+if FDT_GPIO
+
+config FDT_GPIO_SIFIVE
+	bool "SiFive GPIO FDT driver"
+	default n
+
+endif
+
+config GPIO
+	bool "GPIO support"
+	default n
+
+endmenu
diff --git a/lib/utils/gpio/objects.mk b/lib/utils/gpio/objects.mk
index a5e131b..eedd699 100644
--- a/lib/utils/gpio/objects.mk
+++ b/lib/utils/gpio/objects.mk
@@ -7,10 +7,10 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-y += gpio/fdt_gpio.o
-libsbiutils-objs-y += gpio/fdt_gpio_drivers.o
+libsbiutils-objs-$(CONFIG_FDT_GPIO) += gpio/fdt_gpio.o
+libsbiutils-objs-$(CONFIG_FDT_GPIO) += gpio/fdt_gpio_drivers.o
 
-carray-fdt_gpio_drivers-y += fdt_gpio_sifive
-libsbiutils-objs-y += gpio/fdt_gpio_sifive.o
+carray-fdt_gpio_drivers-$(CONFIG_FDT_GPIO_SIFIVE) += fdt_gpio_sifive
+libsbiutils-objs-$(CONFIG_FDT_GPIO_SIFIVE) += gpio/fdt_gpio_sifive.o
 
-libsbiutils-objs-y += gpio/gpio.o
+libsbiutils-objs-$(CONFIG_GPIO) += gpio/gpio.o
diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index e7a71e3..71996cb 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -10,6 +10,7 @@ if FDT_RESET
 
 config FDT_RESET_GPIO
 	bool "GPIO FDT reset driver"
+	depends on FDT_GPIO
 	default n
 
 config FDT_RESET_HTIF
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index c9c221e..d56cef2 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,3 +1,5 @@
+CONFIG_FDT_GPIO=y
+CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
 CONFIG_FDT_IPI=y
-- 
2.34.1


