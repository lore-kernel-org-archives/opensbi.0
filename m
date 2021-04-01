From: Anup Patel <anup.patel@wdc.com>
Date: Thu,  1 Apr 2021 16:49:45 +0530
Subject: [PATCH] firmware: Remove redundant add instruction from trap restore
 path
Message-ID: <20210401111945.318643-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "add sp, a0, zero" instruction in the trap restore path is redundant
and can be avoided if TRAP_RESTORE_xyz() assembly macros use a0 as the
base register instead of sp.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 firmware/fw_base.S | 88 ++++++++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 46 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index c897ed0..a5ce946 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -655,57 +655,57 @@ fw_platform_init:
 	call	sbi_trap_handler
 .endm
 
-.macro	TRAP_RESTORE_GENERAL_REGS_EXCEPT_SP_T0
-	/* Restore all general regisers except SP and T0 */
-	REG_L	ra, SBI_TRAP_REGS_OFFSET(ra)(sp)
-	REG_L	gp, SBI_TRAP_REGS_OFFSET(gp)(sp)
-	REG_L	tp, SBI_TRAP_REGS_OFFSET(tp)(sp)
-	REG_L	t1, SBI_TRAP_REGS_OFFSET(t1)(sp)
-	REG_L	t2, SBI_TRAP_REGS_OFFSET(t2)(sp)
-	REG_L	s0, SBI_TRAP_REGS_OFFSET(s0)(sp)
-	REG_L	s1, SBI_TRAP_REGS_OFFSET(s1)(sp)
-	REG_L	a0, SBI_TRAP_REGS_OFFSET(a0)(sp)
-	REG_L	a1, SBI_TRAP_REGS_OFFSET(a1)(sp)
-	REG_L	a2, SBI_TRAP_REGS_OFFSET(a2)(sp)
-	REG_L	a3, SBI_TRAP_REGS_OFFSET(a3)(sp)
-	REG_L	a4, SBI_TRAP_REGS_OFFSET(a4)(sp)
-	REG_L	a5, SBI_TRAP_REGS_OFFSET(a5)(sp)
-	REG_L	a6, SBI_TRAP_REGS_OFFSET(a6)(sp)
-	REG_L	a7, SBI_TRAP_REGS_OFFSET(a7)(sp)
-	REG_L	s2, SBI_TRAP_REGS_OFFSET(s2)(sp)
-	REG_L	s3, SBI_TRAP_REGS_OFFSET(s3)(sp)
-	REG_L	s4, SBI_TRAP_REGS_OFFSET(s4)(sp)
-	REG_L	s5, SBI_TRAP_REGS_OFFSET(s5)(sp)
-	REG_L	s6, SBI_TRAP_REGS_OFFSET(s6)(sp)
-	REG_L	s7, SBI_TRAP_REGS_OFFSET(s7)(sp)
-	REG_L	s8, SBI_TRAP_REGS_OFFSET(s8)(sp)
-	REG_L	s9, SBI_TRAP_REGS_OFFSET(s9)(sp)
-	REG_L	s10, SBI_TRAP_REGS_OFFSET(s10)(sp)
-	REG_L	s11, SBI_TRAP_REGS_OFFSET(s11)(sp)
-	REG_L	t3, SBI_TRAP_REGS_OFFSET(t3)(sp)
-	REG_L	t4, SBI_TRAP_REGS_OFFSET(t4)(sp)
-	REG_L	t5, SBI_TRAP_REGS_OFFSET(t5)(sp)
-	REG_L	t6, SBI_TRAP_REGS_OFFSET(t6)(sp)
+.macro	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
+	/* Restore all general regisers except A0 and T0 */
+	REG_L	ra, SBI_TRAP_REGS_OFFSET(ra)(a0)
+	REG_L	sp, SBI_TRAP_REGS_OFFSET(sp)(a0)
+	REG_L	gp, SBI_TRAP_REGS_OFFSET(gp)(a0)
+	REG_L	tp, SBI_TRAP_REGS_OFFSET(tp)(a0)
+	REG_L	t1, SBI_TRAP_REGS_OFFSET(t1)(a0)
+	REG_L	t2, SBI_TRAP_REGS_OFFSET(t2)(a0)
+	REG_L	s0, SBI_TRAP_REGS_OFFSET(s0)(a0)
+	REG_L	s1, SBI_TRAP_REGS_OFFSET(s1)(a0)
+	REG_L	a1, SBI_TRAP_REGS_OFFSET(a1)(a0)
+	REG_L	a2, SBI_TRAP_REGS_OFFSET(a2)(a0)
+	REG_L	a3, SBI_TRAP_REGS_OFFSET(a3)(a0)
+	REG_L	a4, SBI_TRAP_REGS_OFFSET(a4)(a0)
+	REG_L	a5, SBI_TRAP_REGS_OFFSET(a5)(a0)
+	REG_L	a6, SBI_TRAP_REGS_OFFSET(a6)(a0)
+	REG_L	a7, SBI_TRAP_REGS_OFFSET(a7)(a0)
+	REG_L	s2, SBI_TRAP_REGS_OFFSET(s2)(a0)
+	REG_L	s3, SBI_TRAP_REGS_OFFSET(s3)(a0)
+	REG_L	s4, SBI_TRAP_REGS_OFFSET(s4)(a0)
+	REG_L	s5, SBI_TRAP_REGS_OFFSET(s5)(a0)
+	REG_L	s6, SBI_TRAP_REGS_OFFSET(s6)(a0)
+	REG_L	s7, SBI_TRAP_REGS_OFFSET(s7)(a0)
+	REG_L	s8, SBI_TRAP_REGS_OFFSET(s8)(a0)
+	REG_L	s9, SBI_TRAP_REGS_OFFSET(s9)(a0)
+	REG_L	s10, SBI_TRAP_REGS_OFFSET(s10)(a0)
+	REG_L	s11, SBI_TRAP_REGS_OFFSET(s11)(a0)
+	REG_L	t3, SBI_TRAP_REGS_OFFSET(t3)(a0)
+	REG_L	t4, SBI_TRAP_REGS_OFFSET(t4)(a0)
+	REG_L	t5, SBI_TRAP_REGS_OFFSET(t5)(a0)
+	REG_L	t6, SBI_TRAP_REGS_OFFSET(t6)(a0)
 .endm
 
 .macro	TRAP_RESTORE_MEPC_MSTATUS have_mstatush
 	/* Restore MEPC and MSTATUS CSRs */
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(sp)
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
 	csrw	CSR_MEPC, t0
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(sp)
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
 	csrw	CSR_MSTATUS, t0
 	.if \have_mstatush
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(sp)
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(a0)
 	csrw	CSR_MSTATUSH, t0
 	.endif
 .endm
 
-.macro TRAP_RESTORE_SP_T0
+.macro TRAP_RESTORE_A0_T0
 	/* Restore T0 */
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(t0)(a0)
 
-	/* Restore SP */
-	REG_L	sp, SBI_TRAP_REGS_OFFSET(sp)(sp)
+	/* Restore A0 */
+	REG_L	a0, SBI_TRAP_REGS_OFFSET(a0)(a0)
 .endm
 
 	.section .entry, "ax", %progbits
@@ -722,13 +722,11 @@ _trap_handler:
 	TRAP_CALL_C_ROUTINE
 
 _trap_exit:
-	add	sp, a0, zero
-
-	TRAP_RESTORE_GENERAL_REGS_EXCEPT_SP_T0
+	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
 
 	TRAP_RESTORE_MEPC_MSTATUS 0
 
-	TRAP_RESTORE_SP_T0
+	TRAP_RESTORE_A0_T0
 
 	mret
 
@@ -747,13 +745,11 @@ _trap_handler_rv32_hyp:
 	TRAP_CALL_C_ROUTINE
 
 _trap_exit_rv32_hyp:
-	add	sp, a0, zero
-
-	TRAP_RESTORE_GENERAL_REGS_EXCEPT_SP_T0
+	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
 
 	TRAP_RESTORE_MEPC_MSTATUS 1
 
-	TRAP_RESTORE_SP_T0
+	TRAP_RESTORE_A0_T0
 
 	mret
 #endif
-- 
2.25.1


