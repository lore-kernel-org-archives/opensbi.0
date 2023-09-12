From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 12 Sep 2023 20:12:30 +0800
Subject: [PATCH] lib: sbi: Add sub-regions check for sanitizing domain
Message-ID: <IA1PR20MB4953ECE2BD5CA00E14EFE892BBF1A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As the domain will reject a new memory region which has a sub-regions
already in the domain, even the new region is bigger and has the same
flags. This problem can be solved by relaxing region restriction and
rechecking when adding and sanitizing domains.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 lib/sbi/sbi_domain.c | 86 ++++++++++++++++++++++++++++++--------------
 1 file changed, 59 insertions(+), 27 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index acd0f74..8c6cbfe 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -193,20 +193,19 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
 	ulong regB_end = regB->base + (BIT(regB->order) - 1);
 
 	if ((regB_start <= regA_start) &&
-	    (regA_start < regB_end) &&
-	    (regB_start < regA_end) &&
+	    (regB_start <= regA_end) &&
+	    (regA_start <= regB_end) &&
 	    (regA_end <= regB_end))
 		return true;
 
 	return false;
 }
 
-/** Check if regionA conflicts regionB */
-static bool is_region_conflict(const struct sbi_domain_memregion *regA,
-				const struct sbi_domain_memregion *regB)
+/** Check if regionA can be replaced by regionB */
+static bool is_region_compatible(const struct sbi_domain_memregion *regA,
+				 const struct sbi_domain_memregion *regB)
 {
-	if ((is_region_subset(regA, regB) || is_region_subset(regB, regA)) &&
-	    regA->flags == regB->flags)
+	if (is_region_subset(regA, regB) && regA->flags == regB->flags)
 		return true;
 
 	return false;
@@ -264,11 +263,26 @@ static const struct sbi_domain_memregion *find_next_subset_region(
 	return ret;
 }
 
+static void swap_region(struct sbi_domain_memregion* reg1,
+			struct sbi_domain_memregion* reg2)
+{
+	struct sbi_domain_memregion treg;
+
+	sbi_memcpy(&treg, reg1, sizeof(treg));
+	sbi_memcpy(reg1, reg2, sizeof(treg));
+	sbi_memcpy(reg2, &treg, sizeof(treg));
+}
+
+static void clear_region(struct sbi_domain_memregion* reg)
+{
+	sbi_memset(reg, 0x0, sizeof(*reg));
+}
+
 static int sanitize_domain(const struct sbi_platform *plat,
 			   struct sbi_domain *dom)
 {
 	u32 i, j, count;
-	struct sbi_domain_memregion treg, *reg, *reg1;
+	struct sbi_domain_memregion *reg, *reg1;
 
 	/* Check possible HARTs */
 	if (!dom->possible_harts) {
@@ -312,28 +326,50 @@ static int sanitize_domain(const struct sbi_platform *plat,
 		return SBI_EINVAL;
 	}
 
+	/* Remove covered regions */
+	while(i < (count - 1)) {
+		reg = &dom->regions[i];
+		j = i + 1;
+		while (j < count) {
+			reg1 = &dom->regions[j];
+
+			/* reg1 is sub-region of reg, remove reg1 */
+			if (is_region_compatible(reg1, reg)) {
+				swap_region(reg1, &dom->regions[count - 1]);
+				clear_region(&dom->regions[count - 1]);
+				count--;
+				continue;
+			}
+
+			/*
+			 * reg is sub-region of reg1, replace reg with reg1
+			 * and recheck all other regions.
+			 */
+			if (is_region_compatible(reg, reg1)) {
+				swap_region(reg, reg1);
+				swap_region(reg1, &dom->regions[count - 1]);
+				clear_region(&dom->regions[count - 1]);
+				count--;
+				goto regions_recheck;
+			}
+
+			j++;
+		}
+
+		i++;
+regions_recheck:
+	}
+
 	/* Sort the memory regions */
 	for (i = 0; i < (count - 1); i++) {
 		reg = &dom->regions[i];
 		for (j = i + 1; j < count; j++) {
 			reg1 = &dom->regions[j];
 
-			if (is_region_conflict(reg1, reg)) {
-				sbi_printf("%s: %s conflict between regions "
-					"(base=0x%lx order=%lu flags=0x%lx) and "
-					"(base=0x%lx order=%lu flags=0x%lx)\n",
-					__func__, dom->name,
-					reg->base, reg->order, reg->flags,
-					reg1->base, reg1->order, reg1->flags);
-				return SBI_EINVAL;
-			}
-
 			if (!is_region_before(reg1, reg))
 				continue;
 
-			sbi_memcpy(&treg, reg1, sizeof(treg));
-			sbi_memcpy(reg1, reg, sizeof(treg));
-			sbi_memcpy(reg, &treg, sizeof(treg));
+			swap_region(reg, reg1);
 		}
 	}
 
@@ -578,12 +614,8 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 
 	/* Check for conflicts */
 	sbi_domain_for_each_memregion(&root, nreg) {
-		if (is_region_conflict(reg, nreg)) {
-			sbi_printf("%s: is_region_conflict check failed"
-			" 0x%lx conflicts existing 0x%lx\n", __func__,
-				   reg->base, nreg->base);
-			return SBI_EALREADY;
-		}
+		if (is_region_compatible(reg, nreg))
+			return 0;
 	}
 
 	/* Append the memregion to root memregions */
-- 
2.42.0


