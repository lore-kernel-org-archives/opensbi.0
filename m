From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:51 +0530
Subject: [PATCH 03/11] lib: utils/reset: Generate FDT reset driver list at
 compile-time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having FDT reset driver list hard-coded in the C source,
we generate it using carray.sh at compile-time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/reset/fdt_reset.c              | 22 +++++-----------------
 lib/utils/reset/fdt_reset_drivers.carray |  3 +++
 lib/utils/reset/objects.mk               | 12 ++++++++++++
 3 files changed, 20 insertions(+), 17 deletions(-)
 create mode 100644 lib/utils/reset/fdt_reset_drivers.carray

diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 66281cb..4334586 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -13,21 +13,9 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/reset/fdt_reset.h>
 
-extern struct fdt_reset fdt_poweroff_gpio;
-extern struct fdt_reset fdt_reset_gpio;
-extern struct fdt_reset fdt_reset_htif;
-extern struct fdt_reset fdt_reset_sifive_test;
-extern struct fdt_reset fdt_reset_sunxi_wdt;
-extern struct fdt_reset fdt_reset_thead;
-
-static struct fdt_reset *reset_drivers[] = {
-	&fdt_poweroff_gpio,
-	&fdt_reset_gpio,
-	&fdt_reset_htif,
-	&fdt_reset_sifive_test,
-	&fdt_reset_sunxi_wdt,
-	&fdt_reset_thead,
-};
+/* List of FDT reset drivers generated at compile time */
+extern struct fdt_reset *fdt_reset_drivers[];
+extern unsigned long fdt_reset_drivers_size;
 
 int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
 {
@@ -54,6 +42,6 @@ void fdt_reset_init(void)
 	int pos;
 	void *fdt = fdt_get_address();
 
-	for (pos = 0; pos < array_size(reset_drivers); pos++)
-		fdt_reset_driver_init(fdt, reset_drivers[pos]);
+	for (pos = 0; pos < fdt_reset_drivers_size; pos++)
+		fdt_reset_driver_init(fdt, fdt_reset_drivers[pos]);
 }
diff --git a/lib/utils/reset/fdt_reset_drivers.carray b/lib/utils/reset/fdt_reset_drivers.carray
new file mode 100644
index 0000000..6ff799c
--- /dev/null
+++ b/lib/utils/reset/fdt_reset_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/reset/fdt_reset.h
+TYPE: struct fdt_reset
+NAME: fdt_reset_drivers
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index 6c95db3..8cddcdf 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -8,9 +8,21 @@
 #
 
 libsbiutils-objs-y += reset/fdt_reset.o
+libsbiutils-objs-y += reset/fdt_reset_drivers.o
+
+carray-fdt_reset_drivers-y += fdt_poweroff_gpio
+carray-fdt_reset_drivers-y += fdt_reset_gpio
 libsbiutils-objs-y += reset/fdt_reset_gpio.o
+
+carray-fdt_reset_drivers-y += fdt_reset_htif
 libsbiutils-objs-y += reset/fdt_reset_htif.o
+
+carray-fdt_reset_drivers-y += fdt_reset_sifive_test
 libsbiutils-objs-y += reset/fdt_reset_sifive_test.o
+
+carray-fdt_reset_drivers-y += fdt_reset_sunxi_wdt
 libsbiutils-objs-y += reset/fdt_reset_sunxi_wdt.o
+
+carray-fdt_reset_drivers-y += fdt_reset_thead
 libsbiutils-objs-y += reset/fdt_reset_thead.o
 libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
-- 
2.34.1


