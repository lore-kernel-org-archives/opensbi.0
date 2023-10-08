From: Inochi Amaoto <inochiama@outlook.com>
Date: Sun,  8 Oct 2023 15:42:59 +0800
Subject: [PATCH 3/3] platform: generic: Add Sophgo sg2042 soc support
In-Reply-To: <CAJF2gTSAoddJkSSZyWuCK2FpzTfKZ5hDCeKR40vrX4erZ6CM9w@mail.gmail.com>
References: <CAJF2gTSAoddJkSSZyWuCK2FpzTfKZ5hDCeKR40vrX4erZ6CM9w@mail.gmail.com>
Message-ID: <IA1PR20MB49537F790BFB6FD99E29067ABBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>On Sat, Oct 7, 2023 at 10:58?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>>
>> Add Sophgo sg2042 platform support
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  platform/generic/Kconfig           |  6 +++
>>  platform/generic/configs/defconfig |  1 +
>>  platform/generic/sophgo/objects.mk |  9 ++++
>>  platform/generic/sophgo/sg2042.c   | 71 ++++++++++++++++++++++++++++++
>>  4 files changed, 87 insertions(+)
>>  create mode 100644 platform/generic/sophgo/objects.mk
>>  create mode 100644 platform/generic/sophgo/sg2042.c
>>
>> diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
>> index f9e7ed2..a902cf3 100644
>> --- a/platform/generic/Kconfig
>> +++ b/platform/generic/Kconfig
>> @@ -49,6 +49,12 @@ config PLATFORM_SIFIVE_FU740
>>         depends on FDT_RESET && FDT_I2C
>>         default n
>>
>> +config PLATFORM_SOPHGO_SG2042
>> +       bool "Sophgo sg2042 support"
>> +       select THEAD_C9XX_ERRATA
>> +       select THEAD_C9XX_PMU
>> +       default n
>> +
>>  config PLATFORM_STARFIVE_JH7110
>>         bool "StarFive JH7110 support"
>>         default n
>> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
>> index c432bc2..e1b76c8 100644
>> --- a/platform/generic/configs/defconfig
>> +++ b/platform/generic/configs/defconfig
>> @@ -3,6 +3,7 @@ CONFIG_PLATFORM_ANDES_AE350=y
>>  CONFIG_PLATFORM_RENESAS_RZFIVE=y
>>  CONFIG_PLATFORM_SIFIVE_FU540=y
>>  CONFIG_PLATFORM_SIFIVE_FU740=y
>> +CONFIG_PLATFORM_SOPHGO_SG2042=y
>>  CONFIG_PLATFORM_STARFIVE_JH7110=y
>>  CONFIG_PLATFORM_THEAD=y
>>  CONFIG_FDT_GPIO=y
>> diff --git a/platform/generic/sophgo/objects.mk b/platform/generic/sophgo/objects.mk
>> new file mode 100644
>> index 0000000..3d2908a
>> --- /dev/null
>> +++ b/platform/generic/sophgo/objects.mk
>> @@ -0,0 +1,9 @@
>> +#
>> +# SPDX-License-Identifier: BSD-2-Clause
>> +#
>> +# Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>> +# Copyright (C) 2023 Alibaba Group Holding Limited.
>> +#
>> +
>> +carray-platform_override_modules-$(CONFIG_PLATFORM_SOPHGO_SG2042) += sophgo_sg2042
>> +platform-objs-$(CONFIG_PLATFORM_SOPHGO_SG2042) += sophgo/sg2042.o
>> diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
>> new file mode 100644
>> index 0000000..df841bd
>> --- /dev/null
>> +++ b/platform/generic/sophgo/sg2042.c
>> @@ -0,0 +1,71 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Authors:
>> + *   Inochi Amaoto <inochiama@outlook.com>
>> + *
>> + */
>> +
>> +#include <platform_override.h>
>> +#include <thead/c9xx_errata.h>
>> +#include <thead/c9xx_pmu.h>
>> +#include <sbi/sbi_const.h>
>> +#include <sbi/sbi_domain.h>
>> +#include <sbi/sbi_platform.h>
>> +#include <sbi/sbi_scratch.h>
>> +#include <sbi/sbi_string.h>
>> +#include <sbi_utils/fdt/fdt_helper.h>
>> +#include <sbi_utils/timer/aclint_mtimer.h>
>> +
>> +#define SOPHGO_SG2042_TIMER_BASE       0x70ac000000UL
>> +#define SOPHGO_SG2042_TIMER_SIZE       0x10000UL
>> +
>> +
>> +static int sophgo_sg2042_early_init(bool cold_boot,
>> +                                   const struct fdt_match *match)
>> +{
>> +       const struct sbi_platform *plat = sbi_platform_thishart_ptr();
>> +
>> +       thead_register_tlb_flush_trap_handler();
>> +
>> +       /*
>> +        * Sophgo sg2042 soc use seperate 16 timers while initiating,
>> +        * merge them as a single domain to avoid wasting.
>> +        */
>> +       if (cold_boot)
>> +               return sbi_domain_root_add_memrange(SOPHGO_SG2042_TIMER_BASE,
>> +                                               SOPHGO_SG2042_TIMER_SIZE *
>> +                                               sbi_platform_hart_count(plat),
>> +                                               MTIMER_REGION_ALIGN,
>> +                                               (SBI_DOMAIN_MEMREGION_MMIO |
>> +                                                SBI_DOMAIN_MEMREGION_M_READABLE |
>> +                                                SBI_DOMAIN_MEMREGION_M_WRITABLE));
>> +
>> +
>> +       return 0;
>> +}
>> +
>> +static u32 sophgo_sg2042_tlb_num_entries(const struct fdt_match *match)
>> +{
>> +       unsigned long num_tlb_entries = (unsigned long)match->data;
>> +       return num_tlb_entries;
>why not return SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES or 64?
>

AFAIK, use SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES may gain performance impact
on sg2042. So the default value needs to be changed.
I just left this number as a quirk, so 64 is OK for me. But I think using
max(SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES, hart_count) in generic platform
code maybe a better idea.

>> +}
>> +
>> +static int sophgo_sg2042_extensions_init(const struct fdt_match *match,
>> +                                        struct sbi_hart_features *hfeatures)
>> +{
>> +       thead_c9xx_register_pmu_device();
>> +       return 0;
>> +}
>> +
>> +static const struct fdt_match sophgo_sg2042_match[] = {
>> +       { .compatible = "sophgo,sg2042", .data = (void*)64 },
>The .data seems not to be set appropriately.
>
>> +       { },
>> +};
>> +
>> +const struct platform_override sophgo_sg2042 = {
>> +       .match_table            = sophgo_sg2042_match,
>> +       .tlb_num_entries        = sophgo_sg2042_tlb_num_entries,
>> +       .early_init             = sophgo_sg2042_early_init,
>> +       .extensions_init        = sophgo_sg2042_extensions_init,
>> +};
>> --
>> 2.42.0
>>
>
>
>--
>Best Regards
> Guo Ren
>
>

