From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Feb 2022 09:47:44 +0530
Subject: [PATCH] lib: sbi: Add a simple external interrupt handling
 framework
In-Reply-To: <20220222081857.877561-1-apatel@ventanamicro.com>
References: <20220222081857.877561-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3xFvfJkWpeqeO1-hsAWda1QKJK6C4C3fpWyQJw872BAg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 22, 2022 at 1:49 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, the external interrupt handling is scattered between
> sbi_init and sbi_trap. This patch moves all external interrupt
> handling into a simple framework called sbi_irqchip.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> ---
>  include/sbi/sbi_irqchip.h | 44 +++++++++++++++++++++++++++++++
>  include/sbi/sbi_trap.h    |  2 --
>  lib/sbi/objects.mk        |  1 +
>  lib/sbi/sbi_init.c        | 12 ++++-----
>  lib/sbi/sbi_irqchip.c     | 54 +++++++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_trap.c        | 26 +++----------------
>  lib/utils/irqchip/imsic.c |  4 +--
>  7 files changed, 109 insertions(+), 34 deletions(-)
>  create mode 100644 include/sbi/sbi_irqchip.h
>  create mode 100644 lib/sbi/sbi_irqchip.c
>
> diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
> new file mode 100644
> index 0000000..6acc6e3
> --- /dev/null
> +++ b/include/sbi/sbi_irqchip.h
> @@ -0,0 +1,44 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Ventana Micro Systems Inc.
> + *
> + * Authors:
> + *   Anup Patel <apatel@ventanamicro.com>
> + */
> +
> +#ifndef __SBI_IRQCHIP_H__
> +#define __SBI_IRQCHIP_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +struct sbi_scratch;
> +struct sbi_trap_regs;
> +
> +/**
> + * Set external interrupt handling function
> + *
> + * This function is called by OpenSBI platform code to set a handler for
> + * external interrupts
> + *
> + * @param fn function pointer for handling external irqs
> + */
> +void sbi_irqchip_set_irqfn(int (*fn)(struct sbi_trap_regs *regs));
> +
> +/**
> + * Process external interrupts
> + *
> + * This function is called by sbi_trap_handler() to handle external
> + * interrupts.
> + *
> + * @param regs pointer for trap registers
> + */
> +int sbi_irqchip_process(struct sbi_trap_regs *regs);
> +
> +/** Initialize interrupt controllers */
> +int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
> +
> +/** Exit interrupt controllers */
> +void sbi_irqchip_exit(struct sbi_scratch *scratch);
> +
> +#endif
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> index 4f611fa..d205056 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -205,8 +205,6 @@ struct sbi_trap_info {
>  int sbi_trap_redirect(struct sbi_trap_regs *regs,
>                       struct sbi_trap_info *trap);
>
> -void sbi_trap_set_external_irqfn(int (*fn)(struct sbi_trap_regs *regs));
> -
>  struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs);
>
>  void __noreturn sbi_trap_exit(const struct sbi_trap_regs *regs);
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 7096f24..1ed1983 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -32,6 +32,7 @@ libsbi-objs-y += sbi_hsm.o
>  libsbi-objs-y += sbi_illegal_insn.o
>  libsbi-objs-y += sbi_init.o
>  libsbi-objs-y += sbi_ipi.o
> +libsbi-objs-y += sbi_irqchip.o
>  libsbi-objs-y += sbi_misaligned_ldst.o
>  libsbi-objs-y += sbi_platform.o
>  libsbi-objs-y += sbi_pmu.o
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 6876eb2..2b9e5ae 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -18,6 +18,7 @@
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_hsm.h>
>  #include <sbi/sbi_ipi.h>
> +#include <sbi/sbi_irqchip.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_system.h>
> @@ -270,13 +271,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>
>         sbi_boot_print_banner(scratch);
>
> -       rc = sbi_platform_irqchip_init(plat, TRUE);
> +       rc = sbi_irqchip_init(scratch, TRUE);
>         if (rc) {
> -               sbi_printf("%s: platform irqchip init failed (error %d)\n",
> +               sbi_printf("%s: irqchip init failed (error %d)\n",
>                            __func__, rc);
>                 sbi_hart_hang();
>         }
> -       csr_set(CSR_MIE, MIP_MEIP);
>
>         rc = sbi_ipi_init(scratch, TRUE);
>         if (rc) {
> @@ -374,10 +374,9 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
>         if (rc)
>                 sbi_hart_hang();
>
> -       rc = sbi_platform_irqchip_init(plat, FALSE);
> +       rc = sbi_irqchip_init(scratch, FALSE);
>         if (rc)
>                 sbi_hart_hang();
> -       csr_set(CSR_MIE, MIP_MEIP);
>
>         rc = sbi_ipi_init(scratch, FALSE);
>         if (rc)
> @@ -552,8 +551,7 @@ void __noreturn sbi_exit(struct sbi_scratch *scratch)
>
>         sbi_ipi_exit(scratch);
>
> -       csr_clear(CSR_MIE, MIP_MEIP);
> -       sbi_platform_irqchip_exit(plat);
> +       sbi_irqchip_exit(scratch);
>
>         sbi_platform_final_exit(plat);
>
> diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
> new file mode 100644
> index 0000000..24128be
> --- /dev/null
> +++ b/lib/sbi/sbi_irqchip.c
> @@ -0,0 +1,54 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Ventana Micro Systems Inc.
> + *
> + * Authors:
> + *   Anup Patel <apatel@ventanamicro.com>
> + */
> +
> +#include <sbi/sbi_irqchip.h>
> +#include <sbi/sbi_platform.h>
> +
> +static int default_irqfn(struct sbi_trap_regs *regs)
> +{
> +       return SBI_ENODEV;
> +}
> +
> +static int (*ext_irqfn)(struct sbi_trap_regs *regs) = default_irqfn;
> +
> +void sbi_irqchip_set_irqfn(int (*fn)(struct sbi_trap_regs *regs))
> +{
> +       if (fn)
> +               ext_irqfn = fn;
> +}
> +
> +int sbi_irqchip_process(struct sbi_trap_regs *regs)
> +{
> +       return ext_irqfn(regs);
> +}
> +
> +int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
> +{
> +       int rc;
> +       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> +
> +       rc = sbi_platform_irqchip_init(plat, cold_boot);
> +       if (rc)
> +               return rc;
> +
> +       if (ext_irqfn != default_irqfn)
> +               csr_set(CSR_MIE, MIP_MEIP);
> +
> +       return 0;
> +}
> +
> +void sbi_irqchip_exit(struct sbi_scratch *scratch)
> +{
> +       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> +
> +       if (ext_irqfn != default_irqfn)
> +               csr_clear(CSR_MIE, MIP_MEIP);
> +
> +       sbi_platform_irqchip_exit(plat);
> +}
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index faab90a..86bab6d 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -15,6 +15,7 @@
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_illegal_insn.h>
>  #include <sbi/sbi_ipi.h>
> +#include <sbi/sbi_irqchip.h>
>  #include <sbi/sbi_misaligned_ldst.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_scratch.h>
> @@ -195,27 +196,6 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>         return 0;
>  }
>
> -static int default_irqfn(struct sbi_trap_regs *regs)
> -{
> -       return SBI_ENODEV;
> -}
> -
> -static int (*ext_irqfn)(struct sbi_trap_regs *regs) = default_irqfn;
> -
> -/**
> - * Set external irq handler function
> - *
> - * This function is called by OpenSBI platform code to set a handler for
> - * external interrupts
> - *
> - * @param fn function pointer for handling external irqs
> - */
> -void sbi_trap_set_external_irqfn(int (*fn)(struct sbi_trap_regs *regs))
> -{
> -       if (fn)
> -               ext_irqfn = fn;
> -}
> -
>  static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
>  {
>         mcause &= ~(1UL << (__riscv_xlen - 1));
> @@ -227,7 +207,7 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
>                 sbi_ipi_process();
>                 break;
>         case IRQ_M_EXT:
> -               return ext_irqfn(regs);
> +               return sbi_irqchip_process(regs);
>         default:
>                 return SBI_ENOENT;
>         };
> @@ -250,7 +230,7 @@ static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
>                         sbi_ipi_process();
>                         break;
>                 case IRQ_M_EXT:
> -                       rc = ext_irqfn(regs);
> +                       rc = sbi_irqchip_process(regs);
>                         if (rc)
>                                 return rc;
>                         break;
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index 123d01f..b29a1e9 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -15,8 +15,8 @@
>  #include <sbi/sbi_domain.h>
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_ipi.h>
> +#include <sbi/sbi_irqchip.h>
>  #include <sbi/sbi_error.h>
> -#include <sbi/sbi_trap.h>
>  #include <sbi_utils/irqchip/imsic.h>
>
>  #define IMSIC_MMIO_PAGE_LE             0x00
> @@ -268,7 +268,7 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
>                 return SBI_EINVAL;
>
>         /* Setup external interrupt function for IMSIC */
> -       sbi_trap_set_external_irqfn(imsic_external_irqfn);
> +       sbi_irqchip_set_irqfn(imsic_external_irqfn);
>
>         /* Add IMSIC regions to the root domain */
>         for (i = 0; i < IMSIC_MAX_REGS && imsic->regs[i].size; i++) {
> --
> 2.25.1
>

