From: Xiang W <wxjstz@126.com>
Date: Fri,  8 Nov 2024 21:15:16 +0800
Subject: [RFC v2 PATCH 2/2] lib: sbi: Using word addresses in memregion
In-Reply-To: <20241108131523.676899-1-wxjstz@126.com>
References: <20241108131523.676899-1-wxjstz@126.com>
Message-ID: <20241108131523.676899-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Using word addresses in memregion can adapt to pmp and control all pmp
addresses. It can also remove the 4G physical memory limit under RV32.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_domain.h                 | 45 ++++++++-----
 lib/sbi/sbi_dbtr.c                       | 15 +----
 lib/sbi/sbi_domain.c                     | 85 ++++++++++++++----------
 lib/sbi/sbi_ecall_dbcn.c                 | 18 +----
 lib/sbi/sbi_hart.c                       | 17 ++---
 lib/sbi/sbi_hsm.c                        |  4 +-
 lib/sbi/sbi_sse.c                        | 22 ++----
 lib/sbi/sbi_system.c                     |  2 +-
 lib/utils/fdt/fdt_domain.c               |  4 +-
 lib/utils/fdt/fdt_fixup.c                |  2 +-
 lib/utils/ipi/aclint_mswi.c              |  3 +-
 lib/utils/ipi/andes_plicsw.c             |  4 +-
 lib/utils/irqchip/aplic.c                |  4 +-
 lib/utils/irqchip/imsic.c                |  6 +-
 lib/utils/irqchip/plic.c                 |  5 +-
 lib/utils/regmap/fdt_regmap_syscon.c     |  2 +-
 lib/utils/serial/cadence-uart.c          |  3 +-
 lib/utils/serial/fdt_serial_htif.c       |  3 +-
 lib/utils/serial/uart8250.c              |  3 +-
 lib/utils/timer/aclint_mtimer.c          | 50 ++++++++------
 lib/utils/timer/andes_plmt.c             |  5 +-
 platform/generic/renesas/rzfive/rzfive.c |  5 +-
 platform/generic/sophgo/sg2042.c         |  6 +-
 23 files changed, 160 insertions(+), 153 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 8a2b123..4269d7e 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -30,12 +30,12 @@ enum sbi_domain_access {
 /** Representation of OpenSBI domain memory region */
 struct sbi_domain_memregion {
 	/**
-	 * Size of memory region as power of 2
-	 * It has to be minimum 3 and maximum __riscv_xlen
+	 * Word size of memory region as power of 2
+	 * It has to be minimum 1 and maximum __riscv_xlen
 	 */
 	unsigned long order;
 	/**
-	 * Base address of memory region
+	 * Base word address of memory region
 	 * It must be 2^order aligned address
 	 */
 	unsigned long base;
@@ -218,6 +218,17 @@ extern struct sbi_dlist domain_list;
 #define sbi_domain_for_each_memregion(__d, __r) \
 	for ((__r) = (__d)->regions; (__r)->order; (__r)++)
 
+/**
+ * Convert address to word address
+ * @param low low word of physical address
+ * @param high high word of physical address
+ * @return word address
+ */
+static inline unsigned long sbi_pa2wa(unsigned long low, unsigned long high)
+{
+	return (low >> 2) | (high << (__riscv_xlen - 2));
+}
+
 /**
  * Check whether given HART is assigned to specified domain
  * @param dom pointer to domain
@@ -239,13 +250,13 @@ int sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
  * Initialize a domain memory region based on it's physical
  * address and size.
  *
- * @param addr start physical address of memory region
- * @param size physical size of memory region
+ * @param waddr start physical word address of memory region
+ * @param wsize physical wold size of memory region
  * @param flags memory region flags
  * @param reg pointer to memory region being initialized
  */
-void sbi_domain_memregion_init(unsigned long addr,
-				unsigned long size,
+void sbi_domain_memregion_init(unsigned long waddr,
+				unsigned long wsize,
 				unsigned long flags,
 				struct sbi_domain_memregion *reg);
 
@@ -253,27 +264,27 @@ void sbi_domain_memregion_init(unsigned long addr,
  * Check whether we can access specified address for given mode and
  * memory region flags under a domain
  * @param dom pointer to domain
- * @param addr the address to be checked
+ * @param waddr the word address to be checked
  * @param mode the privilege mode of access
  * @param access_flags bitmask of domain access types (enum sbi_domain_access)
  * @return true if access allowed otherwise false
  */
 bool sbi_domain_check_addr(const struct sbi_domain *dom,
-			   unsigned long addr, unsigned long mode,
+			   unsigned long waddr, unsigned long mode,
 			   unsigned long access_flags);
 
 /**
  * Check whether we can access specified address range for given mode and
  * memory region flags under a domain
  * @param dom pointer to domain
- * @param addr the start of the address range to be checked
- * @param size the size of the address range to be checked
+ * @param waddr the start of the word address range to be checked
+ * @param wsize the word size of the address range to be checked
  * @param mode the privilege mode of access
  * @param access_flags bitmask of domain access types (enum sbi_domain_access)
  * @return TRUE if access allowed otherwise FALSE
  */
 bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
-				 unsigned long addr, unsigned long size,
+				 unsigned long waddr, unsigned long wsize,
 				 unsigned long mode,
 				 unsigned long access_flags);
 
@@ -295,17 +306,17 @@ int sbi_domain_register(struct sbi_domain *dom,
 
 /**
  * Add a memory range with its flags to the root domain
- * @param addr start physical address of memory range
- * @param size physical size of memory range
- * @param align alignment of memory region
+ * @param waddr start physical wold address of memory range
+ * @param wsize physical wold size of memory range
+ * @param walign alignment of memory region, world size
  * @param region_flags memory range flags
  *
  * @return 0 on success
  * @return SBI_EALREADY if memory region conflicts with the existing one
  * @return SBI_EINVAL otherwise
  */
-int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
-			   unsigned long align, unsigned long region_flags);
+int sbi_domain_root_add_memrange(unsigned long waddr, unsigned long wsize,
+			   unsigned long walign, unsigned long region_flags);
 
 /** Finalize domain tables and startup non-root domains */
 int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid);
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index f0e9128..7bb8193 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -270,22 +270,11 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_lo & SBI_DBTR_SHMEM_ALIGN_MASK)
 		return SBI_ERR_INVALID_PARAM;
 
-	/*
-	* On RV32, the M-mode can only access the first 4GB of
-	* the physical address space because M-mode does not have
-	* MMU to access full 34-bit physical address space.
-	* So fail if the upper 32 bits of the physical address
-	* is non-zero on RV32.
-	*
-	* On RV64, kernel sets upper 64bit address part to zero.
-	* So fail if the upper 64bit of the physical address
-	* is non-zero on RV64.
-	*/
-	if (shmem_phys_hi)
+	if (shmem_phys_hi >= 4)
 		return SBI_EINVALID_ADDR;
 
 	if (dom && !sbi_domain_check_addr(dom,
-		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
+		  sbi_pa2wa(shmem_phys_lo, shmem_phys_hi) , smode,
 		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 7fdcf9d..c77f1f5 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -93,20 +93,20 @@ int sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 	return ret;
 }
 
-void sbi_domain_memregion_init(unsigned long addr,
-				unsigned long size,
+void sbi_domain_memregion_init(unsigned long waddr,
+				unsigned long wsize,
 				unsigned long flags,
 				struct sbi_domain_memregion *reg)
 {
 	unsigned long base = 0, order;
 
-	for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
+	for (order = log2roundup(wsize) ; order <= __riscv_xlen; order++) {
 		if (order < __riscv_xlen) {
-			base = addr & ~((1UL << order) - 1UL);
-			if ((base <= addr) &&
-			    (addr < (base + (1UL << order))) &&
-			    (base <= (addr + size - 1UL)) &&
-			    ((addr + size - 1UL) < (base + (1UL << order))))
+			base = waddr & ~((1UL << order) - 1UL);
+			if ((base <= waddr) &&
+			    (waddr < (base + (1UL << order))) &&
+			    (base <= (waddr + wsize - 1UL)) &&
+			    ((waddr + wsize - 1UL) < (base + (1UL << order))))
 				break;
 		} else {
 			base = 0;
@@ -123,7 +123,7 @@ void sbi_domain_memregion_init(unsigned long addr,
 }
 
 bool sbi_domain_check_addr(const struct sbi_domain *dom,
-			   unsigned long addr, unsigned long mode,
+			   unsigned long waddr, unsigned long mode,
 			   unsigned long access_flags)
 {
 	bool rmmio, mmio = false;
@@ -160,7 +160,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 		rstart = reg->base;
 		rend = (reg->order < __riscv_xlen) ?
 			rstart + ((1UL << reg->order) - 1) : -1UL;
-		if (rstart <= addr && addr <= rend) {
+		if (rstart <= waddr && waddr <= rend) {
 			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
 			if (mmio != rmmio)
 				return false;
@@ -174,7 +174,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 /* Check if region complies with constraints */
 static bool is_region_valid(const struct sbi_domain_memregion *reg)
 {
-	if (reg->order < 3 || __riscv_xlen < reg->order)
+	if (reg->order < 1 || __riscv_xlen < reg->order)
 		return false;
 
 	if (reg->order == __riscv_xlen && reg->base != 0)
@@ -388,7 +388,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 	}
 
 	/* Check next address and next mode */
-	if (!sbi_domain_check_addr(dom, dom->next_addr, dom->next_mode,
+	if (!sbi_domain_check_addr(dom, dom->next_addr >> 2, dom->next_mode,
 				   SBI_DOMAIN_EXECUTE)) {
 		sbi_printf("%s: %s next booting stage address 0x%lx can't "
 			   "execute\n", __func__, dom->name, dom->next_addr);
@@ -399,29 +399,29 @@ static int sanitize_domain(struct sbi_domain *dom)
 }
 
 bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
-				 unsigned long addr, unsigned long size,
+				 unsigned long waddr, unsigned long wsize,
 				 unsigned long mode,
 				 unsigned long access_flags)
 {
-	unsigned long max = addr + size;
+	unsigned long max = waddr + wsize;
 	const struct sbi_domain_memregion *reg, *sreg;
 
 	if (!dom)
 		return false;
 
-	while (addr < max) {
-		reg = find_region(dom, addr);
+	while (waddr < max) {
+		reg = find_region(dom, waddr);
 		if (!reg)
 			return false;
 
-		if (!sbi_domain_check_addr(dom, addr, mode, access_flags))
+		if (!sbi_domain_check_addr(dom, waddr, mode, access_flags))
 			return false;
 
-		sreg = find_next_subset_region(dom, reg, addr);
+		sreg = find_next_subset_region(dom, reg, waddr);
 		if (sreg)
-			addr = sreg->base;
+			waddr = sreg->base;
 		else if (reg->order < __riscv_xlen)
-			addr = reg->base + (1UL << reg->order);
+			waddr = reg->base + (1UL << reg->order);
 		else
 			break;
 	}
@@ -429,11 +429,21 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 	return true;
 }
 
+static char * sbi_memregion_format_addr(char *buff, unsigned long addr, bool is_end)
+{
+	unsigned long l, h;
+	h = addr >> (__riscv_xlen - 2);
+	l = (addr << 2) + (is_end ? 3 : 0);
+	sbi_sprintf(buff, "%lx%" PRILX, h, l);
+	return buff;
+}
+
 void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 {
 	u32 i, j, k;
 	unsigned long rstart, rend;
 	struct sbi_domain_memregion *reg;
+	char rstart_s[18], rend_s[18];
 
 	sbi_printf("Domain%d Name        %s: %s\n",
 		   dom->index, suffix, dom->name);
@@ -456,8 +466,11 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 		rend = (reg->order < __riscv_xlen) ?
 			rstart + ((1UL << reg->order) - 1) : -1UL;
 
-		sbi_printf("Domain%d Region%02d    %s: 0x%" PRILX "-0x%" PRILX " ",
-			   dom->index, i, suffix, rstart, rend);
+		sbi_memregion_format_addr(rstart_s, rstart, false);
+		sbi_memregion_format_addr(rend_s, rend, true);
+
+		sbi_printf("Domain%d Region%02d    %s: 0x%s-0x%s ",
+			   dom->index, i, suffix, rstart_s, rend_s);
 
 		k = 0;
 
@@ -658,22 +671,22 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 	return 0;
 }
 
-int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
-			   unsigned long align, unsigned long region_flags)
+int sbi_domain_root_add_memrange(unsigned long waddr, unsigned long wsize,
+			   unsigned long walign, unsigned long region_flags)
 {
 	int rc;
 	unsigned long pos, end, rsize;
 	struct sbi_domain_memregion reg;
 
-	pos = addr;
-	end = addr + size;
+	pos = waddr;
+	end = waddr + wsize;
 	while (pos < end) {
-		rsize = pos & (align - 1);
+		rsize = pos & (walign - 1);
 		if (rsize)
 			rsize = 1UL << sbi_ffs(pos);
 		else
-			rsize = ((end - pos) < align) ?
-				(end - pos) : align;
+			rsize = ((end - pos) < walign) ?
+				(end - pos) : walign;
 
 		sbi_domain_memregion_init(pos, rsize, region_flags, &reg);
 		rc = root_add_memregion(&reg);
@@ -802,16 +815,18 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	root.possible_harts = root_hmask;
 
 	/* Root domain firmware memory region */
-	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
+	sbi_domain_memregion_init(scratch->fw_start >> 2,
+				  scratch->fw_rw_offset >> 2,
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
 				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE),
 				  &root_memregs[root_memregs_count++]);
 
-	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
-				  (scratch->fw_size - scratch->fw_rw_offset),
-				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-				  &root_memregs[root_memregs_count++]);
+	sbi_domain_memregion_init(
+			    (scratch->fw_start + scratch->fw_rw_offset) >> 2,
+			    (scratch->fw_size - scratch->fw_rw_offset) >> 2,
+			    (SBI_DOMAIN_MEMREGION_M_READABLE |
+			     SBI_DOMAIN_MEMREGION_M_WRITABLE),
+			    &root_memregs[root_memregs_count++]);
 
 	root.fw_region_inited = true;
 
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 49a7713..9ca4cc8 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -26,24 +26,12 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 	switch (funcid) {
 	case SBI_EXT_DBCN_CONSOLE_WRITE:
 	case SBI_EXT_DBCN_CONSOLE_READ:
-		/*
-		 * On RV32, the M-mode can only access the first 4GB of
-		 * the physical address space because M-mode does not have
-		 * MMU to access full 34-bit physical address space.
-		 *
-		 * Based on above, we simply fail if the upper 32bits of
-		 * the physical address (i.e. a2 register) is non-zero on
-		 * RV32.
-		 *
-		 * Analogously, we fail if the upper 64bit of the
-		 * physical address (i.e. a2 register) is non-zero on
-		 * RV64.
-		 */
-		if (regs->a2)
+		if (regs->a2 >= 4)
 			return SBI_ERR_FAILED;
 
 		if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
-					regs->a1, regs->a0, smode,
+					sbi_pa2wa(regs->a1, regs->a2),
+					regs->a0 >> 2, smode,
 					SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
 			return SBI_ERR_INVALID_PARAM;
 		sbi_hart_map_saddr(regs->a1, regs->a0);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 832db7a..8b018b8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -358,14 +358,13 @@ static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				unsigned int pmp_log2gran,
 				unsigned long pmp_addr_max)
 {
-	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
+	unsigned long pmp_addr = reg->base;
 
 	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-		pmp_set(pmp_idx, pmp_flags, reg->base >> PMP_SHIFT,
-			    reg->order - PMP_SHIFT);
+		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
 	} else {
 		sbi_printf("Can not configure pmp for domain %s because"
-			   " memory region address 0x%lx or size 0x%lx "
+			   " memory region base 0x%lx or order 0x%lx "
 			   "is not in range.\n", dom->name, reg->base,
 			   reg->order);
 	}
@@ -477,13 +476,12 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
 			pmp_flags |= PMP_X;
 
-		pmp_addr = reg->base >> PMP_SHIFT;
+		pmp_addr = reg->base;
 		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-			pmp_set(pmp_idx++, pmp_flags, reg->base >> PMP_SHIFT,
-				    reg->order - PMP_SHIFT);
+			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
 		} else {
 			sbi_printf("Can not configure pmp for domain %s because"
-				   " memory region address 0x%lx or size 0x%lx "
+				   " memory region base 0x%lx or order 0x%lx "
 				   "is not in range.\n", dom->name, reg->base,
 				   reg->order);
 		}
@@ -520,8 +518,7 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 		}
 	}
 
-	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base >> PMP_SHIFT,
-		    order - PMP_SHIFT);
+	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
 
 	return SBI_OK;
 }
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 58a3379..ebde3d3 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -312,7 +312,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		return SBI_EINVAL;
 	if (dom && !sbi_domain_is_assigned_hart(dom, hartindex))
 		return SBI_EINVAL;
-	if (dom && !sbi_domain_check_addr(dom, saddr, smode,
+	if (dom && !sbi_domain_check_addr(dom, saddr >> 2, smode,
 					  SBI_DOMAIN_EXECUTE))
 		return SBI_EINVALID_ADDR;
 
@@ -506,7 +506,7 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 		 */
 		if (rmode != PRV_S && rmode != PRV_U)
 			return SBI_EFAIL;
-		if (dom && !sbi_domain_check_addr(dom, raddr, rmode,
+		if (dom && !sbi_domain_check_addr(dom, raddr >> 2, rmode,
 						  SBI_DOMAIN_EXECUTE))
 			return SBI_EINVALID_ADDR;
 	}
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index bf5620e..108779e 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -896,21 +896,13 @@ int sbi_sse_attr_check(uint32_t base_attr_id, uint32_t attr_count,
 	if (phys_lo & (align - 1))
 		return SBI_EINVALID_ADDR;
 
-	/*
-	 * On RV32, the M-mode can only access the first 4GB of
-	 * the physical address space because M-mode does not have
-	 * MMU to access full 34-bit physical address space.
-	 *
-	 * Based on above, we simply fail if the upper 32bits of
-	 * the physical address (i.e. a2 register) is non-zero on
-	 * RV32.
-	 */
-	if (phys_hi)
+	if (phys_hi >= 4)
 		return SBI_EINVALID_ADDR;
 
-	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(), phys_lo,
-					 sizeof(unsigned long) * attr_count,
-					 PRV_S, access))
+	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
+				    sbi_pa2wa(phys_lo, phys_hi),
+				    (sizeof(unsigned long) * attr_count) >> 2,
+				    PRV_S, access))
 		return SBI_EINVALID_ADDR;
 
 	return SBI_OK;
@@ -1028,8 +1020,8 @@ int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
 		return SBI_EINVAL;
 
 	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
-					 handler_entry_pc,
-					 sizeof(unsigned long), PRV_S,
+					 handler_entry_pc >> 2,
+					 sizeof(unsigned long) >> 2, PRV_S,
 					 SBI_DOMAIN_EXECUTE))
 		return SBI_EINVALID_ADDR;
 
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index cd0f4ba..6f5783f 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -173,7 +173,7 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 	}
 	spin_unlock(&dom->assigned_harts_lock);
 
-	if (!sbi_domain_check_addr(dom, resume_addr, prev_mode,
+	if (!sbi_domain_check_addr(dom, resume_addr >> 2, prev_mode,
 				   SBI_DOMAIN_EXECUTE))
 		return SBI_EINVALID_ADDR;
 
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 4bc7ed8..352c876 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -278,7 +278,7 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 		return SBI_EINVAL;
 	val64 = fdt32_to_cpu(val[0]);
 	val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
-	base = val64;
+	base = val64 >> 2;
 
 	/* Read "order" DT property */
 	val = fdt_getprop(fdt, region_offset, "order", &len);
@@ -287,7 +287,7 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 	val32 = fdt32_to_cpu(*val);
 	if (val32 < 3 || __riscv_xlen < val32)
 		return SBI_EINVAL;
-	order = val32;
+	order = val32 >> 2;
 
 	/* Read "mmio" DT property */
 	flags = region_access & SBI_DOMAIN_MEMREGION_ACCESS_MASK;
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 9e013df..1c3c62e 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -153,7 +153,7 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
 	if (rc < 0 || !reg_addr || !reg_size)
 		return;
 
-	if (!sbi_domain_check_addr(dom, reg_addr, dom->next_mode,
+	if (!sbi_domain_check_addr(dom, reg_addr >> 2, dom->next_mode,
 				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
 		rc = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 		if (rc < 0)
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 0ef3d00..515aadd 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -112,7 +112,8 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 	}
 
 	/* Add MSWI regions to the root domain */
-	rc = sbi_domain_root_add_memrange(mswi->addr, mswi->size, ACLINT_MSWI_ALIGN,
+	rc = sbi_domain_root_add_memrange(mswi->addr >> 2, mswi->size >> 2,
+					  ACLINT_MSWI_ALIGN >> 2,
 					  SBI_DOMAIN_MEMREGION_MMIO |
 					  SBI_DOMAIN_MEMREGION_M_READABLE |
 					  SBI_DOMAIN_MEMREGION_M_WRITABLE);
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index 18c79e2..0e30d25 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -99,8 +99,8 @@ int plicsw_cold_ipi_init(struct plicsw_data *plicsw)
 	}
 
 	/* Add PLICSW region to the root domain */
-	rc = sbi_domain_root_add_memrange(plicsw->addr, plicsw->size,
-					  PLICSW_REGION_ALIGN,
+	rc = sbi_domain_root_add_memrange(plicsw->addr >> 2, plicsw->size >> 2,
+					  PLICSW_REGION_ALIGN >> 2,
 					  SBI_DOMAIN_MEMREGION_MMIO |
 					  SBI_DOMAIN_MEMREGION_M_READABLE |
 					  SBI_DOMAIN_MEMREGION_M_WRITABLE);
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 28f2f26..f0a02de 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -267,7 +267,9 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	    ((first_deleg_irq < last_deleg_irq) &&
 	    (last_deleg_irq == aplic->num_source) &&
 	    (first_deleg_irq == 1))) {
-		rc = sbi_domain_root_add_memrange(aplic->addr, aplic->size, PAGE_SIZE,
+		rc = sbi_domain_root_add_memrange(aplic->addr >> 2,
+						  aplic->size >> 2,
+						  PAGE_SIZE >> 2,
 						  SBI_DOMAIN_MEMREGION_MMIO |
 						  SBI_DOMAIN_MEMREGION_M_READABLE |
 						  SBI_DOMAIN_MEMREGION_M_WRITABLE);
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index ae8b31e..3adb6a9 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -377,9 +377,9 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 
 	/* Add IMSIC regions to the root domain */
 	for (i = 0; i < IMSIC_MAX_REGS && imsic->regs[i].size; i++) {
-		rc = sbi_domain_root_add_memrange(imsic->regs[i].addr,
-						  imsic->regs[i].size,
-						  IMSIC_MMIO_PAGE_SZ,
+		rc = sbi_domain_root_add_memrange(imsic->regs[i].addr >> 2,
+						  imsic->regs[i].size >> 2,
+						  IMSIC_MMIO_PAGE_SZ >> 2,
 						  SBI_DOMAIN_MEMREGION_MMIO |
 						  SBI_DOMAIN_MEMREGION_M_READABLE |
 						  SBI_DOMAIN_MEMREGION_M_WRITABLE);
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 193e320..9f22a04 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -173,7 +173,8 @@ int plic_cold_irqchip_init(const struct plic_data *plic)
 	for (i = 1; i <= plic->num_src; i++)
 		plic_set_priority(plic, i, 0);
 
-	return sbi_domain_root_add_memrange(plic->addr, plic->size, BIT(20),
-					(SBI_DOMAIN_MEMREGION_MMIO |
+	return sbi_domain_root_add_memrange(plic->addr >> 2,
+					 plic->size >> 2, BIT(20) >> 2,
+					 (SBI_DOMAIN_MEMREGION_MMIO |
 					 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 }
diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
index ba55908..7079f79 100644
--- a/lib/utils/regmap/fdt_regmap_syscon.c
+++ b/lib/utils/regmap/fdt_regmap_syscon.c
@@ -241,7 +241,7 @@ static int regmap_syscon_init(const void *fdt, int nodeoff,
 		goto fail_free_syscon;
 	}
 
-	rc = sbi_domain_root_add_memrange(addr, size, PAGE_SIZE,
+	rc = sbi_domain_root_add_memrange(addr >> 2, size >> 2, PAGE_SIZE >> 2,
 				(SBI_DOMAIN_MEMREGION_MMIO |
 				 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 	if (rc)
diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
index 30fbb95..61bda5f 100644
--- a/lib/utils/serial/cadence-uart.c
+++ b/lib/utils/serial/cadence-uart.c
@@ -126,7 +126,8 @@ int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 
 	sbi_console_set_device(&cadence_console);
 
-	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
+	return sbi_domain_root_add_memrange(base >> 2,
+					    PAGE_SIZE >> 2, PAGE_SIZE >> 2,
 					    (SBI_DOMAIN_MEMREGION_MMIO |
 					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 }
diff --git a/lib/utils/serial/fdt_serial_htif.c b/lib/utils/serial/fdt_serial_htif.c
index 43557f6..6f475e2 100644
--- a/lib/utils/serial/fdt_serial_htif.c
+++ b/lib/utils/serial/fdt_serial_htif.c
@@ -32,7 +32,8 @@ static int serial_htif_init(const void *fdt, int nodeoff,
 
 	fdt_get_node_addr_size(fdt, nodeoff, 1, &tohost_addr, NULL);
 
-	rc = sbi_domain_root_add_memrange(fromhost_addr, PAGE_SIZE, PAGE_SIZE,
+	rc = sbi_domain_root_add_memrange(fromhost_addr >> 2,
+					  PAGE_SIZE >> 2, PAGE_SIZE >> 2,
 					  (SBI_DOMAIN_MEMREGION_MMIO |
 					   SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 	if (rc)
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 1fe053f..ed331d8 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -135,7 +135,8 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
 
 	sbi_console_set_device(&uart8250_console);
 
-	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
+	return sbi_domain_root_add_memrange(base >> 2,
+					    PAGE_SIZE >> 2, PAGE_SIZE >> 2,
 					    (SBI_DOMAIN_MEMREGION_MMIO |
 					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 }
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 3db3c3b..f118a78 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -224,37 +224,43 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 
 	/* Add MTIMER regions to the root domain */
 	if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
-		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
-					mt->mtime_size + mt->mtimecmp_size,
-					MTIMER_REGION_ALIGN,
-					(SBI_DOMAIN_MEMREGION_MMIO |
-					 SBI_DOMAIN_MEMREGION_M_READABLE |
-					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		rc = sbi_domain_root_add_memrange(
+				    mt->mtimecmp_addr >> 2,
+				    (mt->mtime_size + mt->mtimecmp_size) >> 2,
+				    MTIMER_REGION_ALIGN >> 2,
+				    (SBI_DOMAIN_MEMREGION_MMIO |
+				     SBI_DOMAIN_MEMREGION_M_READABLE |
+				     SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	} else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
-		rc = sbi_domain_root_add_memrange(mt->mtime_addr,
-					mt->mtime_size + mt->mtimecmp_size,
-					MTIMER_REGION_ALIGN,
-					(SBI_DOMAIN_MEMREGION_MMIO |
-					 SBI_DOMAIN_MEMREGION_M_READABLE |
-					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		rc = sbi_domain_root_add_memrange(
+				    mt->mtime_addr >> 2,
+				    (mt->mtime_size + mt->mtimecmp_size) >> 2,
+				    MTIMER_REGION_ALIGN >> 2,
+				    (SBI_DOMAIN_MEMREGION_MMIO |
+				     SBI_DOMAIN_MEMREGION_M_READABLE |
+				     SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	} else {
-		rc = sbi_domain_root_add_memrange(mt->mtime_addr,
-						mt->mtime_size, MTIMER_REGION_ALIGN,
-						(SBI_DOMAIN_MEMREGION_MMIO |
-						 SBI_DOMAIN_MEMREGION_M_READABLE |
-						 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		rc = sbi_domain_root_add_memrange(
+				    mt->mtime_addr >> 2,
+				    mt->mtime_size >> 2,
+				    MTIMER_REGION_ALIGN >> 2,
+				    (SBI_DOMAIN_MEMREGION_MMIO |
+				     SBI_DOMAIN_MEMREGION_M_READABLE |
+				     SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 
-		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
-						mt->mtimecmp_size, MTIMER_REGION_ALIGN,
-						(SBI_DOMAIN_MEMREGION_MMIO |
-						 SBI_DOMAIN_MEMREGION_M_READABLE |
-						 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		rc = sbi_domain_root_add_memrange(
+				    mt->mtimecmp_addr >> 2,
+				    mt->mtimecmp_size >> 2,
+				    MTIMER_REGION_ALIGN >> 2,
+				    (SBI_DOMAIN_MEMREGION_MMIO |
+				     SBI_DOMAIN_MEMREGION_M_READABLE |
+				     SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	}
diff --git a/lib/utils/timer/andes_plmt.c b/lib/utils/timer/andes_plmt.c
index d034feb..70a5605 100644
--- a/lib/utils/timer/andes_plmt.c
+++ b/lib/utils/timer/andes_plmt.c
@@ -92,8 +92,9 @@ int plmt_cold_timer_init(struct plmt_data *plmt)
 
 	/* Add PLMT region to the root domain */
 	rc = sbi_domain_root_add_memrange(
-		(unsigned long)plmt->time_val, plmt->size,
-		PLMT_REGION_ALIGN,
+		(unsigned long)plmt->time_val >> 2,
+		plmt->size >> 2,
+		PLMT_REGION_ALIGN >> 2,
 		SBI_DOMAIN_MEMREGION_MMIO |
 		SBI_DOMAIN_MEMREGION_M_READABLE |
 		SBI_DOMAIN_MEMREGION_M_WRITABLE);
diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index 59084c4..23313fd 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -46,8 +46,9 @@ static int renesas_rzfive_early_init(bool cold_boot, const void *fdt,
 	 * so that any access to these regions gets blocked and for M-mode
 	 * we grant full access.
 	 */
-	return sbi_domain_root_add_memrange(0x30000, 0x20000, 0x1000,
-					    SBI_DOMAIN_MEMREGION_M_RWX);
+	return sbi_domain_root_add_memrange(
+			    0x30000 >> 2, 0x20000 >> 2, 0x1000 >> 2,
+			    SBI_DOMAIN_MEMREGION_M_RWX);
 }
 
 static const struct fdt_match renesas_rzfive_match[] = {
diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
index eca9afb..f5ef490 100644
--- a/platform/generic/sophgo/sg2042.c
+++ b/platform/generic/sophgo/sg2042.c
@@ -32,10 +32,10 @@ static int sophgo_sg2042_early_init(bool cold_boot, const void *fdt,
 	 */
 	if (cold_boot)
 		return sbi_domain_root_add_memrange(
-					(ulong)SOPHGO_SG2042_TIMER_BASE,
+					(ulong)SOPHGO_SG2042_TIMER_BASE >> 2,
 					SOPHGO_SG2042_TIMER_SIZE *
-					SOPHGO_SG2042_TIMER_NUM,
-					MTIMER_REGION_ALIGN,
+					SOPHGO_SG2042_TIMER_NUM >> 2,
+					MTIMER_REGION_ALIGN >> 2,
 					(SBI_DOMAIN_MEMREGION_MMIO |
 					 SBI_DOMAIN_MEMREGION_M_READABLE |
 					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
-- 
2.45.2


