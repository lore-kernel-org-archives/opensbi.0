From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 26 Oct 2021 14:16:27 +0200
Subject: [PATCH v2 3/3] lib: sbi: error handling in fdt_reset_init()
In-Reply-To: <20211026121627.18760-1-heinrich.schuchardt@canonical.com>
References: <20211026121627.18760-1-heinrich.schuchardt@canonical.com>
Message-ID: <20211026121627.18760-4-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The initialization of a reset driver may fail for various reasons, like
a PMIC based reset driver not finding the required I2C driver. The return
code of the init routine may take other error values than -ENODEV.

If the initialization of a reset driver fails, this should not lead to the
board hanging. It is enough that the reset driver does not call
sbi_system_reset_add_device() to avoid invoking the driver for a device
that could not be initialized.

Change the return type of fdt_reset_init() to void.
Print a message if an error occurs.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
	provide an error message
---
 include/sbi_utils/reset/fdt_reset.h |  5 ++++-
 lib/utils/reset/fdt_reset.c         | 13 ++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
index 6d58697..49214ff 100644
--- a/include/sbi_utils/reset/fdt_reset.h
+++ b/include/sbi_utils/reset/fdt_reset.h
@@ -17,6 +17,9 @@ struct fdt_reset {
 	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
 };
 
-int fdt_reset_init(void);
+/**
+ * fdt_reset_init() - initialize reset drivers based on the device-tree
+ */
+void fdt_reset_init(void);
 
 #endif
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 168bb0c..fa2e81e 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -7,6 +7,7 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -28,7 +29,7 @@ static struct fdt_reset *reset_drivers[] = {
 	&fdt_reset_thead,
 };
 
-int fdt_reset_init(void)
+void fdt_reset_init(void)
 {
 	int pos, noff, rc;
 	struct fdt_reset *drv;
@@ -44,12 +45,10 @@ int fdt_reset_init(void)
 
 		if (drv->init) {
 			rc = drv->init(fdt, noff, match);
-			if (rc == SBI_ENODEV)
-				continue;
-			if (rc)
-				return rc;
+			if (rc && rc != -SBI_ENODEV) {
+				sbi_printf("%s: %s init failed, %d\n",
+					   __func__, match->compatible, rc);
+			}
 		}
 	}
-
-	return 0;
 }
-- 
2.32.0


