From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Sep 2023 16:22:11 +0530
Subject: [PATCH V2 2/3] platform: generic: allwinner: fix OF process for
 T-HEAD c9xx pmu
In-Reply-To: <IA1PR20MB495329723FF2AA4375D7861CBB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495351FBE86C63ECBB8764C7BB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20230815094033.593243-1-inochiama@outlook.com> <IA1PR20MB495329723FF2AA4375D7861CBB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy3D2Cj4Pu_d=fpUnZQN5YaSN87yxsv-2_QhY7_VBrBajQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 15, 2023 at 3:10?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> T-HEAD c9xx pmu needs to clear OV bits of MCOUNTEROF in any condition
> to avoid unnecessary OF interrupts.
>
> In addition, the S-mode SCOUNTEROF only have OF bit set when the related
> bits of MCOUNTERWEN is set, so also configure MCOUNTERWEN to allow kernel
> to access valid SCOUNTEROF.
>
> Signed-off-by: Haijiao Liu <haijiao.liu@sophgo.com>
> Co-authored-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  platform/generic/allwinner/sun20i-d1.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 0f0a9f3..f59b1e8 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -225,22 +225,23 @@ static int sun20i_d1_fdt_fixup(void *fdt, const struct fdt_match *match)
>
>  static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
>  {
> -       unsigned long mip_val;
> -
>         if (ctr_idx >= SBI_PMU_HW_CTR_MAX)
>                 return;
>
> -       mip_val = csr_read(CSR_MIP);
>         /**
>          * Clear out the OF bit so that next interrupt can be enabled.
> -        * This should be done only when the corresponding overflow interrupt
> -        * bit is cleared. That indicates that software has already handled the
> -        * previous interrupts or the hardware yet to set an overflow interrupt.
> -        * Otherwise, there will be race conditions where we may clear the bit
> -        * the software is yet to handle the interrupt.
> +        * This should be done before starting interrupt to avoid unexcepted
> +        * overflow interrupt.
>          */
> -       if (!(mip_val & THEAD_C9XX_MIP_MOIP))
> -               csr_clear(THEAD_C9XX_CSR_MCOUNTEROF, BIT(ctr_idx));
> +       csr_clear(THEAD_C9XX_CSR_MCOUNTEROF, BIT(ctr_idx));
> +
> +       /**
> +        * This register is described in C9xx document as the control register
> +        * for enabling writes to the superuser state counter. However, if the
> +        * corresponding bit is not set to 1, scounterof will always read as 0
> +        * when the counter register overflows.
> +        */
> +       csr_set(THEAD_C9XX_CSR_MCOUNTERWEN, BIT(ctr_idx));
>
>         /**
>          * SSCOFPMF uses the OF bit for enabling/disabling the interrupt,
> @@ -252,6 +253,10 @@ static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
>
>  static void thead_c9xx_pmu_ctr_disable_irq(uint32_t ctr_idx)
>  {
> +       /**
> +        * There is no need to clear the bit of mcounterwen, it will expire
> +        * after setting the csr mcountinhibit.
> +        */
>         csr_clear(THEAD_C9XX_CSR_MCOUNTERINTEN, BIT(ctr_idx));
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

