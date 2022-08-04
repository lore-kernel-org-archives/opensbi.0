From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  4 Aug 2022 17:34:22 +0530
Subject: [PATCH v6 10/17] lib: utils/i2c: Use kconfig for enabling/disabling drivers
In-Reply-To: <20220804120429.59444-1-apatel@ventanamicro.com>
References: <20220804120429.59444-1-apatel@ventanamicro.com>
Message-ID: <20220804120429.59444-11-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update i2c drivers makefile to use kconfig for enabling/disabling
drivers. To avoid compile errors, we also enable appropriate i2c
drivers for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/utils/Kconfig                  |  2 ++
 lib/utils/i2c/Kconfig              | 22 ++++++++++++++++++++++
 lib/utils/i2c/objects.mk           | 10 +++++-----
 platform/generic/configs/defconfig |  2 ++
 4 files changed, 31 insertions(+), 5 deletions(-)
 create mode 100644 lib/utils/i2c/Kconfig

diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 3f315fd..39452d5 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -2,6 +2,8 @@
 
 menu "Utils and Drivers Support"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/i2c/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/ipi/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/irqchip/Kconfig"
diff --git a/lib/utils/i2c/Kconfig b/lib/utils/i2c/Kconfig
new file mode 100644
index 0000000..16c4453
--- /dev/null
+++ b/lib/utils/i2c/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "I2C Support"
+
+config FDT_I2C
+	bool "FDT based I2C drivers"
+	select I2C
+	default n
+
+if FDT_I2C
+
+config FDT_I2C_SIFIVE
+	bool "SiFive I2C FDT driver"
+	default n
+
+endif
+
+config I2C
+	bool "I2C support"
+	default n
+
+endmenu
diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
index bb0d6d5..a0fbbb5 100644
--- a/lib/utils/i2c/objects.mk
+++ b/lib/utils/i2c/objects.mk
@@ -7,10 +7,10 @@
 #   Nikita Shubin <n.shubin@yadro.com>
 #
 
-libsbiutils-objs-y += i2c/i2c.o
+libsbiutils-objs-$(CONFIG_I2C) += i2c/i2c.o
 
-libsbiutils-objs-y += i2c/fdt_i2c.o
-libsbiutils-objs-y += i2c/fdt_i2c_adapter_drivers.o
+libsbiutils-objs-$(CONFIG_FDT_I2C) += i2c/fdt_i2c.o
+libsbiutils-objs-$(CONFIG_FDT_I2C) += i2c/fdt_i2c_adapter_drivers.o
 
-carray-fdt_i2c_adapter_drivers-y += fdt_i2c_adapter_sifive
-libsbiutils-objs-y += i2c/fdt_i2c_sifive.o
+carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_SIFIVE) += fdt_i2c_adapter_sifive
+libsbiutils-objs-$(CONFIG_FDT_I2C_SIFIVE) += i2c/fdt_i2c_sifive.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index ad66a63..c9c221e 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,3 +1,5 @@
+CONFIG_FDT_I2C=y
+CONFIG_FDT_I2C_SIFIVE=y
 CONFIG_FDT_IPI=y
 CONFIG_FDT_IPI_MSWI=y
 CONFIG_FDT_IRQCHIP=y
-- 
2.34.1


