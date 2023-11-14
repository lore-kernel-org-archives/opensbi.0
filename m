From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Nov 2023 21:15:39 +0530
Subject: [PATCH v2 2/4] platform: generic: thead: separate implement of
 T-HEAD c9xx pmu
In-Reply-To: <IA1PR20MB4953F08770A3C489E3413567BBCAA@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953287B7688E0F5058984BDBBCAA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231005065843.239501-1-inochiama@outlook.com> <IA1PR20MB4953F08770A3C489E3413567BBCAA@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy0iRTjfYz82u1KS+rm8ri8atifRWPEVNCOOHwU3BSfSTg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 5, 2023 at 12:29?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Separate the implement of T-HEAD c9xx pmu to allow any platform with
> c9xx cores can use it.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/Kconfig                  |  2 +
>  platform/generic/allwinner/sun20i-d1.c    | 51 +----------------
>  platform/generic/include/thead/c9xx_pmu.h |  7 +++
>  platform/generic/thead/Kconfig            |  5 ++
>  platform/generic/thead/objects.mk         |  2 +
>  platform/generic/thead/thead_c9xx_pmu.c   | 69 +++++++++++++++++++++++
>  6 files changed, 87 insertions(+), 49 deletions(-)
>  create mode 100644 platform/generic/include/thead/c9xx_pmu.h
>  create mode 100644 platform/generic/thead/Kconfig
>  create mode 100644 platform/generic/thead/thead_c9xx_pmu.c
>
> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
> index e7bd94e..ea3b5cf 100644
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
> @@ -57,5 +58,6 @@ config PLATFORM_THEAD
>         default n
>
>  source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
> +source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
>
>  endif
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index b960284..e9388db 100644
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
> @@ -223,58 +224,10 @@ static int sun20i_d1_fdt_fixup(void *fdt, const struct fdt_match *match)
>         return fdt_add_cpu_idle_states(fdt, sun20i_d1_cpu_idle_states);
>  }
>
> -static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
> -{
> -       if (ctr_idx >= SBI_PMU_HW_CTR_MAX)
> -               return;
> -
> -       /**
> -        * Clear out the OF bit so that next interrupt can be enabled.
> -        * This should be done before starting interrupt to avoid unexcepted
> -        * overflow interrupt.
> -        */
> -       csr_clear(THEAD_C9XX_CSR_MCOUNTEROF, BIT(ctr_idx));
> -
> -       /**
> -        * This register is described in C9xx document as the control register
> -        * for enabling writes to the superuser state counter. However, if the
> -        * corresponding bit is not set to 1, scounterof will always read as 0
> -        * when the counter register overflows.
> -        */
> -       csr_set(THEAD_C9XX_CSR_MCOUNTERWEN, BIT(ctr_idx));
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
> -       /**
> -        * There is no need to clear the bit of mcounterwen, it will expire
> -        * after setting the csr mcountinhibit.
> -        */
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
> -       sbi_pmu_set_device(&thead_c9xx_pmu_device);
> +       thead_c9xx_register_pmu_device();
>
>         /* auto-detection doesn't work on t-head c9xx cores */
>         /* D1 has 29 mhpmevent csrs, but only 3-9,13-17 have valid value */
> diff --git a/platform/generic/include/thead/c9xx_pmu.h b/platform/generic/include/thead/c9xx_pmu.h
> new file mode 100644
> index 0000000..bb1d831
> --- /dev/null
> +++ b/platform/generic/include/thead/c9xx_pmu.h
> @@ -0,0 +1,7 @@
> +
> +#ifndef __RISCV_THEAD_C9XX_PMU_H____
> +#define __RISCV_THEAD_C9XX_PMU_H____
> +
> +void thead_c9xx_register_pmu_device(void);
> +
> +#endif // __RISCV_THEAD_C9XX_PMU_H____
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
> diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
> index 854bfbd..df2c61b 100644
> --- a/platform/generic/thead/objects.mk
> +++ b/platform/generic/thead/objects.mk
> @@ -5,6 +5,8 @@
>  # Copyright (C) 2023 Alibaba Group Holding Limited.
>  #
>
> +platform-objs-$(CONFIG_THEAD_C9XX_PMU) += thead/thead_c9xx_pmu.o
> +
>  carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD) += thead_generic
>  platform-objs-$(CONFIG_PLATFORM_THEAD) += thead/thead-generic.o
>  platform-objs-$(CONFIG_PLATFORM_THEAD) += thead/thead-trap-handler.o
> diff --git a/platform/generic/thead/thead_c9xx_pmu.c b/platform/generic/thead/thead_c9xx_pmu.c
> new file mode 100644
> index 0000000..d205802
> --- /dev/null
> +++ b/platform/generic/thead/thead_c9xx_pmu.c
> @@ -0,0 +1,69 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Authors:
> + *   Inochi Amaoto <inochiama@outlook.com>
> + *   Haijiao Liu <haijiao.liu@sophgo.com>
> + *
> + */
> +
> +#include <thead/c9xx_encoding.h>
> +#include <thead/c9xx_pmu.h>
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_bitops.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_pmu.h>
> +
> +static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
> +{
> +       if (ctr_idx >= SBI_PMU_HW_CTR_MAX)
> +               return;
> +
> +       /**
> +        * Clear out the OF bit so that next interrupt can be enabled.
> +        * This should be done before starting interrupt to avoid unexcepted
> +        * overflow interrupt.
> +        */
> +       csr_clear(THEAD_C9XX_CSR_MCOUNTEROF, BIT(ctr_idx));
> +
> +       /**
> +        * This register is described in C9xx document as the control register
> +        * for enabling writes to the superuser state counter. However, if the
> +        * corresponding bit is not set to 1, scounterof will always read as 0
> +        * when the counter register overflows.
> +        */
> +       csr_set(THEAD_C9XX_CSR_MCOUNTERWEN, BIT(ctr_idx));
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
> +       /**
> +        * There is no need to clear the bit of mcounterwen, it will expire
> +        * after setting the csr mcountinhibit.
> +        */
> +       csr_clear(THEAD_C9XX_CSR_MCOUNTERINTEN, BIT(ctr_idx));
> +}
> +
> +static int thead_c9xx_pmu_irq_bit(void)
> +{
> +       return THEAD_C9XX_MIP_MOIP;
> +}
> +
> +static const struct sbi_pmu_device thead_c9xx_pmu_device = {
> +       .name = "thead,c900-pmu",
> +       .hw_counter_enable_irq = thead_c9xx_pmu_ctr_enable_irq,
> +       .hw_counter_disable_irq = thead_c9xx_pmu_ctr_disable_irq,
> +       .hw_counter_irq_bit = thead_c9xx_pmu_irq_bit,
> +};
> +
> +void thead_c9xx_register_pmu_device(void)
> +{
> +       sbi_pmu_set_device(&thead_c9xx_pmu_device);
> +}
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

