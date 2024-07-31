From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:27 -0700
Subject: [PATCH 6/8] lib: sbi: Do a merging pass on memregions whenever a domain is sanitized
In-Reply-To: <20240731181629.269898-1-gregorhaas1997@gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
Message-ID: <20240731181629.269898-7-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, memregions are only merged into each other (if consecutive) when
adding a region to the root domain. This is also useful functionality for other
secondary domains, so move this functionality into the memregion sanitization
path. We also now manually need to recount root_memregs_count after calling
sbi_memregion_sanitize(), since this was done in the merging pass before.
---
 lib/sbi/sbi_domain.c    |  54 ++++++++-------------
 lib/sbi/sbi_memregion.c | 105 ++++++++++++++++++++++++++++------------
 2 files changed, 94 insertions(+), 65 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index e272d81..6b7bcc5 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -99,6 +99,7 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 static int sanitize_domain(struct sbi_domain *dom)
 {
 	int i, rc;
+	struct sbi_memregion *reg;
 
 	/* Check possible HARTs */
 	if (!dom->possible_harts) {
@@ -122,6 +123,15 @@ static int sanitize_domain(struct sbi_domain *dom)
 		return rc;
 	}
 
+	/* Recount root memregions since the above call may have consolidated
+	 * or otherwise pruned memregions away */
+	if (dom == &root) {
+		root_memregs_count = 0;
+		sbi_domain_for_each_memregion(dom, reg) {
+			root_memregs_count++;
+		}
+	}
+
 	/*
 	 * We don't need to check boot HART id of domain because if boot
 	 * HART id is not possible/assigned to this domain then it won't
@@ -290,8 +300,7 @@ int sbi_domain_register(struct sbi_domain *dom,
 int sbi_domain_root_add_memregion(const struct sbi_memregion *reg)
 {
 	int rc;
-	bool reg_merged;
-	struct sbi_memregion *nreg, *nreg1, *nreg2;
+	struct sbi_memregion *nreg;
 
 	/* Sanity checks */
 	if (!reg || domain_finalized || !root.regions ||
@@ -302,39 +311,16 @@ int sbi_domain_root_add_memregion(const struct sbi_memregion *reg)
 	nreg = &root.regions[root_memregs_count];
 	sbi_memcpy(nreg, reg, sizeof(*reg));
 	root_memregs_count++;
-       root.regions[root_memregs_count].size = 0;
-
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
+	root.regions[root_memregs_count].size = 0;
 
-		/* Merge consecutive memregions with same flags */
-		reg_merged = false;
-		sbi_domain_for_each_memregion(&root, nreg) {
-			nreg1 = nreg + 1;
-			if (!nreg1->size)
-				continue;
-
-			if ((nreg->base + nreg->size) == nreg1->base &&
-			    nreg->flags == nreg1->flags) {
-				nreg->size += nreg1->size;
-				while (nreg1->size) {
-					nreg2 = nreg1 + 1;
-					sbi_memcpy(nreg1, nreg2, sizeof(*nreg1));
-					nreg1++;
-				}
-				reg_merged = true;
-				root_memregs_count--;
-			}
-		}
-	} while (reg_merged);
+	/* Sanitize the root domain so that memregions are sorted */
+	rc = sanitize_domain(&root);
+	if (rc) {
+		sbi_printf("%s: sanity checks failed for"
+			   " %s (error %d)\n", __func__,
+			   root.name, rc);
+		return rc;
+	}
 
 	return 0;
 }
diff --git a/lib/sbi/sbi_memregion.c b/lib/sbi/sbi_memregion.c
index 56ee649..ee7403b 100644
--- a/lib/sbi/sbi_memregion.c
+++ b/lib/sbi/sbi_memregion.c
@@ -114,40 +114,11 @@ static void clear_region(struct sbi_memregion * reg)
 	sbi_memset(reg, 0x0, sizeof(*reg));
 }
 
-int sbi_memregion_sanitize(struct sbi_domain *dom)
+static void sort_memregions(struct sbi_domain *dom, int count)
 {
-	int i, j, count;
-	bool is_covered;
+	int i, j;
 	struct sbi_memregion *reg, *reg1;
 
-	/* Check memory regions */
-	if (!dom->regions) {
-		sbi_printf("%s: %s regions is NULL\n",
-			   __func__, dom->name);
-		return SBI_EINVAL;
-	}
-	sbi_domain_for_each_memregion(dom, reg) {
-		if (!is_region_valid(reg)) {
-			sbi_printf("%s: %s has invalid region base=0x%lx "
-				   "size=0x%lx flags=0x%lx\n", __func__,
-				   dom->name, reg->base, reg->size,
-				   reg->flags);
-			return SBI_EINVAL;
-		}
-	}
-
-	/* Count memory regions */
-	count = 0;
-	sbi_domain_for_each_memregion(dom, reg)
-		count++;
-
-	/* Check presence of firmware regions */
-	if (!dom->fw_region_inited) {
-		sbi_printf("%s: %s does not have firmware region\n",
-			   __func__, dom->name);
-		return SBI_EINVAL;
-	}
-
 	/* Sort the memory regions */
 	for (i = 0; i < (count - 1); i++) {
 		reg = &dom->regions[i];
@@ -160,6 +131,13 @@ int sbi_memregion_sanitize(struct sbi_domain *dom)
 			swap_region(reg, reg1);
 		}
 	}
+}
+
+static void overlap_memregions(struct sbi_domain *dom, int count)
+{
+	int i = 0, j;
+	bool is_covered;
+	struct sbi_memregion *reg, *reg1;
 
 	/* Remove covered regions */
 	while(i < (count - 1)) {
@@ -185,6 +163,71 @@ int sbi_memregion_sanitize(struct sbi_domain *dom)
 		} else
 			i++;
 	}
+}
+
+static void merge_memregions(struct sbi_domain *dom, int *nmerged)
+{
+	struct sbi_memregion *reg, *reg1, *reg2;
+
+	/* Merge consecutive memregions with same flags */
+	*nmerged = 0;
+	sbi_domain_for_each_memregion(dom, reg) {
+		reg1 = reg + 1;
+		if (!reg1->size)
+			continue;
+
+		if ((reg->base + reg->size) == reg1->base &&
+		    reg->flags == reg1->flags) {
+			reg->size += reg1->size;
+			while (reg1->size) {
+				reg2 = reg1 + 1;
+				sbi_memcpy(reg1, reg2, sizeof(*reg1));
+				reg1++;
+			}
+			(*nmerged)++;
+		}
+	}
+}
+
+int sbi_memregion_sanitize(struct sbi_domain *dom)
+{
+	int count, nmerged;
+	struct sbi_memregion *reg;
+
+	/* Check memory regions */
+	if (!dom->regions) {
+		sbi_printf("%s: %s regions is NULL\n",
+			   __func__, dom->name);
+		return SBI_EINVAL;
+	}
+
+	sbi_domain_for_each_memregion(dom, reg) {
+		if (!is_region_valid(reg)) {
+			sbi_printf("%s: %s has invalid region base=0x%lx "
+				   "size=0x%lx flags=0x%lx\n", __func__,
+				   dom->name, reg->base, reg->size,
+				   reg->flags);
+			return SBI_EINVAL;
+		}
+	}
+
+	/* Count memory regions */
+	count = 0;
+	sbi_domain_for_each_memregion(dom, reg)
+		count++;
+
+	/* Check presence of firmware regions */
+	if (!dom->fw_region_inited) {
+		sbi_printf("%s: %s does not have firmware region\n",
+			   __func__, dom->name);
+		return SBI_EINVAL;
+	}
+
+	do {
+		sort_memregions(dom, count);
+		overlap_memregions(dom, count);
+		merge_memregions(dom, &nmerged);
+	} while (nmerged);
 
 	return SBI_OK;
 }
-- 
2.45.2


