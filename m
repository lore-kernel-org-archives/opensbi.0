From: Guo Ren <guoren@kernel.org>
Date: Sat, 12 Aug 2023 20:05:27 +0800
Subject: [PATCH 1/2] lib: sbi_pmu: ensure update hpm counter before
 starting counting
In-Reply-To: <IA1PR20MB4953986E48B958892D981FBFBB11A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953955F17C7517BE21B0E7CBB11A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953986E48B958892D981FBFBB11A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAJF2gTQU4Yr4Dc9-PeOzA=NKcj+-LyOBu81Hn1z=e3jWULqLxg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Junqiang,

Could you help test this patch series on unmatched?

On Sat, Aug 12, 2023 at 1:06?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> From: "haijiao.liu at sophgo.com" <haijiao.liu@sophgo.com>
>
> When detecting features of PMU, the hpm counter may be written to some
> value, this will cause some unexpected behavior in some cases. So ensure
> the hpm counter is updated before starting the counter.
>
> Signed-off-by: haijiao.liu at sophgo.com <haijiao.liu@sophgo.com>
> ---
>  lib/sbi/sbi_pmu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index adb9f18..f5507f2 100644
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
> @@ -370,12 +373,12 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
>                 pmu_ctr_enable_irq_hw(cidx);
>         if (pmu_dev && pmu_dev->hw_counter_enable_irq)
>                 pmu_dev->hw_counter_enable_irq(cidx);
> -       csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
>
> -skip_inhibit_update:
>         if (ival_update)
>                 pmu_ctr_write_hw(cidx, ival);
>
> +       csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
> +
>         return 0;
>  }
>
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren

