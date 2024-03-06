From: Bo Gan <ganboing@gmail.com>
Date: Tue,  5 Mar 2024 18:35:37 -0800
Subject: [PATCH v4 4/7] lib: sbi: change prototype of sbi_misaligned_load/store_handler
In-Reply-To: <1709692540-77803-1-git-send-email-ganboing@gmail.com>
References: <1709692540-77803-1-git-send-email-ganboing@gmail.com>
Message-ID: <1709692540-77803-5-git-send-email-ganboing@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This simplifies both handlers such that when the handler needs to
redirect the original trap, it's readily available.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_trap_ldst.h |  9 ++++----
 lib/sbi/sbi_trap.c          | 21 ++++++++++---------
 lib/sbi/sbi_trap_ldst.c     | 50 +++++++++++++++++----------------------------
 3 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
index 9bbd237..5f0ed92 100644
--- a/include/sbi/sbi_trap_ldst.h
+++ b/include/sbi/sbi_trap_ldst.h
@@ -11,13 +11,14 @@
 #define __SBI_TRAP_LDST_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_trap.h>
 
 struct sbi_trap_regs;
 
-int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
-				struct sbi_trap_regs *regs);
+int sbi_misaligned_load_handler(struct sbi_trap_regs *regs,
+				const struct sbi_trap_info *orig_trap);
 
-int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
-				 struct sbi_trap_regs *regs);
+int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
+				 const struct sbi_trap_info *orig_trap);
 
 #endif
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 1024981..e379984 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
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
@@ -292,11 +299,11 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		msg = "illegal instruction handler failed";
 		break;
 	case CAUSE_MISALIGNED_LOAD:
-		rc = sbi_misaligned_load_handler(mtval, mtval2, mtinst, regs);
+		rc  = sbi_misaligned_load_handler(regs, &trap);
 		msg = "misaligned load handler failed";
 		break;
 	case CAUSE_MISALIGNED_STORE:
-		rc  = sbi_misaligned_store_handler(mtval, mtval2, mtinst, regs);
+		rc  = sbi_misaligned_store_handler(regs, &trap);
 		msg = "misaligned store handler failed";
 		break;
 	case CAUSE_SUPERVISOR_ECALL:
@@ -311,14 +318,8 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		/* fallthrough */
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
index be9a394..1fb0ed6 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -34,8 +34,8 @@ static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
 		return orig_tinst | (addr_offset << SH_RS1);
 }
 
-int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
-				struct sbi_trap_regs *regs)
+int sbi_misaligned_load_handler(struct sbi_trap_regs *regs,
+				const struct sbi_trap_info *orig_trap)
 {
 	ulong insn, insn_len;
 	union reg_data val;
@@ -44,13 +44,13 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_LOAD);
 
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
@@ -124,23 +124,17 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
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
 
 	val.data_u64 = 0;
 	for (i = 0; i < len; i++) {
-		val.data_bytes[i] = sbi_load_u8((void *)(addr + i),
-						&uptrap);
+		val.data_bytes[i] =
+			sbi_load_u8((void *)(orig_trap->tval + i), &uptrap);
 		if (uptrap.cause) {
-			uptrap.epc = regs->mepc;
+			uptrap.epc   = regs->mepc;
 			uptrap.tinst = sbi_misaligned_tinst_fixup(
-				tinst, uptrap.tinst, i);
+				orig_trap->tinst, uptrap.tinst, i);
 			return sbi_trap_redirect(regs, &uptrap);
 		}
 	}
@@ -159,8 +153,8 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
 	return 0;
 }
 
-int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
-				 struct sbi_trap_regs *regs)
+int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
+				 const struct sbi_trap_info *orig_trap)
 {
 	ulong insn, insn_len;
 	union reg_data val;
@@ -169,13 +163,13 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_STORE);
 
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
@@ -238,22 +232,16 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
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
 
 	for (i = 0; i < len; i++) {
-		sbi_store_u8((void *)(addr + i), val.data_bytes[i],
+		sbi_store_u8((void *)(orig_trap->tval + i), val.data_bytes[i],
 			     &uptrap);
 		if (uptrap.cause) {
-			uptrap.epc = regs->mepc;
+			uptrap.epc   = regs->mepc;
 			uptrap.tinst = sbi_misaligned_tinst_fixup(
-				tinst, uptrap.tinst, i);
+				orig_trap->tinst, uptrap.tinst, i);
 			return sbi_trap_redirect(regs, &uptrap);
 		}
 	}
-- 
2.7.4


