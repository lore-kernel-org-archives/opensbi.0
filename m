From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 18 Oct 2024 10:40:08 +0200
Subject: [PATCH v4 7/7] lib: sbi: add Smdbltrp ISA extension support
In-Reply-To: <20241018084010.406285-1-cleger@rivosinc.com>
References: <20241018084010.406285-1-cleger@rivosinc.com>
Message-ID: <20241018084010.406285-8-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for the Smdbltrp[1] ISA extension. First thing to do is
clearing MDT on entry after setting the first MTVEC (since MDT is
reset to 1). Additionally, during trap handling, clear MDT once all
critical CSRs have been saved and in return path, restore MSTATUS/H
before restoring MEPC to avoid taking another trap which would clobber
it.

Link: https://github.com/riscv/riscv-double-trap/releases/download/v0.56/riscv-double-trap.pdf [1]
Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 firmware/fw_base.S           | 37 +++++++++++++++++++++++++++++++-----
 include/sbi/riscv_encoding.h |  4 +++-
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 4a2652e..d027e5e 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -31,6 +31,16 @@
 	add	\__d4, \__s4, zero
 .endm
 
+.macro CLEAR_MDT tmp
+#if __riscv_xlen == 32
+	li 	\tmp, MSTATUSH_MDT
+	csrc	CSR_MSTATUSH, \tmp
+#else
+	li 	\tmp, MSTATUS_MDT
+	csrc	CSR_MSTATUS, \tmp
+#endif
+.endm
+
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _start
@@ -91,6 +101,14 @@ _bss_zero:
 	lla	s4, _start_hang
 	csrw	CSR_MTVEC, s4
 
+	/*
+	 * While at this point, trap handling is rudimentary, if a trap happens,
+	 * it will end up in _start_hang which is enough to hook up a GDB. Clear
+	 * MDT to avoid generating a double trap and thus entering a
+	 * critical-error state.
+	 */
+	CLEAR_MDT t0
+
 	/* Setup temporary stack */
 	lla	s4, _fw_end
 	li	s5, (SBI_SCRATCH_SIZE * 2)
@@ -348,6 +366,9 @@ _start_warm:
 _skip_trap_handler_hyp:
 	csrw	CSR_MTVEC, a4
 
+	/* Clear MDT here again for all harts */
+	CLEAR_MDT t0
+
 	/* Initialize SBI runtime */
 	csrr	a0, CSR_MSCRATCH
 	call	sbi_init
@@ -545,6 +566,9 @@ memcmp:
 	li	t0, 0
 .endif
 	REG_S	t0, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(gva))(sp)
+
+	/* We are ready to take another trap, clear MDT */
+	CLEAR_MDT t0
 .endm
 
 .macro	TRAP_CALL_C_ROUTINE
@@ -587,15 +611,18 @@ memcmp:
 .endm
 
 .macro	TRAP_RESTORE_MEPC_MSTATUS have_mstatush
-	/* Restore MEPC and MSTATUS CSRs */
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
-	csrw	CSR_MEPC, t0
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
-	csrw	CSR_MSTATUS, t0
+	/*
+	 * Restore MSTATUS and MEPC CSRs starting with MSTATUS/H to set MDT
+	 * flags since we can not take a trap now or MEPC would be cloberred
+	 */
 	.if \have_mstatush
 	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(a0)
 	csrw	CSR_MSTATUSH, t0
 	.endif
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
+	csrw	CSR_MSTATUS, t0
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
+	csrw	CSR_MEPC, t0
 .endm
 
 .macro TRAP_RESTORE_A0_T0
diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 174cc9c..38997ef 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -42,7 +42,8 @@
 #define MSTATUS_GVA			_ULL(0x0000004000000000)
 #define MSTATUS_GVA_SHIFT		38
 #define MSTATUS_MPV			_ULL(0x0000008000000000)
-#define MSTATUS_MPELP		_ULL(0x0000020000000000)
+#define MSTATUS_MPELP			_ULL(0x0000020000000000)
+#define MSTATUS_MDT			_ULL(0x0000040000000000)
 #else
 #define MSTATUSH_SBE			_UL(0x00000010)
 #define MSTATUSH_MBE			_UL(0x00000020)
@@ -50,6 +51,7 @@
 #define MSTATUSH_GVA_SHIFT		6
 #define MSTATUSH_MPV			_UL(0x00000080)
 #define MSTATUSH_MPELP			_UL(0x00000200)
+#define MSTATUSH_MDT			_UL(0x00000400)
 #endif
 #define MSTATUS32_SD			_UL(0x80000000)
 #define MSTATUS64_SD			_ULL(0x8000000000000000)
-- 
2.45.2


