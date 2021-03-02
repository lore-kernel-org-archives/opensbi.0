From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue,  2 Mar 2021 23:25:52 +0800
Subject: [PATCH 3/3] firware: Use lla to access all global symbols
In-Reply-To: <1614698752-16085-1-git-send-email-vincent.chen@sifive.com>
References: <1614698752-16085-1-git-send-email-vincent.chen@sifive.com>
Message-ID: <1614698752-16085-4-git-send-email-vincent.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When OpenSBI is compiled as fPIE mode, the assembler will translate "la"
to GOT reference pattern. It will cause to cost an additional load
instruction when obtaining the symbol address. However, if the symbol
locates within the positive or negative 2GB region, we can use "lla"
instead of "la" to avoid unneeded GOT references. This patch assumes that
the OpenSBI image excluding the payload does not exceed 2GB. Based on
this assumption, all "la" instructions are replaced by "lla" to avoid
performance degradation when compiling as fPIE mode.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 firmware/fw_base.S    | 26 +++++++++++++-------------
 firmware/fw_dynamic.S | 18 +++++++++---------
 firmware/fw_jump.S    |  6 +++---
 firmware/fw_payload.S |  4 ++--
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index fe4af45..c159dfc 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -219,8 +219,8 @@ _relocate_done:
 	call	_reset_regs
 
 	/* Zero-out BSS */
-	la	s4, _bss_start
-	la	s5, _bss_end
+	lla	s4, _bss_start
+	lla	s5, _bss_end
 _bss_zero:
 	REG_S	zero, (s4)
 	add	s4, s4, __SIZEOF_POINTER__
@@ -231,7 +231,7 @@ _bss_zero:
 	csrw	CSR_MTVEC, s4
 
 	/* Setup temporary stack */
-	la	s4, _fw_end
+	lla	s4, _fw_end
 	li	s5, (SBI_SCRATCH_SIZE * 2)
 	add	sp, s4, s5
 
@@ -242,7 +242,7 @@ _bss_zero:
 
 #ifdef FW_FDT_PATH
 	/* Override previous arg1 */
-	la	a1, fw_fdt_bin
+	lla	a1, fw_fdt_bin
 #endif
 
 	/*
@@ -260,7 +260,7 @@ _bss_zero:
 	 * s7 -> HART Count
 	 * s8 -> HART Stack Size
 	 */
-	la	a4, platform
+	lla	a4, platform
 #if __riscv_xlen == 64
 	lwu	s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
 	lwu	s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
@@ -270,7 +270,7 @@ _bss_zero:
 #endif
 
 	/* Setup scratch space for all the HARTs*/
-	la	tp, _fw_end
+	lla	tp, _fw_end
 	mul	a5, s7, s8
 	add	tp, tp, a5
 	/* Keep a copy of tp */
@@ -288,8 +288,8 @@ _scratch_init:
 
 	/* Initialize scratch space */
 	/* Store fw_start and fw_size in scratch space */
-	la	a4, _fw_start
-	la	a5, _fw_end
+	lla	a4, _fw_start
+	lla	a5, _fw_end
 	mul	t0, s7, s8
 	add	a5, a5, t0
 	sub	a5, a5, a4
@@ -314,7 +314,7 @@ _scratch_init:
 	lla	a4, _start_warm
 	REG_S	a4, SBI_SCRATCH_WARMBOOT_ADDR_OFFSET(tp)
 	/* Store platform address in scratch space */
-	la	a4, platform
+	lla	a4, platform
 	REG_S	a4, SBI_SCRATCH_PLATFORM_ADDR_OFFSET(tp)
 	/* Store hartid-to-scratch function address in scratch space */
 	lla	a4, _hartid_to_scratch
@@ -427,7 +427,7 @@ _start_warm:
 	csrw	CSR_MIP, zero
 
 	/* Find HART count and HART stack size */
-	la	a4, platform
+	lla	a4, platform
 #if __riscv_xlen == 64
 	lwu	s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
 	lwu	s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
@@ -458,7 +458,7 @@ _start_warm:
 3:	bge	s6, s7, _start_hang
 
 	/* Find the scratch space based on HART index */
-	la	tp, _fw_end
+	lla	tp, _fw_end
 	mul	a5, s7, s8
 	add	tp, tp, a5
 	mul	a5, s8, s6
@@ -528,7 +528,7 @@ _hartid_to_scratch:
 	 * t1 -> HART Stack End
 	 * t2 -> Temporary
 	 */
-	la	t2, platform
+	lla	t2, platform
 #if __riscv_xlen == 64
 	lwu	t0, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(t2)
 	lwu	t2, SBI_PLATFORM_HART_COUNT_OFFSET(t2)
@@ -538,7 +538,7 @@ _hartid_to_scratch:
 #endif
 	sub	t2, t2, a1
 	mul	t2, t2, t0
-	la	t1, _fw_end
+	lla	t1, _fw_end
 	add	t1, t1, t2
 	li	t2, SBI_SCRATCH_SIZE
 	sub	a0, t1, t2
diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
index 8b56947..0705e63 100644
--- a/firmware/fw_dynamic.S
+++ b/firmware/fw_dynamic.S
@@ -54,7 +54,7 @@ fw_boot_hart:
 	 */
 fw_save_info:
 	/* Save next arg1 in 'a1' */
-	la	a4, _dynamic_next_arg1
+	lla	a4, _dynamic_next_arg1
 	REG_S	a1, (a4)
 
 	/* Sanity checks */
@@ -66,13 +66,13 @@ fw_save_info:
 	bgt	a3, a4, _bad_dynamic_info
 
 	/* Save version == 0x1 fields */
-	la	a4, _dynamic_next_addr
+	lla	a4, _dynamic_next_addr
 	REG_L	a3, FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET(a2)
 	REG_S	a3, (a4)
-	la	a4, _dynamic_next_mode
+	lla	a4, _dynamic_next_mode
 	REG_L	a3, FW_DYNAMIC_INFO_NEXT_MODE_OFFSET(a2)
 	REG_S	a3, (a4)
-	la	a4, _dynamic_options
+	lla	a4, _dynamic_options
 	REG_L	a3, FW_DYNAMIC_INFO_OPTIONS_OFFSET(a2)
 	REG_S	a3, (a4)
 
@@ -80,7 +80,7 @@ fw_save_info:
 	li	a4, 0x2
 	REG_L	a3, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
 	blt	a3, a4, 2f
-	la	a4, _dynamic_boot_hart
+	lla	a4, _dynamic_boot_hart
 	REG_L	a3, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
 	REG_S	a3, (a4)
 2:
@@ -96,7 +96,7 @@ fw_save_info:
 	 * The next arg1 should be returned in 'a0'.
 	 */
 fw_next_arg1:
-	la	a0, _dynamic_next_arg1
+	lla	a0, _dynamic_next_arg1
 	REG_L	a0, (a0)
 	ret
 
@@ -108,7 +108,7 @@ fw_next_arg1:
 	 * The next address should be returned in 'a0'.
 	 */
 fw_next_addr:
-	la	a0, _dynamic_next_addr
+	lla	a0, _dynamic_next_addr
 	REG_L	a0, (a0)
 	ret
 
@@ -120,7 +120,7 @@ fw_next_addr:
 	 * The next address should be returned in 'a0'
 	 */
 fw_next_mode:
-	la	a0, _dynamic_next_mode
+	lla	a0, _dynamic_next_mode
 	REG_L	a0, (a0)
 	ret
 
@@ -133,7 +133,7 @@ fw_next_mode:
 	 * The next address should be returned in 'a0'.
 	 */
 fw_options:
-	la	a0, _dynamic_options
+	lla	a0, _dynamic_options
 	REG_L	a0, (a0)
 	ret
 
diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
index 3cce3f7..4fb3e0c 100644
--- a/firmware/fw_jump.S
+++ b/firmware/fw_jump.S
@@ -47,7 +47,7 @@ fw_next_arg1:
 #ifdef FW_JUMP_FDT_ADDR
 	li	a0, FW_JUMP_FDT_ADDR
 #ifdef FW_PIC
-	la	a1, _runtime_offset
+	lla	a1, _runtime_offset
 	REG_L	a1, (a1)
 	add	a0, a0, a1
 #endif
@@ -64,10 +64,10 @@ fw_next_arg1:
 	 * The next address should be returned in 'a0'.
 	 */
 fw_next_addr:
-	la	a0, _jump_addr
+	lla	a0, _jump_addr
 	REG_L	a0, (a0)
 #ifdef FW_PIC
-	la	a1, _runtime_offset
+	lla	a1, _runtime_offset
 	REG_L	a1, (a1)
 	add	a0, a0, a1
 #endif
diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
index 18b51d0..00c7cb7 100644
--- a/firmware/fw_payload.S
+++ b/firmware/fw_payload.S
@@ -47,7 +47,7 @@ fw_next_arg1:
 #ifdef FW_PAYLOAD_FDT_ADDR
 	li	a0, FW_PAYLOAD_FDT_ADDR
 #ifdef FW_PIC
-	la      a1, _runtime_offset
+	lla	a1, _runtime_offset
 	REG_L   a1, (a1)
 	add     a0, a0, a1
 #endif
@@ -65,7 +65,7 @@ fw_next_arg1:
 	 * The next address should be returned in 'a0'.
 	 */
 fw_next_addr:
-	la	a0, payload_bin
+	lla	a0, payload_bin
 	ret
 
 	.section .entry, "ax", %progbits
-- 
2.7.4


