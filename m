From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue,  9 Nov 2021 15:41:24 +0300
Subject: [PATCH v3 2/6] lib: utils/reset: separate driver init func
In-Reply-To: <20211109124128.19666-1-nikita.shubin@maquefel.me>
References: <20211109124128.19666-1-nikita.shubin@maquefel.me>
Message-ID: <20211109124128.19666-3-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

Move driver init code to separate function, so it can be reused
elsewhere.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 include/sbi_utils/reset/fdt_reset.h |  5 ++++
 lib/utils/reset/fdt_reset.c         | 37 ++++++++++++++++-------------
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
index 46167b9..e7f7350 100644
--- a/include/sbi_utils/reset/fdt_reset.h
+++ b/include/sbi_utils/reset/fdt_reset.h
@@ -17,6 +17,11 @@ struct fdt_reset {
 	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
 };
 
+/**
+ * fdt_reset_driver_init() - initialize reset driver based on the device-tree
+ */
+int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv);
+
 /**
  * fdt_reset_init() - initialize reset drivers based on the device-tree
  *
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index f4befa2..66281cb 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -29,26 +29,31 @@ static struct fdt_reset *reset_drivers[] = {
 	&fdt_reset_thead,
 };
 
-void fdt_reset_init(void)
+int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
 {
-	int pos, noff, rc;
-	struct fdt_reset *drv;
+	int noff, rc = SBI_ENODEV;
 	const struct fdt_match *match;
-	void *fdt = fdt_get_address();
-
-	for (pos = 0; pos < array_size(reset_drivers); pos++) {
-		drv = reset_drivers[pos];
 
-		noff = fdt_find_match(fdt, -1, drv->match_table, &match);
-		if (noff < 0)
-			continue;
+	noff = fdt_find_match(fdt, -1, drv->match_table, &match);
+	if (noff < 0)
+		return SBI_ENODEV;
 
-		if (drv->init) {
-			rc = drv->init(fdt, noff, match);
-			if (rc && rc != SBI_ENODEV) {
-				sbi_printf("%s: %s init failed, %d\n",
-					   __func__, match->compatible, rc);
-			}
+	if (drv->init) {
+		rc = drv->init(fdt, noff, match);
+		if (rc && rc != SBI_ENODEV) {
+			sbi_printf("%s: %s init failed, %d\n",
+				   __func__, match->compatible, rc);
 		}
 	}
+
+	return rc;
+}
+
+void fdt_reset_init(void)
+{
+	int pos;
+	void *fdt = fdt_get_address();
+
+	for (pos = 0; pos < array_size(reset_drivers); pos++)
+		fdt_reset_driver_init(fdt, reset_drivers[pos]);
 }
-- 
2.31.1


