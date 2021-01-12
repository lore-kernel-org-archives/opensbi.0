From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 12 Jan 2021 10:49:46 +0530
Subject: [PATCH v2] lib: sbi: Allow platforms to provide root domain memory
 regions
Message-ID: <20210112051946.767403-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the root domain memory regions are fixed in generic
code but some of the platforms may want to explicitly define
memory regions for the root domain.

This patch adds optional domains_root_regions() platform callback
which platforms can use to provide platform specific root domain
memory regions. Due to this changes, the root domain should also
undergo all sanity checks (just like regular domain) so we use
sbi_domain_register() to register root domain.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_platform.h | 20 +++++++++++++++++++-
 lib/sbi/sbi_domain.c       | 16 ++++++++--------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 7b8fe89..c252628 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -45,7 +45,7 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_version.h>
 
-struct sbi_domain;
+struct sbi_domain_memregion;
 struct sbi_trap_info;
 struct sbi_trap_regs;
 
@@ -92,6 +92,8 @@ struct sbi_platform_operations {
 	 */
 	int (*misa_get_xlen)(void);
 
+	/** Get platform specific root domain memory regions */
+	struct sbi_domain_memregion *(*domains_root_regions)(void);
 	/** Initialize (or populate) domains for the platform */
 	int (*domains_init)(void);
 
@@ -452,6 +454,22 @@ static inline int sbi_platform_misa_xlen(const struct sbi_platform *plat)
 	return -1;
 }
 
+/**
+ * Get platform specific root domain memory regions
+ *
+ * @param plat pointer to struct sbi_platform
+ *
+ * @return an array of memory regions terminated by a region with order zero
+ * or NULL for no memory regions
+ */
+static inline struct sbi_domain_memregion *
+sbi_platform_domains_root_regions(const struct sbi_platform *plat)
+{
+	if (plat && sbi_platform_ops(plat)->domains_root_regions)
+		return sbi_platform_ops(plat)->domains_root_regions();
+	return NULL;
+}
+
 /**
  * Initialize (or populate) domains for the platform
  *
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 6d4c608..195c941 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -496,6 +496,7 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 {
 	u32 i;
+	struct sbi_domain_memregion *memregs;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	/* Root domain firmware memory region */
@@ -514,6 +515,11 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	/* Root domain memory region end */
 	root_memregs[ROOT_END_REGION].order = 0;
 
+	/* Use platform specific root memory regions when available */
+	memregs = sbi_platform_domains_root_regions(plat);
+	if (memregs)
+		root.regions = memregs;
+
 	/* Root domain boot HART id is same as coldboot HART id */
 	root.boot_hartid = cold_hartid;
 
@@ -522,18 +528,12 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	root.next_addr = scratch->next_addr;
 	root.next_mode = scratch->next_mode;
 
-	/* Select root domain for all valid HARTs */
+	/* Root domain possible and assigned HARTs */
 	for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
 		if (sbi_platform_hart_invalid(plat, i))
 			continue;
 		sbi_hartmask_set_hart(i, &root_hmask);
-		hartid_to_domain_table[i] = &root;
-		sbi_hartmask_set_hart(i, &root.assigned_harts);
 	}
 
-	/* Set root domain index */
-	root.index = domain_count++;
-	domidx_to_domain_table[root.index] = &root;
-
-	return 0;
+	return sbi_domain_register(&root, &root_hmask);
 }
-- 
2.25.1


