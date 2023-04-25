From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Apr 2023 18:02:24 +0530
Subject: [PATCH 11/17] lib: utils/timer: Use heap in ACLINT MTIMER driver
In-Reply-To: <20230425123230.3943447-1-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
Message-ID: <20230425123230.3943447-12-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's use heap allocation in ACLINT MTIMER driver instead of using
a fixed size global array.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/timer/fdt_timer_mtimer.c | 47 +++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 5244f98..9eaa11d 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -9,44 +9,54 @@
 
 #include <libfdt.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_list.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/timer/fdt_timer.h>
 #include <sbi_utils/timer/aclint_mtimer.h>
 
-#define MTIMER_MAX_NR			16
-
 struct timer_mtimer_quirks {
 	unsigned int	mtime_offset;
 	bool		has_64bit_mmio;
 	bool		without_mtime;
 };
 
-static unsigned long mtimer_count = 0;
-static struct aclint_mtimer_data mtimer[MTIMER_MAX_NR];
+struct timer_mtimer_node {
+	struct sbi_dlist head;
+	struct aclint_mtimer_data data;
+};
+static SBI_LIST_HEAD(mtn_list);
+
 static struct aclint_mtimer_data *mt_reference = NULL;
 
 static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 				  const struct fdt_match *match)
 {
-	int i, rc;
+	int rc;
 	unsigned long addr[2], size[2];
+	struct timer_mtimer_node *mtn, *n;
 	struct aclint_mtimer_data *mt;
 
-	if (MTIMER_MAX_NR <= mtimer_count)
-		return SBI_ENOSPC;
-	mt = &mtimer[mtimer_count];
+	mtn = sbi_zalloc(sizeof(*mtn));
+	if (!mtn)
+		return SBI_ENOMEM;
+	mt = &mtn->data;
 
 	rc = fdt_parse_aclint_node(fdt, nodeoff, true,
 				   &addr[0], &size[0], &addr[1], &size[1],
 				   &mt->first_hartid, &mt->hart_count);
-	if (rc)
+	if (rc) {
+		sbi_free(mtn);
 		return rc;
+	}
 	mt->has_64bit_mmio = true;
 	mt->has_shared_mtime = false;
 
 	rc = fdt_parse_timebase_frequency(fdt, &mt->mtime_freq);
-	if (rc)
+	if (rc) {
+		sbi_free(mtn);
 		return rc;
+	}
 
 	if (match->data) { /* SiFive CLINT */
 		const struct timer_mtimer_quirks *quirks = match->data;
@@ -77,8 +87,8 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 	/* Check if MTIMER device has shared MTIME address */
 	if (mt->mtime_size) {
 		mt->has_shared_mtime = false;
-		for (i = 0; i < mtimer_count; i++) {
-			if (mtimer[i].mtime_addr == mt->mtime_addr) {
+		sbi_list_for_each_entry(n, &mtn_list, head) {
+			if (n->data.mtime_addr == mt->mtime_addr) {
 				mt->has_shared_mtime = true;
 				break;
 			}
@@ -90,8 +100,10 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 
 	/* Initialize the MTIMER device */
 	rc = aclint_mtimer_cold_init(mt, mt_reference);
-	if (rc)
+	if (rc) {
+		sbi_free(mtn);
 		return rc;
+	}
 
 	/*
 	 * Select first MTIMER device with no associated HARTs as our
@@ -106,16 +118,17 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 		 * Set reference for already propbed MTIMER devices
 		 * with non-shared MTIME
 		 */
-		for (i = 0; i < mtimer_count; i++)
-			if (!mtimer[i].has_shared_mtime)
-				aclint_mtimer_set_reference(&mtimer[i], mt);
+		sbi_list_for_each_entry(n, &mtn_list, head) {
+			if (!n->data.has_shared_mtime)
+				aclint_mtimer_set_reference(&n->data, mt);
+		}
 	}
 
 	/* Explicitly sync-up MTIMER devices not associated with any HARTs */
 	if (!mt->hart_count)
 		aclint_mtimer_sync(mt);
 
-	mtimer_count++;
+	sbi_list_add_tail(&mtn->head, &mtn_list);
 	return 0;
 }
 
-- 
2.34.1


