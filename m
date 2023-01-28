From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Sat, 28 Jan 2023 11:27:47 +0800
Subject: [RFC PATCH v3 3/3] platform: generic: renesas: rzfive: Add SBI
 EXT to check for enabling IOCP errata
In-Reply-To: <20230126095832.21566-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230126095832.21566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230126095832.21566-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <Y9SWMzl9+wXV52V2@Thinkpad-L14>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Prabhakar,

On Thu, Jan 26, 2023 at 09:58:32AM +0000, Lad Prabhakar wrote:
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
> RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP
> errata should be applied to handle cache management.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  platform/generic/renesas/rzfive/rzfive.c | 69 ++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index 0a8c9f9..627df09 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -9,6 +9,34 @@
>  #include <sbi/sbi_domain.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  
> +#define RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND	0
> +
> +/* AX45MP registers */
> +#define AX45MP_CSR_MICM_CFG			0xfc0
> +#define AX45MP_CSR_MDCM_CFG			0xfc1
> +#define AX45MP_CSR_MMSC_CFG			0xfc2
> +#define AX45MP_CSR_MCACHE_CTL			0x7ca
> +
> +/* AX45MP register bit offsets and masks */
> +#define AX45MP_MISA_20_OFFSET			20
> +#define AX45MP_MISA_20_MASK			(0x1 << AX45MP_MISA_20_OFFSET)
> +
> +#define AX45MP_MICM_CFG_ISZ_OFFSET		6
> +#define AX45MP_MICM_CFG_ISZ_MASK		(0x7  << AX45MP_MICM_CFG_ISZ_OFFSET)
> +
> +#define AX45MP_MDCM_CFG_DSZ_OFFSET		6
> +#define AX45MP_MDCM_CFG_DSZ_MASK		(0x7  << AX45MP_MDCM_CFG_DSZ_OFFSET)
> +
> +#define AX45MP_MMSC_CFG_CCTLCSR_OFFSET		16
> +#define AX45MP_MMSC_CFG_CCTLCSR_MASK		(0x1 << AX45MP_MMSC_CFG_CCTLCSR_OFFSET)
> +#define AX45MP_MMSC_IOCP_OFFSET			47
> +#define AX45MP_MMSC_IOCP_MASK			(0x1ULL << AX45MP_MMSC_IOCP_OFFSET)
> +
> +#define AX45MP_MCACHE_CTL_CCTL_SUEN_OFFSET	8
> +#define AX45MP_MCACHE_CTL_CCTL_SUEN_MASK	(0x1 << AX45MP_MCACHE_CTL_CCTL_SUEN_OFFSET)

Could you move these CSR to platform/generic/include/andes/andes45.h
which is recently merged? Thanks.

> +
> +#define ANDESTECH_SBI_EXT_ANDES			0x900031e
> +
>  static const struct andes45_pma_region renesas_rzfive_pma_regions[] = {
>  	{
>  		.pa = 0x58000000,
> @@ -28,6 +56,46 @@ static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *mat
>  					 array_size(renesas_rzfive_pma_regions));
>  }
>  
> +static bool renesas_rzfive_cpu_cache_controlable(void)
> +{
> +	return (((csr_read(AX45MP_CSR_MICM_CFG) & AX45MP_MICM_CFG_ISZ_MASK) ||
> +		 (csr_read(AX45MP_CSR_MDCM_CFG) & AX45MP_MDCM_CFG_DSZ_MASK)) &&
> +		(csr_read(CSR_MISA) & AX45MP_MISA_20_MASK) &&
> +		(csr_read(AX45MP_CSR_MMSC_CFG) & AX45MP_MMSC_CFG_CCTLCSR_MASK) &&
> +		(csr_read(AX45MP_CSR_MCACHE_CTL) & AX45MP_MCACHE_CTL_CCTL_SUEN_MASK));
> +}
> +
> +static bool renesas_rzfive_cpu_iocp_disabled(void)
> +{
> +	return (csr_read(AX45MP_CSR_MMSC_CFG) & AX45MP_MMSC_IOCP_MASK) ? false : true;
> +}
> +
> +static bool renesas_rzfive_apply_iocp_sw_workaround(void)
> +{
> +	return renesas_rzfive_cpu_cache_controlable() & renesas_rzfive_cpu_iocp_disabled();
> +}
> +
> +static int renesas_rzfive_vendor_ext_provider(long extid, long funcid,
> +					      const struct sbi_trap_regs *regs,
> +					      unsigned long *out_value,
> +					      struct sbi_trap_info *out_trap,
> +					      const struct fdt_match *match)
> +{
> +	if (extid != ANDESTECH_SBI_EXT_ANDES)
> +		return SBI_EINVAL;

This causes compilation error without including sbi/sbi_error.h.

Regards,
Peter Lin

