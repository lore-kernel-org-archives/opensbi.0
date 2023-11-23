From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 22 Nov 2023 16:24:35 -0800
Subject: [PATCH v3 04/15] sbi: sbi_pmu: Add hw_counter_filter_mode() to
 pmu device
In-Reply-To: <20231122073617.379441-5-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com> <20231122073617.379441-5-peterlin@andestech.com>
Message-ID: <CAOnJCUK4_H=MeHsUUCDscVD+905k6uV9C3bUUpwuA+kTdsFYUw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 21, 2023 at 11:40?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Add support for custom PMU extensions to set inhibit bits
> on custom CSRs by introducing the PMU device callback
> hw_counter_filter_mode(). This allows the perf tool to
> restrict event counting under a specified privileged
> mode by appending a modifier, e.g. perf record -e event:k
> to count events only happening in kernel mode.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
> Changes v1 -> v2:
>   - No change
> Changes v2 -> v3:
>   - Add pmu_dev->hw_counter_filter_mode() in pmu_fixed_ctr_update_inhibit_bits()
> ---
>  include/sbi/sbi_pmu.h |  6 ++++++
>  lib/sbi/sbi_pmu.c     | 20 ++++++++++++++------
>  2 files changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index 16f6877..d63149c 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -89,6 +89,12 @@ struct sbi_pmu_device {
>          * Custom function returning the machine-specific irq-bit.
>          */
>         int (*hw_counter_irq_bit)(void);
> +
> +       /**
> +        * Custom function to inhibit counting of events while in
> +        * specified mode.
> +        */
> +       void (*hw_counter_filter_mode)(unsigned long flags, int counter_index);
>  };
>
>  /** Get the PMU platform device */
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 3cbd4ff..2f255de 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -599,7 +599,10 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
>                 pmu_dev->hw_counter_disable_irq(ctr_idx);
>
>         /* Update the inhibit flags based on inhibit flags received from supervisor */
> -       pmu_update_inhibit_flags(flags, &mhpmevent_val);
> +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> +               pmu_update_inhibit_flags(flags, &mhpmevent_val);
> +       if (pmu_dev && pmu_dev->hw_counter_filter_mode)
> +               pmu_dev->hw_counter_filter_mode(flags, ctr_idx);
>
>  #if __riscv_xlen == 32
>         csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val & 0xFFFFFFFF);
> @@ -620,7 +623,8 @@ static int pmu_fixed_ctr_update_inhibit_bits(int fixed_ctr, unsigned long flags)
>  #if __riscv_xlen == 32
>         uint64_t cfgh_csr_no;
>  #endif
> -       if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMCNTRPMF))
> +       if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMCNTRPMF) &&
> +               !sbi_hart_has_extension(scratch, SBI_HART_EXT_XANDESPMU))

Instead of adding a check for vendor extension, we can just check for
platform specific hw_counter_filter_mode() availability.
I would prefer to avoid any vendor specific code if possible. Ideally,
all vendor specific details should be abstracted out via pmu-dev.

>                 return fixed_ctr;
>
>         switch (fixed_ctr) {
> @@ -641,13 +645,17 @@ static int pmu_fixed_ctr_update_inhibit_bits(int fixed_ctr, unsigned long flags)
>         }
>
>         cfg_val |= MHPMEVENT_MINH;
> -       pmu_update_inhibit_flags(flags, &cfg_val);
> +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMCNTRPMF)) {
> +               pmu_update_inhibit_flags(flags, &cfg_val);
>  #if __riscv_xlen == 32
> -       csr_write_num(cfg_csr_no, cfg_val & 0xFFFFFFFF);
> -       csr_write_num(cfgh_csr_no, cfg_val >> BITS_PER_LONG);
> +               csr_write_num(cfg_csr_no, cfg_val & 0xFFFFFFFF);
> +               csr_write_num(cfgh_csr_no, cfg_val >> BITS_PER_LONG);
>  #else
> -       csr_write_num(cfg_csr_no, cfg_val);
> +               csr_write_num(cfg_csr_no, cfg_val);
>  #endif
> +       }
> +       if (pmu_dev && pmu_dev->hw_counter_filter_mode)
> +               pmu_dev->hw_counter_filter_mode(flags, fixed_ctr);
>         return fixed_ctr;
>  }
>
> --
> 2.34.1
>


--
Regards,
Atish

