From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:37 +0530
Subject: [PATCH v2 06/18] lib: sbi: Use heap for root domain creation
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's use heap allocation in root domain creation instead of using
a fixed size global array.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_domain.c | 45 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index c55e192..5800870 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_platform.h>
@@ -26,16 +27,13 @@ struct sbi_domain *hartid_to_domain_table[SBI_HARTMASK_MAX_BITS] = { 0 };
 static u32 domain_count = 0;
 static bool domain_finalized = false;
 
-static struct sbi_hartmask root_hmask = { 0 };
-
 #define ROOT_REGION_MAX	16
 static u32 root_memregs_count = 0;
-static struct sbi_domain_memregion root_memregs[ROOT_REGION_MAX + 1] = { 0 };
 
 struct sbi_domain root = {
 	.name = "root",
-	.possible_harts = &root_hmask,
-	.regions = root_memregs,
+	.possible_harts = NULL,
+	.regions = NULL,
 	.system_reset_allowed = true,
 	.system_suspend_allowed = true,
 	.fw_region_inited = false,
@@ -551,8 +549,7 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 
 	/* Sanity checks */
-	if (!reg || domain_finalized ||
-	    (root.regions != root_memregs) ||
+	if (!reg || domain_finalized || !root.regions ||
 	    (ROOT_REGION_MAX <= root_memregs_count))
 		return SBI_EINVAL;
 
@@ -567,10 +564,10 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 	}
 
 	/* Append the memregion to root memregions */
-	nreg = &root_memregs[root_memregs_count];
+	nreg = &root.regions[root_memregs_count];
 	sbi_memcpy(nreg, reg, sizeof(*reg));
 	root_memregs_count++;
-	root_memregs[root_memregs_count].order = 0;
+	root.regions[root_memregs_count].order = 0;
 
 	/* Sort and optimize root regions */
 	do {
@@ -700,6 +697,9 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 {
 	u32 i;
+	int rc;
+	struct sbi_hartmask *root_hmask;
+	struct sbi_domain_memregion *root_memregs;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (scratch->fw_rw_offset == 0 ||
@@ -715,6 +715,21 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 		return SBI_EINVAL;
 	}
 
+	root_memregs = sbi_calloc(sizeof(*root_memregs), ROOT_REGION_MAX + 1);
+	if (!root_memregs) {
+		sbi_printf("%s: no memory for root regions\n", __func__);
+		return SBI_ENOMEM;
+	}
+	root.regions = root_memregs;
+
+	root_hmask = sbi_zalloc(sizeof(*root_hmask));
+	if (!root_hmask) {
+		sbi_printf("%s: no memory for root hartmask\n", __func__);
+		sbi_free(root_memregs);
+		return SBI_ENOMEM;
+	}
+	root.possible_harts = root_hmask;
+
 	/* Root domain firmware memory region */
 	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
@@ -751,8 +766,16 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
 		if (sbi_platform_hart_invalid(plat, i))
 			continue;
-		sbi_hartmask_set_hart(i, &root_hmask);
+		sbi_hartmask_set_hart(i, root_hmask);
+	}
+
+	/* Finally register the root domain */
+	rc = sbi_domain_register(&root, root_hmask);
+	if (rc) {
+		sbi_free(root_hmask);
+		sbi_free(root_memregs);
+		return rc;
 	}
 
-	return sbi_domain_register(&root, &root_hmask);
+	return 0;
 }
-- 
2.34.1


