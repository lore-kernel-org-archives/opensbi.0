From: Inochi Amaoto <inochiama@outlook.com>
Date: Wed, 27 Dec 2023 08:46:11 +0800
Subject: [PATCH] lib: utils/timer: mtimer: only use regname for aclint
Message-ID: <IA1PR20MB4953EB763D76C7E83BDBB3B9BB9FA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The parser will fail if the timer is clint timer and has regname
property. As the regname is only meaningful for aclint, it is more
robust to only check regname for aclint timer.

Fixes: 6112d58 ("lib: utils/fdt: Allow to use reg-names when parsing ACLINT")
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 include/sbi_utils/fdt/fdt_helper.h | 3 ++-
 lib/utils/fdt/fdt_helper.c         | 5 +++--
 lib/utils/ipi/fdt_ipi_mswi.c       | 2 +-
 lib/utils/timer/fdt_timer_mtimer.c | 5 +++--
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 430d818..ab4a80f 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -99,7 +99,8 @@ int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic);
 
 int fdt_parse_plic(void *fdt, struct plic_data *plic, const char *compat);
 
-int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
+int fdt_parse_aclint_node(void *fdt, int nodeoffset,
+			  bool for_timer, bool allow_regname,
 			  unsigned long *out_addr1, unsigned long *out_size1,
 			  unsigned long *out_addr2, unsigned long *out_size2,
 			  u32 *out_first_hartid, u32 *out_hart_count);
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index e50f4d8..a0e93b9 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -957,7 +957,8 @@ static int fdt_get_aclint_addr_size(void *fdt, int nodeoffset,
 	return 0;
 }
 
-int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
+int fdt_parse_aclint_node(void *fdt, int nodeoffset,
+			  bool for_timer, bool allow_regname,
 			  unsigned long *out_addr1, unsigned long *out_size1,
 			  unsigned long *out_addr2, unsigned long *out_size2,
 			  u32 *out_first_hartid, u32 *out_hart_count)
@@ -972,7 +973,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 	    !out_first_hartid || !out_hart_count)
 		return SBI_EINVAL;
 
-	if (for_timer && out_addr2 && out_size2 &&
+	if (for_timer && allow_regname && out_addr2 && out_size2 &&
 	    fdt_getprop(fdt, nodeoffset, "reg-names", NULL))
 		rc = fdt_get_aclint_addr_size_by_name(fdt, nodeoffset,
 						      out_addr1, out_size1,
diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index 5432db6..a709abe 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -24,7 +24,7 @@ static int ipi_mswi_cold_init(void *fdt, int nodeoff,
 	if (!ms)
 		return SBI_ENOMEM;
 
-	rc = fdt_parse_aclint_node(fdt, nodeoff, false,
+	rc = fdt_parse_aclint_node(fdt, nodeoff, false, false,
 				   &ms->addr, &ms->size, NULL, NULL,
 				   &ms->first_hartid, &ms->hart_count);
 	if (rc) {
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 3ba6b8f..9e27e3a 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -38,13 +38,14 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 	struct timer_mtimer_node *mtn, *n;
 	struct aclint_mtimer_data *mt;
 	const struct timer_mtimer_quirks *quirks = match->data;
+	bool is_clint = quirks && quirks->is_clint;
 
 	mtn = sbi_zalloc(sizeof(*mtn));
 	if (!mtn)
 		return SBI_ENOMEM;
 	mt = &mtn->data;
 
-	rc = fdt_parse_aclint_node(fdt, nodeoff, true,
+	rc = fdt_parse_aclint_node(fdt, nodeoff, true, !is_clint,
 				   &addr[0], &size[0], &addr[1], &size[1],
 				   &mt->first_hartid, &mt->hart_count);
 	if (rc) {
@@ -60,7 +61,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 		return rc;
 	}
 
-	if (quirks && quirks->is_clint) { /* SiFive CLINT */
+	if (is_clint) { /* SiFive CLINT */
 		/* Set CLINT addresses */
 		mt->mtimecmp_addr = addr[0] + ACLINT_DEFAULT_MTIMECMP_OFFSET;
 		mt->mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE;
-- 
2.43.0


