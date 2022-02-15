From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Feb 2022 20:50:21 +0530
Subject: [PATCH v2 09/13] lib: utils/irqchip: Add FDT based driver for
 IMSIC
In-Reply-To: <CAOnJCU+YVmXtiMLN+BtdRUNeZNk07NmVnYU7fytpLV-hwF5LCg@mail.gmail.com>
References: <20220209150441.121729-1-apatel@ventanamicro.com>
 <20220209150441.121729-10-apatel@ventanamicro.com>
 <CAOnJCU+YVmXtiMLN+BtdRUNeZNk07NmVnYU7fytpLV-hwF5LCg@mail.gmail.com>
Message-ID: <CAAhSdy1nKxBtfY-aQVQZOxJMGg-0jjEDEOeTexqb1PtPVTgAXw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 12, 2022 at 6:25 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Feb 9, 2022 at 7:05 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We add simple FDT irqchip driver for IMSIC so that generic platform
> > (and other FDT based platforms) can utilize common IMIC library.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi_utils/fdt/fdt_helper.h    |   6 ++
> >  lib/utils/fdt/fdt_helper.c            | 103 +++++++++++++++++++++++++
> >  lib/utils/irqchip/fdt_irqchip.c       |   2 +
> >  lib/utils/irqchip/fdt_irqchip_imsic.c | 106 ++++++++++++++++++++++++++
> >  lib/utils/irqchip/objects.mk          |   1 +
> >  platform/generic/platform.c           |  12 +++
> >  6 files changed, 230 insertions(+)
> >  create mode 100644 lib/utils/irqchip/fdt_irqchip_imsic.c
> >
> > diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> > index 24fee7a..4c8d29e 100644
> > --- a/include/sbi_utils/fdt/fdt_helper.h
> > +++ b/include/sbi_utils/fdt/fdt_helper.h
> > @@ -68,6 +68,12 @@ int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
> >  int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
> >                        const char *compatible);
> >
> > +struct imsic_data;
> > +
> > +bool fdt_check_imsic_mlevel(void *fdt);
> > +
> > +int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic);
> > +
> >  struct plic_data;
> >
> >  int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic);
> > diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> > index 5bf4021..e179b79 100644
> > --- a/lib/utils/fdt/fdt_helper.c
> > +++ b/lib/utils/fdt/fdt_helper.c
> > @@ -13,6 +13,7 @@
> >  #include <sbi/sbi_platform.h>
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi_utils/fdt/fdt_helper.h>
> > +#include <sbi_utils/irqchip/imsic.h>
> >  #include <sbi_utils/irqchip/plic.h>
> >
> >  #define DEFAULT_UART_FREQ              0
> > @@ -465,6 +466,108 @@ int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
> >         return fdt_parse_uart8250_node(fdt, nodeoffset, uart);
> >  }
> >
> > +bool fdt_check_imsic_mlevel(void *fdt)
> > +{
> > +       const fdt32_t *val;
> > +       int i, len, noff = 0;
> > +
> > +       if (!fdt)
> > +               return false;
> > +
> > +       while ((noff = fdt_node_offset_by_compatible(fdt, noff,
> > +                                                    "riscv,imsics")) >= 0) {
> > +               val = fdt_getprop(fdt, noff, "interrupts-extended", &len);
> > +               if (val && len > sizeof(fdt32_t)) {
> > +                       len = len / sizeof(fdt32_t);
> > +                       for (i = 0; i < len; i += 2) {
> > +                               if (fdt32_to_cpu(val[i + 1]) == IRQ_M_EXT)
> > +                                       return true;
> > +                       }
> > +               }
> > +       }
> > +
> > +       return false;
> > +}
> > +
> > +int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic)
> > +{
> > +       const fdt32_t *val;
> > +       struct imsic_regs *regs;
> > +       uint64_t reg_addr, reg_size;
> > +       int i, rc, len, nr_parent_irqs;
> > +
> > +       if (nodeoff < 0 || !imsic || !fdt)
> > +               return SBI_ENODEV;
> > +
> > +       imsic->targets_mmode = false;
> > +       val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &len);
> > +       if (val && len > sizeof(fdt32_t)) {
> > +               len = len / sizeof(fdt32_t);
> > +               nr_parent_irqs = len / 2;
> > +               for (i = 0; i < len; i += 2) {
> > +                       if (fdt32_to_cpu(val[i + 1]) == IRQ_M_EXT) {
> > +                               imsic->targets_mmode = true;
> > +                               break;
> > +                       }
> > +               }
> > +       } else
> > +               return SBI_EINVAL;
> > +
> > +       val = fdt_getprop(fdt, nodeoff, "riscv,guest-index-bits", &len);
> > +       if (val && len > 0)
> > +               imsic->guest_index_bits = fdt32_to_cpu(*val);
> > +       else
> > +               imsic->guest_index_bits = 0;
> > +
> > +       val = fdt_getprop(fdt, nodeoff, "riscv,hart-index-bits", &len);
> > +       if (val && len > 0) {
> > +               imsic->hart_index_bits = fdt32_to_cpu(*val);
> > +       } else {
> > +               imsic->hart_index_bits = sbi_fls(nr_parent_irqs);
> > +               if ((1UL << imsic->hart_index_bits) < nr_parent_irqs)
> > +                       imsic->hart_index_bits++;
> > +       }
> > +
> > +       val = fdt_getprop(fdt, nodeoff, "riscv,group-index-bits", &len);
> > +       if (val && len > 0)
> > +               imsic->group_index_bits = fdt32_to_cpu(*val);
> > +       else
> > +               imsic->group_index_bits = 0;
> > +
> > +       val = fdt_getprop(fdt, nodeoff, "riscv,group-index-shift", &len);
> > +       if (val && len > 0)
> > +               imsic->group_index_shift = fdt32_to_cpu(*val);
> > +       else
> > +               imsic->group_index_shift = 2 * IMSIC_MMIO_PAGE_SHIFT;
> > +
> > +       val = fdt_getprop(fdt, nodeoff, "riscv,num-ids", &len);
> > +       if (val && len > 0)
> > +               imsic->num_ids = fdt32_to_cpu(*val);
> > +       else
> > +               return SBI_EINVAL;
> > +
> > +       for (i = 0; i < IMSIC_MAX_REGS; i++) {
> > +               regs = &imsic->regs[i];
> > +               regs->addr = 0;
> > +               regs->size = 0;
> > +       }
> > +
> > +       for (i = 0; i < (IMSIC_MAX_REGS - 1); i++) {
> > +               regs = &imsic->regs[i];
> > +
> > +               rc = fdt_get_node_addr_size(fdt, nodeoff, i,
> > +                                           &reg_addr, &reg_size);
> > +               if (rc < 0 || !reg_addr || !reg_size)
> > +                       break;
> > +               regs->addr = reg_addr;
> > +               regs->size = reg_size;
> > +       };
> > +       if (!imsic->regs[0].size)
> > +               return SBI_EINVAL;
> > +
> > +       return 0;
> > +}
> > +
> >  int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic)
> >  {
> >         int len, rc;
> > diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
> > index bf6969a..cf64a2e 100644
> > --- a/lib/utils/irqchip/fdt_irqchip.c
> > +++ b/lib/utils/irqchip/fdt_irqchip.c
> > @@ -12,9 +12,11 @@
> >  #include <sbi_utils/fdt/fdt_helper.h>
> >  #include <sbi_utils/irqchip/fdt_irqchip.h>
> >
> > +extern struct fdt_irqchip fdt_irqchip_imsic;
> >  extern struct fdt_irqchip fdt_irqchip_plic;
> >
> >  static struct fdt_irqchip *irqchip_drivers[] = {
> > +       &fdt_irqchip_imsic,
> >         &fdt_irqchip_plic
> >  };
> >
> > diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
> > new file mode 100644
> > index 0000000..b6962be
> > --- /dev/null
> > +++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
> > @@ -0,0 +1,106 @@
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
> > +#include <libfdt.h>
> > +#include <sbi/riscv_asm.h>
> > +#include <sbi/sbi_error.h>
> > +#include <sbi/sbi_hartmask.h>
> > +#include <sbi_utils/fdt/fdt_helper.h>
> > +#include <sbi_utils/irqchip/fdt_irqchip.h>
> > +#include <sbi_utils/irqchip/imsic.h>
> > +
> > +#define IMSIC_MAX_NR                   16
> > +
> > +static unsigned long imsic_count = 0;
> > +static struct imsic_data imsic[IMSIC_MAX_NR];
> > +
> > +static int irqchip_imsic_update_hartid_table(void *fdt, int nodeoff,
> > +                                            struct imsic_data *id)
> > +{
> > +       const fdt32_t *val;
> > +       u32 phandle, hwirq, hartid;
> > +       int i, err, count, cpu_offset, cpu_intc_offset;
> > +
> > +       val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
> > +       if (!val || count < sizeof(fdt32_t))
> > +               return SBI_EINVAL;
> > +       count = count / sizeof(fdt32_t);
> > +
> > +       for (i = 0; i < count; i += 2) {
> > +               phandle = fdt32_to_cpu(val[i]);
> > +               hwirq = fdt32_to_cpu(val[i + 1]);
> > +
> > +               cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
> > +               if (cpu_intc_offset < 0)
> > +                       continue;
> > +
> > +               cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
> > +               if (cpu_intc_offset < 0)
> > +                       continue;
> > +
> > +               err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
> > +               if (err)
> > +                       return SBI_EINVAL;
> > +               if (SBI_HARTMASK_MAX_BITS <= hartid)
> > +                       return SBI_EINVAL;
> > +
> > +               switch (hwirq) {
> > +               case IRQ_M_EXT:
> > +                       err = imsic_map_hartid_to_data(hartid, id, i / 2);
> > +                       if (err)
> > +                               return err;
> > +                       break;
> > +               default:
> > +                       break;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int irqchip_imsic_cold_init(void *fdt, int nodeoff,
> > +                                   const struct fdt_match *match)
> > +{
> > +       int rc;
> > +       struct imsic_data *id;
> > +
> > +       if (IMSIC_MAX_NR <= imsic_count)
> > +               return SBI_ENOSPC;
> > +       id = &imsic[imsic_count];
> > +
> > +       rc = fdt_parse_imsic_node(fdt, nodeoff, id);
> > +       if (rc)
> > +               return rc;
> > +       if (!id->targets_mmode)
> > +               return 0;
> > +
> > +       rc = irqchip_imsic_update_hartid_table(fdt, nodeoff, id);
> > +       if (rc)
> > +               return rc;
> > +
> > +       rc = imsic_cold_irqchip_init(id);
> > +       if (rc)
> > +               return rc;
> > +
> > +       imsic_count++;
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct fdt_match irqchip_imsic_match[] = {
> > +       { .compatible = "riscv,imsics" },
> > +       { },
> > +};
> > +
> > +struct fdt_irqchip fdt_irqchip_imsic = {
> > +       .match_table = irqchip_imsic_match,
> > +       .cold_init = irqchip_imsic_cold_init,
> > +       .warm_init = imsic_warm_irqchip_init,
> > +};
> > diff --git a/lib/utils/irqchip/objects.mk b/lib/utils/irqchip/objects.mk
> > index 76a3c94..ae6f255 100644
> > --- a/lib/utils/irqchip/objects.mk
> > +++ b/lib/utils/irqchip/objects.mk
> > @@ -8,6 +8,7 @@
> >  #
> >
> >  libsbiutils-objs-y += irqchip/fdt_irqchip.o
> > +libsbiutils-objs-y += irqchip/fdt_irqchip_imsic.o
> >  libsbiutils-objs-y += irqchip/fdt_irqchip_plic.o
> >  libsbiutils-objs-y += irqchip/imsic.o
> >  libsbiutils-objs-y += irqchip/plic.o
> > diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> > index bc6e761..8a4fb70 100644
> > --- a/platform/generic/platform.c
> > +++ b/platform/generic/platform.c
> > @@ -18,6 +18,7 @@
> >  #include <sbi_utils/fdt/fdt_helper.h>
> >  #include <sbi_utils/fdt/fdt_pmu.h>
> >  #include <sbi_utils/irqchip/fdt_irqchip.h>
> > +#include <sbi_utils/irqchip/imsic.h>
> >  #include <sbi_utils/serial/fdt_serial.h>
> >  #include <sbi_utils/timer/fdt_timer.h>
> >  #include <sbi_utils/ipi/fdt_ipi.h>
> > @@ -56,6 +57,7 @@ static void fw_platform_lookup_special(void *fdt, int root_offset)
> >  }
> >
> >  extern struct sbi_platform platform;
> > +static bool platform_has_mlevel_imsic = false;
> >  static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = { 0 };
> >
> >  /*
> > @@ -110,6 +112,8 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> >
> >         platform.hart_count = hart_count;
> >
> > +       platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
> > +
> >         /* Return original FDT pointer */
> >         return arg1;
> >
> > @@ -118,6 +122,13 @@ fail:
> >                 wfi();
> >  }
> >
> > +static int generic_nascent_init(void)
> > +{
> > +       if (platform_has_mlevel_imsic)
> > +               imsic_local_irqchip_init();
> > +       return 0;
> > +}
> > +
> >  static int generic_early_init(bool cold_boot)
> >  {
> >         if (!generic_plat || !generic_plat->early_init)
> > @@ -210,6 +221,7 @@ static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
> >  }
> >
> >  const struct sbi_platform_operations platform_ops = {
> > +       .nascent_init           = generic_nascent_init,
> >         .early_init             = generic_early_init,
> >         .final_init             = generic_final_init,
> >         .early_exit             = generic_early_exit,
> > --
> > 2.25.1
> >
>
> LGTM. Just a suggestion:
>
> I find it bit difficult to follow the code without the dt-bindings
> [1]. The DT bindings may also change
> in future based on feedback from the kernel/device tree mailing list.
> It may take some time to freeze
> the AIA spec as well.
>
> Should we keep the DT binding in OpenSBI as well so it is easier to
> follow the code without referring
> the DT binding in your tree.
>
> We can remove the DT binding once it is merged to upstream Linux to
> avoid duplication.
>
> [1] https://github.com/avpatel/linux/commit/059542fbcf644a42b135600ef3dd36d88e11f831
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

>
>
> --
> Regards,
> Atish

