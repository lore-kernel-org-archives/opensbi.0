From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 17 Mar 2023 13:12:23 +0000
Subject: [PATCH v6] platform: generic: renesas: rzfive: Add SBI EXT to
 check for enabling IOCP errata
In-Reply-To: <ZBSBt40MV/rR704Q@APC323>
References: <20230315214558.20422-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <ZBSBt40MV/rR704Q@APC323>
Message-ID: <CA+V-a8t_VQVUU84rs8RJwZO=L-fJBATrcKdhQz75GpZwXf31DA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Lin-san,

Thank you for the review.

On Fri, Mar 17, 2023 at 7:11?AM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Mar 15, 2023 at 09:45:58PM +0000, Lad Prabhakar wrote:
> > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > external non-caching masters, such as DMA controllers. The accesses
> > from IOCP are coherent with D-Caches and L2 Cache.
> >
> > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > SoC due to this reason IP blocks using DMA will fail.
> >
> > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > software. Firstly OpenSBI configures the memory region as
> > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > allocations happen from this region and synchronization callbacks are
> > implemented to synchronize when doing DMA transactions.
> >
> > ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP errata
> > should be applied to handle cache management.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v5->v6
> > * Moved ANDES_SBI_EXT_IOCP_SW_WORKAROUND to andes_sbi.h
> > * Moved helpers to check IOCP to common header so that we re-use code
> >
> > v5:
> > https://patchwork.ozlabs.org/project/opensbi/patch/20230213215111.32017-4-prabhakar.mahadev-lad.rj at bp.renesas.com/
> > ---
> >  platform/generic/include/andes/andes45.h   | 25 +++++++++++++++++--
> >  platform/generic/include/andes/andes_sbi.h | 29 ++++++++++++++++++++++
> >  platform/generic/renesas/rzfive/rzfive.c   | 20 +++++++++++++++
> >  3 files changed, 72 insertions(+), 2 deletions(-)
> >  create mode 100644 platform/generic/include/andes/andes_sbi.h
> >
> > diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes45.h
> > index 08b3d18..d5d265f 100644
> > --- a/platform/generic/include/andes/andes45.h
> > +++ b/platform/generic/include/andes/andes45.h
> > @@ -4,7 +4,28 @@
> >  #define CSR_MARCHID_MICROID 0xfff
>
> >  /* Memory and Miscellaneous Registers */
> > -#define CSR_MCACHE_CTL 0x7ca
> > -#define CSR_MCCTLCOMMAND 0x7cc
> > +#define CSR_MCACHE_CTL               0x7ca
> > +#define CSR_MCCTLCOMMAND     0x7cc
>
> Let's add a category here:
> /* Configuration Control & Status Registers */
Sure will do.

> > +#define CSR_MICM_CFG         0xfc0
> > +#define CSR_MDCM_CFG         0xfc1
> > +#define CSR_MMSC_CFG         0xfc2
> > +
> > +#define MISA_20_OFFSET                       20
> > +#define MISA_20_MASK                 (0x1 << MISA_20_OFFSET)
> > +
> > +#define MICM_CFG_ISZ_OFFSET          6
> > +#define MICM_CFG_ISZ_MASK            (0x7  << MICM_CFG_ISZ_OFFSET)
> > +
> > +#define MDCM_CFG_DSZ_OFFSET          6
> > +#define MDCM_CFG_DSZ_MASK            (0x7  << MDCM_CFG_DSZ_OFFSET)
> > +
> > +#define MMSC_CFG_CCTLCSR_OFFSET              16
> > +#define MMSC_CFG_CCTLCSR_MASK                (0x1 << MMSC_CFG_CCTLCSR_OFFSET)
> > +#define MMSC_IOCP_OFFSET                     47
> > +#define MMSC_IOCP_MASK                       (0x1ULL << MMSC_IOCP_OFFSET)
> > +
> > +#define MCACHE_CTL_CCTL_SUEN_OFFSET  8
> > +#define MCACHE_CTL_CCTL_SUEN_MASK    (0x1 << MCACHE_CTL_CCTL_SUEN_OFFSET)
> > +
> >
> >  #endif /* _RISCV_ANDES45_H */
> > diff --git a/platform/generic/include/andes/andes_sbi.h b/platform/generic/include/andes/andes_sbi.h
> > new file mode 100644
> > index 0000000..332b7d2
> > --- /dev/null
> > +++ b/platform/generic/include/andes/andes_sbi.h
> > @@ -0,0 +1,29 @@
> > +#ifndef _RISCV_ANDES_SBI_H
> > +#define _RISCV_ANDES_SBI_H
> > +
> > +#include <sbi/riscv_asm.h>
> > +
> > +#include "andes45.h"
>
> -#include "andes45.h"
> +#include <andes/andes45.h>
>
> > +
> > +#define ANDES_SBI_EXT_IOCP_SW_WORKAROUND     1
>
> Let's define an enum and leave the first one empty for now,
> and please rename the constants as SBI_EXT_ANDES_XXX:
>
> -#define ANDES_SBI_EXT_IOCP_SW_WORKAROUND       1
> +enum sbi_ext_andes_fid {
> +       SBI_EXT_ANDES_FID0 = 0, /* Reserved for future use */
> +       SBI_EXT_ANDES_IOCP_SW_WORKAROUND,
> +};
>
OK.

> > +
> > +static bool andes45_cache_controlable(void)
> > +{
> > +     return (((csr_read(CSR_MICM_CFG) & MICM_CFG_ISZ_MASK) ||
> > +              (csr_read(CSR_MDCM_CFG) & MDCM_CFG_DSZ_MASK)) &&
> > +             (csr_read(CSR_MISA) & MISA_20_MASK) &&
>
> Sorry for not bringing this up earlier, this check on CSR_MISA can be
> replaced with misa_extension('U') [1], so no need to define MISA_20_MASK
>
Good point, thanks for pointing that out.

Cheers,
Prabhakar

