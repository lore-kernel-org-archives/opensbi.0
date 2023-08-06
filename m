From: Anup Patel <anup@brainfault.org>
Date: Sun, 6 Aug 2023 10:33:46 +0530
Subject: [PATCH] platform: generic: allwinner: correct mhpmevent count
In-Reply-To: <IA1PR20MB495331314E453C7E9822C88ABB08A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495331314E453C7E9822C88ABB08A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy07+GW5Oh1WogSFYMD45fwm7G1Ej4Wq2SWZFF_c+ekkzA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 3, 2023 at 7:20?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Only the CSR mhpmevent 3-9,13-17 of D1 have valid function, so reduce
> the mhpm_count to 15 to avoid invalid usage.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  platform/generic/allwinner/sun20i-d1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 0f0a9f3..94a3a5e 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -272,7 +272,8 @@ static int sun20i_d1_extensions_init(const struct fdt_match *match,
>         sbi_pmu_set_device(&thead_c9xx_pmu_device);
>
>         /* auto-detection doesn't work on t-head c9xx cores */
> -       hfeatures->mhpm_count = 29;
> +       /* D1 has 29 mhpmevent csrs, but only 3-9,13-17 have valid value */
> +       hfeatures->mhpm_count = 15;

With the latest non-contiguous counter support, we need to set
mhpm_mask as well.
I have taken care of this at the time of merging this patch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>         hfeatures->mhpm_bits = 64;
>
>         return 0;
> --
> 2.41.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

