From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 8 Mar 2021 05:30:48 +0000
Subject: [PATCH v2 1/2] firmware: Use lla to access all global symbols
In-Reply-To: <1614935014-18600-2-git-send-email-vincent.chen@sifive.com>
References: <1614935014-18600-1-git-send-email-vincent.chen@sifive.com>
 <1614935014-18600-2-git-send-email-vincent.chen@sifive.com>
Message-ID: <DM6PR04MB620159CE80CB639740DF08D08D939@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Vincent
> Chen
> Sent: 05 March 2021 14:34
> To: opensbi at lists.infradead.org
> Cc: Vincent Chen <vincent.chen@sifive.com>
> Subject: [PATCH v2 1/2] firmware: Use lla to access all global symbols
> 
> When OpenSBI is compiled as fPIE mode, the assembler will translate "la"
> to GOT reference pattern. It will cause to cost an additional load instruction
> when obtaining the symbol address. However, if the symbol locates within
> the positive or negative 2GB region, we can use "lla"
> instead of "la" to avoid unneeded GOT references. This patch assumes that
> the OpenSBI image excluding the payload does not exceed 2GB. Based on
> this assumption, all "la" instructions are replaced by "lla" to avoid
> performance degradation when compiling as fPIE mode.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  firmware/fw_base.S            | 88 +++++++++++++++++++++----------------------
>  firmware/fw_dynamic.S         | 18 ++++-----
>  firmware/fw_jump.S            |  2 +-
>  firmware/fw_payload.S         |  2 +-
>  firmware/payloads/test_head.S | 18 ++++-----
>  5 files changed, 64 insertions(+), 64 deletions(-)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S index
> ab33e11..6cc5f88 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -57,39 +57,39 @@ _start:
>  	bne	a0, a6, _wait_relocate_copy_done
>  _try_lottery:
>  	/* Jump to relocation wait loop if we don't get relocation lottery */
> -	la	a6, _relocate_lottery
> +	lla	a6, _relocate_lottery
>  	li	a7, 1
>  	amoadd.w a6, a7, (a6)
>  	bnez	a6, _wait_relocate_copy_done
> 
>  	/* Save load address */
> -	la	t0, _load_start
> -	la	t1, _start
> +	lla	t0, _load_start
> +	lla	t1, _start
>  	REG_S	t1, 0(t0)
> 
>  	/* Relocate if load address != link address */
>  _relocate:
> -	la	t0, _link_start
> +	lla	t0, _link_start
>  	REG_L	t0, 0(t0)
> -	la	t1, _link_end
> +	lla	t1, _link_end
>  	REG_L	t1, 0(t1)
> -	la	t2, _load_start
> +	lla	t2, _load_start
>  	REG_L	t2, 0(t2)
>  	sub	t3, t1, t0
>  	add	t3, t3, t2
>  	beq	t0, t2, _relocate_done
> -	la	t4, _relocate_done
> +	lla	t4, _relocate_done
>  	sub	t4, t4, t2
>  	add	t4, t4, t0
>  	blt	t2, t0, _relocate_copy_to_upper
>  _relocate_copy_to_lower:
>  	ble	t1, t2, _relocate_copy_to_lower_loop
> -	la	t3, _relocate_lottery
> +	lla	t3, _relocate_lottery
>  	BRANGE	t2, t1, t3, _start_hang
> -	la	t3, _boot_status
> +	lla	t3, _boot_status
>  	BRANGE	t2, t1, t3, _start_hang
> -	la	t3, _relocate
> -	la	t5, _relocate_done
> +	lla	t3, _relocate
> +	lla	t5, _relocate_done
>  	BRANGE	t2, t1, t3, _start_hang
>  	BRANGE	t2, t1, t5, _start_hang
>  	BRANGE  t3, t5, t2, _start_hang
> @@ -102,12 +102,12 @@ _relocate_copy_to_lower_loop:
>  	jr	t4
>  _relocate_copy_to_upper:
>  	ble	t3, t0, _relocate_copy_to_upper_loop
> -	la	t2, _relocate_lottery
> +	lla	t2, _relocate_lottery
>  	BRANGE	t0, t3, t2, _start_hang
> -	la	t2, _boot_status
> +	lla	t2, _boot_status
>  	BRANGE	t0, t3, t2, _start_hang
> -	la	t2, _relocate
> -	la	t5, _relocate_done
> +	lla	t2, _relocate
> +	lla	t5, _relocate_done
>  	BRANGE	t0, t3, t2, _start_hang
>  	BRANGE	t0, t3, t5, _start_hang
>  	BRANGE	t2, t5, t0, _start_hang
> @@ -119,12 +119,12 @@ _relocate_copy_to_upper_loop:
>  	blt	t0, t1, _relocate_copy_to_upper_loop
>  	jr	t4
>  _wait_relocate_copy_done:
> -	la	t0, _start
> -	la	t1, _link_start
> +	lla	t0, _start
> +	lla	t1, _link_start
>  	REG_L	t1, 0(t1)
>  	beq	t0, t1, _wait_for_boot_hart
> -	la	t2, _boot_status
> -	la	t3, _wait_for_boot_hart
> +	lla	t2, _boot_status
> +	lla	t3, _wait_for_boot_hart
>  	sub	t3, t3, t0
>  	add	t3, t3, t1
>  1:
> @@ -143,10 +143,10 @@ _relocate_done:
>  	 * Mark relocate copy done
>  	 * Use _boot_status copy relative to the load address
>  	 */
> -	la	t0, _boot_status
> -	la	t1, _link_start
> +	lla	t0, _boot_status
> +	lla	t1, _link_start
>  	REG_L	t1, 0(t1)
> -	la	t2, _load_start
> +	lla	t2, _load_start
>  	REG_L	t2, 0(t2)
>  	sub	t0, t0, t1
>  	add	t0, t0, t2
> @@ -161,19 +161,19 @@ _relocate_done:
>  	call	_reset_regs
> 
>  	/* Zero-out BSS */
> -	la	s4, _bss_start
> -	la	s5, _bss_end
> +	lla	s4, _bss_start
> +	lla	s5, _bss_end
>  _bss_zero:
>  	REG_S	zero, (s4)
>  	add	s4, s4, __SIZEOF_POINTER__
>  	blt	s4, s5, _bss_zero
> 
>  	/* Setup temporary trap handler */
> -	la	s4, _start_hang
> +	lla	s4, _start_hang
>  	csrw	CSR_MTVEC, s4
> 
>  	/* Setup temporary stack */
> -	la	s4, _fw_end
> +	lla	s4, _fw_end
>  	li	s5, (SBI_SCRATCH_SIZE * 2)
>  	add	sp, s4, s5
> 
> @@ -184,7 +184,7 @@ _bss_zero:
> 
>  #ifdef FW_FDT_PATH
>  	/* Override previous arg1 */
> -	la	a1, fw_fdt_bin
> +	lla	a1, fw_fdt_bin
>  #endif
> 
>  	/*
> @@ -202,7 +202,7 @@ _bss_zero:
>  	 * s7 -> HART Count
>  	 * s8 -> HART Stack Size
>  	 */
> -	la	a4, platform
> +	lla	a4, platform
>  #if __riscv_xlen == 64
>  	lwu	s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
>  	lwu	s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
> @@ -212,7 +212,7 @@ _bss_zero:
>  #endif
> 
>  	/* Setup scratch space for all the HARTs*/
> -	la	tp, _fw_end
> +	lla	tp, _fw_end
>  	mul	a5, s7, s8
>  	add	tp, tp, a5
>  	/* Keep a copy of tp */
> @@ -230,8 +230,8 @@ _scratch_init:
> 
>  	/* Initialize scratch space */
>  	/* Store fw_start and fw_size in scratch space */
> -	la	a4, _fw_start
> -	la	a5, _fw_end
> +	lla	a4, _fw_start
> +	lla	a5, _fw_end
>  	mul	t0, s7, s8
>  	add	a5, a5, t0
>  	sub	a5, a5, a4
> @@ -253,16 +253,16 @@ _scratch_init:
>  	REG_S	a0, SBI_SCRATCH_NEXT_MODE_OFFSET(tp)
>  	MOV_3R	a0, s0, a1, s1, a2, s2
>  	/* Store warm_boot address in scratch space */
> -	la	a4, _start_warm
> +	lla	a4, _start_warm
>  	REG_S	a4, SBI_SCRATCH_WARMBOOT_ADDR_OFFSET(tp)
>  	/* Store platform address in scratch space */
> -	la	a4, platform
> +	lla	a4, platform
>  	REG_S	a4, SBI_SCRATCH_PLATFORM_ADDR_OFFSET(tp)
>  	/* Store hartid-to-scratch function address in scratch space */
> -	la	a4, _hartid_to_scratch
> +	lla	a4, _hartid_to_scratch
>  	REG_S	a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
>  	/* Store trap-exit function address in scratch space */
> -	la	a4, _trap_exit
> +	lla	a4, _trap_exit
>  	REG_S	a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(tp)
>  	/* Clear tmp0 in scratch space */
>  	REG_S	zero, SBI_SCRATCH_TMP0_OFFSET(tp)
> @@ -343,7 +343,7 @@ _fdt_reloc_done:
> 
>  	/* mark boot hart done */
>  	li	t0, BOOT_STATUS_BOOT_HART_DONE
> -	la	t1, _boot_status
> +	lla	t1, _boot_status
>  	REG_S	t0, 0(t1)
>  	fence	rw, rw
>  	j	_start_warm
> @@ -351,7 +351,7 @@ _fdt_reloc_done:
>  	/* waiting for boot hart to be done (_boot_status == 2) */
>  _wait_for_boot_hart:
>  	li	t0, BOOT_STATUS_BOOT_HART_DONE
> -	la	t1, _boot_status
> +	lla	t1, _boot_status
>  	REG_L	t1, 0(t1)
>  	/* Reduce the bus traffic so that boot hart may proceed faster */
>  	nop
> @@ -369,7 +369,7 @@ _start_warm:
>  	csrw	CSR_MIP, zero
> 
>  	/* Find HART count and HART stack size */
> -	la	a4, platform
> +	lla	a4, platform
>  #if __riscv_xlen == 64
>  	lwu	s7, SBI_PLATFORM_HART_COUNT_OFFSET(a4)
>  	lwu	s8, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(a4)
> @@ -400,7 +400,7 @@ _start_warm:
>  3:	bge	s6, s7, _start_hang
> 
>  	/* Find the scratch space based on HART index */
> -	la	tp, _fw_end
> +	lla	tp, _fw_end
>  	mul	a5, s7, s8
>  	add	tp, tp, a5
>  	mul	a5, s8, s6
> @@ -415,13 +415,13 @@ _start_warm:
>  	add	sp, tp, zero
> 
>  	/* Setup trap handler */
> -	la	a4, _trap_handler
> +	lla	a4, _trap_handler
>  #if __riscv_xlen == 32
>  	csrr	a5, CSR_MISA
>  	srli	a5, a5, ('H' - 'A')
>  	andi	a5, a5, 0x1
>  	beq	a5, zero, _skip_trap_handler_rv32_hyp
> -	la	a4, _trap_handler_rv32_hyp
> +	lla	a4, _trap_handler_rv32_hyp
>  _skip_trap_handler_rv32_hyp:
>  #endif
>  	csrw	CSR_MTVEC, a4
> @@ -432,7 +432,7 @@ _skip_trap_handler_rv32_hyp:
>  	srli	a5, a5, ('H' - 'A')
>  	andi	a5, a5, 0x1
>  	beq	a5, zero, _skip_trap_exit_rv32_hyp
> -	la	a4, _trap_exit_rv32_hyp
> +	lla	a4, _trap_exit_rv32_hyp
>  	csrr	a5, CSR_MSCRATCH
>  	REG_S	a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(a5)
>  _skip_trap_exit_rv32_hyp:
> @@ -468,7 +468,7 @@ _hartid_to_scratch:
>  	 * t1 -> HART Stack End
>  	 * t2 -> Temporary
>  	 */
> -	la	t2, platform
> +	lla	t2, platform
>  #if __riscv_xlen == 64
>  	lwu	t0, SBI_PLATFORM_HART_STACK_SIZE_OFFSET(t2)
>  	lwu	t2, SBI_PLATFORM_HART_COUNT_OFFSET(t2)
> @@ -478,7 +478,7 @@ _hartid_to_scratch:
>  #endif
>  	sub	t2, t2, a1
>  	mul	t2, t2, t0
> -	la	t1, _fw_end
> +	lla	t1, _fw_end
>  	add	t1, t1, t2
>  	li	t2, SBI_SCRATCH_SIZE
>  	sub	a0, t1, t2
> diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S index
> 8b56947..0705e63 100644
> --- a/firmware/fw_dynamic.S
> +++ b/firmware/fw_dynamic.S
> @@ -54,7 +54,7 @@ fw_boot_hart:
>  	 */
>  fw_save_info:
>  	/* Save next arg1 in 'a1' */
> -	la	a4, _dynamic_next_arg1
> +	lla	a4, _dynamic_next_arg1
>  	REG_S	a1, (a4)
> 
>  	/* Sanity checks */
> @@ -66,13 +66,13 @@ fw_save_info:
>  	bgt	a3, a4, _bad_dynamic_info
> 
>  	/* Save version == 0x1 fields */
> -	la	a4, _dynamic_next_addr
> +	lla	a4, _dynamic_next_addr
>  	REG_L	a3, FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET(a2)
>  	REG_S	a3, (a4)
> -	la	a4, _dynamic_next_mode
> +	lla	a4, _dynamic_next_mode
>  	REG_L	a3, FW_DYNAMIC_INFO_NEXT_MODE_OFFSET(a2)
>  	REG_S	a3, (a4)
> -	la	a4, _dynamic_options
> +	lla	a4, _dynamic_options
>  	REG_L	a3, FW_DYNAMIC_INFO_OPTIONS_OFFSET(a2)
>  	REG_S	a3, (a4)
> 
> @@ -80,7 +80,7 @@ fw_save_info:
>  	li	a4, 0x2
>  	REG_L	a3, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
>  	blt	a3, a4, 2f
> -	la	a4, _dynamic_boot_hart
> +	lla	a4, _dynamic_boot_hart
>  	REG_L	a3, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
>  	REG_S	a3, (a4)
>  2:
> @@ -96,7 +96,7 @@ fw_save_info:
>  	 * The next arg1 should be returned in 'a0'.
>  	 */
>  fw_next_arg1:
> -	la	a0, _dynamic_next_arg1
> +	lla	a0, _dynamic_next_arg1
>  	REG_L	a0, (a0)
>  	ret
> 
> @@ -108,7 +108,7 @@ fw_next_arg1:
>  	 * The next address should be returned in 'a0'.
>  	 */
>  fw_next_addr:
> -	la	a0, _dynamic_next_addr
> +	lla	a0, _dynamic_next_addr
>  	REG_L	a0, (a0)
>  	ret
> 
> @@ -120,7 +120,7 @@ fw_next_addr:
>  	 * The next address should be returned in 'a0'
>  	 */
>  fw_next_mode:
> -	la	a0, _dynamic_next_mode
> +	lla	a0, _dynamic_next_mode
>  	REG_L	a0, (a0)
>  	ret
> 
> @@ -133,7 +133,7 @@ fw_next_mode:
>  	 * The next address should be returned in 'a0'.
>  	 */
>  fw_options:
> -	la	a0, _dynamic_options
> +	lla	a0, _dynamic_options
>  	REG_L	a0, (a0)
>  	ret
> 
> diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S index
> 8553f8c..5b24f8b 100644
> --- a/firmware/fw_jump.S
> +++ b/firmware/fw_jump.S
> @@ -59,7 +59,7 @@ fw_next_arg1:
>  	 * The next address should be returned in 'a0'.
>  	 */
>  fw_next_addr:
> -	la	a0, _jump_addr
> +	lla	a0, _jump_addr
>  	REG_L	a0, (a0)
>  	ret
> 
> diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S index
> 1ef121e..c53a3bb 100644
> --- a/firmware/fw_payload.S
> +++ b/firmware/fw_payload.S
> @@ -59,7 +59,7 @@ fw_next_arg1:
>  	 * The next address should be returned in 'a0'.
>  	 */
>  fw_next_addr:
> -	la	a0, payload_bin
> +	lla	a0, payload_bin
>  	ret
> 
>  	.section .entry, "ax", %progbits
> diff --git a/firmware/payloads/test_head.S
> b/firmware/payloads/test_head.S index 840013e..4852f71 100644
> --- a/firmware/payloads/test_head.S
> +++ b/firmware/payloads/test_head.S
> @@ -28,20 +28,20 @@
>  	.globl _start
>  _start:
>  	/* Pick one hart to run the main boot sequence */
> -	la	a3, _hart_lottery
> +	lla	a3, _hart_lottery
>  	li	a2, 1
>  	amoadd.w a3, a2, (a3)
>  	bnez	a3, _start_hang
> 
>  	/* Save a0 and a1 */
> -	la	a3, _boot_a0
> +	lla	a3, _boot_a0
>  	REG_S	a0, 0(a3)
> -	la	a3, _boot_a1
> +	lla	a3, _boot_a1
>  	REG_S	a1, 0(a3)
> 
>  	/* Zero-out BSS */
> -	la	a4, _bss_start
> -	la	a5, _bss_end
> +	lla	a4, _bss_start
> +	lla	a5, _bss_end
>  _bss_zero:
>  	REG_S	zero, (a4)
>  	add	a4, a4, __SIZEOF_POINTER__
> @@ -53,18 +53,18 @@ _start_warm:
>  	csrw	CSR_SIP, zero
> 
>  	/* Setup exception vectors */
> -	la	a3, _start_hang
> +	lla	a3, _start_hang
>  	csrw	CSR_STVEC, a3
> 
>  	/* Setup stack */
> -	la	a3, _payload_end
> +	lla	a3, _payload_end
>  	li	a4, 0x2000
>  	add	sp, a3, a4
> 
>  	/* Jump to C main */
> -	la	a3, _boot_a0
> +	lla	a3, _boot_a0
>  	REG_L	a0, 0(a3)
> -	la	a3, _boot_a1
> +	lla	a3, _boot_a1
>  	REG_L	a1, 0(a3)
>  	call	test_main
> 
> --
> 2.7.4
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

