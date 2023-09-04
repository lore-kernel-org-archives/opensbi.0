From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  4 Sep 2023 09:33:45 +0530
Subject: [PATCH 7/8] lib: sbi: Maximize the use of HART index in sbi_domain
In-Reply-To: <20230904040346.118604-1-apatel@ventanamicro.com>
References: <20230904040346.118604-1-apatel@ventanamicro.com>
Message-ID: <20230904040346.118604-8-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let us maximize the use of HART index in sbi_domain because hartindex
based hartmask access and sbi_scratch lookup is faster.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_domain.h |  6 ++---
 lib/sbi/sbi_domain.c     | 56 +++++++++++++++++++++-------------------
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index da2a65a..e10daff 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -201,12 +201,12 @@ struct sbi_domain {
 /** The root domain instance */
 extern struct sbi_domain root;
 
-/** Get pointer to sbi_domain from HART id */
-struct sbi_domain *sbi_hartid_to_domain(u32 hartid);
+/** Get pointer to sbi_domain from HART index */
+struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex);
 
 /** Get pointer to sbi_domain for current HART */
 #define sbi_domain_thishart_ptr() \
-	sbi_hartid_to_domain(current_hartid())
+	sbi_hartindex_to_domain(sbi_hartid_to_hartindex(current_hartid()))
 
 /** Index to domain table */
 extern struct sbi_domain *domidx_to_domain_table[];
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index ee3a5e9..b1f485d 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -40,22 +40,22 @@ struct sbi_domain root = {
 
 static unsigned long domain_hart_ptr_offset;
 
-struct sbi_domain *sbi_hartid_to_domain(u32 hartid)
+struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
 
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch || !domain_hart_ptr_offset)
 		return NULL;
 
 	return sbi_scratch_read_type(scratch, void *, domain_hart_ptr_offset);
 }
 
-static void update_hartid_to_domain(u32 hartid, struct sbi_domain *dom)
+static void update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
 {
 	struct sbi_scratch *scratch;
 
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch)
 		return;
 
@@ -268,10 +268,11 @@ static int sanitize_domain(const struct sbi_platform *plat,
 			   __func__, dom->name);
 		return SBI_EINVAL;
 	}
-	sbi_hartmask_for_each_hart(i, j, dom->possible_harts) {
-		if (!sbi_hartid_valid(i)) {
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+		if (!sbi_hartindex_valid(i)) {
 			sbi_printf("%s: %s possible HART mask has invalid "
-				   "hart %d\n", __func__, dom->name, i);
+				   "hart %d\n", __func__,
+				   dom->name, sbi_hartindex_to_hartid(i));
 			return SBI_EINVAL;
 		}
 	}
@@ -404,9 +405,11 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 
 	k = 0;
 	sbi_printf("Domain%d HARTs       %s: ", dom->index, suffix);
-	sbi_hartmask_for_each_hart(i, j, dom->possible_harts)
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
+		j = sbi_hartindex_to_hartid(i);
 		sbi_printf("%s%d%s", (k++) ? "," : "",
-			   i, sbi_domain_is_assigned_hart(dom, i) ? "*" : "");
+			   j, sbi_domain_is_assigned_hart(dom, j) ? "*" : "");
+	}
 	sbi_printf("\n");
 
 	i = 0;
@@ -487,7 +490,7 @@ void sbi_domain_dump_all(const char *suffix)
 int sbi_domain_register(struct sbi_domain *dom,
 			const struct sbi_hartmask *assign_mask)
 {
-	u32 i, j;
+	u32 i;
 	int rc;
 	struct sbi_domain *tdom;
 	u32 cold_hartid = current_hartid();
@@ -530,22 +533,22 @@ int sbi_domain_register(struct sbi_domain *dom,
 	sbi_hartmask_clear_all(&dom->assigned_harts);
 
 	/* Assign domain to HART if HART is a possible HART */
-	sbi_hartmask_for_each_hart(i, j, assign_mask) {
-		if (!sbi_hartmask_test_hartid(i, dom->possible_harts))
+	sbi_hartmask_for_each_hartindex(i, assign_mask) {
+		if (!sbi_hartmask_test_hartindex(i, dom->possible_harts))
 			continue;
 
-		tdom = sbi_hartid_to_domain(i);
+		tdom = sbi_hartindex_to_domain(i);
 		if (tdom)
-			sbi_hartmask_clear_hartid(i,
+			sbi_hartmask_clear_hartindex(i,
 					&tdom->assigned_harts);
-		update_hartid_to_domain(i, dom);
-		sbi_hartmask_set_hartid(i, &dom->assigned_harts);
+		update_hartindex_to_domain(i, dom);
+		sbi_hartmask_set_hartindex(i, &dom->assigned_harts);
 
 		/*
 		 * If cold boot HART is assigned to this domain then
 		 * override boot HART of this domain.
 		 */
-		if (i == cold_hartid &&
+		if (sbi_hartindex_to_hartid(i) == cold_hartid &&
 		    dom->boot_hartid != cold_hartid) {
 			sbi_printf("Domain%d Boot HARTID forced to"
 				   " %d\n", dom->index, cold_hartid);
@@ -665,36 +668,37 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 
 	/* Startup boot HART of domains */
 	sbi_domain_for_each(i, dom) {
-		/* Domain boot HART */
-		dhart = dom->boot_hartid;
+		/* Domain boot HART index */
+		dhart = sbi_hartid_to_hartindex(dom->boot_hartid);
 
 		/* Ignore of boot HART is off limits */
-		if (SBI_HARTMASK_MAX_BITS <= dhart)
+		if (!sbi_hartindex_valid(dhart))
 			continue;
 
 		/* Ignore if boot HART not possible for this domain */
-		if (!sbi_hartmask_test_hartid(dhart, dom->possible_harts))
+		if (!sbi_hartmask_test_hartindex(dhart, dom->possible_harts))
 			continue;
 
 		/* Ignore if boot HART assigned different domain */
-		if (sbi_hartid_to_domain(dhart) != dom ||
-		    !sbi_hartmask_test_hartid(dhart, &dom->assigned_harts))
+		if (sbi_hartindex_to_domain(dhart) != dom ||
+		    !sbi_hartmask_test_hartindex(dhart, &dom->assigned_harts))
 			continue;
 
 		/* Startup boot HART of domain */
-		if (dhart == cold_hartid) {
+		if (dom->boot_hartid == cold_hartid) {
 			scratch->next_addr = dom->next_addr;
 			scratch->next_mode = dom->next_mode;
 			scratch->next_arg1 = dom->next_arg1;
 		} else {
-			rc = sbi_hsm_hart_start(scratch, NULL, dhart,
+			rc = sbi_hsm_hart_start(scratch, NULL,
+						dom->boot_hartid,
 						dom->next_addr,
 						dom->next_mode,
 						dom->next_arg1);
 			if (rc) {
 				sbi_printf("%s: failed to start boot HART %d"
 					   " for %s (error %d)\n", __func__,
-					   dhart, dom->name, rc);
+					   dom->boot_hartid, dom->name, rc);
 				return rc;
 			}
 		}
-- 
2.34.1


