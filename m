From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 22 Apr 2021 16:50:17 +0530
Subject: [PATCH 1/7] lib: sbi: Remove domains_root_regions() platform callback
In-Reply-To: <20210422112023.670521-1-anup.patel@wdc.com>
References: <20210422112023.670521-1-anup.patel@wdc.com>
Message-ID: <20210422112023.670521-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We now have sbi_domain_root_add_memregion() which allows platform
support to add root domain regions at boot-time so let's remove
the domains_root_regions() platform callback which was added
for this purpose.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_platform.h | 18 ------------------
 lib/sbi/sbi_domain.c       |  6 ------
 2 files changed, 24 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 837a75d..6736169 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -92,8 +92,6 @@ struct sbi_platform_operations {
 	 */
 	int (*misa_get_xlen)(void);
 
-	/** Get platform specific root domain memory regions */
-	struct sbi_domain_memregion *(*domains_root_regions)(void);
 	/** Initialize (or populate) domains for the platform */
 	int (*domains_init)(void);
 
@@ -484,22 +482,6 @@ static inline int sbi_platform_misa_xlen(const struct sbi_platform *plat)
 	return -1;
 }
 
-/**
- * Get platform specific root domain memory regions
- *
- * @param plat pointer to struct sbi_platform
- *
- * @return an array of memory regions terminated by a region with order zero
- * or NULL for no memory regions
- */
-static inline struct sbi_domain_memregion *
-sbi_platform_domains_root_regions(const struct sbi_platform *plat)
-{
-	if (plat && sbi_platform_ops(plat)->domains_root_regions)
-		return sbi_platform_ops(plat)->domains_root_regions();
-	return NULL;
-}
-
 /**
  * Initialize (or populate) domains for the platform
  *
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 69a3795..9a53542 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -592,7 +592,6 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 {
 	u32 i;
-	struct sbi_domain_memregion *memregs;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	/* Root domain firmware memory region */
@@ -610,11 +609,6 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	/* Root domain memory region end */
 	root_memregs[root_memregs_count].order = 0;
 
-	/* Use platform specific root memory regions when available */
-	memregs = sbi_platform_domains_root_regions(plat);
-	if (memregs)
-		root.regions = memregs;
-
 	/* Root domain boot HART id is same as coldboot HART id */
 	root.boot_hartid = cold_hartid;
 
-- 
2.25.1


