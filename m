From: Xiang W <wxjstz@126.com>
Date: Thu, 27 Jun 2024 01:48:13 +0800
Subject: [PATCH 2/3] lib: sbi: Introduce size to sbi_domain_memregion
In-Reply-To: <20240626174816.2837278-1-wxjstz@126.com>
References: <20240626174816.2837278-1-wxjstz@126.com>
Message-ID: <20240626174816.2837278-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to support tor type pmp, introduce size to
sbi_domain_memregion.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_domain.h | 37 ++++++++++++++++++
 lib/sbi/sbi_domain.c     | 82 ++++++++++++++++++++--------------------
 lib/sbi/sbi_hart.c       | 15 ++++----
 3 files changed, 85 insertions(+), 49 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index a6e99c6..f97f62e 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -32,6 +32,14 @@ struct sbi_domain_memregion {
 	 * It has to be minimum 3 and maximum __riscv_xlen
 	 */
 	unsigned long order;
+
+	/**
+	 * when size is not equal to 0, order is invalid
+	 * When the size of the memory region is not a power of 2,
+	 * it is represented by size.
+	 */
+	unsigned long size;
+
 	/**
 	 * Base address of memory region
 	 * It must be 2^order aligned address
@@ -227,6 +235,35 @@ extern struct sbi_domain *domidx_to_domain_table[];
 /** Iterate over each memory region of a domain */
 #define sbi_domain_for_each_memregion(__d, __r) \
 	for ((__r) = (__d)->regions; (__r)->order; (__r)++)
+/**
+ * Calculate the start address of the memory region
+ * @param r pointer to memory region
+ * @return start address of the memory region
+ */
+static inline unsigned long memregion_start(const struct sbi_domain_memregion *r)
+{
+	if (r->size)
+		return r->base;
+	if (r->order < __riscv_xlen)
+		return r->base;
+	else
+		return 0;
+}
+
+/**
+ * Calculate the end addresses of the memory region
+ * @param r pointer to memory region
+ * @return end addresses of the memory region
+ */
+static inline unsigned long memregion_end(const struct sbi_domain_memregion *r)
+{
+	if (r->size)
+		return r->base + r->size - 1;
+	if (r->order < __riscv_xlen)
+		return r->base + BIT(r->order) - 1;
+	else
+		return -1UL;
+}
 
 /**
  * Check whether given HART is assigned to specified domain
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 374ac36..9a9fce1 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -40,6 +40,10 @@ struct sbi_domain root = {
 
 static unsigned long domain_hart_ptr_offset;
 
+static const struct sbi_domain_memregion *find_region(
+						const struct sbi_domain *dom,
+						unsigned long addr);
+
 struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
@@ -96,6 +100,12 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 	return ret;
 }
 
+static inline bool
+in_memregion(const struct sbi_domain_memregion *r, unsigned long addr)
+{
+	return memregion_start(r) <= addr && addr <= memregion_end(r);
+}
+
 void sbi_domain_memregion_init(unsigned long addr,
 				unsigned long size,
 				unsigned long flags,
@@ -120,6 +130,7 @@ void sbi_domain_memregion_init(unsigned long addr,
 
 	if (reg) {
 		reg->base = base;
+		reg->size = 0;
 		reg->order = order;
 		reg->flags = flags;
 	}
@@ -130,8 +141,8 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			   unsigned long access_flags)
 {
 	bool rmmio, mmio = false;
-	struct sbi_domain_memregion *reg;
-	unsigned long rstart, rend, rflags, rwx = 0, rrwx = 0;
+	const struct sbi_domain_memregion *reg;
+	unsigned long rflags, rwx = 0, rrwx = 0;
 
 	if (!dom)
 		return false;
@@ -153,22 +164,18 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 	if (access_flags & SBI_DOMAIN_MMIO)
 		mmio = true;
 
-	sbi_domain_for_each_memregion(dom, reg) {
+	reg = find_region(dom, addr);
+	if (reg) {
 		rflags = reg->flags;
 		rrwx = (mode == PRV_M ?
 			(rflags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK) :
 			(rflags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
 			>> SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT);
 
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-			rstart + ((1UL << reg->order) - 1) : -1UL;
-		if (rstart <= addr && addr <= rend) {
-			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
-			if (mmio != rmmio)
-				return false;
-			return ((rrwx & rwx) == rwx) ? true : false;
-		}
+		rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
+		if (mmio != rmmio)
+			return false;
+		return ((rrwx & rwx) == rwx) ? true : false;
 	}
 
 	return (mode == PRV_M) ? true : false;
@@ -177,6 +184,9 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 /* Check if region complies with constraints */
 static bool is_region_valid(const struct sbi_domain_memregion *reg)
 {
+	if (reg->size)
+		return sbi_popcount(reg->size) > 2 ? true : false;
+
 	if (reg->order < 3 || __riscv_xlen < reg->order)
 		return false;
 
@@ -193,18 +203,9 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
 static bool is_region_subset(const struct sbi_domain_memregion *regA,
 			     const struct sbi_domain_memregion *regB)
 {
-	ulong regA_start = regA->base;
-	ulong regA_end = regA->base + (BIT(regA->order) - 1);
-	ulong regB_start = regB->base;
-	ulong regB_end = regB->base + (BIT(regB->order) - 1);
-
-	if ((regB_start <= regA_start) &&
-	    (regA_start < regB_end) &&
-	    (regB_start < regA_end) &&
-	    (regA_end <= regB_end))
-		return true;
-
-	return false;
+	ulong regA_start = memregion_start(regA);
+	ulong regA_end = memregion_end(regA);
+	return in_memregion(regB, regA_start) && in_memregion(regB, regA_end);
 }
 
 /** Check if regionA can be replaced by regionB */
@@ -221,10 +222,12 @@ static bool is_region_compatible(const struct sbi_domain_memregion *regA,
 static bool is_region_before(const struct sbi_domain_memregion *regA,
 			     const struct sbi_domain_memregion *regB)
 {
-	if (regA->order < regB->order)
+	unsigned long regA_s = memregion_end(regA) - memregion_start(regA);
+	unsigned long regB_s = memregion_end(regB) - memregion_start(regB);
+	if (regA_s < regB_s)
 		return true;
 
-	if ((regA->order == regB->order) &&
+	if ((regA_s == regB_s) &&
 	    (regA->base < regB->base))
 		return true;
 
@@ -235,14 +238,10 @@ static const struct sbi_domain_memregion *find_region(
 						const struct sbi_domain *dom,
 						unsigned long addr)
 {
-	unsigned long rstart, rend;
 	struct sbi_domain_memregion *reg;
 
 	sbi_domain_for_each_memregion(dom, reg) {
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-			rstart + ((1UL << reg->order) - 1) : -1UL;
-		if (rstart <= addr && addr <= rend)
+		if (in_memregion(reg, addr))
 			return reg;
 	}
 
@@ -262,7 +261,8 @@ static const struct sbi_domain_memregion *find_next_subset_region(
 			continue;
 
 		if (!ret || (sreg->base < ret->base) ||
-		    ((sreg->base == ret->base) && (sreg->order < ret->order)))
+		    ((sreg->base == ret->base) &&
+			    (memregion_end(sreg) < memregion_end(ret))))
 			ret = sreg;
 	}
 
@@ -314,8 +314,8 @@ static int sanitize_domain(struct sbi_domain *dom)
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (!is_region_valid(reg)) {
 			sbi_printf("%s: %s has invalid region base=0x%lx "
-				   "order=%lu flags=0x%lx\n", __func__,
-				   dom->name, reg->base, reg->order,
+				   "order=%lu size=%lu flags=0x%lx\n", __func__,
+				   dom->name, reg->base, reg->order, reg->size,
 				   reg->flags);
 			return SBI_EINVAL;
 		}
@@ -423,10 +423,11 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 		sreg = find_next_subset_region(dom, reg, addr);
 		if (sreg)
 			addr = sreg->base;
-		else if (reg->order < __riscv_xlen)
-			addr = reg->base + (1UL << reg->order);
-		else
-			break;
+		else {
+			addr = memregion_end(reg) + 1;
+			if (addr == 0)
+				break;
+		}
 	}
 
 	return true;
@@ -455,9 +456,8 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 
 	i = 0;
 	sbi_domain_for_each_memregion(dom, reg) {
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-			rstart + ((1UL << reg->order) - 1) : -1UL;
+		rstart = memregion_start(reg);
+		rend = memregion_end(reg);
 
 		sbi_printf("Domain%d Region%02d    %s: 0x%" PRILX "-0x%" PRILX " ",
 			   dom->index, i, suffix, rstart, rend);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index acf0926..982e77a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -355,10 +355,9 @@ static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				unsigned long pmp_addr_max)
 {
 	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
-	unsigned long start = reg->base;
-	unsigned long end = reg->order < __riscv_xlen ?
-				start + BIT(reg->order) - 1: -1UL;
-	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max)
+	unsigned long start = memregion_start(reg);
+	unsigned long end = memregion_end(reg);
+	if ((1 << pmp_log2gran) - 1 <= end - start && pmp_addr < pmp_addr_max)
 		pmp_set(pmp_idx, pmp_flags, start, end);
 	else {
 		sbi_printf("Can not configure pmp for domain %s because"
@@ -475,10 +474,10 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 			pmp_flags |= PMP_X;
 
 		pmp_addr = reg->base >> PMP_SHIFT;
-		start = reg->base;
-		end = reg->order < __riscv_xlen ?
-			start + BIT(reg->order) - 1 : -1UL;
-		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
+		start = memregion_start(reg);
+		end = memregion_end(reg);
+		if ((1 << pmp_log2gran) - 1 <= end - start &&
+				pmp_addr < pmp_addr_max) {
 			pmp_set(&pmp_idx, pmp_flags, start, end);
 		} else {
 			sbi_printf("Can not configure pmp for domain %s because"
-- 
2.43.0


