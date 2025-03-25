From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:32 -0700
Subject: [PATCH 09/10] lib: utils/fdt: Remove fdt_match_node()
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-10-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This function has been obsoleted by the fdt_driver library and is no
longer used.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/fdt/fdt_helper.h |  3 ---
 lib/utils/fdt/fdt_helper.c         | 19 -------------------
 2 files changed, 22 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index ff830025..58758808 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -34,9 +34,6 @@ struct platform_uart_data {
 	unsigned long reg_offset;
 };
 
-const struct fdt_match *fdt_match_node(const void *fdt, int nodeoff,
-				       const struct fdt_match *match_table);
-
 int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args);
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index bc357b2f..62564d28 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -33,25 +33,6 @@
 #define DEFAULT_SHAKTI_UART_FREQ		50000000
 #define DEFAULT_SHAKTI_UART_BAUD		115200
 
-const struct fdt_match *fdt_match_node(const void *fdt, int nodeoff,
-				       const struct fdt_match *match_table)
-{
-	int ret;
-
-	if (!fdt || nodeoff < 0 || !match_table)
-		return NULL;
-
-	while (match_table->compatible) {
-		ret = fdt_node_check_compatible(fdt, nodeoff,
-						match_table->compatible);
-		if (!ret)
-			return match_table;
-		match_table++;
-	}
-
-	return NULL;
-}
-
 int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args)
-- 
2.47.2


