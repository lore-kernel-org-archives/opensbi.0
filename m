From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Sep 2021 09:29:15 +0530
Subject: [PATCH v3 5/5] lib: utils/reset: use sbi_timer_mdelay() in gpio
 reset driver
In-Reply-To: <45902f3dffd92dd45c56181b4bb0748ee3b6092a.camel@126.com>
References: <20210925043735.686518-1-anup.patel@wdc.com>
 <20210925043735.686518-6-anup.patel@wdc.com>
 <45902f3dffd92dd45c56181b4bb0748ee3b6092a.camel@126.com>
Message-ID: <CAAhSdy25asFgq_eqnxAoRb_sfeenfEwKeZm9sCCHDct9cY3DCw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 25, 2021 at 1:00 PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2021-09-25???? 10:07 +0530?Anup Patel???
> > We should use sbi_timer_mdelay() instead of custom gpio_mdelay() in
> > the gpio reset driver.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> > ---
> >  lib/utils/reset/fdt_reset_gpio.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
> >
> > diff --git a/lib/utils/reset/fdt_reset_gpio.c
> > b/lib/utils/reset/fdt_reset_gpio.c
> > index 77e308a..30127f5 100644
> > --- a/lib/utils/reset/fdt_reset_gpio.c
> > +++ b/lib/utils/reset/fdt_reset_gpio.c
> > @@ -14,6 +14,7 @@
> >  #include <sbi/sbi_ecall_interface.h>
> >  #include <sbi/sbi_hart.h>
> >  #include <sbi/sbi_system.h>
> > +#include <sbi/sbi_timer.h>
> >  #include <sbi_utils/fdt/fdt_helper.h>
> >  #include <sbi_utils/gpio/fdt_gpio.h>
> >  #include <sbi_utils/reset/fdt_reset.h>
> > @@ -34,14 +35,6 @@ static struct gpio_reset restart = {
> >         .inactive_delay = 100
> >  };
> >
> > -/* Custom mdelay function until we have a generic mdelay() API */
> > -static void gpio_mdelay(unsigned long msecs)
> > -{
> > -       volatile int i;
> > -       while (msecs--)
> > -               for (i = 0; i < 100000; i++) ;
> > -}
> > -
> >  static int gpio_system_reset_check(u32 type, u32 reason)
> >  {
> >         switch (type) {
> > @@ -76,11 +69,11 @@ static void gpio_system_reset(u32 type, u32
> > reason)
> >
> >                 /* drive it active, also inactive->active edge */
> >                 gpio_direction_output(&reset->pin, 1);
> > -               gpio_mdelay(reset->active_delay);
> > +               sbi_timer_mdelay(reset->active_delay);
> >
> >                 /* drive inactive, also active->inactive edge */
> >                 gpio_set(&reset->pin, 0);
> > -               gpio_mdelay(reset->inactive_delay);
> > +               sbi_timer_mdelay(reset->inactive_delay);
> >
> >                 /* drive it active, also inactive->active edge */
> >                 gpio_set(&reset->pin, 1);
> > --
> > 2.25.1
> >
> >
>
>

