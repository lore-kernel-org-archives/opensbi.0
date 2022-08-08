From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  8 Aug 2022 09:27:29 +0530
Subject: [PATCH v8 06/17] lib: utils/sys: Use kconfig for enabling/disabling drivers
In-Reply-To: <20220808035740.69335-1-apatel@ventanamicro.com>
References: <20220808035740.69335-1-apatel@ventanamicro.com>
Message-ID: <20220808035740.69335-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update system drivers makefile to use kconfig for enabling/disabling
drivers. To avoid compile errors, we also enable appropriate system
drivers for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>
---
 lib/utils/Kconfig        |  2 ++
 lib/utils/reset/Kconfig  |  2 ++
 lib/utils/serial/Kconfig |  1 +
 lib/utils/sys/Kconfig    | 13 +++++++++++++
 lib/utils/sys/objects.mk |  4 ++--
 5 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 lib/utils/sys/Kconfig

diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index f061b7a..492f4e9 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -6,4 +6,6 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/serial/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/sys/Kconfig"
+
 endmenu
diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index 845a1ae..e7a71e3 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -14,10 +14,12 @@ config FDT_RESET_GPIO
 
 config FDT_RESET_HTIF
 	bool "Host transfer interface (HTIF) FDT reset driver"
+	select SYS_HTIF
 	default n
 
 config FDT_RESET_SIFIVE_TEST
 	bool "SiFive Test FDT reset driver"
+	select SYS_SIFIVE_TEST
 	default n
 
 config FDT_RESET_SUNXI_WDT
diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
index e114f26..bf37e34 100644
--- a/lib/utils/serial/Kconfig
+++ b/lib/utils/serial/Kconfig
@@ -15,6 +15,7 @@ config FDT_SERIAL_GAISLER
 
 config FDT_SERIAL_HTIF
 	bool "Host transfer interface (HTIF) UART FDT driver"
+	select SYS_HTIF
 	default n
 
 config FDT_SERIAL_SHAKTI
diff --git a/lib/utils/sys/Kconfig b/lib/utils/sys/Kconfig
new file mode 100644
index 0000000..ee85b1a
--- /dev/null
+++ b/lib/utils/sys/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "System Device Support"
+
+config SYS_HTIF
+	bool "Host transfere interface (HTIF) support"
+	default n
+
+config SYS_SIFIVE_TEST
+	bool "SiFive test support"
+	default n
+
+endmenu
diff --git a/lib/utils/sys/objects.mk b/lib/utils/sys/objects.mk
index 06be322..9f67aee 100644
--- a/lib/utils/sys/objects.mk
+++ b/lib/utils/sys/objects.mk
@@ -7,5 +7,5 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-y += sys/htif.o
-libsbiutils-objs-y += sys/sifive_test.o
+libsbiutils-objs-$(CONFIG_SYS_HTIF) += sys/htif.o
+libsbiutils-objs-$(CONFIG_SYS_SIFIVE_TEST) += sys/sifive_test.o
-- 
2.34.1


