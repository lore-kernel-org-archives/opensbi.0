From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  4 Sep 2023 09:33:41 +0530
Subject: [PATCH 3/8] lib: sbi: Extend sbi_hartmask to support both hartid and hartindex
In-Reply-To: <20230904040346.118604-1-apatel@ventanamicro.com>
References: <20230904040346.118604-1-apatel@ventanamicro.com>
Message-ID: <20230904040346.118604-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xiang W <wxjstz@126.com>

Currently, the sbi_hartmask is indexed by hartid which puts a
limit on hartid to be less than SBI_HARTMASK_MAX_BITS.

We extend the sbi_hartmask implementation to use hartindex and
support updating sbi_hartmask using hartid. This removes the
limit on hartid and existing code works largely unmodified.

Signed-off-by: Xiang W <wxjstz@126.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hartmask.h | 88 ++++++++++++++++++++++++++++++--------
 lib/sbi/sbi_domain.c       | 47 ++++++++------------
 lib/sbi/sbi_init.c         |  8 ++--
 lib/sbi/sbi_ipi.c          | 10 ++---
 lib/sbi/sbi_system.c       |  4 +-
 lib/sbi/sbi_tlb.c          |  4 +-
 lib/utils/fdt/fdt_domain.c |  4 +-
 7 files changed, 105 insertions(+), 60 deletions(-)

diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index f1cef0c..105653e 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -11,6 +11,7 @@
 #define __SBI_HARTMASK_H__
 
 #include <sbi/sbi_bitmap.h>
+#include <sbi/sbi_scratch.h>
 
 /**
  * Maximum number of bits in a hartmask
@@ -32,7 +33,10 @@ struct sbi_hartmask {
 
 /** Initialize hartmask to zero except a particular HART id */
 #define SBI_HARTMASK_INIT_EXCEPT(__m, __h)	\
-	bitmap_zero_except(((__m)->bits), (__h), SBI_HARTMASK_MAX_BITS)
+	do { \
+		u32 __i = sbi_hartid_to_hartindex(__h); \
+		bitmap_zero_except(((__m)->bits), __i, SBI_HARTMASK_MAX_BITS); \
+	} while(0)
 
 /**
  * Get underlying bitmap of hartmask
@@ -41,39 +45,70 @@ struct sbi_hartmask {
 #define sbi_hartmask_bits(__m)		((__m)->bits)
 
 /**
- * Set a HART in hartmask
+ * Set a HART index in hartmask
+ * @param i HART index to set
+ * @param m the hartmask pointer
+ */
+static inline void sbi_hartmask_set_hartindex(u32 i, struct sbi_hartmask *m)
+{
+	if (i < SBI_HARTMASK_MAX_BITS)
+		__set_bit(i, m->bits);
+}
+
+/**
+ * Set a HART id in hartmask
  * @param h HART id to set
  * @param m the hartmask pointer
  */
-static inline void sbi_hartmask_set_hart(u32 h, struct sbi_hartmask *m)
+static inline void sbi_hartmask_set_hartid(u32 h, struct sbi_hartmask *m)
+{
+	sbi_hartmask_set_hartindex(sbi_hartid_to_hartindex(h), m);
+}
+
+/**
+ * Clear a HART index in hartmask
+ * @param i HART index to clear
+ * @param m the hartmask pointer
+ */
+static inline void sbi_hartmask_clear_hartindex(u32 i, struct sbi_hartmask *m)
 {
-	if (h < SBI_HARTMASK_MAX_BITS)
-		__set_bit(h, m->bits);
+	if (i < SBI_HARTMASK_MAX_BITS)
+		__clear_bit(i, m->bits);
 }
 
 /**
- * Clear a HART in hartmask
+ * Clear a HART id in hartmask
  * @param h HART id to clear
  * @param m the hartmask pointer
  */
-static inline void sbi_hartmask_clear_hart(u32 h, struct sbi_hartmask *m)
+static inline void sbi_hartmask_clear_hartid(u32 h, struct sbi_hartmask *m)
 {
-	if (h < SBI_HARTMASK_MAX_BITS)
-		__clear_bit(h, m->bits);
+	sbi_hartmask_clear_hartindex(sbi_hartid_to_hartindex(h), m);
 }
 
 /**
- * Test a HART in hartmask
- * @param h HART id to test
+ * Test a HART index in hartmask
+ * @param i HART index to test
  * @param m the hartmask pointer
  */
-static inline int sbi_hartmask_test_hart(u32 h, const struct sbi_hartmask *m)
+static inline int sbi_hartmask_test_hartindex(u32 i,
+					      const struct sbi_hartmask *m)
 {
-	if (h < SBI_HARTMASK_MAX_BITS)
-		return __test_bit(h, m->bits);
+	if (i < SBI_HARTMASK_MAX_BITS)
+		return __test_bit(i, m->bits);
 	return 0;
 }
 
+/**
+ * Test a HART id in hartmask
+ * @param h HART id to test
+ * @param m the hartmask pointer
+ */
+static inline int sbi_hartmask_test_hartid(u32 h, const struct sbi_hartmask *m)
+{
+	return sbi_hartmask_test_hartindex(sbi_hartid_to_hartindex(h), m);
+}
+
 /**
  * Set all HARTs in a hartmask
  * @param dstp the hartmask pointer
@@ -134,8 +169,27 @@ static inline void sbi_hartmask_xor(struct sbi_hartmask *dstp,
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
+#define sbi_hartmask_for_each_hart(__h, __i, __m) \
+	for((__i) = find_first_bit((__m)->bits, SBI_HARTMASK_MAX_BITS), \
+		(__h) = sbi_hartindex_to_hartid(__i); \
+		(__i) < SBI_HARTMASK_MAX_BITS; \
+		(__i) = find_next_bit((__m)->bits, SBI_HARTMASK_MAX_BITS, (__i) + 1), \
+		(__h) = sbi_hartindex_to_hartid(__i))
+
+/**
+ * Iterate over each HART index in hartmask
+ * __i hart index
+ * __m hartmask
+*/
+#define sbi_hartmask_for_each_hartindex(__i, __m) \
+	for((__i) = find_first_bit((__m)->bits, SBI_HARTMASK_MAX_BITS); \
+		(__i) < SBI_HARTMASK_MAX_BITS; \
+		(__i) = find_next_bit((__m)->bits, SBI_HARTMASK_MAX_BITS, (__i) + 1))
 
 #endif
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 77d6ca4..ee3a5e9 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -65,7 +65,7 @@ static void update_hartid_to_domain(u32 hartid, struct sbi_domain *dom)
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
 {
 	if (dom)
-		return sbi_hartmask_test_hart(hartid, &dom->assigned_harts);
+		return sbi_hartmask_test_hartid(hartid, &dom->assigned_harts);
 
 	return false;
 }
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
 		if (!sbi_hartid_valid(i)) {
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
@@ -538,16 +530,16 @@ int sbi_domain_register(struct sbi_domain *dom,
 	sbi_hartmask_clear_all(&dom->assigned_harts);
 
 	/* Assign domain to HART if HART is a possible HART */
-	sbi_hartmask_for_each_hart(i, assign_mask) {
-		if (!sbi_hartmask_test_hart(i, dom->possible_harts))
+	sbi_hartmask_for_each_hart(i, j, assign_mask) {
+		if (!sbi_hartmask_test_hartid(i, dom->possible_harts))
 			continue;
 
 		tdom = sbi_hartid_to_domain(i);
 		if (tdom)
-			sbi_hartmask_clear_hart(i,
+			sbi_hartmask_clear_hartid(i,
 					&tdom->assigned_harts);
 		update_hartid_to_domain(i, dom);
-		sbi_hartmask_set_hart(i, &dom->assigned_harts);
+		sbi_hartmask_set_hartid(i, &dom->assigned_harts);
 
 		/*
 		 * If cold boot HART is assigned to this domain then
@@ -681,12 +673,12 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 			continue;
 
 		/* Ignore if boot HART not possible for this domain */
-		if (!sbi_hartmask_test_hart(dhart, dom->possible_harts))
+		if (!sbi_hartmask_test_hartid(dhart, dom->possible_harts))
 			continue;
 
 		/* Ignore if boot HART assigned different domain */
 		if (sbi_hartid_to_domain(dhart) != dom ||
-		    !sbi_hartmask_test_hart(dhart, &dom->assigned_harts))
+		    !sbi_hartmask_test_hartid(dhart, &dom->assigned_harts))
 			continue;
 
 		/* Startup boot HART of domain */
@@ -723,6 +715,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	int rc;
 	struct sbi_hartmask *root_hmask;
 	struct sbi_domain_memregion *root_memregs;
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (scratch->fw_rw_offset == 0 ||
 	    (scratch->fw_rw_offset & (scratch->fw_rw_offset - 1)) != 0) {
@@ -796,11 +789,9 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	root.next_mode = scratch->next_mode;
 
 	/* Root domain possible and assigned HARTs */
-	for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
-		if (!sbi_hartid_valid(i))
-			continue;
-		sbi_hartmask_set_hart(i, root_hmask);
-	}
+	for (i = 0; i < plat->hart_count; i++)
+		sbi_hartmask_set_hartid(sbi_hartindex_to_hartid(i),
+					root_hmask);
 
 	/* Finally register the root domain */
 	rc = sbi_domain_register(&root, root_hmask);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 07be3d2..10dbd0a 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -205,7 +205,7 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	spin_lock(&coldboot_lock);
 
 	/* Mark current HART as waiting */
-	sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
+	sbi_hartmask_set_hartid(hartid, &coldboot_wait_hmask);
 
 	/* Release coldboot lock */
 	spin_unlock(&coldboot_lock);
@@ -222,7 +222,7 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	spin_lock(&coldboot_lock);
 
 	/* Unmark current HART as waiting */
-	sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
+	sbi_hartmask_clear_hartid(hartid, &coldboot_wait_hmask);
 
 	/* Release coldboot lock */
 	spin_unlock(&coldboot_lock);
@@ -251,7 +251,7 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 	/* Send an IPI to all HARTs waiting for coldboot */
 	for (u32 i = 0; i <= sbi_scratch_last_hartid(); i++) {
 		if ((i != hartid) &&
-		    sbi_hartmask_test_hart(i, &coldboot_wait_hmask))
+		    sbi_hartmask_test_hartid(i, &coldboot_wait_hmask))
 			sbi_ipi_raw_send(i);
 	}
 
@@ -532,7 +532,7 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 		if (h == hartid)
 			hartid_valid = true;
 	}
-	if (SBI_HARTMASK_MAX_BITS <= hartid || !hartid_valid)
+	if (!hartid_valid)
 		sbi_hart_hang();
 
 	switch (scratch->next_mode) {
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index ad09154..09c8d10 100644
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
@@ -110,14 +110,14 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 
 		for (i = hbase; m; i++, m >>= 1) {
 			if (m & 1UL)
-				sbi_hartmask_set_hart(i, &target_mask);
+				sbi_hartmask_set_hartid(i, &target_mask);
 		}
 	} else {
 		hbase = 0;
 		while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
 			for (i = hbase; m; i++, m >>= 1) {
 				if (m & 1UL)
-					sbi_hartmask_set_hart(i, &target_mask);
+					sbi_hartmask_set_hartid(i, &target_mask);
 			}
 			hbase += BITS_PER_LONG;
 		}
@@ -126,12 +126,12 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 	/* Send IPIs */
 	do {
 		retry_needed = false;
-		sbi_hartmask_for_each_hart(i, &target_mask) {
+		sbi_hartmask_for_each_hart(i, j, &target_mask) {
 			rc = sbi_ipi_send(scratch, i, event, data);
 			if (rc == SBI_IPI_UPDATE_RETRY)
 				retry_needed = true;
 			else
-				sbi_hartmask_clear_hart(i, &target_mask);
+				sbi_hartmask_clear_hartid(i, &target_mask);
 		}
 	} while (retry_needed);
 
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index 2e917c9..bae9730 100644
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
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 788683d..fa1c357 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -342,7 +342,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 			if (!fdt_node_is_enabled(fdt, cpu_offset))
 				continue;
 
-			sbi_hartmask_set_hart(val32, mask);
+			sbi_hartmask_set_hartid(val32, mask);
 		}
 	}
 
@@ -472,7 +472,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 		}
 
 		if (doffset == domain_offset)
-			sbi_hartmask_set_hart(val32, &assign_mask);
+			sbi_hartmask_set_hartid(val32, &assign_mask);
 	}
 
 	/* Register the domain */
-- 
2.34.1


