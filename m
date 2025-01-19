From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 11:03:56 -0800
Subject: [PATCH 2/3] lib: utils/fdt: Remove fdt_find_match()
In-Reply-To: <20250119190435.3603452-1-samuel.holland@sifive.com>
References: <20250119190435.3603452-1-samuel.holland@sifive.com>
Message-ID: <20250119190435.3603452-3-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that all drivers are using the fdt_driver functions for
initialization, this function is unused and can be removed.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/fdt/fdt_helper.h |  4 ----
 lib/utils/fdt/fdt_helper.c         | 23 -----------------------
 2 files changed, 27 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 7329b84c..2381f3df 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -37,10 +37,6 @@ struct platform_uart_data {
 const struct fdt_match *fdt_match_node(const void *fdt, int nodeoff,
 				       const struct fdt_match *match_table);
 
-int fdt_find_match(const void *fdt, int startoff,
-		   const struct fdt_match *match_table,
-		   const struct fdt_match **out_match);
-
 int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args);
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index cb350e5a..07492009 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -52,29 +52,6 @@ const struct fdt_match *fdt_match_node(const void *fdt, int nodeoff,
 	return NULL;
 }
 
-int fdt_find_match(const void *fdt, int startoff,
-		   const struct fdt_match *match_table,
-		   const struct fdt_match **out_match)
-{
-	int nodeoff;
-
-	if (!fdt || !match_table)
-		return SBI_ENODEV;
-
-	while (match_table->compatible) {
-		nodeoff = fdt_node_offset_by_compatible(fdt, startoff,
-						match_table->compatible);
-		if (nodeoff >= 0) {
-			if (out_match)
-				*out_match = match_table;
-			return nodeoff;
-		}
-		match_table++;
-	}
-
-	return SBI_ENODEV;
-}
-
 int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args)
-- 
2.47.0


