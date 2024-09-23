From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 23 Sep 2024 17:26:56 +0530
Subject: [PATCH 5/9] lib: utils/fdt: Use sbi_domain_memregion_init() when parsing domains
In-Reply-To: <20240923115700.381916-1-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
Message-ID: <20240923115700.381916-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use sbi_domain_memregion_init() at the time of parsing domains from
FDT so that sbi_domain_memregion_init() is always used for setting
up all memregions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/fdt/fdt_domain.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 4fde50f5..4bc7ed86 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -253,8 +253,8 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 	u32 val32;
 	u64 val64;
 	const u32 *val;
+	unsigned long base, order, flags;
 	struct parse_region_data *preg = opaque;
-	struct sbi_domain_memregion *region;
 
 	/*
 	 * Non-root domains cannot add a region with only M-mode
@@ -271,7 +271,6 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 	/* Find next region of the domain */
 	if (preg->max_regions <= preg->region_count)
 		return SBI_ENOSPC;
-	region = &preg->dom->regions[preg->region_count];
 
 	/* Read "base" DT property */
 	val = fdt_getprop(fdt, region_offset, "base", &len);
@@ -279,7 +278,7 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 		return SBI_EINVAL;
 	val64 = fdt32_to_cpu(val[0]);
 	val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
-	region->base = val64;
+	base = val64;
 
 	/* Read "order" DT property */
 	val = fdt_getprop(fdt, region_offset, "order", &len);
@@ -288,12 +287,15 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 	val32 = fdt32_to_cpu(*val);
 	if (val32 < 3 || __riscv_xlen < val32)
 		return SBI_EINVAL;
-	region->order = val32;
+	order = val32;
 
 	/* Read "mmio" DT property */
-	region->flags = region_access & SBI_DOMAIN_MEMREGION_ACCESS_MASK;
+	flags = region_access & SBI_DOMAIN_MEMREGION_ACCESS_MASK;
 	if (fdt_get_property(fdt, region_offset, "mmio", NULL))
-		region->flags |= SBI_DOMAIN_MEMREGION_MMIO;
+		flags |= SBI_DOMAIN_MEMREGION_MMIO;
+
+	sbi_domain_memregion_init(base, (order == __riscv_xlen) ? ~0UL : BIT(order),
+				  flags, &preg->dom->regions[preg->region_count]);
 
 	preg->region_count++;
 
-- 
2.43.0


