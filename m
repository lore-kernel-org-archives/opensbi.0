From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Apr 2023 18:02:27 +0530
Subject: [PATCH 14/17] lib: utils/timer: Use scratch space to save per-HART MTIMER pointer
In-Reply-To: <20230425123230.3943447-1-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
Message-ID: <20230425123230.3943447-15-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using a global array indexed by hartid, we should use
scratch space to save per-HART MTIMER pointer.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/timer/aclint_mtimer.c | 82 +++++++++++++++++++++++++++------
 1 file changed, 67 insertions(+), 15 deletions(-)

diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 84ded4e..c75f790 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -13,12 +13,23 @@
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
-#include <sbi/sbi_hartmask.h>
-#include <sbi/sbi_ipi.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
 #include <sbi_utils/timer/aclint_mtimer.h>
 
-static struct aclint_mtimer_data *mtimer_hartid2data[SBI_HARTMASK_MAX_BITS];
+static unsigned long mtimer_ptr_offset;
+
+#define mtimer_get_hart_data_ptr(__scratch)				\
+({									\
+	(void *)(*((ulong *)sbi_scratch_offset_ptr((__scratch),		\
+						   mtimer_ptr_offset)));\
+})
+
+#define mtimer_set_hart_data_ptr(__scratch, __mtimer)			\
+do {									\
+	*((ulong *)sbi_scratch_offset_ptr((__scratch), mtimer_ptr_offset))\
+					= (ulong)(__mtimer);		\
+} while (0)
 
 #if __riscv_xlen != 32
 static u64 mtimer_time_rd64(volatile u64 *addr)
@@ -53,30 +64,54 @@ static void mtimer_time_wr32(bool timecmp, u64 value, volatile u64 *addr)
 
 static u64 mtimer_value(void)
 {
-	struct aclint_mtimer_data *mt = mtimer_hartid2data[current_hartid()];
-	u64 *time_val = (void *)mt->mtime_addr;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	struct aclint_mtimer_data *mt;
+
+	mt = mtimer_get_hart_data_ptr(scratch);
+	if (!mt)
+		return 0;
 
 	/* Read MTIMER Time Value */
-	return mt->time_rd(time_val);
+	return mt->time_rd((void *)mt->mtime_addr);
 }
 
 static void mtimer_event_stop(void)
 {
 	u32 target_hart = current_hartid();
-	struct aclint_mtimer_data *mt = mtimer_hartid2data[target_hart];
-	u64 *time_cmp = (void *)mt->mtimecmp_addr;
+	struct sbi_scratch *scratch;
+	struct aclint_mtimer_data *mt;
+	u64 *time_cmp;
+
+	scratch = sbi_hartid_to_scratch(target_hart);
+	if (!scratch)
+		return;
+
+	mt = mtimer_get_hart_data_ptr(scratch);
+	if (!mt)
+		return;
 
 	/* Clear MTIMER Time Compare */
+	time_cmp = (void *)mt->mtimecmp_addr;
 	mt->time_wr(true, -1ULL, &time_cmp[target_hart - mt->first_hartid]);
 }
 
 static void mtimer_event_start(u64 next_event)
 {
 	u32 target_hart = current_hartid();
-	struct aclint_mtimer_data *mt = mtimer_hartid2data[target_hart];
-	u64 *time_cmp = (void *)mt->mtimecmp_addr;
+	struct sbi_scratch *scratch;
+	struct aclint_mtimer_data *mt;
+	u64 *time_cmp;
+
+	scratch = sbi_hartid_to_scratch(target_hart);
+	if (!scratch)
+		return;
+
+	mt = mtimer_get_hart_data_ptr(scratch);
+	if (!mt)
+		return;
 
 	/* Program MTIMER Time Compare */
+	time_cmp = (void *)mt->mtimecmp_addr;
 	mt->time_wr(true, next_event,
 		    &time_cmp[target_hart - mt->first_hartid]);
 }
@@ -126,8 +161,14 @@ int aclint_mtimer_warm_init(void)
 {
 	u64 *mt_time_cmp;
 	u32 target_hart = current_hartid();
-	struct aclint_mtimer_data *mt = mtimer_hartid2data[target_hart];
+	struct sbi_scratch *scratch;
+	struct aclint_mtimer_data *mt;
 
+	scratch = sbi_hartid_to_scratch(target_hart);
+	if (!scratch)
+		return SBI_ENOENT;
+
+	mt = mtimer_get_hart_data_ptr(scratch);
 	if (!mt)
 		return SBI_ENODEV;
 
@@ -147,6 +188,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 {
 	u32 i;
 	int rc;
+	struct sbi_scratch *scratch;
 
 	/* Sanity checks */
 	if (!mt ||
@@ -155,12 +197,18 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 	    (mt->mtime_size && (mt->mtime_size & (ACLINT_MTIMER_ALIGN - 1))) ||
 	    (mt->mtimecmp_addr & (ACLINT_MTIMER_ALIGN - 1)) ||
 	    (mt->mtimecmp_size & (ACLINT_MTIMER_ALIGN - 1)) ||
-	    (mt->first_hartid >= SBI_HARTMASK_MAX_BITS) ||
 	    (mt->hart_count > ACLINT_MTIMER_MAX_HARTS))
 		return SBI_EINVAL;
 	if (reference && mt->mtime_freq != reference->mtime_freq)
 		return SBI_EINVAL;
 
+	/* Allocate scratch space pointer */
+	if (!mtimer_ptr_offset) {
+		mtimer_ptr_offset = sbi_scratch_alloc_offset(sizeof(ulong));
+		if (!mtimer_ptr_offset)
+			return SBI_ENOMEM;
+	}
+
 	/* Initialize private data */
 	aclint_mtimer_set_reference(mt, reference);
 	mt->time_rd = mtimer_time_rd32;
@@ -174,9 +222,13 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 	}
 #endif
 
-	/* Update MTIMER hartid table */
-	for (i = 0; i < mt->hart_count; i++)
-		mtimer_hartid2data[mt->first_hartid + i] = mt;
+	/* Update MTIMER pointer in scratch space */
+	for (i = 0; i < mt->hart_count; i++) {
+		scratch = sbi_hartid_to_scratch(mt->first_hartid + i);
+		if (!scratch)
+			return SBI_ENOENT;
+		mtimer_set_hart_data_ptr(scratch, mt);
+	}
 
 	if (!mt->mtime_size) {
 		/* Disable reading mtime when mtime is not available */
-- 
2.34.1


