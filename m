From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Tue, 16 Apr 2024 13:02:13 +0800
Subject: [PATCH v3] sbi: sbi_domain_context: Add spinlock for updating domain assigned_harts
Message-ID: <20240416050213.665461-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Alvin Chang <alvinga@andestech.com>

Add spinlock protection to avoid race condition on assigned_harts
during domain context switching. Also, rename/add variables for
accessing the corresponding domain of target/current context.

Signed-off-by: Alvin Chang <alvinga@andestech.com>
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 include/sbi/sbi_domain.h     |  3 +++
 lib/sbi/sbi_domain.c         |  3 +++
 lib/sbi/sbi_domain_context.c | 27 +++++++++++++++++----------
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 5432dacb..02765777 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -10,6 +10,7 @@
 #ifndef __SBI_DOMAIN_H__
 #define __SBI_DOMAIN_H__
 
+#include <sbi/riscv_locks.h>
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_domain_context.h>
@@ -174,6 +175,8 @@ struct sbi_domain {
 	 * in the coldboot path
 	 */
 	struct sbi_hartmask assigned_harts;
+	/** Spinlock for accessing assigned_harts */
+	spinlock_t assigned_harts_lock;
 	/** Name of this domain */
 	char name[64];
 	/** Possible HARTs in this domain */
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 50749f15..51770d8d 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -555,6 +555,9 @@ int sbi_domain_register(struct sbi_domain *dom,
 	dom->index = domain_count++;
 	domidx_to_domain_table[dom->index] = dom;
 
+	/* Initialize spinlock for dom->assigned_harts */
+	SPIN_LOCK_INIT(dom->assigned_harts_lock);
+
 	/* Clear assigned HARTs of domain */
 	sbi_hartmask_clear_all(&dom->assigned_harts);
 
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index a41dc8c7..a3d3988d 100755
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -26,18 +26,23 @@
 static void switch_to_next_domain_context(struct sbi_context *ctx,
 					  struct sbi_context *dom_ctx)
 {
-	u32 hartindex;
+	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
 	struct sbi_trap_regs *trap_regs;
-	struct sbi_domain *dom = dom_ctx->dom;
+	struct sbi_domain *current_dom = ctx->dom;
+	struct sbi_domain *target_dom = dom_ctx->dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	/* Assign current hart to target domain */
-	hartindex = sbi_hartid_to_hartindex(current_hartid());
-	sbi_hartmask_clear_hartindex(
-		hartindex, &sbi_domain_thishart_ptr()->assigned_harts);
-	sbi_update_hartindex_to_domain(hartindex, dom);
-	sbi_hartmask_set_hartindex(hartindex, &dom->assigned_harts);
+	spin_lock(&current_dom->assigned_harts_lock);
+	sbi_hartmask_clear_hartindex(hartindex, &current_dom->assigned_harts);
+	spin_unlock(&current_dom->assigned_harts_lock);
+
+	sbi_update_hartindex_to_domain(hartindex, target_dom);
+
+	spin_lock(&target_dom->assigned_harts_lock);
+	sbi_hartmask_set_hartindex(hartindex, &target_dom->assigned_harts);
+	spin_unlock(&target_dom->assigned_harts_lock);
 
 	/* Reconfigure PMP settings for the new domain */
 	for (int i = 0; i < pmp_count; i++) {
@@ -71,9 +76,11 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
 	/* If target domain context is not initialized or runnable */
 	if (!dom_ctx->initialized) {
 		/* Startup boot HART of target domain */
-		if (current_hartid() == dom->boot_hartid)
-			sbi_hart_switch_mode(dom->boot_hartid, dom->next_arg1,
-					     dom->next_addr, dom->next_mode,
+		if (current_hartid() == target_dom->boot_hartid)
+			sbi_hart_switch_mode(target_dom->boot_hartid,
+					     target_dom->next_arg1,
+					     target_dom->next_addr,
+					     target_dom->next_mode,
 					     false);
 		else
 			sbi_hsm_hart_stop(scratch, true);
-- 
2.34.1


