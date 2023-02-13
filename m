From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Feb 2023 09:45:42 +0530
Subject: [PATCH v4 3/3] platform: generic: renesas: rzfive: Add SBI EXT to
 check for enabling IOCP errata
In-Reply-To: <20230206000624.6544-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230206000624.6544-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230206000624.6544-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAAhSdy2TZQ_C+3o-Qm0Z7H3aehuCOhwvxKXC8MAEhwvbHA2pdg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 6, 2023 at 5:37 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
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
>  platform/generic/include/andes/andes45.h | 25 ++++++++++++-
>  platform/generic/renesas/rzfive/rzfive.c | 47 ++++++++++++++++++++++++
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes45.h
> index 08b3d18..d5d265f 100644
> --- a/platform/generic/include/andes/andes45.h
> +++ b/platform/generic/include/andes/andes45.h
> @@ -4,7 +4,28 @@
>  #define CSR_MARCHID_MICROID 0xfff
>
>  /* Memory and Miscellaneous Registers */
> -#define CSR_MCACHE_CTL 0x7ca
> -#define CSR_MCCTLCOMMAND 0x7cc
> +#define CSR_MCACHE_CTL         0x7ca
> +#define CSR_MCCTLCOMMAND       0x7cc
> +#define CSR_MICM_CFG           0xfc0
> +#define CSR_MDCM_CFG           0xfc1
> +#define CSR_MMSC_CFG           0xfc2
> +
> +#define MISA_20_OFFSET                 20
> +#define MISA_20_MASK                   (0x1 << MISA_20_OFFSET)
> +
> +#define MICM_CFG_ISZ_OFFSET            6
> +#define MICM_CFG_ISZ_MASK              (0x7  << MICM_CFG_ISZ_OFFSET)
> +
> +#define MDCM_CFG_DSZ_OFFSET            6
> +#define MDCM_CFG_DSZ_MASK              (0x7  << MDCM_CFG_DSZ_OFFSET)
> +
> +#define MMSC_CFG_CCTLCSR_OFFSET                16
> +#define MMSC_CFG_CCTLCSR_MASK          (0x1 << MMSC_CFG_CCTLCSR_OFFSET)
> +#define MMSC_IOCP_OFFSET                       47
> +#define MMSC_IOCP_MASK                 (0x1ULL << MMSC_IOCP_OFFSET)
> +
> +#define MCACHE_CTL_CCTL_SUEN_OFFSET    8
> +#define MCACHE_CTL_CCTL_SUEN_MASK      (0x1 << MCACHE_CTL_CCTL_SUEN_OFFSET)
> +
>
>  #endif /* _RISCV_ANDES45_H */
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index eee9c51..552c747 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -4,11 +4,17 @@
>   *
>   */
>
> +#include <andes/andes45.h>
>  #include <andes45_pma.h>
>  #include <platform_override.h>
>  #include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>
> +#define RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND      0
> +
> +#define ANDESTECH_SBI_EXT_ANDES                        0x900031e
> +
>  static const struct andes45_pma_region renesas_rzfive_pma_regions[] = {
>         {
>                 .pa = 0x58000000,
> @@ -28,6 +34,46 @@ static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *mat
>                                          array_size(renesas_rzfive_pma_regions));
>  }
>
> +static bool renesas_rzfive_cpu_cache_controlable(void)
> +{
> +       return (((csr_read(CSR_MICM_CFG) & MICM_CFG_ISZ_MASK) ||
> +                (csr_read(CSR_MDCM_CFG) & MDCM_CFG_DSZ_MASK)) &&
> +               (csr_read(CSR_MISA) & MISA_20_MASK) &&
> +               (csr_read(CSR_MMSC_CFG) & MMSC_CFG_CCTLCSR_MASK) &&
> +               (csr_read(CSR_MCACHE_CTL) & MCACHE_CTL_CCTL_SUEN_MASK));
> +}
> +
> +static bool renesas_rzfive_cpu_iocp_disabled(void)
> +{
> +       return (csr_read(CSR_MMSC_CFG) & MMSC_IOCP_MASK) ? false : true;
> +}
> +
> +static bool renesas_rzfive_apply_iocp_sw_workaround(void)
> +{
> +       return renesas_rzfive_cpu_cache_controlable() & renesas_rzfive_cpu_iocp_disabled();
> +}
> +
> +static int renesas_rzfive_vendor_ext_provider(long extid, long funcid,
> +                                             const struct sbi_trap_regs *regs,
> +                                             unsigned long *out_value,
> +                                             struct sbi_trap_info *out_trap,
> +                                             const struct fdt_match *match)
> +{
> +       if (extid != ANDESTECH_SBI_EXT_ANDES)
> +               return SBI_EINVAL;

This is also looking strange because you are checking Andes vendor
extension in RZ Five sources.

I will send a small patch which will help you simplify this over here. You
can include that patch in this series in the next revision.

Regards,
Anup

> +
> +       switch (funcid) {
> +       case RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND:
> +               *out_value = renesas_rzfive_apply_iocp_sw_workaround();
> +               break;
> +
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
>  int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>  {
>         /*
> @@ -55,4 +101,5 @@ const struct platform_override renesas_rzfive = {
>         .match_table = renesas_rzfive_match,
>         .early_init = renesas_rzfive_early_init,
>         .final_init = renesas_rzfive_final_init,
> +       .vendor_ext_provider = renesas_rzfive_vendor_ext_provider,
>  };
> --
> 2.17.1
>

