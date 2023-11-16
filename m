From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 12:15:59 +0530
Subject: [PATCH v2 06/11] platform: rzfive: Enable Andes PMU for RZ/Five
In-Reply-To: <20231019113713.3508153-7-peterlin@andestech.com>
References: <20231019113713.3508153-1-peterlin@andestech.com> <20231019113713.3508153-7-peterlin@andestech.com>
Message-ID: <CAAhSdy28SqsNwqHacff-LEgpU7bGM5mBTqHMfgK4aAGt+sK0Ng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 19, 2023 at 5:10?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Enable Andes PMU extension support for RZ/Five.
> This patch also staticize renesas_rzfive_early_init() as
> it is not used outside of this unit.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
> Changes v1 -> v2:
>   - Implement renesas_rzfive_extensions_init()
>   - staticize renesas_rzfive_early_init()
> ---
>  platform/generic/Kconfig                 |  1 +
>  platform/generic/renesas/rzfive/rzfive.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 9b2f9c7..d6dafef 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -38,6 +38,7 @@ config PLATFORM_RENESAS_RZFIVE
>         bool "Renesas RZ/Five support"
>         select ANDES45_PMA
>         select ANDES_SBI
> +       select ANDES_PMU
>         default n
>
>  config PLATFORM_SIFIVE_FU540
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index a69797b..2f772c8 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -5,9 +5,11 @@
>   */
>
>  #include <andes/andes45_pma.h>
> +#include <andes/andes_pmu.h>
>  #include <andes/andes_sbi.h>
>  #include <platform_override.h>
>  #include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>
>  static const struct andes45_pma_region renesas_rzfive_pma_regions[] = {
> @@ -29,7 +31,7 @@ static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *mat
>                                          array_size(renesas_rzfive_pma_regions));
>  }
>
> -int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
> +static int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>  {
>         /*
>          * Renesas RZ/Five RISC-V SoC has Instruction local memory and
> @@ -47,6 +49,17 @@ int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>                                             SBI_DOMAIN_MEMREGION_M_RWX);
>  }
>
> +static int renesas_rzfive_extensions_init(const struct fdt_match *match,
> +                         struct sbi_hart_features *hfeatures)
> +{
> +       int rc;
> +       rc = andes_pmu_init();
> +       if (rc && rc != SBI_ENOTSUPP)
> +               return rc;
> +
> +       return 0;
> +}
> +
>  static const struct fdt_match renesas_rzfive_match[] = {
>         { .compatible = "renesas,r9a07g043f01" },
>         { /* sentinel */ }
> @@ -57,4 +70,5 @@ const struct platform_override renesas_rzfive = {
>         .early_init = renesas_rzfive_early_init,
>         .final_init = renesas_rzfive_final_init,
>         .vendor_ext_provider = andes_sbi_vendor_ext_provider,
> +       .extensions_init = renesas_rzfive_extensions_init,

Same comment as PATCH5.

>  };
> --
> 2.34.1
>

Regards,
Anup

