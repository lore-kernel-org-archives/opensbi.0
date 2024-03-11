From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Mar 2024 21:39:39 +0530
Subject: [PATCH 4/9] lib: sbi: Simplify parameters of misaligned and access fault handlers
In-Reply-To: <20240311160944.1233523-1-apatel@ventanamicro.com>
References: <20240311160944.1233523-1-apatel@ventanamicro.com>
Message-ID: <20240311160944.1233523-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The struct sbi_trap_context already has the information needed by
misaligned load/store and access fault load/store handlers so directly
pass struct sbi_trap_context pointer to these functions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_trap_ldst.h | 12 +++----
 lib/sbi/sbi_trap.c          |  8 ++---
 lib/sbi/sbi_trap_ldst.c     | 67 ++++++++++++++++++-------------------
 3 files changed, 40 insertions(+), 47 deletions(-)

diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
index 9cab4e4..8aee316 100644
--- a/include/sbi/sbi_trap_ldst.h
+++ b/include/sbi/sbi_trap_ldst.h
@@ -20,16 +20,12 @@ union sbi_ldst_data {
 	ulong data_ulong;
 };
 
-int sbi_misaligned_load_handler(struct sbi_trap_regs *regs,
-				const struct sbi_trap_info *orig_trap);
+int sbi_misaligned_load_handler(struct sbi_trap_context *tcntx);
 
-int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
-				 const struct sbi_trap_info *orig_trap);
+int sbi_misaligned_store_handler(struct sbi_trap_context *tcntx);
 
-int sbi_load_access_handler(struct sbi_trap_regs *regs,
-			    const struct sbi_trap_info *orig_trap);
+int sbi_load_access_handler(struct sbi_trap_context *tcntx);
 
-int sbi_store_access_handler(struct sbi_trap_regs *regs,
-			     const struct sbi_trap_info *orig_trap);
+int sbi_store_access_handler(struct sbi_trap_context *tcntx);
 
 #endif
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index dba267c..359749f 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -308,12 +308,12 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		break;
 	case CAUSE_MISALIGNED_LOAD:
 		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_LOAD);
-		rc  = sbi_misaligned_load_handler(regs, &trap);
+		rc  = sbi_misaligned_load_handler(&tcntx);
 		msg = "misaligned load handler failed";
 		break;
 	case CAUSE_MISALIGNED_STORE:
 		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_STORE);
-		rc  = sbi_misaligned_store_handler(regs, &trap);
+		rc  = sbi_misaligned_store_handler(&tcntx);
 		msg = "misaligned store handler failed";
 		break;
 	case CAUSE_SUPERVISOR_ECALL:
@@ -323,12 +323,12 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		break;
 	case CAUSE_LOAD_ACCESS:
 		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_LOAD);
-		rc  = sbi_load_access_handler(regs, &trap);
+		rc  = sbi_load_access_handler(&tcntx);
 		msg = "load fault handler failed";
 		break;
 	case CAUSE_STORE_ACCESS:
 		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_STORE);
-		rc  = sbi_store_access_handler(regs, &trap);
+		rc  = sbi_store_access_handler(&tcntx);
 		msg = "store fault handler failed";
 		break;
 	default:
diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
index d864ad1..2694e88 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -12,7 +12,6 @@
 #include <sbi/riscv_fp.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_trap_ldst.h>
-#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
 #include <sbi/sbi_platform.h>
@@ -23,8 +22,7 @@
  * @return rlen=success, 0=success w/o regs modification, or negative error
  */
 typedef int (*sbi_trap_ld_emulator)(int rlen, union sbi_ldst_data *out_val,
-				    struct sbi_trap_regs *regs,
-				    const struct sbi_trap_info *orig_trap);
+				    struct sbi_trap_context *tcntx);
 
 /**
  * Store emulator callback:
@@ -32,8 +30,7 @@ typedef int (*sbi_trap_ld_emulator)(int rlen, union sbi_ldst_data *out_val,
  * @return wlen=success, 0=success w/o regs modification, or negative error
  */
 typedef int (*sbi_trap_st_emulator)(int wlen, union sbi_ldst_data in_val,
-				    struct sbi_trap_regs *regs,
-				    const struct sbi_trap_info *orig_trap);
+				    struct sbi_trap_context *tcntx);
 
 static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
 					ulong addr_offset)
@@ -47,10 +44,11 @@ static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
 		return orig_tinst | (addr_offset << SH_RS1);
 }
 
-static int sbi_trap_emulate_load(struct sbi_trap_regs *regs,
-				 const struct sbi_trap_info *orig_trap,
+static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
 				 sbi_trap_ld_emulator emu)
 {
+	const struct sbi_trap_info *orig_trap = tcntx->trap;
+	struct sbi_trap_regs *regs = tcntx->regs;
 	ulong insn, insn_len;
 	union sbi_ldst_data val = { 0 };
 	struct sbi_trap_info uptrap;
@@ -151,8 +149,7 @@ static int sbi_trap_emulate_load(struct sbi_trap_regs *regs,
 		return sbi_trap_redirect(regs, orig_trap);
 	}
 
-	rc = emu(len, &val, regs, orig_trap);
-
+	rc = emu(len, &val, tcntx);
 	if (rc <= 0)
 		return rc;
 
@@ -170,10 +167,11 @@ static int sbi_trap_emulate_load(struct sbi_trap_regs *regs,
 	return 0;
 }
 
-static int sbi_trap_emulate_store(struct sbi_trap_regs *regs,
-				  const struct sbi_trap_info *orig_trap,
+static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 				  sbi_trap_st_emulator emu)
 {
+	const struct sbi_trap_info *orig_trap = tcntx->trap;
+	struct sbi_trap_regs *regs = tcntx->regs;
 	ulong insn, insn_len;
 	union sbi_ldst_data val;
 	struct sbi_trap_info uptrap;
@@ -256,8 +254,7 @@ static int sbi_trap_emulate_store(struct sbi_trap_regs *regs,
 		return sbi_trap_redirect(regs, orig_trap);
 	}
 
-	rc = emu(len, val, regs, orig_trap);
-
+	rc = emu(len, val, tcntx);
 	if (rc <= 0)
 		return rc;
 
@@ -267,9 +264,10 @@ static int sbi_trap_emulate_store(struct sbi_trap_regs *regs,
 }
 
 static int sbi_misaligned_ld_emulator(int rlen, union sbi_ldst_data *out_val,
-				      struct sbi_trap_regs *regs,
-				      const struct sbi_trap_info *orig_trap)
+				      struct sbi_trap_context *tcntx)
 {
+	const struct sbi_trap_info *orig_trap = tcntx->trap;
+	struct sbi_trap_regs *regs = tcntx->regs;
 	struct sbi_trap_info uptrap;
 	int i;
 
@@ -286,17 +284,16 @@ static int sbi_misaligned_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 	return rlen;
 }
 
-int sbi_misaligned_load_handler(struct sbi_trap_regs *regs,
-				const struct sbi_trap_info *orig_trap)
+int sbi_misaligned_load_handler(struct sbi_trap_context *tcntx)
 {
-	return sbi_trap_emulate_load(regs, orig_trap,
-				     sbi_misaligned_ld_emulator);
+	return sbi_trap_emulate_load(tcntx, sbi_misaligned_ld_emulator);
 }
 
 static int sbi_misaligned_st_emulator(int wlen, union sbi_ldst_data in_val,
-				      struct sbi_trap_regs *regs,
-				      const struct sbi_trap_info *orig_trap)
+				      struct sbi_trap_context *tcntx)
 {
+	const struct sbi_trap_info *orig_trap = tcntx->trap;
+	struct sbi_trap_regs *regs = tcntx->regs;
 	struct sbi_trap_info uptrap;
 	int i;
 
@@ -313,17 +310,17 @@ static int sbi_misaligned_st_emulator(int wlen, union sbi_ldst_data in_val,
 	return wlen;
 }
 
-int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
-				 const struct sbi_trap_info *orig_trap)
+int sbi_misaligned_store_handler(struct sbi_trap_context *tcntx)
 {
-	return sbi_trap_emulate_store(regs, orig_trap,
-				      sbi_misaligned_st_emulator);
+	return sbi_trap_emulate_store(tcntx, sbi_misaligned_st_emulator);
 }
 
 static int sbi_ld_access_emulator(int rlen, union sbi_ldst_data *out_val,
-				  struct sbi_trap_regs *regs,
-				  const struct sbi_trap_info *orig_trap)
+				  struct sbi_trap_context *tcntx)
 {
+	const struct sbi_trap_info *orig_trap = tcntx->trap;
+	struct sbi_trap_regs *regs = tcntx->regs;
+
 	/* If fault came from M mode, just fail */
 	if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) == PRV_M)
 		return SBI_EINVAL;
@@ -336,16 +333,17 @@ static int sbi_ld_access_emulator(int rlen, union sbi_ldst_data *out_val,
 	return rlen;
 }
 
-int sbi_load_access_handler(struct sbi_trap_regs *regs,
-			    const struct sbi_trap_info *orig_trap)
+int sbi_load_access_handler(struct sbi_trap_context *tcntx)
 {
-	return sbi_trap_emulate_load(regs, orig_trap, sbi_ld_access_emulator);
+	return sbi_trap_emulate_load(tcntx, sbi_ld_access_emulator);
 }
 
 static int sbi_st_access_emulator(int wlen, union sbi_ldst_data in_val,
-				  struct sbi_trap_regs *regs,
-				  const struct sbi_trap_info *orig_trap)
+				  struct sbi_trap_context *tcntx)
 {
+	const struct sbi_trap_info *orig_trap = tcntx->trap;
+	struct sbi_trap_regs *regs = tcntx->regs;
+
 	/* If fault came from M mode, just fail */
 	if (((regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT) == PRV_M)
 		return SBI_EINVAL;
@@ -358,8 +356,7 @@ static int sbi_st_access_emulator(int wlen, union sbi_ldst_data in_val,
 	return wlen;
 }
 
-int sbi_store_access_handler(struct sbi_trap_regs *regs,
-			     const struct sbi_trap_info *orig_trap)
+int sbi_store_access_handler(struct sbi_trap_context *tcntx)
 {
-	return sbi_trap_emulate_store(regs, orig_trap, sbi_st_access_emulator);
+	return sbi_trap_emulate_store(tcntx, sbi_st_access_emulator);
 }
-- 
2.34.1


