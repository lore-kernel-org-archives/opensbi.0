From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:56 +0530
Subject: [PATCH 08/11] lib: utils/i2c: Generate FDT i2c adapter driver list at
 compile-time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having FDT i2c adapter driver list hard-coded in the C source,
we generate it using carray.sh at compile-time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/i2c/fdt_i2c.c                      | 14 +++++---------
 lib/utils/i2c/fdt_i2c_adapter_drivers.carray |  3 +++
 lib/utils/i2c/objects.mk                     |  4 ++++
 3 files changed, 12 insertions(+), 9 deletions(-)
 create mode 100644 lib/utils/i2c/fdt_i2c_adapter_drivers.carray

diff --git a/lib/utils/i2c/fdt_i2c.c b/lib/utils/i2c/fdt_i2c.c
index be8e506..6fd35dd 100644
--- a/lib/utils/i2c/fdt_i2c.c
+++ b/lib/utils/i2c/fdt_i2c.c
@@ -16,13 +16,9 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/i2c/fdt_i2c.h>
 
-#include <sbi/sbi_console.h>
-
-extern struct fdt_i2c_adapter fdt_i2c_adapter_sifive;
-
-static struct fdt_i2c_adapter *i2c_adapter_drivers[] = {
-	&fdt_i2c_adapter_sifive
-};
+/* List of FDT i2c adapter drivers generated at compile time */
+extern struct fdt_i2c_adapter *fdt_i2c_adapter_drivers[];
+extern unsigned long fdt_i2c_adapter_drivers_size;
 
 static int fdt_i2c_adapter_init(void *fdt, int nodeoff)
 {
@@ -31,8 +27,8 @@ static int fdt_i2c_adapter_init(void *fdt, int nodeoff)
 	const struct fdt_match *match;
 
 	/* Try all I2C drivers one-by-one */
-	for (pos = 0; pos < array_size(i2c_adapter_drivers); pos++) {
-		drv = i2c_adapter_drivers[pos];
+	for (pos = 0; pos < fdt_i2c_adapter_drivers_size; pos++) {
+		drv = fdt_i2c_adapter_drivers[pos];
 		match = fdt_match_node(fdt, nodeoff, drv->match_table);
 		if (match && drv->init) {
 			rc = drv->init(fdt, nodeoff, match);
diff --git a/lib/utils/i2c/fdt_i2c_adapter_drivers.carray b/lib/utils/i2c/fdt_i2c_adapter_drivers.carray
new file mode 100644
index 0000000..fd51ae1
--- /dev/null
+++ b/lib/utils/i2c/fdt_i2c_adapter_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/i2c/fdt_i2c.h
+TYPE: struct fdt_i2c_adapter
+NAME: fdt_i2c_adapter_drivers
diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
index a748c48..bb0d6d5 100644
--- a/lib/utils/i2c/objects.mk
+++ b/lib/utils/i2c/objects.mk
@@ -8,5 +8,9 @@
 #
 
 libsbiutils-objs-y += i2c/i2c.o
+
 libsbiutils-objs-y += i2c/fdt_i2c.o
+libsbiutils-objs-y += i2c/fdt_i2c_adapter_drivers.o
+
+carray-fdt_i2c_adapter_drivers-y += fdt_i2c_adapter_sifive
 libsbiutils-objs-y += i2c/fdt_i2c_sifive.o
-- 
2.34.1


