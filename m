From: Xiang W <wxjstz@126.com>
Date: Thu, 31 Aug 2023 11:39:30 +0800
Subject: [RFC PATCH 2/2] lib: sbi: improve sbi_hartmask
In-Reply-To: <20230831033930.694299-1-wxjstz@126.com>
References: <20230831033930.694299-1-wxjstz@126.com>
Message-ID: <20230831033930.694299-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The original sbi_hartmask stores the hartid, instead it stores the
hart index. this allows better utilization of the hartmask and avoids
useless gaps. And it can also cope with some strange platforms, for
example, there is a hart with a particularly large id.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_hartmask.h | 40 ++++++++++++++++++++++++++++----------
 lib/sbi/sbi_domain.c       | 26 +++++++++----------------
 lib/sbi/sbi_init.c         |  2 +-
 lib/sbi/sbi_ipi.c          |  4 ++--
 lib/sbi/sbi_system.c       |  4 ++--
 lib/sbi/sbi_tlb.c          |  4 ++--
 6 files changed, 46 insertions(+), 34 deletions(-)

diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index f1cef0c..1ba7549 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -11,6 +11,7 @@
 #define __SBI_HARTMASK_H__
 
 #include <sbi/sbi_bitmap.h>
+#include <sbi/sbi_platform.h>
 
 /**
  * Maximum number of bits in a hartmask
@@ -32,7 +33,11 @@ struct sbi_hartmask {
 
 /** Initialize hartmask to zero except a particular HART id */
 #define SBI_HARTMASK_INIT_EXCEPT(__m, __h)	\
-	bitmap_zero_except(((__m)->bits), (__h), SBI_HARTMASK_MAX_BITS)
+	do { \
+		u32 __i = sbi_platform_hart_index( \
+			sbi_platform_ptr(sbi_scratch_thishart_ptr()), __h); \
+		bitmap_zero_except(((__m)->bits), (__i), SBI_HARTMASK_MAX_BITS); \
+	} while(0)
 
 /**
  * Get underlying bitmap of hartmask
@@ -47,8 +52,10 @@ struct sbi_hartmask {
  */
 static inline void sbi_hartmask_set_hart(u32 h, struct sbi_hartmask *m)
 {
-	if (h < SBI_HARTMASK_MAX_BITS)
-		__set_bit(h, m->bits);
+	u32 i = sbi_platform_hart_index(
+		sbi_platform_ptr(sbi_scratch_thishart_ptr()), h);
+	if (i < SBI_HARTMASK_MAX_BITS)
+		__set_bit(i, m->bits);
 }
 
 /**
@@ -58,8 +65,10 @@ static inline void sbi_hartmask_set_hart(u32 h, struct sbi_hartmask *m)
  */
 static inline void sbi_hartmask_clear_hart(u32 h, struct sbi_hartmask *m)
 {
-	if (h < SBI_HARTMASK_MAX_BITS)
-		__clear_bit(h, m->bits);
+	u32 i = sbi_platform_hart_index(
+		sbi_platform_ptr(sbi_scratch_thishart_ptr()), h);
+	if (i < SBI_HARTMASK_MAX_BITS)
+		__clear_bit(i, m->bits);
 }
 
 /**
@@ -69,8 +78,10 @@ static inline void sbi_hartmask_clear_hart(u32 h, struct sbi_hartmask *m)
  */
 static inline int sbi_hartmask_test_hart(u32 h, const struct sbi_hartmask *m)
 {
-	if (h < SBI_HARTMASK_MAX_BITS)
-		return __test_bit(h, m->bits);
+	u32 i = sbi_platform_hart_index(
+		sbi_platform_ptr(sbi_scratch_thishart_ptr()), h);
+	if (i < SBI_HARTMASK_MAX_BITS)
+		return __test_bit(i, m->bits);
 	return 0;
 }
 
@@ -134,8 +145,17 @@ static inline void sbi_hartmask_xor(struct sbi_hartmask *dstp,
 		   sbi_hartmask_bits(src2p), SBI_HARTMASK_MAX_BITS);
 }
 
-/** Iterate over each HART in hartmask */
-#define sbi_hartmask_for_each_hart(__h, __m)	\
-	for_each_set_bit(__h, (__m)->bits, SBI_HARTMASK_MAX_BITS)
+/**
+ * Iterate over each HART in hartmask
+ * __h hart id
+ * __i hart index
+ * __m hartmask
+*/
+#define sbi_hartmask_for_each_hart(__h,__i, __m) \
+	for((__i) = find_first_bit((__m)->bits, SBI_HARTMASK_MAX_BITS); \
+		(__h) = sbi_platform_hart_index2id(\
+			sbi_platform_ptr(sbi_scratch_thishart_ptr()),(__i)), \
+		(__i) < SBI_HARTMASK_MAX_BITS; \
+		(__i) = find_next_bit((__m)->bits, SBI_HARTMASK_MAX_BITS, (__i) + 1))
 
 #endif
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index acd0f74..7495359 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -73,18 +73,10 @@ bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
 ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 				       ulong hbase)
 {
-	ulong ret, bword, boff;
-
-	if (!dom)
-		return 0;
-
-	bword = BIT_WORD(hbase);
-	boff = BIT_WORD_OFFSET(hbase);
-
-	ret = sbi_hartmask_bits(&dom->assigned_harts)[bword++] >> boff;
-	if (boff && bword < BIT_WORD(SBI_HARTMASK_MAX_BITS)) {
-		ret |= (sbi_hartmask_bits(&dom->assigned_harts)[bword] &
-			(BIT(boff) - 1UL)) << (BITS_PER_LONG - boff);
+	ulong ret = 0;
+	for (int i = 0; i < 8 * sizeof(ret); i++) {
+		if (sbi_domain_is_assigned_hart(dom, hbase + i))
+			ret |= 1 << i;
 	}
 
 	return ret;
@@ -276,7 +268,7 @@ static int sanitize_domain(const struct sbi_platform *plat,
 			   __func__, dom->name);
 		return SBI_EINVAL;
 	}
-	sbi_hartmask_for_each_hart(i, dom->possible_harts) {
+	sbi_hartmask_for_each_hart(i, j, dom->possible_harts) {
 		if (sbi_platform_hart_invalid(plat, i)) {
 			sbi_printf("%s: %s possible HART mask has invalid "
 				   "hart %d\n", __func__, dom->name, i);
@@ -400,7 +392,7 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 
 void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 {
-	u32 i, k;
+	u32 i, j, k;
 	unsigned long rstart, rend;
 	struct sbi_domain_memregion *reg;
 
@@ -412,7 +404,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 
 	k = 0;
 	sbi_printf("Domain%d HARTs       %s: ", dom->index, suffix);
-	sbi_hartmask_for_each_hart(i, dom->possible_harts)
+	sbi_hartmask_for_each_hart(i, j, dom->possible_harts)
 		sbi_printf("%s%d%s", (k++) ? "," : "",
 			   i, sbi_domain_is_assigned_hart(dom, i) ? "*" : "");
 	sbi_printf("\n");
@@ -495,7 +487,7 @@ void sbi_domain_dump_all(const char *suffix)
 int sbi_domain_register(struct sbi_domain *dom,
 			const struct sbi_hartmask *assign_mask)
 {
-	u32 i;
+	u32 i, j;
 	int rc;
 	struct sbi_domain *tdom;
 	u32 cold_hartid = current_hartid();
@@ -538,7 +530,7 @@ int sbi_domain_register(struct sbi_domain *dom,
 	sbi_hartmask_clear_all(&dom->assigned_harts);
 
 	/* Assign domain to HART if HART is a possible HART */
-	sbi_hartmask_for_each_hart(i, assign_mask) {
+	sbi_hartmask_for_each_hart(i, j, assign_mask) {
 		if (!sbi_hartmask_test_hart(i, dom->possible_harts))
 			continue;
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 35e6633..d4c18f0 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -524,7 +524,7 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 	u32 hartid			= current_hartid();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	if ((SBI_HARTMASK_MAX_BITS <= hartid) ||
+	if ((SBI_HARTMASK_MAX_BITS <= sbi_platform_hart_index(plat, hartid)) ||
 	    sbi_platform_hart_invalid(plat, hartid))
 		sbi_hart_hang();
 
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index ad09154..350dfb5 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -96,7 +96,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 {
 	int rc;
 	bool retry_needed;
-	ulong i, m;
+	ulong i, j, m;
 	struct sbi_hartmask target_mask = {0};
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
@@ -126,7 +126,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 	/* Send IPIs */
 	do {
 		retry_needed = false;
-		sbi_hartmask_for_each_hart(i, &target_mask) {
+		sbi_hartmask_for_each_hart(i, j, &target_mask) {
 			rc = sbi_ipi_send(scratch, i, event, data);
 			if (rc == SBI_IPI_UPDATE_RETRY)
 				retry_needed = true;
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index d803ffa..1354731 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -152,7 +152,7 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 	void (*jump_warmboot)(void) = (void (*)(void))scratch->warmboot_addr;
 	unsigned int hartid = current_hartid();
 	unsigned long prev_mode;
-	unsigned long i;
+	unsigned long i, j;
 	int ret;
 
 	if (!dom || !dom->system_suspend_allowed)
@@ -170,7 +170,7 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 	if (prev_mode != PRV_S && prev_mode != PRV_U)
 		return SBI_EFAIL;
 
-	sbi_hartmask_for_each_hart(i, &dom->assigned_harts) {
+	sbi_hartmask_for_each_hart(i, j, &dom->assigned_harts) {
 		if (i == hartid)
 			continue;
 		if (__sbi_hsm_hart_get_state(i) != SBI_HSM_STATE_STOPPED)
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 26a87f3..f8a1aab 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -213,13 +213,13 @@ static void tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data)
 
 static void tlb_entry_process(struct sbi_tlb_info *tinfo)
 {
-	u32 rhartid;
+	u32 rhartid, rindex;
 	struct sbi_scratch *rscratch = NULL;
 	atomic_t *rtlb_sync = NULL;
 
 	tinfo->local_fn(tinfo);
 
-	sbi_hartmask_for_each_hart(rhartid, &tinfo->smask) {
+	sbi_hartmask_for_each_hart(rhartid, rindex, &tinfo->smask) {
 		rscratch = sbi_hartid_to_scratch(rhartid);
 		if (!rscratch)
 			continue;
-- 
2.40.1


