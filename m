From: Minda Chen <minda.chen@starfivetech.com>
Date: Mon, 27 Feb 2023 19:23:40 +0800
Subject: [PATCH] gpio/starfive: add gpio driver and support gpio reset
In-Reply-To: <CAAhSdy3gUbX3+54-i6PSo99UMGVE60VSYALRLA5QVazSqLCQmQ@mail.gmail.com>
References: <20230216092126.99022-1-minda.chen@starfivetech.com>
 <CAAhSdy3gUbX3+54-i6PSo99UMGVE60VSYALRLA5QVazSqLCQmQ@mail.gmail.com>
Message-ID: <d0ca6d1c-6761-6b35-6ca8-4244937b1392@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2023/2/27 14:44, Anup Patel wrote:
> On Thu, Feb 16, 2023 at 2:52 PM minda.chen <minda.chen@starfivetech.com> wrote:
>>
>> Add gpio driver and gpio reset function in Starfive
>> JH7110 SOC platform.
>>
>> Signed-off-by: minda.chen <minda.chen@starfivetech.com>
> 
> I don't see a PATCH enabling it in defconfig.
> 
> How is this driver used in OpenSBI ?
> 
> Regards,
> Anup
> 
I have enabled CONFIG_FDT_GPIO_STARFIVE in defconfig in this patch.

 --- a/platform/generic/configs/defconfig
 +++ b/platform/generic/configs/defconfig
 @@ -6,6 +6,7 @@ CONFIG_PLATFORM_SIFIVE_FU740=y
  CONFIG_PLATFORM_STARFIVE_JH7110=y
  CONFIG_FDT_GPIO=y
  CONFIG_FDT_GPIO_SIFIVE=y
 +CONFIG_FDT_GPIO_STARFIVE=y

May I set this change to second commit ?

This patch is a gpio reset implementation for sbi ecall SBI_EXT_SRST_RESET.

>> ---
>>  lib/utils/gpio/Kconfig             |   3 +
>>  lib/utils/gpio/fdt_gpio_starfive.c | 117 +++++++++++++++++++++++++++++
>>  lib/utils/gpio/objects.mk          |   3 +
>>  platform/generic/configs/defconfig |   1 +
defconfig have been changed.

>>  4 files changed, 124 insertions(+)
>>  create mode 100644 lib/utils/gpio/fdt_gpio_starfive.c
>>
>> diff --git a/lib/utils/gpio/Kconfig b/lib/utils/gpio/Kconfig
>> index 38a9d75..1b338a6 100644
>> --- a/lib/utils/gpio/Kconfig
>> +++ b/lib/utils/gpio/Kconfig
>> @@ -14,6 +14,9 @@ config FDT_GPIO_SIFIVE
>>         bool "SiFive GPIO FDT driver"
>>         default n
>>
>> +config FDT_GPIO_STARFIVE
>> +       bool "StarFive GPIO FDT driver"
>> +       default n
>>  endif
>>
>>  config GPIO
>> diff --git a/lib/utils/gpio/fdt_gpio_starfive.c b/lib/utils/gpio/fdt_gpio_starfive.c
>> new file mode 100644
>> index 0000000..18cca72
>> --- /dev/null
>> +++ b/lib/utils/gpio/fdt_gpio_starfive.c
>> @@ -0,0 +1,117 @@
>> +/*
>> + * SPDX-License-Identifier: BSD-2-Clause
>> + *
>> + * Copyright (c) 2022 Starfive
>> + *
>> + * Authors:
>> + *   Minda.chen <Minda.chen@starfivetech.com>
>> + */
>> +
>> +#include <sbi/riscv_io.h>
>> +#include <sbi/sbi_error.h>
>> +#include <sbi/sbi_console.h>
>> +#include <sbi_utils/fdt/fdt_helper.h>
>> +#include <sbi_utils/gpio/fdt_gpio.h>
>> +
>> +#define STARFIVE_GPIO_CHIP_MAX         2
>> +#define STARFIVE_GPIO_PINS_DEF         64
>> +#define STARFIVE_GPIO_OUTVAL           0x40
>> +#define STARFIVE_GPIO_MASK             0xff
>> +#define STARFIVE_GPIO_REG_SHIFT_MASK   0x3
>> +#define STARFIVE_GPIO_SHIFT_BITS       0x3
>> +
>> +struct starfive_gpio_chip {
>> +       unsigned long addr;
>> +       struct gpio_chip chip;
>> +};
>> +
>> +static unsigned int starfive_gpio_chip_count;
>> +static struct starfive_gpio_chip starfive_gpio_chip_array[STARFIVE_GPIO_CHIP_MAX];
>> +
>> +static int starfive_gpio_direction_output(struct gpio_pin *gp, int value)
>> +{
>> +       u32 val;
>> +       unsigned long reg_addr;
>> +       u32 bit_mask, shift_bits;
>> +       struct starfive_gpio_chip *chip =
>> +               container_of(gp->chip, struct starfive_gpio_chip, chip);
>> +
>> +       /* set out en*/
>> +       reg_addr = chip->addr + gp->offset;
>> +       reg_addr &= ~(STARFIVE_GPIO_REG_SHIFT_MASK);
>> +
>> +       val = readl((void *)(reg_addr));
>> +       shift_bits = (gp->offset & STARFIVE_GPIO_REG_SHIFT_MASK)
>> +               << STARFIVE_GPIO_SHIFT_BITS;
>> +       bit_mask = STARFIVE_GPIO_MASK << shift_bits;
>> +
>> +       val = readl((void *)reg_addr);
>> +       val &= ~bit_mask;
>> +       writel(val, (void *)reg_addr);
>> +
>> +       return 0;
>> +}
>> +
>> +static void starfive_gpio_set(struct gpio_pin *gp, int value)
>> +{
>> +       u32 val;
>> +       unsigned long reg_addr;
>> +       u32 bit_mask, shift_bits;
>> +       struct starfive_gpio_chip *chip =
>> +               container_of(gp->chip, struct starfive_gpio_chip, chip);
>> +
>> +       reg_addr = chip->addr + gp->offset;
>> +       reg_addr &= ~(STARFIVE_GPIO_REG_SHIFT_MASK);
>> +
>> +       shift_bits = (gp->offset & STARFIVE_GPIO_REG_SHIFT_MASK)
>> +               << STARFIVE_GPIO_SHIFT_BITS;
>> +       bit_mask = STARFIVE_GPIO_MASK << shift_bits;
>> +       /* set output value */
>> +       val = readl((void *)(reg_addr + STARFIVE_GPIO_OUTVAL));
>> +       val &= ~bit_mask;
>> +       val |= value << shift_bits;
>> +       writel(val, (void *)(reg_addr + STARFIVE_GPIO_OUTVAL));
>> +}
>> +
>> +extern struct fdt_gpio fdt_gpio_starfive;
>> +
>> +static int starfive_gpio_init(void *fdt, int nodeoff, u32 phandle,
>> +                             const struct fdt_match *match)
>> +{
>> +       int rc;
>> +       struct starfive_gpio_chip *chip;
>> +       u64 addr;
>> +
>> +       if (starfive_gpio_chip_count >= STARFIVE_GPIO_CHIP_MAX)
>> +               return SBI_ENOSPC;
>> +       chip = &starfive_gpio_chip_array[starfive_gpio_chip_count];
>> +
>> +       rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
>> +       if (rc)
>> +               return rc;
>> +
>> +       chip->addr = addr;
>> +       chip->chip.driver = &fdt_gpio_starfive;
>> +       chip->chip.id = phandle;
>> +       chip->chip.ngpio = STARFIVE_GPIO_PINS_DEF;
>> +       chip->chip.direction_output = starfive_gpio_direction_output;
>> +       chip->chip.set = starfive_gpio_set;
>> +       rc = gpio_chip_add(&chip->chip);
>> +       if (rc)
>> +               return rc;
>> +
>> +       starfive_gpio_chip_count++;
>> +       return 0;
>> +}
>> +
>> +static const struct fdt_match starfive_gpio_match[] = {
>> +       { .compatible = "starfive,jh7110-sys-pinctrl" },
>> +       { .compatible = "starfive,iomux-pinctrl" },
>> +       { },
>> +};
>> +
>> +struct fdt_gpio fdt_gpio_starfive = {
>> +       .match_table = starfive_gpio_match,
>> +       .xlate = fdt_gpio_simple_xlate,
>> +       .init = starfive_gpio_init,
>> +};
>> diff --git a/lib/utils/gpio/objects.mk b/lib/utils/gpio/objects.mk
>> index eedd699..8f4a6a8 100644
>> --- a/lib/utils/gpio/objects.mk
>> +++ b/lib/utils/gpio/objects.mk
>> @@ -13,4 +13,7 @@ libsbiutils-objs-$(CONFIG_FDT_GPIO) += gpio/fdt_gpio_drivers.o
>>  carray-fdt_gpio_drivers-$(CONFIG_FDT_GPIO_SIFIVE) += fdt_gpio_sifive
>>  libsbiutils-objs-$(CONFIG_FDT_GPIO_SIFIVE) += gpio/fdt_gpio_sifive.o
>>
>> +carray-fdt_gpio_drivers-$(CONFIG_FDT_GPIO_STARFIVE) += fdt_gpio_starfive
>> +libsbiutils-objs-$(CONFIG_FDT_GPIO_STARFIVE) += gpio/fdt_gpio_starfive.o
>> +
>>  libsbiutils-objs-$(CONFIG_GPIO) += gpio/gpio.o
>> diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
>> index 4b0842e..2ad953d 100644
>> --- a/platform/generic/configs/defconfig
>> +++ b/platform/generic/configs/defconfig
>> @@ -6,6 +6,7 @@ CONFIG_PLATFORM_SIFIVE_FU740=y
>>  CONFIG_PLATFORM_STARFIVE_JH7110=y
>>  CONFIG_FDT_GPIO=y
>>  CONFIG_FDT_GPIO_SIFIVE=y
>> +CONFIG_FDT_GPIO_STARFIVE=y
>>  CONFIG_FDT_I2C=y
>>  CONFIG_FDT_I2C_SIFIVE=y
>>  CONFIG_FDT_IPI=y
>> --
>> 2.17.1
>>
>>
>> --
>> opensbi mailing list
>> opensbi at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/opensbi

