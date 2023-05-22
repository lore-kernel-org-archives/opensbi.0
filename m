From: Xiang W <wxjstz@126.com>
Date: Mon, 22 May 2023 13:18:09 +0800
Subject: [PATCH v3 4/4] lib: utils: Improve fdt_timer
In-Reply-To: <20230522051809.1062177-1-wxjstz@126.com>
References: <20230522051809.1062177-1-wxjstz@126.com>
Message-ID: <20230522051809.1062177-5-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove dummy driver. Optimize fdt_timer_cold_init to exit the
loop early.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/timer/fdt_timer.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
index 4695c0f..a08ded9 100644
--- a/lib/utils/timer/fdt_timer.c
+++ b/lib/utils/timer/fdt_timer.c
@@ -16,24 +16,17 @@
 extern struct fdt_timer *fdt_timer_drivers[];
 extern unsigned long fdt_timer_drivers_size;
 
-static struct fdt_timer dummy = {
-	.match_table = NULL,
-	.cold_init = NULL,
-	.warm_init = NULL,
-	.exit = NULL,
-};
-
-static struct fdt_timer *current_driver = &dummy;
+static struct fdt_timer *current_driver = NULL;
 
 void fdt_timer_exit(void)
 {
-	if (current_driver->exit)
+	if (current_driver && current_driver->exit)
 		current_driver->exit();
 }
 
 static int fdt_timer_warm_init(void)
 {
-	if (current_driver->warm_init)
+	if (current_driver && current_driver->warm_init)
 		return current_driver->warm_init();
 	return 0;
 }
@@ -51,20 +44,21 @@ static int fdt_timer_cold_init(void)
 		noff = -1;
 		while ((noff = fdt_find_match(fdt, noff,
 					drv->match_table, &match)) >= 0) {
-			if (drv->cold_init) {
-				rc = drv->cold_init(fdt, noff, match);
-				if (rc == SBI_ENODEV)
-					continue;
-				if (rc)
-					return rc;
-			}
-			current_driver = drv;
-		}
+			/* drv->cold_init must not be NULL */
+			if (drv->cold_init == NULL)
+				return SBI_EFAIL;
 
-		if (current_driver != &dummy)
-			break;
+			rc = drv->cold_init(fdt, noff, match);
+			if (rc == SBI_ENODEV)
+				continue;
+			if (rc == 0)
+				current_driver = drv;
+			return rc;
+		}
 	}
 
+	/* We can't fail here since systems with Sstc might not provide
+	 * mtimer/clint DT node in the device tree. */
 	return 0;
 }
 
-- 
2.39.2


