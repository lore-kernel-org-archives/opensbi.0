From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 May 2024 18:02:02 +0530
Subject: [PATCH v2] lib: utils/gpio: respect flag GPIO_FLAG_ACTIVE_LOW
In-Reply-To: <IA1PR20MB4953FBF81F8044CDC23E245FBBF42@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953FBF81F8044CDC23E245FBBF42@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy1NS8UmTACJu18GJAFf1g90u96FsnvAcVx7tGWb1F-J1g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 23, 2024 at 10:37?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> "gpio-poweroff" and "gpio-restart" always set gpio to high to
> active the function, but some chips need a low signal to active.
> Fortunately, it can be achieved by setting GPIO_FLAG_ACTIVE_LOW
> for the gpio. Implement this flag support for the gpio library
> so the gpio reset can function well.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changed from v1:
> 1. drop unnecessary braces.
> 2. fix typo in title.
> ---
>  lib/utils/gpio/gpio.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/lib/utils/gpio/gpio.c b/lib/utils/gpio/gpio.c
> index 3a3a6b2..6ffe929 100644
> --- a/lib/utils/gpio/gpio.c
> +++ b/lib/utils/gpio/gpio.c
> @@ -73,17 +73,26 @@ int gpio_direction_output(struct gpio_pin *gp, int value)
>         if (!gp->chip->direction_output)
>                 return SBI_ENOSYS;
>
> +       if (gp->flags & GPIO_FLAG_ACTIVE_LOW)
> +               value = value == 0 ? 1 : 0;
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
> +               value = value == 0 ? 1 : 0;
> +       return value;
>  }
>
>  int gpio_set(struct gpio_pin *gp, int value)
> @@ -93,6 +102,9 @@ int gpio_set(struct gpio_pin *gp, int value)
>         if (!gp->chip->set)
>                 return SBI_ENOSYS;
>
> +       if (gp->flags & GPIO_FLAG_ACTIVE_LOW)
> +               value = value == 0 ? 1 : 0;
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

