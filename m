From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:28 -0700
Subject: [PATCH 7/8] lib: sbi: Remove PMP assumptions from memregion
In-Reply-To: <20240731181629.269898-1-gregorhaas1997@gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
Message-ID: <20240731181629.269898-8-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the application of PMP assumptions (naturally-aligned power-of-two) from
memregion initialization time to isolation primitive application time. We
introduce a new parameter to sbi_memregion_sanitize(), indicating for which
isolation primitive to sanitize the domain's memregions. During memregion
discoverty time, this parameter is set to SBI_ISOLATION_UNKNOWN which simply
keeps the memregions as-is. Then, later, when applying an isolation primitive
(currently either PMP or SMEPMP), we call sbi_memregion_sanitize() again with
SBI_ISOLATION_{PMP,SMEPMP} in order to finalize the memregions for application.
---
 include/sbi/sbi_domain.h     |   2 +
 include/sbi/sbi_hart.h       |   2 +-
 include/sbi/sbi_memregion.h  |  19 ++++--
 lib/sbi/sbi_domain.c         |  27 ++-------
 lib/sbi/sbi_domain_context.c |   2 +-
 lib/sbi/sbi_hart.c           |  16 ++++-
 lib/sbi/sbi_init.c           |   6 +-
 lib/sbi/sbi_memregion.c      | 109 ++++++++++++++++++++++++++++-------
 8 files changed, 128 insertions(+), 55 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 74e3ea9..8fbd081 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -44,6 +44,8 @@ struct sbi_domain {
 	struct sbi_context *hartindex_to_context_table[SBI_HARTMASK_MAX_BITS];
 	/** Array of memory regions terminated by a region with order zero */
 	struct sbi_memregion *regions;
+	/** Current isolation mode */
+	enum sbi_isolation_method isol_mode;
 	/** HART id of the HART booting this domain */
 	u32 boot_hartid;
 	/** Arg1 (or 'a1' register) of next booting stage for this domain */
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 81ec061..81b08ab 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -123,7 +123,7 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
-int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
+int sbi_hart_isolation_configure(struct sbi_scratch *scratch);
 int sbi_hart_map_saddr(unsigned long base, unsigned long size);
 int sbi_hart_unmap_saddr(void);
 int sbi_hart_priv_version(struct sbi_scratch *scratch);
diff --git a/include/sbi/sbi_memregion.h b/include/sbi/sbi_memregion.h
index 99faba7..4f62a9a 100644
--- a/include/sbi/sbi_memregion.h
+++ b/include/sbi/sbi_memregion.h
@@ -2,6 +2,13 @@
 #ifndef __SBI_MEMREGION_H__
 #define __SBI_MEMREGION_H__
 
+/** Domain isolation types */
+enum sbi_isolation_method {
+	SBI_ISOLATION_UNKNOWN = 0,
+	SBI_ISOLATION_PMP,
+	SBI_ISOLATION_SMEPMP,
+};
+
 #include <sbi/sbi_domain.h>
 
 /** Domain access types */
@@ -164,13 +171,15 @@ void sbi_memregion_init(unsigned long addr,
 			struct sbi_memregion *reg);
 
 /**
+ * Sanitize a domain's memory regions based on the selected isolation
+ * type. This function should encode any constraints on region
+ * information, such as address alignment or sizing requirements.
  *
- * Traverse all of a domain's memory regions and sanitize
- * them, while making sure they are formatted properly
- *
- * @param dom the domain for which to sanitize regions
+ * @param dom the domain to sanitize
+ * @param type the isolation type to apply
  */
-int sbi_memregion_sanitize(struct sbi_domain *dom);
+int sbi_memregion_sanitize(struct sbi_domain *dom,
+			   enum sbi_isolation_method type);
 
 /**
  * Check whether we can access specified address for given mode and
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 6b7bcc5..638ffa9 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -116,7 +116,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 		}
 	}
 
-	rc = sbi_memregion_sanitize(dom);
+	rc = sbi_memregion_sanitize(dom, SBI_ISOLATION_UNKNOWN);
 	if (rc) {
 		sbi_printf("%s: %s has unsanitizable regions\n",
 			   __func__, dom->name);
@@ -328,28 +328,9 @@ int sbi_domain_root_add_memregion(const struct sbi_memregion *reg)
 int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 			   unsigned long align, unsigned long region_flags)
 {
-	int rc;
-	unsigned long pos, end, rsize;
 	struct sbi_memregion reg;
-
-	pos = addr;
-	end = addr + size;
-	while (pos < end) {
-		rsize = pos & (align - 1);
-		if (rsize)
-			rsize = 1UL << sbi_ffs(pos);
-		else
-			rsize = ((end - pos) < align) ?
-				(end - pos) : align;
-
-		sbi_memregion_init(pos, rsize, region_flags, &reg);
-		rc = sbi_domain_root_add_memregion(&reg);
-		if (rc)
-			return rc;
-		pos += rsize;
-	}
-
-	return 0;
+	sbi_memregion_init(addr, size, region_flags, &reg);
+	return sbi_domain_root_add_memregion(&reg);
 }
 
 int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
@@ -372,7 +353,7 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 		/* Domain boot HART index */
 		dhart = sbi_hartid_to_hartindex(dom->boot_hartid);
 
-		/* Ignore of boot HART is off limits */
+		/* Ignore if boot HART is off limits */
 		if (!sbi_hartindex_valid(dhart))
 			continue;
 
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 49a2f76..750f016 100755
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -48,7 +48,7 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
 	for (int i = 0; i < pmp_count; i++) {
 		pmp_disable(i);
 	}
-	sbi_hart_pmp_configure(scratch);
+	sbi_hart_isolation_configure(scratch);
 
 	/* Save current CSR context and restore target domain's CSR context */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index e82045c..df7ee98 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -378,10 +378,16 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 				     unsigned int pmp_log2gran,
 				     unsigned long pmp_addr_max)
 {
+	int rc;
 	struct sbi_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx, pmp_flags;
 
+	rc = sbi_memregion_sanitize(dom, SBI_ISOLATION_SMEPMP);
+	if (rc < 0) {
+		return rc;
+	}
+
 	/*
 	 * Set the RLB so that, we can write to PMP entries without
 	 * enforcement even if some entries are locked.
@@ -453,6 +459,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 				     unsigned int pmp_log2gran,
 				     unsigned long pmp_addr_max)
 {
+	int rc;
 	struct sbi_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx = 0;
@@ -460,6 +467,11 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 	unsigned long pmp_addr;
 	unsigned long order;
 
+	rc = sbi_memregion_sanitize(dom, SBI_ISOLATION_PMP);
+	if (rc < 0) {
+		return rc;
+	}
+
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (pmp_count <= pmp_idx)
 			break;
@@ -540,7 +552,7 @@ int sbi_hart_unmap_saddr(void)
 	return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
 }
 
-int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
+int sbi_hart_isolation_configure(struct sbi_scratch *scratch)
 {
 	int rc;
 	unsigned int pmp_bits, pmp_log2gran;
@@ -564,7 +576,7 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 	/*
 	 * As per section 3.7.2 of privileged specification v1.12,
 	 * virtual address translations can be speculatively performed
-	 * (even before actual access). These, along with PMP traslations,
+	 * (even before actual access). These, along with PMP translations,
 	 * can be cached. This can pose a problem with CPU hotplug
 	 * and non-retentive suspend scenario because PMP states are
 	 * not preserved.
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index d80efe9..34970b5 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -359,7 +359,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * Configure PMP at last because if SMEPMP is detected,
 	 * M-mode access to the S/U space will be rescinded.
 	 */
-	rc = sbi_hart_pmp_configure(scratch);
+	rc = sbi_hart_isolation_configure(scratch);
 	if (rc) {
 		sbi_printf("%s: PMP configure failed (error %d)\n",
 			   __func__, rc);
@@ -438,7 +438,7 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	 * Configure PMP@last because if SMEPMP is detected,
 	 * M-mode access to the S/U space will be rescinded.
 	 */
-	rc = sbi_hart_pmp_configure(scratch);
+	rc = sbi_hart_isolation_configure(scratch);
 	if (rc)
 		sbi_hart_hang();
 
@@ -459,7 +459,7 @@ static void __noreturn init_warm_resume(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_pmp_configure(scratch);
+	rc = sbi_hart_isolation_configure(scratch);
 	if (rc)
 		sbi_hart_hang();
 
diff --git a/lib/sbi/sbi_memregion.c b/lib/sbi/sbi_memregion.c
index ee7403b..3783a0a 100644
--- a/lib/sbi/sbi_memregion.c
+++ b/lib/sbi/sbi_memregion.c
@@ -4,13 +4,10 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_string.h>
 
-void sbi_memregion_init(unsigned long addr,
-			       unsigned long size,
-			       unsigned long flags,
-			       struct sbi_memregion *reg)
+static void memregion_sanitize_pmp(struct sbi_memregion *reg)
 {
 	unsigned long base = 0, order;
-
+	unsigned long addr = reg->base, size = reg->size;
 	for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
 		if (order < __riscv_xlen) {
 			base = addr & ~((1UL << order) - 1UL);
@@ -23,12 +20,20 @@ void sbi_memregion_init(unsigned long addr,
 			base = 0;
 			break;
 		}
-
 	}
 
+	reg->base = base;
+	reg->size = (order == __riscv_xlen) ? -1UL : BIT(order);
+}
+
+void sbi_memregion_init(unsigned long addr,
+			       unsigned long size,
+			       unsigned long flags,
+			       struct sbi_memregion *reg)
+{
 	if (reg) {
-		reg->base = base;
-		reg->size = (order == __riscv_xlen) ? -1UL : BIT(order);
+		reg->base = addr;
+		reg->size = size;
 		reg->flags = flags;
 	}
 }
@@ -61,8 +66,7 @@ static bool is_region_compatible(const struct sbi_memregion *regA,
 	return false;
 }
 
-/* Check if region complies with constraints */
-static bool is_region_valid(const struct sbi_memregion *reg)
+static bool is_region_valid_pmp(const struct sbi_memregion *reg)
 {
 	unsigned int order = log2roundup(reg->size);
 	if (order < 3 || __riscv_xlen < order)
@@ -77,6 +81,25 @@ static bool is_region_valid(const struct sbi_memregion *reg)
 	return true;
 }
 
+/* Check if region complies with constraints */
+static bool is_region_valid(const struct sbi_memregion *reg,
+			    enum sbi_isolation_method type)
+{
+	switch(type) {
+	case SBI_ISOLATION_UNKNOWN:
+		break;
+
+	case SBI_ISOLATION_PMP:
+	case SBI_ISOLATION_SMEPMP:
+		return is_region_valid_pmp(reg);
+
+	default:
+		return false;
+	}
+
+	return true;
+}
+
 /** Check if regionA should be placed before regionB */
 static bool is_region_before(const struct sbi_memregion *regA,
 			     const struct sbi_memregion *regB)
@@ -189,7 +212,40 @@ static void merge_memregions(struct sbi_domain *dom, int *nmerged)
 	}
 }
 
-int sbi_memregion_sanitize(struct sbi_domain *dom)
+static int memregion_sanitize(struct sbi_domain *dom,
+			      struct sbi_memregion *reg,
+			      enum sbi_isolation_method type)
+{
+	if (!reg) {
+		return SBI_EINVAL;
+	}
+
+	switch (type) {
+		case SBI_ISOLATION_UNKNOWN:
+			break;
+
+		case SBI_ISOLATION_PMP:
+		case SBI_ISOLATION_SMEPMP:
+			memregion_sanitize_pmp(reg);
+			break;
+
+		default:
+			return SBI_EINVAL;
+	}
+
+	if (!is_region_valid(reg, type)) {
+		sbi_printf("%s: %s has invalid region base=0x%lx "
+			   "size=0x%lx flags=0x%lx\n", __func__,
+			   dom->name, reg->base, reg->size,
+			   reg->flags);
+		return SBI_EINVAL;
+	}
+
+	return SBI_OK;
+}
+
+int sbi_memregion_sanitize(struct sbi_domain *dom,
+			   enum sbi_isolation_method type)
 {
 	int count, nmerged;
 	struct sbi_memregion *reg;
@@ -201,20 +257,23 @@ int sbi_memregion_sanitize(struct sbi_domain *dom)
 		return SBI_EINVAL;
 	}
 
-	sbi_domain_for_each_memregion(dom, reg) {
-		if (!is_region_valid(reg)) {
-			sbi_printf("%s: %s has invalid region base=0x%lx "
-				   "size=0x%lx flags=0x%lx\n", __func__,
-				   dom->name, reg->base, reg->size,
-				   reg->flags);
-			return SBI_EINVAL;
-		}
+	/* Make sure we're not refinalizing */
+	if (type != SBI_ISOLATION_UNKNOWN &&
+	    dom->isol_mode != SBI_ISOLATION_UNKNOWN &&
+	    type != dom->isol_mode) {
+		sbi_printf("%s: %s attempting to resanitize memregions\n",
+			   __func__, dom->name);
+		return SBI_EINVAL;
 	}
 
 	/* Count memory regions */
 	count = 0;
-	sbi_domain_for_each_memregion(dom, reg)
+	sbi_domain_for_each_memregion(dom, reg) {
 		count++;
+		if (memregion_sanitize(dom, reg, type) < 0) {
+			return SBI_EINVAL;
+		}
+	}
 
 	/* Check presence of firmware regions */
 	if (!dom->fw_region_inited) {
@@ -229,6 +288,16 @@ int sbi_memregion_sanitize(struct sbi_domain *dom)
 		merge_memregions(dom, &nmerged);
 	} while (nmerged);
 
+	sbi_domain_for_each_memregion(dom, reg) {
+		if (!is_region_valid(reg, type)) {
+			sbi_printf("%s: %s has invalid region base=0x%lx "
+				   "size=0x%lx flags=0x%lx\n", __func__,
+				   dom->name, reg->base, reg->size,
+				   reg->flags);
+			return SBI_EINVAL;
+		}
+	}
+
 	return SBI_OK;
 }
 
-- 
2.45.2


