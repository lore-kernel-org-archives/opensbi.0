From: Xiang W <wxjstz@126.com>
Date: Wed, 17 Jan 2024 18:42:07 +0800
Subject: [PATCH v3 10/10] firmware: fw_base.S: Fix arguments passing
In-Reply-To: <20240117104212.1055737-1-wxjstz@126.com>
References: <20240117104212.1055737-1-wxjstz@126.com>
Message-ID: <20240117104212.1055737-11-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous code backed up and restored arguments many times. Now
back up the arguments to s0-s4 at the entry. Calling functions that
conform to the riscv calling convention will not destroy the callee
save register. As long as s0-s4 is not used in assembly, the
arguments can be guaranteed not to be destroyed.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 51 +++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index aec683b..8117e08 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -47,27 +47,27 @@
 	.globl _start
 	.globl _start_warm
 _start:
+	/* save previous arguments */
+	MOV_5R	s0, a0, s1, a1, s2, a2, s3, a3, s4, a4
+
 	/* Find preferred boot HART id */
-	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_boot_hart
-	add	a6, a0, zero
-	MOV_3R	a0, s0, a1, s1, a2, s2
 
 	lla	t2, _fw_start /* load start */
 	lla	t0, _link_start
 	REG_L	t0, 0(t0)     /* link start */
 	sub	t6, t2, t0    /* runtime offset */
 
-	li	a7, -1
-	beq	a6, a7, _try_lottery
+	li	t1, -1
+	beq	a0, t1, _try_lottery
 	/* Jump to relocation wait loop if we are not boot hart */
-	bne	a0, a6, _wait_relocate_copy_done
+	bne	s0, a0, _wait_relocate_copy_done
 _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
-	lla	a6, _boot_status
-	li	a7, 1
-	amoswap.w a6, a7, (a6)
-	bnez	a6, _wait_relocate_copy_done
+	lla	a0, _boot_status
+	li	t1, 1
+	amoswap.w a0, t1, (a0)
+	bnez	a0, _wait_relocate_copy_done
 
 #ifdef FW_PIC
 	lla	t0, __rel_dyn_start
@@ -167,22 +167,23 @@ _relocate_done:
 	call	_reset_regs
 
 	/* Zero-out BSS */
-	lla	s4, _bss_start
-	lla	s5, _bss_end
+	lla	t0, _bss_start
+	lla	t1, _bss_end
 _bss_zero:
-	REG_S	zero, (s4)
-	add	s4, s4, __SIZEOF_POINTER__
-	blt	s4, s5, _bss_zero
+	REG_S	zero, (t0)
+	add	t0, t0, __SIZEOF_POINTER__
+	blt	t0, t1, _bss_zero
 
 	/* Setup temporary trap handler */
-	lla	s4, _start_hang
-	csrw	CSR_MTVEC, s4
+	lla	t0, _start_hang
+	csrw	CSR_MTVEC, t0
 
 	/* Setup temporary stack */
-	lla	s4, _fw_end
-	li	s5, (SBI_SCRATCH_SIZE * 2)
-	add	sp, s4, s5
+	lla	t0, _fw_end
+	li	t1, (SBI_SCRATCH_SIZE * 2)
+	add	sp, t0, t1
 
+	MOV_5R	a0, s0, a1, s1, a2, s2, a3, s3, a4, s4
 	call	fw_coldboot_init
 
 	/* mark boot hart done */
@@ -543,23 +544,21 @@ _reset_regs:
 
 	/* flush the instruction cache */
 	fence.i
-	/* Reset all registers except ra, a0, a1 and a2 */
+	/* Reset all registers except ra, s0-s4 */
 	li sp, 0
 	li gp, 0
 	li tp, 0
 	li t0, 0
 	li t1, 0
 	li t2, 0
-	li s0, 0
-	li s1, 0
+	li a0, 0
+	li a1, 0
+	li a2, 0
 	li a3, 0
 	li a4, 0
 	li a5, 0
 	li a6, 0
 	li a7, 0
-	li s2, 0
-	li s3, 0
-	li s4, 0
 	li s5, 0
 	li s6, 0
 	li s7, 0
-- 
2.43.0


