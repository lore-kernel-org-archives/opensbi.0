From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 17 Mar 2023 15:05:27 +0000
Subject: [PATCH v6] platform: generic: renesas: rzfive: Add SBI EXT to
 check for enabling IOCP errata
In-Reply-To: <20230315214558.20422-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230315214558.20422-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <ZBSBt40MV/rR704Q@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Prabhakar,

On Wed, Mar 15, 2023 at 09:45:58PM +0000, Lad Prabhakar wrote:
> I/O Coherence Port (IOCP) provides an AXI interface for connecting
> external non-caching masters, such as DMA controllers. The accesses
> from IOCP are coherent with D-Caches and L2 Cache.
> 
> IOCP is a specification option and is disabled on the Renesas RZ/Five
> SoC due to this reason IP blocks using DMA will fail.
> 
> As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> software. Firstly OpenSBI configures the memory region as
> "Memory, Non-cacheable, Bufferable" and passes this region as a global
> shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> allocations happen from this region and synchronization callbacks are
> implemented to synchronize when doing DMA transactions.
> 
> ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP errata
> should be applied to handle cache management.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v5->v6
> * Moved ANDES_SBI_EXT_IOCP_SW_WORKAROUND to andes_sbi.h
> * Moved helpers to check IOCP to common header so that we re-use code
> 
> v5:
> https://patchwork.ozlabs.org/project/opensbi/patch/20230213215111.32017-4-prabhakar.mahadev-lad.rj at bp.renesas.com/
> ---
>  platform/generic/include/andes/andes45.h   | 25 +++++++++++++++++--
>  platform/generic/include/andes/andes_sbi.h | 29 ++++++++++++++++++++++
>  platform/generic/renesas/rzfive/rzfive.c   | 20 +++++++++++++++
>  3 files changed, 72 insertions(+), 2 deletions(-)
>  create mode 100644 platform/generic/include/andes/andes_sbi.h
> 
> diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes45.h
> index 08b3d18..d5d265f 100644
> --- a/platform/generic/include/andes/andes45.h
> +++ b/platform/generic/include/andes/andes45.h
> @@ -4,7 +4,28 @@
>  #define CSR_MARCHID_MICROID 0xfff

>  /* Memory and Miscellaneous Registers */
> -#define CSR_MCACHE_CTL 0x7ca
> -#define CSR_MCCTLCOMMAND 0x7cc
> +#define CSR_MCACHE_CTL		0x7ca
> +#define CSR_MCCTLCOMMAND	0x7cc

Let's add a category here:
/* Configuration Control & Status Registers */
> +#define CSR_MICM_CFG		0xfc0
> +#define CSR_MDCM_CFG		0xfc1
> +#define CSR_MMSC_CFG		0xfc2
> +
> +#define MISA_20_OFFSET			20
> +#define MISA_20_MASK			(0x1 << MISA_20_OFFSET)
> +
> +#define MICM_CFG_ISZ_OFFSET		6
> +#define MICM_CFG_ISZ_MASK		(0x7  << MICM_CFG_ISZ_OFFSET)
> +
> +#define MDCM_CFG_DSZ_OFFSET		6
> +#define MDCM_CFG_DSZ_MASK		(0x7  << MDCM_CFG_DSZ_OFFSET)
> +
> +#define MMSC_CFG_CCTLCSR_OFFSET		16
> +#define MMSC_CFG_CCTLCSR_MASK		(0x1 << MMSC_CFG_CCTLCSR_OFFSET)
> +#define MMSC_IOCP_OFFSET			47
> +#define MMSC_IOCP_MASK			(0x1ULL << MMSC_IOCP_OFFSET)
> +
> +#define MCACHE_CTL_CCTL_SUEN_OFFSET	8
> +#define MCACHE_CTL_CCTL_SUEN_MASK	(0x1 << MCACHE_CTL_CCTL_SUEN_OFFSET)
> +
>  
>  #endif /* _RISCV_ANDES45_H */
> diff --git a/platform/generic/include/andes/andes_sbi.h b/platform/generic/include/andes/andes_sbi.h
> new file mode 100644
> index 0000000..332b7d2
> --- /dev/null
> +++ b/platform/generic/include/andes/andes_sbi.h
> @@ -0,0 +1,29 @@
> +#ifndef _RISCV_ANDES_SBI_H
> +#define _RISCV_ANDES_SBI_H
> +
> +#include <sbi/riscv_asm.h>
> +
> +#include "andes45.h"

-#include "andes45.h"
+#include <andes/andes45.h>

> +
> +#define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1

Let's define an enum and leave the first one empty for now,
and please rename the constants as SBI_EXT_ANDES_XXX:

-#define ANDES_SBI_EXT_IOCP_SW_WORKAROUND       1
+enum sbi_ext_andes_fid {
+       SBI_EXT_ANDES_FID0 = 0, /* Reserved for future use */
+       SBI_EXT_ANDES_IOCP_SW_WORKAROUND,
+};

> +
> +static bool andes45_cache_controlable(void)
> +{
> +	return (((csr_read(CSR_MICM_CFG) & MICM_CFG_ISZ_MASK) ||
> +		 (csr_read(CSR_MDCM_CFG) & MDCM_CFG_DSZ_MASK)) &&
> +		(csr_read(CSR_MISA) & MISA_20_MASK) &&

Sorry for not bringing this up earlier, this check on CSR_MISA can be
replaced with misa_extension('U') [1], so no need to define MISA_20_MASK

Thank you!
Peter Lin

[1] https://github.com/riscv-software-src/opensbi/blob/v1.2/include/sbi/riscv_asm.h#L171

> +		(csr_read(CSR_MMSC_CFG) & MMSC_CFG_CCTLCSR_MASK) &&
> +		(csr_read(CSR_MCACHE_CTL) & MCACHE_CTL_CCTL_SUEN_MASK));
> +}
> +
> +static bool andes45_iocp_disabled(void)
> +{
> +	return (csr_read(CSR_MMSC_CFG) & MMSC_IOCP_MASK) ? false : true;
> +}
> +
> +static bool andes45_apply_iocp_sw_workaround(void)
> +{
> +	return andes45_cache_controlable() & andes45_iocp_disabled();
> +}
> +
> +#endif /* _RISCV_ANDES_SBI_H */
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index 4d71d0d..0f5b693 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <andes/andes45_pma.h>
> +#include <andes/andes_sbi.h>
>  #include <platform_override.h>
>  #include <sbi/sbi_domain.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> @@ -28,6 +29,24 @@ static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *mat
>  					 array_size(renesas_rzfive_pma_regions));
>  }
>  
> +static int renesas_rzfive_vendor_ext_provider(long funcid,
> +					      const struct sbi_trap_regs *regs,
> +					      unsigned long *out_value,
> +					      struct sbi_trap_info *out_trap,
> +					      const struct fdt_match *match)
> +{
> +	switch (funcid) {
> +	case ANDES_SBI_EXT_IOCP_SW_WORKAROUND:
> +		*out_value = andes45_apply_iocp_sw_workaround();
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>  {
>  	/*
> @@ -55,4 +74,5 @@ const struct platform_override renesas_rzfive = {
>  	.match_table = renesas_rzfive_match,
>  	.early_init = renesas_rzfive_early_init,
>  	.final_init = renesas_rzfive_final_init,
> +	.vendor_ext_provider = renesas_rzfive_vendor_ext_provider,
>  };
> -- 
> 2.17.1
> 

