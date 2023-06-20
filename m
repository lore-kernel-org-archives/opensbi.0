From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Jun 2023 20:08:17 +0530
Subject: [PATCH 5/6] lib: sbi: Add support for Smepmp
In-Reply-To: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
References: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
Message-ID: <20230620143817.2748474-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- If Smepmp is enabled, the access flags of an entry are determined based on
  truth table defined in Smepmp.
- First PMP entry (index 0) is reserved.
- Existing boot PMP entries start from index 1.
- Since enabling Smepmp revokes the access privileges of the M-mode software
  on S/U-mode region, first PMP entry is used to map/unmap the shared memory
  between M and S/U-mode. This allows a temporary access window for the M-mode
  software to read/write to S/U-mode memory region.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi/sbi_hart.h |  17 ++++
 lib/sbi/sbi_domain.c   |  14 +++-
 lib/sbi/sbi_hart.c     | 176 ++++++++++++++++++++++++++++++++++++-----
 lib/sbi/sbi_init.c     |  22 +++---
 4 files changed, 197 insertions(+), 32 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 9582b52..9fb9f53 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -43,6 +43,21 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_MAX,
 };
 
+/*
+ * Smepmp enforces access boundaries between M-mode and
+ * S/U-mode. When it is enabled, the PMPs are programmed
+ * such that M-mode doesn't have access to S/U-mode memory.
+ *
+ * To give M-mode R/W access to the shared memory between M and
+ * S/U-mode, first entry is reserved. It is disabled at boot.
+ * When shared memory access is required, the physical address
+ * should be programmed into the first PMP entry with R/W
+ * permissions to the M-mode. Once the work is done, it should be
+ * unmapped. sbi_hart_map_saddr/sbi_hart_unmap_saddr function
+ * pair should be used to map/unmap the shared memory.
+ */
+#define SBI_SMEPMP_RESV_ENTRY		0
+
 struct sbi_hart_features {
 	bool detected;
 	int priv_version;
@@ -74,6 +89,8 @@ unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
+int sbi_hart_map_saddr(unsigned long base, unsigned long size);
+int sbi_hart_unmap_saddr(void);
 int sbi_hart_priv_version(struct sbi_scratch *scratch);
 void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
 				   char *version_str, int nvstr);
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 38a5902..acd0f74 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -772,11 +772,17 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 
 	root.fw_region_inited = true;
 
-	/* Root domain allow everything memory region */
+	/*
+	 * Allow SU RWX on rest of the memory region. Since pmp entries
+	 * have implicit priority on index, previous entries will
+	 * deny access to SU on M-mode region. Also, M-mode will not
+	 * have access to SU region while previous entries will allow
+	 * access to M-mode regions.
+	 */
 	sbi_domain_memregion_init(0, ~0UL,
-				  (SBI_DOMAIN_MEMREGION_READABLE |
-				   SBI_DOMAIN_MEMREGION_WRITEABLE |
-				   SBI_DOMAIN_MEMREGION_EXECUTABLE),
+				  (SBI_DOMAIN_MEMREGION_SU_READABLE |
+				   SBI_DOMAIN_MEMREGION_SU_WRITABLE |
+				   SBI_DOMAIN_MEMREGION_SU_EXECUTABLE),
 				  &root_memregs[root_memregs_count++]);
 
 	/* Root domain memory region end */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c328243..9678e37 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -292,11 +292,122 @@ unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
 	return hfeatures->mhpm_bits;
 }
 
+/*
+ * Returns Smepmp flags for a given domain and region based on permissions.
+ */
+unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
+				       struct sbi_domain *dom,
+				       struct sbi_domain_memregion *reg)
+{
+	unsigned int pmp_flags = 0;
+
+	if (SBI_DOMAIN_MEMREGION_IS_SHARED(reg->flags)) {
+		/* Read only for both M and SU modes */
+		if ((reg->flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK)
+		    == SBI_DOMAIN_MEMREGION_SHARED_RDONLY)
+			pmp_flags = (PMP_R | PMP_W | PMP_X);
+
+		/* Execute for SU but Read/Execute for M mode */
+		else if ((reg->flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK)
+			 == SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX)
+			/* locked region */
+			pmp_flags = (PMP_L | PMP_W | PMP_X);
+
+		/* Execute only for both M and SU modes */
+		else if ((reg->flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK)
+			 == SBI_DOMAIN_MEMREGION_SHARED_SUX_MX)
+			pmp_flags = (PMP_L | PMP_W);
+
+		/* Read/Write for both M and SU modes */
+		else if ((reg->flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK)
+			 == SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW)
+			pmp_flags = (PMP_W | PMP_X);
+
+		/* Read only for SU mode but Read/Write for M mode */
+		else if ((reg->flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK)
+			 == SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW)
+			pmp_flags = (PMP_W);
+	} else if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+		/*
+		 * When smepmp is supported and used, M region cannot have RWX
+		 * permissions on any region.
+		 */
+		if ((reg->flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
+		    == SBI_DOMAIN_MEMREGION_M_RWX) {
+			sbi_printf("%s: M-mode only regions cannot have"
+				   "RWX permissions\n", __func__);
+			return 0;
+		}
+
+		/* M-mode only access regions are always locked */
+		pmp_flags |= PMP_L;
+
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
+			pmp_flags |= PMP_R;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
+			pmp_flags |= PMP_W;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+			pmp_flags |= PMP_X;
+	} else if (SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(reg->flags)) {
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+			pmp_flags |= PMP_R;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+			pmp_flags |= PMP_W;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+			pmp_flags |= PMP_X;
+	}
+
+	return pmp_flags;
+}
+
+int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
+{
+	/* shared R/W access for M and S/U mode */
+	unsigned int pmp_flags = (PMP_W | PMP_X);
+	unsigned long order, base = 0;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	/* If Smepmp is not supported no special mapping is required */
+	if (!sbi_hart_smepmp_supported(scratch))
+		return SBI_OK;
+
+	if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
+		return SBI_ENOSPC;
+
+	for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
+		if (order < __riscv_xlen) {
+			base = addr & ~((1UL << order) - 1UL);
+			if ((base <= addr) &&
+			    (addr < (base + (1UL << order))) &&
+			    (base <= (addr + size - 1UL)) &&
+			    ((addr + size - 1UL) < (base + (1UL << order))))
+				break;
+		} else {
+			return SBI_EFAIL;
+		}
+	}
+
+	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
+
+	return SBI_OK;
+}
+
+int sbi_hart_unmap_saddr(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	if (!sbi_hart_smepmp_supported(scratch))
+		return SBI_OK;
+
+	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+}
+
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 {
 	struct sbi_domain_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	unsigned int pmp_idx = 0, pmp_flags, pmp_bits, pmp_gran_log2;
+	unsigned int pmp_idx = 0;
+	unsigned int pmp_flags, pmp_bits, pmp_gran_log2;
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 	unsigned long pmp_addr = 0, pmp_addr_max = 0;
 
@@ -307,36 +418,63 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 	pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
 	pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
 
+	if (sbi_hart_smepmp_supported(scratch)) {
+		/* Reserve first entry for dynamic shared mappings */
+		 pmp_idx = SBI_SMEPMP_RESV_ENTRY + 1;
+
+		/*
+		 * Set the RLB now so that, we can write to entries
+		 * even if some entries are locked.
+		 */
+		csr_write(CSR_MSECCFG, MSECCFG_RLB);
+
+		/* Disable the reserved entry */
+		pmp_disable(SBI_SMEPMP_RESV_ENTRY);
+	}
+
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (pmp_count <= pmp_idx)
 			break;
 
 		pmp_flags = 0;
 
-		/*
-		 * If permissions are to be enforced for all modes on this
-		 * region, the lock bit should be set.
-		 */
-		if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
-			pmp_flags |= PMP_L;
-
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
-			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
-			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-			pmp_flags |= PMP_X;
+		if (sbi_hart_smepmp_supported(scratch)) {
+			pmp_flags = sbi_hart_get_smepmp_flags(scratch, dom, reg);
+
+			if (pmp_flags == 0)
+				return 0;
+		} else {
+			/*
+			 * If permissions are to be enforced for all modes on
+			 * this region, the lock bit should be set.
+			 */
+			if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
+				pmp_flags |= PMP_L;
+
+			if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+				pmp_flags |= PMP_R;
+			if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+				pmp_flags |= PMP_W;
+			if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+				pmp_flags |= PMP_X;
+		}
 
 		pmp_addr =  reg->base >> PMP_SHIFT;
-		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max)
+		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max) {
 			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
-		else {
-			sbi_printf("Can not configure pmp for domain %s", dom->name);
-			sbi_printf(" because memory region address %lx or size %lx is not in range\n",
-				    reg->base, reg->order);
+		} else {
+			sbi_printf("Can not configure pmp for domain %s because"
+				   " memory region address 0x%lx or size 0x%lx "
+				   "is not in range.\n", dom->name, reg->base,
+				   reg->order);
 		}
 	}
 
+	if (sbi_hart_smepmp_supported(scratch)) {
+		/* All entries are programmed. Enable MML bit. */
+		csr_write(CSR_MSECCFG, (MSECCFG_RLB | MSECCFG_MML));
+	}
+
 	/*
 	 * As per section 3.7.2 of privileged specification v1.12,
 	 * virtual address translations can be speculatively performed
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 31d2c3e..82078d9 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -358,13 +358,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
-	rc = sbi_hart_pmp_configure(scratch);
-	if (rc) {
-		sbi_printf("%s: PMP configure failed (error %d)\n",
-			   __func__, rc);
-		sbi_hart_hang();
-	}
-
 	/*
 	 * Note: Platform final initialization should be after finalizing
 	 * domains so that it sees correct domain assignment and PMP
@@ -394,6 +387,17 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_boot_print_hart(scratch, hartid);
 
+	/*
+	 * Configure PMP at last because if SMEPMP is detected,
+	 * M-mode access to the S/U space will be rescinded.
+	 */
+	rc = sbi_hart_pmp_configure(scratch);
+	if (rc) {
+		sbi_printf("%s: PMP configure failed (error %d)\n",
+			   __func__, rc);
+		sbi_hart_hang();
+	}
+
 	wake_coldboot_harts(scratch, hartid);
 
 	count = sbi_scratch_offset_ptr(scratch, init_count_offset);
@@ -447,11 +451,11 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_pmp_configure(scratch);
+	rc = sbi_platform_final_init(plat, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_platform_final_init(plat, false);
+	rc = sbi_hart_pmp_configure(scratch);
 	if (rc)
 		sbi_hart_hang();
 
-- 
2.34.1


