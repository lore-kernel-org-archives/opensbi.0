From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Nov 2024 14:02:51 -0800
Subject: [PATCH v2 07/11] lib: utils/ipi: Use fdt_driver for initialization
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <20241111220304.1228821-8-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The ipi driver subsystem does not need any extra data, so it can use
`struct fdt_driver` directly. The generic fdt_ipi_init() performs a
best-effort initialization of all matching DT nodes.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 include/sbi_utils/ipi/fdt_ipi.h      |  6 +---
 lib/utils/ipi/fdt_ipi.c              | 42 +++-------------------------
 lib/utils/ipi/fdt_ipi_drivers.carray |  2 +-
 lib/utils/ipi/fdt_ipi_mswi.c         |  4 +--
 lib/utils/ipi/fdt_ipi_plicsw.c       |  4 +--
 5 files changed, 10 insertions(+), 48 deletions(-)

diff --git a/include/sbi_utils/ipi/fdt_ipi.h b/include/sbi_utils/ipi/fdt_ipi.h
index 161f7a2e..9b014470 100644
--- a/include/sbi_utils/ipi/fdt_ipi.h
+++ b/include/sbi_utils/ipi/fdt_ipi.h
@@ -11,14 +11,10 @@
 #define __FDT_IPI_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 
 #ifdef CONFIG_FDT_IPI
 
-struct fdt_ipi {
-	const struct fdt_match *match_table;
-	int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
-};
-
 int fdt_ipi_init(void);
 
 #else
diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
index 6c2feafb..644c9c1c 100644
--- a/lib/utils/ipi/fdt_ipi.c
+++ b/lib/utils/ipi/fdt_ipi.c
@@ -7,50 +7,16 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
-#include <sbi/sbi_error.h>
-#include <sbi/sbi_scratch.h>
-#include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/ipi/fdt_ipi.h>
 
 /* List of FDT ipi drivers generated at compile time */
-extern struct fdt_ipi *const fdt_ipi_drivers[];
+extern const struct fdt_driver *const fdt_ipi_drivers[];
 
 int fdt_ipi_init(void)
 {
-	int pos, noff, rc;
-	struct fdt_ipi *drv;
-	const struct fdt_match *match;
-	const void *fdt = fdt_get_address();
-
-	for (pos = 0; fdt_ipi_drivers[pos]; pos++) {
-		drv = fdt_ipi_drivers[pos];
-
-		noff = -1;
-		while ((noff = fdt_find_match(fdt, noff,
-					drv->match_table, &match)) >= 0) {
-			if (!fdt_node_is_enabled(fdt, noff))
-				continue;
-
-			/* drv->cold_init must not be NULL */
-			if (drv->cold_init == NULL)
-				return SBI_EFAIL;
-
-			rc = drv->cold_init(fdt, noff, match);
-			if (rc == SBI_ENODEV)
-				continue;
-			if (rc)
-				return rc;
-
-			/*
-			 * We will have multiple IPI devices on multi-die or
-			 * multi-socket systems so we cannot break here.
-			 */
-		}
-	}
-
 	/*
-	 * On some single-hart system there is no need for ipi,
-	 * so we cannot return a failure here
+	 * On some single-hart system there is no need for IPIs,
+	 * so do not return a failure if no device is found.
 	 */
-	return 0;
+	return fdt_driver_init_all(fdt_get_address(), fdt_ipi_drivers);
 }
diff --git a/lib/utils/ipi/fdt_ipi_drivers.carray b/lib/utils/ipi/fdt_ipi_drivers.carray
index 275fa9cf..006b0fd9 100644
--- a/lib/utils/ipi/fdt_ipi_drivers.carray
+++ b/lib/utils/ipi/fdt_ipi_drivers.carray
@@ -1,3 +1,3 @@
 HEADER: sbi_utils/ipi/fdt_ipi.h
-TYPE: struct fdt_ipi
+TYPE: const struct fdt_driver
 NAME: fdt_ipi_drivers
diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index c58d7722..aa37d0d0 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -61,7 +61,7 @@ static const struct fdt_match ipi_mswi_match[] = {
 	{ },
 };
 
-struct fdt_ipi fdt_ipi_mswi = {
+const struct fdt_driver fdt_ipi_mswi = {
 	.match_table = ipi_mswi_match,
-	.cold_init = ipi_mswi_cold_init,
+	.init = ipi_mswi_cold_init,
 };
diff --git a/lib/utils/ipi/fdt_ipi_plicsw.c b/lib/utils/ipi/fdt_ipi_plicsw.c
index a178db1b..be669980 100644
--- a/lib/utils/ipi/fdt_ipi_plicsw.c
+++ b/lib/utils/ipi/fdt_ipi_plicsw.c
@@ -39,7 +39,7 @@ static const struct fdt_match ipi_plicsw_match[] = {
 	{},
 };
 
-struct fdt_ipi fdt_ipi_plicsw = {
+const struct fdt_driver fdt_ipi_plicsw = {
 	.match_table = ipi_plicsw_match,
-	.cold_init   = fdt_plicsw_cold_ipi_init,
+	.init = fdt_plicsw_cold_ipi_init,
 };
-- 
2.45.1


