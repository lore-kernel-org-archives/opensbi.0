From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:43 -0700
Subject: [PATCH 02/16] lib: utils/regmap: Fix typo in comment
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-3-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Balance the quotation marks; double quotes are idiomatic here.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/regmap/fdt_regmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi_utils/regmap/fdt_regmap.h b/include/sbi_utils/regmap/fdt_regmap.h
index 0672162c..403dd7d4 100644
--- a/include/sbi_utils/regmap/fdt_regmap.h
+++ b/include/sbi_utils/regmap/fdt_regmap.h
@@ -25,7 +25,7 @@ struct fdt_regmap {
 int fdt_regmap_get_by_phandle(void *fdt, u32 phandle,
 			      struct regmap **out_rmap);
 
-/** Get regmap instance based on "regmap' property of the specified DT node */
+/** Get regmap instance based on "regmap" property of the specified DT node */
 int fdt_regmap_get(void *fdt, int nodeoff, struct regmap **out_rmap);
 
 #endif
-- 
2.45.1


