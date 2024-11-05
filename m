From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon,  4 Nov 2024 20:20:06 -0800
Subject: [PATCH 4/6] lib: utils/i2c: Use fdt_driver for initialization
In-Reply-To: <20241105042240.2994849-1-samuel.holland@sifive.com>
References: <20241105042240.2994849-1-samuel.holland@sifive.com>
Message-ID: <20241105042240.2994849-5-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The i2c driver subsystem does not need any extra data, so it can use
`struct fdt_driver` directly. It always initializes the driver for a
specific DT node.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/i2c/fdt_i2c.h              |  8 +-----
 lib/utils/i2c/fdt_i2c.c                      | 30 ++------------------
 lib/utils/i2c/fdt_i2c_adapter_drivers.carray |  2 +-
 lib/utils/i2c/fdt_i2c_dw.c                   |  2 +-
 lib/utils/i2c/fdt_i2c_sifive.c               |  2 +-
 5 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/include/sbi_utils/i2c/fdt_i2c.h b/include/sbi_utils/i2c/fdt_i2c.h
index 65758ec2..8cae4c2a 100644
--- a/include/sbi_utils/i2c/fdt_i2c.h
+++ b/include/sbi_utils/i2c/fdt_i2c.h
@@ -10,15 +10,9 @@
 #ifndef __FDT_I2C_H__
 #define __FDT_I2C_H__
 
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/i2c/i2c.h>
 
-/** FDT based I2C adapter driver */
-struct fdt_i2c_adapter {
-	const struct fdt_match *match_table;
-	int (*init)(const void *fdt, int nodeoff,
-		    const struct fdt_match *match);
-};
-
 /** Get I2C adapter identified by nodeoff */
 int fdt_i2c_adapter_get(const void *fdt, int nodeoff,
 			struct i2c_adapter **out_adapter);
diff --git a/lib/utils/i2c/fdt_i2c.c b/lib/utils/i2c/fdt_i2c.c
index 56891a0a..d5d36c21 100644
--- a/lib/utils/i2c/fdt_i2c.c
+++ b/lib/utils/i2c/fdt_i2c.c
@@ -11,36 +11,11 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
-#include <libfdt.h>
 #include <sbi/sbi_error.h>
-#include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/i2c/fdt_i2c.h>
 
 /* List of FDT i2c adapter drivers generated at compile time */
-extern struct fdt_i2c_adapter *const fdt_i2c_adapter_drivers[];
-
-static int fdt_i2c_adapter_init(const void *fdt, int nodeoff)
-{
-	int pos, rc;
-	struct fdt_i2c_adapter *drv;
-	const struct fdt_match *match;
-
-	/* Try all I2C drivers one-by-one */
-	for (pos = 0; fdt_i2c_adapter_drivers[pos]; pos++) {
-		drv = fdt_i2c_adapter_drivers[pos];
-		match = fdt_match_node(fdt, nodeoff, drv->match_table);
-		if (match && drv->init) {
-			rc = drv->init(fdt, nodeoff, match);
-			if (rc == SBI_ENODEV)
-				continue;
-			if (rc)
-				return rc;
-			return 0;
-		}
-	}
-
-	return SBI_ENOSYS;
-}
+extern const struct fdt_driver *const fdt_i2c_adapter_drivers[];
 
 static int fdt_i2c_adapter_find(const void *fdt, int nodeoff,
 				struct i2c_adapter **out_adapter)
@@ -50,7 +25,8 @@ static int fdt_i2c_adapter_find(const void *fdt, int nodeoff,
 
 	if (!adapter) {
 		/* I2C adapter not found so initialize matching driver */
-		rc = fdt_i2c_adapter_init(fdt, nodeoff);
+		rc = fdt_driver_init_by_offset(fdt, nodeoff,
+					       fdt_i2c_adapter_drivers);
 		if (rc)
 			return rc;
 
diff --git a/lib/utils/i2c/fdt_i2c_adapter_drivers.carray b/lib/utils/i2c/fdt_i2c_adapter_drivers.carray
index fd51ae1a..0e8c73a4 100644
--- a/lib/utils/i2c/fdt_i2c_adapter_drivers.carray
+++ b/lib/utils/i2c/fdt_i2c_adapter_drivers.carray
@@ -1,3 +1,3 @@
 HEADER: sbi_utils/i2c/fdt_i2c.h
-TYPE: struct fdt_i2c_adapter
+TYPE: const struct fdt_driver
 NAME: fdt_i2c_adapter_drivers
diff --git a/lib/utils/i2c/fdt_i2c_dw.c b/lib/utils/i2c/fdt_i2c_dw.c
index 7d14ea0d..b0905e7b 100644
--- a/lib/utils/i2c/fdt_i2c_dw.c
+++ b/lib/utils/i2c/fdt_i2c_dw.c
@@ -49,7 +49,7 @@ static const struct fdt_match fdt_dw_i2c_match[] = {
 	{ },
 };
 
-struct fdt_i2c_adapter fdt_i2c_adapter_dw = {
+const struct fdt_driver fdt_i2c_adapter_dw = {
 	.match_table = fdt_dw_i2c_match,
 	.init = fdt_dw_i2c_init,
 };
diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
index b420a7da..40811cb4 100644
--- a/lib/utils/i2c/fdt_i2c_sifive.c
+++ b/lib/utils/i2c/fdt_i2c_sifive.c
@@ -265,7 +265,7 @@ static const struct fdt_match sifive_i2c_match[] = {
 	{ },
 };
 
-struct fdt_i2c_adapter fdt_i2c_adapter_sifive = {
+const struct fdt_driver fdt_i2c_adapter_sifive = {
 	.match_table = sifive_i2c_match,
 	.init = sifive_i2c_init,
 };
-- 
2.45.1


