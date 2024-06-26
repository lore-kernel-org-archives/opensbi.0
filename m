From: Xiang W <wxjstz@126.com>
Date: Thu, 27 Jun 2024 01:48:14 +0800
Subject: [PATCH 3/3] lib: sbi: Improve memory region merging
In-Reply-To: <20240626174816.2837278-1-wxjstz@126.com>
References: <20240626174816.2837278-1-wxjstz@126.com>
Message-ID: <20240626174816.2837278-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous merging method can only merge blocks of the same order.
The current merging method can merge blocks of different orders.
The tor type of pmp can be used to save pmp configuration registers.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain.c | 254 +++++++++++++++++++++++++++++--------------
 1 file changed, 172 insertions(+), 82 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 9a9fce1..4d8d995 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -279,17 +279,175 @@ static void swap_region(struct sbi_domain_memregion* reg1,
 	sbi_memcpy(reg2, &treg, sizeof(treg));
 }
 
-static void clear_region(struct sbi_domain_memregion* reg)
+static bool merge_find_near(struct sbi_domain *dom,
+				unsigned long flags,
+			        unsigned long *start,
+				unsigned long *end,
+				unsigned long *bmap)
 {
-	sbi_memset(reg, 0x0, sizeof(*reg));
+	bool found, ret = false;
+	int i;
+	unsigned long s, e, s1, e1;
+	struct sbi_domain_memregion *reg;
+	s = *start;
+	e = *end;
+	do {
+		found = false;
+		i = 0;
+		sbi_domain_for_each_memregion(dom, reg) {
+			i++;
+			if (__test_bit(i- 1, bmap))
+				continue;
+			if (flags != reg->flags)
+				continue;
+			s1 = memregion_start(reg);
+			e1 = memregion_end(reg);
+			if (e1 < s - 1 ||  s1 > e + 1)
+				continue;
+			found = true;
+			__set_bit(i - 1, bmap);
+			s = MIN(s, s1);
+			e = MAX(e, e1);
+		}
+		ret = ret || found;
+	} while (found);
+	*start = s;
+	*end = e;
+
+	return ret;
 }
 
-static int sanitize_domain(struct sbi_domain *dom)
+static void merge_del_helper(struct sbi_domain *dom,
+			unsigned long *regions_count, unsigned long *bmap)
+{
+	int i, s = 0, count = *regions_count;
+	for (i = count - 1; i >= 0; i--) {
+		if (!__test_bit(i, bmap))
+			s += sizeof(struct sbi_domain_memregion);
+		else {
+			sbi_memmove(dom->regions + i, dom->regions + i + 1, s);
+			count--;
+		}
+	}
+
+	dom->regions[count].order = 0;
+	*regions_count = count;
+}
+
+static bool merge_add_helper(struct sbi_domain *dom,
+				unsigned long *regions_count,
+				unsigned long *bmap, unsigned long start,
+				unsigned long end, unsigned long flags)
 {
-	u32 i, j, count;
-	bool is_covered;
+	int cnt = 0;
+	unsigned long pos, order, size, s;
+	end = end + 1;
+	size = end - start;
+	if (sbi_popcount(size) > 2) {
+		merge_del_helper(dom, regions_count, bmap);
+
+		dom->regions[*regions_count].base = start;
+		dom->regions[*regions_count].size = size;
+		dom->regions[*regions_count].order = 1;
+		dom->regions[*regions_count].flags = flags;
+		(*regions_count)++;
+		dom->regions[*regions_count].order = 0;
+		return true;
+	}
+
+
+	pos = start;
+	while (pos < end) {
+		s = end - pos;
+		order = sbi_ffs(pos);
+		if (BIT(order) > s)
+			order = sbi_fls(s);
+		pos = pos + BIT(order);
+		cnt++;
+	}
+	if (cnt >= sbi_popcount(*bmap))
+		return false;
+
+	merge_del_helper(dom, regions_count, bmap);
+
+	pos = start;
+	while (pos < end) {
+		s = end - pos;
+		order = sbi_ffs(pos);
+		if (BIT(order) > s)
+			order = sbi_fls(s);
+		dom->regions[*regions_count].base = pos;
+		dom->regions[*regions_count].size = 0;
+		dom->regions[*regions_count].order = order;
+		dom->regions[*regions_count].flags = flags;
+		(*regions_count)++;
+		pos = pos + BIT(order);
+	}
+	dom->regions[*regions_count].order = 0;
+
+	return true;
+}
+
+static int merge_region(struct sbi_domain *dom)
+{
+	int i, j;
+	bool found;
+	unsigned long bmap, start, end, regions_count;
 	struct sbi_domain_memregion *reg, *reg1;
 
+	/* Count memory regions */
+	regions_count = root_memregs_count;
+	if (dom != &root) {
+		regions_count = 0;
+		sbi_domain_for_each_memregion(dom, reg)
+			regions_count++;
+	}
+
+	/*
+	 * bmap is used to record near regions that may be merged. The number of
+	 * regions cannot exceed the number of bits in bmap.
+	 */
+	if (regions_count > BITS_PER_LONG)
+		return SBI_EINVAL;
+
+	i = 0;
+	while(i < regions_count) {
+		reg = dom->regions + i;
+		bmap = 1UL << i;
+		start = memregion_start(reg);
+		end = memregion_end(reg);
+		found = merge_find_near(dom, reg->flags, &start, &end, &bmap);
+		if (found) {
+			if (merge_add_helper(dom, &regions_count, &bmap,
+						start, end, reg->flags))
+				continue;
+		}
+		i++;
+	}
+
+	/* Sort the memory regions */
+	for (i = 0; i < (regions_count - 1); i++) {
+		reg = &dom->regions[i];
+		for (j = i + 1; j < regions_count; j++) {
+			reg1 = &dom->regions[j];
+
+			if (!is_region_before(reg1, reg))
+				continue;
+
+			swap_region(reg, reg1);
+		}
+	}
+
+	if (dom == &root)
+		root_memregs_count = regions_count;
+	return SBI_OK;
+}
+
+static int sanitize_domain(struct sbi_domain *dom)
+{
+	u32 i;
+	struct sbi_domain_memregion *reg;
+
 	/* Check possible HARTs */
 	if (!dom->possible_harts) {
 		sbi_printf("%s: %s possible HART mask is NULL\n",
@@ -321,11 +479,6 @@ static int sanitize_domain(struct sbi_domain *dom)
 		}
 	}
 
-	/* Count memory regions */
-	count = 0;
-	sbi_domain_for_each_memregion(dom, reg)
-		count++;
-
 	/* Check presence of firmware regions */
 	if (!dom->fw_region_inited) {
 		sbi_printf("%s: %s does not have firmware region\n",
@@ -333,43 +486,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 		return SBI_EINVAL;
 	}
 
-	/* Sort the memory regions */
-	for (i = 0; i < (count - 1); i++) {
-		reg = &dom->regions[i];
-		for (j = i + 1; j < count; j++) {
-			reg1 = &dom->regions[j];
-
-			if (!is_region_before(reg1, reg))
-				continue;
-
-			swap_region(reg, reg1);
-		}
-	}
-
-	/* Remove covered regions */
-	while(i < (count - 1)) {
-		is_covered = false;
-		reg = &dom->regions[i];
-
-		for (j = i + 1; j < count; j++) {
-			reg1 = &dom->regions[j];
-
-			if (is_region_compatible(reg, reg1)) {
-				is_covered = true;
-				break;
-			}
-		}
-
-		/* find a region is superset of reg, remove reg */
-		if (is_covered) {
-			for (j = i; j < (count - 1); j++)
-				swap_region(&dom->regions[j],
-					    &dom->regions[j + 1]);
-			clear_region(&dom->regions[count - 1]);
-			count--;
-		} else
-			i++;
-	}
+	merge_region(dom);
 
 	/*
 	 * We don't need to check boot HART id of domain because if boot
@@ -605,8 +722,7 @@ int sbi_domain_register(struct sbi_domain *dom,
 int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 {
 	int rc;
-	bool reg_merged;
-	struct sbi_domain_memregion *nreg, *nreg1, *nreg2;
+	struct sbi_domain_memregion *nreg;
 
 	/* Sanity checks */
 	if (!reg || domain_finalized || !root.regions ||
@@ -625,39 +741,13 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 	root_memregs_count++;
 	root.regions[root_memregs_count].order = 0;
 
-	/* Sort and optimize root regions */
-	do {
-		/* Sanitize the root domain so that memregions are sorted */
-		rc = sanitize_domain(&root);
-		if (rc) {
-			sbi_printf("%s: sanity checks failed for"
-				   " %s (error %d)\n", __func__,
-				   root.name, rc);
-			return rc;
-		}
-
-		/* Merge consecutive memregions with same order and flags */
-		reg_merged = false;
-		sbi_domain_for_each_memregion(&root, nreg) {
-			nreg1 = nreg + 1;
-			if (!nreg1->order)
-				continue;
-
-			if (!(nreg->base & (BIT(nreg->order + 1) - 1)) &&
-			    (nreg->base + BIT(nreg->order)) == nreg1->base &&
-			    nreg->order == nreg1->order &&
-			    nreg->flags == nreg1->flags) {
-				nreg->order++;
-				while (nreg1->order) {
-					nreg2 = nreg1 + 1;
-					sbi_memcpy(nreg1, nreg2, sizeof(*nreg1));
-					nreg1++;
-				}
-				reg_merged = true;
-				root_memregs_count--;
-			}
-		}
-	} while (reg_merged);
+	rc = sanitize_domain(&root);
+	if (rc) {
+		sbi_printf("%s: sanity checks failed for"
+			   " %s (error %d)\n", __func__,
+			   root.name, rc);
+		return rc;
+	}
 
 	return 0;
 }
-- 
2.43.0


