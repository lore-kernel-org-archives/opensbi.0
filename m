From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 10 Jul 2021 17:58:27 -0700
Subject: [PATCH v3 4/5] lib: utils/gpio: Add minimal SiFive GPIO driver
In-Reply-To: <20210710055827.1535906-5-anup.patel@wdc.com>
References: <20210710055827.1535906-1-anup.patel@wdc.com>
 <20210710055827.1535906-5-anup.patel@wdc.com>
Message-ID: <CAOnJCULPD_jV53w+CCtRiEfxTwSC6x0spm3utjtKPcdLwga+uQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 9, 2021 at 10:59 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> From: Green Wan <green.wan@sifive.com>
>
> We add a minimal SiFive GPIO driver so that we can do GPIO based
> system power-off and reset.
>
> Signed-off-by: Green Wan <green.wan@sifive.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/utils/gpio/fdt_gpio.c        |  3 ++
>  lib/utils/gpio/fdt_gpio_sifive.c | 90 ++++++++++++++++++++++++++++++++
>  lib/utils/gpio/objects.mk        |  1 +
>  3 files changed, 94 insertions(+)
>  create mode 100644 lib/utils/gpio/fdt_gpio_sifive.c
>
> diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
> index bff391f..297b248 100644
> --- a/lib/utils/gpio/fdt_gpio.c
> +++ b/lib/utils/gpio/fdt_gpio.c
> @@ -12,7 +12,10 @@
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/gpio/fdt_gpio.h>
>
> +extern struct fdt_gpio fdt_gpio_sifive;
> +
>  static struct fdt_gpio *gpio_drivers[] = {
> +       &fdt_gpio_sifive
>  };
>
>  static struct fdt_gpio *fdt_gpio_driver(struct gpio_chip *chip)
> diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
> new file mode 100644
> index 0000000..5941c94
> --- /dev/null
> +++ b/lib/utils/gpio/fdt_gpio_sifive.c
> @@ -0,0 +1,90 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 SiFive
> + *
> + * Authors:
> + *   Green Wan <green.wan@sifive.com>
> + */
> +
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/gpio/fdt_gpio.h>
> +
> +#define SIFIVE_GPIO_CHIP_MAX   2
> +
> +#define SIFIVE_GPIO_PINS_MIN   1
> +#define SIFIVE_GPIO_PINS_MAX   32
> +#define SIFIVE_GPIO_PINS_DEF   16
> +
> +#define SIFIVE_GPIO_OUTEN      0x8
> +#define SIFIVE_GPIO_OUTVAL     0xc
> +#define SIFIVE_GPIO_BIT(b)     (1U << (b))
> +
> +struct sifive_gpio_chip {
> +       unsigned long addr;
> +       struct gpio_chip chip;
> +};
> +
> +static unsigned int sifive_gpio_chip_count;
> +static struct sifive_gpio_chip sifive_gpio_chip_array[SIFIVE_GPIO_CHIP_MAX];
> +
> +static int sifive_gpio_direction_output(struct gpio_pin *gp, int value)
> +{
> +       unsigned int v;
> +       struct sifive_gpio_chip *chip =
> +               container_of(gp->chip, struct sifive_gpio_chip, chip);
> +
> +       v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
> +       v |= SIFIVE_GPIO_BIT(gp->offset);
> +       writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
> +
> +       v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_OUTVAL));
> +       if (!value)
> +               v &= ~SIFIVE_GPIO_BIT(gp->offset);
> +       else
> +               v |= SIFIVE_GPIO_BIT(gp->offset);
> +       writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTVAL));
> +
> +       return 0;
> +}
> +
> +extern struct fdt_gpio fdt_gpio_sifive;
> +
> +static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
> +                           const struct fdt_match *match)
> +{
> +       int rc;
> +       struct sifive_gpio_chip *chip;
> +
> +       if (SIFIVE_GPIO_CHIP_MAX <= sifive_gpio_chip_count)
> +               return SBI_ENOSPC;
> +       chip = &sifive_gpio_chip_array[sifive_gpio_chip_count];
> +
> +       rc = fdt_get_node_addr_size(fdt, nodeoff, &chip->addr, NULL);
> +       if (rc)
> +               return rc;
> +
> +       chip->chip.driver = &fdt_gpio_sifive;
> +       chip->chip.id = phandle;
> +       chip->chip.ngpio = SIFIVE_GPIO_PINS_DEF;
> +       chip->chip.direction_output = sifive_gpio_direction_output;
> +       rc = gpio_chip_add(&chip->chip);
> +       if (rc)
> +               return rc;
> +
> +       sifive_gpio_chip_count++;
> +       return 0;
> +}
> +
> +static const struct fdt_match sifive_gpio_match[] = {
> +       { .compatible = "sifive,gpio0" },
> +       { },
> +};
> +
> +struct fdt_gpio fdt_gpio_sifive = {
> +       .match_table = sifive_gpio_match,
> +       .xlate = fdt_gpio_simple_xlate,
> +       .init = sifive_gpio_init,
> +};
> diff --git a/lib/utils/gpio/objects.mk b/lib/utils/gpio/objects.mk
> index dade45e..8eb7736 100644
> --- a/lib/utils/gpio/objects.mk
> +++ b/lib/utils/gpio/objects.mk
> @@ -8,4 +8,5 @@
>  #
>
>  libsbiutils-objs-y += gpio/fdt_gpio.o
> +libsbiutils-objs-y += gpio/fdt_gpio_sifive.o
>  libsbiutils-objs-y += gpio/gpio.o
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

