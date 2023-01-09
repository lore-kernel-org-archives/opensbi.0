From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon,  9 Jan 2023 05:20:41 +0000
Subject: [PATCH v2 7/9] lib: utils: Disallow non-root domains from adding M-mode regions
In-Reply-To: <20230109052043.55473-1-hchauhan@ventanamicro.com>
References: <20230109052043.55473-1-hchauhan@ventanamicro.com>
Message-ID: <20230109052043.55473-8-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The M-mode regions can only be added to the root domain. The non-root
domains shouldn't be able to add them from FDT.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_domain.h   |  4 ++++
 lib/utils/fdt/fdt_domain.c | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 7b94ce4..bd346b6 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -50,6 +50,10 @@ struct sbi_domain_memregion {
 						 SBI_DOMAIN_MEMREGION_M_WRITABLE | \
 						 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
 
+#define SBI_DOMAIN_MEMREGION_SU_RWX		(SBI_DOMAIN_MEMREGION_SU_READABLE | \
+						 SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
+						 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+
 	/* Unrestricted M-mode accesses but enfoced on SU-mode */
 #define SBI_DOMAIN_MEMREGION_READABLE		(SBI_DOMAIN_MEMREGION_SU_READABLE | \
 						 SBI_DOMAIN_MEMREGION_M_RWX)
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 45612ef..2b51a8e 100644
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
2.34.1


