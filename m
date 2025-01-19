From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 11:03:55 -0800
Subject: [PATCH 1/3] lib: utils/irqchip: Use fdt_driver for initialization
In-Reply-To: <20250119190435.3603452-1-samuel.holland@sifive.com>
References: <20250119190435.3603452-1-samuel.holland@sifive.com>
Message-ID: <20250119190435.3603452-2-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The irqchip driver subsystem does not need any extra data, so it can use
`struct fdt_driver` directly. The generic fdt_irqchip_init() performs a
best-effort initialization of all matching DT nodes.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/irqchip/fdt_irqchip.h      |  6 +---
 lib/utils/irqchip/fdt_irqchip.c              | 31 ++------------------
 lib/utils/irqchip/fdt_irqchip_aplic.c        |  4 +--
 lib/utils/irqchip/fdt_irqchip_drivers.carray |  2 +-
 lib/utils/irqchip/fdt_irqchip_imsic.c        |  4 +--
 lib/utils/irqchip/fdt_irqchip_plic.c         |  4 +--
 6 files changed, 10 insertions(+), 41 deletions(-)

diff --git a/include/sbi_utils/irqchip/fdt_irqchip.h b/include/sbi_utils/irqchip/fdt_irqchip.h
index 0ad00489..3c80f563 100644
--- a/include/sbi_utils/irqchip/fdt_irqchip.h
+++ b/include/sbi_utils/irqchip/fdt_irqchip.h
@@ -11,14 +11,10 @@
 #define __FDT_IRQCHIP_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 
 #ifdef CONFIG_FDT_IRQCHIP
 
-struct fdt_irqchip {
-	const struct fdt_match *match_table;
-	int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
-};
-
 int fdt_irqchip_init(void);
 
 #else
diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
index 6ed7711b..53bc4553 100644
--- a/lib/utils/irqchip/fdt_irqchip.c
+++ b/lib/utils/irqchip/fdt_irqchip.c
@@ -7,39 +7,12 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
-#include <sbi/sbi_error.h>
-#include <sbi/sbi_scratch.h>
-#include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 
 /* List of FDT irqchip drivers generated at compile time */
-extern struct fdt_irqchip *const fdt_irqchip_drivers[];
+extern const struct fdt_driver *const fdt_irqchip_drivers[];
 
 int fdt_irqchip_init(void)
 {
-	int pos, noff, rc;
-	struct fdt_irqchip *drv;
-	const struct fdt_match *match;
-	const void *fdt = fdt_get_address();
-
-	for (pos = 0; fdt_irqchip_drivers[pos]; pos++) {
-		drv = fdt_irqchip_drivers[pos];
-
-		noff = -1;
-		while ((noff = fdt_find_match(fdt, noff,
-					drv->match_table, &match)) >= 0) {
-			if (!fdt_node_is_enabled(fdt,noff))
-				continue;
-
-			if (drv->cold_init) {
-				rc = drv->cold_init(fdt, noff, match);
-				if (rc == SBI_ENODEV)
-					continue;
-				if (rc)
-					return rc;
-			}
-		}
-	}
-
-	return 0;
+	return fdt_driver_init_all(fdt_get_address(), fdt_irqchip_drivers);
 }
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
index 532d8c48..81ebe67d 100644
--- a/lib/utils/irqchip/fdt_irqchip_aplic.c
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -46,7 +46,7 @@ static const struct fdt_match irqchip_aplic_match[] = {
 	{ },
 };
 
-struct fdt_irqchip fdt_irqchip_aplic = {
+const struct fdt_driver fdt_irqchip_aplic = {
 	.match_table = irqchip_aplic_match,
-	.cold_init = irqchip_aplic_cold_init,
+	.init = irqchip_aplic_cold_init,
 };
diff --git a/lib/utils/irqchip/fdt_irqchip_drivers.carray b/lib/utils/irqchip/fdt_irqchip_drivers.carray
index b373be56..076b7170 100644
--- a/lib/utils/irqchip/fdt_irqchip_drivers.carray
+++ b/lib/utils/irqchip/fdt_irqchip_drivers.carray
@@ -1,3 +1,3 @@
 HEADER: sbi_utils/irqchip/fdt_irqchip.h
-TYPE: struct fdt_irqchip
+TYPE: const struct fdt_driver
 NAME: fdt_irqchip_drivers
diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
index 40d63eb0..2e47cc81 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -92,7 +92,7 @@ static const struct fdt_match irqchip_imsic_match[] = {
 	{ },
 };
 
-struct fdt_irqchip fdt_irqchip_imsic = {
+const struct fdt_driver fdt_irqchip_imsic = {
 	.match_table = irqchip_imsic_match,
-	.cold_init = irqchip_imsic_cold_init,
+	.init = irqchip_imsic_cold_init,
 };
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index a7388dcc..494358d8 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -105,7 +105,7 @@ static const struct fdt_match irqchip_plic_match[] = {
 	{ /* sentinel */ }
 };
 
-struct fdt_irqchip fdt_irqchip_plic = {
+const struct fdt_driver fdt_irqchip_plic = {
 	.match_table = irqchip_plic_match,
-	.cold_init = irqchip_plic_cold_init,
+	.init = irqchip_plic_cold_init,
 };
-- 
2.47.0


