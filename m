From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Wed, 25 Jan 2023 19:47:53 +0000
Subject: [RFC PATCH v2 1/3] platform: generic: renesas: rzfive: Add
 support to configure the PMA
In-Reply-To: <Y8tUBoEoWi37s5wY@Thinkpad-L14>
References: <20230111130540.22722-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230111130540.22722-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y8tUBoEoWi37s5wY@Thinkpad-L14>
Message-ID: <CA+V-a8undrYucm+dwir-5n6W3NYtTH9tveOiFQnTx0fdHe8qGA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yu-Chien,

Thank you for the review.

On Sat, Jan 21, 2023 at 2:52 AM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jan 11, 2023 at 01:05:38PM +0000, Lad Prabhakar wrote:
> > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > external non-caching masters, such as DMA controllers. The accesses
> > from IOCP are coherent with D-Caches and L2 Cache.
> >
> > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > SoC due to this reason IP blocks using DMA will fail.
> >
> > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > block that allows dynamic adjustment of memory attributes in the runtime.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest.
> > Below are the memory attributes supported:
> > * Device, Non-bufferable
> > * Device, bufferable
> > * Memory, Non-cacheable, Non-bufferable
> > * Memory, Non-cacheable, Bufferable
> > * Memory, Write-back, No-allocate
> > * Memory, Write-back, Read-allocate
> > * Memory, Write-back, Write-allocate
> > * Memory, Write-back, Read and Write-allocate
> >
> > More info about PMA (section 10.3):
> > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >
> > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > software. Firstly OpenSBI configures the memory region as
> > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > allocations happen from this region and synchronization callbacks are
> > implemented to synchronize when doing DMA transactions.
> >
> > Example PMA region passed as a DT node from OpenSBI:
> >     reserved-memory {
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> >         ranges;
> >
> >         pma_resv0 at 58000000 {
> >             compatible = "shared-dma-pool";
> >             reg = <0x0 0x58000000 0x0 0x08000000>;
> >             no-map;
> >             linux,dma-default;
> >         };
> >     };
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  platform/generic/Kconfig                      |   8 +
> >  platform/generic/include/andes45-pma.h        |  48 +++
> >  platform/generic/renesas/rzfive/andes45-pma.c | 346 ++++++++++++++++++
> >  platform/generic/renesas/rzfive/objects.mk    |   1 +
> >  4 files changed, 403 insertions(+)
> >  create mode 100644 platform/generic/include/andes45-pma.h
> >  create mode 100644 platform/generic/renesas/rzfive/andes45-pma.c
> >
> > diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> > index 47c10e5..c6bbe8f 100644
> > --- a/platform/generic/Kconfig
> > +++ b/platform/generic/Kconfig
> > @@ -50,3 +50,11 @@ config PLATFORM_STARFIVE_JH7110
> >       default n
> >
> >  endif
> > +
> > +if PLATFORM_RENESAS_RZFIVE
> > +
> > +config ANDES45_PMA
> > +     bool "Andes PMA support"
> > +     default n
> > +
> > +endif
> > diff --git a/platform/generic/include/andes45-pma.h b/platform/generic/include/andes45-pma.h
> > new file mode 100644
> > index 0000000..79bd428
> > --- /dev/null
> > +++ b/platform/generic/include/andes45-pma.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2023 Renesas Electronics Corp.
> > + */
> > +
> > +#ifndef _ANDES45_PMA_H_
> > +#define _ANDES45_PMA_H_
> > +
> > +#include <sbi/sbi_types.h>
> > +
> > +#define ANDES45_MAX_PMA_REGIONS                      16
> > +
> > +/* Naturally aligned power of 2 region */
> > +#define ANDES45_PMACFG_ETYP_NAPOT            3
> > +
> > +/* Memory, Non-cacheable, Bufferable */
> > +#define ANDES45_PMACFG_MTYP_MEM_NON_CACHE_BUF        (3 << 2)
> > +
> > +/**
> > + * struct andes45_pma_region - Describes PMA regions
> > + *
> > + * @pa: Address to be configured in the PMA
> > + * @size: Size of the region
> > + * @flags: Flags to be set for the PMA region
> > + * @dt_populate: Boolean flag indicating if the DT entry should be
> > + *               populated for the given PMA region
> > + * @shared_dma: Boolean flag if set "shared-dma-pool" property will
> > + *              be set in the DT node
> > + * @no_map: Boolean flag if set "no-map" property will be set in the
> > + *          DT node
> > + * @dma_default: Boolean flag if set "linux,dma-default" property will
> > + *              be set in the DT node. Note Linux expects single node
> > + *              with this property set.
> > + */
> > +struct andes45_pma_region {
> > +     unsigned long pa;
> > +     unsigned long size;
> > +     u32 flags;
> > +     bool dt_populate;
> > +     bool shared_dma;
> > +     bool no_map;
> > +     bool dma_default;
> > +};
> > +
> > +int andes45_pma_setup_regions(const struct andes45_pma_region *pma_regions,
> > +                           unsigned int pma_regions_count);
> > +
> > +#endif /* _ANDES45_PMA_H_ */
> > diff --git a/platform/generic/renesas/rzfive/andes45-pma.c b/platform/generic/renesas/rzfive/andes45-pma.c
> > new file mode 100644
> > index 0000000..13efdee
> > --- /dev/null
> > +++ b/platform/generic/renesas/rzfive/andes45-pma.c
> > @@ -0,0 +1,346 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 Renesas Electronics Corp.
> > + *
> > + * Copyright (c) 2020 Andes Technology Corporation
> > + *
> > + * Authors:
> > + *      Nick Hu <nickhu@andestech.com>
> > + *      Nylon Chen <nylon7@andestech.com>
> > + */
> > +
> > +#include <andes45-pma.h>
> > +#include <libfdt.h>
> > +#include <sbi/riscv_asm.h>
> > +#include <sbi/riscv_io.h>
> > +#include <sbi/sbi_console.h>
> > +#include <sbi/sbi_error.h>
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +
> > +/* Configuration Registers */
> > +#define ANDES45_CSR_MMSC_CFG         0xFC2
> > +#define ANDES45_CSR_MMSC_PPMA_OFFSET (1 << 30)
> > +
> > +#define ANDES45_PMAADDR_0            0xBD0
> > +#define ANDES45_PMAADDR_1            0xBD1
> > +#define ANDES45_PMAADDR_2            0xBD2
> > +#define ANDES45_PMAADDR_3            0xBD3
> > +#define ANDES45_PMAADDR_4            0xBD4
> > +#define ANDES45_PMAADDR_5            0xBD5
> > +#define ANDES45_PMAADDR_6            0xBD6
> > +#define ANDES45_PMAADDR_7            0xBD7
> > +#define ANDES45_PMAADDR_8            0xBD8
> > +#define ANDES45_PMAADDR_9            0xBD9
> > +#define ANDES45_PMAADDR_10           0xBDA
> > +#define ANDES45_PMAADDR_11           0xBDB
> > +#define ANDES45_PMAADDR_12           0xBDC
> > +#define ANDES45_PMAADDR_13           0xBDD
> > +#define ANDES45_PMAADDR_14           0xBDE
> > +#define ANDES45_PMAADDR_15           0xBDF
> > +
> > +/* n = 0 - 3 */
> > +#define ANDES45_PMACFG_n(n)          (0xBC0 + (n))
> > +
> > +static inline unsigned long andes45_pma_read_cfg(unsigned int i)
> > +{
> > +     unsigned long val = 0;
> > +
> > +     if (!i)
> > +             val = csr_read(ANDES45_PMACFG_n(0));
> > +     else if (i == 1)
> > +             val = csr_read(ANDES45_PMACFG_n(2));
> > +
> > +     return val;
> > +}
> > +
> > +static inline void andes45_pma_write_cfg(unsigned int i, unsigned long val)
> > +{
> > +     if (!i)
> > +             csr_write(ANDES45_PMACFG_n(0), val);
> > +     else if (i == 1)
> > +             csr_write(ANDES45_PMACFG_n(2), val);
> > +}
> > +
> > +static inline void andes45_pma_write_addr(unsigned int i, unsigned long val)
> > +{
> > +     if (i == 0)
> > +             csr_write(ANDES45_PMAADDR_0, val);
> > +     else if (i == 1)
> > +             csr_write(ANDES45_PMAADDR_1, val);
> > +     else if (i == 2)
> > +             csr_write(ANDES45_PMAADDR_2, val);
> > +     else if (i == 3)
> > +             csr_write(ANDES45_PMAADDR_3, val);
> > +     else if (i == 4)
> > +             csr_write(ANDES45_PMAADDR_4, val);
> > +     else if (i == 5)
> > +             csr_write(ANDES45_PMAADDR_5, val);
> > +     else if (i == 6)
> > +             csr_write(ANDES45_PMAADDR_6, val);
> > +     else if (i == 7)
> > +             csr_write(ANDES45_PMAADDR_7, val);
> > +     else if (i == 8)
> > +             csr_write(ANDES45_PMAADDR_8, val);
> > +     else if (i == 9)
> > +             csr_write(ANDES45_PMAADDR_9, val);
> > +     else if (i == 10)
> > +             csr_write(ANDES45_PMAADDR_10, val);
> > +     else if (i == 11)
> > +             csr_write(ANDES45_PMAADDR_11, val);
> > +     else if (i == 12)
> > +             csr_write(ANDES45_PMAADDR_12, val);
> > +     else if (i == 13)
> > +             csr_write(ANDES45_PMAADDR_13, val);
> > +     else if (i == 14)
> > +             csr_write(ANDES45_PMAADDR_14, val);
> > +     else if (i == 15)
> > +             csr_write(ANDES45_PMAADDR_15, val);
> > +}
> > +
> > +static inline unsigned long andes45_pma_read_addr(unsigned int i)
> > +{
> > +     unsigned long ret = 0;
> > +
> > +     if (i == 0)
> > +             ret = csr_read(ANDES45_PMAADDR_0);
> > +     else if (i == 1)
> > +             ret = csr_read(ANDES45_PMAADDR_1);
> > +     else if (i == 2)
> > +             ret = csr_read(ANDES45_PMAADDR_2);
> > +     else if (i == 3)
> > +             ret = csr_read(ANDES45_PMAADDR_3);
> > +     else if (i == 4)
> > +             ret = csr_read(ANDES45_PMAADDR_4);
> > +     else if (i == 5)
> > +             ret = csr_read(ANDES45_PMAADDR_5);
> > +     else if (i == 6)
> > +             ret =  csr_read(ANDES45_PMAADDR_6);
> > +     else if (i == 7)
> > +             ret = csr_read(ANDES45_PMAADDR_7);
> > +     else if (i == 8)
> > +             ret = csr_read(ANDES45_PMAADDR_8);
> > +     else if (i == 9)
> > +             ret = csr_read(ANDES45_PMAADDR_9);
> > +     else if (i == 10)
> > +             ret = csr_read(ANDES45_PMAADDR_10);
> > +     else if (i == 11)
> > +             ret = csr_read(ANDES45_PMAADDR_11);
> > +     else if (i == 12)
> > +             ret = csr_read(ANDES45_PMAADDR_12);
> > +     else if (i == 13)
> > +             ret = csr_read(ANDES45_PMAADDR_13);
> > +     else if (i == 14)
> > +             ret = csr_read(ANDES45_PMAADDR_14);
> > +     else if (i == 15)
> > +             ret = csr_read(ANDES45_PMAADDR_15);
> > +
> > +     return ret;
> > +}
>
> Maybe use something similar to csr_{read|write}_num [1]
> for these andes45_pma_{read|write}_{cfg|addr} functions?
> like:
>
> void andes_pma_write_num(int csr_num, unsigned long val)
> {
> #define switchcase_csr_write(__csr_num, __val)          \
>         case __csr_num:                                 \
>                 csr_write(__csr_num, __val);            \
>                 break;
> #define switchcase_csr_write_2(__csr_num, __val)        \
>         switchcase_csr_write(__csr_num + 0, __val)      \
>         switchcase_csr_write(__csr_num + 1, __val)
> #define switchcase_csr_write_4(__csr_num, __val)        \
>         switchcase_csr_write_2(__csr_num + 0, __val)    \
>         switchcase_csr_write_2(__csr_num + 2, __val)
> #define switchcase_csr_write_8(__csr_num, __val)        \
>         switchcase_csr_write_4(__csr_num + 0, __val)    \
>         switchcase_csr_write_4(__csr_num + 4, __val)
> #define switchcase_csr_write_16(__csr_num, __val)       \
>         switchcase_csr_write_8(__csr_num + 0, __val)    \
>         switchcase_csr_write_8(__csr_num + 8, __val)
>
>         switch (csr_num) {
>         switchcase_csr_write_4(ANDES45_PMACFG_0, val)
>         switchcase_csr_write_16(ANDES45_PMAADDR_0, val)
>         default:
>                 sbi_panic("%s: Unknown Andes CSR %#x", __func__, csr_num);
>                 break;
>         };
>
> #undef switchcase_csr_write_16
> #undef switchcase_csr_write_8
> #undef switchcase_csr_write_4
> #undef switchcase_csr_write_2
> #undef switchcase_csr_write
> }
>
Good point, I'll update it in the next version.

>
> [1] https://github.com/riscv-software-src/opensbi/blob/v1.2/lib/sbi/riscv_asm.c#L168
>
> > +static unsigned long andes45_pma_setup(unsigned long addr,
> > +                                    unsigned long size,
> > +                                    unsigned int entry_id,
> > +                                    u32 flag)
> > +{
> > +     unsigned long size_tmp, shift, pmacfg_val;
> > +     unsigned long pmaaddr;
> > +     unsigned int power;
> > +     char *pmaxcfg;
> > +
> > +     if (size < (1 << 12))
> Apart from the 4KiB granularity,
> we should also make sure that the given size is
> the power-of-2 (or rounded up to it)?
>
Agreed I'll add a check to validate the size is power-of-2.

> > +             return SBI_EINVAL;
> > +
> > +     if (flag > 0xff || entry_id > 15)
> > +             return SBI_EINVAL;
> > +
> > +     if (!(flag & ANDES45_PMACFG_ETYP_NAPOT))
> > +             return SBI_EINVAL;
> > +
> > +     if ((addr & (size - 1)) != 0)
> > +             return SBI_EINVAL;
> > +
> > +     /* Calculate the NAPOT table for pmaaddr */
> > +     size_tmp = size;
> > +     shift = 0;
> > +     power = 0;
> > +     while (size_tmp != 0x1) {
> > +             size_tmp = size_tmp >> 1;
> > +             power++;
> > +             if (power > 3)
> > +                     shift = (shift << 1) | 0x1;
> > +     }
>
> these variables are unused?
>
Agreed, I will drop it.

Cheers,
Prabhakar

