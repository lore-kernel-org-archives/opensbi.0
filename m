From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 13 Oct 2022 10:29:41 +0800
Subject: [PATCH v3 03/13] lib: sbi: Add sbi_domain_root_add_memrange() API
In-Reply-To: <20221013022951.5206-1-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com>
Message-ID: <20221013022951.5206-4-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch generalizes the logic to add a memory range with desired
alignment and flags of consecutive regions to the root domain.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v2 -> v3
  - New patch
---
 include/sbi/sbi_domain.h                | 16 +++++++-
 include/sbi_utils/timer/aclint_mtimer.h |  2 +
 lib/sbi/sbi_domain.c                    | 27 +++++++++++++
 lib/utils/timer/aclint_mtimer.c         | 50 +++++++------------------
 4 files changed, 58 insertions(+), 37 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index b90f59c..5553d21 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -175,11 +175,25 @@ int sbi_domain_register(struct sbi_domain *dom,
  * @param reg pointer to the memory region to be added
  *
  * @return 0 on success
- * @return SBI_EALREADY if memory region conflicts with existing
+ * @return SBI_EALREADY if memory region conflicts with the existing one
  * @return SBI_EINVAL otherwise
  */
 int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg);
 
+/**
+ * Add a memory range with its flags to the root domain
+ * @param addr start physical address of memory range
+ * @param size physical size of memory range
+ * @param align alignment of memory region
+ * @param region_flags memory range flags
+ *
+ * @return 0 on success
+ * @return SBI_EALREADY if memory region conflicts with the existing one
+ * @return SBI_EINVAL otherwise
+ */
+int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
+			   unsigned long align, unsigned long region_flags);
+
 /** Finalize domain tables and startup non-root domains */
 int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid);
 
diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
index f02cc62..6ab8799 100644
--- a/include/sbi_utils/timer/aclint_mtimer.h
+++ b/include/sbi_utils/timer/aclint_mtimer.h
@@ -22,6 +22,8 @@
 
 #define CLINT_MTIMER_OFFSET		0x4000
 
+#define MTIMER_REGION_ALIGN		0x1000
+
 struct aclint_mtimer_data {
 	/* Public details */
 	unsigned long mtime_freq;
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 4e4c1e1..f24a8e5 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -522,6 +522,33 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 	return 0;
 }
 
+int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
+			   unsigned long align, unsigned long region_flags)
+{
+	int rc;
+	unsigned long pos, end, rsize;
+	struct sbi_domain_memregion reg;
+
+	pos = addr;
+	end = addr + size;
+	while (pos < end) {
+		rsize = pos & (align - 1);
+		if (rsize)
+			rsize = 1UL << sbi_ffs(pos);
+		else
+			rsize = ((end - pos) < align) ?
+				(end - pos) : align;
+
+		sbi_domain_memregion_init(pos, rsize, region_flags, &reg);
+		rc = sbi_domain_root_add_memregion(&reg);
+		if (rc)
+			return rc;
+		pos += rsize;
+	}
+
+	return 0;
+}
+
 int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 {
 	int rc;
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index a957b1c..3f00c21 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -142,34 +142,6 @@ int aclint_mtimer_warm_init(void)
 	return 0;
 }
 
-static int aclint_mtimer_add_regions(unsigned long addr, unsigned long size)
-{
-#define MTIMER_ADD_REGION_ALIGN		0x1000
-	int rc;
-	unsigned long pos, end, rsize;
-	struct sbi_domain_memregion reg;
-
-	pos = addr;
-	end = addr + size;
-	while (pos < end) {
-		rsize = pos & (MTIMER_ADD_REGION_ALIGN - 1);
-		if (rsize)
-			rsize = 1UL << sbi_ffs(pos);
-		else
-			rsize = ((end - pos) < MTIMER_ADD_REGION_ALIGN) ?
-				(end - pos) : MTIMER_ADD_REGION_ALIGN;
-
-		sbi_domain_memregion_init(pos, rsize,
-					  SBI_DOMAIN_MEMREGION_MMIO, &reg);
-		rc = sbi_domain_root_add_memregion(&reg);
-		if (rc)
-			return rc;
-		pos += rsize;
-	}
-
-	return 0;
-}
-
 int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 			    struct aclint_mtimer_data *reference)
 {
@@ -208,23 +180,29 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 
 	/* Add MTIMER regions to the root domain */
 	if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
-		rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
-					mt->mtime_size + mt->mtimecmp_size);
+		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
+					mt->mtime_size + mt->mtimecmp_size,
+					MTIMER_REGION_ALIGN,
+					SBI_DOMAIN_MEMREGION_MMIO);
 		if (rc)
 			return rc;
 	} else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
-		rc = aclint_mtimer_add_regions(mt->mtime_addr,
-					mt->mtime_size + mt->mtimecmp_size);
+		rc = sbi_domain_root_add_memrange(mt->mtime_addr,
+					mt->mtime_size + mt->mtimecmp_size,
+					MTIMER_REGION_ALIGN,
+					SBI_DOMAIN_MEMREGION_MMIO);
 		if (rc)
 			return rc;
 	} else {
-		rc = aclint_mtimer_add_regions(mt->mtime_addr,
-						mt->mtime_size);
+		rc = sbi_domain_root_add_memrange(mt->mtime_addr,
+						mt->mtime_size, MTIMER_REGION_ALIGN,
+						SBI_DOMAIN_MEMREGION_MMIO);
 		if (rc)
 			return rc;
 
-		rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
-						mt->mtimecmp_size);
+		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
+						mt->mtimecmp_size, MTIMER_REGION_ALIGN,
+						SBI_DOMAIN_MEMREGION_MMIO);
 		if (rc)
 			return rc;
 	}
-- 
2.34.1


