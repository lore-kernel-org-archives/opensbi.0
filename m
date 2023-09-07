From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  7 Sep 2023 17:19:45 +0530
Subject: [PATCH v1 5/7] lib: sbi: Populate M-only Smepmp entries before setting mseccfg.MML
In-Reply-To: <20230907114947.1705425-1-mchitale@ventanamicro.com>
References: <20230907114947.1705425-1-mchitale@ventanamicro.com>
Message-ID: <20230907114947.1705425-6-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anup Patel <apatel@ventanamicro.com>

Based on sections 4.c and 4.d in Ch.2 of the Smepmp spec the PMP entries
must be programmed as below:
1. Program M-only entries
2. Enable mseccfg.MML
3. Program shared-region entries
4. Program SU-only entries

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 69 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 12 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c8aa342..435411e 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -348,6 +348,26 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 	return pmp_flags;
 }
 
+static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
+				struct sbi_domain *dom,
+				struct sbi_domain_memregion *reg,
+				unsigned int pmp_idx,
+				unsigned int pmp_flags,
+				unsigned int pmp_gran_log2,
+				unsigned long pmp_addr_max)
+{
+	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
+
+	if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max) {
+		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
+	} else {
+		sbi_printf("Can not configure pmp for domain %s because"
+			   " memory region address 0x%lx or size 0x%lx "
+			   "is not in range.\n", dom->name, reg->base,
+			   reg->order);
+	}
+}
+
 static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 				     unsigned int pmp_count,
 				     unsigned int pmp_gran_log2,
@@ -357,7 +377,6 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx = 0;
 	unsigned int pmp_flags;
-	unsigned long pmp_addr;
 
 	/*
 	 * Set the RLB so that, we can write to PMP entries without
@@ -368,32 +387,58 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	/* Disable the reserved entry */
 	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
 
+	/* Program M-only regions when MML is not set. */
 	sbi_domain_for_each_memregion(dom, reg) {
+		/* Skip reserved entry */
 		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
 			pmp_idx++;
 		if (pmp_count <= pmp_idx)
 			break;
 
+		/* Skip shared and SU-only regions */
+		if (!SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+			pmp_idx++;
+			continue;
+		}
+
 		pmp_flags = sbi_hart_get_smepmp_flags(scratch, dom, reg);
-		if (pmp_flags == 0)
+		if (!pmp_flags)
 			return 0;
 
-		pmp_addr = reg->base >> PMP_SHIFT;
-		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max) {
-			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
-		} else {
-			sbi_printf("Can not configure pmp for domain %s because"
-				   " memory region address 0x%lx or size 0x%lx "
-				   "is not in range.\n", dom->name, reg->base,
-				   reg->order);
+		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
+				    pmp_gran_log2, pmp_addr_max);
+	}
+
+	pmp_idx=0;
+	/* Set the MML to enforce new encoding */
+	csr_set(CSR_MSECCFG, MSECCFG_MML);
+
+	/* Program shared and SU-only regions */
+	sbi_domain_for_each_memregion(dom, reg) {
+		/* Skip reserved entry */
+		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
+			pmp_idx++;
+		if (pmp_count <= pmp_idx)
+			break;
+
+		/* Skip M-only regions */
+		if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+			pmp_idx++;
+			continue;
 		}
+
+		pmp_flags = sbi_hart_get_smepmp_flags(scratch, dom, reg);
+		if (!pmp_flags)
+			return 0;
+
+		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
+				    pmp_gran_log2, pmp_addr_max);
 	}
 
 	/*
-	 * All entries are programmed. Enable MML bit.
+	 * All entries are programmed.
 	 * Keep the RLB bit so that dynamic mappings can be done.
 	 */
-	csr_set(CSR_MSECCFG, (MSECCFG_RLB | MSECCFG_MML));
 
 	return 0;
 }
-- 
2.34.1


