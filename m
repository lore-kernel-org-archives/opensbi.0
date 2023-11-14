From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Nov 2023 21:55:35 +0530
Subject: [PATCH v3 4/4] platform: generic: thead: initialize PMU by
 default in thead generic platform
In-Reply-To: <IA1PR20MB49536E28A3FC24C353A8DC04BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49534E329372B295663B2153BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231007030631.101073-1-inochiama@outlook.com> <IA1PR20MB49536E28A3FC24C353A8DC04BBC8A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy2wUoS6EBFiATeZfWjft9NdSrWzn9r+Z3p8-XJyAhuw=A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 7, 2023 at 8:37?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Since all the SoC with thead c9xx cores need this initialization at now,
> initialize the c9xx pmu in the thead generic platform by default.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/Kconfig               |  1 +
>  platform/generic/thead/thead-generic.c | 13 +++++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 3be75cf..f9e7ed2 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -56,6 +56,7 @@ config PLATFORM_STARFIVE_JH7110
>  config PLATFORM_THEAD
>         bool "THEAD C9xx support"
>         select THEAD_C9XX_ERRATA
> +       select THEAD_C9XX_PMU
>         default n
>
>  source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
> diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
> index c77140c..72f4aaa 100644
> --- a/platform/generic/thead/thead-generic.c
> +++ b/platform/generic/thead/thead-generic.c
> @@ -8,6 +8,7 @@
>
>  #include <platform_override.h>
>  #include <thead/c9xx_errata.h>
> +#include <thead/c9xx_pmu.h>
>  #include <sbi/sbi_const.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
> @@ -29,6 +30,13 @@ static int thead_generic_early_init(bool cold_boot,
>         return 0;
>  }
>
> +static int thead_generic_extensions_init(const struct fdt_match *match,
> +                                        struct sbi_hart_features *hfeatures)
> +{
> +       thead_c9xx_register_pmu_device();
> +       return 0;
> +}
> +
>  static struct thead_generic_quirks thead_th1520_quirks = {
>         .errata = THEAD_QUIRK_ERRATA_TLB_FLUSH,
>  };
> @@ -39,6 +47,7 @@ static const struct fdt_match thead_generic_match[] = {
>  };
>
>  const struct platform_override thead_generic = {
> -       .match_table    = thead_generic_match,
> -       .early_init     = thead_generic_early_init,
> +       .match_table            = thead_generic_match,
> +       .early_init             = thead_generic_early_init,
> +       .extensions_init        = thead_generic_extensions_init,
>  };
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

