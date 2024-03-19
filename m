From: Anup Patel <anup@brainfault.org>
Date: Tue, 19 Mar 2024 10:55:13 +0530
Subject: [PATCH] lib: sbi: Remove gva from struct sbi_trap_info
In-Reply-To: <20240313015237.761227-1-wxjstz@126.com>
References: <20240313015237.761227-1-wxjstz@126.com>
Message-ID: <CAAhSdy3tv=5YyzYdjKXPqdZ0OKHxukGcCha=iRfmUdg1GjM3dw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 7:22?AM Xiang W <wxjstz@126.com> wrote:
>
> gva is only used in sbi_trap_redirect and can be calculated from
> sbi_trap_regs through sbi_regs_gva.

gva was added to sbi_trap_regs for specific cases where
we take a trap from VS/VU-mode to M-mode and gva is not
set but we redirect such trap to HS-mode with gva set.

Example: let's say we have HW where time CSR is
trap-n-emulated by M-mode and HW has H-extension
but does not update mtval CSR upon illegal instruction
traps. In this case, whenever VS/VU-mode access time
CSR, it will trap to M-mode as illegal instruction trap and
M-mode but by the time M-mode tries to read VS/VU-mode
instruction the guest page is swapped-out by some other
CPU and M-mode is not able to read VS/VU-mode. In
this situation, M-mode has to redirect the guest page
fault to HS-mode with gva bit set in hstatus CSR.

Regards,
Anup


>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> This patch base on
> "[PATCH v2 00/10] Improve trap handling for nested traps"
>
>  firmware/fw_base.S          | 19 +++----------------
>  include/sbi/sbi_trap.h      |  6 +-----
>  lib/sbi/sbi_expected_trap.S | 17 ++---------------
>  lib/sbi/sbi_illegal_insn.c  |  1 -
>  lib/sbi/sbi_trap.c          |  2 +-
>  5 files changed, 7 insertions(+), 38 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 967cca5..7e172ad 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -625,7 +625,7 @@ memcmp:
>         REG_S   t6, SBI_TRAP_REGS_OFFSET(t6)(sp)
>  .endm
>
> -.macro TRAP_SAVE_INFO have_mstatush have_h_extension
> +.macro TRAP_SAVE_INFO have_h_extension
>         csrr    t0, CSR_MCAUSE
>         REG_S   t0, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(cause))(sp)
>         csrr    t0, CSR_MTVAL
> @@ -635,20 +635,11 @@ memcmp:
>         REG_S   t0, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(tval2))(sp)
>         csrr    t0, CSR_MTINST
>         REG_S   t0, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(tinst))(sp)
> -       .if \have_mstatush
> -       csrr    t0, CSR_MSTATUSH
> -       srli    t0, t0, MSTATUSH_GVA_SHIFT
> -       .else
> -       csrr    t0, CSR_MSTATUS
> -       srli    t0, t0, MSTATUS_GVA_SHIFT
> -       .endif
> -       and     t0, t0, 0x1
>  .else
>         REG_S   zero, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(tval2))(sp)
>         REG_S   zero, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(tinst))(sp)
>         add     t0, zero, zero
>  .endif
> -       REG_S   t0, (SBI_TRAP_REGS_SIZE + SBI_TRAP_INFO_OFFSET(gva))(sp)
>  .endm
>
>  .macro TRAP_CALL_C_ROUTINE
> @@ -720,7 +711,7 @@ _trap_handler:
>
>         TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0
>
> -       TRAP_SAVE_INFO 0 0
> +       TRAP_SAVE_INFO 0
>
>         TRAP_CALL_C_ROUTINE
>
> @@ -746,11 +737,7 @@ _trap_handler_hyp:
>
>         TRAP_SAVE_GENERAL_REGS_EXCEPT_SP_T0
>
> -#if __riscv_xlen == 32
> -       TRAP_SAVE_INFO 1 1
> -#else
> -       TRAP_SAVE_INFO 0 1
> -#endif
> +       TRAP_SAVE_INFO 1
>
>         TRAP_CALL_C_ROUTINE
>
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> index f7c170e..ff475ca 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -95,10 +95,8 @@
>  #define SBI_TRAP_INFO_tval2                    2
>  /** Index of tinst member in sbi_trap_info */
>  #define SBI_TRAP_INFO_tinst                    3
> -/** Index of gva member in sbi_trap_info */
> -#define SBI_TRAP_INFO_gva                      4
>  /** Last member index in sbi_trap_info */
> -#define SBI_TRAP_INFO_last                     5
> +#define SBI_TRAP_INFO_last                     4
>
>  /* clang-format on */
>
> @@ -206,8 +204,6 @@ struct sbi_trap_info {
>         unsigned long tval2;
>         /** tinst Trap instruction */
>         unsigned long tinst;
> -       /** gva Guest virtual address in tval flag */
> -       unsigned long gva;
>  };
>
>  /** Representation of trap context saved on stack */
> diff --git a/lib/sbi/sbi_expected_trap.S b/lib/sbi/sbi_expected_trap.S
> index 99dede5..6823c46 100644
> --- a/lib/sbi/sbi_expected_trap.S
> +++ b/lib/sbi/sbi_expected_trap.S
> @@ -22,14 +22,13 @@
>         .align 3
>         .global __sbi_expected_trap
>  __sbi_expected_trap:
> -       /* Without H-extension so, MTVAL2 and MTINST CSRs and GVA not available */
> +       /* Without H-extension so, MTVAL2 and MTINST CSRs not available */
>         csrr    a4, CSR_MCAUSE
>         REG_S   a4, SBI_TRAP_INFO_OFFSET(cause)(a3)
>         csrr    a4, CSR_MTVAL
>         REG_S   a4, SBI_TRAP_INFO_OFFSET(tval)(a3)
>         REG_S   zero, SBI_TRAP_INFO_OFFSET(tval2)(a3)
>         REG_S   zero, SBI_TRAP_INFO_OFFSET(tinst)(a3)
> -       REG_S   zero, SBI_TRAP_INFO_OFFSET(gva)(a3)
>         csrr    a4, CSR_MEPC
>         addi    a4, a4, 4
>         csrw    CSR_MEPC, a4
> @@ -38,7 +37,7 @@ __sbi_expected_trap:
>         .align 3
>         .global __sbi_expected_trap_hext
>  __sbi_expected_trap_hext:
> -       /* With H-extension so, MTVAL2 and MTINST CSRs and GVA available */
> +       /* With H-extension so, MTVAL2 and MTINST CSRs available */
>         csrr    a4, CSR_MCAUSE
>         REG_S   a4, SBI_TRAP_INFO_OFFSET(cause)(a3)
>         csrr    a4, CSR_MTVAL
> @@ -47,18 +46,6 @@ __sbi_expected_trap_hext:
>         REG_S   a4, SBI_TRAP_INFO_OFFSET(tval2)(a3)
>         csrr    a4, CSR_MTINST
>         REG_S   a4, SBI_TRAP_INFO_OFFSET(tinst)(a3)
> -
> -       /* Extract GVA bit from MSTATUS or MSTATUSH */
> -#if __riscv_xlen == 32
> -       csrr    a4, CSR_MSTATUSH
> -       srli    a4, a4, MSTATUSH_GVA_SHIFT
> -#else
> -       csrr    a4, CSR_MSTATUS
> -       srli    a4, a4, MSTATUS_GVA_SHIFT
> -#endif
> -       andi    a4, a4, 1
> -       REG_S   a4, SBI_TRAP_INFO_OFFSET(gva)(a3)
> -
>         csrr    a4, CSR_MEPC
>         addi    a4, a4, 4
>         csrw    CSR_MEPC, a4
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index 29c5d74..e912234 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -29,7 +29,6 @@ static int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
>         trap.tval = insn;
>         trap.tval2 = 0;
>         trap.tinst = 0;
> -       trap.gva   = 0;
>
>         return sbi_trap_redirect(regs, &trap);
>  }
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 83598a4..01077f2 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -146,7 +146,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>                 hstatus &= ~HSTATUS_SPV;
>                 hstatus |= (prev_virt) ? HSTATUS_SPV : 0;
>                 hstatus &= ~HSTATUS_GVA;
> -               hstatus |= (trap->gva) ? HSTATUS_GVA : 0;
> +               hstatus |= sbi_regs_gva(regs) ? HSTATUS_GVA : 0;
>                 csr_write(CSR_HSTATUS, hstatus);
>                 csr_write(CSR_HTVAL, trap->tval2);
>                 csr_write(CSR_HTINST, trap->tinst);
> --
> 2.43.0
>

