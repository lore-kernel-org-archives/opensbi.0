From: Guo Ren <guoren@kernel.org>
Date: Tue, 23 May 2023 17:44:30 +0800
Subject: [PATCH 2/3] platform: generic: thead: separate implement of thead
 c9xx pmu
In-Reply-To: <IA1PR20MB49533FCE5557245A30B1482ABB409@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20230523063603.1836508-1-inochiama@outlook.com> <IA1PR20MB49533FCE5557245A30B1482ABB409@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAJF2gTT==Bbtq49O-WPMD2reRo8nd7rEBcM6VwCeMmu91VbDKg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Which linux patch series you've tesed with? Thx

Could give out your test branch, we could help test.

On Tue, May 23, 2023 at 2:39?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> As the t-head header is separated, separate the implement of t-head
> c9xx pmu. So any platform with c9xx cores can use it.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  platform/generic/Kconfig                  |  2 +
>  platform/generic/allwinner/sun20i-d1.c    | 44 +-----------------
>  platform/generic/include/thead/c9xx_pmu.h | 16 +++++++
>  platform/generic/thead/Kconfig            |  5 +++
>  platform/generic/thead/c9xx_pmu.c         | 54 +++++++++++++++++++++++
>  platform/generic/thead/objects.mk         |  5 +++
>  6 files changed, 83 insertions(+), 43 deletions(-)
>  create mode 100644 platform/generic/include/thead/c9xx_pmu.h
>  create mode 100644 platform/generic/thead/Kconfig
>  create mode 100644 platform/generic/thead/c9xx_pmu.c
>  create mode 100644 platform/generic/thead/objects.mk
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index 72768ed..426fd99 100644
> --- a/platform/generic/Kconfig
> +++ b/platform/generic/Kconfig
> @@ -26,6 +26,7 @@ config PLATFORM_GENERIC_MINOR_VER
>  config PLATFORM_ALLWINNER_D1
>         bool "Allwinner D1 support"
>         depends on FDT_IRQCHIP_PLIC
> +       select THEAD_C9XX_PMU
>         default n
>
>  config PLATFORM_ANDES_AE350
> @@ -53,5 +54,6 @@ config PLATFORM_STARFIVE_JH7110
>         default n
>
>  source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
> +source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
>
>  endif
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index fe38d8f..2f9287a 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -6,6 +6,7 @@
>
>  #include <platform_override.h>
>  #include <thead/c9xx_encoding.h>
> +#include <thead/c9xx_pmu.h>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_bitops.h>
> @@ -223,49 +224,6 @@ static int sun20i_d1_fdt_fixup(void *fdt, const struct fdt_match *match)
>         return fdt_add_cpu_idle_states(fdt, sun20i_d1_cpu_idle_states);
>  }
>
> -static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
> -{
> -       unsigned long mip_val;
> -
> -       if (ctr_idx >= SBI_PMU_HW_CTR_MAX)
> -               return;
> -
> -       mip_val = csr_read(CSR_MIP);
> -       /**
> -        * Clear out the OF bit so that next interrupt can be enabled.
> -        * This should be done only when the corresponding overflow interrupt
> -        * bit is cleared. That indicates that software has already handled the
> -        * previous interrupts or the hardware yet to set an overflow interrupt.
> -        * Otherwise, there will be race conditions where we may clear the bit
> -        * the software is yet to handle the interrupt.
> -        */
> -       if (!(mip_val & THEAD_C9XX_MIP_MOIP))
> -               csr_clear(THEAD_C9XX_CSR_MCOUNTEROF, BIT(ctr_idx));
> -
> -       /**
> -        * SSCOFPMF uses the OF bit for enabling/disabling the interrupt,
> -        * while the C9XX has designated enable bits.
> -        * So enable per-counter interrupt on C9xx here.
> -        */
> -       csr_set(THEAD_C9XX_CSR_MCOUNTERINTEN, BIT(ctr_idx));
> -}
> -
> -static void thead_c9xx_pmu_ctr_disable_irq(uint32_t ctr_idx)
> -{
> -       csr_clear(THEAD_C9XX_CSR_MCOUNTERINTEN, BIT(ctr_idx));
> -}
> -
> -static int thead_c9xx_pmu_irq_bit(void)
> -{
> -       return THEAD_C9XX_MIP_MOIP;
> -}
> -
> -const struct sbi_pmu_device thead_c9xx_pmu_device = {
> -       .hw_counter_enable_irq = thead_c9xx_pmu_ctr_enable_irq,
> -       .hw_counter_disable_irq = thead_c9xx_pmu_ctr_disable_irq,
> -       .hw_counter_irq_bit = thead_c9xx_pmu_irq_bit,
> -};
> -
>  static int sun20i_d1_extensions_init(const struct fdt_match *match,
>                                      struct sbi_hart_features *hfeatures)
>  {
> diff --git a/platform/generic/include/thead/c9xx_pmu.h b/platform/generic/include/thead/c9xx_pmu.h
> new file mode 100644
> index 0000000..548c29f
> --- /dev/null
> +++ b/platform/generic/include/thead/c9xx_pmu.h
> @@ -0,0 +1,16 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Author: Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#ifndef __RISCV_THEAD_C9XX_PMU_H____
> +#define __RISCV_THEAD_C9XX_PMU_H____
> +
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_pmu.h>
> +
> +/* T-HEAD C9xx M-mode PMU device */
> +extern const struct sbi_pmu_device thead_c9xx_pmu_device;
> +
> +#endif
> diff --git a/platform/generic/thead/Kconfig b/platform/generic/thead/Kconfig
> new file mode 100644
> index 0000000..e54e621
> --- /dev/null
> +++ b/platform/generic/thead/Kconfig
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: BSD-2-Clause
> +
> +config THEAD_C9XX_PMU
> +       bool "T-HEAD c9xx M-mode PMU support"
> +       default n
> diff --git a/platform/generic/thead/c9xx_pmu.c b/platform/generic/thead/c9xx_pmu.c
> new file mode 100644
> index 0000000..7f29422
> --- /dev/null
> +++ b/platform/generic/thead/c9xx_pmu.c
> @@ -0,0 +1,54 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2022 Samuel Holland <samuel@sholland.org>
> + */
> +
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_bitops.h>
> +#include <thead/c9xx_encoding.h>
> +#include <thead/c9xx_pmu.h>
> +
> +static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
> +{
> +       unsigned long mip_val;
> +
> +       if (ctr_idx >= SBI_PMU_HW_CTR_MAX)
> +               return;
> +
> +       mip_val = csr_read(CSR_MIP);
> +       /**
> +        * Clear out the OF bit so that next interrupt can be enabled.
> +        * This should be done only when the corresponding overflow interrupt
> +        * bit is cleared. That indicates that software has already handled the
> +        * previous interrupts or the hardware yet to set an overflow interrupt.
> +        * Otherwise, there will be race conditions where we may clear the bit
> +        * the software is yet to handle the interrupt.
> +        */
> +       if (!(mip_val & THEAD_C9XX_MIP_MOIP))
> +               csr_clear(THEAD_C9XX_CSR_MCOUNTEROF, BIT(ctr_idx));
> +
> +       /**
> +        * SSCOFPMF uses the OF bit for enabling/disabling the interrupt,
> +        * while the C9XX has designated enable bits.
> +        * So enable per-counter interrupt on C9xx here.
> +        */
> +       csr_set(THEAD_C9XX_CSR_MCOUNTERINTEN, BIT(ctr_idx));
> +}
> +
> +static void thead_c9xx_pmu_ctr_disable_irq(uint32_t ctr_idx)
> +{
> +       csr_clear(THEAD_C9XX_CSR_MCOUNTERINTEN, BIT(ctr_idx));
> +}
> +
> +static int thead_c9xx_pmu_irq_bit(void)
> +{
> +       return THEAD_C9XX_MIP_MOIP;
> +}
> +
> +const struct sbi_pmu_device thead_c9xx_pmu_device = {
> +       .name = "thead,c900-pmu",
> +       .hw_counter_enable_irq = thead_c9xx_pmu_ctr_enable_irq,
> +       .hw_counter_disable_irq = thead_c9xx_pmu_ctr_disable_irq,
> +       .hw_counter_irq_bit = thead_c9xx_pmu_irq_bit,
> +};
> diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
> new file mode 100644
> index 0000000..509ed56
> --- /dev/null
> +++ b/platform/generic/thead/objects.mk
> @@ -0,0 +1,5 @@
> +#
> +# SPDX-License-Identifier: BSD-2-Clause
> +#
> +
> +platform-objs-$(CONFIG_THEAD_C9XX_PMU) += thead/c9xx_pmu.o
> --
> 2.40.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Best Regards
 Guo Ren

