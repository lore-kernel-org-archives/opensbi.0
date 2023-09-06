From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Sep 2023 16:26:40 +0530
Subject: [PATCH V2 1/3] lib: sbi_pmu: ensure update hpm counter before
 starting counting
In-Reply-To: <IA1PR20MB4953E5CF5C492A2612CDFD69BB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495351FBE86C63ECBB8764C7BB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E5CF5C492A2612CDFD69BB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy2OG+E9rb+Z0+mtLgFPn3B15fWFm6GAYpkKszD_DBCONA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 15, 2023 at 3:10?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> When detecting features of PMU, the hpm counter may be written to some
> value, this will cause some unexpected behavior in some cases. So ensure
> the hpm counter is updated before starting the counter and the related
> interrupt.
>
> Signed-off-by: Haijiao Liu <haijiao.liu@sophgo.com>
> Co-authored-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_pmu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index adb9f18..2904903 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -353,8 +353,11 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>         if (cidx >= num_hw_ctrs || cidx == 1)
>                 return SBI_EINVAL;
>
> -       if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
> -               goto skip_inhibit_update;
> +       if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11) {
> +               if (ival_update)
> +                       pmu_ctr_write_hw(cidx, ival);
> +               return 0;
> +       }
>
>         /*
>          * Some of the hardware may not support mcountinhibit but perf stat
> @@ -368,14 +371,13 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>
>         if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
>                 pmu_ctr_enable_irq_hw(cidx);
> +       if (ival_update)
> +               pmu_ctr_write_hw(cidx, ival);
>         if (pmu_dev && pmu_dev->hw_counter_enable_irq)
>                 pmu_dev->hw_counter_enable_irq(cidx);
> +
>         csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
>
> -skip_inhibit_update:
> -       if (ival_update)
> -               pmu_ctr_write_hw(cidx, ival);
> -
>         return 0;
>  }
>
> --
> 2.41.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

