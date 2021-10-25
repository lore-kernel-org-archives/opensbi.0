From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Oct 2021 09:14:10 +0530
Subject: [PATCH] lib: utils/reset: Register separate GPIO system reset
 devices
In-Reply-To: <8e58298f2c12f29af7951acfdb3891afa96638ab.camel@126.com>
References: <20211021055019.1450208-1-anup.patel@wdc.com>
 <8e58298f2c12f29af7951acfdb3891afa96638ab.camel@126.com>
Message-ID: <CAAhSdy08zX5B9S5sMHDyp7UZ5Dk+h2pR2rmuCOYor2ogCyhSHw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 24, 2021 at 9:52 PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2021-10-21???? 11:20 +0530?Anup Patel???
> > Now that sbi_system support multiple system reset devices, we should
> > register separate devices for GPIO restart and GPIO poweroff because
> > DT describes these as separate devices with different compatible
> > strings.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  lib/utils/reset/fdt_reset_gpio.c | 60 ++++++++++++++++++++++--------
> > --
> >  1 file changed, 41 insertions(+), 19 deletions(-)
> >
> > diff --git a/lib/utils/reset/fdt_reset_gpio.c
> > b/lib/utils/reset/fdt_reset_gpio.c
> > index 4da1450..302035b 100644
> > --- a/lib/utils/reset/fdt_reset_gpio.c
> > +++ b/lib/utils/reset/fdt_reset_gpio.c
> > @@ -35,20 +35,20 @@ static struct gpio_reset restart = {
> >         .inactive_delay = 100
> >  };
> >
>
> I think the key to separate reset and shutdown drivers is
> system_reset_check.The following code can be simplified.

Well, it's better/cleaner to have separate callbacks for GPIO
restart and GPIO power-off such that restart callback never
work for power-off and vice-versa.

>
> Regards,
> Xiang W
>
> > -static struct gpio_reset *gpio_get_reset_settings(u32 type)
> This function does not need to be modified
> > +static struct gpio_reset *gpio_reset_get(bool is_restart, u32 type)
> >  {
> > -       struct gpio_reset *reset;
> > +       struct gpio_reset *reset = NULL;
> >
> >         switch (type) {
> >         case SBI_SRST_RESET_TYPE_SHUTDOWN:
> > -               reset = &poweroff;
> > +               if (!is_restart)
> > +                       reset = &poweroff;
> >                 break;
> >         case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> >         case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> > -               reset = &restart;
> > +               if (is_restart)
> > +                       reset = &restart;
> >                 break;
> > -       default:
> > -               reset = NULL;
> >         }
> >
> >         if (reset && !reset->pin.chip)
> > @@ -57,15 +57,8 @@ static struct gpio_reset
> > *gpio_get_reset_settings(u32 type)
> >         return reset;
> >  }
> >
> > -static int gpio_system_reset_check(u32 type, u32 reason)
> > +static void gpio_reset_exec(struct gpio_reset *reset)
> >  {
> > -       return !!gpio_get_reset_settings(type);
> > -}
> > -
> > -static void gpio_system_reset(u32 type, u32 reason)
> > -{
> > -       struct gpio_reset *reset = gpio_get_reset_settings(type);
> > -
> >         if (reset) {
> >                 /* drive it active, also inactive->active edge */
> >                 gpio_direction_output(&reset->pin, 1);
> > @@ -82,10 +75,36 @@ static void gpio_system_reset(u32 type, u32
> > reason)
> >         sbi_hart_hang();
> >  }
> >
> > -static struct sbi_system_reset_device gpio_reset = {
> > -       .name = "gpio-reset",
> > -       .system_reset_check = gpio_system_reset_check,
> > -       .system_reset = gpio_system_reset
> > +static int gpio_system_poweroff_check(u32 type, u32 reason)
> > +{
> Add type check

IMO, we should keep the type checks in one place.

This will add redundant checks because gpio_get_reset_settings()
already does the type checks so better to make
gpio_get_reset_settings() more flexible which is what this
patch does.

>         if (type == SBI_SRST_RESET_TYPE_SHUTDOWN)
>                 return !!gpio_get_reset_settings(type);
>         return 0;
> > +       return !!gpio_reset_get(FALSE, type);
> > +}
> > +
> > +static void gpio_system_poweroff(u32 type, u32 reason)
> > +{
> > +       gpio_reset_exec(gpio_reset_get(FALSE, type));
> > +}
> > +
> > +static struct sbi_system_reset_device gpio_poweroff = {
> > +       .name = "gpio-poweroff",
> > +       .system_reset_check = gpio_system_poweroff_check,
> Keep general reset operation
> > +       .system_reset = gpio_system_poweroff
> > +};
> > +
> > +static int gpio_system_restart_check(u32 type, u32 reason)
> > +{
> > +       return !!gpio_reset_get(TRUE, type);
> > +}
> > +
> > +static void gpio_system_restart(u32 type, u32 reason)
> > +{
> Add type check

Please see above comment.

>         if (type == SBI_SRST_RESET_TYPE_COLD_REBOOT
>                 || type == SBI_SRST_RESET_TYPE_WARM_REBOOT)
>                 return !!gpio_get_reset_settings(type);
>         return 0;
> > +       gpio_reset_exec(gpio_reset_get(TRUE, type));
> > +}
> > +
> > +static struct sbi_system_reset_device gpio_restart = {
> > +       .name = "gpio-restart",
> > +       .system_reset_check = gpio_system_restart_check,
> Keep general reset operation
> > +       .system_reset = gpio_system_restart
> >  };
> >
> >  static int gpio_reset_init(void *fdt, int nodeoff,
> > @@ -115,7 +134,10 @@ static int gpio_reset_init(void *fdt, int
> > nodeoff,
> >         if (len > 0)
> >                 reset->inactive_delay = fdt32_to_cpu(*val);
> >
> > -       sbi_system_reset_add_device(&gpio_reset);
> > +       if (is_restart)
> > +               sbi_system_reset_add_device(&gpio_restart);
> > +       else
> > +               sbi_system_reset_add_device(&gpio_poweroff);
> >
> >         return 0;
> >  }
> > --
> > 2.25.1
> >
> >
>
>

Regards,
Anup

