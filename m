From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:45 +0530
Subject: [PATCH v2 14/18] lib: utils/ipi: Use scratch space to save per-HART MSWI pointer
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-15-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using a global array indexed by hartid, we should use
scratch space to save per-HART MSWI pointer.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/utils/ipi/aclint_mswi.c | 43 ++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index ac8570b..f47b3bc 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -12,21 +12,30 @@
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
-#include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_ipi.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
 
-static struct aclint_mswi_data *mswi_hartid2data[SBI_HARTMASK_MAX_BITS];
+static unsigned long mswi_ptr_offset;
+
+#define mswi_get_hart_data_ptr(__scratch)				\
+	sbi_scratch_read_type((__scratch), void *, mswi_ptr_offset)
+
+#define mswi_set_hart_data_ptr(__scratch, __mswi)			\
+	sbi_scratch_write_type((__scratch), void *, mswi_ptr_offset, (__mswi))
 
 static void mswi_ipi_send(u32 target_hart)
 {
 	u32 *msip;
+	struct sbi_scratch *scratch;
 	struct aclint_mswi_data *mswi;
 
-	if (SBI_HARTMASK_MAX_BITS <= target_hart)
+	scratch = sbi_hartid_to_scratch(target_hart);
+	if (!scratch)
 		return;
-	mswi = mswi_hartid2data[target_hart];
+
+	mswi = mswi_get_hart_data_ptr(scratch);
 	if (!mswi)
 		return;
 
@@ -38,11 +47,14 @@ static void mswi_ipi_send(u32 target_hart)
 static void mswi_ipi_clear(u32 target_hart)
 {
 	u32 *msip;
+	struct sbi_scratch *scratch;
 	struct aclint_mswi_data *mswi;
 
-	if (SBI_HARTMASK_MAX_BITS <= target_hart)
+	scratch = sbi_hartid_to_scratch(target_hart);
+	if (!scratch)
 		return;
-	mswi = mswi_hartid2data[target_hart];
+
+	mswi = mswi_get_hart_data_ptr(scratch);
 	if (!mswi)
 		return;
 
@@ -69,19 +81,30 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 {
 	u32 i;
 	int rc;
+	struct sbi_scratch *scratch;
 	unsigned long pos, region_size;
 	struct sbi_domain_memregion reg;
 
 	/* Sanity checks */
 	if (!mswi || (mswi->addr & (ACLINT_MSWI_ALIGN - 1)) ||
 	    (mswi->size < (mswi->hart_count * sizeof(u32))) ||
-	    (mswi->first_hartid + mswi->hart_count > SBI_HARTMASK_MAX_BITS) ||
 	    (!mswi->hart_count || mswi->hart_count > ACLINT_MSWI_MAX_HARTS))
 		return SBI_EINVAL;
 
-	/* Update MSWI hartid table */
-	for (i = 0; i < mswi->hart_count; i++)
-		mswi_hartid2data[mswi->first_hartid + i] = mswi;
+	/* Allocate scratch space pointer */
+	if (!mswi_ptr_offset) {
+		mswi_ptr_offset = sbi_scratch_alloc_type_offset(void *);
+		if (!mswi_ptr_offset)
+			return SBI_ENOMEM;
+	}
+
+	/* Update MSWI pointer in scratch space */
+	for (i = 0; i < mswi->hart_count; i++) {
+		scratch = sbi_hartid_to_scratch(mswi->first_hartid + i);
+		if (!scratch)
+			return SBI_ENOENT;
+		mswi_set_hart_data_ptr(scratch, mswi);
+	}
 
 	/* Add MSWI regions to the root domain */
 	for (pos = 0; pos < mswi->size; pos += ACLINT_MSWI_ALIGN) {
-- 
2.34.1


