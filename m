From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 10 Jul 2021 05:10:20 +0000
Subject: [PATCH v2 5/6] lib: utils/reset: Add generic GPIO reset driver
In-Reply-To: <CAOnJCU+wQ8QBJt+oY3P0Dr=Qtx+gojZHzaKamRNG-HH-G-r24g@mail.gmail.com>
References: <20210709131059.1502293-1-anup.patel@wdc.com>
 <20210709131059.1502293-6-anup.patel@wdc.com>
 <CAOnJCU+wQ8QBJt+oY3P0Dr=Qtx+gojZHzaKamRNG-HH-G-r24g@mail.gmail.com>
Message-ID: <5240C325-514A-4F32-B65A-303CA4ABC355@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 10/07/21, 1:01 AM, "Atish Patra" <atishp@atishpatra.org> wrote:

    On Fri, Jul 9, 2021 at 6:11 AM Anup Patel <anup.patel@wdc.com> wrote:
    >
    > From: Green Wan <green.wan@sifive.com>
    >
    > We add generic GPIO reset driver inspired from gpio-restart
    > and gpio-poweroff drivers of Linux kernel.
    >
    > Signed-off-by: Anup Patel <anup.patel@wdc.com>
    > ---
    >  lib/utils/reset/fdt_reset.c      |   2 +
    >  lib/utils/reset/fdt_reset_gpio.c | 146 +++++++++++++++++++++++++++++++
    >  lib/utils/reset/objects.mk       |   1 +
    >  3 files changed, 149 insertions(+)
    >  create mode 100644 lib/utils/reset/fdt_reset_gpio.c
    >
    > diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
    > index 48a49fb..aa5f59f 100644
    > --- a/lib/utils/reset/fdt_reset.c
    > +++ b/lib/utils/reset/fdt_reset.c
    > @@ -12,11 +12,13 @@
    >  #include <sbi_utils/fdt/fdt_helper.h>
    >  #include <sbi_utils/reset/fdt_reset.h>
    >
    > +extern struct fdt_reset fdt_reset_gpio;
    >  extern struct fdt_reset fdt_reset_sifive_test;
    >  extern struct fdt_reset fdt_reset_htif;
    >  extern struct fdt_reset fdt_reset_thead;
    >
    >  static struct fdt_reset *reset_drivers[] = {
    > +       &fdt_reset_gpio,
    >         &fdt_reset_sifive_test,
    >         &fdt_reset_htif,
    >         &fdt_reset_thead,
    > diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
    > new file mode 100644
    > index 0000000..a315ec9
    > --- /dev/null
    > +++ b/lib/utils/reset/fdt_reset_gpio.c
    > @@ -0,0 +1,146 @@
    > +/*
    > + * SPDX-License-Identifier: BSD-2-Clause
    > + *
    > + * Copyright (c) 2021 SiFive
    > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
    > + *
    > + * Authors:
    > + *   Green Wan <green.wan@sifive.com>
    > + *   Anup Patel <anup.patel@wdc.com>
    > + */
    > +
    > +#include <libfdt.h>
    > +#include <sbi/sbi_ecall_interface.h>
    > +#include <sbi/sbi_hart.h>
    > +#include <sbi/sbi_system.h>
    > +#include <sbi_utils/fdt/fdt_helper.h>
    > +#include <sbi_utils/gpio/fdt_gpio.h>
    > +#include <sbi_utils/reset/fdt_reset.h>
    > +
    > +static u32 poweroff_active_delay = 100;
    > +static u32 poweroff_inactive_delay = 100;
    > +static struct gpio_pin poweroff_pin;
    > +
    > +static u32 restart_active_delay = 100;
    > +static u32 restart_inactive_delay = 100;
    > +static struct gpio_pin restart_pin;
    > +
    > +/* Custom mdelay function until we have a generic mdelay() API */
    > +static void gpio_mdelay(unsigned long msecs)
    > +{
    > +       volatile int i;
    > +       while (msecs--)
    > +               for (i = 0; i < 10000; i++) ;
    > +}
    > +
    > +static int gpio_system_reset_check(u32 type, u32 reason)
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
    > +static void gpio_system_reset(u32 type, u32 reason)
    > +{
    > +       struct gpio_pin *pin = NULL;
    > +       u32 active_delay = 0, inactive_delay = 0;
    > +
    > +       switch (type) {
    > +       case SBI_SRST_RESET_TYPE_SHUTDOWN:
    > +               pin = &poweroff_pin;
    > +               active_delay = poweroff_active_delay;
    > +               inactive_delay = poweroff_inactive_delay;
    > +               break;
    > +       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
    > +       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
    > +               pin = &restart_pin;
    > +               active_delay = restart_active_delay;
    > +               inactive_delay = restart_inactive_delay;
    > +               break;
    > +       }
    > +
    > +       if (pin) {
    > +               /* drive it active, also inactive->active edge */
    > +               gpio_direction_output(pin, 1);
    > +               gpio_mdelay(active_delay);
    > +
    > +               /* drive inactive, also active->inactive edge */
    > +               gpio_set(pin, 0);
    > +               gpio_mdelay(inactive_delay);
    > +
    > +               /* drive it active, also inactive->active edge */
    > +               gpio_set(pin, 1);
    > +
    > +               /* hang !!! */
    > +               sbi_hart_hang();
    > +       }
    > +}
    > +
    > +static struct sbi_system_reset_device gpio_reset = {
    > +       .name = "gpio",
    > +       .system_reset_check = gpio_system_reset_check,
    > +       .system_reset = gpio_system_reset
    > +};
    > +
    > +static int gpio_reset_init(void *fdt, int nodeoff,
    > +                          const struct fdt_match *match)
    > +{
    > +       int rc, len;
    > +       const fdt32_t *val;
    > +       bool is_restart = (ulong)match->data;
    > +
    > +       rc = fdt_gpio_pin_get(fdt, nodeoff, 0,
    > +                             (is_restart) ? &restart_pin : &poweroff_pin);
    > +       if (rc)
    > +               return rc;
    > +
    > +       if (is_restart) {
    > +               if (fdt_getprop(fdt, nodeoff, "open-source", &len)) {
    > +                       rc = gpio_direction_input(&restart_pin);
    > +                       if (rc)
    > +                               return rc;
    > +               }
    > +
    > +               val = fdt_getprop(fdt, nodeoff, "active-delay-ms", &len);
    > +               if (len > 0)
    > +                       restart_active_delay = fdt32_to_cpu(*val);
    > +
    > +               val = fdt_getprop(fdt, nodeoff, "inactive-delay-ms", &len);
    > +               if (len > 0)
    > +                       restart_inactive_delay = fdt32_to_cpu(*val);
    > +       } else {
    > +               if (fdt_getprop(fdt, nodeoff, "input", &len)) {
    > +                       rc = gpio_direction_input(&poweroff_pin);
    > +                       if (rc)
    > +                               return rc;
    > +               }
    > +
    > +               val = fdt_getprop(fdt, nodeoff, "active-delay-ms", &len);
    > +               if (len > 0)
    > +                       poweroff_active_delay = fdt32_to_cpu(*val);
    > +
    > +               val = fdt_getprop(fdt, nodeoff, "inactive-delay-ms", &len);
    > +               if (len > 0)
    > +                       poweroff_inactive_delay = fdt32_to_cpu(*val);

    Just a personal preference:
    These two fdt_getprop can be done outside of the if else block and
    assignment inside it.

Sure, I will update.

Regards,
Anup

    > +       }
    > +
    > +       sbi_system_reset_set_device(&gpio_reset);
    > +
    > +       return 0;
    > +}
    > +
    > +static const struct fdt_match gpio_reset_match[] = {
    > +       { .compatible = "gpio-poweroff", .data = (void *)FALSE },
    > +       { .compatible = "gpio-restart", .data = (void *)TRUE },
    > +       { },
    > +};
    > +
    > +struct fdt_reset fdt_reset_gpio = {
    > +       .match_table = gpio_reset_match,
    > +       .init = gpio_reset_init,
    > +};
    > diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
    > index 672aad9..4215396 100644
    > --- a/lib/utils/reset/objects.mk
    > +++ b/lib/utils/reset/objects.mk
    > @@ -8,6 +8,7 @@
    >  #
    >
    >  libsbiutils-objs-y += reset/fdt_reset.o
    > +libsbiutils-objs-y += reset/fdt_reset_gpio.o
    >  libsbiutils-objs-y += reset/fdt_reset_htif.o
    >  libsbiutils-objs-y += reset/fdt_reset_thead.o
    >  libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
    > --
    > 2.25.1
    >
    >
    > --
    > opensbi mailing list
    > opensbi at lists.infradead.org
    > http://lists.infradead.org/mailman/listinfo/opensbi

    Otherwise, it looks
    Reviewed-by: Atish Patra <atish.patra@wdc.com> good to me.


    -- 
    Regards,
    Atish

