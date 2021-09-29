From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Sep 2021 09:46:55 +0530
Subject: [PATCH 1/1] lib: utils: identify supported GPIO reset methods
In-Reply-To: <20210928114246.46596-1-heinrich.schuchardt@canonical.com>
References: <20210928114246.46596-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy1oEFKw6iE0Dc=cmRjhQWV_i6JvaB6u4P3ayWzKKXiXNw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

+Nikita

On Tue, Sep 28, 2021 at 5:13 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The GPIO reset driver supports reset and poweroff. But not all boards
> support both. gpio_system_reset_check() must detect this situation.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

I had mentioned on the PMIC reset series that we need to improve
the sbi_system.h device registration such that reset drivers can
register a reset device for a range of reset types. This will allow
separate reset drivers (e.g. PMIC+GPIO) for SiFive Unmatched.
Also, reset_check() callback will not be required anymore.

Regards,
Anup

> ---
>  lib/utils/reset/fdt_reset_gpio.c | 44 +++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
>
> diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
> index 30127f5..77e4d0e 100644
> --- a/lib/utils/reset/fdt_reset_gpio.c
> +++ b/lib/utils/reset/fdt_reset_gpio.c
> @@ -35,21 +35,9 @@ static struct gpio_reset restart = {
>         .inactive_delay = 100
>  };
>
> -static int gpio_system_reset_check(u32 type, u32 reason)
> -{
> -       switch (type) {
> -       case SBI_SRST_RESET_TYPE_SHUTDOWN:
> -       case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> -       case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> -               return 1;
> -       }
> -
> -       return 0;
> -}
> -
> -static void gpio_system_reset(u32 type, u32 reason)
> +static struct gpio_reset *gpio_get_reset_settings(u32 type)
>  {
> -       struct gpio_reset *reset = NULL;
> +       struct gpio_reset *reset;
>
>         switch (type) {
>         case SBI_SRST_RESET_TYPE_SHUTDOWN:
> @@ -59,14 +47,26 @@ static void gpio_system_reset(u32 type, u32 reason)
>         case SBI_SRST_RESET_TYPE_WARM_REBOOT:
>                 reset = &restart;
>                 break;
> +       default:
> +               reset = NULL;
>         }
>
> -       if (reset) {
> -               if (!reset->pin.chip) {
> -                       sbi_printf("%s: gpio pin not available\n", __func__);
> -                       goto skip_reset;
> -               }
> +       if (reset && !reset->pin.chip)
> +               reset = NULL;
> +
> +       return reset;
> +}
> +
> +static int gpio_system_reset_check(u32 type, u32 reason)
> +{
> +       return !!gpio_get_reset_settings(type);
> +}
> +
> +static void gpio_system_reset(u32 type, u32 reason)
> +{
> +       struct gpio_reset *reset = gpio_get_reset_settings(type);
>
> +       if (reset) {
>                 /* drive it active, also inactive->active edge */
>                 gpio_direction_output(&reset->pin, 1);
>                 sbi_timer_mdelay(reset->active_delay);
> @@ -77,11 +77,9 @@ static void gpio_system_reset(u32 type, u32 reason)
>
>                 /* drive it active, also inactive->active edge */
>                 gpio_set(&reset->pin, 1);
> -
> -skip_reset:
> -               /* hang !!! */
> -               sbi_hart_hang();
>         }
> +       /* hang !!! */
> +       sbi_hart_hang();
>  }
>
>  static struct sbi_system_reset_device gpio_reset = {
> --
> 2.32.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

