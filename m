From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Apr 2023 18:02:25 +0530
Subject: [PATCH 12/17] lib: utils/fdt: Use heap in FDT domain parsing
In-Reply-To: <20230425123230.3943447-1-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
Message-ID: <20230425123230.3943447-13-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's use heap allocation in FDT domain parsing instead of using
a fixed size global array.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/fdt/fdt_domain.c | 111 +++++++++++++++++++++++--------------
 1 file changed, 68 insertions(+), 43 deletions(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index bb6d17d..c4aed4d 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -219,14 +220,11 @@ skip_device_disable:
 	fdt_nop_node(fdt, poffset);
 }
 
-#define FDT_DOMAIN_MAX_COUNT		8
-#define FDT_DOMAIN_REGION_MAX_COUNT	16
-
-static u32 fdt_domains_count;
-static struct sbi_domain fdt_domains[FDT_DOMAIN_MAX_COUNT];
-static struct sbi_hartmask fdt_masks[FDT_DOMAIN_MAX_COUNT];
-static struct sbi_domain_memregion
-	fdt_regions[FDT_DOMAIN_MAX_COUNT][FDT_DOMAIN_REGION_MAX_COUNT + 1];
+struct parse_region_data {
+	struct sbi_domain *dom;
+	u32 region_count;
+	u32 max_regions;
+};
 
 static int __fdt_parse_region(void *fdt, int domain_offset,
 			      int region_offset, u32 region_access,
@@ -236,7 +234,7 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	u32 val32;
 	u64 val64;
 	const u32 *val;
-	u32 *region_count = opaque;
+	struct parse_region_data *preg = opaque;
 	struct sbi_domain_memregion *region;
 
 	/*
@@ -252,9 +250,9 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 		return SBI_EINVAL;
 
 	/* Find next region of the domain */
-	if (FDT_DOMAIN_REGION_MAX_COUNT <= *region_count)
-		return SBI_EINVAL;
-	region = &fdt_regions[fdt_domains_count][*region_count];
+	if (preg->max_regions <= preg->region_count)
+		return SBI_ENOSPC;
+	region = &preg->dom->regions[preg->region_count];
 
 	/* Read "base" DT property */
 	val = fdt_getprop(fdt, region_offset, "base", &len);
@@ -278,7 +276,7 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	if (fdt_get_property(fdt, region_offset, "mmio", NULL))
 		region->flags |= SBI_DOMAIN_MEMREGION_MMIO;
 
-	(*region_count)++;
+	preg->region_count++;
 
 	return 0;
 }
@@ -291,16 +289,30 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	struct sbi_domain *dom;
 	struct sbi_hartmask *mask;
 	struct sbi_hartmask assign_mask;
+	struct parse_region_data preg;
 	int *cold_domain_offset = opaque;
-	struct sbi_domain_memregion *reg, *regions;
-	int i, err, len, cpus_offset, cpu_offset, doffset;
+	struct sbi_domain_memregion *reg;
+	int i, err = 0, len, cpus_offset, cpu_offset, doffset;
 
-	/* Sanity check on maximum domains we can handle */
-	if (FDT_DOMAIN_MAX_COUNT <= fdt_domains_count)
-		return SBI_EINVAL;
-	dom = &fdt_domains[fdt_domains_count];
-	mask = &fdt_masks[fdt_domains_count];
-	regions = &fdt_regions[fdt_domains_count][0];
+	dom = sbi_zalloc(sizeof(*dom));
+	if (!dom)
+		return SBI_ENOMEM;
+
+	dom->regions = sbi_calloc(sizeof(*dom->regions), 16 + 1);
+	if (!dom->regions) {
+		sbi_free(dom);
+		return SBI_ENOMEM;
+	}
+	preg.dom = dom;
+	preg.region_count = 0;
+	preg.max_regions = 16;
+
+	mask = sbi_zalloc(sizeof(*mask));
+	if (!mask) {
+		sbi_free(dom->regions);
+		sbi_free(dom);
+		return SBI_ENOMEM;
+	}
 
 	/* Read DT node name */
 	strncpy(dom->name, fdt_get_name(fdt, domain_offset, NULL),
@@ -316,12 +328,14 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 		for (i = 0; i < len; i++) {
 			cpu_offset = fdt_node_offset_by_phandle(fdt,
 							fdt32_to_cpu(val[i]));
-			if (cpu_offset < 0)
-				return cpu_offset;
+			if (cpu_offset < 0) {
+				err = cpu_offset;
+				goto fail_free_all;
+			}
 
 			err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
 			if (err)
-				return err;
+				goto fail_free_all;
 
 			if (!fdt_node_is_enabled(fdt, cpu_offset))
 				continue;
@@ -331,14 +345,10 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	}
 
 	/* Setup memregions from DT */
-	val32 = 0;
-	memset(regions, 0,
-		   sizeof(*regions) * (FDT_DOMAIN_REGION_MAX_COUNT + 1));
-	dom->regions = regions;
-	err = fdt_iterate_each_memregion(fdt, domain_offset, &val32,
+	err = fdt_iterate_each_memregion(fdt, domain_offset, &preg,
 					 __fdt_parse_region);
 	if (err)
-		return err;
+		goto fail_free_all;
 
 	/*
 	 * Copy over root domain memregions which don't allow
@@ -354,9 +364,11 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE) ||
 		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
 			continue;
-		if (FDT_DOMAIN_REGION_MAX_COUNT <= val32)
-			return SBI_EINVAL;
-		memcpy(&regions[val32++], reg, sizeof(*reg));
+		if (preg.max_regions <= preg.region_count) {
+			err = SBI_EINVAL;
+			goto fail_free_all;
+		}
+		memcpy(&dom->regions[preg.region_count++], reg, sizeof(*reg));
 	}
 	dom->fw_region_inited = root.fw_region_inited;
 
@@ -427,8 +439,10 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 
 	/* Find /cpus DT node */
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
+	if (cpus_offset < 0) {
+		err = cpus_offset;
+		goto fail_free_all;
+	}
 
 	/* HART to domain assignment mask based on CPU DT nodes */
 	sbi_hartmask_clear_all(&assign_mask);
@@ -444,22 +458,33 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 			continue;
 
 		val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
-		if (!val || len < 4)
-			return SBI_EINVAL;
+		if (!val || len < 4) {
+			err = SBI_EINVAL;
+			goto fail_free_all;
+		}
 
 		doffset = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
-		if (doffset < 0)
-			return doffset;
+		if (doffset < 0) {
+			err = doffset;
+			goto fail_free_all;
+		}
 
 		if (doffset == domain_offset)
 			sbi_hartmask_set_hart(val32, &assign_mask);
 	}
 
-	/* Increment domains count */
-	fdt_domains_count++;
-
 	/* Register the domain */
-	return sbi_domain_register(dom, &assign_mask);
+	err = sbi_domain_register(dom, &assign_mask);
+	if (err)
+		goto fail_free_all;
+
+	return 0;
+
+fail_free_all:
+	sbi_free(dom->regions);
+	sbi_free(mask);
+	sbi_free(dom);
+	return err;
 }
 
 int fdt_domains_populate(void *fdt)
-- 
2.34.1


