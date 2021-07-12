From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Jul 2021 20:35:15 +0530
Subject: [PATCH v3 5/5] lib: utils/reset: Add generic GPIO reset driver
In-Reply-To: <CAJivOr4d_QfOP0mKMAT5hE8U4V-FoMDh33ifv844=1ReveH7Mg@mail.gmail.com>
References: <20210710055827.1535906-1-anup.patel@wdc.com>
 <20210710055827.1535906-6-anup.patel@wdc.com>
 <CAJivOr44T_GmW9b27b4=B5FE6JeLsObXy1ED-_gD+sCQ3ZbNmQ@mail.gmail.com>
 <CAAhSdy1Mqh3ZCm2U=e1gUtz71qn5od-OMPa8XAbvau1vu3haUg@mail.gmail.com>
 <CAAhSdy3zv9s-JJ4fHf1KEAExwXxmrYoUeM5OUUyLfWVe-aFA6g@mail.gmail.com>
 <CAJivOr4d_QfOP0mKMAT5hE8U4V-FoMDh33ifv844=1ReveH7Mg@mail.gmail.com>
Message-ID: <CAAhSdy0p4xPYcZE1==u2smYVrzQtrOvgxXsT0aXMHAq6RwOUnw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 12, 2021 at 8:26 PM Green Wan <green.wan@sifive.com> wrote:
>
>
>
> On Mon, Jul 12, 2021 at 7:10 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Mon, Jul 12, 2021 at 4:18 PM Anup Patel <anup@brainfault.org> wrote:
>> >
>> > On Mon, Jul 12, 2021 at 3:41 PM Green Wan <green.wan@sifive.com> wrote:
>> > >
>> > > Hi Anup,
>> > >
>> > > Thanks for working on the patch. I basically make it working on my board with some changes. (including set() implementation) List some questions below.
>> > >
>> > > Regards,
>> > > - Green
>> > >
>> > > On Sat, Jul 10, 2021 at 1:59 PM Anup Patel <anup.patel@wdc.com> wrote:
>> > >>
>> > >> From: Green Wan <green.wan@sifive.com>
>> > >>
>> > >> We add generic GPIO reset driver inspired from gpio-restart
>> > >> and gpio-poweroff drivers of Linux kernel.
>> > >>
>> > >> Signed-off-by: Green Wan <green.wan@sifive.com>
>> > >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> > >> ---
>> > >>  lib/utils/reset/fdt_reset.c      |   2 +
>> > >>  lib/utils/reset/fdt_reset_gpio.c | 141 +++++++++++++++++++++++++++++++
>> > >>  lib/utils/reset/objects.mk       |   1 +
>> > >>  3 files changed, 144 insertions(+)
>> > >>  create mode 100644 lib/utils/reset/fdt_reset_gpio.c
>> > >>
>> > >> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
>> > >> index 48a49fb..aa5f59f 100644
>> > >> --- a/lib/utils/reset/fdt_reset.c
>> > >> +++ b/lib/utils/reset/fdt_reset.c
>> > >> @@ -12,11 +12,13 @@
>> > >>  #include <sbi_utils/fdt/fdt_helper.h>
>> > >>  #include <sbi_utils/reset/fdt_reset.h>
>> > >>
>> > >> +extern struct fdt_reset fdt_reset_gpio;
>> > >>  extern struct fdt_reset fdt_reset_sifive_test;
>> > >>  extern struct fdt_reset fdt_reset_htif;
>> > >>  extern struct fdt_reset fdt_reset_thead;
>> > >>
>> > >>  static struct fdt_reset *reset_drivers[] = {
>> > >> +       &fdt_reset_gpio,
>> > >>         &fdt_reset_sifive_test,
>> > >>         &fdt_reset_htif,
>> > >>         &fdt_reset_thead,
>> > >> diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
>> > >> new file mode 100644
>> > >> index 0000000..083076f
>> > >> --- /dev/null
>> > >> +++ b/lib/utils/reset/fdt_reset_gpio.c
>> > >> @@ -0,0 +1,141 @@
>> > >> +/*
>> > >> + * SPDX-License-Identifier: BSD-2-Clause
>> > >> + *
>> > >> + * Copyright (c) 2021 SiFive
>> > >> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
>> > >> + *
>> > >> + * Authors:
>> > >> + *   Green Wan <green.wan@sifive.com>
>> > >> + *   Anup Patel <anup.patel@wdc.com>
>> > >> + */
>> > >> +
>> > >> +#include <libfdt.h>
>> > >> +#include <sbi/sbi_console.h>
>> > >> +#include <sbi/sbi_ecall_interface.h>
>> > >> +#include <sbi/sbi_hart.h>
>> > >> +#include <sbi/sbi_system.h>
>> > >> +#include <sbi_utils/fdt/fdt_helper.h>
>> > >> +#include <sbi_utils/gpio/fdt_gpio.h>
>> > >> +#include <sbi_utils/reset/fdt_reset.h>
>> > >> +
>> > >> +struct gpio_reset {
>> > >> +       struct gpio_pin pin;
>> > >> +       u32 active_delay;
>> > >> +       u32 inactive_delay;
>> > >> +};
>> > >> +
>> > >> +static struct gpio_reset poweroff = {
>> > >> +       .active_delay = 100,
>> > >> +       .inactive_delay = 100
>> > >> +};
>> > >> +
>> > >> +static struct gpio_reset restart = {
>> > >> +       .active_delay = 100,
>> > >> +       .inactive_delay = 100
>> > >> +};
>> > >> +
>> > >> +/* Custom mdelay function until we have a generic mdelay() API */
>> > >> +static void gpio_mdelay(unsigned long msecs)
>> > >> +{
>> > >> +       volatile int i;
>> > >> +       while (msecs--)
>> > >> +               for (i = 0; i < 10000; i++) ;
>> > >
>> > >
>> > > I have to adjust '10000' to '100000' to make Unmatched board working like below.
>> > >
>> > > -               for (i = 0; i < 10000; i++) ;
>> > > +               for (i = 0; i < 100000; i++) ;
>> > >
>> > >  So I guess we might have a timing issue for the real boards here. And if loop becomes too big, the QEMU might looks like a hanging?
>> >
>> > The gpio_mdelay() loop is temporary and this will be replaced
>> > with a proper mdelay() function provided by the generic library.
>> >
>> > For now, we can go with 100000 instead of 10000.
>> >
>> > >
>> > >>
>> > >> +}
>> > >> +
>> > >> +static int gpio_system_reset_check(u32 type, u32 reason)
>> > >> +{
>> > >> +       switch (type) {
>> > >> +       case SBI_SRST_RESET_TYPE_SHUTDOWN:
>> > >> +       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
>> > >> +       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
>> > >> +               return 1;
>> > >> +       }
>> > >> +
>> > >> +       return 0;
>> > >> +}
>> > >> +
>> > >> +static void gpio_system_reset(u32 type, u32 reason)
>> > >> +{
>> > >> +       struct gpio_reset *reset = NULL;
>> > >> +
>> > >> +       switch (type) {
>> > >> +       case SBI_SRST_RESET_TYPE_SHUTDOWN:
>> > >> +               reset = &poweroff;
>> > >> +               break;
>> > >> +       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
>> > >> +       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
>> > >> +               reset = &restart;
>> > >> +               break;
>> > >> +       }
>> > >> +
>> > >> +       if (reset) {
>> > >> +               if (!reset->pin.chip) {
>> > >> +                       sbi_printf("%s: gpio pin not available\n", __func__);
>> > >> +                       goto skip_reset;
>> > >> +               }
>> > >> +
>> > >> +               /* drive it active, also inactive->active edge */
>> > >> +               gpio_direction_output(&reset->pin, 1);
>> > >
>> > >
>> > > Should we check (reset->pin.flags & GPIO_FLAG_ACTIVE_LOW) for the output value?
>> >
>> > This is a generic sequence similar to Linux GPIO restart/poweroff
>> > drivers.
>> >
>> > The approach here is:
>> > 1) First set the GPIO line to '1' (HIGH) for some time
>> > 2) Next set the GPIO line to '0' (LOW) for some time
>> > 3) Lastly set the GPIO line to '1' (HIGH) again
>> >
>> > Above sequence handles both ACTIVE_LOW and ACTIVE_HIGH
>> > GPIO lines. The ACTIVE_LOG GPIO reset will be triggered in
>> > step2 whereas ACTIVE_HIGH will be triggered in step1. Also,
>> > edge sensitive GPIO lines will be triggered between step1 & 2
>> > or between step2 and 3.
>> >
>> > >
>> > >>
>> > >> +               gpio_mdelay(reset->active_delay);
>> > >> +
>> > >> +               /* drive inactive, also active->inactive edge */
>> > >> +               gpio_set(&reset->pin, 0);
>> > >> +               gpio_mdelay(reset->inactive_delay);
>> > >> +
>> > >> +               /* drive it active, also inactive->active edge */
>> > >> +               gpio_set(&reset->pin, 1);
>> > >
>> > > Do we assume the GPIO reset is triggered by outputting an ACTIVE_LOW pulse here?
>> > >
>> > > If all GPIO reset goes here, should we consider different trigger mode as well? For example, ACTIVE_HIGH? Or allow different board designs to hook different implementations? (maybe some boards needs special timing or workaround)
>> >
>> > Please see above, comment.
>>
>> I forgot to mention here that, "active-delay-ms" and
>> "inactive-delay-ms" DT properties help HW vendors
>> to fine tune the timing.
>>
>> These DT properties are already documented in
>> Linux GPIO restart/poweroff DT bindings.
>>
>> Regards,
>> Anup
>
>
> Hi Anup,
>
> Thanks for pointing that out. Sounds perfect. Do you want me to send out v4 patch or just send [4/5] and [5/5] to you?
>
> [PATCH 4/5] is for set() implementation
> [PATCH 5/5] is for mdelay loop adjustment
>
> I have a working version and also tested "active-delay-ms" in DT stuff. I will run a few more tests. Able to send tomorrow morning if not hitting issue.

Yes, please go ahead and send the v4 patch series.

Me or Atish will send a separate patch to replace gpio_mdelay()
with proper mdelay() implementation.

Regards,
Anup

>
> Regards,
> - Green
>>
>>
>> >
>> > >
>> > >>
>> > >> +
>> > >> +skip_reset:
>> > >> +               /* hang !!! */
>> > >> +               sbi_hart_hang();
>> > >> +       }
>> > >> +}
>> > >> +
>> > >> +static struct sbi_system_reset_device gpio_reset = {
>> > >> +       .name = "gpio-reset",
>> > >> +       .system_reset_check = gpio_system_reset_check,
>> > >> +       .system_reset = gpio_system_reset
>> > >> +};
>> > >> +
>> > >> +static int gpio_reset_init(void *fdt, int nodeoff,
>> > >> +                          const struct fdt_match *match)
>> > >> +{
>> > >> +       int rc, len;
>> > >> +       const fdt32_t *val;
>> > >> +       bool is_restart = (ulong)match->data;
>> > >> +       const char *dir_prop = (is_restart) ? "open-source" : "input";
>> > >> +       struct gpio_reset *reset = (is_restart) ? &restart : &poweroff;
>> > >> +
>> > >> +       rc = fdt_gpio_pin_get(fdt, nodeoff, 0, &reset->pin);
>> > >> +       if (rc)
>> > >> +               return rc;
>> > >> +
>> > >> +       if (fdt_getprop(fdt, nodeoff, dir_prop, &len)) {
>> > >> +               rc = gpio_direction_input(&reset->pin);
>> > >> +               if (rc)
>> > >> +                       return rc;
>> > >> +       }
>> > >> +
>> > >> +       val = fdt_getprop(fdt, nodeoff, "active-delay-ms", &len);
>> > >> +       if (len > 0)
>> > >> +               reset->active_delay = fdt32_to_cpu(*val);
>> > >> +
>> > >> +       val = fdt_getprop(fdt, nodeoff, "inactive-delay-ms", &len);
>> > >> +       if (len > 0)
>> > >> +               reset->inactive_delay = fdt32_to_cpu(*val);
>> > >> +
>> > >> +       sbi_system_reset_set_device(&gpio_reset);
>> > >> +
>> > >> +       return 0;
>> > >> +}
>> > >> +
>> > >> +static const struct fdt_match gpio_reset_match[] = {
>> > >> +       { .compatible = "gpio-poweroff", .data = (void *)FALSE },
>> > >> +       { .compatible = "gpio-restart", .data = (void *)TRUE },
>> > >> +       { },
>> > >> +};
>> > >> +
>> > >> +struct fdt_reset fdt_reset_gpio = {
>> > >> +       .match_table = gpio_reset_match,
>> > >> +       .init = gpio_reset_init,
>> > >> +};
>> > >> diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
>> > >> index 672aad9..4215396 100644
>> > >> --- a/lib/utils/reset/objects.mk
>> > >> +++ b/lib/utils/reset/objects.mk
>> > >> @@ -8,6 +8,7 @@
>> > >>  #
>> > >>
>> > >>  libsbiutils-objs-y += reset/fdt_reset.o
>> > >> +libsbiutils-objs-y += reset/fdt_reset_gpio.o
>> > >>  libsbiutils-objs-y += reset/fdt_reset_htif.o
>> > >>  libsbiutils-objs-y += reset/fdt_reset_thead.o
>> > >>  libsbiutils-objs-y += reset/fdt_reset_thead_asm.o
>> > >> --
>> > >> 2.25.1
>> > >>
>> >
>> > Regards,
>> > Anup

