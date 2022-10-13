From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 09:33:08 +0530
Subject: [PATCH v5 1/5] lib: sbi_pmu: move pmu irq information into pmu itself
In-Reply-To: <20221004164227.1381825-2-heiko@sntech.de>
References: <20221004164227.1381825-1-heiko@sntech.de> <20221004164227.1381825-2-heiko@sntech.de>
Message-ID: <CAAhSdy0PYWsubYuA6dU88LaGkTtYbo6dhsijiW5NnZ2c_ssHsw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 4, 2022 at 10:12 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Don't spread checking for pmu extensions through the code
> but instead introduce a sbi-pmu function that other code can
> call to get the correct information about the existence of the
> pmu interrupt.
>
> Add a sbi_pmu_device override function to allow overridung this
> bit as well if needed.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_pmu.h |  8 ++++++++
>  lib/sbi/sbi_hart.c    |  4 ++--
>  lib/sbi/sbi_pmu.c     | 12 ++++++++++++
>  3 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> index a2ce42d..c365243 100644
> --- a/include/sbi/sbi_pmu.h
> +++ b/include/sbi/sbi_pmu.h
> @@ -73,6 +73,11 @@ struct sbi_pmu_device {
>          * Note: 0 <= counter_index < SBI_PMU_HW_CTR_MAX
>          */
>         void (*hw_counter_disable_irq)(uint32_t counter_index);
> +
> +       /**
> +        * Custom function returning the machine-specific irq-bit.
> +        */
> +       int (*hw_counter_irq_bit)(void);
>  };
>
>  /** Get the PMU platform device */
> @@ -87,6 +92,9 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot);
>  /** Reset PMU during hart exit */
>  void sbi_pmu_exit(struct sbi_scratch *scratch);
>
> +/** Return the pmu irq bit depending on extension existence */
> +int sbi_pmu_irq_bit(void);
> +
>  /**
>   * Add the hardware event to counter mapping information. This should be called
>   * from the platform code to update the mapping table.
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 1294868..447f99e 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -19,6 +19,7 @@
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_math.h>
>  #include <sbi/sbi_platform.h>
> +#include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_trap.h>
>
> @@ -208,8 +209,7 @@ static int delegate_traps(struct sbi_scratch *scratch)
>
>         /* Send M-mode interrupts and most exceptions to S-mode */
>         interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
> -       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> -               interrupts |= MIP_LCOFIP;
> +       interrupts |= sbi_pmu_irq_bit();
>
>         exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
>                      (1U << CAUSE_USER_ECALL);
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 214d5e8..91d9ccc 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -344,6 +344,18 @@ skip_inhibit_update:
>         return 0;
>  }
>
> +int sbi_pmu_irq_bit(void)
> +{
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
> +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> +               return MIP_LCOFIP;
> +       if (pmu_dev && pmu_dev->hw_counter_irq_bit)
> +               return pmu_dev->hw_counter_irq_bit();
> +
> +       return 0;
> +}
> +
>  static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
>                             uint64_t ival, bool ival_update)
>  {
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

