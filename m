From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 23 Nov 2023 08:56:19 -0800
Subject: [PATCH v3 09/15] platform: rzfive: Enable Andes PMU for RZ/Five
In-Reply-To: <20231122073617.379441-10-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com> <20231122073617.379441-10-peterlin@andestech.com>
Message-ID: <CAOnJCUJvFbqhvW=ro6SqN8VNf34+B_=yEsse-ONUHXqa4xz4OA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 21, 2023 at 11:40?PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Enable Andes PMU extension support for RZ/Five.
> We also staticize renesas_rzfive_early_init() as
> it is not used outside of this unit.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
> Changes v1 -> v2:
>   - Implement renesas_rzfive_extensions_init()
>   - staticize renesas_rzfive_early_init()
> Changes v2 -> v3:
>   - Use the andes_pmu_extensions_init() and andes_pmu_init() provided by andes_pmu.c
>     We have no plan to introduce other extensions in near future so extensions_init()
>     bind with andes_pmu_extensions_init() directly.
> ---
>  platform/generic/Kconfig                 | 1 +
>  platform/generic/renesas/rzfive/rzfive.c | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 89e5603..c9b6011 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -39,6 +39,7 @@ config PLATFORM_RENESAS_RZFIVE
>         bool "Renesas RZ/Five support"
>         select ANDES45_PMA
>         select ANDES_SBI
> +       select ANDES_PMU
>         default n
>
>  config PLATFORM_SIFIVE_FU540
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index a69797b..b5b5e65 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <andes/andes45_pma.h>
> +#include <andes/andes_pmu.h>
>  #include <andes/andes_sbi.h>
>  #include <platform_override.h>
>  #include <sbi/sbi_domain.h>
> @@ -29,7 +30,7 @@ static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *mat
>                                          array_size(renesas_rzfive_pma_regions));
>  }
>
> -int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
> +static int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>  {
>         /*
>          * Renesas RZ/Five RISC-V SoC has Instruction local memory and
> @@ -57,4 +58,6 @@ const struct platform_override renesas_rzfive = {
>         .early_init = renesas_rzfive_early_init,
>         .final_init = renesas_rzfive_final_init,
>         .vendor_ext_provider = andes_sbi_vendor_ext_provider,
> +       .extensions_init = andes_pmu_extensions_init,
> +       .pmu_init = andes_pmu_init,
>  };
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

