From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 May 2024 10:31:16 +0530
Subject: [PATCH] lib: utils/gpio: repect flag GPIO_FLAG_ACTIVE_LOW
In-Reply-To: <IA1PR20MB495345DDEE139BA3E36FE2FDBBE92@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495345DDEE139BA3E36FE2FDBBE92@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAK9=C2V0FkLdBEFx6xoTuiYc29C4HAKpqiL=_YLozt3DNi=wrw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 20, 2024 at 11:45?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> "gpio-poweroff" and "gpio-restart" always set gpio to high to
> active the function, but some chips need a low signal to active.
> Fortunately, it can be achieved by setting GPIO_FLAG_ACTIVE_LOW
> for the gpio. Implement this flag support for the gpio library
> so the gpio reset can function well.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  lib/utils/gpio/gpio.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/lib/utils/gpio/gpio.c b/lib/utils/gpio/gpio.c
> index 3a3a6b2..be10fef 100644
> --- a/lib/utils/gpio/gpio.c
> +++ b/lib/utils/gpio/gpio.c
> @@ -73,17 +73,26 @@ int gpio_direction_output(struct gpio_pin *gp, int value)
>         if (!gp->chip->direction_output)
>                 return SBI_ENOSYS;
>
> +       if (gp->flags & GPIO_FLAG_ACTIVE_LOW)
> +               value = (value == 0 ? 1 : 0);

Drop the braces "()".

> +
>         return gp->chip->direction_output(gp, value);
>  }
>
>  int gpio_get(struct gpio_pin *gp)
>  {
> +       int value;
> +
>         if (!gp || !gp->chip || (gp->chip->ngpio <= gp->offset))
>                 return SBI_EINVAL;
>         if (!gp->chip->get)
>                 return SBI_ENOSYS;
>
> -       return gp->chip->get(gp);
> +       value = gp->chip->get(gp);
> +
> +       if (gp->flags & GPIO_FLAG_ACTIVE_LOW)
> +               value = (value == 0 ? 1 : 0);

Drop the braces "()".

> +       return value;
>  }
>
>  int gpio_set(struct gpio_pin *gp, int value)
> @@ -93,6 +102,9 @@ int gpio_set(struct gpio_pin *gp, int value)
>         if (!gp->chip->set)
>                 return SBI_ENOSYS;
>
> +       if (gp->flags & GPIO_FLAG_ACTIVE_LOW)
> +               value = (value == 0 ? 1 : 0);

Drop the braces "()".

> +
>         gp->chip->set(gp, value);
>         return 0;
>  }
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

