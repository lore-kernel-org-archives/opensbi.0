From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:07 -0700
Subject: [PATCH 03/12] lib: sbi: Use current_hartindex() where possible
In-Reply-To: <20240830154929.3971790-1-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com>
Message-ID: <20240830154929.3971790-4-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This avoids calls to the expensive sbi_hartid_to_hartindex() function
and also makes the firmware smaller.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_domain.h         | 2 +-
 include/sbi/sbi_domain_context.h | 7 +++----
 lib/sbi/sbi_domain_context.c     | 6 +++---
 lib/sbi/sbi_hsm.c                | 2 +-
 lib/sbi/sbi_ipi.c                | 2 +-
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index a6e99c63..2c905941 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -211,7 +211,7 @@ void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom);
 
 /** Get pointer to sbi_domain for current HART */
 #define sbi_domain_thishart_ptr() \
-	sbi_hartindex_to_domain(sbi_hartid_to_hartindex(current_hartid()))
+	sbi_hartindex_to_domain(current_hartindex())
 
 /** Index to domain table */
 extern struct sbi_domain *domidx_to_domain_table[];
diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
index 0d25884a..a92f338b 100755
--- a/include/sbi/sbi_domain_context.h
+++ b/include/sbi/sbi_domain_context.h
@@ -52,10 +52,9 @@ struct sbi_context {
 	(__d)->hartindex_to_context_table[__hartindex]
 
 /** Macro to obtain the current hart's context pointer */
-#define sbi_domain_context_thishart_ptr()                  \
-	sbi_hartindex_to_domain_context(                   \
-		sbi_hartid_to_hartindex(current_hartid()), \
-		sbi_domain_thishart_ptr())
+#define sbi_domain_context_thishart_ptr() \
+	sbi_hartindex_to_domain_context(current_hartindex(), \
+					sbi_domain_thishart_ptr())
 
 /**
  * Enter a specific domain context synchronously
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 49a2f769..33cb6ed7 100755
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -26,7 +26,7 @@
 static void switch_to_next_domain_context(struct sbi_context *ctx,
 					  struct sbi_context *dom_ctx)
 {
-	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
+	u32 hartindex = current_hartindex();
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom = ctx->dom;
 	struct sbi_domain *target_dom = dom_ctx->dom;
@@ -91,7 +91,7 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
 {
 	struct sbi_context *ctx = sbi_domain_context_thishart_ptr();
 	struct sbi_context *dom_ctx = sbi_hartindex_to_domain_context(
-		sbi_hartid_to_hartindex(current_hartid()), dom);
+		current_hartindex(), dom);
 
 	/* Validate the domain context existence */
 	if (!dom_ctx)
@@ -107,7 +107,7 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
 
 int sbi_domain_context_exit(void)
 {
-	u32 i, hartindex = sbi_hartid_to_hartindex(current_hartid());
+	u32 i, hartindex = current_hartindex();
 	struct sbi_domain *dom;
 	struct sbi_context *ctx = sbi_domain_context_thishart_ptr();
 	struct sbi_context *dom_ctx, *tmp;
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 3706acfb..ab11b119 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -261,7 +261,7 @@ int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 			hdata = sbi_scratch_offset_ptr(rscratch,
 						       hart_data_offset);
 			ATOMIC_INIT(&hdata->state,
-				    (sbi_hartindex_to_hartid(i) == hartid) ?
+				    (i == current_hartindex()) ?
 				    SBI_HSM_STATE_START_PENDING :
 				    SBI_HSM_STATE_STOPPED);
 			ATOMIC_INIT(&hdata->start_ticket, 0);
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 048aaa66..505aafd8 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -233,7 +233,7 @@ void sbi_ipi_process(void)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct sbi_ipi_data *ipi_data =
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
-	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
+	u32 hartindex = current_hartindex();
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
 	sbi_ipi_raw_clear(hartindex);
-- 
2.45.1


