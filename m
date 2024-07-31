From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:47 -0700
Subject: [PATCH 06/16] lib: utils/ipi: Constify FDT pointers in parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-7-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/ipi/fdt_ipi.h | 2 +-
 lib/utils/ipi/fdt_ipi.c         | 2 +-
 lib/utils/ipi/fdt_ipi_mswi.c    | 2 +-
 lib/utils/ipi/fdt_ipi_plicsw.c  | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sbi_utils/ipi/fdt_ipi.h b/include/sbi_utils/ipi/fdt_ipi.h
index 1dd9062d..c6245201 100644
--- a/include/sbi_utils/ipi/fdt_ipi.h
+++ b/include/sbi_utils/ipi/fdt_ipi.h
@@ -16,7 +16,7 @@
 
 struct fdt_ipi {
 	const struct fdt_match *match_table;
-	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
 	int (*warm_init)(void);
 	void (*exit)(void);
 };
diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
index 0b75093e..959cf57d 100644
--- a/lib/utils/ipi/fdt_ipi.c
+++ b/lib/utils/ipi/fdt_ipi.c
@@ -36,7 +36,7 @@ static int fdt_ipi_cold_init(void)
 	int pos, noff, rc;
 	struct fdt_ipi *drv;
 	const struct fdt_match *match;
-	void *fdt = fdt_get_address();
+	const void *fdt = fdt_get_address();
 
 	for (pos = 0; pos < fdt_ipi_drivers_size; pos++) {
 		drv = fdt_ipi_drivers[pos];
diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index a709abe1..c78dead1 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -13,7 +13,7 @@
 #include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
 
-static int ipi_mswi_cold_init(void *fdt, int nodeoff,
+static int ipi_mswi_cold_init(const void *fdt, int nodeoff,
 			      const struct fdt_match *match)
 {
 	int rc;
diff --git a/lib/utils/ipi/fdt_ipi_plicsw.c b/lib/utils/ipi/fdt_ipi_plicsw.c
index bf29bfc1..32885745 100644
--- a/lib/utils/ipi/fdt_ipi_plicsw.c
+++ b/lib/utils/ipi/fdt_ipi_plicsw.c
@@ -17,8 +17,8 @@
 
 extern struct plicsw_data plicsw;
 
-int fdt_plicsw_cold_ipi_init(void *fdt, int nodeoff,
-				const struct fdt_match *match)
+int fdt_plicsw_cold_ipi_init(const void *fdt, int nodeoff,
+			     const struct fdt_match *match)
 {
 	int rc;
 
-- 
2.45.1


