From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 24 Mar 2025 08:48:07 -0700
Subject: [PATCH v2 3/5] lib: utils/fdt: Used cached CPU DT information
In-Reply-To: <20250324154858.4147529-1-samuel.holland@sifive.com>
References: <20250324154858.4147529-1-samuel.holland@sifive.com>
Message-ID: <20250324154858.4147529-4-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the cached information to look up the DT node offset of a hart, or
the hart from a DT node phandle, instead of parsing the DT each time.

The logic should otherwise be equivalent.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Add missing include of fdt_cpu.h in fdt_helper.c

 lib/utils/fdt/fdt_domain.c | 117 +++++++++++--------------------------
 lib/utils/fdt/fdt_helper.c |  22 ++-----
 2 files changed, 39 insertions(+), 100 deletions(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index b2fa8633..7d07a13f 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -15,6 +15,7 @@
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
@@ -169,24 +170,18 @@ static int __fixup_disable_devices(void *fdt, int doff, int roff,
 
 void fdt_domain_fixup(void *fdt)
 {
-	u32 i, dcount;
-	int err, poffset, doffset;
+	u32 dcount;
+	int err, poffset, doffset, cpu_offset;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct __fixup_find_domain_offset_info fdo;
 
 	/* Remove the domain assignment DT property from CPU DT nodes */
-	poffset = fdt_path_offset(fdt, "/cpus");
-	if (poffset < 0)
-		return;
-	fdt_for_each_subnode(doffset, fdt, poffset) {
-		err = fdt_parse_hart_id(fdt, doffset, &i);
-		if (err)
+	sbi_for_each_hartindex(i) {
+		cpu_offset = fdt_cpu_hartindex_to_offset(i);
+		if (cpu_offset < 0)
 			continue;
 
-		if (!fdt_node_is_enabled(fdt, doffset))
-			continue;
-
-		fdt_nop_property(fdt, doffset, "opensbi-domain");
+		fdt_nop_property(fdt, cpu_offset, "opensbi-domain");
 	}
 
 	/* Skip device disable for root domain */
@@ -308,6 +303,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 {
 	u32 val32;
 	u64 val64;
+	u32 hartindex;
 	const u32 *val;
 	struct sbi_domain *dom;
 	struct sbi_hartmask *mask;
@@ -315,7 +311,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	struct parse_region_data preg;
 	int *cold_domain_offset = opaque;
 	struct sbi_domain_memregion *reg;
-	int i, err = 0, len, cpus_offset, cpu_offset, doffset;
+	int err = 0, len, cpu_offset, doffset;
 
 	dom = sbi_zalloc(sizeof(*dom));
 	if (!dom)
@@ -346,25 +342,11 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	SBI_HARTMASK_INIT(mask);
 	dom->possible_harts = mask;
 	val = fdt_getprop(fdt, domain_offset, "possible-harts", &len);
-	len = len / sizeof(u32);
-	if (val && len) {
-		for (i = 0; i < len; i++) {
-			cpu_offset = fdt_node_offset_by_phandle(fdt,
-							fdt32_to_cpu(val[i]));
-			if (cpu_offset < 0) {
-				err = cpu_offset;
-				goto fail_free_all;
-			}
-
-			err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
-			if (err)
-				goto fail_free_all;
-
-			if (!fdt_node_is_enabled(fdt, cpu_offset))
-				continue;
-
-			sbi_hartmask_set_hartid(val32, mask);
-		}
+	len = val ? len / sizeof(u32) : 0;
+	for (int i = 0; i < len; i++) {
+		hartindex = fdt_cpu_phandle_to_hartindex(fdt32_to_cpu(val[i]));
+		if (sbi_hartindex_valid(hartindex))
+			sbi_hartmask_set_hartindex(hartindex, mask);
 	}
 
 	/* Setup memregions from DT */
@@ -396,18 +378,14 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	dom->fw_region_inited = root.fw_region_inited;
 
 	/* Read "boot-hart" DT property */
-	val32 = -1U;
 	val = fdt_getprop(fdt, domain_offset, "boot-hart", &len);
-	if (val && len >= 4) {
-		cpu_offset = fdt_node_offset_by_phandle(fdt,
-							 fdt32_to_cpu(*val));
-		if (cpu_offset >= 0 && fdt_node_is_enabled(fdt, cpu_offset))
-			fdt_parse_hart_id(fdt, cpu_offset, &val32);
-	} else {
-		if (domain_offset == *cold_domain_offset)
-			val32 = current_hartid();
-	}
-	dom->boot_hartid = val32;
+	if (val && len >= 4)
+		hartindex = fdt_cpu_phandle_to_hartindex(fdt32_to_cpu(*val));
+	else if (domain_offset == *cold_domain_offset)
+		hartindex = current_hartindex();
+	else
+		hartindex = -1U;
+	dom->boot_hartid = sbi_hartindex_to_hartid(hartindex);
 
 	/* Read "next-arg1" DT property */
 	val64 = 0;
@@ -459,24 +437,11 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	else
 		dom->system_suspend_allowed = false;
 
-	/* Find /cpus DT node */
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0) {
-		err = cpus_offset;
-		goto fail_free_all;
-	}
-
 	/* HART to domain assignment mask based on CPU DT nodes */
 	sbi_hartmask_clear_all(&assign_mask);
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
-		if (err)
-			continue;
-
-		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(val32))
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
+	sbi_for_each_hartindex(i) {
+		cpu_offset = fdt_cpu_hartindex_to_offset(i);
+		if (cpu_offset < 0)
 			continue;
 
 		/* This is an optional property */
@@ -492,7 +457,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 		}
 
 		if (doffset == domain_offset)
-			sbi_hartmask_set_hartid(val32, &assign_mask);
+			sbi_hartmask_set_hartindex(i, &assign_mask);
 	}
 
 	/* Register the domain */
@@ -515,39 +480,23 @@ int fdt_domains_populate(const void *fdt)
 {
 	const u32 *val;
 	int cold_domain_offset;
-	u32 hartid, cold_hartid;
-	int err, len, cpus_offset, cpu_offset;
+	int len, cpu_offset;
 
 	/* Sanity checks */
 	if (!fdt)
 		return SBI_EINVAL;
 
-	/* Find /cpus DT node */
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
-
 	/* Find coldboot HART domain DT node offset */
 	cold_domain_offset = -1;
-	cold_hartid = current_hartid();
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
 
-		if (hartid != cold_hartid)
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
-			continue;
-
-		val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
-		if (val && len >= 4)
-			cold_domain_offset = fdt_node_offset_by_phandle(fdt,
-							   fdt32_to_cpu(*val));
+	cpu_offset = fdt_cpu_hartindex_to_offset(current_hartindex());
+	if (cpu_offset < 0)
+		return SBI_EINVAL;
 
-		break;
-	}
+	val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
+	if (val && len >= 4)
+		cold_domain_offset = fdt_node_offset_by_phandle(fdt,
+						   fdt32_to_cpu(*val));
 
 	/* Iterate over each domain in FDT and populate details */
 	return fdt_iterate_each_domain_ro(fdt, &cold_domain_offset,
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 232a1459..937ad83a 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_hart.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/aplic.h>
 #include <sbi_utils/irqchip/imsic.h>
@@ -371,31 +372,20 @@ static void fdt_parse_isa_extensions_one_hart(const char *isa,
 
 static int fdt_parse_isa_all_harts(const void *fdt)
 {
-	u32 hartid;
 	const fdt32_t *val;
 	unsigned long *hart_exts;
 	struct sbi_scratch *scratch;
-	int err, cpu_offset, cpus_offset, len;
+	int err, cpu_offset, len;
 
 	if (!fdt || !fdt_isa_bitmap_offset)
 		return SBI_EINVAL;
 
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
-
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
+	sbi_for_each_hartindex(i) {
+		cpu_offset = fdt_cpu_hartindex_to_offset(i);
+		if (cpu_offset < 0)
 			continue;
 
-		scratch = sbi_hartid_to_scratch(hartid);
-		if (!scratch)
-			return SBI_ENOENT;
-
+		scratch = sbi_hartindex_to_scratch(i);
 		hart_exts = sbi_scratch_offset_ptr(scratch,
 						   fdt_isa_bitmap_offset);
 
-- 
2.47.2


