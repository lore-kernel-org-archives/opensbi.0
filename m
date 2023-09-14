From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 14 Sep 2023 10:40:53 +0800
Subject: [RFC PATCH v2 1/2] include: Move trap handle helper functions to sbi_trap.h
In-Reply-To: <IA1PR20MB4953B82756730D98866F9E90BBF7A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B82756730D98866F9E90BBF7A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB495393F6A60E377A6D381828BBF7A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The trap handle helper macros can help platform make a compatible trap
handler, this is helpful if a platform need a custom trap handler. So
move these helper macro into sbi_trap.h to allow platforms to use them.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 firmware/fw_base.S     | 149 ---------------------------------------
 include/sbi/sbi_trap.h | 155 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 149 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index ca34b4c..da5ee73 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -606,155 +606,6 @@ memmove:
 memcmp:
 	tail	sbi_memcmp
 
-.macro	TRAP_SAVE_AND_SETUP_SP_T0
-	/* Swap TP and MSCRATCH */
-	csrrw	tp, CSR_MSCRATCH, tp
-
-	/* Save T0 in scratch space */
-	REG_S	t0, SBI_SCRATCH_TMP0_OFFSET(tp)
-
-	/*
-	 * Set T0 to appropriate exception stack
-	 *
-	 * Came_From_M_Mode = ((MSTATUS.MPP < PRV_M) ? 1 : 0) - 1;
-	 * Exception_Stack = TP ^ (Came_From_M_Mode & (SP ^ TP))
-	 *
-	 * Came_From_M_Mode = 0    ==>    Exception_Stack = TP
-	 * Came_From_M_Mode = -1   ==>    Exception_Stack = SP
-	 */
-	csrr	t0, CSR_MSTATUS
-	srl	t0, t0, MSTATUS_MPP_SHIFT
-	and	t0, t0, PRV_M
-	slti	t0, t0, PRV_M
-	add	t0, t0, -1
-	xor	sp, sp, tp
-	and	t0, t0, sp
-	xor	sp, sp, tp
-	xor	t0, tp, t0
-
-	/* Save original SP on exception stack */
-	REG_S	sp, (SBI_TRAP_REGS_OFFSET(sp) - SBI_TRAP_REGS_SIZE)(t0)
-
-	/* Set SP to exception stack and make room for trap registers */
-	add	sp, t0, -(SBI_TRAP_REGS_SIZE)
-
-	/* Restore T0 from scratch space */
-	REG_L	t0, SBI_SCRATCH_TMP0_OFFSET(tp)
-
-	/* Save T0 on stack */
-	REG_S	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
-
-	/* Swap TP and MSCRATCH */
-	csrrw	tp, CSR_MSCRATCH, tp
-.endm
-
-.macro	TRAP_SAVE_MEPC_MSTATUS have_mstatush
-	/* Save MEPC and MSTATUS CSRs */
-	csrr	t0, CSR_MEPC
-	REG_S	t0, SBI_TRAP_REGS_OFFSET(mepc)(sp)
-	csrr	t0, CSR_MSTATUS
-	REG_S	t0, SBI_TRAP_REGS_OFFSET(mstatus)(sp)
-	.if \have_mstatush
-	csrr	t0, CSR_MSTATUSH
-	REG_S	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(sp)
-	.else
-	REG_S	zero, SBI_TRAP_REGS_OFFSET(mstatusH)(sp)
-	.endif
-.endm
-
-.macro	TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0
-	/* Save all general regisers except SP and T0 */
-	REG_S	zero, SBI_TRAP_REGS_OFFSET(zero)(sp)
-	REG_S	ra, SBI_TRAP_REGS_OFFSET(ra)(sp)
-	REG_S	gp, SBI_TRAP_REGS_OFFSET(gp)(sp)
-	REG_S	tp, SBI_TRAP_REGS_OFFSET(tp)(sp)
-	REG_S	t1, SBI_TRAP_REGS_OFFSET(t1)(sp)
-	REG_S	t2, SBI_TRAP_REGS_OFFSET(t2)(sp)
-	REG_S	s0, SBI_TRAP_REGS_OFFSET(s0)(sp)
-	REG_S	s1, SBI_TRAP_REGS_OFFSET(s1)(sp)
-	REG_S	a0, SBI_TRAP_REGS_OFFSET(a0)(sp)
-	REG_S	a1, SBI_TRAP_REGS_OFFSET(a1)(sp)
-	REG_S	a2, SBI_TRAP_REGS_OFFSET(a2)(sp)
-	REG_S	a3, SBI_TRAP_REGS_OFFSET(a3)(sp)
-	REG_S	a4, SBI_TRAP_REGS_OFFSET(a4)(sp)
-	REG_S	a5, SBI_TRAP_REGS_OFFSET(a5)(sp)
-	REG_S	a6, SBI_TRAP_REGS_OFFSET(a6)(sp)
-	REG_S	a7, SBI_TRAP_REGS_OFFSET(a7)(sp)
-	REG_S	s2, SBI_TRAP_REGS_OFFSET(s2)(sp)
-	REG_S	s3, SBI_TRAP_REGS_OFFSET(s3)(sp)
-	REG_S	s4, SBI_TRAP_REGS_OFFSET(s4)(sp)
-	REG_S	s5, SBI_TRAP_REGS_OFFSET(s5)(sp)
-	REG_S	s6, SBI_TRAP_REGS_OFFSET(s6)(sp)
-	REG_S	s7, SBI_TRAP_REGS_OFFSET(s7)(sp)
-	REG_S	s8, SBI_TRAP_REGS_OFFSET(s8)(sp)
-	REG_S	s9, SBI_TRAP_REGS_OFFSET(s9)(sp)
-	REG_S	s10, SBI_TRAP_REGS_OFFSET(s10)(sp)
-	REG_S	s11, SBI_TRAP_REGS_OFFSET(s11)(sp)
-	REG_S	t3, SBI_TRAP_REGS_OFFSET(t3)(sp)
-	REG_S	t4, SBI_TRAP_REGS_OFFSET(t4)(sp)
-	REG_S	t5, SBI_TRAP_REGS_OFFSET(t5)(sp)
-	REG_S	t6, SBI_TRAP_REGS_OFFSET(t6)(sp)
-.endm
-
-.macro	TRAP_CALL_C_ROUTINE
-	/* Call C routine */
-	add	a0, sp, zero
-	call	sbi_trap_handler
-.endm
-
-.macro	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
-	/* Restore all general regisers except A0 and T0 */
-	REG_L	ra, SBI_TRAP_REGS_OFFSET(ra)(a0)
-	REG_L	sp, SBI_TRAP_REGS_OFFSET(sp)(a0)
-	REG_L	gp, SBI_TRAP_REGS_OFFSET(gp)(a0)
-	REG_L	tp, SBI_TRAP_REGS_OFFSET(tp)(a0)
-	REG_L	t1, SBI_TRAP_REGS_OFFSET(t1)(a0)
-	REG_L	t2, SBI_TRAP_REGS_OFFSET(t2)(a0)
-	REG_L	s0, SBI_TRAP_REGS_OFFSET(s0)(a0)
-	REG_L	s1, SBI_TRAP_REGS_OFFSET(s1)(a0)
-	REG_L	a1, SBI_TRAP_REGS_OFFSET(a1)(a0)
-	REG_L	a2, SBI_TRAP_REGS_OFFSET(a2)(a0)
-	REG_L	a3, SBI_TRAP_REGS_OFFSET(a3)(a0)
-	REG_L	a4, SBI_TRAP_REGS_OFFSET(a4)(a0)
-	REG_L	a5, SBI_TRAP_REGS_OFFSET(a5)(a0)
-	REG_L	a6, SBI_TRAP_REGS_OFFSET(a6)(a0)
-	REG_L	a7, SBI_TRAP_REGS_OFFSET(a7)(a0)
-	REG_L	s2, SBI_TRAP_REGS_OFFSET(s2)(a0)
-	REG_L	s3, SBI_TRAP_REGS_OFFSET(s3)(a0)
-	REG_L	s4, SBI_TRAP_REGS_OFFSET(s4)(a0)
-	REG_L	s5, SBI_TRAP_REGS_OFFSET(s5)(a0)
-	REG_L	s6, SBI_TRAP_REGS_OFFSET(s6)(a0)
-	REG_L	s7, SBI_TRAP_REGS_OFFSET(s7)(a0)
-	REG_L	s8, SBI_TRAP_REGS_OFFSET(s8)(a0)
-	REG_L	s9, SBI_TRAP_REGS_OFFSET(s9)(a0)
-	REG_L	s10, SBI_TRAP_REGS_OFFSET(s10)(a0)
-	REG_L	s11, SBI_TRAP_REGS_OFFSET(s11)(a0)
-	REG_L	t3, SBI_TRAP_REGS_OFFSET(t3)(a0)
-	REG_L	t4, SBI_TRAP_REGS_OFFSET(t4)(a0)
-	REG_L	t5, SBI_TRAP_REGS_OFFSET(t5)(a0)
-	REG_L	t6, SBI_TRAP_REGS_OFFSET(t6)(a0)
-.endm
-
-.macro	TRAP_RESTORE_MEPC_MSTATUS have_mstatush
-	/* Restore MEPC and MSTATUS CSRs */
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
-	csrw	CSR_MEPC, t0
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
-	csrw	CSR_MSTATUS, t0
-	.if \have_mstatush
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(a0)
-	csrw	CSR_MSTATUSH, t0
-	.endif
-.endm
-
-.macro TRAP_RESTORE_A0_T0
-	/* Restore T0 */
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(t0)(a0)
-
-	/* Restore A0 */
-	REG_L	a0, SBI_TRAP_REGS_OFFSET(a0)(a0)
-.endm
-
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _trap_handler
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index a562b95..b369398 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -231,6 +231,161 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs);
 
 void __noreturn sbi_trap_exit(const struct sbi_trap_regs *regs);
 
+#else
+
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_scratch.h>
+
+/* Helper functions for trap handler */
+.macro	TRAP_SAVE_AND_SETUP_SP_T0
+	/* Swap TP and MSCRATCH */
+	csrrw	tp, CSR_MSCRATCH, tp
+
+	/* Save T0 in scratch space */
+	REG_S	t0, SBI_SCRATCH_TMP0_OFFSET(tp)
+
+	/*
+	 * Set T0 to appropriate exception stack
+	 *
+	 * Came_From_M_Mode = ((MSTATUS.MPP < PRV_M) ? 1 : 0) - 1;
+	 * Exception_Stack = TP ^ (Came_From_M_Mode & (SP ^ TP))
+	 *
+	 * Came_From_M_Mode = 0    ==>    Exception_Stack = TP
+	 * Came_From_M_Mode = -1   ==>    Exception_Stack = SP
+	 */
+	csrr	t0, CSR_MSTATUS
+	srl	t0, t0, MSTATUS_MPP_SHIFT
+	and	t0, t0, PRV_M
+	slti	t0, t0, PRV_M
+	add	t0, t0, -1
+	xor	sp, sp, tp
+	and	t0, t0, sp
+	xor	sp, sp, tp
+	xor	t0, tp, t0
+
+	/* Save original SP on exception stack */
+	REG_S	sp, (SBI_TRAP_REGS_OFFSET(sp) - SBI_TRAP_REGS_SIZE)(t0)
+
+	/* Set SP to exception stack and make room for trap registers */
+	add	sp, t0, -(SBI_TRAP_REGS_SIZE)
+
+	/* Restore T0 from scratch space */
+	REG_L	t0, SBI_SCRATCH_TMP0_OFFSET(tp)
+
+	/* Save T0 on stack */
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+
+	/* Swap TP and MSCRATCH */
+	csrrw	tp, CSR_MSCRATCH, tp
+.endm
+
+.macro	TRAP_SAVE_MEPC_MSTATUS have_mstatush
+	/* Save MEPC and MSTATUS CSRs */
+	csrr	t0, CSR_MEPC
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mepc)(sp)
+	csrr	t0, CSR_MSTATUS
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mstatus)(sp)
+	.if \have_mstatush
+	csrr	t0, CSR_MSTATUSH
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(sp)
+	.else
+	REG_S	zero, SBI_TRAP_REGS_OFFSET(mstatusH)(sp)
+	.endif
+.endm
+
+.macro	TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0
+	/* Save all general regisers except SP and T0 */
+	REG_S	zero, SBI_TRAP_REGS_OFFSET(zero)(sp)
+	REG_S	ra, SBI_TRAP_REGS_OFFSET(ra)(sp)
+	REG_S	gp, SBI_TRAP_REGS_OFFSET(gp)(sp)
+	REG_S	tp, SBI_TRAP_REGS_OFFSET(tp)(sp)
+	REG_S	t1, SBI_TRAP_REGS_OFFSET(t1)(sp)
+	REG_S	t2, SBI_TRAP_REGS_OFFSET(t2)(sp)
+	REG_S	s0, SBI_TRAP_REGS_OFFSET(s0)(sp)
+	REG_S	s1, SBI_TRAP_REGS_OFFSET(s1)(sp)
+	REG_S	a0, SBI_TRAP_REGS_OFFSET(a0)(sp)
+	REG_S	a1, SBI_TRAP_REGS_OFFSET(a1)(sp)
+	REG_S	a2, SBI_TRAP_REGS_OFFSET(a2)(sp)
+	REG_S	a3, SBI_TRAP_REGS_OFFSET(a3)(sp)
+	REG_S	a4, SBI_TRAP_REGS_OFFSET(a4)(sp)
+	REG_S	a5, SBI_TRAP_REGS_OFFSET(a5)(sp)
+	REG_S	a6, SBI_TRAP_REGS_OFFSET(a6)(sp)
+	REG_S	a7, SBI_TRAP_REGS_OFFSET(a7)(sp)
+	REG_S	s2, SBI_TRAP_REGS_OFFSET(s2)(sp)
+	REG_S	s3, SBI_TRAP_REGS_OFFSET(s3)(sp)
+	REG_S	s4, SBI_TRAP_REGS_OFFSET(s4)(sp)
+	REG_S	s5, SBI_TRAP_REGS_OFFSET(s5)(sp)
+	REG_S	s6, SBI_TRAP_REGS_OFFSET(s6)(sp)
+	REG_S	s7, SBI_TRAP_REGS_OFFSET(s7)(sp)
+	REG_S	s8, SBI_TRAP_REGS_OFFSET(s8)(sp)
+	REG_S	s9, SBI_TRAP_REGS_OFFSET(s9)(sp)
+	REG_S	s10, SBI_TRAP_REGS_OFFSET(s10)(sp)
+	REG_S	s11, SBI_TRAP_REGS_OFFSET(s11)(sp)
+	REG_S	t3, SBI_TRAP_REGS_OFFSET(t3)(sp)
+	REG_S	t4, SBI_TRAP_REGS_OFFSET(t4)(sp)
+	REG_S	t5, SBI_TRAP_REGS_OFFSET(t5)(sp)
+	REG_S	t6, SBI_TRAP_REGS_OFFSET(t6)(sp)
+.endm
+
+.macro	TRAP_CALL_C_ROUTINE
+	/* Call C routine */
+	add	a0, sp, zero
+	call	sbi_trap_handler
+.endm
+
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
+.endm
+
+.macro	TRAP_RESTORE_MEPC_MSTATUS have_mstatush
+	/* Restore MEPC and MSTATUS CSRs */
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
+	csrw	CSR_MEPC, t0
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
+	csrw	CSR_MSTATUS, t0
+	.if \have_mstatush
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(a0)
+	csrw	CSR_MSTATUSH, t0
+	.endif
+.endm
+
+.macro TRAP_RESTORE_A0_T0
+	/* Restore T0 */
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(t0)(a0)
+
+	/* Restore A0 */
+	REG_L	a0, SBI_TRAP_REGS_OFFSET(a0)(a0)
+.endm
+
 #endif
 
 #endif
-- 
2.42.0


