From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 12:15:20 +0530
Subject: [PATCH v2 05/11] platform: andes: Enable Andes PMU for AE350
In-Reply-To: <20231019113713.3508153-6-peterlin@andestech.com>
References: <20231019113713.3508153-1-peterlin@andestech.com> <20231019113713.3508153-6-peterlin@andestech.com>
Message-ID: <CAAhSdy13q-i0xiEEqJxE3a7SguUHuW+Sp2SPiVPGLVC7CEM9rQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 19, 2023 at 5:10?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Enable Andes PMU extension support for AE350 platforms.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
> Changes v1 -> v2:
>   - Implement ae350_extensions_init()
> ---
>  platform/generic/Kconfig       |  1 +
>  platform/generic/andes/ae350.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index e7bd94e..9b2f9c7 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -31,6 +31,7 @@ config PLATFORM_ALLWINNER_D1
>  config PLATFORM_ANDES_AE350
>         bool "Andes AE350 support"
>         select SYS_ATCSMU
> +       select ANDES_PMU
>         default n
>
>  config PLATFORM_RENESAS_RZFIVE
> diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
> index 80eca05..c3f280d 100644
> --- a/platform/generic/andes/ae350.c
> +++ b/platform/generic/andes/ae350.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include <platform_override.h>
> +#include <andes/andes_pmu.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/fdt/fdt_fixup.h>
>  #include <sbi_utils/sys/atcsmu.h>
> @@ -110,6 +111,17 @@ static int ae350_final_init(bool cold_boot, const struct fdt_match *match)
>         return 0;
>  }
>
> +static int ae350_extensions_init(const struct fdt_match *match,
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
>  static const struct fdt_match andes_ae350_match[] = {
>         { .compatible = "andestech,ae350" },
>         { },
> @@ -118,4 +130,5 @@ static const struct fdt_match andes_ae350_match[] = {
>  const struct platform_override andes_ae350 = {
>         .match_table = andes_ae350_match,
>         .final_init  = ae350_final_init,
> +       .extensions_init = ae350_extensions_init,

This is not the right way.

Add a new callback pmu_init() in "struct platform_override" and
implement that here.

The generic_pmu_init() will call pmu_init() in "struct platform_override"
if it is available otherwise it will call fdt_pmu_setup().

>  };
> --
> 2.34.1
>

Regards,
Anup

