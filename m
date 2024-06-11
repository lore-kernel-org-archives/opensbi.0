From: Xiang W <wxjstz@126.com>
Date: Tue, 11 Jun 2024 19:19:32 +0800
Subject: [PATCH 5/7] lib: utils/serial: Fix fdt_serial to match more dt nodes
In-Reply-To: <20240611111937.1459876-1-wxjstz@126.com>
References: <20240611111937.1459876-1-wxjstz@126.com>
Message-ID: <20240611111937.1459876-6-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If there are multiple dt nodes, the previous code only tries to match
the first one, which may lose initialization.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/serial/fdt_serial.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index 8b6e6b9..798ac74 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -68,21 +68,21 @@ int fdt_serial_init(void)
 	for (pos = 0; pos < fdt_serial_drivers_size; pos++) {
 		drv = fdt_serial_drivers[pos];
 
-		noff = fdt_find_match(fdt, -1, drv->match_table, &match);
-		if (noff < 0)
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, noff))
-			continue;
+		noff = -1;
+		while ((noff = fdt_find_match(fdt, noff,
+					drv->match_table, &match)) >= 0) {
+			if (!fdt_node_is_enabled(fdt, noff))
+				continue;
 
-		/* drv->init must not be NULL */
-		if (drv->init == NULL)
-			return SBI_EFAIL;
+			/* drv->init must not be NULL */
+			if (drv->init == NULL)
+				return SBI_EFAIL;
 
-		rc = drv->init(fdt, noff, match);
-		if (rc == SBI_ENODEV)
-			continue;
-		return rc;
+			rc = drv->init(fdt, noff, match);
+			if (rc == SBI_ENODEV)
+				continue;
+			return rc;
+		}
 	}
 
 	return SBI_ENODEV;
-- 
2.43.0


