From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Nov 2024 14:02:55 -0800
Subject: [PATCH v2 11/11] lib: utils/timer: Use fdt_driver for initialization
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <20241111220304.1228821-12-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The timer driver subsystem does not need any extra data, so it can use
`struct fdt_driver` directly. The generic fdt_timer_init() performs a
best-effort initialization of all matching DT nodes.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 include/sbi_utils/timer/fdt_timer.h      |  6 +---
 lib/utils/timer/fdt_timer.c              | 39 +++---------------------
 lib/utils/timer/fdt_timer_drivers.carray |  2 +-
 lib/utils/timer/fdt_timer_mtimer.c       |  4 +--
 lib/utils/timer/fdt_timer_plmt.c         |  4 +--
 5 files changed, 10 insertions(+), 45 deletions(-)

diff --git a/include/sbi_utils/timer/fdt_timer.h b/include/sbi_utils/timer/fdt_timer.h
index 8f0469da..7bd2faf0 100644
--- a/include/sbi_utils/timer/fdt_timer.h
+++ b/include/sbi_utils/timer/fdt_timer.h
@@ -11,14 +11,10 @@
 #define __FDT_TIMER_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 
 #ifdef CONFIG_FDT_TIMER
 
-struct fdt_timer {
-	const struct fdt_match *match_table;
-	int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
-};
-
 int fdt_timer_init(void);
 
 #else
diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
index a2412409..d00aa310 100644
--- a/lib/utils/timer/fdt_timer.c
+++ b/lib/utils/timer/fdt_timer.c
@@ -13,44 +13,13 @@
 #include <sbi_utils/timer/fdt_timer.h>
 
 /* List of FDT timer drivers generated at compile time */
-extern struct fdt_timer *const fdt_timer_drivers[];
+extern const struct fdt_driver *const fdt_timer_drivers[];
 
 int fdt_timer_init(void)
 {
-	int pos, noff, rc;
-	struct fdt_timer *drv;
-	const struct fdt_match *match;
-	const void *fdt = fdt_get_address();
-
-	for (pos = 0; fdt_timer_drivers[pos]; pos++) {
-		drv = fdt_timer_drivers[pos];
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
-			 * We will have multiple timer devices on multi-die or
-			 * multi-socket systems so we cannot break here.
-			 */
-		}
-	}
-
 	/*
-	 * We can't fail here since systems with Sstc might not provide
-	 * mtimer/clint DT node in the device tree.
+	 * Systems with Sstc might not provide any node in the FDT,
+	 * so do not return a failure if no device is found.
 	 */
-	return 0;
+	return fdt_driver_init_all(fdt_get_address(), fdt_timer_drivers);
 }
diff --git a/lib/utils/timer/fdt_timer_drivers.carray b/lib/utils/timer/fdt_timer_drivers.carray
index c62ee733..1dd9fb1a 100644
--- a/lib/utils/timer/fdt_timer_drivers.carray
+++ b/lib/utils/timer/fdt_timer_drivers.carray
@@ -1,3 +1,3 @@
 HEADER: sbi_utils/timer/fdt_timer.h
-TYPE: struct fdt_timer
+TYPE: const struct fdt_driver
 NAME: fdt_timer_drivers
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index e752ddc5..224534d8 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -162,7 +162,7 @@ static const struct fdt_match timer_mtimer_match[] = {
 	{ },
 };
 
-struct fdt_timer fdt_timer_mtimer = {
+const struct fdt_driver fdt_timer_mtimer = {
 	.match_table = timer_mtimer_match,
-	.cold_init = timer_mtimer_cold_init,
+	.init = timer_mtimer_cold_init,
 };
diff --git a/lib/utils/timer/fdt_timer_plmt.c b/lib/utils/timer/fdt_timer_plmt.c
index 459a1190..1e146689 100644
--- a/lib/utils/timer/fdt_timer_plmt.c
+++ b/lib/utils/timer/fdt_timer_plmt.c
@@ -43,7 +43,7 @@ static const struct fdt_match timer_plmt_match[] = {
 	{},
 };
 
-struct fdt_timer fdt_timer_plmt = {
+const struct fdt_driver fdt_timer_plmt = {
 	.match_table = timer_plmt_match,
-	.cold_init   = fdt_plmt_cold_timer_init,
+	.init = fdt_plmt_cold_timer_init,
 };
-- 
2.45.1


