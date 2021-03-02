From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue,  2 Mar 2021 23:25:51 +0800
Subject: [PATCH 2/3] firmware: fw_base: Use lla to access the global symbols
 defined in fw_base.S
In-Reply-To: <1614698752-16085-1-git-send-email-vincent.chen@sifive.com>
References: <1614698752-16085-1-git-send-email-vincent.chen@sifive.com>
Message-ID: <1614698752-16085-3-git-send-email-vincent.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In fw_base.S, no matter where the symbols are defined, it always uses "la"
to obtain the symbol address. In fact, if the access symbols are defined
in fw_base.S, we also can use "lla" to get their address instead of "la".
When fw_base.S is compiled as a PIC object, using "lla" can allow the
assembler to use the PC-relative method to get the symbol address instead
of GOT reference, thereby avoiding performance loss.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 firmware/fw_base.S | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 8f8e5dc..fe4af45 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -199,7 +199,7 @@ _relocate_done:
 	 * Mark relocate copy done
 	 * Use _boot_status copy relative to the load address
 	 */
-	la	t0, _boot_status
+	lla	t0, _boot_status
 #ifndef FW_PIC
 	la	t1, _link_start
 	REG_L	t1, 0(t1)
@@ -227,7 +227,7 @@ _bss_zero:
 	blt	s4, s5, _bss_zero
 
 	/* Setup temporary trap handler */
-	la	s4, _start_hang
+	lla	s4, _start_hang
 	csrw	CSR_MTVEC, s4
 
 	/* Setup temporary stack */
@@ -311,16 +311,16 @@ _scratch_init:
 	REG_S	a0, SBI_SCRATCH_NEXT_MODE_OFFSET(tp)
 	MOV_3R	a0, s0, a1, s1, a2, s2
 	/* Store warm_boot address in scratch space */
-	la	a4, _start_warm
+	lla	a4, _start_warm
 	REG_S	a4, SBI_SCRATCH_WARMBOOT_ADDR_OFFSET(tp)
 	/* Store platform address in scratch space */
 	la	a4, platform
 	REG_S	a4, SBI_SCRATCH_PLATFORM_ADDR_OFFSET(tp)
 	/* Store hartid-to-scratch function address in scratch space */
-	la	a4, _hartid_to_scratch
+	lla	a4, _hartid_to_scratch
 	REG_S	a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
 	/* Store trap-exit function address in scratch space */
-	la	a4, _trap_exit
+	lla	a4, _trap_exit
 	REG_S	a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(tp)
 	/* Clear tmp0 in scratch space */
 	REG_S	zero, SBI_SCRATCH_TMP0_OFFSET(tp)
@@ -401,7 +401,7 @@ _fdt_reloc_done:
 
 	/* mark boot hart done */
 	li	t0, BOOT_STATUS_BOOT_HART_DONE
-	la	t1, _boot_status
+	lla	t1, _boot_status
 	REG_S	t0, 0(t1)
 	fence	rw, rw
 	j	_start_warm
@@ -409,7 +409,7 @@ _fdt_reloc_done:
 	/* waiting for boot hart to be done (_boot_status == 2) */
 _wait_for_boot_hart:
 	li	t0, BOOT_STATUS_BOOT_HART_DONE
-	la	t1, _boot_status
+	lla	t1, _boot_status
 	REG_L	t1, 0(t1)
 	/* Reduce the bus traffic so that boot hart may proceed faster */
 	nop
@@ -473,13 +473,13 @@ _start_warm:
 	add	sp, tp, zero
 
 	/* Setup trap handler */
-	la	a4, _trap_handler
+	lla	a4, _trap_handler
 #if __riscv_xlen == 32
 	csrr	a5, CSR_MISA
 	srli	a5, a5, ('H' - 'A')
 	andi	a5, a5, 0x1
 	beq	a5, zero, _skip_trap_handler_rv32_hyp
-	la	a4, _trap_handler_rv32_hyp
+	lla	a4, _trap_handler_rv32_hyp
 _skip_trap_handler_rv32_hyp:
 #endif
 	csrw	CSR_MTVEC, a4
@@ -490,7 +490,7 @@ _skip_trap_handler_rv32_hyp:
 	srli	a5, a5, ('H' - 'A')
 	andi	a5, a5, 0x1
 	beq	a5, zero, _skip_trap_exit_rv32_hyp
-	la	a4, _trap_exit_rv32_hyp
+	lla	a4, _trap_exit_rv32_hyp
 	csrr	a5, CSR_MSCRATCH
 	REG_S	a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(a5)
 _skip_trap_exit_rv32_hyp:
-- 
2.7.4


