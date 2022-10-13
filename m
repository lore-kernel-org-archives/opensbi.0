From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 09:16:43 +0530
Subject: [PATCH v3 11/13] lib: utils/ipi: Add Andes fdt ipi driver support
In-Reply-To: <20221013022951.5206-12-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com> <20221013022951.5206-12-peterlin@andestech.com>
Message-ID: <CAAhSdy0LdSbtd4MLJJRDN07DwG8yay_neqDOxVumOOzH5137sg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 13, 2022 at 8:01 AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Move Andes PLICSW ipi device to fdt ipi framework, this patch is based
> on Leo's modified IPI scheme on PLICSW.
>
> Current IPI scheme uses bit 0 of pending reigster on PLICSW to send IPI
> from hart 0 to hart 7, but bit 0 needs to be hardwired to 0 according
> to spec. After some investigation, self-IPI seems to be seldom or never
> used, so we re-order the IPI scheme to support 8 core platforms.
>
> dts example (Quad-core AX45MP):
>
>   plicsw: interrupt-controller at e6400000 {
>           compatible = "andestech,plicsw";
>           reg = <0x00000000 0xe6400000 0x00000000 0x00400000>;
>           interrupts-extended = <&CPU0_intc 3
>                                  &CPU1_intc 3
>                                  &CPU2_intc 3
>                                  &CPU3_intc 3>;
>           interrupt-controller;
>           #address-cells = <2>;
>           #interrupt-cells = <2>;
>   };
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3
>   - Remove "riscv,ndev" from plicsw device tree node and drop "num_src"
>   - Use sbi_domain_root_add_memrange() to add PLICSW region to root domain
> ---
>  include/sbi_utils/fdt/fdt_helper.h   |   3 +
>  include/sbi_utils/ipi/andes_plicsw.h |  49 ++++++++++
>  lib/utils/fdt/fdt_helper.c           |  55 +++++++++++
>  lib/utils/ipi/Kconfig                |   9 ++
>  lib/utils/ipi/andes_plicsw.c         |  85 ++++++++++++++++
>  lib/utils/ipi/fdt_ipi_plicsw.c       |  87 +++++++++++++++++
>  lib/utils/ipi/objects.mk             |   4 +
>  platform/andes/ae350/Kconfig         |   2 +
>  platform/andes/ae350/objects.mk      |   2 +-
>  platform/andes/ae350/platform.c      |  27 +-----
>  platform/andes/ae350/platform.h      |   2 -
>  platform/andes/ae350/plicsw.c        | 139 ---------------------------
>  platform/andes/ae350/plicsw.h        |  44 ---------
>  13 files changed, 297 insertions(+), 211 deletions(-)
>  create mode 100644 include/sbi_utils/ipi/andes_plicsw.h
>  create mode 100644 lib/utils/ipi/andes_plicsw.c
>  create mode 100644 lib/utils/ipi/fdt_ipi_plicsw.c
>  delete mode 100644 platform/andes/ae350/plicsw.c
>  delete mode 100644 platform/andes/ae350/plicsw.h
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 7ef63c9..c39f77a 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -98,6 +98,9 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
>  int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
>                           unsigned long *plmt_size, u32 *hart_count);
>
> +int fdt_parse_plicsw_node(void *fdt, int nodeoffset, unsigned long *plicsw_base,
> +                         unsigned long *size, u32 *hart_count);
> +
>  int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
>                           const char *compatible);
>
> diff --git a/include/sbi_utils/ipi/andes_plicsw.h b/include/sbi_utils/ipi/andes_plicsw.h
> new file mode 100644
> index 0000000..40fb60e
> --- /dev/null
> +++ b/include/sbi_utils/ipi/andes_plicsw.h
> @@ -0,0 +1,49 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Andes Technology Corporation
> + *
> + * Authors:
> + *   Zong Li <zong@andestech.com>
> + *   Nylon Chen <nylon7@andestech.com>
> + *   Leo Yu-Chi Liang <ycliang@andestech.com>
> + *   Yu Chien Peter Lin <peterlin@andestech.com>
> + */
> +
> +#include <sbi/riscv_asm.h>
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_types.h>
> +
> +#ifndef _IPI_ANDES_PLICSW_H_
> +#define _IPI_ANDES_PLICSW_H_
> +
> +#define PLICSW_PRIORITY_BASE 0x4
> +
> +#define PLICSW_PENDING_BASE 0x1000
> +#define PLICSW_PENDING_STRIDE 0x8
> +
> +#define PLICSW_ENABLE_BASE 0x2000
> +#define PLICSW_ENABLE_STRIDE 0x80
> +
> +#define PLICSW_CONTEXT_BASE 0x200000
> +#define PLICSW_CONTEXT_STRIDE 0x1000
> +#define PLICSW_CONTEXT_CLAIM 0x4
> +
> +#define PLICSW_HART_MASK 0x01010101
> +
> +#define PLICSW_HART_MAX_NR 8
> +
> +#define PLICSW_REGION_ALIGN 0x1000
> +
> +struct plicsw_data {
> +       unsigned long addr;
> +       unsigned long size;
> +       uint32_t hart_count;
> +       /* hart id to source id table */
> +       uint32_t source_id[PLICSW_HART_MAX_NR];
> +};
> +
> +void plicsw_ipi_send(u32 target_hart);
> +void plicsw_ipi_clear(u32 target_hart);
> +
> +#endif /* _IPI_ANDES_PLICSW_H_ */
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index ce52fca..b97c849 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -889,6 +889,61 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
>         return 0;
>  }
>
> +int fdt_parse_plicsw_node(void *fdt, int nodeoffset, unsigned long *plicsw_base,
> +                         unsigned long *size, u32 *hart_count)
> +{
> +       const fdt32_t *val;
> +       int rc, i, count;
> +       uint64_t reg_addr, reg_size, cpu_offset, cpu_intc_offset;
> +       u32 phandle, hwirq, hartid, hcount;
> +
> +       if (nodeoffset < 0 || !fdt || !plicsw_base ||
> +           !hart_count || !size)
> +               return SBI_EINVAL;
> +
> +       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> +                                   &reg_addr, &reg_size);
> +       if (rc < 0 || !plicsw_base || !size)
> +               return SBI_ENODEV;
> +       *plicsw_base = reg_addr;
> +       *size = reg_size;
> +
> +       val = fdt_getprop(fdt, nodeoffset, "interrupts-extended", &count);
> +       if (!val || count < sizeof(fdt32_t))
> +               return 0;
> +       count = count / sizeof(fdt32_t);
> +
> +       hcount = 0;
> +       for (i = 0; i < (count / 2); i++) {
> +               phandle = fdt32_to_cpu(val[2 * i]);
> +               hwirq = fdt32_to_cpu(val[2 * i + 1]);
> +
> +               cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
> +               if (cpu_intc_offset < 0)
> +                       continue;
> +
> +               cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
> +               if (cpu_intc_offset < 0)
> +                       continue;
> +
> +               rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
> +
> +               if (rc)
> +                       continue;
> +
> +               if (SBI_HARTMASK_MAX_BITS <= hartid)
> +                       continue;
> +
> +               if (hwirq == IRQ_M_SOFT)
> +                       hcount++;
> +       }
> +
> +       *hart_count = hcount;
> +
> +       return 0;
> +}
> +
> +

Drop the extra newline from here.

>  int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
>                           const char *compatible)
>  {
> diff --git a/lib/utils/ipi/Kconfig b/lib/utils/ipi/Kconfig
> index efc8960..3718852 100644
> --- a/lib/utils/ipi/Kconfig
> +++ b/lib/utils/ipi/Kconfig
> @@ -14,10 +14,19 @@ config FDT_IPI_MSWI
>         select IPI_MSWI
>         default n
>
> +config FDT_IPI_PLICSW
> +       bool "Andes PLICSW FDT driver"
> +       select IPI_PLICSW
> +       default n
> +
>  endif
>
>  config IPI_MSWI
>         bool "ACLINT MSWI support"
>         default n
>
> +config IPI_PLICSW
> +       bool "Andes PLICSW support"
> +       default n
> +
>  endmenu
> diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
> new file mode 100644
> index 0000000..f353610
> --- /dev/null
> +++ b/lib/utils/ipi/andes_plicsw.c
> @@ -0,0 +1,85 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Andes Technology Corporation
> + *
> + * Authors:
> + *   Zong Li <zong@andestech.com>
> + *   Nylon Chen <nylon7@andestech.com>
> + *   Leo Yu-Chi Liang <ycliang@andestech.com>
> + *   Yu Chien Peter Lin <peterlin@andestech.com>
> + */
> +
> +#include <sbi/sbi_types.h>
> +#include <sbi_utils/ipi/andes_plicsw.h>
> +
> +extern struct plicsw_data plicsw;
> +
> +static inline void plicsw_claim(void)
> +{
> +       u32 hartid = current_hartid();
> +
> +       if (plicsw.hart_count <= hartid)
> +               ebreak();
> +
> +       plicsw.source_id[hartid] =
> +               readl((void *)plicsw.addr + PLICSW_CONTEXT_BASE +
> +                     PLICSW_CONTEXT_CLAIM + PLICSW_CONTEXT_STRIDE * hartid);
> +}
> +
> +static inline void plicsw_complete(void)
> +{
> +       u32 hartid = current_hartid();
> +       u32 source = plicsw.source_id[hartid];
> +
> +       writel(source, (void *)plicsw.addr + PLICSW_CONTEXT_BASE +
> +                              PLICSW_CONTEXT_CLAIM +
> +                              PLICSW_CONTEXT_STRIDE * hartid);
> +}
> +
> +static inline void plic_sw_pending(u32 target_hart)
> +{
> +       /*
> +        * The pending array registers are w1s type.
> +        * IPI pending array mapping as following:
> +        *
> +        * Pending array start address: base + 0x1000
> +        * ---------------------------------
> +        * | hart3 | hart2 | hart1 | hart0 |
> +        * ---------------------------------
> +        * Each hartX can send IPI to another hart by setting the
> +        * bitY to its own region (see the below).
> +        *
> +        * In each hartX region:
> +        * <---------- PICSW_PENDING_STRIDE -------->
> +        * | bit7 | ... | bit3 | bit2 | bit1 | bit0 |
> +        * ------------------------------------------
> +        * The bitY of hartX region indicates that hartX sends an
> +        * IPI to hartY.
> +        */
> +       u32 hartid          = current_hartid();
> +       u32 word_index      = hartid / 4;
> +       u32 per_hart_offset = PLICSW_PENDING_STRIDE * hartid;
> +       u32 val             = 1 << target_hart << per_hart_offset;
> +
> +       writel(val, (void *)plicsw.addr + PLICSW_PENDING_BASE + word_index * 4);
> +}
> +
> +void plicsw_ipi_send(u32 target_hart)
> +{
> +       if (plicsw.hart_count <= target_hart)
> +               ebreak();
> +
> +       /* Set PLICSW IPI */
> +       plic_sw_pending(target_hart);
> +}
> +
> +void plicsw_ipi_clear(u32 target_hart)
> +{
> +       if (plicsw.hart_count <= target_hart)
> +               ebreak();
> +
> +       /* Clear PLICSW IPI */
> +       plicsw_claim();
> +       plicsw_complete();
> +}
> diff --git a/lib/utils/ipi/fdt_ipi_plicsw.c b/lib/utils/ipi/fdt_ipi_plicsw.c
> new file mode 100644
> index 0000000..957dc48
> --- /dev/null
> +++ b/lib/utils/ipi/fdt_ipi_plicsw.c
> @@ -0,0 +1,87 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Andes Technology Corporation
> + *
> + * Authors:
> + *   Zong Li <zong@andestech.com>
> + *   Nylon Chen <nylon7@andestech.com>
> + *   Leo Yu-Chi Liang <ycliang@andestech.com>
> + *   Yu Chien Peter Lin <peterlin@andestech.com>
> + */
> +
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_ipi.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/ipi/fdt_ipi.h>
> +#include <sbi_utils/ipi/andes_plicsw.h>
> +
> +struct plicsw_data plicsw;
> +
> +static struct sbi_ipi_device plicsw_ipi = {
> +       .name      = "andes_plicsw",
> +       .ipi_send  = plicsw_ipi_send,
> +       .ipi_clear = plicsw_ipi_clear
> +};

Move both of the above to andes_plicsw.c

> +
> +static int plicsw_warm_ipi_init(void)
> +{
> +       u32 hartid = current_hartid();
> +
> +       /* Clear PLICSW IPI */
> +       plicsw_ipi_clear(hartid);
> +
> +       return 0;
> +}
> +
> +static int plicsw_cold_ipi_init(void *fdt, int nodeoff,
> +                               const struct fdt_match *match)
> +{
> +       int rc;
> +
> +       rc = fdt_parse_plicsw_node(fdt, nodeoff, &plicsw.addr, &plicsw.size,
> +                                  &plicsw.hart_count);
> +       if (rc)
> +               return rc;
> +
> +       /* Setup source priority */
> +       uint32_t *priority = (void *)plicsw.addr + PLICSW_PRIORITY_BASE;
> +
> +       for (int i = 0; i < plicsw.hart_count; i++)
> +               writel(1, &priority[i]);
> +
> +       /* Setup target enable */
> +       uint32_t enable_mask = PLICSW_HART_MASK;
> +
> +       for (int i = 0; i < plicsw.hart_count; i++) {
> +               uint32_t *enable = (void *)plicsw.addr + PLICSW_ENABLE_BASE +
> +                                  PLICSW_ENABLE_STRIDE * i;
> +               writel(enable_mask, enable);
> +               writel(enable_mask, enable + 1);
> +               enable_mask <<= 1;
> +       }
> +
> +       /* Add PLICSW region to the root domain */
> +       rc = sbi_domain_root_add_memrange(plicsw.addr, plicsw.size,
> +                                         PLICSW_REGION_ALIGN,
> +                                         SBI_DOMAIN_MEMREGION_MMIO);
> +       if (rc)
> +               return rc;
> +
> +       sbi_ipi_set_device(&plicsw_ipi);

Both sbi_domain_root_add_memrange() and sbi_ipi_set_device() should
be done by plicsw_cold_ipi_init() defined in andes_plicsw.c

The plicsw_cold_ipi_init() over here can be renamed to
fdt_plicsw_cold_ipi_init() or something similar.

> +
> +       return 0;
> +}
> +
> +static const struct fdt_match ipi_plicsw_match[] = {
> +       { .compatible = "andestech,plicsw" },
> +       {},
> +};
> +
> +struct fdt_ipi fdt_ipi_plicsw = {
> +       .match_table = ipi_plicsw_match,
> +       .cold_init   = plicsw_cold_ipi_init,
> +       .warm_init   = plicsw_warm_ipi_init,
> +       .exit        = NULL,
> +};
> diff --git a/lib/utils/ipi/objects.mk b/lib/utils/ipi/objects.mk
> index 0600cac..999e7bd 100644
> --- a/lib/utils/ipi/objects.mk
> +++ b/lib/utils/ipi/objects.mk
> @@ -8,9 +8,13 @@
>  #
>
>  libsbiutils-objs-$(CONFIG_IPI_MSWI) += ipi/aclint_mswi.o
> +libsbiutils-objs-$(CONFIG_IPI_PLICSW) += ipi/andes_plicsw.o
>
>  libsbiutils-objs-$(CONFIG_FDT_IPI) += ipi/fdt_ipi.o
>  libsbiutils-objs-$(CONFIG_FDT_IPI) += ipi/fdt_ipi_drivers.o
>
>  carray-fdt_ipi_drivers-$(CONFIG_FDT_IPI_MSWI) += fdt_ipi_mswi
>  libsbiutils-objs-$(CONFIG_FDT_IPI_MSWI) += ipi/fdt_ipi_mswi.o
> +
> +carray-fdt_ipi_drivers-$(CONFIG_FDT_IPI_PLICSW) += fdt_ipi_plicsw
> +libsbiutils-objs-$(CONFIG_FDT_IPI_PLICSW) += ipi/fdt_ipi_plicsw.o
> diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
> index 084b27f..38e4001 100644
> --- a/platform/andes/ae350/Kconfig
> +++ b/platform/andes/ae350/Kconfig
> @@ -11,6 +11,8 @@ config PLATFORM_ANDES_AE350
>         select FDT_RESET_ATCWDT200
>         select FDT_IRQCHIP
>         select FDT_IRQCHIP_PLIC
> +       select FDT_IPI
> +       select FDT_IPI_PLICSW
>         default y
>
>  if PLATFORM_ANDES_AE350
> diff --git a/platform/andes/ae350/objects.mk b/platform/andes/ae350/objects.mk
> index 1ccb894..a4a2332 100644
> --- a/platform/andes/ae350/objects.mk
> +++ b/platform/andes/ae350/objects.mk
> @@ -15,7 +15,7 @@ platform-asflags-y =
>  platform-ldflags-y =
>
>  # Objects to build
> -platform-objs-y += cache.o platform.o plicsw.o
> +platform-objs-y += cache.o platform.o
>
>  # Blobs to build
>  FW_TEXT_START=0x00000000
> diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
> index cf5417c..30e4606 100644
> --- a/platform/andes/ae350/platform.c
> +++ b/platform/andes/ae350/platform.c
> @@ -25,8 +25,8 @@
>  #include <sbi_utils/reset/fdt_reset.h>
>  #include <sbi_utils/serial/fdt_serial.h>
>  #include <sbi_utils/timer/fdt_timer.h>
> +#include <sbi_utils/ipi/fdt_ipi.h>
>  #include "platform.h"
> -#include "plicsw.h"
>  #include "cache.h"
>
>  struct sbi_platform platform;
> @@ -88,29 +88,6 @@ static int ae350_final_init(bool cold_boot)
>         return 0;
>  }
>
> -static struct sbi_ipi_device plicsw_ipi = {
> -       .name = "ae350_plicsw",
> -       .ipi_send = plicsw_ipi_send,
> -       .ipi_clear = plicsw_ipi_clear
> -};
> -
> -/* Initialize IPI for current HART. */
> -static int ae350_ipi_init(bool cold_boot)
> -{
> -       int ret;
> -
> -       if (cold_boot) {
> -               ret = plicsw_cold_ipi_init(AE350_PLICSW_ADDR,
> -                                          AE350_HART_COUNT);
> -               if (ret)
> -                       return ret;
> -
> -               sbi_ipi_set_device(&plicsw_ipi);
> -       }
> -
> -       return plicsw_warm_ipi_init();
> -}
> -
>  /* Vendor-Specific SBI handler */
>  static int ae350_vendor_ext_provider(long extid, long funcid,
>         const struct sbi_trap_regs *regs, unsigned long *out_value,
> @@ -163,7 +140,7 @@ const struct sbi_platform_operations platform_ops = {
>
>         .irqchip_init = fdt_irqchip_init,
>
> -       .ipi_init     = ae350_ipi_init,
> +       .ipi_init     = fdt_ipi_init,
>
>         .timer_init        = fdt_timer_init,
>
> diff --git a/platform/andes/ae350/platform.h b/platform/andes/ae350/platform.h
> index 3003bb4..903bef0 100644
> --- a/platform/andes/ae350/platform.h
> +++ b/platform/andes/ae350/platform.h
> @@ -11,8 +11,6 @@
>  #ifndef _AE350_PLATFORM_H_
>  #define _AE350_PLATFORM_H_
>
> -#define AE350_PLICSW_ADDR              0xe6400000
> -
>  #define AE350_L2C_ADDR                 0xe0500000
>
>  /*Memory and Miscellaneous Registers*/
> diff --git a/platform/andes/ae350/plicsw.c b/platform/andes/ae350/plicsw.c
> deleted file mode 100644
> index edbbb11..0000000
> --- a/platform/andes/ae350/plicsw.c
> +++ /dev/null
> @@ -1,139 +0,0 @@
> -/*
> - * SPDX-License-Identifier: BSD-2-Clause
> - *
> - * Copyright (c) 2019 Andes Technology Corporation
> - *
> - * Authors:
> - *   Zong Li <zong@andestech.com>
> - *   Nylon Chen <nylon7@andestech.com>
> - */
> -
> -#include <sbi/riscv_asm.h>
> -#include <sbi/riscv_io.h>
> -#include <sbi/sbi_types.h>
> -#include "plicsw.h"
> -#include "platform.h"
> -
> -static u32 plicsw_ipi_hart_count;
> -static struct plicsw plicsw_dev[AE350_HART_COUNT];
> -
> -static inline void plicsw_claim(void)
> -{
> -       u32 source_hart = current_hartid();
> -
> -       plicsw_dev[source_hart].source_id =
> -               readl(plicsw_dev[source_hart].plicsw_claim);
> -}
> -
> -static inline void plicsw_complete(void)
> -{
> -       u32 source_hart = current_hartid();
> -       u32 source = plicsw_dev[source_hart].source_id;
> -
> -       writel(source, plicsw_dev[source_hart].plicsw_claim);
> -}
> -
> -static inline void plic_sw_pending(u32 target_hart)
> -{
> -       /*
> -        * The pending array registers are w1s type.
> -        * IPI pending array mapping as following:
> -        *
> -        * Pending array start address: base + 0x1000
> -        * -------------------------------------
> -        * | hart 3 | hart 2 | hart 1 | hart 0 |
> -        * -------------------------------------
> -        * Each hart X can send IPI to another hart by setting the
> -        * corresponding bit in hart X own region(see the below).
> -        *
> -        * In each hart region:
> -        * -----------------------------------------------
> -        * | bit 7 | bit 6 | bit 5 | bit 4 | ... | bit 0 |
> -        * -----------------------------------------------
> -        * The bit 7 is used to send IPI to hart 0
> -        * The bit 6 is used to send IPI to hart 1
> -        * The bit 5 is used to send IPI to hart 2
> -        * The bit 4 is used to send IPI to hart 3
> -        */
> -       u32 source_hart = current_hartid();
> -       u32 target_offset = (PLICSW_PENDING_PER_HART - 1) - target_hart;
> -       u32 per_hart_offset = PLICSW_PENDING_PER_HART * source_hart;
> -       u32 val = 1 << target_offset << per_hart_offset;
> -
> -       writel(val, plicsw_dev[source_hart].plicsw_pending);
> -}
> -
> -void plicsw_ipi_send(u32 target_hart)
> -{
> -       if (plicsw_ipi_hart_count <= target_hart)
> -               return;
> -
> -       /* Set PLICSW IPI */
> -       plic_sw_pending(target_hart);
> -}
> -
> -void plicsw_ipi_clear(u32 target_hart)
> -{
> -       if (plicsw_ipi_hart_count <= target_hart)
> -               return;
> -
> -       /* Clear PLICSW IPI */
> -       plicsw_claim();
> -       plicsw_complete();
> -}
> -
> -int plicsw_warm_ipi_init(void)
> -{
> -       u32 hartid = current_hartid();
> -
> -       if (!plicsw_dev[hartid].plicsw_pending
> -           && !plicsw_dev[hartid].plicsw_enable
> -           && !plicsw_dev[hartid].plicsw_claim)
> -               return -1;
> -
> -       /* Clear PLICSW IPI */
> -       plicsw_ipi_clear(hartid);
> -
> -       return 0;
> -}
> -
> -int plicsw_cold_ipi_init(unsigned long base, u32 hart_count)
> -{
> -       /* Setup source priority */
> -       uint32_t *priority = (void *)base + PLICSW_PRIORITY_BASE;
> -
> -       for (int i = 0; i < AE350_HART_COUNT * PLICSW_PENDING_PER_HART; i++)
> -               writel(1, &priority[i]);
> -
> -       /* Setup target enable */
> -       uint32_t enable_mask = PLICSW_HART_MASK;
> -
> -       for (int i = 0; i < AE350_HART_COUNT; i++) {
> -               uint32_t *enable = (void *)base + PLICSW_ENABLE_BASE
> -                       + PLICSW_ENABLE_PER_HART * i;
> -               writel(enable_mask, &enable[0]);
> -               enable_mask >>= 1;
> -       }
> -
> -       /* Figure-out PLICSW IPI register address */
> -       plicsw_ipi_hart_count = hart_count;
> -
> -       for (u32 hartid = 0; hartid < AE350_HART_COUNT; hartid++) {
> -               plicsw_dev[hartid].source_id = 0;
> -               plicsw_dev[hartid].plicsw_pending =
> -                       (void *)base
> -                       + PLICSW_PENDING_BASE
> -                       + ((hartid / 4) * 4);
> -               plicsw_dev[hartid].plicsw_enable  =
> -                       (void *)base
> -                       + PLICSW_ENABLE_BASE
> -                       + PLICSW_ENABLE_PER_HART * hartid;
> -               plicsw_dev[hartid].plicsw_claim   =
> -                       (void *)base
> -                       + PLICSW_CONTEXT_BASE
> -                       + PLICSW_CONTEXT_CLAIM
> -                       + PLICSW_CONTEXT_PER_HART * hartid;
> -       }
> -
> -       return 0;
> -}
> diff --git a/platform/andes/ae350/plicsw.h b/platform/andes/ae350/plicsw.h
> deleted file mode 100644
> index 58728f6..0000000
> --- a/platform/andes/ae350/plicsw.h
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -/*
> - * SPDX-License-Identifier: BSD-2-Clause
> - *
> - * Copyright (c) 2019 Andes Technology Corporation
> - *
> - * Authors:
> - *   Zong Li <zong@andestech.com>
> - *   Nylon Chen <nylon7@andestech.com>
> - */
> -
> -#ifndef _AE350_PLICSW_H_
> -#define _AE350_PLICSW_H_
> -
> -#define PLICSW_PRIORITY_BASE           0x4
> -
> -#define PLICSW_PENDING_BASE            0x1000
> -#define PLICSW_PENDING_PER_HART                0x8
> -
> -#define PLICSW_ENABLE_BASE             0x2000
> -#define PLICSW_ENABLE_PER_HART         0x80
> -
> -#define PLICSW_CONTEXT_BASE            0x200000
> -#define PLICSW_CONTEXT_PER_HART                0x1000
> -#define PLICSW_CONTEXT_CLAIM           0x4
> -
> -#define PLICSW_HART_MASK               0x80808080
> -
> -struct plicsw {
> -       u32 source_id;
> -
> -       volatile uint32_t *plicsw_pending;
> -       volatile uint32_t *plicsw_enable;
> -       volatile uint32_t *plicsw_claim;
> -};
> -
> -void plicsw_ipi_send(u32 target_hart);
> -
> -void plicsw_ipi_clear(u32 target_hart);
> -
> -int plicsw_warm_ipi_init(void);
> -
> -int plicsw_cold_ipi_init(unsigned long base, u32 hart_count);
> -
> -#endif /* _AE350_PLICSW_H_ */
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

