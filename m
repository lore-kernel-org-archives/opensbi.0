From: Xiang W <wxjstz@126.com>
Date: Thu, 13 Jun 2024 23:03:07 +0800
Subject: [PATCH] lib: utils/reset: Try initializing all reset devices in dt
Message-ID: <20240613150309.2143370-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In DT, multiple reset devices may use the same driver, and they
may have different priorities. If rc is returned after the first
initialization, the highest priority device may be lost.

Fixes: a73ff043e991 (lib: utils/reset: Fix fdt_reset to search for more dt nodes)
Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/reset/fdt_reset.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index c41b838..ee4e29a 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -19,7 +19,7 @@ extern unsigned long fdt_reset_drivers_size;
 
 int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
 {
-	int noff, rc = SBI_ENODEV;
+	int noff, rc, cnt = 0;
 	const struct fdt_match *match;
 
 	noff = -1;
@@ -30,16 +30,16 @@ int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
 
 		if (drv->init) {
 			rc = drv->init(fdt, noff, match);
-			if (rc && rc != SBI_ENODEV) {
+			if (!rc)
+				cnt++;
+			else if (rc != SBI_ENODEV) {
 				sbi_printf("%s: %s init failed, %d\n",
 					__func__, match->compatible, rc);
 			}
 		}
-
-		return rc;
 	}
 
-	return SBI_ENODEV;
+	return cnt > 0 ? 0 : SBI_ENODEV;
 }
 
 void fdt_reset_init(void)
-- 
2.43.0


