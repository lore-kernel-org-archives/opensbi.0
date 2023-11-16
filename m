From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 16 Nov 2023 18:49:39 +0800
Subject: [PATCH v4 2/2] lib: sbi: Add regions merging when sanitizing domain region
In-Reply-To: <IA1PR20MB49535E12C4609D9816C7C824BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535E12C4609D9816C7C824BBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB4953FEB382550CB12FA24E2FBBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
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
 lib/sbi/sbi_domain.c | 59 +++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 71cb381..bc60562 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -193,12 +193,11 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
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
@@ -266,6 +265,11 @@ static void swap_region(struct sbi_domain_memregion* reg1,
 	sbi_memcpy(reg2, &treg, sizeof(treg));
 }
 
+static void clear_region(struct sbi_domain_memregion* reg)
+{
+	sbi_memset(reg, 0x0, sizeof(*reg));
+}
+
 static int sanitize_domain(struct sbi_domain *dom)
 {
 	u32 i, j, count;
@@ -320,16 +324,6 @@ static int sanitize_domain(struct sbi_domain *dom)
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
 
@@ -337,6 +331,31 @@ static int sanitize_domain(struct sbi_domain *dom)
 		}
 	}
 
+	/* Remove covered regions */
+	while(i < (count - 1)) {
+		bool need_removed = false;
+		reg = &dom->regions[i];
+
+		for (j = i + 1; j < count; j++) {
+			reg1 = &dom->regions[j];
+
+			if (is_region_compatible(reg, reg1)) {
+				need_removed = true;
+				break;
+			}
+		}
+
+		/* find a region is superset of reg, remove reg */
+		if (need_removed) {
+			for (j = i; j < (count - 1); j++)
+				swap_region(&dom->regions[j],
+					    &dom->regions[j + 1]);
+			clear_region(&dom->regions[count - 1]);
+			count--;
+		} else
+			i++;
+	}
+
 	/*
 	 * We don't need to check boot HART id of domain because if boot
 	 * HART id is not possible/assigned to this domain then it won't
@@ -576,14 +595,10 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 	    (ROOT_REGION_MAX <= root_memregs_count))
 		return SBI_EINVAL;
 
-	/* Check for conflicts */
+	/* Check whether compatible region exists for the new one */
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
2.42.1


