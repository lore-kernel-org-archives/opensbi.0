From: Bin Meng <bmeng@tinylab.org>
Date: Wed, 21 Dec 2022 19:38:06 +0800
Subject: [PATCH] treewide: Replace TRUE/FALSE with true/false
Message-ID: <20221221113806.1450323-1-bmeng@tinylab.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

C language standard uses true/false for the boolean type.
Let's switch to that for better language compatibility.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 include/sbi/sbi_domain.h           |  4 +--
 include/sbi/sbi_list.h             |  2 +-
 include/sbi/sbi_platform.h         | 18 +++++------
 include/sbi/sbi_types.h            |  6 ++--
 lib/sbi/sbi_console.c              |  4 +--
 lib/sbi/sbi_domain.c               | 44 ++++++++++++-------------
 lib/sbi/sbi_ecall.c                |  4 +--
 lib/sbi/sbi_ecall_hsm.c            |  2 +-
 lib/sbi/sbi_emulate_csr.c          | 10 +++---
 lib/sbi/sbi_fifo.c                 |  8 ++---
 lib/sbi/sbi_init.c                 | 52 +++++++++++++++---------------
 lib/sbi/sbi_ipi.c                  |  2 +-
 lib/sbi/sbi_pmu.c                  | 14 ++++----
 lib/sbi/sbi_system.c               |  2 +-
 lib/sbi/sbi_trap.c                 |  8 ++---
 lib/utils/fdt/fdt_domain.c         |  4 +--
 lib/utils/reset/fdt_reset_gpio.c   | 12 +++----
 platform/fpga/ariane/platform.c    |  2 +-
 platform/fpga/openpiton/platform.c |  2 +-
 platform/generic/sifive/fu740.c    |  2 +-
 platform/kendryte/k210/platform.c  |  2 +-
 platform/nuclei/ux600/platform.c   |  2 +-
 platform/template/platform.c       |  2 +-
 23 files changed, 103 insertions(+), 105 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 5553d21..f0d9289 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -113,7 +113,7 @@ extern struct sbi_domain *domidx_to_domain_table[];
  * Check whether given HART is assigned to specified domain
  * @param dom pointer to domain
  * @param hartid the HART ID
- * @return TRUE if HART is assigned to domain otherwise FALSE
+ * @return true if HART is assigned to domain otherwise false
  */
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid);
 
@@ -148,7 +148,7 @@ void sbi_domain_memregion_init(unsigned long addr,
  * @param addr the address to be checked
  * @param mode the privilege mode of access
  * @param access_flags bitmask of domain access types (enum sbi_domain_access)
- * @return TRUE if access allowed otherwise FALSE
+ * @return true if access allowed otherwise false
  */
 bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			   unsigned long addr, unsigned long mode,
diff --git a/include/sbi/sbi_list.h b/include/sbi/sbi_list.h
index b1178df..fe735df 100644
--- a/include/sbi/sbi_list.h
+++ b/include/sbi/sbi_list.h
@@ -47,7 +47,7 @@ static inline void __sbi_list_add(struct sbi_dlist *new,
  * Checks if the list is empty or not.
  * @param head List head
  *
- * Retruns TRUE if list is empty, FALSE otherwise.
+ * Returns true if list is empty, false otherwise.
  */
 static inline bool sbi_list_empty(struct sbi_dlist *head)
 {
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 722f27a..010e9ce 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -344,16 +344,16 @@ static inline u32 sbi_platform_hart_stack_size(const struct sbi_platform *plat)
  * @param plat pointer to struct sbi_platform
  * @param hartid HART ID
  *
- * @return TRUE if HART is invalid and FALSE otherwise
+ * @return true if HART is invalid and false otherwise
  */
 static inline bool sbi_platform_hart_invalid(const struct sbi_platform *plat,
 					     u32 hartid)
 {
 	if (!plat)
-		return TRUE;
+		return true;
 	if (plat->hart_count <= sbi_platform_hart_index(plat, hartid))
-		return TRUE;
-	return FALSE;
+		return true;
+	return false;
 }
 
 /**
@@ -377,7 +377,7 @@ static inline int sbi_platform_nascent_init(const struct sbi_platform *plat)
  * Early initialization for current HART
  *
  * @param plat pointer to struct sbi_platform
- * @param cold_boot whether cold boot (TRUE) or warm_boot (FALSE)
+ * @param cold_boot whether cold boot (true) or warm_boot (false)
  *
  * @return 0 on success and negative error code on failure
  */
@@ -393,7 +393,7 @@ static inline int sbi_platform_early_init(const struct sbi_platform *plat,
  * Final initialization for current HART
  *
  * @param plat pointer to struct sbi_platform
- * @param cold_boot whether cold boot (TRUE) or warm_boot (FALSE)
+ * @param cold_boot whether cold boot (true) or warm_boot (false)
  *
  * @return 0 on success and negative error code on failure
  */
@@ -538,7 +538,7 @@ static inline int sbi_platform_console_init(const struct sbi_platform *plat)
  * Initialize the platform interrupt controller for current HART
  *
  * @param plat pointer to struct sbi_platform
- * @param cold_boot whether cold boot (TRUE) or warm_boot (FALSE)
+ * @param cold_boot whether cold boot (true) or warm_boot (false)
  *
  * @return 0 on success and negative error code on failure
  */
@@ -565,7 +565,7 @@ static inline void sbi_platform_irqchip_exit(const struct sbi_platform *plat)
  * Initialize the platform IPI support for current HART
  *
  * @param plat pointer to struct sbi_platform
- * @param cold_boot whether cold boot (TRUE) or warm_boot (FALSE)
+ * @param cold_boot whether cold boot (true) or warm_boot (false)
  *
  * @return 0 on success and negative error code on failure
  */
@@ -592,7 +592,7 @@ static inline void sbi_platform_ipi_exit(const struct sbi_platform *plat)
  * Initialize the platform timer for current HART
  *
  * @param plat pointer to struct sbi_platform
- * @param cold_boot whether cold boot (TRUE) or warm_boot (FALSE)
+ * @param cold_boot whether cold boot (true) or warm_boot (false)
  *
  * @return 0 on success and negative error code on failure
  */
diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 7fb1af7..75cdddd 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -54,10 +54,8 @@ typedef unsigned long		virtual_size_t;
 typedef unsigned long		physical_addr_t;
 typedef unsigned long		physical_size_t;
 
-#define TRUE			1
-#define FALSE			0
-#define true			TRUE
-#define false			FALSE
+#define true			1
+#define false			0
 
 #define NULL			((void *)0)
 
diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index cfef2f8..bb6e1ef 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -20,9 +20,9 @@ bool sbi_isprintable(char c)
 {
 	if (((31 < c) && (c < 127)) || (c == '\f') || (c == '\r') ||
 	    (c == '\n') || (c == '\t')) {
-		return TRUE;
+		return true;
 	}
-	return FALSE;
+	return false;
 }
 
 int sbi_getc(void)
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 3205595..19e2029 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -33,7 +33,7 @@ struct sbi_domain root = {
 	.name = "root",
 	.possible_harts = &root_hmask,
 	.regions = root_memregs,
-	.system_reset_allowed = TRUE,
+	.system_reset_allowed = true,
 };
 
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
@@ -41,7 +41,7 @@ bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
 	if (dom)
 		return sbi_hartmask_test_hart(hartid, &dom->assigned_harts);
 
-	return FALSE;
+	return false;
 }
 
 ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
@@ -105,12 +105,12 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			   unsigned long addr, unsigned long mode,
 			   unsigned long access_flags)
 {
-	bool rmmio, mmio = FALSE;
+	bool rmmio, mmio = false;
 	struct sbi_domain_memregion *reg;
 	unsigned long rstart, rend, rflags, rwx = 0;
 
 	if (!dom)
-		return FALSE;
+		return false;
 
 	if (access_flags & SBI_DOMAIN_READ)
 		rwx |= SBI_DOMAIN_MEMREGION_READABLE;
@@ -119,7 +119,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 	if (access_flags & SBI_DOMAIN_EXECUTE)
 		rwx |= SBI_DOMAIN_MEMREGION_EXECUTABLE;
 	if (access_flags & SBI_DOMAIN_MMIO)
-		mmio = TRUE;
+		mmio = true;
 
 	sbi_domain_for_each_memregion(dom, reg) {
 		rflags = reg->flags;
@@ -130,29 +130,29 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 		rend = (reg->order < __riscv_xlen) ?
 			rstart + ((1UL << reg->order) - 1) : -1UL;
 		if (rstart <= addr && addr <= rend) {
-			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? TRUE : FALSE;
+			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
 			if (mmio != rmmio)
-				return FALSE;
-			return ((rflags & rwx) == rwx) ? TRUE : FALSE;
+				return false;
+			return ((rflags & rwx) == rwx) ? true : false;
 		}
 	}
 
-	return (mode == PRV_M) ? TRUE : FALSE;
+	return (mode == PRV_M) ? true : false;
 }
 
 /* Check if region complies with constraints */
 static bool is_region_valid(const struct sbi_domain_memregion *reg)
 {
 	if (reg->order < 3 || __riscv_xlen < reg->order)
-		return FALSE;
+		return false;
 
 	if (reg->order == __riscv_xlen && reg->base != 0)
-		return FALSE;
+		return false;
 
 	if (reg->order < __riscv_xlen && (reg->base & (BIT(reg->order) - 1)))
-		return FALSE;
+		return false;
 
-	return TRUE;
+	return true;
 }
 
 /** Check if regionA is sub-region of regionB */
@@ -168,9 +168,9 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
 	    (regA_start < regB_end) &&
 	    (regB_start < regA_end) &&
 	    (regA_end <= regB_end))
-		return TRUE;
+		return true;
 
-	return FALSE;
+	return false;
 }
 
 /** Check if regionA conflicts regionB */
@@ -179,9 +179,9 @@ static bool is_region_conflict(const struct sbi_domain_memregion *regA,
 {
 	if ((is_region_subset(regA, regB) || is_region_subset(regB, regA)) &&
 	    regA->flags == regB->flags)
-		return TRUE;
+		return true;
 
-	return FALSE;
+	return false;
 }
 
 /** Check if regionA should be placed before regionB */
@@ -189,13 +189,13 @@ static bool is_region_before(const struct sbi_domain_memregion *regA,
 			     const struct sbi_domain_memregion *regB)
 {
 	if (regA->order < regB->order)
-		return TRUE;
+		return true;
 
 	if ((regA->order == regB->order) &&
 	    (regA->base < regB->base))
-		return TRUE;
+		return true;
 
-	return FALSE;
+	return false;
 }
 
 static int sanitize_domain(const struct sbi_platform *plat,
@@ -237,12 +237,12 @@ static int sanitize_domain(const struct sbi_platform *plat,
 
 	/* Count memory regions and check presence of firmware region */
 	count = 0;
-	have_fw_reg = FALSE;
+	have_fw_reg = false;
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (reg->order == root_fw_region.order &&
 		    reg->base == root_fw_region.base &&
 		    reg->flags == root_fw_region.flags)
-			have_fw_reg = TRUE;
+			have_fw_reg = true;
 		count++;
 	}
 	if (!have_fw_reg) {
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 25dd78c..27ce5d4 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -78,7 +78,7 @@ int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
 
 void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext)
 {
-	bool found = FALSE;
+	bool found = false;
 	struct sbi_ecall_extension *t;
 
 	if (!ext)
@@ -86,7 +86,7 @@ void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext)
 
 	sbi_list_for_each_entry(t, &ecall_exts_list, head) {
 		if (t == ext) {
-			found = TRUE;
+			found = true;
 			break;
 		}
 	}
diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index a339abf..703a824 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -33,7 +33,7 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 					 regs->a0, regs->a1, smode, regs->a2);
 		break;
 	case SBI_EXT_HSM_HART_STOP:
-		ret = sbi_hsm_hart_stop(scratch, TRUE);
+		ret = sbi_hsm_hart_stop(scratch, true);
 		break;
 	case SBI_EXT_HSM_HART_GET_STATUS:
 		ret = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(),
diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index aec9d3c..64bebd8 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -39,7 +39,7 @@ static bool hpm_allowed(int hpm_num, ulong prev_mode, bool virt)
 			cen = 0;
 	}
 
-	return ((cen >> hpm_num) & 1) ? TRUE : FALSE;
+	return ((cen >> hpm_num) & 1) ? true : false;
 }
 
 int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
@@ -49,9 +49,9 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
 #if __riscv_xlen == 32
-	bool virt = (regs->mstatusH & MSTATUSH_MPV) ? TRUE : FALSE;
+	bool virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
 #else
-	bool virt = (regs->mstatus & MSTATUS_MPV) ? TRUE : FALSE;
+	bool virt = (regs->mstatus & MSTATUS_MPV) ? true : false;
 #endif
 
 	switch (csr_num) {
@@ -164,9 +164,9 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
 	int ret = 0;
 	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
 #if __riscv_xlen == 32
-	bool virt = (regs->mstatusH & MSTATUSH_MPV) ? TRUE : FALSE;
+	bool virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
 #else
-	bool virt = (regs->mstatus & MSTATUS_MPV) ? TRUE : FALSE;
+	bool virt = (regs->mstatus & MSTATUS_MPV) ? true : false;
 #endif
 
 	switch (csr_num) {
diff --git a/lib/sbi/sbi_fifo.c b/lib/sbi/sbi_fifo.c
index 68d6039..72c6d39 100644
--- a/lib/sbi/sbi_fifo.c
+++ b/lib/sbi/sbi_fifo.c
@@ -26,7 +26,7 @@ void sbi_fifo_init(struct sbi_fifo *fifo, void *queue_mem, u16 entries,
 /* Note: must be called with fifo->qlock held */
 static inline bool __sbi_fifo_is_full(struct sbi_fifo *fifo)
 {
-	return (fifo->avail == fifo->num_entries) ? TRUE : FALSE;
+	return (fifo->avail == fifo->num_entries) ? true : false;
 }
 
 u16 sbi_fifo_avail(struct sbi_fifo *fifo)
@@ -75,7 +75,7 @@ static inline void  __sbi_fifo_enqueue(struct sbi_fifo *fifo, void *data)
 /* Note: must be called with fifo->qlock held */
 static inline bool __sbi_fifo_is_empty(struct sbi_fifo *fifo)
 {
-	return (fifo->avail == 0) ? TRUE : FALSE;
+	return (fifo->avail == 0) ? true : false;
 }
 
 int sbi_fifo_is_empty(struct sbi_fifo *fifo)
@@ -105,13 +105,13 @@ static inline void __sbi_fifo_reset(struct sbi_fifo *fifo)
 bool sbi_fifo_reset(struct sbi_fifo *fifo)
 {
 	if (!fifo)
-		return FALSE;
+		return false;
 
 	spin_lock(&fifo->qlock);
 	__sbi_fifo_reset(fifo);
 	spin_unlock(&fifo->qlock);
 
-	return TRUE;
+	return true;
 }
 
 /**
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a8500e5..ded3da0 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -255,15 +255,15 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (!init_count_offset)
 		sbi_hart_hang();
 
-	rc = sbi_hsm_init(scratch, hartid, TRUE);
+	rc = sbi_hsm_init(scratch, hartid, true);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_platform_early_init(plat, TRUE);
+	rc = sbi_platform_early_init(plat, true);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, TRUE);
+	rc = sbi_hart_init(scratch, true);
 	if (rc)
 		sbi_hart_hang();
 
@@ -271,32 +271,32 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_pmu_init(scratch, TRUE);
+	rc = sbi_pmu_init(scratch, true);
 	if (rc)
 		sbi_hart_hang();
 
 	sbi_boot_print_banner(scratch);
 
-	rc = sbi_irqchip_init(scratch, TRUE);
+	rc = sbi_irqchip_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: irqchip init failed (error %d)\n",
 			   __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_ipi_init(scratch, TRUE);
+	rc = sbi_ipi_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: ipi init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_tlb_init(scratch, TRUE);
+	rc = sbi_tlb_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: tlb init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
 
-	rc = sbi_timer_init(scratch, TRUE);
+	rc = sbi_timer_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: timer init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
@@ -332,7 +332,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * Note: Platform final initialization should be last so that
 	 * it sees correct domain assignment and PMP configuration.
 	 */
-	rc = sbi_platform_final_init(plat, TRUE);
+	rc = sbi_platform_final_init(plat, true);
 	if (rc) {
 		sbi_printf("%s: platform final init failed (error %d)\n",
 			   __func__, rc);
@@ -352,7 +352,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_hsm_prepare_next_jump(scratch, hartid);
 	sbi_hart_switch_mode(hartid, scratch->next_arg1, scratch->next_addr,
-			     scratch->next_mode, FALSE);
+			     scratch->next_mode, false);
 }
 
 static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
@@ -364,35 +364,35 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
 	if (!init_count_offset)
 		sbi_hart_hang();
 
-	rc = sbi_hsm_init(scratch, hartid, FALSE);
+	rc = sbi_hsm_init(scratch, hartid, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_platform_early_init(plat, FALSE);
+	rc = sbi_platform_early_init(plat, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, FALSE);
+	rc = sbi_hart_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_pmu_init(scratch, FALSE);
+	rc = sbi_pmu_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_irqchip_init(scratch, FALSE);
+	rc = sbi_irqchip_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_ipi_init(scratch, FALSE);
+	rc = sbi_ipi_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_tlb_init(scratch, FALSE);
+	rc = sbi_tlb_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_timer_init(scratch, FALSE);
+	rc = sbi_timer_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
@@ -400,7 +400,7 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_platform_final_init(plat, FALSE);
+	rc = sbi_platform_final_init(plat, false);
 	if (rc)
 		sbi_hart_hang();
 
@@ -444,7 +444,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_hart_switch_mode(hartid, scratch->next_arg1,
 			     scratch->next_addr,
-			     scratch->next_mode, FALSE);
+			     scratch->next_mode, false);
 }
 
 static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
@@ -463,8 +463,8 @@ static atomic_t coldboot_lottery = ATOMIC_INITIALIZER(0);
  */
 void __noreturn sbi_init(struct sbi_scratch *scratch)
 {
-	bool next_mode_supported	= FALSE;
-	bool coldboot			= FALSE;
+	bool next_mode_supported	= false;
+	bool coldboot			= false;
 	u32 hartid			= current_hartid();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
@@ -474,15 +474,15 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 
 	switch (scratch->next_mode) {
 	case PRV_M:
-		next_mode_supported = TRUE;
+		next_mode_supported = true;
 		break;
 	case PRV_S:
 		if (misa_extension('S'))
-			next_mode_supported = TRUE;
+			next_mode_supported = true;
 		break;
 	case PRV_U:
 		if (misa_extension('U'))
-			next_mode_supported = TRUE;
+			next_mode_supported = true;
 		break;
 	default:
 		sbi_hart_hang();
@@ -499,7 +499,7 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 	 */
 
 	if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
-		coldboot = TRUE;
+		coldboot = true;
 
 	/*
 	 * Do platform specific nascent (very early) initialization so
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 7aafbbd..1bcc2e4 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -163,7 +163,7 @@ void sbi_ipi_clear_smode(void)
 
 static void sbi_ipi_process_halt(struct sbi_scratch *scratch)
 {
-	sbi_hsm_hart_stop(scratch, TRUE);
+	sbi_hsm_hart_stop(scratch, true);
 }
 
 static struct sbi_ipi_event_ops ipi_halt_ops = {
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 91d9ccc..154dbda 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -85,7 +85,7 @@ static uint32_t total_ctrs;
  * @param evtA Pointer to the existing hw event structure
  * @param evtB Pointer to the new hw event structure
  *
- * Return FALSE if the range doesn't overlap, TRUE otherwise
+ * Return false if the range doesn't overlap, true otherwise
  */
 static bool pmu_event_range_overlap(struct sbi_pmu_hw_event *evtA,
 				    struct sbi_pmu_hw_event *evtB)
@@ -93,17 +93,17 @@ static bool pmu_event_range_overlap(struct sbi_pmu_hw_event *evtA,
 	/* check if the range of events overlap with a previous entry */
 	if (((evtA->end_idx < evtB->start_idx) && (evtA->end_idx < evtB->end_idx)) ||
 	   ((evtA->start_idx > evtB->start_idx) && (evtA->start_idx > evtB->end_idx)))
-		return FALSE;
-	return TRUE;
+		return false;
+	return true;
 }
 
 static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
 				     uint64_t select_val, uint64_t select_mask)
 {
 	if ((evt->select == select_val) && (evt->select_mask == select_mask))
-		return TRUE;
+		return true;
 
-	return FALSE;
+	return false;
 }
 
 static int pmu_event_validate(unsigned long event_idx)
@@ -384,14 +384,14 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 	int event_idx_type;
 	uint32_t event_code;
 	int ret = SBI_EINVAL;
-	bool bUpdate = FALSE;
+	bool bUpdate = false;
 	int i, cidx;
 
 	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
 		return ret;
 
 	if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
-		bUpdate = TRUE;
+		bUpdate = true;
 
 	for_each_set_bit(i, &cmask, total_ctrs) {
 		cidx = i + cbase;
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index 9cea3c0..f37c811 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -79,7 +79,7 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
 	}
 
 	/* Stop current HART */
-	sbi_hsm_hart_stop(scratch, FALSE);
+	sbi_hsm_hart_stop(scratch, false);
 
 	/* Platform specific reset if domain allowed system reset */
 	if (dom->system_reset_allowed) {
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index c875c90..025cf61 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -88,12 +88,12 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 {
 	ulong hstatus, vsstatus, prev_mode;
 #if __riscv_xlen == 32
-	bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? TRUE : FALSE;
+	bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
 #else
-	bool prev_virt = (regs->mstatus & MSTATUS_MPV) ? TRUE : FALSE;
+	bool prev_virt = (regs->mstatus & MSTATUS_MPV) ? true : false;
 #endif
 	/* By default, we redirect to HS-mode */
-	bool next_virt = FALSE;
+	bool next_virt = false;
 
 	/* Sanity check on previous mode */
 	prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
@@ -106,7 +106,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 	if (misa_extension('H') && prev_virt) {
 		if ((trap->cause < __riscv_xlen) &&
 		    (csr_read(CSR_HEDELEG) & BIT(trap->cause))) {
-			next_virt = TRUE;
+			next_virt = true;
 		}
 	}
 
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 0568603..35462a2 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -401,9 +401,9 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	/* Read "system-reset-allowed" DT property */
 	if (fdt_get_property(fdt, domain_offset,
 			     "system-reset-allowed", NULL))
-		dom->system_reset_allowed = TRUE;
+		dom->system_reset_allowed = true;
 	else
-		dom->system_reset_allowed = FALSE;
+		dom->system_reset_allowed = false;
 
 	/* Find /cpus DT node */
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index bd2c622..6a908dd 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -77,7 +77,7 @@ static void gpio_reset_exec(struct gpio_reset *reset)
 
 static int gpio_system_poweroff_check(u32 type, u32 reason)
 {
-	if (gpio_reset_get(FALSE, type))
+	if (gpio_reset_get(false, type))
 		return 128;
 
 	return 0;
@@ -85,7 +85,7 @@ static int gpio_system_poweroff_check(u32 type, u32 reason)
 
 static void gpio_system_poweroff(u32 type, u32 reason)
 {
-	gpio_reset_exec(gpio_reset_get(FALSE, type));
+	gpio_reset_exec(gpio_reset_get(false, type));
 }
 
 static struct sbi_system_reset_device gpio_poweroff = {
@@ -96,7 +96,7 @@ static struct sbi_system_reset_device gpio_poweroff = {
 
 static int gpio_system_restart_check(u32 type, u32 reason)
 {
-	if (gpio_reset_get(TRUE, type))
+	if (gpio_reset_get(true, type))
 		return 128;
 
 	return 0;
@@ -104,7 +104,7 @@ static int gpio_system_restart_check(u32 type, u32 reason)
 
 static void gpio_system_restart(u32 type, u32 reason)
 {
-	gpio_reset_exec(gpio_reset_get(TRUE, type));
+	gpio_reset_exec(gpio_reset_get(true, type));
 }
 
 static struct sbi_system_reset_device gpio_restart = {
@@ -149,7 +149,7 @@ static int gpio_reset_init(void *fdt, int nodeoff,
 }
 
 static const struct fdt_match gpio_poweroff_match[] = {
-	{ .compatible = "gpio-poweroff", .data = (const void *)FALSE },
+	{ .compatible = "gpio-poweroff", .data = (const void *)false },
 	{ },
 };
 
@@ -159,7 +159,7 @@ struct fdt_reset fdt_poweroff_gpio = {
 };
 
 static const struct fdt_match gpio_reset_match[] = {
-	{ .compatible = "gpio-restart", .data = (const void *)TRUE },
+	{ .compatible = "gpio-restart", .data = (const void *)true },
 	{ },
 };
 
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 56a666b..1e341c2 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -56,7 +56,7 @@ static struct aclint_mtimer_data mtimer = {
 	.mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
 	.first_hartid = 0,
 	.hart_count = ARIANE_HART_COUNT,
-	.has_64bit_mmio = TRUE,
+	.has_64bit_mmio = true,
 };
 
 /*
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 5ff7d20..57ae698 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -60,7 +60,7 @@ static struct aclint_mtimer_data mtimer = {
 	.mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
 	.first_hartid = 0,
 	.hart_count = OPENPITON_DEFAULT_HART_COUNT,
-	.has_64bit_mmio = TRUE,
+	.has_64bit_mmio = true,
 };
 
 /*
diff --git a/platform/generic/sifive/fu740.c b/platform/generic/sifive/fu740.c
index f595c04..fe71ce6 100644
--- a/platform/generic/sifive/fu740.c
+++ b/platform/generic/sifive/fu740.c
@@ -205,7 +205,7 @@ static int da9063_reset_init(void *fdt, int nodeoff,
 }
 
 static const struct fdt_match da9063_reset_match[] = {
-	{ .compatible = "dlg,da9063", .data = (void *)TRUE },
+	{ .compatible = "dlg,da9063", .data = (void *)true },
 	{ },
 };
 
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index ef848c7..7eb9015 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -52,7 +52,7 @@ static struct aclint_mtimer_data mtimer = {
 	.mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
 	.first_hartid = 0,
 	.hart_count = K210_HART_COUNT,
-	.has_64bit_mmio = TRUE,
+	.has_64bit_mmio = true,
 };
 
 static u32 k210_get_clk_freq(void)
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 2b02734..4eccff1 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -83,7 +83,7 @@ static struct aclint_mtimer_data mtimer = {
 	.mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
 	.first_hartid = 0,
 	.hart_count = UX600_HART_COUNT,
-	.has_64bit_mmio = TRUE,
+	.has_64bit_mmio = true,
 };
 
 static u32 measure_cpu_freq(u32 n)
diff --git a/platform/template/platform.c b/platform/template/platform.c
index f3802da..8adc431 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -53,7 +53,7 @@ static struct aclint_mtimer_data mtimer = {
 	.mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
 	.first_hartid = 0,
 	.hart_count = PLATFORM_HART_COUNT,
-	.has_64bit_mmio = TRUE,
+	.has_64bit_mmio = true,
 };
 
 /*
-- 
2.34.1


