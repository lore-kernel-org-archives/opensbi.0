From: Anup Patel <anup@brainfault.org>
Date: Sat, 2 Mar 2024 18:37:52 +0530
Subject: [PATCH v3 4/6] lib: sbi: abstract out insn decoding to unify mem
 fault handlers
In-Reply-To: <1709378725-56656-5-git-send-email-ganboing@gmail.com>
References: <1709378725-56656-1-git-send-email-ganboing@gmail.com> <1709378725-56656-5-git-send-email-ganboing@gmail.com>
Message-ID: <CAAhSdy3r8dJcAyTF0FPViHU4ET2QL7t5zjjo1gXR=b7Sd4vCkA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 2, 2024 at 4:55?PM Bo Gan <ganboing@gmail.com> wrote:
>
> This patch abstracts out the instruction decoding part of misaligned ld/st
> fault handlers, so it can be reused by ld/st access fault handlers.
> Also Added lb/lbu/sb decoding. (previously unreachable by misaligned fault)
>
> sbi_trap_emulate_load/store is now the common handler which takes a `emu`
> parameter that is responsible for emulating the misaligned or access fault.
> The `emu` callback is expected to fixup the fault, and based on the return
> code of `emu`, sbi_trap_emulate_load/store will:
>
>   r/wlen => the fixup is successful and regs/mepc needs to be updated.
>   0      => the fixup is successful, but regs/mepc should be left untouched
>             (this is usually used if `emu` does `sbi_trap_redirect`)
>   -err   => failed, sbi_trap_error will be called
>
> For now, load/store access faults are blindly redirected. It will be
> enhanced in the following patches.
>
> Signed-off-by: Bo Gan <ganboing@gmail.com>
> ---
>  include/sbi/sbi_trap_ldst.h |  48 +++++++++++--
>  lib/sbi/sbi_trap.c          |  34 ++++++----
>  lib/sbi/sbi_trap_ldst.c     | 162 +++++++++++++++++++++++++++-----------------
>  3 files changed, 165 insertions(+), 79 deletions(-)
>
> diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
> index 9bbd237..646b242 100644
> --- a/include/sbi/sbi_trap_ldst.h
> +++ b/include/sbi/sbi_trap_ldst.h
> @@ -11,13 +11,51 @@
>  #define __SBI_TRAP_LDST_H__
>
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_trap.h>
>
> -struct sbi_trap_regs;
> +union sbi_reg_data {
> +       u64 data_u64;
> +       u32 data_u32;
> +       u8 data_bytes[8];
> +       ulong data_ulong;
> +};

Again misleading name.

s/sbi_reg_data/sbi_ldst_data/

>
> -int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
> -                               struct sbi_trap_regs *regs);
> +/**
> + * Load emulator callback:
> + *
> + * @return rlen=success, 0=success w/o regs modification, or negative error
> + */
> +typedef int (*sbi_trap_ld_emulator)(int rlen, union sbi_reg_data *out_val,
> +                                   struct sbi_trap_regs *regs,
> +                                   const struct sbi_trap_info *orig_trap);
>
> -int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
> -                                struct sbi_trap_regs *regs);
> +/**
> + * Store emulator callback:
> + *
> + * @return wlen=success, 0=success w/o regs modification, or negative error
> + */
> +typedef int (*sbi_trap_st_emulator)(int wlen, union sbi_reg_data in_val,
> +                                   struct sbi_trap_regs *regs,
> +                                   const struct sbi_trap_info *orig_trap);
> +
> +int sbi_trap_emulate_load(struct sbi_trap_regs *regs,
> +                         const struct sbi_trap_info *orig_trap,
> +                         sbi_trap_ld_emulator emu);
> +
> +int sbi_trap_emulate_store(struct sbi_trap_regs *regs,
> +                          const struct sbi_trap_info *orig_trap,
> +                          sbi_trap_st_emulator emu);

The load store emulation should be contained totally inside
sbi_trap_ldst.c so sbi_trap_emulate_load() and
sbi_trap_emulate_store() should never be exposed to
other parts of OpenSBI.

> +
> +int sbi_misaligned_load_handler(struct sbi_trap_regs *regs,
> +                               const struct sbi_trap_info *orig_trap);
> +
> +int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
> +                                const struct sbi_trap_info *orig_trap);

Chaning prototype of sbi_misaligned_load_handler() and
sbi_misaligned_store_handler() should be a separate patch.

> +
> +int sbi_load_fault_handler(struct sbi_trap_regs *regs,
> +                          const struct sbi_trap_info *orig_trap);
> +
> +int sbi_store_fault_handler(struct sbi_trap_regs *regs,
> +                           const struct sbi_trap_info *orig_trap);

Misleading names.

This functions should be sbi_load_access_handler() and
sbi_store_access_handler() to have consistent naming with
corresponding misaligned load/store handling functions.

>
>  #endif
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 1024981..eb4cc0f 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -285,6 +285,13 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>                 }
>                 return regs;
>         }
> +       /* Original trap_info */
> +       trap.epc   = regs->mepc;
> +       trap.cause = mcause;
> +       trap.tval  = mtval;
> +       trap.tval2 = mtval2;
> +       trap.tinst = mtinst;
> +       trap.gva   = sbi_regs_gva(regs);
>
>         switch (mcause) {
>         case CAUSE_ILLEGAL_INSTRUCTION:
> @@ -292,11 +299,13 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>                 msg = "illegal instruction handler failed";
>                 break;
>         case CAUSE_MISALIGNED_LOAD:
> -               rc = sbi_misaligned_load_handler(mtval, mtval2, mtinst, regs);
> +               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_LOAD);
> +               rc  = sbi_misaligned_load_handler(regs, &trap);
>                 msg = "misaligned load handler failed";
>                 break;
>         case CAUSE_MISALIGNED_STORE:
> -               rc  = sbi_misaligned_store_handler(mtval, mtval2, mtinst, regs);
> +               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_STORE);
> +               rc  = sbi_misaligned_store_handler(regs, &trap);
>                 msg = "misaligned store handler failed";
>                 break;
>         case CAUSE_SUPERVISOR_ECALL:
> @@ -305,20 +314,19 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>                 msg = "ecall handler failed";
>                 break;
>         case CAUSE_LOAD_ACCESS:
> +               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_LOAD);
> +               rc  = sbi_load_fault_handler(regs, &trap);
> +               msg = "load fault handler failed";
> +               break;
>         case CAUSE_STORE_ACCESS:
> -               sbi_pmu_ctr_incr_fw(mcause == CAUSE_LOAD_ACCESS ?
> -                       SBI_PMU_FW_ACCESS_LOAD : SBI_PMU_FW_ACCESS_STORE);
> -               /* fallthrough */
> +               sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_STORE);
> +               rc  = sbi_store_fault_handler(regs, &trap);
> +               msg = "store fault handler failed";
> +               break;
>         default:
>                 /* If the trap came from S or U mode, redirect it there */
> -               trap.epc = regs->mepc;
> -               trap.cause = mcause;
> -               trap.tval = mtval;
> -               trap.tval2 = mtval2;
> -               trap.tinst = mtinst;
> -               trap.gva   = sbi_regs_gva(regs);
> -
> -               rc = sbi_trap_redirect(regs, &trap);
> +               msg = "trap redirect failed";
> +               rc  = sbi_trap_redirect(regs, &trap);
>                 break;
>         }
>
> diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
> index be9a394..5516954 100644
> --- a/lib/sbi/sbi_trap_ldst.c
> +++ b/lib/sbi/sbi_trap_ldst.c
> @@ -16,12 +16,6 @@
>  #include <sbi/sbi_trap.h>
>  #include <sbi/sbi_unpriv.h>
>
> -union reg_data {
> -       u8 data_bytes[8];
> -       ulong data_ulong;
> -       u64 data_u64;
> -};
> -
>  static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
>                                         ulong addr_offset)
>  {
> @@ -34,23 +28,22 @@ static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
>                 return orig_tinst | (addr_offset << SH_RS1);
>  }
>
> -int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
> -                               struct sbi_trap_regs *regs)
> +int sbi_trap_emulate_load(struct sbi_trap_regs *regs,
> +                         const struct sbi_trap_info *orig_trap,
> +                         sbi_trap_ld_emulator emu)
>  {
>         ulong insn, insn_len;
> -       union reg_data val;
> +       union sbi_reg_data val = { 0 };
>         struct sbi_trap_info uptrap;
> -       int i, fp = 0, shift = 0, len = 0;
> +       int rc, fp = 0, shift = 0, len = 0;
>
> -       sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_LOAD);
> -
> -       if (tinst & 0x1) {
> +       if (orig_trap->tinst & 0x1) {
>                 /*
>                  * Bit[0] == 1 implies trapped instruction value is
>                  * transformed instruction or custom instruction.
>                  */
> -               insn = tinst | INSN_16BIT_MASK;
> -               insn_len = (tinst & 0x2) ? INSN_LEN(insn) : 2;
> +               insn     = orig_trap->tinst | INSN_16BIT_MASK;
> +               insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
>         } else {
>                 /*
>                  * Bit[0] == 0 implies trapped instruction value is
> @@ -64,7 +57,12 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
>                 insn_len = INSN_LEN(insn);
>         }
>
> -       if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
> +       if ((insn & INSN_MASK_LB) == INSN_MATCH_LB) {
> +               len   = 1;
> +               shift = 8 * (sizeof(ulong) - len);
> +       } else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
> +               len = 1;
> +       } else if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
>                 len   = 4;
>                 shift = 8 * (sizeof(ulong) - len);
>  #if __riscv_xlen == 64
> @@ -124,26 +122,13 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
>  #endif
>  #endif
>         } else {
> -               uptrap.epc = regs->mepc;
> -               uptrap.cause = CAUSE_MISALIGNED_LOAD;
> -               uptrap.tval = addr;
> -               uptrap.tval2 = tval2;
> -               uptrap.tinst = tinst;
> -               uptrap.gva   = sbi_regs_gva(regs);
> -               return sbi_trap_redirect(regs, &uptrap);
> +               return sbi_trap_redirect(regs, orig_trap);
>         }
>
> -       val.data_u64 = 0;
> -       for (i = 0; i < len; i++) {
> -               val.data_bytes[i] = sbi_load_u8((void *)(addr + i),
> -                                               &uptrap);
> -               if (uptrap.cause) {
> -                       uptrap.epc = regs->mepc;
> -                       uptrap.tinst = sbi_misaligned_tinst_fixup(
> -                               tinst, uptrap.tinst, i);
> -                       return sbi_trap_redirect(regs, &uptrap);
> -               }
> -       }
> +       rc = emu(len, &val, regs, orig_trap);
> +
> +       if (rc <= 0)
> +               return rc;
>
>         if (!fp)
>                 SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
> @@ -159,23 +144,22 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
>         return 0;
>  }
>
> -int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
> -                                struct sbi_trap_regs *regs)
> +int sbi_trap_emulate_store(struct sbi_trap_regs *regs,
> +                          const struct sbi_trap_info *orig_trap,
> +                          sbi_trap_st_emulator emu)
>  {
>         ulong insn, insn_len;
> -       union reg_data val;
> +       union sbi_reg_data val;
>         struct sbi_trap_info uptrap;
> -       int i, len = 0;
> +       int rc, len = 0;
>
> -       sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_STORE);
> -
> -       if (tinst & 0x1) {
> +       if (orig_trap->tinst & 0x1) {
>                 /*
>                  * Bit[0] == 1 implies trapped instruction value is
>                  * transformed instruction or custom instruction.
>                  */
> -               insn = tinst | INSN_16BIT_MASK;
> -               insn_len = (tinst & 0x2) ? INSN_LEN(insn) : 2;
> +               insn     = orig_trap->tinst | INSN_16BIT_MASK;
> +               insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
>         } else {
>                 /*
>                  * Bit[0] == 0 implies trapped instruction value is
> @@ -191,7 +175,9 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
>
>         val.data_ulong = GET_RS2(insn, regs);
>
> -       if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
> +       if ((insn & INSN_MASK_SB) == INSN_MATCH_SB) {
> +               len = 1;
> +       } else if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
>                 len = 4;
>  #if __riscv_xlen == 64
>         } else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
> @@ -238,27 +224,81 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
>  #endif
>  #endif
>         } else {
> -               uptrap.epc = regs->mepc;
> -               uptrap.cause = CAUSE_MISALIGNED_STORE;
> -               uptrap.tval = addr;
> -               uptrap.tval2 = tval2;
> -               uptrap.tinst = tinst;
> -               uptrap.gva   = sbi_regs_gva(regs);
> -               return sbi_trap_redirect(regs, &uptrap);
> +               return sbi_trap_redirect(regs, orig_trap);
>         }
>
> -       for (i = 0; i < len; i++) {
> -               sbi_store_u8((void *)(addr + i), val.data_bytes[i],
> -                            &uptrap);
> -               if (uptrap.cause) {
> -                       uptrap.epc = regs->mepc;
> -                       uptrap.tinst = sbi_misaligned_tinst_fixup(
> -                               tinst, uptrap.tinst, i);
> -                       return sbi_trap_redirect(regs, &uptrap);
> -               }
> -       }
> +       rc = emu(len, val, regs, orig_trap);
> +
> +       if (rc <= 0)
> +               return rc;
>
>         regs->mepc += insn_len;
>
>         return 0;
>  }
> +
> +static int sbi_misaligned_ld_emulator(int rlen, union sbi_reg_data *out_val,
> +                                     struct sbi_trap_regs *regs,
> +                                     const struct sbi_trap_info *orig_trap)
> +{
> +       struct sbi_trap_info uptrap;
> +       int i;
> +
> +       for (i = 0; i < rlen; i++) {
> +               out_val->data_bytes[i] =
> +                       sbi_load_u8((void *)(orig_trap->tval + i), &uptrap);
> +               if (uptrap.cause) {
> +                       uptrap.epc   = regs->mepc;
> +                       uptrap.tinst = sbi_misaligned_tinst_fixup(
> +                               orig_trap->tinst, uptrap.tinst, i);
> +                       return sbi_trap_redirect(regs, &uptrap);
> +               }
> +       }
> +       return rlen;
> +}
> +
> +int sbi_misaligned_load_handler(struct sbi_trap_regs *regs,
> +                               const struct sbi_trap_info *orig_trap)
> +{
> +       return sbi_trap_emulate_load(regs, orig_trap,
> +                                    sbi_misaligned_ld_emulator);
> +}
> +
> +static int sbi_misaligned_st_emulator(int wlen, union sbi_reg_data in_val,
> +                                     struct sbi_trap_regs *regs,
> +                                     const struct sbi_trap_info *orig_trap)
> +{
> +       struct sbi_trap_info uptrap;
> +       int i;
> +
> +       for (i = 0; i < wlen; i++) {
> +               sbi_store_u8((void *)(orig_trap->tval + i),
> +                            in_val.data_bytes[i], &uptrap);
> +               if (uptrap.cause) {
> +                       uptrap.epc   = regs->mepc;
> +                       uptrap.tinst = sbi_misaligned_tinst_fixup(
> +                               orig_trap->tinst, uptrap.tinst, i);
> +                       return sbi_trap_redirect(regs, &uptrap);
> +               }
> +       }
> +       return wlen;
> +}
> +
> +int sbi_misaligned_store_handler(struct sbi_trap_regs *regs,
> +                                const struct sbi_trap_info *orig_trap)
> +{
> +       return sbi_trap_emulate_store(regs, orig_trap,
> +                                     sbi_misaligned_st_emulator);
> +}
> +
> +int sbi_load_fault_handler(struct sbi_trap_regs *regs,
> +                          const struct sbi_trap_info *orig_trap)
> +{
> +       return sbi_trap_redirect(regs, orig_trap);
> +}
> +
> +int sbi_store_fault_handler(struct sbi_trap_regs *regs,
> +                           const struct sbi_trap_info *orig_trap)
> +{
> +       return sbi_trap_redirect(regs, orig_trap);
> +}
> --
> 2.7.4
>

Regards,
Anup

