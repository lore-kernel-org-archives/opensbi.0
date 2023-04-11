From: Anup Patel <anup@brainfault.org>
Date: Tue, 11 Apr 2023 22:10:27 +0530
Subject: [PATCH v10] platform: generic: andes/renesas: Add SBI EXT to
 check for enabling IOCP errata
In-Reply-To: <20230411163633.11220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230411163633.11220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAAhSdy3Vrk3L7CLdZfFS=N5kLyXFVcj_nKe9ZMqc6Cty9H3Zuw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 11, 2023 at 10:06?PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> I/O Coherence Port (IOCP) provides an AXI interface for connecting
> external non-caching masters, such as DMA controllers. The accesses
> from IOCP are coherent with D-Caches and L2 Cache.
>
> IOCP is a specification option and is disabled on the Renesas RZ/Five
> SoC (which is based on Andes AX45MP core) due to this reason IP blocks
> using DMA will fail.
>
> As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> software. Firstly OpenSBI configures the memory region as
> "Memory, Non-cacheable, Bufferable" and passes this region as a global
> shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> allocations happen from this region and synchronization callbacks are
> implemented to synchronize when doing DMA transactions.
>
> SBI_EXT_ANDES_IOCP_SW_WORKAROUND checks if the IOCP errata should be
> applied to handle cache management.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> v9->v10
> * Renamed andes45->andes
> * Changes the license to BSD-2-Clause
>
> v8->v9
> * Moved vendor_ext_provider callback to andes45_sbi.c
> * Updated commit message
> * Dropped RB tags
>
> v7->v8
> * Fixed typo controlable -> controllable
> * Included RB tag from Lin-san and Conor
>
> v6->v7
> * Added a new section for conf and control registers
> * Made use of misa_extension('U')
> * For unsupported funcid's now returning SBI_EINVAL
> * Renamed ANDES_SBI_EXT_IOCP_SW_WORKAROUND -> SBI_EXT_ANDES_IOCP_SW_WORKAROUND
>
> v5->v6
> * Moved ANDES_SBI_EXT_IOCP_SW_WORKAROUND to andes_sbi.h
> * Moved helpers to check IOCP to common header so that we re-use code
>
> v5:
> https://patchwork.ozlabs.org/project/opensbi/patch/20230213215111.32017-4-prabhakar.mahadev-lad.rj at bp.renesas.com/
> ---
>  platform/generic/Kconfig                   |  1 +
>  platform/generic/andes/Kconfig             |  4 ++
>  platform/generic/andes/andes_sbi.c         | 51 ++++++++++++++++++++++
>  platform/generic/andes/objects.mk          |  1 +
>  platform/generic/include/andes/andes45.h   | 23 +++++++++-
>  platform/generic/include/andes/andes_sbi.h | 15 +++++++
>  platform/generic/renesas/rzfive/rzfive.c   |  2 +
>  7 files changed, 95 insertions(+), 2 deletions(-)
>  create mode 100644 platform/generic/andes/andes_sbi.c
>  create mode 100644 platform/generic/include/andes/andes_sbi.h
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 1f4f8e1..72768ed 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -36,6 +36,7 @@ config PLATFORM_ANDES_AE350
>  config PLATFORM_RENESAS_RZFIVE
>         bool "Renesas RZ/Five support"
>         select ANDES45_PMA
> +       select ANDES_SBI
>         default n
>
>  config PLATFORM_SIFIVE_FU540
> diff --git a/platform/generic/andes/Kconfig b/platform/generic/andes/Kconfig
> index 3ad4e4c..a91fb9c 100644
> --- a/platform/generic/andes/Kconfig
> +++ b/platform/generic/andes/Kconfig
> @@ -3,3 +3,7 @@
>  config ANDES45_PMA
>         bool "Andes PMA support"
>         default n
> +
> +config ANDES_SBI
> +       bool "Andes SBI support"
> +       default n
> diff --git a/platform/generic/andes/andes_sbi.c b/platform/generic/andes/andes_sbi.c
> new file mode 100644
> index 0000000..3e89fb9
> --- /dev/null
> +++ b/platform/generic/andes/andes_sbi.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: BSD-2-Clause
> +/*
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + *
> + */
> +#include <andes/andes45.h>
> +#include <andes/andes_sbi.h>
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_error.h>
> +
> +enum sbi_ext_andes_fid {
> +       SBI_EXT_ANDES_FID0 = 0, /* Reserved for future use */
> +       SBI_EXT_ANDES_IOCP_SW_WORKAROUND,
> +};
> +
> +static bool andes45_cache_controllable(void)
> +{
> +       return (((csr_read(CSR_MICM_CFG) & MICM_CFG_ISZ_MASK) ||
> +                (csr_read(CSR_MDCM_CFG) & MDCM_CFG_DSZ_MASK)) &&
> +               (csr_read(CSR_MMSC_CFG) & MMSC_CFG_CCTLCSR_MASK) &&
> +               (csr_read(CSR_MCACHE_CTL) & MCACHE_CTL_CCTL_SUEN_MASK) &&
> +               misa_extension('U'));
> +}
> +
> +static bool andes45_iocp_disabled(void)
> +{
> +       return (csr_read(CSR_MMSC_CFG) & MMSC_IOCP_MASK) ? false : true;
> +}
> +
> +static bool andes45_apply_iocp_sw_workaround(void)
> +{
> +       return andes45_cache_controllable() & andes45_iocp_disabled();
> +}
> +
> +int andes_sbi_vendor_ext_provider(long funcid,
> +                                 const struct sbi_trap_regs *regs,
> +                                 unsigned long *out_value,
> +                                 struct sbi_trap_info *out_trap,
> +                                 const struct fdt_match *match)
> +{
> +       switch (funcid) {
> +       case SBI_EXT_ANDES_IOCP_SW_WORKAROUND:
> +               *out_value = andes45_apply_iocp_sw_workaround();
> +               break;
> +
> +       default:
> +               return SBI_EINVAL;
> +       }
> +
> +       return 0;
> +}
> diff --git a/platform/generic/andes/objects.mk b/platform/generic/andes/objects.mk
> index ea6b561..e8f86ea 100644
> --- a/platform/generic/andes/objects.mk
> +++ b/platform/generic/andes/objects.mk
> @@ -6,3 +6,4 @@ carray-platform_override_modules-$(CONFIG_PLATFORM_ANDES_AE350) += andes_ae350
>  platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o andes/sleep.o
>
>  platform-objs-$(CONFIG_ANDES45_PMA) += andes/andes45-pma.o
> +platform-objs-$(CONFIG_ANDES_SBI) += andes/andes_sbi.o
> diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes45.h
> index 08b3d18..f570994 100644
> --- a/platform/generic/include/andes/andes45.h
> +++ b/platform/generic/include/andes/andes45.h
> @@ -4,7 +4,26 @@
>  #define CSR_MARCHID_MICROID 0xfff
>
>  /* Memory and Miscellaneous Registers */
> -#define CSR_MCACHE_CTL 0x7ca
> -#define CSR_MCCTLCOMMAND 0x7cc
> +#define CSR_MCACHE_CTL         0x7ca
> +#define CSR_MCCTLCOMMAND       0x7cc
> +
> +/* Configuration Control & Status Registers */
> +#define CSR_MICM_CFG           0xfc0
> +#define CSR_MDCM_CFG           0xfc1
> +#define CSR_MMSC_CFG           0xfc2
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
>
>  #endif /* _RISCV_ANDES45_H */
> diff --git a/platform/generic/include/andes/andes_sbi.h b/platform/generic/include/andes/andes_sbi.h
> new file mode 100644
> index 0000000..e5dc250
> --- /dev/null
> +++ b/platform/generic/include/andes/andes_sbi.h
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: BSD-2-Clause
> +
> +#ifndef _RISCV_ANDES_SBI_H
> +#define _RISCV_ANDES_SBI_H
> +
> +#include <sbi/sbi_trap.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +
> +int andes_sbi_vendor_ext_provider(long funcid,
> +                                 const struct sbi_trap_regs *regs,
> +                                 unsigned long *out_value,
> +                                 struct sbi_trap_info *out_trap,
> +                                 const struct fdt_match *match);
> +
> +#endif /* _RISCV_ANDES_SBI_H */
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index 4d71d0d..a69797b 100644
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
> @@ -55,4 +56,5 @@ const struct platform_override renesas_rzfive = {
>         .match_table = renesas_rzfive_match,
>         .early_init = renesas_rzfive_early_init,
>         .final_init = renesas_rzfive_final_init,
> +       .vendor_ext_provider = andes_sbi_vendor_ext_provider,
>  };
> --
> 2.17.1
>

