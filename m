From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Aug 2023 13:43:13 +0530
Subject: [PATCH V2] platform: generic: allwinner: correct mhpmevent count
In-Reply-To: <IA1PR20MB495378594DF776E8E6CB8E53BB10A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495378594DF776E8E6CB8E53BB10A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy0CZdNCuNRFp3NbtSFLAWeUGP-x5Gi0aiZ3pgMKRtGMNQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 11, 2023 at 5:43?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Only the CSR mhpmevent 3-9,13-17 of D1 have valid function, so change
> the mhpm_mask to a valid value to avoid invalid usage.
>
> Due to the openc906 pmu code
> https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup


> ---
> The fix code of T-HEAD C9xx PMU will arrive soon in a few days. This patch
> is submitted for code cleanup
> ---
>  platform/generic/allwinner/sun20i-d1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 0f0a9f3..03cb92c 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -272,7 +272,8 @@ static int sun20i_d1_extensions_init(const struct fdt_match *match,
>         sbi_pmu_set_device(&thead_c9xx_pmu_device);
>
>         /* auto-detection doesn't work on t-head c9xx cores */
> -       hfeatures->mhpm_count = 29;
> +       /* D1 has 29 mhpmevent csrs, but only 3-9,13-17 have valid value */
> +       hfeatures->mhpm_mask = 0x0003e3f8;
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

