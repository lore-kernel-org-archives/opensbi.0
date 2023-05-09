From: Xiang W <wxjstz@126.com>
Date: Tue,  9 May 2023 22:47:34 +0800
Subject: [PATCH 3/4] lib: utils: Improve fdt_ipi
In-Reply-To: <20230509144735.72059-1-wxjstz@126.com>
References: <20230509144735.72059-1-wxjstz@126.com>
Message-ID: <20230509144735.72059-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove dummy driver. Optimize fdt_ipi_cold_init to exit the loop
early.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/ipi/fdt_ipi.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
index 66dc510..9e3e53f 100644
--- a/lib/utils/ipi/fdt_ipi.c
+++ b/lib/utils/ipi/fdt_ipi.c
@@ -16,24 +16,17 @@
 extern struct fdt_ipi *fdt_ipi_drivers[];
 extern unsigned long fdt_ipi_drivers_size;
 
-static struct fdt_ipi dummy = {
-	.match_table = NULL,
-	.cold_init = NULL,
-	.warm_init = NULL,
-	.exit = NULL,
-};
-
-static struct fdt_ipi *current_driver = &dummy;
+static struct fdt_ipi *current_driver = NULL;
 
 void fdt_ipi_exit(void)
 {
-	if (current_driver->exit)
+	if (current_driver && current_driver->exit)
 		current_driver->exit();
 }
 
 static int fdt_ipi_warm_init(void)
 {
-	if (current_driver->warm_init)
+	if (current_driver && current_driver->warm_init)
 		return current_driver->warm_init();
 	return 0;
 }
@@ -59,13 +52,11 @@ static int fdt_ipi_cold_init(void)
 					return rc;
 			}
 			current_driver = drv;
+			return 0;
 		}
-
-		if (current_driver != &dummy)
-			break;
 	}
 
-	return 0;
+	return SBI_ENODEV;
 }
 
 int fdt_ipi_init(bool cold_boot)
-- 
2.39.2


