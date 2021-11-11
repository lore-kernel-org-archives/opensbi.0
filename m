From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 Nov 2021 18:14:55 +0530
Subject: [PATCH v5 05/12] lib: sbi: Support sscofpmf extension in OpenSBI
In-Reply-To: <20211108185307.389145-6-atish.patra@wdc.com>
References: <20211108185307.389145-1-atish.patra@wdc.com>
 <20211108185307.389145-6-atish.patra@wdc.com>
Message-ID: <CAAhSdy2z8jAUcg1_OFaz1c0J5jb723WJwBB-6YWurb9=vQjYFw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 9, 2021 at 12:23 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> This patch adds sscofpmf extension in pmu module which includes
> following things.
>
> 1. Enable overflow irq when starting a counter.
> 2. Setting the correct event filters passed from supervisor.
> 3. Delegating the overflow interrupt to the supervisor.
> 4. Add RV32 support for sscofpmf.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/riscv_encoding.h | 25 +++++++++++
>  lib/sbi/sbi_pmu.c            | 85 ++++++++++++++++++++++++++++++------
>  2 files changed, 97 insertions(+), 13 deletions(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index ca6343537eba..8a29f8e05c9a 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -173,6 +173,31 @@
>  #define HGATP_MODE_SHIFT               HGATP32_MODE_SHIFT
>  #endif
>
> +#if __riscv_xlen == 64
> +#define MHPMEVENT_OF                   (_UL(1) << 63)
> +#define MHPMEVENT_MINH                 (_UL(1) << 62)
> +#define MHPMEVENT_SINH                 (_UL(1) << 61)
> +#define MHPMEVENT_UINH                 (_UL(1) << 60)
> +#define MHPMEVENT_VSINH                        (_UL(1) << 59)
> +#define MHPMEVENT_VUINH                        (_UL(1) << 58)
> +#else
> +#define MHPMEVENTH_OF                  (_UL(1) << 31)
> +#define MHPMEVENTH_MINH                        (_ULL(1) << 30)
> +#define MHPMEVENTH_SINH                        (_ULL(1) << 29)
> +#define MHPMEVENTH_UINH                        (_ULL(1) << 28)
> +#define MHPMEVENTH_VSINH               (_ULL(1) << 27)
> +#define MHPMEVENTH_VUINH               (_ULL(1) << 26)
> +
> +#define MHPMEVENT_MINH                 (MHPMEVENTH_MINH << 32)
> +#define MHPMEVENT_SINH                 (MHPMEVENTH_SINH << 32)
> +#define MHPMEVENT_UINH                 (MHPMEVENTH_UINH << 32)
> +#define MHPMEVENT_VSINH                        (MHPMEVENTH_VSINH << 32)
> +#define MHPMEVENT_VUINH                        (MHPMEVENTH_VUINH << 32)
> +
> +#endif
> +
> +#define MHPMEVENT_SSCOF_MASK           _ULL(0xFFFF000000000000)
> +
>  /* ===== User-level CSRs ===== */
>
>  /* User Trap Setup (N-extension) */
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index c276a46e2876..eb0c2ff5d258 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -226,6 +226,42 @@ int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap)
>                                     SBI_PMU_EVENT_RAW_IDX, cmap, select);
>  }
>
> +static int pmu_ctr_enable_irq_hw(int ctr_idx)
> +{
> +       unsigned long mhpmevent_csr;
> +       unsigned long mhpmevent_curr;
> +       unsigned long mip_val;
> +       unsigned long of_mask;
> +
> +       if (ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
> +               return SBI_EFAIL;
> +
> +#if __riscv_xlen == 32
> +       mhpmevent_csr = CSR_MHPMEVENT3H  + ctr_idx - 3;
> +       of_mask = ~MHPMEVENTH_OF;
> +#else
> +       mhpmevent_csr = CSR_MHPMEVENT3 + ctr_idx - 3;
> +       of_mask = ~MHPMEVENT_OF;
> +#endif
> +
> +       mhpmevent_curr = csr_read_num(mhpmevent_csr);
> +       mip_val = csr_read(CSR_MIP);
> +       /**
> +        * Clear out the OF bit so that next interrupt can be enabled.
> +        * This should be done only when the corresponding overflow interrupt
> +        * bit is cleared. That indicates that software has already handled the
> +        * previous interrupts or the hardware yet to set an overflow interrupt.
> +        * Otherwise, there will be race conditions where we may clear the bit
> +        * the software is yet to handle the interrupt.
> +        */
> +       if (!(mip_val & MIP_LCOFIP)) {
> +               mhpmevent_curr &= of_mask;
> +               csr_write_num(mhpmevent_csr, mhpmevent_curr);
> +       }
> +
> +       return 0;
> +}
> +
>  static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
>  {
>  #if __riscv_xlen == 32
> @@ -241,6 +277,7 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>  {
>         unsigned long mctr_en = csr_read(CSR_MCOUNTEREN);
>         unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
>         /* Make sure the counter index lies within the range and is not TM bit */
>         if (cidx > num_hw_ctrs || cidx == 1)
> @@ -252,12 +289,14 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>         __set_bit(cidx, &mctr_en);
>         __clear_bit(cidx, &mctr_inhbt);
>
> -       if (ival_update)
> -               pmu_ctr_write_hw(cidx, ival);
> -
> +       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> +               pmu_ctr_enable_irq_hw(cidx);
>         csr_write(CSR_MCOUNTEREN, mctr_en);
>         csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
>
> +       if (ival_update)
> +               pmu_ctr_write_hw(cidx, ival);
> +
>         return 0;
>  }
>
> @@ -362,8 +401,21 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>         return ret;
>  }
>
> +static void pmu_update_inhibit_flags(unsigned long flags, uint64_t *mhpmevent_val)
> +{
> +       if (flags & SBI_PMU_CFG_FLAG_SET_VUINH)
> +               *mhpmevent_val |= MHPMEVENT_VUINH;
> +       if (flags & SBI_PMU_CFG_FLAG_SET_VSINH)
> +               *mhpmevent_val |= MHPMEVENT_VSINH;
> +       if (flags & SBI_PMU_CFG_FLAG_SET_UINH)
> +               *mhpmevent_val |= MHPMEVENT_UINH;
> +       if (flags & SBI_PMU_CFG_FLAG_SET_SINH)
> +               *mhpmevent_val |= MHPMEVENT_SINH;
> +}
> +
>  static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
> -                                   unsigned long eindex, uint64_t data)
> +                                  unsigned long flags, unsigned long eindex,
> +                                  uint64_t data)
>  {
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> @@ -375,17 +427,23 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
>         if (!mhpmevent_val || ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
>                 return SBI_EFAIL;
>
> -       /* TODO: The upper 16 bits of mhpmevent is reserved by sscofpmf extension.
> -        * Update those bits based on the flags received from supervisor.
> -        * The OVF bit also should be cleared here in case it was not cleared
> -        * during event stop.
> -        */
> -       csr_write_num(CSR_MCOUNTINHIBIT + ctr_idx, mhpmevent_val);
> +       /* Always clear the OVF bit and inhibit countin of events in M-mode */
> +       mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) | MHPMEVENT_MINH;
> +
> +       /* Update the inhibit flags based on inhibit flags received from supervisor */
> +       pmu_update_inhibit_flags(flags, &mhpmevent_val);
> +
> +#if __riscv_xlen == 32
> +       csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val & 0xFFFFFFFF);
> +       csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3, mhpmevent_val >> BITS_PER_LONG);
> +#else
> +       csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val);
> +#endif
>
>         return 0;
>  }
>
> -static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask,
> +static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned long flags,
>                            unsigned long event_idx, uint64_t data)
>  {
>         unsigned long ctr_mask;
> @@ -427,7 +485,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask,
>         if (ctr_idx == SBI_ENOTSUPP)
>                 return SBI_EFAIL;
>
> -       ret = pmu_update_hw_mhpmevent(temp, ctr_idx, event_idx, data);
> +       ret = pmu_update_hw_mhpmevent(temp, ctr_idx, flags, event_idx, data);
>
>         if (!ret)
>                 ret = ctr_idx;
> @@ -490,7 +548,8 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>                 /* Any firmware counter can be used track any firmware event */
>                 ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, hartid);
>         } else {
> -               ctr_idx = pmu_ctr_find_hw(cidx_base, cidx_mask, event_idx, event_data);
> +               ctr_idx = pmu_ctr_find_hw(cidx_base, cidx_mask, flags, event_idx,
> +                                         event_data);
>         }
>
>         if (ctr_idx < 0)
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

