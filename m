From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  7 Sep 2023 17:19:42 +0530
Subject: [PATCH v1 2/7] lib: sbi: Factor-out Smepmp configuration as separate function
In-Reply-To: <20230907114947.1705425-1-mchitale@ventanamicro.com>
References: <20230907114947.1705425-1-mchitale@ventanamicro.com>
Message-ID: <20230907114947.1705425-3-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anup Patel <apatel@ventanamicro.com>

Let us factor-out Smepmp configuaration as separate function so
that code is more readable.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 180 +++++++++++++++++++++++++++------------------
 1 file changed, 110 insertions(+), 70 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index f7cefe4..48784c8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -288,9 +288,9 @@ unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
 /*
  * Returns Smepmp flags for a given domain and region based on permissions.
  */
-unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
-				       struct sbi_domain *dom,
-				       struct sbi_domain_memregion *reg)
+static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
+					      struct sbi_domain *dom,
+					      struct sbi_domain_memregion *reg)
 {
 	unsigned int pmp_flags = 0;
 
@@ -348,6 +348,103 @@ unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 	return pmp_flags;
 }
 
+static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
+				     unsigned int pmp_count,
+				     unsigned int pmp_gran_log2,
+				     unsigned long pmp_addr_max)
+{
+	struct sbi_domain_memregion *reg;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	unsigned int pmp_idx = 0;
+	unsigned int pmp_flags;
+	unsigned long pmp_addr;
+
+	/*
+	 * Set the RLB and clear MML so that, we can write to
+	 * entries without enforcement even if some entries
+	 * are locked.
+	 */
+	csr_set(CSR_MSECCFG, MSECCFG_RLB);
+	csr_clear(CSR_MSECCFG, MSECCFG_MML);
+
+	/* Disable the reserved entry */
+	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+
+	sbi_domain_for_each_memregion(dom, reg) {
+		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
+			pmp_idx++;
+		if (pmp_count <= pmp_idx)
+			break;
+
+		pmp_flags = sbi_hart_get_smepmp_flags(scratch, dom, reg);
+		if (pmp_flags == 0)
+			return 0;
+
+		pmp_addr = reg->base >> PMP_SHIFT;
+		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max) {
+			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
+		} else {
+			sbi_printf("Can not configure pmp for domain %s because"
+				   " memory region address 0x%lx or size 0x%lx "
+				   "is not in range.\n", dom->name, reg->base,
+				   reg->order);
+		}
+	}
+
+	/*
+	 * All entries are programmed. Enable MML bit.
+	 * Keep the RLB bit so that dynamic mappings can be done.
+	 */
+	csr_set(CSR_MSECCFG, (MSECCFG_RLB | MSECCFG_MML));
+
+	return 0;
+}
+
+static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
+				     unsigned int pmp_count,
+				     unsigned int pmp_gran_log2,
+				     unsigned long pmp_addr_max)
+{
+	struct sbi_domain_memregion *reg;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	unsigned int pmp_idx = 0;
+	unsigned int pmp_flags;
+	unsigned long pmp_addr;
+
+	sbi_domain_for_each_memregion(dom, reg) {
+		if (pmp_count <= pmp_idx)
+			break;
+
+		pmp_flags = 0;
+
+		/*
+		 * If permissions are to be enforced for all modes on
+		 * this region, the lock bit should be set.
+		 */
+		if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
+			pmp_flags |= PMP_L;
+
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+			pmp_flags |= PMP_R;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+			pmp_flags |= PMP_W;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+			pmp_flags |= PMP_X;
+
+		pmp_addr = reg->base >> PMP_SHIFT;
+		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max) {
+			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
+		} else {
+			sbi_printf("Can not configure pmp for domain %s because"
+				   " memory region address 0x%lx or size 0x%lx "
+				   "is not in range.\n", dom->name, reg->base,
+				   reg->order);
+		}
+	}
+
+	return 0;
+}
+
 int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 {
 	/* shared R/W access for M and S/U mode */
@@ -392,12 +489,10 @@ int sbi_hart_unmap_saddr(void)
 
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 {
-	struct sbi_domain_memregion *reg;
-	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned int pmp_idx = 0;
-	unsigned int pmp_flags, pmp_bits, pmp_gran_log2;
+	int rc;
+	unsigned int pmp_bits, pmp_gran_log2;
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
-	unsigned long pmp_addr = 0, pmp_addr_max = 0;
+	unsigned long pmp_addr_max;
 
 	if (!pmp_count)
 		return 0;
@@ -406,67 +501,12 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
 	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
 
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
-		/* Reserve first entry for dynamic shared mappings */
-		 pmp_idx = SBI_SMEPMP_RESV_ENTRY + 1;
-
-		/*
-		 * Set the RLB and clear MML so that, we can write to
-		 * entries without enforcement even if some entries
-		 * are locked.
-		 */
-		csr_set(CSR_MSECCFG, MSECCFG_RLB);
-		csr_clear(CSR_MSECCFG, MSECCFG_MML);
-
-		/* Disable the reserved entry */
-		pmp_disable(SBI_SMEPMP_RESV_ENTRY);
-	}
-
-	sbi_domain_for_each_memregion(dom, reg) {
-		if (pmp_count <= pmp_idx)
-			break;
-
-		pmp_flags = 0;
-
-		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
-			pmp_flags = sbi_hart_get_smepmp_flags(scratch, dom, reg);
-
-			if (pmp_flags == 0)
-				return 0;
-		} else {
-			/*
-			 * If permissions are to be enforced for all modes on
-			 * this region, the lock bit should be set.
-			 */
-			if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
-				pmp_flags |= PMP_L;
-
-			if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
-				pmp_flags |= PMP_R;
-			if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
-				pmp_flags |= PMP_W;
-			if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-				pmp_flags |= PMP_X;
-		}
-
-		pmp_addr =  reg->base >> PMP_SHIFT;
-		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max) {
-			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
-		} else {
-			sbi_printf("Can not configure pmp for domain %s because"
-				   " memory region address 0x%lx or size 0x%lx "
-				   "is not in range.\n", dom->name, reg->base,
-				   reg->order);
-		}
-	}
-
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP)) {
-		/*
-		 * All entries are programmed. Enable MML bit.
-		 * Keep the RLB bit so that dynamic mappings can be done.
-		 */
-		csr_set(CSR_MSECCFG, (MSECCFG_RLB | MSECCFG_MML));
-	}
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
+		rc = sbi_hart_smepmp_configure(scratch, pmp_count,
+						pmp_gran_log2, pmp_addr_max);
+	else
+		rc = sbi_hart_oldpmp_configure(scratch, pmp_count,
+						pmp_gran_log2, pmp_addr_max);
 
 	/*
 	 * As per section 3.7.2 of privileged specification v1.12,
@@ -489,7 +529,7 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 			__sbi_hfence_gvma_all();
 	}
 
-	return 0;
+	return rc;
 }
 
 int sbi_hart_priv_version(struct sbi_scratch *scratch)
-- 
2.34.1


