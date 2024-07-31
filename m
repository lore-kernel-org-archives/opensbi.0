From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:46 -0700
Subject: [PATCH 05/16] lib: utils/i2c: Constify FDT pointers in parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-6-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/i2c/fdt_i2c.h | 4 ++--
 lib/utils/i2c/fdt_i2c.c         | 6 +++---
 lib/utils/i2c/fdt_i2c_dw.c      | 4 ++--
 lib/utils/i2c/fdt_i2c_sifive.c  | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sbi_utils/i2c/fdt_i2c.h b/include/sbi_utils/i2c/fdt_i2c.h
index c6e33399..65758ec2 100644
--- a/include/sbi_utils/i2c/fdt_i2c.h
+++ b/include/sbi_utils/i2c/fdt_i2c.h
@@ -15,12 +15,12 @@
 /** FDT based I2C adapter driver */
 struct fdt_i2c_adapter {
 	const struct fdt_match *match_table;
-	int (*init)(void *fdt, int nodeoff,
+	int (*init)(const void *fdt, int nodeoff,
 		    const struct fdt_match *match);
 };
 
 /** Get I2C adapter identified by nodeoff */
-int fdt_i2c_adapter_get(void *fdt, int nodeoff,
+int fdt_i2c_adapter_get(const void *fdt, int nodeoff,
 			struct i2c_adapter **out_adapter);
 
 #endif
diff --git a/lib/utils/i2c/fdt_i2c.c b/lib/utils/i2c/fdt_i2c.c
index 6fd35dd0..d23b40db 100644
--- a/lib/utils/i2c/fdt_i2c.c
+++ b/lib/utils/i2c/fdt_i2c.c
@@ -20,7 +20,7 @@
 extern struct fdt_i2c_adapter *fdt_i2c_adapter_drivers[];
 extern unsigned long fdt_i2c_adapter_drivers_size;
 
-static int fdt_i2c_adapter_init(void *fdt, int nodeoff)
+static int fdt_i2c_adapter_init(const void *fdt, int nodeoff)
 {
 	int pos, rc;
 	struct fdt_i2c_adapter *drv;
@@ -43,7 +43,7 @@ static int fdt_i2c_adapter_init(void *fdt, int nodeoff)
 	return SBI_ENOSYS;
 }
 
-static int fdt_i2c_adapter_find(void *fdt, int nodeoff,
+static int fdt_i2c_adapter_find(const void *fdt, int nodeoff,
 				struct i2c_adapter **out_adapter)
 {
 	int rc;
@@ -67,7 +67,7 @@ static int fdt_i2c_adapter_find(void *fdt, int nodeoff,
 	return 0;
 }
 
-int fdt_i2c_adapter_get(void *fdt, int nodeoff,
+int fdt_i2c_adapter_get(const void *fdt, int nodeoff,
 			struct i2c_adapter **out_adapter)
 {
 	int rc;
diff --git a/lib/utils/i2c/fdt_i2c_dw.c b/lib/utils/i2c/fdt_i2c_dw.c
index 358ad3c7..7d14ea0d 100644
--- a/lib/utils/i2c/fdt_i2c_dw.c
+++ b/lib/utils/i2c/fdt_i2c_dw.c
@@ -15,8 +15,8 @@
 #include <sbi_utils/i2c/dw_i2c.h>
 #include <sbi_utils/i2c/fdt_i2c.h>
 
-static int fdt_dw_i2c_init(void *fdt, int nodeoff,
-			     const struct fdt_match *match)
+static int fdt_dw_i2c_init(const void *fdt, int nodeoff,
+			   const struct fdt_match *match)
 {
 	int rc;
 	struct dw_i2c_adapter *adapter;
diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
index 11740624..b420a7da 100644
--- a/lib/utils/i2c/fdt_i2c_sifive.c
+++ b/lib/utils/i2c/fdt_i2c_sifive.c
@@ -230,8 +230,8 @@ static int sifive_i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
 	return 0;
 }
 
-static int sifive_i2c_init(void *fdt, int nodeoff,
-			    const struct fdt_match *match)
+static int sifive_i2c_init(const void *fdt, int nodeoff,
+			   const struct fdt_match *match)
 {
 	int rc;
 	struct sifive_i2c_adapter *adapter;
-- 
2.45.1


