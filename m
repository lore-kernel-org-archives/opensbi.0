From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Feb 2022 20:54:39 +0530
Subject: [PATCH v2 11/13] lib: utils/irqchip: Add APLIC initialization
 library
In-Reply-To: <CAOnJCU+rU9H53Ddj=QejUSnDRGu3OQtAq9GUcsD8+CdjxXp=3A@mail.gmail.com>
References: <20220209150441.121729-1-apatel@ventanamicro.com>
 <20220209150441.121729-12-apatel@ventanamicro.com>
 <CAOnJCU+rU9H53Ddj=QejUSnDRGu3OQtAq9GUcsD8+CdjxXp=3A@mail.gmail.com>
Message-ID: <CAAhSdy1v+EgNONUWgZk4vAWsz8CfjS+EwY_uq_rEmfz9t6PyOw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 12, 2022 at 6:02 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Feb 9, 2022 at 7:05 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We add simple APLIC initialization library which is independent of
> > hardware description format (FDT or ACPI). This APLIC initialization
> > library can be used by custom OpenSBI platform support to setup
> > APLIC domains.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi_utils/irqchip/aplic.h |  47 +++++
> >  lib/utils/irqchip/aplic.c         | 279 ++++++++++++++++++++++++++++++
> >  lib/utils/irqchip/objects.mk      |   1 +
> >  3 files changed, 327 insertions(+)
> >  create mode 100644 include/sbi_utils/irqchip/aplic.h
> >  create mode 100644 lib/utils/irqchip/aplic.c
> >
> > diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
> > new file mode 100644
> > index 0000000..82682e8
> > --- /dev/null
> > +++ b/include/sbi_utils/irqchip/aplic.h
> > @@ -0,0 +1,47 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + * Copyright (c) 2022 Ventana Micro Systems Inc.
> > + *
> > + * Authors:
> > + *   Anup Patel <anup.patel@wdc.com>
> > + */
> > +
> > +#ifndef __IRQCHIP_APLIC_H__
> > +#define __IRQCHIP_APLIC_H__
> > +
> > +#include <sbi/sbi_types.h>
> > +
> > +#define APLIC_MAX_DELEGATE     16
> > +
> > +struct aplic_msicfg_data {
> > +       unsigned long lhxs;
> > +       unsigned long lhxw;
> > +       unsigned long hhxs;
> > +       unsigned long hhxw;
> > +       unsigned long base_addr;
> > +};
> > +
> > +struct aplic_delegate_data {
> > +       u32 first_irq;
> > +       u32 last_irq;
> > +       u32 child_index;
> > +};
> > +
> > +struct aplic_data {
> > +       unsigned long addr;
> > +       unsigned long size;
> > +       unsigned long num_idc;
> > +       unsigned long num_source;
> > +       bool targets_mmode;
> > +       bool has_msicfg_mmode;
> > +       struct aplic_msicfg_data msicfg_mmode;
> > +       bool has_msicfg_smode;
> > +       struct aplic_msicfg_data msicfg_smode;
> > +       struct aplic_delegate_data delegate[APLIC_MAX_DELEGATE];
> > +};
> > +
> > +int aplic_cold_irqchip_init(struct aplic_data *aplic);
> > +
> > +#endif
> > diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
> > new file mode 100644
> > index 0000000..0a8469b
> > --- /dev/null
> > +++ b/lib/utils/irqchip/aplic.c
> > @@ -0,0 +1,279 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + * Copyright (c) 2022 Ventana Micro Systems Inc.
> > + *
> > + * Authors:
> > + *   Anup Patel <anup.patel@wdc.com>
> > + */
> > +
> > +#include <sbi/riscv_io.h>
> > +#include <sbi/sbi_console.h>
> > +#include <sbi/sbi_domain.h>
> > +#include <sbi/sbi_error.h>
> > +#include <sbi_utils/irqchip/aplic.h>
> > +
> > +#define APLIC_MAX_IDC                  (1UL << 14)
> > +#define APLIC_MAX_SOURCE               1024
> > +
> > +#define APLIC_DOMAINCFG                0x0000
> > +#define APLIC_DOMAINCFG_IE             (1 << 8)
> > +#define APLIC_DOMAINCFG_DM             (1 << 2)
> > +#define APLIC_DOMAINCFG_BE             (1 << 0)
> > +
> > +#define APLIC_SOURCECFG_BASE           0x0004
> > +#define APLIC_SOURCECFG_D              (1 << 10)
> > +#define APLIC_SOURCECFG_CHILDIDX_MASK  0x000003ff
> > +#define APLIC_SOURCECFG_SM_MASK        0x00000007
> > +#define APLIC_SOURCECFG_SM_INACTIVE    0x0
> > +#define APLIC_SOURCECFG_SM_DETACH      0x1
> > +#define APLIC_SOURCECFG_SM_EDGE_RISE   0x4
> > +#define APLIC_SOURCECFG_SM_EDGE_FALL   0x5
> > +#define APLIC_SOURCECFG_SM_LEVEL_HIGH  0x6
> > +#define APLIC_SOURCECFG_SM_LEVEL_LOW   0x7
> > +
> > +#define APLIC_MMSICFGADDR              0x1bc0
> > +#define APLIC_MMSICFGADDRH             0x1bc4
> > +#define APLIC_SMSICFGADDR              0x1bc8
> > +#define APLIC_SMSICFGADDRH             0x1bcc
> > +
> > +#define APLIC_xMSICFGADDRH_L           (1UL << 31)
> > +#define APLIC_xMSICFGADDRH_HHXS_MASK   0x1f
> > +#define APLIC_xMSICFGADDRH_HHXS_SHIFT  24
> > +#define APLIC_xMSICFGADDRH_LHXS_MASK   0x7
> > +#define APLIC_xMSICFGADDRH_LHXS_SHIFT  20
> > +#define APLIC_xMSICFGADDRH_HHXW_MASK   0x7
> > +#define APLIC_xMSICFGADDRH_HHXW_SHIFT  16
> > +#define APLIC_xMSICFGADDRH_LHXW_MASK   0xf
> > +#define APLIC_xMSICFGADDRH_LHXW_SHIFT  12
> > +#define APLIC_xMSICFGADDRH_BAPPN_MASK  0xfff
> > +
> > +#define APLIC_xMSICFGADDR_PPN_SHIFT    12
> > +
> > +#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
> > +       ((1UL << (__lhxs)) - 1)
> > +
> > +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
> > +       ((1UL << (__lhxw)) - 1)
> > +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
> > +       ((__lhxs))
> > +#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
> > +       (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
> > +        APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
> > +
> > +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
> > +       ((1UL << (__hhxw)) - 1)
> > +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
> > +       ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
> > +#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
> > +       (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
> > +        APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
> > +
> > +#define APLIC_SETIP_BASE               0x1c00
> > +#define APLIC_SETIPNUM                 0x1cdc
> > +
> > +#define APLIC_CLRIP_BASE               0x1d00
> > +#define APLIC_CLRIPNUM                 0x1ddc
> > +
> > +#define APLIC_SETIE_BASE               0x1e00
> > +#define APLIC_SETIENUM                 0x1edc
> > +
> > +#define APLIC_CLRIE_BASE               0x1f00
> > +#define APLIC_CLRIENUM                 0x1fdc
> > +
> > +#define APLIC_SETIPNUM_LE              0x2000
> > +#define APLIC_SETIPNUM_BE              0x2004
> > +
> > +#define APLIC_TARGET_BASE              0x3004
> > +#define APLIC_TARGET_HART_IDX_SHIFT    18
> > +#define APLIC_TARGET_HART_IDX_MASK     0x3fff
> > +#define APLIC_TARGET_GUEST_IDX_SHIFT   12
> > +#define APLIC_TARGET_GUEST_IDX_MASK    0x3f
> > +#define APLIC_TARGET_IPRIO_MASK        0xff
> > +#define APLIC_TARGET_EIID_MASK 0x7ff
> > +
> > +#define APLIC_IDC_BASE                 0x4000
> > +#define APLIC_IDC_SIZE                 32
> > +
> > +#define APLIC_IDC_IDELIVERY            0x00
> > +
> > +#define APLIC_IDC_IFORCE               0x04
> > +
> > +#define APLIC_IDC_ITHRESHOLD           0x08
> > +
> > +#define APLIC_IDC_TOPI                 0x18
> > +#define APLIC_IDC_TOPI_ID_SHIFT        16
> > +#define APLIC_IDC_TOPI_ID_MASK 0x3ff
> > +#define APLIC_IDC_TOPI_PRIO_MASK       0xff
> > +
> > +#define APLIC_IDC_CLAIMI               0x1c
> > +
> > +#define APLIC_DEFAULT_PRIORITY         1
> > +#define APLIC_DISABLE_IDELIVERY                0
> > +#define APLIC_ENABLE_IDELIVERY         1
> > +#define APLIC_DISABLE_ITHRESHOLD       1
> > +#define APLIC_ENABLE_ITHRESHOLD                0
> > +
> > +static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
> > +                               void *msicfgaddr, void *msicfgaddrH)
> > +{
> > +       u32 val;
> > +       unsigned long base_ppn;
> > +
> > +       /* Check if MSI config is already locked */
> > +       if (readl(msicfgaddrH) & APLIC_xMSICFGADDRH_L)
> > +               return;
> > +
> > +       /* Compute the MSI base PPN */
> > +       base_ppn = msicfg->base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
> > +       base_ppn &= ~APLIC_xMSICFGADDR_PPN_HART(msicfg->lhxs);
> > +       base_ppn &= ~APLIC_xMSICFGADDR_PPN_LHX(msicfg->lhxw, msicfg->lhxs);
> > +       base_ppn &= ~APLIC_xMSICFGADDR_PPN_HHX(msicfg->hhxw, msicfg->hhxs);
> > +
> > +       /* Write the lower MSI config register */
> > +       writel((u32)base_ppn, msicfgaddr);
> > +
> > +       /* Write the upper MSI config register */
> > +       val = (((u64)base_ppn) >> 32) &
> > +               APLIC_xMSICFGADDRH_BAPPN_MASK;
> > +       val |= (msicfg->lhxw & APLIC_xMSICFGADDRH_LHXW_MASK)
> > +               << APLIC_xMSICFGADDRH_LHXW_SHIFT;
> > +       val |= (msicfg->hhxw & APLIC_xMSICFGADDRH_HHXW_MASK)
> > +               << APLIC_xMSICFGADDRH_HHXW_SHIFT;
> > +       val |= (msicfg->lhxs & APLIC_xMSICFGADDRH_LHXS_MASK)
> > +               << APLIC_xMSICFGADDRH_LHXS_SHIFT;
> > +       val |= (msicfg->hhxs & APLIC_xMSICFGADDRH_HHXS_MASK)
> > +               << APLIC_xMSICFGADDRH_HHXS_SHIFT;
> > +       writel(val, msicfgaddrH);
> > +}
> > +
> > +static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
> > +{
> > +       if (APLIC_xMSICFGADDRH_LHXS_MASK < msicfg->lhxs)
> > +               return SBI_EINVAL;
> > +
> > +       if (APLIC_xMSICFGADDRH_LHXW_MASK < msicfg->lhxw)
> > +               return SBI_EINVAL;
> > +
> > +       if (APLIC_xMSICFGADDRH_HHXS_MASK < msicfg->hhxs)
> > +               return SBI_EINVAL;
> > +
> > +       if (APLIC_xMSICFGADDRH_HHXW_MASK < msicfg->hhxw)
> > +               return SBI_EINVAL;
> > +
> > +       return 0;
> > +}
> > +
> > +int aplic_cold_irqchip_init(struct aplic_data *aplic)
> > +{
> > +       int rc;
> > +       u32 i, j, tmp;
> > +       struct sbi_domain_memregion reg;
> > +       struct aplic_delegate_data *deleg;
> > +       u32 first_deleg_irq, last_deleg_irq;
> > +
> > +       /* Sanity checks */
> > +       if (!aplic ||
> > +           !aplic->num_source || APLIC_MAX_SOURCE <= aplic->num_source ||
> > +           APLIC_MAX_IDC <= aplic->num_idc)
> > +               return SBI_EINVAL;
> > +       if (aplic->targets_mmode && aplic->has_msicfg_mmode) {
> > +               rc = aplic_check_msicfg(&aplic->msicfg_mmode);
> > +               if (rc)
> > +                       return rc;
> > +       }
> > +       if (aplic->targets_mmode && aplic->has_msicfg_smode) {
> > +               rc = aplic_check_msicfg(&aplic->msicfg_smode);
> > +               if (rc)
> > +                       return rc;
> > +       }
> > +
> > +       /* Set domain configuration to 0 */
> > +       writel(0, (void *)(aplic->addr + APLIC_DOMAINCFG));
> > +
> > +       /* Disable all interrupts */
> > +       for (i = 0; i <= aplic->num_source; i++)
> > +               writel(-1U, (void *)(aplic->addr + APLIC_CLRIE_BASE +
> > +                                    (i / 32) * sizeof(u32)));
> > +
> > +       /* Set interrupt type and priority for all interrupts */
> > +       for (i = 1; i <= aplic->num_source; i++) {
> > +               /* Set IRQ source configuration to 0 */
> > +               writel(0, (void *)(aplic->addr + APLIC_SOURCECFG_BASE +
> > +                         (i - 1) * sizeof(u32)));
> > +               /* Set IRQ target hart index and priority to 1 */
> > +               writel(APLIC_DEFAULT_PRIORITY, (void *)(aplic->addr +
> > +                                               APLIC_TARGET_BASE +
> > +                                               (i - 1) * sizeof(u32)));
> > +       }
> > +
> > +       /* Configure IRQ delegation */
> > +       first_deleg_irq = -1U;
> > +       last_deleg_irq = 0;
> > +       for (i = 0; i < APLIC_MAX_DELEGATE; i++) {
> > +               deleg = &aplic->delegate[i];
> > +               if (!deleg->first_irq || !deleg->last_irq)
> > +                       continue;
> > +               if (aplic->num_source < deleg->first_irq ||
> > +                   aplic->num_source < deleg->last_irq)
> > +                       continue;
> > +               if (APLIC_SOURCECFG_CHILDIDX_MASK < deleg->child_index)
> > +                       continue;
> > +               if (deleg->first_irq > deleg->last_irq) {
> > +                       tmp = deleg->first_irq;
> > +                       deleg->first_irq = deleg->last_irq;
> > +                       deleg->last_irq = tmp;
> > +               }
> > +               if (deleg->first_irq < first_deleg_irq)
> > +                       first_deleg_irq = deleg->first_irq;
> > +               if (last_deleg_irq < deleg->last_irq)
> > +                       last_deleg_irq = deleg->last_irq;
> > +               for (j = deleg->first_irq; j <= deleg->last_irq; j++)
> > +                       writel(APLIC_SOURCECFG_D | deleg->child_index,
> > +                               (void *)(aplic->addr + APLIC_SOURCECFG_BASE +
> > +                               (j - 1) * sizeof(u32)));
> > +       }
> > +
> > +       /* Default initialization of IDC structures */
> > +       for (i = 0; i < aplic->num_idc; i++) {
> > +               writel(0, (void *)(aplic->addr + APLIC_IDC_BASE +
> > +                         i * APLIC_IDC_SIZE + APLIC_IDC_IDELIVERY));
> > +               writel(0, (void *)(aplic->addr + APLIC_IDC_BASE +
> > +                         i * APLIC_IDC_SIZE + APLIC_IDC_IFORCE));
> > +               writel(APLIC_DISABLE_ITHRESHOLD, (void *)(aplic->addr +
> > +                                                 APLIC_IDC_BASE +
> > +                                                 (i * APLIC_IDC_SIZE) +
> > +                                                 APLIC_IDC_ITHRESHOLD));
> > +       }
> > +
> > +       /* MSI configuration */
> > +       if (aplic->targets_mmode && aplic->has_msicfg_mmode) {
> > +               aplic_writel_msicfg(&aplic->msicfg_mmode,
> > +                               (void *)(aplic->addr + APLIC_MMSICFGADDR),
> > +                               (void *)(aplic->addr + APLIC_MMSICFGADDRH));
> > +       }
> > +       if (aplic->targets_mmode && aplic->has_msicfg_smode) {
> > +               aplic_writel_msicfg(&aplic->msicfg_smode,
> > +                               (void *)(aplic->addr + APLIC_SMSICFGADDR),
> > +                               (void *)(aplic->addr + APLIC_SMSICFGADDRH));
> > +       }
> > +
> > +       /*
> > +        * Add APLIC region to the root domain if:
> > +        * 1) It targets M-mode of any HART directly or via MSIs
> > +        * 2) All interrupts are delegated to some child APLIC
> > +        */
> > +       if (aplic->targets_mmode ||
> > +           ((first_deleg_irq < last_deleg_irq) &&
> > +           (last_deleg_irq == aplic->num_source) &&
> > +           (first_deleg_irq == 1))) {
> > +               sbi_domain_memregion_init(aplic->addr, aplic->size,
> > +                                         SBI_DOMAIN_MEMREGION_MMIO, &reg);
> > +               rc = sbi_domain_root_add_memregion(&reg);
> > +               if (rc)
> > +                       return rc;
> > +       }
> > +
> > +       return 0;
> > +}
> > diff --git a/lib/utils/irqchip/objects.mk b/lib/utils/irqchip/objects.mk
> > index ae6f255..b2b3f79 100644
> > --- a/lib/utils/irqchip/objects.mk
> > +++ b/lib/utils/irqchip/objects.mk
> > @@ -10,5 +10,6 @@
> >  libsbiutils-objs-y += irqchip/fdt_irqchip.o
> >  libsbiutils-objs-y += irqchip/fdt_irqchip_imsic.o
> >  libsbiutils-objs-y += irqchip/fdt_irqchip_plic.o
> > +libsbiutils-objs-y += irqchip/aplic.o
> >  libsbiutils-objs-y += irqchip/imsic.o
> >  libsbiutils-objs-y += irqchip/plic.o
> > --
> > 2.25.1
> >
>
> LGTM.
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

>
> --
> Regards,
> Atish

