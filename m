From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 18 Apr 2024 15:54:20 +0200
Subject: [RFC PATCH 4/4] lib: sbi: add support for the Smdbltrp extension
In-Reply-To: <20240418135421.1452709-1-cleger@rivosinc.com>
References: <20240418135421.1452709-1-cleger@rivosinc.com>
Message-ID: <20240418135421.1452709-5-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for the Smdbltrp[1]. Fuirst thing to do is clearing MDT on
entry after setting the first MTVEC (since MDT is reste to 1).
Additionnaly, during trap handling, clear MDT once all critical CSRs
have been saved and in return path, restore MSTATUS before restoring
MEPC to avoid taking another trap which would clobber it.

Link: https://github.com/riscv/riscv-double-trap/releases/download/v0.56/riscv-double-trap.pdf [1]
Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 firmware/fw_base.S           | 29 ++++++++++++++++++++++++++---
 include/sbi/riscv_encoding.h |  2 ++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 9f995a2..cd71ef4 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -31,6 +31,16 @@
 	add	\__d4, \__s4, zero
 .endm
 
+.macro CLEAR_MDT tmp, have_mstatush
+	.if \have_mstatush
+	li 	\tmp, MSTATUSH_MDT
+	csrc	CSR_MSTATUSH, \tmp
+	.else
+	li 	\tmp, MSTATUS_MDT
+	csrc	CSR_MSTATUS, \tmp
+	.endif
+.endm
+
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _start
@@ -89,6 +99,13 @@ _bss_zero:
 	lla	s4, _start_hang
 	csrw	CSR_MTVEC, s4
 
+	/* We are now ready to take a trap, clear MDT */
+#if __riscv_xlen > 32
+	CLEAR_MDT t0, 0
+#else
+	CLEAR_MDT t0, 1
+#endif
+
 	/* Setup temporary stack */
 	lla	s4, _fw_end
 	li	s5, (SBI_SCRATCH_SIZE * 2)
@@ -555,6 +572,9 @@ memcmp:
 	li	t0, 0
 .endif
 	REG_S	t0, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(gva))(sp)
+
+	/* We are ready to take another trap, clear MDT */
+	CLEAR_MDT t0, \have_mstatush
 .endm
 
 .macro	TRAP_CALL_C_ROUTINE
@@ -597,15 +617,18 @@ memcmp:
 .endm
 
 .macro	TRAP_RESTORE_MEPC_MSTATUS have_mstatush
-	/* Restore MEPC and MSTATUS CSRs */
-	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
-	csrw	CSR_MEPC, t0
+	/*
+	 * Restore MSTATUS and MEPC CSRs starting with MSTATUS to set MDT
+	 * flags since we can not take a trap now or MEPC would be cloberred
+	 */
 	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(a0)
 	csrw	CSR_MSTATUS, t0
 	.if \have_mstatush
 	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatusH)(a0)
 	csrw	CSR_MSTATUSH, t0
 	.endif
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(a0)
+	csrw	CSR_MEPC, t0
 .endm
 
 .macro TRAP_RESTORE_A0_T0
diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 8628e5a..eed28f2 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -42,12 +42,14 @@
 #define MSTATUS_GVA			_ULL(0x0000004000000000)
 #define MSTATUS_GVA_SHIFT		38
 #define MSTATUS_MPV			_ULL(0x0000008000000000)
+#define MSTATUS_MDT			_ULL(0x0000200000000000)
 #else
 #define MSTATUSH_SBE			_UL(0x00000010)
 #define MSTATUSH_MBE			_UL(0x00000020)
 #define MSTATUSH_GVA			_UL(0x00000040)
 #define MSTATUSH_GVA_SHIFT		6
 #define MSTATUSH_MPV			_UL(0x00000080)
+#define MSTATUSH_MDT			_UL(0x00002000)
 #endif
 #define MSTATUS32_SD			_UL(0x80000000)
 #define MSTATUS64_SD			_ULL(0x8000000000000000)
-- 
2.43.0


