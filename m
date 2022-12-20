From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Dec 2022 16:16:23 +0530
Subject: [PATCH 7/9] lib: utils: Disallow non-root domains from adding M-mode regions
In-Reply-To: <20221220104625.80667-1-hchauhan@ventanamicro.com>
References: <20221220104625.80667-1-hchauhan@ventanamicro.com>
Message-ID: <20221220104625.80667-8-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The M-mode regions can only be added by root domain. The non-root
domains shouldn't be able to add them from FDT.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi/sbi_domain.h   |  5 +++++
 lib/utils/fdt/fdt_domain.c | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 955ffa3..3f5d28e 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -50,6 +50,11 @@ struct sbi_domain_memregion {
 						 SBI_DOMAIN_MEMREGION_M_WRITABLE | \
 						 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
 
+#define SBI_DOMAIN_MEMREGION_SU_RWX		(SBI_DOMAIN_MEMREGION_SU_READABLE | \
+						 SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
+						 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+
+
 	/* Unrestricted M-mode accesses but enfoced on SU-mode */
 #define SBI_DOMAIN_MEMREGION_READABLE		(SBI_DOMAIN_MEMREGION_SU_READABLE | \
 						 SBI_DOMAIN_MEMREGION_M_RWX)
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index f979343..838aeca 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -239,6 +239,20 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	u32 *region_count = opaque;
 	struct sbi_domain_memregion *region;
 
+	/*
+	 * Non-root domains cannot add a region with only M-mode
+	 * access permissions. M-mode regions can only be part of
+	 * root domain.
+	 *
+	 * SU permission bits can't be all zeroes and M-mode permission
+	 * bits must be all set.
+	 */
+	if (!((region_access & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
+	     & SBI_DOMAIN_MEMREGION_SU_RWX)
+	    && ((region_access & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
+		& SBI_DOMAIN_MEMREGION_M_RWX))
+		return SBI_EINVAL;
+
 	/* Find next region of the domain */
 	if (FDT_DOMAIN_REGION_MAX_COUNT <= *region_count)
 		return SBI_EINVAL;
-- 
2.39.0


