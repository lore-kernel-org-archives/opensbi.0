From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Mar 2024 12:12:26 -0500
Subject: [PATCH 1/9] lib: sbi: Remove sbi_trap_exit() and related code
In-Reply-To: <20240311160944.1233523-2-apatel@ventanamicro.com>
References: <20240311160944.1233523-1-apatel@ventanamicro.com>
 <20240311160944.1233523-2-apatel@ventanamicro.com>
Message-ID: <aa140152-4777-4b84-b1af-730fe5e886cb@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On 2024-03-11 11:09 AM, Anup Patel wrote:
> Over the years, no uses of sbi_trap_exit() have been found so remove
> it and also remove related code from fw_base.S and sbi_scratch.h.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  firmware/fw_base.S        | 11 -----------
>  include/sbi/sbi_scratch.h | 15 +++------------
>  include/sbi/sbi_trap.h    |  2 --
>  lib/sbi/sbi_trap.c        | 19 -------------------
>  4 files changed, 3 insertions(+), 44 deletions(-)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 126b067..c404d8b 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -298,9 +298,6 @@ _scratch_init:
>  	/* Store hartid-to-scratch function address in scratch space */
>  	lla	a4, _hartid_to_scratch
>  	REG_S	a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
> -	/* Store trap-exit function address in scratch space */
> -	lla	a4, _trap_exit
> -	REG_S	a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(tp)
>  	/* Clear tmp0 in scratch space */
>  	REG_S	zero, SBI_SCRATCH_TMP0_OFFSET(tp)
>  	/* Store firmware options in scratch space */
> @@ -453,10 +450,6 @@ _start_warm:
>  	srli	a5, a5, ('H' - 'A')
>  	andi	a5, a5, 0x1
>  	beq	a5, zero, _skip_trap_handler_rv32_hyp
> -	/* Override trap exit for H-extension */
> -	csrr	a5, CSR_MSCRATCH
> -	lla	a4, _trap_exit_rv32_hyp
> -	REG_S	a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(a5)
>  	lla	a4, _trap_handler_rv32_hyp
>  _skip_trap_handler_rv32_hyp:
>  #endif
> @@ -695,7 +688,6 @@ memcmp:
>  	.section .entry, "ax", %progbits
>  	.align 3
>  	.globl _trap_handler
> -	.globl _trap_exit
>  _trap_handler:
>  	TRAP_SAVE_AND_SETUP_SP_T0
>  
> @@ -705,7 +697,6 @@ _trap_handler:
>  
>  	TRAP_CALL_C_ROUTINE
>  
> -_trap_exit:
>  	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
>  
>  	TRAP_RESTORE_MEPC_MSTATUS 0
> @@ -718,7 +709,6 @@ _trap_exit:
>  	.section .entry, "ax", %progbits
>  	.align 3
>  	.globl _trap_handler_rv32_hyp
> -	.globl _trap_exit_rv32_hyp
>  _trap_handler_rv32_hyp:
>  	TRAP_SAVE_AND_SETUP_SP_T0
>  
> @@ -728,7 +718,6 @@ _trap_handler_rv32_hyp:
>  
>  	TRAP_CALL_C_ROUTINE
>  
> -_trap_exit_rv32_hyp:
>  	TRAP_RESTORE_GENERAL_REGS_EXCEPT_A0_T0
>  
>  	TRAP_RESTORE_MEPC_MSTATUS 1
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index e6a33ba..55b937f 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -36,14 +36,12 @@
>  #define SBI_SCRATCH_PLATFORM_ADDR_OFFSET	(9 * __SIZEOF_POINTER__)
>  /** Offset of hartid_to_scratch member in sbi_scratch */
>  #define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET	(10 * __SIZEOF_POINTER__)
> -/** Offset of trap_exit member in sbi_scratch */
> -#define SBI_SCRATCH_TRAP_EXIT_OFFSET		(11 * __SIZEOF_POINTER__)
>  /** Offset of tmp0 member in sbi_scratch */
> -#define SBI_SCRATCH_TMP0_OFFSET			(12 * __SIZEOF_POINTER__)
> +#define SBI_SCRATCH_TMP0_OFFSET			(11 * __SIZEOF_POINTER__)
>  /** Offset of options member in sbi_scratch */
> -#define SBI_SCRATCH_OPTIONS_OFFSET		(13 * __SIZEOF_POINTER__)
> +#define SBI_SCRATCH_OPTIONS_OFFSET		(12 * __SIZEOF_POINTER__)
>  /** Offset of extra space in sbi_scratch */
> -#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(14 * __SIZEOF_POINTER__)
> +#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(13 * __SIZEOF_POINTER__)
>  /** Maximum size of sbi_scratch (4KB) */
>  #define SBI_SCRATCH_SIZE			(0x1000)
>  
> @@ -77,8 +75,6 @@ struct sbi_scratch {
>  	unsigned long platform_addr;
>  	/** Address of HART ID to sbi_scratch conversion function */
>  	unsigned long hartid_to_scratch;
> -	/** Address of trap exit function */
> -	unsigned long trap_exit;

It would avoid some churn (and effects on `git blame`) to replace this with
padding instead of changing the offsets for one commit, but either way:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  	/** Temporary storage */
>  	unsigned long tmp0;
>  	/** Options for OpenSBI library */
> @@ -129,11 +125,6 @@ _Static_assert(
>  		== SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET,
>  	"struct sbi_scratch definition has changed, please redefine "
>  	"SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET");
> -_Static_assert(
> -	offsetof(struct sbi_scratch, trap_exit)
> -		== SBI_SCRATCH_TRAP_EXIT_OFFSET,
> -	"struct sbi_scratch definition has changed, please redefine "
> -	"SBI_SCRATCH_TRAP_EXIT_OFFSET");
>  _Static_assert(
>  	offsetof(struct sbi_scratch, tmp0)
>  		== SBI_SCRATCH_TMP0_OFFSET,
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> index 2727bdb..15ccd0b 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -229,8 +229,6 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>  
>  struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs);
>  
> -void __noreturn sbi_trap_exit(const struct sbi_trap_regs *regs);
> -
>  #endif
>  
>  #endif
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index c665013..e514066 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -335,22 +335,3 @@ trap_error:
>  		sbi_trap_error(msg, rc, mcause, mtval, mtval2, mtinst, regs);
>  	return regs;
>  }
> -
> -typedef void (*trap_exit_t)(const struct sbi_trap_regs *regs);
> -
> -/**
> - * Exit trap/interrupt handling
> - *
> - * This function is called by non-firmware code to abruptly exit
> - * trap/interrupt handling and resume execution at context pointed
> - * by given register state.
> - *
> - * @param regs pointer to register state
> - */
> -void __noreturn sbi_trap_exit(const struct sbi_trap_regs *regs)
> -{
> -	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> -
> -	((trap_exit_t)scratch->trap_exit)(regs);
> -	__builtin_unreachable();
> -}


