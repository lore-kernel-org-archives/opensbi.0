From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 5 Jan 2021 18:56:51 -0800
Subject: [PATCH 2/3] lib: sbi: Introduce sbi_trap_exit() API
In-Reply-To: <20201230033304.295706-3-anup.patel@wdc.com>
References: <20201230033304.295706-1-anup.patel@wdc.com>
 <20201230033304.295706-3-anup.patel@wdc.com>
Message-ID: <CAOnJCULMar6X_nfOkPd6LSDF_uDYAuQV0Nh7VChj-xbtdbxjkA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 29, 2020 at 7:33 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We introduce sbi_trap_exit() API which can help non-firmware
> (i.e. generic or platform) code to force exit trap/interrupt
> handling and resume execution at context pointed by parameter
> "const struct sbi_trap_regs *regs".
>
> This new sbi_trap_exit() API will help Keystone Enclave project
> to resume execution of enclave from custom SBI call handler.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  firmware/fw_base.S        | 43 +++++++++++++++++++++++++++++++++++++++
>  include/sbi/sbi_scratch.h | 10 ++++++---
>  include/sbi/sbi_trap.h    |  2 ++
>  lib/sbi/sbi_trap.c        | 20 ++++++++++++++++++
>  4 files changed, 72 insertions(+), 3 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index fb504e8..ab33e11 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -261,6 +261,9 @@ _scratch_init:
>         /* Store hartid-to-scratch function address in scratch space */
>         la      a4, _hartid_to_scratch
>         REG_S   a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
> +       /* Store trap-exit function address in scratch space */
> +       la      a4, _trap_exit
> +       REG_S   a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(tp)
>         /* Clear tmp0 in scratch space */
>         REG_S   zero, SBI_SCRATCH_TMP0_OFFSET(tp)
>         /* Store firmware options in scratch space */
> @@ -423,6 +426,18 @@ _skip_trap_handler_rv32_hyp:
>  #endif
>         csrw    CSR_MTVEC, a4
>
> +#if __riscv_xlen == 32
> +       /* Override trap exit for H-extension */
> +       csrr    a5, CSR_MISA
> +       srli    a5, a5, ('H' - 'A')
> +       andi    a5, a5, 0x1
> +       beq     a5, zero, _skip_trap_exit_rv32_hyp
> +       la      a4, _trap_exit_rv32_hyp
> +       csrr    a5, CSR_MSCRATCH
> +       REG_S   a4, SBI_SCRATCH_TRAP_EXIT_OFFSET(a5)
> +_skip_trap_exit_rv32_hyp:
> +#endif
> +
>         /* Initialize SBI runtime */
>         csrr    a0, CSR_MSCRATCH
>         call    sbi_init
> @@ -653,6 +668,20 @@ _trap_handler:
>
>         mret
>
> +       .section .entry, "ax", %progbits
> +       .align 3
> +       .globl _trap_exit
> +_trap_exit:
> +       add     sp, a0, zero
> +
> +       TRAP_RESTORE_GENERAL_REGS_EXCEPT_SP_T0
> +
> +       TRAP_RESTORE_MEPC_MSTATUS 0
> +
> +       TRAP_RESTORE_SP_T0
> +
> +       mret
> +
>  #if __riscv_xlen == 32
>         .section .entry, "ax", %progbits
>         .align 3
> @@ -673,6 +702,20 @@ _trap_handler_rv32_hyp:
>         TRAP_RESTORE_SP_T0
>
>         mret
> +
> +       .section .entry, "ax", %progbits
> +       .align 3
> +       .globl _trap_exit_rv32_hyp
> +_trap_exit_rv32_hyp:
> +       add     sp, a0, zero
> +
> +       TRAP_RESTORE_GENERAL_REGS_EXCEPT_SP_T0
> +
> +       TRAP_RESTORE_MEPC_MSTATUS 1
> +
> +       TRAP_RESTORE_SP_T0
> +
> +       mret
>  #endif
>
>         .section .entry, "ax", %progbits
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 9f3453d..e7079f5 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -30,12 +30,14 @@
>  #define SBI_SCRATCH_PLATFORM_ADDR_OFFSET       (6 * __SIZEOF_POINTER__)
>  /** Offset of hartid_to_scratch member in sbi_scratch */
>  #define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET   (7 * __SIZEOF_POINTER__)
> +/** Offset of trap_exit member in sbi_scratch */
> +#define SBI_SCRATCH_TRAP_EXIT_OFFSET           (8 * __SIZEOF_POINTER__)
>  /** Offset of tmp0 member in sbi_scratch */
> -#define SBI_SCRATCH_TMP0_OFFSET                        (8 * __SIZEOF_POINTER__)
> +#define SBI_SCRATCH_TMP0_OFFSET                        (9 * __SIZEOF_POINTER__)
>  /** Offset of options member in sbi_scratch */
> -#define SBI_SCRATCH_OPTIONS_OFFSET             (9 * __SIZEOF_POINTER__)
> +#define SBI_SCRATCH_OPTIONS_OFFSET             (10 * __SIZEOF_POINTER__)
>  /** Offset of extra space in sbi_scratch */
> -#define SBI_SCRATCH_EXTRA_SPACE_OFFSET         (10 * __SIZEOF_POINTER__)
> +#define SBI_SCRATCH_EXTRA_SPACE_OFFSET         (11 * __SIZEOF_POINTER__)
>  /** Maximum size of sbi_scratch (4KB) */
>  #define SBI_SCRATCH_SIZE                       (0x1000)
>
> @@ -63,6 +65,8 @@ struct sbi_scratch {
>         unsigned long platform_addr;
>         /** Address of HART ID to sbi_scratch conversion function */
>         unsigned long hartid_to_scratch;
> +       /** Address of trap exit function */
> +       unsigned long trap_exit;
>         /** Temporary storage */
>         unsigned long tmp0;
>         /** Options for OpenSBI library */
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> index 5d0962f..04001df 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -207,6 +207,8 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>
>  void sbi_trap_handler(struct sbi_trap_regs *regs);
>
> +void __noreturn sbi_trap_exit(const struct sbi_trap_regs *regs);
> +
>  #endif
>
>  #endif
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index db5aa2f..b7349d2 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -16,6 +16,7 @@
>  #include <sbi/sbi_illegal_insn.h>
>  #include <sbi/sbi_ipi.h>
>  #include <sbi/sbi_misaligned_ldst.h>
> +#include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_timer.h>
>  #include <sbi/sbi_trap.h>
>
> @@ -271,3 +272,22 @@ trap_error:
>         if (rc)
>                 sbi_trap_error(msg, rc, mcause, mtval, mtval2, mtinst, regs);
>  }
> +
> +typedef void (*trap_exit_t)(const struct sbi_trap_regs *regs);
> +
> +/**
> + * Exit trap/interrupt handling
> + *
> + * This function is called by non-firmware code to abruptly exit
> + * trap/interrupt handling and resume execution at context pointed
> + * by given register state.
> + *
> + * @param regs pointer to register state
> + */
> +void __noreturn sbi_trap_exit(const struct sbi_trap_regs *regs)
> +{
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
> +       ((trap_exit_t)scratch->trap_exit)(regs);
> +       __builtin_unreachable();
> +}
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

--
Regards,
Atish

