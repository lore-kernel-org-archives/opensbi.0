From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 1 Jul 2021 22:00:04 +0800
Subject: [RFC PATCH 4/4] lib: utils: add sifive reset device
In-Reply-To: <20210701073958.15558-5-green.wan@sifive.com>
References: <20210701073958.15558-1-green.wan@sifive.com>
 <20210701073958.15558-5-green.wan@sifive.com>
Message-ID: <CAEUhbmVSVxOJLWEsuF8hfdqxRA8PiNSNpAC==HUZ0bM+mHJYjg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 1, 2021 at 5:02 PM Green Wan <green.wan@sifive.com> wrote:
>
> Add sifive reset device based on DT binding as below.
>
>         gpio-poweroff {
>                 compatible = "gpio-poweroff";
>                 gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
>         };
>
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
>  include/sbi_utils/sys/sifive_reset.h | 18 ++++++++
>  lib/utils/reset/fdt_reset.c          |  2 +
>  lib/utils/reset/fdt_reset_sifive.c   | 47 ++++++++++++++++++++
>  lib/utils/reset/objects.mk           |  1 +
>  lib/utils/sys/objects.mk             |  1 +
>  lib/utils/sys/sifive_reset.c         | 66 ++++++++++++++++++++++++++++
>  6 files changed, 135 insertions(+)
>  create mode 100644 include/sbi_utils/sys/sifive_reset.h
>  create mode 100644 lib/utils/reset/fdt_reset_sifive.c
>  create mode 100644 lib/utils/sys/sifive_reset.c
>
> diff --git a/include/sbi_utils/sys/sifive_reset.h b/include/sbi_utils/sys/sifive_reset.h
> new file mode 100644
> index 0000000..357fa8c
> --- /dev/null
> +++ b/include/sbi_utils/sys/sifive_reset.h
> @@ -0,0 +1,18 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 SiFive
> + *
> + * Authors:
> + *   Green Wan <green.wan@sifive.com>
> + */
> +
> +#ifndef __SYS_SIFIVE_RESET_H__
> +#define __SYS_SIFIVE_RESET_H__
> +
> +#include <sbi/sbi_types.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +
> +int sifive_reset_init_gpio(struct poweroff_gpio *ppwroff);
> +
> +#endif
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index 48a49fb..f3978b3 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -13,11 +13,13 @@
>  #include <sbi_utils/reset/fdt_reset.h>
>
>  extern struct fdt_reset fdt_reset_sifive_test;
> +extern struct fdt_reset fdt_reset_sifive;
>  extern struct fdt_reset fdt_reset_htif;
>  extern struct fdt_reset fdt_reset_thead;
>
>  static struct fdt_reset *reset_drivers[] = {
>         &fdt_reset_sifive_test,
> +       &fdt_reset_sifive,
>         &fdt_reset_htif,
>         &fdt_reset_thead,
>  };
> diff --git a/lib/utils/reset/fdt_reset_sifive.c b/lib/utils/reset/fdt_reset_sifive.c
> new file mode 100644
> index 0000000..b5f3b1b
> --- /dev/null
> +++ b/lib/utils/reset/fdt_reset_sifive.c

I think this file should be renamed to fdt_reset_gpio, and used by any
platform that implements /gpio-poweroff or /gpio-restart.

> @@ -0,0 +1,47 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2021 SiFive
> + *
> + * Authors:
> + *   Green Wan <green.wan@sifive.com>
> + */
> +
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_platform.h>
> +#include <sbi/sbi_scratch.h>
> +#include <sbi_utils/fdt/fdt_helper.h>
> +#include <sbi_utils/gpio/fdt_gpio.h>
> +#include <sbi_utils/reset/fdt_reset.h>
> +#include <sbi_utils/sys/sifive_reset.h>
> +
> +static struct poweroff_gpio pwroff = {
> +       .act_delay = 100,
> +       .gpio = -1,
> +       .output_type = GPIO_ACTIVE_LOW,
> +};
> +
> +static int sifive_reset_init(void *fdt, int nodeoff,
> +                            const struct fdt_match *match)
> +{
> +       int rc;
> +
> +       rc = fdt_parse_gpio_pwroff(fdt, &pwroff, "/gpio-poweroff");
> +       if (rc) {
> +               sbi_printf("Warning: no gpio-poweroff definition in DT\n");
> +
> +               return rc;
> +       }
> +
> +       return sifive_reset_init_gpio(&pwroff);
> +}
> +
> +static const struct fdt_match sifive_reset_match[] = {
> +       { .compatible = "gpio-poweroff" },
> +       { },
> +};
> +
> +struct fdt_reset fdt_reset_sifive = {
> +       .match_table = sifive_reset_match,
> +       .init = sifive_reset_init,
> +};
> diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
> index bf005e8..1196e30 100644
> --- a/lib/utils/reset/objects.mk
> +++ b/lib/utils/reset/objects.mk
> @@ -10,5 +10,6 @@
>  libsbiutils-objs-y += reset/fdt_reset.o
>  libsbiutils-objs-y += reset/fdt_reset_htif.o
>  libsbiutils-objs-y += reset/fdt_reset_sifive_test.o
> +libsbiutils-objs-y += reset/fdt_reset_sifive.o
>  libsbiutils-objs-y += reset/fdt_reset_thead.o
>  libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
> diff --git a/lib/utils/sys/objects.mk b/lib/utils/sys/objects.mk
> index 06be322..ad75f62 100644
> --- a/lib/utils/sys/objects.mk
> +++ b/lib/utils/sys/objects.mk
> @@ -9,3 +9,4 @@
>
>  libsbiutils-objs-y += sys/htif.o
>  libsbiutils-objs-y += sys/sifive_test.o
> +libsbiutils-objs-y += sys/sifive_reset.o
> diff --git a/lib/utils/sys/sifive_reset.c b/lib/utils/sys/sifive_reset.c
> new file mode 100644
> index 0000000..d086363
> --- /dev/null
> +++ b/lib/utils/sys/sifive_reset.c
> @@ -0,0 +1,66 @@
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
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_ecall_interface.h>
> +#include <sbi/sbi_platform.h>
> +#include <sbi/sbi_system.h>
> +#include <sbi_utils/gpio/fdt_gpio.h>
> +#include <sbi_utils/sys/sifive_reset.h>
> +
> +static struct poweroff_gpio *ppwroff;
> +
> +static int sifive_system_reset_check(u32 type, u32 reason)
> +{
> +       switch (type) {
> +       case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +               return 1;
> +       }
> +
> +       return 0;
> +}
> +
> +static void sifive_system_reset(u32 type, u32 reason)
> +{
> +       switch (type) {
> +       case SBI_SRST_RESET_TYPE_SHUTDOWN:
> +               if (!ppwroff || ppwroff->gpio < 0)
> +                       return;
> +
> +               if (ppwroff->output_type == GPIO_ACTIVE_LOW)
> +                       gpio_direction_output(ppwroff->gpio, 0);
> +               else
> +                       gpio_direction_output(ppwroff->gpio, 1);
> +
> +               /* if success, power is off now. */
> +               while (1)
> +                       wfi();
> +
> +               break;
> +       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> +       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> +               break;
> +       }
> +}
> +
> +static struct sbi_system_reset_device sifive_reset = {
> +       .name = "sifive_reset",
> +       .system_reset_check = sifive_system_reset_check,
> +       .system_reset = sifive_system_reset
> +};
> +
> +int sifive_reset_init_gpio(struct poweroff_gpio *gpio)
> +{
> +       ppwroff = gpio;
> +       sbi_system_reset_set_device(&sifive_reset);
> +       return 0;
> +}
> --

Regards,
Bin

