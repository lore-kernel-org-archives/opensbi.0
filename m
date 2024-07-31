From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:52 -0700
Subject: [PATCH 11/16] lib: utils/timer: Constify FDT pointers in parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-12-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/timer/fdt_timer.h | 2 +-
 lib/utils/timer/fdt_timer.c         | 2 +-
 lib/utils/timer/fdt_timer_mtimer.c  | 2 +-
 lib/utils/timer/fdt_timer_plmt.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sbi_utils/timer/fdt_timer.h b/include/sbi_utils/timer/fdt_timer.h
index cf105fed..555ebcba 100644
--- a/include/sbi_utils/timer/fdt_timer.h
+++ b/include/sbi_utils/timer/fdt_timer.h
@@ -16,7 +16,7 @@
 
 struct fdt_timer {
 	const struct fdt_match *match_table;
-	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
 	int (*warm_init)(void);
 	void (*exit)(void);
 };
diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
index f4687304..aa0494e4 100644
--- a/lib/utils/timer/fdt_timer.c
+++ b/lib/utils/timer/fdt_timer.c
@@ -36,7 +36,7 @@ static int fdt_timer_cold_init(void)
 	int pos, noff, rc;
 	struct fdt_timer *drv;
 	const struct fdt_match *match;
-	void *fdt = fdt_get_address();
+	const void *fdt = fdt_get_address();
 
 	for (pos = 0; pos < fdt_timer_drivers_size; pos++) {
 		drv = fdt_timer_drivers[pos];
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 9e27e3ab..458e8881 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -30,7 +30,7 @@ static SBI_LIST_HEAD(mtn_list);
 
 static struct aclint_mtimer_data *mt_reference = NULL;
 
-static int timer_mtimer_cold_init(void *fdt, int nodeoff,
+static int timer_mtimer_cold_init(const void *fdt, int nodeoff,
 				  const struct fdt_match *match)
 {
 	int rc;
diff --git a/lib/utils/timer/fdt_timer_plmt.c b/lib/utils/timer/fdt_timer_plmt.c
index e8be91b9..88a42e2a 100644
--- a/lib/utils/timer/fdt_timer_plmt.c
+++ b/lib/utils/timer/fdt_timer_plmt.c
@@ -13,7 +13,7 @@
 
 extern struct plmt_data plmt;
 
-static int fdt_plmt_cold_timer_init(void *fdt, int nodeoff,
+static int fdt_plmt_cold_timer_init(const void *fdt, int nodeoff,
 				    const struct fdt_match *match)
 {
 	int rc;
-- 
2.45.1


