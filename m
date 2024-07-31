From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:49 -0700
Subject: [PATCH 08/16] lib: utils/regmap: Constify FDT pointers in parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-9-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/regmap/fdt_regmap.h | 6 +++---
 lib/utils/regmap/fdt_regmap.c         | 8 ++++----
 lib/utils/regmap/fdt_regmap_syscon.c  | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sbi_utils/regmap/fdt_regmap.h b/include/sbi_utils/regmap/fdt_regmap.h
index 403dd7d4..86e72442 100644
--- a/include/sbi_utils/regmap/fdt_regmap.h
+++ b/include/sbi_utils/regmap/fdt_regmap.h
@@ -17,15 +17,15 @@ struct fdt_phandle_args;
 /** FDT based regmap driver */
 struct fdt_regmap {
 	const struct fdt_match *match_table;
-	int (*init)(void *fdt, int nodeoff, u32 phandle,
+	int (*init)(const void *fdt, int nodeoff, u32 phandle,
 		    const struct fdt_match *match);
 };
 
 /** Get regmap instance based on phandle */
-int fdt_regmap_get_by_phandle(void *fdt, u32 phandle,
+int fdt_regmap_get_by_phandle(const void *fdt, u32 phandle,
 			      struct regmap **out_rmap);
 
 /** Get regmap instance based on "regmap" property of the specified DT node */
-int fdt_regmap_get(void *fdt, int nodeoff, struct regmap **out_rmap);
+int fdt_regmap_get(const void *fdt, int nodeoff, struct regmap **out_rmap);
 
 #endif
diff --git a/lib/utils/regmap/fdt_regmap.c b/lib/utils/regmap/fdt_regmap.c
index fffac1de..f02d2f07 100644
--- a/lib/utils/regmap/fdt_regmap.c
+++ b/lib/utils/regmap/fdt_regmap.c
@@ -16,7 +16,7 @@
 extern struct fdt_regmap *fdt_regmap_drivers[];
 extern unsigned long fdt_regmap_drivers_size;
 
-static int fdt_regmap_init(void *fdt, int nodeoff, u32 phandle)
+static int fdt_regmap_init(const void *fdt, int nodeoff, u32 phandle)
 {
 	int pos, rc;
 	struct fdt_regmap *drv;
@@ -39,7 +39,7 @@ static int fdt_regmap_init(void *fdt, int nodeoff, u32 phandle)
 	return SBI_ENOSYS;
 }
 
-static int fdt_regmap_find(void *fdt, int nodeoff, u32 phandle,
+static int fdt_regmap_find(const void *fdt, int nodeoff, u32 phandle,
 			   struct regmap **out_rmap)
 {
 	int rc;
@@ -63,7 +63,7 @@ static int fdt_regmap_find(void *fdt, int nodeoff, u32 phandle,
 	return 0;
 }
 
-int fdt_regmap_get_by_phandle(void *fdt, u32 phandle,
+int fdt_regmap_get_by_phandle(const void *fdt, u32 phandle,
 			      struct regmap **out_rmap)
 {
 	int pnodeoff;
@@ -78,7 +78,7 @@ int fdt_regmap_get_by_phandle(void *fdt, u32 phandle,
 	return fdt_regmap_find(fdt, pnodeoff, phandle, out_rmap);
 }
 
-int fdt_regmap_get(void *fdt, int nodeoff, struct regmap **out_rmap)
+int fdt_regmap_get(const void *fdt, int nodeoff, struct regmap **out_rmap)
 {
 	int len;
 	const fdt32_t *val;
diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
index d87b6e09..a95f2515 100644
--- a/lib/utils/regmap/fdt_regmap_syscon.c
+++ b/lib/utils/regmap/fdt_regmap_syscon.c
@@ -159,7 +159,7 @@ static int regmap_syscon_write_be32(struct regmap *rmap, unsigned int reg,
 	return 0;
 }
 
-static int regmap_syscon_init(void *fdt, int nodeoff, u32 phandle,
+static int regmap_syscon_init(const void *fdt, int nodeoff, u32 phandle,
 			      const struct fdt_match *match)
 {
 	struct syscon_regmap *srm;
-- 
2.45.1


