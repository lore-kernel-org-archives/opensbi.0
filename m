From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:26 -0700
Subject: [PATCH 5/8] lib: sbi: memregion: Make memregions keep track of raw size rather than order
In-Reply-To: <20240731181629.269898-1-gregorhaas1997@gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
Message-ID: <20240731181629.269898-6-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to accomodate isolation primitives other than PMP (such as the
forthcoming SMMTT implementation), make memregions keep track of their raw size
rather than prerounding the size to a power-of-two order. Not all isolation
primitives have the same stringent naturally-aligned power-of-two requirements
as PMP, and so we need a layer of abstraction between memregion information as
it is discovered (from device trees or otherwise) and isolation information as
applied using a specific primitive. This commit lays the groundwork for such an
abstraction.
---
 docs/domain_support.md      | 41 +++++++++++++++++++++++++------------
 include/sbi/sbi_domain.h    |  2 +-
 include/sbi/sbi_memregion.h | 10 ++++-----
 lib/sbi/sbi_domain.c        | 18 ++++++++--------
 lib/sbi/sbi_hart.c          | 23 +++++++++++++++------
 lib/sbi/sbi_memregion.c     | 30 +++++++++++++++++----------
 lib/utils/fdt/fdt_domain.c  | 29 ++++++++++++++++++--------
 lib/utils/fdt/fdt_fixup.c   | 10 ++++-----
 8 files changed, 102 insertions(+), 61 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 91677d3..33bd8d6 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -24,10 +24,9 @@ Domain Memory Region
 A domain memory region is represented by **struct sbi_memregion** in
 OpenSBI and has following details:
 
-* **order** - The size of a memory region is **2 ^ order** where **order**
-  must be **3 <= order <= __riscv_xlen**
-* **base** - The base address of a memory region is **2 ^ order**
-  aligned start address
+* **size** - The size of a memory region, where the maximum size is encoded
+  as -1UL.
+* **base** - The base address of a memory region.
 * **flags** - The flags of a memory region represent memory type (i.e.
   RAM or MMIO) and allowed accesses (i.e. READ, WRITE, EXECUTE, etc.)
 
@@ -56,10 +55,16 @@ has following details:
 * **system_suspend_allowed** - Is domain allowed to suspend the system?
 
 The memory regions represented by **regions** in **struct sbi_domain** have
-following additional constraints to align with RISC-V PMP requirements:
+following additional constraints:
 
 * A memory region to protect OpenSBI firmware from S-mode and U-mode
   should always be present
+
+When applying the specific isolation primitive to the domain, there may be
+other specific constraints on memory regions. These are listed below.
+
+To align with RISC-V PMP requirements:
+
 * For two overlapping memory regions, one should be sub-region of another
 * Two overlapping memory regions should not be of same size
 * Two overlapping memory regions cannot have same flags
@@ -138,17 +143,26 @@ The DT properties of a domain memory region DT node are as follows:
 
 * **compatible** (Mandatory) - The compatible string of the domain memory
   region. This DT property should have value *"opensbi,domain,memregion"*
-* **base** (Mandatory) - The base address of the domain memory region. This
-  DT property should have a **2 ^ order** aligned 64 bit address (i.e. two
-  DT cells).
-* **order** (Mandatory) - The order of the domain memory region. This DT
-  property should have a 32 bit value (i.e. one DT cell) in the range
-  **3 <= order <= __riscv_xlen**.
+* **base** (Mandatory) - The base address of the domain memory region. If
+  **order** is specified (see below), this DT property should have a
+  **2 ^ order** aligned 64 bit address (i.e. two DT cells). Otherwise, if
+  **size** is specified (see below), this DT property should have a 64 bit
+  address (i.e. two DT cells).
 * **mmio** (Optional) - A boolean flag representing whether the domain
   memory region is a memory-mapped I/O (MMIO) region.
 * **devices** (Optional) - The list of device DT node phandles for devices
   which fall under this domain memory region.
 
+Additionally, **one** of the two DT properties **must** be specified:
+
+* **size** - The size of the domain memory region. This DT property should
+  have a 64 bit value (i.e. two DT cells). The maximum possible size should
+  be encoded as `<0xFFFFFFFF 0xFFFFFFFF>`.
+* **order** - The order of the domain memory region. This DT property should
+  have a 32 bit value (i.e. one DT cell) in the range **3 <= order <= __riscv_xlen**.
+  This property is kept for compatibility purposes; new device trees should
+  use the **size** property instead.
+
 ### Domain Instance Node
 
 The domain instance DT node describes set of possible HARTs, set of memory
@@ -237,6 +251,7 @@ be done:
         opensbi-domains {
             compatible = "opensbi,domain,config";
 
+            /* Region using "order" property rather than size */
             tmem: tmem {
                 compatible = "opensbi,domain,memregion";
                 base = <0x0 0x80100000>;
@@ -246,7 +261,7 @@ be done:
             tuart: tuart {
                 compatible = "opensbi,domain,memregion";
                 base = <0x0 0x10011000>;
-                order = <12>;
+                size = <0x0 0x1000>;
                 mmio;
                 devices = <&uart1>;
             };
@@ -254,7 +269,7 @@ be done:
             allmem: allmem {
                 compatible = "opensbi,domain,memregion";
                 base = <0x0 0x0>;
-                order = <64>;
+                size = <0xFFFFFFFF 0xFFFFFFFF>;
             };
 
             tdomain: trusted-domain {
diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index a712504..74e3ea9 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -86,7 +86,7 @@ extern struct sbi_domain *domidx_to_domain_table[];
 
 /** Iterate over each memory region of a domain */
 #define sbi_domain_for_each_memregion(__d, __r) \
-	for ((__r) = (__d)->regions; (__r)->order; (__r)++)
+	for ((__r) = (__d)->regions; (__r)->size; (__r)++)
 
 /**
  * Check whether given HART is assigned to specified domain
diff --git a/include/sbi/sbi_memregion.h b/include/sbi/sbi_memregion.h
index 6e1b771..99faba7 100644
--- a/include/sbi/sbi_memregion.h
+++ b/include/sbi/sbi_memregion.h
@@ -15,13 +15,11 @@ enum sbi_domain_access {
 /** Representation of OpenSBI domain memory region */
 struct sbi_memregion {
 	/**
-	 * Size of memory region as power of 2
-	 * It has to be minimum 3 and maximum __riscv_xlen
+	 * Size of memory region. The maximum value is encoded as -1UL
 	 */
-	unsigned long order;
+	unsigned long size;
 	/**
 	 * Base address of memory region
-	 * It must be 2^order aligned address
 	 */
 	unsigned long base;
 	/** Flags representing memory region attributes */
@@ -149,8 +147,8 @@ struct sbi_memregion {
 	((reg)->base)
 
 #define memregion_end(reg) \
-	((reg)->order < __riscv_xlen) ? \
-	      (reg)->base + ((1UL << (reg)->order) - 1) : -1UL;
+	(((reg)->size == -1UL) ? -1UL : (reg)->base + (reg)->size - 1)
+
 /**
  * Initialize a domain memory region based on it's physical
  * address and size.
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 22d5d8b..e272d81 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -98,7 +98,7 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 
 static int sanitize_domain(struct sbi_domain *dom)
 {
-	u32 i, rc;
+	int i, rc;
 
 	/* Check possible HARTs */
 	if (!dom->possible_harts) {
@@ -302,7 +302,7 @@ int sbi_domain_root_add_memregion(const struct sbi_memregion *reg)
 	nreg = &root.regions[root_memregs_count];
 	sbi_memcpy(nreg, reg, sizeof(*reg));
 	root_memregs_count++;
-	root.regions[root_memregs_count].order = 0;
+       root.regions[root_memregs_count].size = 0;
 
 	/* Sort and optimize root regions */
 	do {
@@ -315,19 +315,17 @@ int sbi_domain_root_add_memregion(const struct sbi_memregion *reg)
 			return rc;
 		}
 
-		/* Merge consecutive memregions with same order and flags */
+		/* Merge consecutive memregions with same flags */
 		reg_merged = false;
 		sbi_domain_for_each_memregion(&root, nreg) {
 			nreg1 = nreg + 1;
-			if (!nreg1->order)
+			if (!nreg1->size)
 				continue;
 
-			if (!(nreg->base & (BIT(nreg->order + 1) - 1)) &&
-			    (nreg->base + BIT(nreg->order)) == nreg1->base &&
-			    nreg->order == nreg1->order &&
+			if ((nreg->base + nreg->size) == nreg1->base &&
 			    nreg->flags == nreg1->flags) {
-				nreg->order++;
-				while (nreg1->order) {
+				nreg->size += nreg1->size;
+				while (nreg1->size) {
 					nreg2 = nreg1 + 1;
 					sbi_memcpy(nreg1, nreg2, sizeof(*nreg1));
 					nreg1++;
@@ -505,7 +503,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 			   &root_memregs[root_memregs_count++]);
 
 	/* Root domain memory region end */
-	root_memregs[root_memregs_count].order = 0;
+	root_memregs[root_memregs_count].size = 0;
 
 	/* Root domain boot HART id is same as coldboot HART id */
 	root.boot_hartid = cold_hartid;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4dd1a25..e82045c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -346,6 +346,11 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 	return pmp_flags;
 }
 
+static inline bool pmp_is_power_of_two(unsigned long order, unsigned long size)
+{
+	return order == __riscv_xlen ? true : BIT(order) == size;
+}
+
 static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				struct sbi_domain *dom,
 				struct sbi_memregion *reg,
@@ -355,14 +360,16 @@ static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				unsigned long pmp_addr_max)
 {
 	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
+	unsigned long order = log2roundup(reg->size);
 
-	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
+	if (pmp_is_power_of_two(order, reg->size) &&
+	    pmp_log2gran <= order && pmp_addr < pmp_addr_max) {
+		pmp_set(pmp_idx, pmp_flags, reg->base, order);
 	} else {
 		sbi_printf("Can not configure pmp for domain %s because"
 			   " memory region address 0x%lx or size 0x%lx "
 			   "is not in range.\n", dom->name, reg->base,
-			   reg->order);
+			   reg->size);
 	}
 }
 
@@ -451,6 +458,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 	unsigned int pmp_idx = 0;
 	unsigned int pmp_flags;
 	unsigned long pmp_addr;
+	unsigned long order;
 
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (pmp_count <= pmp_idx)
@@ -473,13 +481,16 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 			pmp_flags |= PMP_X;
 
 		pmp_addr = reg->base >> PMP_SHIFT;
-		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
+		order = log2roundup(reg->size);
+
+		if (pmp_is_power_of_two(order, reg->size) &&
+		    pmp_log2gran <= order && pmp_addr < pmp_addr_max) {
+			pmp_set(pmp_idx++, pmp_flags, reg->base, order);
 		} else {
 			sbi_printf("Can not configure pmp for domain %s because"
 				   " memory region address 0x%lx or size 0x%lx "
 				   "is not in range.\n", dom->name, reg->base,
-				   reg->order);
+				   reg->size);
 		}
 	}
 
diff --git a/lib/sbi/sbi_memregion.c b/lib/sbi/sbi_memregion.c
index 8978793..56ee649 100644
--- a/lib/sbi/sbi_memregion.c
+++ b/lib/sbi/sbi_memregion.c
@@ -28,7 +28,7 @@ void sbi_memregion_init(unsigned long addr,
 
 	if (reg) {
 		reg->base = base;
-		reg->order = order;
+		reg->size = (order == __riscv_xlen) ? -1UL : BIT(order);
 		reg->flags = flags;
 	}
 }
@@ -64,13 +64,14 @@ static bool is_region_compatible(const struct sbi_memregion *regA,
 /* Check if region complies with constraints */
 static bool is_region_valid(const struct sbi_memregion *reg)
 {
-	if (reg->order < 3 || __riscv_xlen < reg->order)
+	unsigned int order = log2roundup(reg->size);
+	if (order < 3 || __riscv_xlen < order)
 		return false;
 
-	if (reg->order == __riscv_xlen && reg->base != 0)
+	if (order == __riscv_xlen && reg->base != 0)
 		return false;
 
-	if (reg->order < __riscv_xlen && (reg->base & (BIT(reg->order) - 1)))
+	if (order < __riscv_xlen && (reg->base & (BIT(order) - 1)))
 		return false;
 
 	return true;
@@ -80,10 +81,17 @@ static bool is_region_valid(const struct sbi_memregion *reg)
 static bool is_region_before(const struct sbi_memregion *regA,
 			     const struct sbi_memregion *regB)
 {
-	if (regA->order < regB->order)
+	// Sentinel region always goes last
+	if (!regA->size)
+		return false;
+
+	if (!regB->size)
+		return true;
+
+	if (regA->size < regB->size)
 		return true;
 
-	if ((regA->order == regB->order) &&
+	if ((regA->size == regB->size) &&
 	    (regA->base < regB->base))
 		return true;
 
@@ -121,8 +129,8 @@ int sbi_memregion_sanitize(struct sbi_domain *dom)
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (!is_region_valid(reg)) {
 			sbi_printf("%s: %s has invalid region base=0x%lx "
-				   "order=%lu flags=0x%lx\n", __func__,
-				   dom->name, reg->base, reg->order,
+				   "size=0x%lx flags=0x%lx\n", __func__,
+				   dom->name, reg->base, reg->size,
 				   reg->flags);
 			return SBI_EINVAL;
 		}
@@ -260,7 +268,7 @@ static const struct sbi_memregion *find_next_subset_region(
 			continue;
 
 		if (!ret || (sreg->base < ret->base) ||
-		    ((sreg->base == ret->base) && (sreg->order < ret->order)))
+		    ((sreg->base == ret->base) && (sreg->size < ret->size)))
 			ret = sreg;
 	}
 
@@ -289,8 +297,8 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 		sreg = find_next_subset_region(dom, reg, addr);
 		if (sreg)
 			addr = sreg->base;
-		else if (reg->order < __riscv_xlen)
-			addr = reg->base + (1UL << reg->order);
+		else if (reg->size != -1UL)
+			addr = reg->base + reg->size;
 		else
 			break;
 	}
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 779acec..51d9e9d 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -233,7 +233,6 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 			      void *opaque)
 {
 	int len;
-	u32 val32;
 	u64 val64;
 	const u32 *val;
 	struct parse_region_data *preg = opaque;
@@ -264,14 +263,26 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
 	region->base = val64;
 
-	/* Read "order" DT property */
-	val = fdt_getprop(fdt, region_offset, "order", &len);
-	if (!val || len != 4)
-		return SBI_EINVAL;
-	val32 = fdt32_to_cpu(*val);
-	if (val32 < 3 || __riscv_xlen < val32)
-		return SBI_EINVAL;
-	region->order = val32;
+	/* Read "size" DT property */
+	val = fdt_getprop(fdt, region_offset, "size", &len);
+	if (!val || len != 8) {
+		// Check for older "order" property
+		val = fdt_getprop(fdt, region_offset, "order", &len);
+		if (!val || len != 4) {
+			return SBI_EINVAL;
+		}
+
+		val64 = fdt32_to_cpu(*val);
+		if (val64 < 3 || __riscv_xlen < val64)
+			return SBI_EINVAL;
+
+		val64 = BIT(val64);
+	} else {
+		val64 = ((uint64_t) fdt32_to_cpu(val[0])) << 32;
+		val64 |= fdt32_to_cpu(val[1]);
+	}
+
+	region->size = val64;
 
 	/* Read "mmio" DT property */
 	region->flags = region_access & SBI_MEMREGION_ACCESS_MASK;
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index fd45763..20819f9 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -285,7 +285,7 @@ int fdt_reserved_memory_fixup(void *fdt)
 	struct sbi_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned long filtered_base[PMP_COUNT] = { 0 };
-	unsigned char filtered_order[PMP_COUNT] = { 0 };
+	unsigned long filtered_size[PMP_COUNT] = { 0 };
 	unsigned long addr, size;
 	int err, parent, i, j;
 	int na = fdt_address_cells(fdt, 0);
@@ -362,23 +362,23 @@ int fdt_reserved_memory_fixup(void *fdt)
 		addr = reg->base;
 		for (j = 0; j < i; j++) {
 			if (addr == filtered_base[j]
-			    && filtered_order[j] < reg->order) {
+			    && filtered_size[j] < reg->size) {
 				overlap = true;
-				filtered_order[j] = reg->order;
+				filtered_size[j] = reg->size;
 				break;
 			}
 		}
 
 		if (!overlap) {
 			filtered_base[i] = reg->base;
-			filtered_order[i] = reg->order;
+			filtered_size[i] = reg->size;
 			i++;
 		}
 	}
 
 	for (j = 0; j < i; j++) {
 		addr = filtered_base[j];
-		size = 1UL << filtered_order[j];
+		size = filtered_size[j];
 		fdt_resv_memory_update_node(fdt, addr, size, j, parent);
 	}
 
-- 
2.45.2


