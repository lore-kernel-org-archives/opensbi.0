From: Bo Gan <ganboing@gmail.com>
Date: Mon,  5 Feb 2024 02:50:00 -0800
Subject: [PATCH v2 3/3] lib: sbi: Allow platform to fixup load/store faults
In-Reply-To: <1707130200-559404-1-git-send-email-ganboing@gmail.com>
References: <1707130200-559404-1-git-send-email-ganboing@gmail.com>
Message-ID: <1707130200-559404-4-git-send-email-ganboing@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch allows platforms to define load/store emulators to handle
load/store faults. Each platform can then use it to trap-and-emulate
special devices, or filter access to physical devices.

Two more functions are added to `sbi_platform_operations`.
emulate_load: called when trap.mcause == CAUSE_LOAD_ACCESS
emulate_store: called when trap.mcause == CAUSE_STORE_ACCESS
If not defined, sbi_trap_handler redirects the fault, same as before.

The code to decode load/store instruction is reused from
sbi_misaligned_load/store_handler, with additional lb/lbu/sb decoding.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_platform.h  |  13 +++
 include/sbi/sbi_trap.h      |   2 +-
 include/sbi/sbi_trap_ldst.h |  28 +++++-
 lib/sbi/sbi_trap.c          |  36 +++++---
 lib/sbi/sbi_trap_ldst.c     | 208 +++++++++++++++++++++++++++++---------------
 5 files changed, 196 insertions(+), 91 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 2fb33e1..f8e4514 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -48,6 +48,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_version.h>
+#include <sbi/sbi_trap_ldst.h>
 
 struct sbi_domain_memregion;
 struct sbi_ecall_return;
@@ -139,6 +140,18 @@ struct sbi_platform_operations {
 	int (*vendor_ext_provider)(long funcid,
 				   struct sbi_trap_regs *regs,
 				   struct sbi_ecall_return *out);
+
+	/**
+	 * platform specific handler to "fixup" load fault
+	 * If NULL, `sbi_trap_handler` will redirect the load fault
+	 */
+	sbi_trap_ld_emulator emulate_load;
+
+	/**
+	 * platform specific handler to "fixup" store fault
+	 * If NULL, `sbi_trap_handler` will redirect the store fault
+	 */
+	sbi_trap_st_emulator emulate_store;
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index a562b95..2727bdb 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -225,7 +225,7 @@ static inline unsigned long sbi_regs_gva(const struct sbi_trap_regs *regs)
 }
 
 int sbi_trap_redirect(struct sbi_trap_regs *regs,
-		      struct sbi_trap_info *trap);
+		      const struct sbi_trap_info *trap);
 
 struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs);
 
diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
index ab27eb4..54df16e 100644
--- a/include/sbi/sbi_trap_ldst.h
+++ b/include/sbi/sbi_trap_ldst.h
@@ -13,11 +13,31 @@
 #include <sbi/sbi_types.h>
 
 struct sbi_trap_regs;
+struct sbi_trap_info;
 
-int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
-				struct sbi_trap_regs *regs);
+union reg_data {
+	u64 data_u64;
+	u32 data_u32;
+	u8 data_bytes[8];
+	ulong data_ulong;
+};
 
-int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
-				 struct sbi_trap_regs *regs);
+typedef int (*sbi_trap_ld_emulator)(ulong addr, int len, union reg_data *out_val,
+		struct sbi_trap_regs *regs, const struct sbi_trap_info *orig_trap);
+
+typedef int (*sbi_trap_st_emulator)(ulong addr, int len, union reg_data in_val,
+		struct sbi_trap_regs *regs, const struct sbi_trap_info *orig_trap);
+
+int sbi_misaligned_load_handler(struct sbi_trap_regs *regs,
+				const struct sbi_trap_info *orig_trap);
+
+int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
+				const struct sbi_trap_info *orig_trap);
+
+int sbi_load_fault_handler(struct sbi_trap_regs *regs,
+			const struct sbi_trap_info *orig_trap);
+
+int sbi_store_fault_handler(struct sbi_trap_regs *regs,
+			const struct sbi_trap_info *orig_trap);
 
 #endif
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 145db4b..eb4cc0f 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -84,7 +84,7 @@ static void __noreturn sbi_trap_error(const char *msg, int rc,
  * @return 0 on success and negative error code on failure
  */
 int sbi_trap_redirect(struct sbi_trap_regs *regs,
-		      struct sbi_trap_info *trap)
+		      const struct sbi_trap_info *trap)
 {
 	ulong hstatus, vsstatus, prev_mode;
 #if __riscv_xlen == 32
@@ -285,6 +285,13 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		}
 		return regs;
 	}
+	/* Original trap_info */
+	trap.epc   = regs->mepc;
+	trap.cause = mcause;
+	trap.tval  = mtval;
+	trap.tval2 = mtval2;
+	trap.tinst = mtinst;
+	trap.gva   = sbi_regs_gva(regs);
 
 	switch (mcause) {
 	case CAUSE_ILLEGAL_INSTRUCTION:
@@ -292,11 +299,13 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		msg = "illegal instruction handler failed";
 		break;
 	case CAUSE_MISALIGNED_LOAD:
-		rc = sbi_misaligned_load_handler(mtval, mtval2, mtinst, regs);
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_LOAD);
+		rc  = sbi_misaligned_load_handler(regs, &trap);
 		msg = "misaligned load handler failed";
 		break;
 	case CAUSE_MISALIGNED_STORE:
-		rc  = sbi_misaligned_store_handler(mtval, mtval2, mtinst, regs);
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_STORE);
+		rc  = sbi_misaligned_store_handler(regs, &trap);
 		msg = "misaligned store handler failed";
 		break;
 	case CAUSE_SUPERVISOR_ECALL:
@@ -305,20 +314,19 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		msg = "ecall handler failed";
 		break;
 	case CAUSE_LOAD_ACCESS:
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_LOAD);
+		rc  = sbi_load_fault_handler(regs, &trap);
+		msg = "load fault handler failed";
+		break;
 	case CAUSE_STORE_ACCESS:
-		sbi_pmu_ctr_incr_fw(mcause == CAUSE_LOAD_ACCESS ?
-			SBI_PMU_FW_ACCESS_LOAD : SBI_PMU_FW_ACCESS_STORE);
-		/* fallthrough */
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_STORE);
+		rc  = sbi_store_fault_handler(regs, &trap);
+		msg = "store fault handler failed";
+		break;
 	default:
 		/* If the trap came from S or U mode, redirect it there */
-		trap.epc = regs->mepc;
-		trap.cause = mcause;
-		trap.tval = mtval;
-		trap.tval2 = mtval2;
-		trap.tinst = mtinst;
-		trap.gva   = sbi_regs_gva(regs);
-
-		rc = sbi_trap_redirect(regs, &trap);
+		msg = "trap redirect failed";
+		rc  = sbi_trap_redirect(regs, &trap);
 		break;
 	}
 
diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
index be9a394..93d4ce9 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -15,42 +15,24 @@
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
+#include <sbi/sbi_platform.h>
 
-union reg_data {
-	u8 data_bytes[8];
-	ulong data_ulong;
-	u64 data_u64;
-};
-
-static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
-					ulong addr_offset)
-{
-	if (new_tinst == INSN_PSEUDO_VS_LOAD ||
-	    new_tinst == INSN_PSEUDO_VS_STORE)
-		return new_tinst;
-	else if (orig_tinst == 0)
-		return 0UL;
-	else
-		return orig_tinst | (addr_offset << SH_RS1);
-}
-
-int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
-				struct sbi_trap_regs *regs)
+static int sbi_trap_emulate_load(struct sbi_trap_regs *regs,
+				 const struct sbi_trap_info *orig_trap,
+				 sbi_trap_ld_emulator emu)
 {
 	ulong insn, insn_len;
-	union reg_data val;
+	union reg_data val = { 0 };
 	struct sbi_trap_info uptrap;
-	int i, fp = 0, shift = 0, len = 0;
+	int rc, fp = 0, shift = 0, len = 0;
 
-	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_LOAD);
-
-	if (tinst & 0x1) {
+	if (orig_trap->tinst & 0x1) {
 		/*
 		 * Bit[0] == 1 implies trapped instruction value is
 		 * transformed instruction or custom instruction.
 		 */
-		insn = tinst | INSN_16BIT_MASK;
-		insn_len = (tinst & 0x2) ? INSN_LEN(insn) : 2;
+		insn	 = orig_trap->tinst | INSN_16BIT_MASK;
+		insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
 	} else {
 		/*
 		 * Bit[0] == 0 implies trapped instruction value is
@@ -64,7 +46,12 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
 		insn_len = INSN_LEN(insn);
 	}
 
-	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
+	if ((insn & INSN_MASK_LB) == INSN_MATCH_LB) {
+		len   = 1;
+		shift = 8 * (sizeof(ulong) - len);
+	} else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
+		len = 1;
+	} else if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
 		len   = 4;
 		shift = 8 * (sizeof(ulong) - len);
 #if __riscv_xlen == 64
@@ -124,26 +111,12 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
 #endif
 #endif
 	} else {
-		uptrap.epc = regs->mepc;
-		uptrap.cause = CAUSE_MISALIGNED_LOAD;
-		uptrap.tval = addr;
-		uptrap.tval2 = tval2;
-		uptrap.tinst = tinst;
-		uptrap.gva   = sbi_regs_gva(regs);
-		return sbi_trap_redirect(regs, &uptrap);
+		return sbi_trap_redirect(regs, orig_trap);
 	}
 
-	val.data_u64 = 0;
-	for (i = 0; i < len; i++) {
-		val.data_bytes[i] = sbi_load_u8((void *)(addr + i),
-						&uptrap);
-		if (uptrap.cause) {
-			uptrap.epc = regs->mepc;
-			uptrap.tinst = sbi_misaligned_tinst_fixup(
-				tinst, uptrap.tinst, i);
-			return sbi_trap_redirect(regs, &uptrap);
-		}
-	}
+	rc = emu(orig_trap->tval, len, &val, regs, orig_trap);
+	if (rc)
+		return rc;
 
 	if (!fp)
 		SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
@@ -159,23 +132,22 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
 	return 0;
 }
 
-int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
-				 struct sbi_trap_regs *regs)
+static int sbi_trap_emulate_store(struct sbi_trap_regs *regs,
+				  const struct sbi_trap_info *orig_trap,
+				  sbi_trap_st_emulator emu)
 {
 	ulong insn, insn_len;
 	union reg_data val;
 	struct sbi_trap_info uptrap;
-	int i, len = 0;
+	int rc, len = 0;
 
-	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_STORE);
-
-	if (tinst & 0x1) {
+	if (orig_trap->tinst & 0x1) {
 		/*
 		 * Bit[0] == 1 implies trapped instruction value is
 		 * transformed instruction or custom instruction.
 		 */
-		insn = tinst | INSN_16BIT_MASK;
-		insn_len = (tinst & 0x2) ? INSN_LEN(insn) : 2;
+		insn	 = orig_trap->tinst | INSN_16BIT_MASK;
+		insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
 	} else {
 		/*
 		 * Bit[0] == 0 implies trapped instruction value is
@@ -191,7 +163,9 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
 
 	val.data_ulong = GET_RS2(insn, regs);
 
-	if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
+	if ((insn & INSN_MASK_SB) == INSN_MATCH_SB) {
+		len = 1;
+	} else if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
 		len = 4;
 #if __riscv_xlen == 64
 	} else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
@@ -238,27 +212,117 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
 #endif
 #endif
 	} else {
-		uptrap.epc = regs->mepc;
-		uptrap.cause = CAUSE_MISALIGNED_STORE;
-		uptrap.tval = addr;
-		uptrap.tval2 = tval2;
-		uptrap.tinst = tinst;
-		uptrap.gva   = sbi_regs_gva(regs);
-		return sbi_trap_redirect(regs, &uptrap);
+		return sbi_trap_redirect(regs, orig_trap);
 	}
 
-	for (i = 0; i < len; i++) {
-		sbi_store_u8((void *)(addr + i), val.data_bytes[i],
-			     &uptrap);
-		if (uptrap.cause) {
-			uptrap.epc = regs->mepc;
-			uptrap.tinst = sbi_misaligned_tinst_fixup(
-				tinst, uptrap.tinst, i);
-			return sbi_trap_redirect(regs, &uptrap);
-		}
-	}
+	rc = emu(orig_trap->tval, len, val, regs, orig_trap);
+	if (rc)
+		return rc;
 
 	regs->mepc += insn_len;
 
 	return 0;
 }
+
+static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
+					ulong addr_offset)
+{
+	if (new_tinst == INSN_PSEUDO_VS_LOAD ||
+	    new_tinst == INSN_PSEUDO_VS_STORE)
+		return new_tinst;
+	else if (orig_tinst == 0)
+		return 0UL;
+	else
+		return orig_tinst | (addr_offset << SH_RS1);
+}
+
+static int sbi_misaligned_ld_emulator(ulong addr, int len,
+				      union reg_data *out_val,
+				      struct sbi_trap_regs *regs,
+				      const struct sbi_trap_info *orig_trap)
+{
+	struct sbi_trap_info uptrap;
+	int i;
+
+	for (i = 0; i < len; i++) {
+		out_val->data_bytes[i] =
+			sbi_load_u8((void *)(addr + i), &uptrap);
+		if (uptrap.cause) {
+			uptrap.epc   = regs->mepc;
+			uptrap.tinst = sbi_misaligned_tinst_fixup(
+				orig_trap->tinst, uptrap.tinst, i);
+			return sbi_trap_redirect(regs, &uptrap);
+		}
+	}
+	return 0;
+}
+
+static int sbi_misaligned_st_emulator(ulong addr, int len,
+				      union reg_data in_val,
+				      struct sbi_trap_regs *regs,
+				      const struct sbi_trap_info *orig_trap)
+{
+	struct sbi_trap_info uptrap;
+	int i;
+
+	for (i = 0; i < len; i++) {
+		sbi_store_u8((void *)(addr + i), in_val.data_bytes[i], &uptrap);
+		if (uptrap.cause) {
+			uptrap.epc   = regs->mepc;
+			uptrap.tinst = sbi_misaligned_tinst_fixup(
+				orig_trap->tinst, uptrap.tinst, i);
+			return sbi_trap_redirect(regs, &uptrap);
+		}
+	}
+	return 0;
+}
+
+int sbi_misaligned_load_handler(struct sbi_trap_regs *regs,
+				const struct sbi_trap_info *orig_trap)
+{
+	return sbi_trap_emulate_load(regs, orig_trap,
+				     sbi_misaligned_ld_emulator);
+}
+
+int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
+				 const struct sbi_trap_info *orig_trap)
+{
+	return sbi_trap_emulate_store(regs, orig_trap,
+				      sbi_misaligned_st_emulator);
+}
+
+int sbi_load_fault_handler(struct sbi_trap_regs *regs,
+			   const struct sbi_trap_info *orig_trap)
+{
+	const struct sbi_platform *plat;
+
+	/* If fault came from M mode, just fail */
+	if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) == PRV_M) {
+		return SBI_EINVAL;
+	}
+
+	plat = sbi_platform_ptr(sbi_scratch_thishart_ptr());
+	if (sbi_platform_ops(plat)->emulate_load) {
+		return sbi_trap_emulate_load(
+			regs, orig_trap, sbi_platform_ops(plat)->emulate_load);
+	}
+	return sbi_trap_redirect(regs, orig_trap);
+}
+
+int sbi_store_fault_handler(struct sbi_trap_regs *regs,
+			    const struct sbi_trap_info *orig_trap)
+{
+	const struct sbi_platform *plat;
+
+	/* If fault came from M mode, just fail */
+	if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) == PRV_M) {
+		return SBI_EINVAL;
+	}
+
+	plat = sbi_platform_ptr(sbi_scratch_thishart_ptr());
+	if (sbi_platform_ops(plat)->emulate_store) {
+		return sbi_trap_emulate_store(
+			regs, orig_trap, sbi_platform_ops(plat)->emulate_store);
+	}
+	return sbi_trap_redirect(regs, orig_trap);
+}
-- 
2.7.4


