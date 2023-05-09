From: Xiang W <wxjstz@126.com>
Date: Tue,  9 May 2023 22:47:33 +0800
Subject: [PATCH 2/4] lib: utils: Improve fdt_serial_init
In-Reply-To: <20230509144735.72059-1-wxjstz@126.com>
References: <20230509144735.72059-1-wxjstz@126.com>
Message-ID: <20230509144735.72059-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A final check of all DT nodes does not necessarily find a match, so
SBI_ENODEV needs to be returned. Optimize removal of current_driver.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/serial/fdt_serial.c | 48 +++++++++++++----------------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index 1a4bf9e..0baa722 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -17,13 +17,6 @@
 extern struct fdt_serial *fdt_serial_drivers[];
 extern unsigned long fdt_serial_drivers_size;
 
-static struct fdt_serial dummy = {
-	.match_table = NULL,
-	.init = NULL,
-};
-
-static struct fdt_serial *current_driver = &dummy;
-
 int fdt_serial_init(void)
 {
 	const void *prop;
@@ -57,20 +50,15 @@ int fdt_serial_init(void)
 		if (!match)
 			continue;
 
-		if (drv->init) {
-			rc = drv->init(fdt, noff, match);
-			if (rc == SBI_ENODEV)
-				continue;
-			if (rc)
-				return rc;
-		}
-		current_driver = drv;
-		break;
-	}
+		/* drv->init must not be NULL */
+		if (drv->init == NULL)
+			return SBI_EFAIL;
 
-	/* Check if we found desired driver */
-	if (current_driver != &dummy)
-		goto done;
+		rc = drv->init(fdt, noff, match);
+		if (rc == SBI_ENODEV)
+			continue;
+		return rc;
+	}
 
 	/* Lastly check all DT nodes */
 	for (pos = 0; pos < fdt_serial_drivers_size; pos++) {
@@ -80,17 +68,15 @@ int fdt_serial_init(void)
 		if (noff < 0)
 			continue;
 
-		if (drv->init) {
-			rc = drv->init(fdt, noff, match);
-			if (rc == SBI_ENODEV)
-				continue;
-			if (rc)
-				return rc;
-		}
-		current_driver = drv;
-		break;
+		/* drv->init must not be NULL */
+		if (drv->init == NULL)
+			return SBI_EFAIL;
+
+		rc = drv->init(fdt, noff, match);
+		if (rc == SBI_ENODEV)
+			continue;
+		return rc;
 	}
 
-done:
-	return 0;
+	return SBI_ENODEV;
 }
-- 
2.39.2


