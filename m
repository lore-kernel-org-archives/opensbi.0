From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Sat, 28 Jan 2023 11:04:09 +0800
Subject: [RFC PATCH v3 2/3] platform: generic: renesas: rzfive: Configure
 the PMA region
In-Reply-To: <20230126095832.21566-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230126095832.21566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230126095832.21566-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <Y9SQe/7gHygwnYxb@Thinkpad-L14>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 26, 2023 at 09:58:31AM +0000, Lad Prabhakar wrote:
> On the Renesas RZ/Five SoC by default we want to configure 128MiB of memory
> ranging from 0x58000000 as a non-cacheable + bufferable region in the PMA
> and populate this region as PMA reserve DT node with shared DMA pool and
> no-map flags set so that Linux drivers requesting any DMA'able memory go
> through this region.
> 
> PMA node passed to the above stack:
> 
>         reserved-memory {
>             #address-cells = <2>;
>             #size-cells = <2>;
>             ranges;
> 
>             pma_resv0 at 58000000 {
>                 compatible = "shared-dma-pool";
>                 reg = <0x0 0x58000000 0x0 0x08000000>;
>                 no-map;
>                 linux,dma-default;
>             };
>         };
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

Regards,
Peter Lin

> ---
>  platform/generic/Kconfig                 |  1 +
>  platform/generic/renesas/rzfive/rzfive.c | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 9ee9fe3..bc5c280 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -35,6 +35,7 @@ config PLATFORM_ANDES_AE350
>  
>  config PLATFORM_RENESAS_RZFIVE
>  	bool "Renesas RZ/Five support"
> +	select ANDES45_PMA
>  	default n
>  
>  config PLATFORM_SIFIVE_FU540
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index ee9c9c4..0a8c9f9 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -4,10 +4,30 @@
>   *
>   */
>  
> +#include <andes45-pma.h>
>  #include <platform_override.h>
>  #include <sbi/sbi_domain.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  
> +static const struct andes45_pma_region renesas_rzfive_pma_regions[] = {
> +	{
> +		.pa = 0x58000000,
> +		.size = 0x8000000,
> +		.flags = ANDES45_PMACFG_ETYP_NAPOT |
> +			 ANDES45_PMACFG_MTYP_MEM_NON_CACHE_BUF,
> +		.dt_populate = true,
> +		.shared_dma = true,
> +		.no_map = true,
> +		.dma_default = true,
> +	},
> +};
> +
> +static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *match)
> +{
> +	return andes45_pma_setup_regions(renesas_rzfive_pma_regions,
> +					 array_size(renesas_rzfive_pma_regions));
> +}
> +
>  int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>  {
>  	/*
> @@ -34,4 +54,5 @@ static const struct fdt_match renesas_rzfive_match[] = {
>  const struct platform_override renesas_rzfive = {
>  	.match_table = renesas_rzfive_match,
>  	.early_init = renesas_rzfive_early_init,
> +	.final_init = renesas_rzfive_final_init,
>  };
> -- 
> 2.17.1
> 

