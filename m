From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sat, 21 Jan 2023 02:47:43 +0000
Subject: [RFC PATCH v2 3/3] platform: generic: renesas: rzfive: Add SBI
 EXT to check for enabling IOCP errata
In-Reply-To: <20230111130540.22722-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230111130540.22722-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230111130540.22722-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <9316EA1D-4FEB-4DDA-BAFE-CB7F8BACA4B4@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11 Jan 2023, at 13:05, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> 
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
> Hi Lin-san,
> 
> If Andes plan to use similar approach I can move this code into some common
> file so that it can be shared. Please share your thoughts.
> 
> Cheers, Prabhakar
> ---
> platform/generic/renesas/rzfive/rzfive.c | 63 ++++++++++++++++++++++++
> 1 file changed, 63 insertions(+)
> 
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index 54a4c29..2cb9b3b 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -9,6 +9,33 @@
> #include <sbi/sbi_domain.h>
> #include <sbi_utils/fdt/fdt_helper.h>
> 
> +#define RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND	0
> +
> +/* AX45MP registers */
> +#define AX45MP_CSR_MISA_CFG			0x301
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
> +
> static const struct andes45_pma_region renesas_rzfive_pma_regions[] = {
> 	{
> 		.pa = 0x58000000,
> @@ -28,6 +55,41 @@ static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *mat
> 					 array_size(renesas_rzfive_pma_regions));
> }
> 
> +static bool renesas_rzfive_cpu_cache_controlable(void)
> +{
> +	return (((csr_read(AX45MP_CSR_MICM_CFG) & AX45MP_MICM_CFG_ISZ_MASK) ||
> +		 (csr_read(AX45MP_CSR_MDCM_CFG) & AX45MP_MDCM_CFG_DSZ_MASK)) &&
> +		(csr_read(AX45MP_CSR_MISA_CFG) & AX45MP_MISA_20_MASK) &&

This is misa.U. What's that got to do with cache control?

Jess

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
> +static int renesas_rzfive_vendor_ext_provider(long extid, long funcid,
> +					      const struct sbi_trap_regs *regs,
> +					      unsigned long *out_value,
> +					      struct sbi_trap_info *out_trap,
> +					      const struct fdt_match *match)
> +{
> +	switch (funcid) {
> +	case RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND:
> +		*out_value = renesas_rzfive_apply_iocp_sw_workaround();
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
> {
> 	/*
> @@ -53,4 +115,5 @@ const struct platform_override renesas_rzfive = {
> 	.match_table = renesas_rzfive_match,
> 	.early_init = renesas_rzfive_early_init,
> 	.final_init = renesas_rzfive_final_init,
> +	.vendor_ext_provider = renesas_rzfive_vendor_ext_provider,
> };
> -- 
> 2.17.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


