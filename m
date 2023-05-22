From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 May 2023 09:30:34 +0530
Subject: [PATCH 4/4] lib: utils: Improve fdt_timer
In-Reply-To: <20230509144735.72059-5-wxjstz@126.com>
References: <20230509144735.72059-1-wxjstz@126.com> <20230509144735.72059-5-wxjstz@126.com>
Message-ID: <CAAhSdy24JPGVo5mYr=WOyCkvRZTPUYfJ=AwLqPpMZVpjzeQzUQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 9, 2023 at 8:19?PM Xiang W <wxjstz@126.com> wrote:
>
> Remove dummy driver. Optimize fdt_timer_cold_init to exit the
> loop early.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/utils/timer/fdt_timer.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
> index 4695c0f..02cfa35 100644
> --- a/lib/utils/timer/fdt_timer.c
> +++ b/lib/utils/timer/fdt_timer.c
> @@ -16,24 +16,17 @@
>  extern struct fdt_timer *fdt_timer_drivers[];
>  extern unsigned long fdt_timer_drivers_size;
>
> -static struct fdt_timer dummy = {
> -       .match_table = NULL,
> -       .cold_init = NULL,
> -       .warm_init = NULL,
> -       .exit = NULL,
> -};
> -
> -static struct fdt_timer *current_driver = &dummy;
> +static struct fdt_timer *current_driver = NULL;
>
>  void fdt_timer_exit(void)
>  {
> -       if (current_driver->exit)
> +       if (current_driver && current_driver->exit)
>                 current_driver->exit();
>  }
>
>  static int fdt_timer_warm_init(void)
>  {
> -       if (current_driver->warm_init)
> +       if (current_driver && current_driver->warm_init)
>                 return current_driver->warm_init();
>         return 0;
>  }
> @@ -59,13 +52,11 @@ static int fdt_timer_cold_init(void)
>                                         return rc;
>                         }
>                         current_driver = drv;
> +                       return 0;

This will succeed if drv->cold_init == NULL.

>                 }
> -
> -               if (current_driver != &dummy)
> -                       break;
>         }
>
> -       return 0;
> +       return SBI_ENODEV;

We can't fail here since systems with Sstc might not provide
mtimer/clint DT node in the device tree.

Regards,
Anup

>  }
>
>  int fdt_timer_init(bool cold_boot)
> --
> 2.39.2
>

