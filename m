From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 25 Sep 2020 16:59:00 +0530
Subject: [PATCH 02/16] include: sbi: Remove pmp_region callbacks from
 sbi_platform_operations
In-Reply-To: <20200925112914.725846-1-anup.patel@wdc.com>
References: <20200925112914.725846-1-anup.patel@wdc.com>
Message-ID: <20200925112914.725846-3-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pmp_region_xyz() callbacks are not required in sbi_platform_operations
because we will be using OpenSBI domain memory regions to program the
PMP CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_platform.h | 50 --------------------------------------
 lib/sbi/sbi_hart.c         | 14 +----------
 2 files changed, 1 insertion(+), 63 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index f51e36a..f2c3237 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -89,15 +89,6 @@ struct sbi_platform_operations {
 	 */
 	int (*misa_get_xlen)(void);
 
-	/** Get number of PMP regions for given HART */
-	u32 (*pmp_region_count)(u32 hartid);
-	/**
-	 * Get PMP regions details (namely: protection, base address,
-	 * and size) for given HART
-	 */
-	int (*pmp_region_info)(u32 hartid, u32 index, ulong *prot, ulong *addr,
-			       ulong *log2size);
-
 	/** Write a character to the platform console output */
 	void (*console_putc)(char ch);
 	/** Read a character from the platform console input */
@@ -456,47 +447,6 @@ static inline int sbi_platform_misa_xlen(const struct sbi_platform *plat)
 	return -1;
 }
 
-/**
- * Get the number of PMP regions of a HART
- *
- * @param plat pointer to struct sbi_platform
- * @param hartid HART ID
- *
- * @return number of PMP regions
- */
-static inline u32 sbi_platform_pmp_region_count(const struct sbi_platform *plat,
-						u32 hartid)
-{
-	if (plat && sbi_platform_ops(plat)->pmp_region_count)
-		return sbi_platform_ops(plat)->pmp_region_count(hartid);
-	return 0;
-}
-
-/**
- * Get PMP regions details (namely: protection, base address,
- * and size) of a HART
- *
- * @param plat pointer to struct sbi_platform
- * @param hartid HART ID
- * @param index index of PMP region for which we want details
- * @param prot output pointer for PMP region protection
- * @param addr output pointer for PMP region base address
- * @param log2size output pointer for log-of-2 PMP region size
- *
- * @return 0 on success and negative error code on failure
- */
-static inline int sbi_platform_pmp_region_info(const struct sbi_platform *plat,
-						u32 hartid, u32 index,
-						ulong *prot, ulong *addr,
-						ulong *log2size)
-{
-	if (plat && sbi_platform_ops(plat)->pmp_region_info)
-		return sbi_platform_ops(plat)->pmp_region_info(hartid, index,
-							       prot, addr,
-							       log2size);
-	return 0;
-}
-
 /**
  * Write a character to the platform console output
  *
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 55a04da..edf79b7 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -226,10 +226,8 @@ int sbi_hart_pmp_check_addr(struct sbi_scratch *scratch,
 
 static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
 {
-	u32 i, pmp_idx = 0, pmp_count, count;
+	u32 pmp_idx = 0;
 	unsigned long fw_start, fw_size_log2;
-	ulong prot, addr, log2size;
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (!sbi_hart_pmp_count(scratch))
 		return 0;
@@ -239,16 +237,6 @@ static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
 	fw_start = scratch->fw_start & ~((1UL << fw_size_log2) - 1UL);
 	pmp_set(pmp_idx++, 0, fw_start, fw_size_log2);
 
-	/* Platform specific PMP regions */
-	count = sbi_platform_pmp_region_count(plat, hartid);
-	pmp_count = sbi_hart_pmp_count(scratch);
-	for (i = 0; i < count && pmp_idx < (pmp_count - 1); i++) {
-		if (sbi_platform_pmp_region_info(plat, hartid, i, &prot, &addr,
-						 &log2size))
-			continue;
-		pmp_set(pmp_idx++, prot, addr, log2size);
-	}
-
 	/*
 	 * Default PMP region for allowing S-mode and U-mode access to
 	 * memory not covered by:
-- 
2.25.1


