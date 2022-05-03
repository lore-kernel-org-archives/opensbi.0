From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:55 +0530
Subject: [PATCH 07/11] lib: utils/ipi: Generate FDT ipi driver list at
 compile-time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-8-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having FDT ipi driver list hard-coded in the C source,
we generate it using carray.sh at compile-time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/ipi/fdt_ipi.c              | 12 +++++-------
 lib/utils/ipi/fdt_ipi_drivers.carray |  3 +++
 lib/utils/ipi/objects.mk             |  4 ++++
 3 files changed, 12 insertions(+), 7 deletions(-)
 create mode 100644 lib/utils/ipi/fdt_ipi_drivers.carray

diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
index 91f116f..66dc510 100644
--- a/lib/utils/ipi/fdt_ipi.c
+++ b/lib/utils/ipi/fdt_ipi.c
@@ -12,11 +12,9 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/ipi/fdt_ipi.h>
 
-extern struct fdt_ipi fdt_ipi_mswi;
-
-static struct fdt_ipi *ipi_drivers[] = {
-	&fdt_ipi_mswi
-};
+/* List of FDT ipi drivers generated at compile time */
+extern struct fdt_ipi *fdt_ipi_drivers[];
+extern unsigned long fdt_ipi_drivers_size;
 
 static struct fdt_ipi dummy = {
 	.match_table = NULL,
@@ -47,8 +45,8 @@ static int fdt_ipi_cold_init(void)
 	const struct fdt_match *match;
 	void *fdt = fdt_get_address();
 
-	for (pos = 0; pos < array_size(ipi_drivers); pos++) {
-		drv = ipi_drivers[pos];
+	for (pos = 0; pos < fdt_ipi_drivers_size; pos++) {
+		drv = fdt_ipi_drivers[pos];
 
 		noff = -1;
 		while ((noff = fdt_find_match(fdt, noff,
diff --git a/lib/utils/ipi/fdt_ipi_drivers.carray b/lib/utils/ipi/fdt_ipi_drivers.carray
new file mode 100644
index 0000000..275fa9c
--- /dev/null
+++ b/lib/utils/ipi/fdt_ipi_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/ipi/fdt_ipi.h
+TYPE: struct fdt_ipi
+NAME: fdt_ipi_drivers
diff --git a/lib/utils/ipi/objects.mk b/lib/utils/ipi/objects.mk
index 129eea8..0b0bc2d 100644
--- a/lib/utils/ipi/objects.mk
+++ b/lib/utils/ipi/objects.mk
@@ -8,5 +8,9 @@
 #
 
 libsbiutils-objs-y += ipi/aclint_mswi.o
+
 libsbiutils-objs-y += ipi/fdt_ipi.o
+libsbiutils-objs-y += ipi/fdt_ipi_drivers.o
+
+carray-fdt_ipi_drivers-y += fdt_ipi_mswi
 libsbiutils-objs-y += ipi/fdt_ipi_mswi.o
-- 
2.34.1


