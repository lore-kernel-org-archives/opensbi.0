From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:52 +0530
Subject: [PATCH 04/11] lib: utils/serial: Generate FDT serial driver list at
 compile-time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having FDT serial driver list hard-coded in the C source,
we generate it using carray.sh at compile-time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/serial/fdt_serial.c              | 28 ++++++----------------
 lib/utils/serial/fdt_serial_drivers.carray |  3 +++
 lib/utils/serial/objects.mk                | 16 +++++++++++++
 3 files changed, 26 insertions(+), 21 deletions(-)
 create mode 100644 lib/utils/serial/fdt_serial_drivers.carray

diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index 45aea4a..1a4bf9e 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -13,23 +13,9 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/serial/fdt_serial.h>
 
-extern struct fdt_serial fdt_serial_uart8250;
-extern struct fdt_serial fdt_serial_sifive;
-extern struct fdt_serial fdt_serial_litex;
-extern struct fdt_serial fdt_serial_htif;
-extern struct fdt_serial fdt_serial_shakti;
-extern struct fdt_serial fdt_serial_gaisler;
-extern struct fdt_serial fdt_serial_xlnx_uartlite;
-
-static struct fdt_serial *serial_drivers[] = {
-	&fdt_serial_uart8250,
-	&fdt_serial_sifive,
-	&fdt_serial_litex,
-	&fdt_serial_htif,
-	&fdt_serial_shakti,
-	&fdt_serial_gaisler,
-	&fdt_serial_xlnx_uartlite,
-};
+/* List of FDT serial drivers generated at compile time */
+extern struct fdt_serial *fdt_serial_drivers[];
+extern unsigned long fdt_serial_drivers_size;
 
 static struct fdt_serial dummy = {
 	.match_table = NULL,
@@ -64,8 +50,8 @@ int fdt_serial_init(void)
 	}
 
 	/* First check DT node pointed by stdout-path */
-	for (pos = 0; pos < array_size(serial_drivers) && -1 < noff; pos++) {
-		drv = serial_drivers[pos];
+	for (pos = 0; pos < fdt_serial_drivers_size && -1 < noff; pos++) {
+		drv = fdt_serial_drivers[pos];
 
 		match = fdt_match_node(fdt, noff, drv->match_table);
 		if (!match)
@@ -87,8 +73,8 @@ int fdt_serial_init(void)
 		goto done;
 
 	/* Lastly check all DT nodes */
-	for (pos = 0; pos < array_size(serial_drivers); pos++) {
-		drv = serial_drivers[pos];
+	for (pos = 0; pos < fdt_serial_drivers_size; pos++) {
+		drv = fdt_serial_drivers[pos];
 
 		noff = fdt_find_match(fdt, -1, drv->match_table, &match);
 		if (noff < 0)
diff --git a/lib/utils/serial/fdt_serial_drivers.carray b/lib/utils/serial/fdt_serial_drivers.carray
new file mode 100644
index 0000000..3517b2c
--- /dev/null
+++ b/lib/utils/serial/fdt_serial_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/serial/fdt_serial.h
+TYPE: struct fdt_serial
+NAME: fdt_serial_drivers
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index 4fb9627..d26a74e 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -8,13 +8,29 @@
 #
 
 libsbiutils-objs-y += serial/fdt_serial.o
+libsbiutils-objs-y += serial/fdt_serial_drivers.o
+
+carray-fdt_serial_drivers-y += fdt_serial_gaisler
 libsbiutils-objs-y += serial/fdt_serial_gaisler.o
+
+carray-fdt_serial_drivers-y += fdt_serial_htif
 libsbiutils-objs-y += serial/fdt_serial_htif.o
+
+carray-fdt_serial_drivers-y += fdt_serial_shakti
 libsbiutils-objs-y += serial/fdt_serial_shakti.o
+
+carray-fdt_serial_drivers-y += fdt_serial_sifive
 libsbiutils-objs-y += serial/fdt_serial_sifive.o
+
+carray-fdt_serial_drivers-y += fdt_serial_litex
 libsbiutils-objs-y += serial/fdt_serial_litex.o
+
+carray-fdt_serial_drivers-y += fdt_serial_uart8250
 libsbiutils-objs-y += serial/fdt_serial_uart8250.o
+
+carray-fdt_serial_drivers-y += fdt_serial_xlnx_uartlite
 libsbiutils-objs-y += serial/fdt_serial_xlnx_uartlite.o
+
 libsbiutils-objs-y += serial/gaisler-uart.o
 libsbiutils-objs-y += serial/shakti-uart.o
 libsbiutils-objs-y += serial/sifive-uart.o
-- 
2.34.1


