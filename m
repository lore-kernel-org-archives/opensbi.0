From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 May 2023 11:46:38 +0530
Subject: [PATCH v3 3/4] lib: utils: Improve fdt_ipi
In-Reply-To: <20230522051809.1062177-4-wxjstz@126.com>
References: <20230522051809.1062177-1-wxjstz@126.com> <20230522051809.1062177-4-wxjstz@126.com>
Message-ID: <CAAhSdy0umEWNvo7SjTrpL5VDiNH89AaJkJLqRsgJM4Dn5w6kAQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 22, 2023 at 10:50?AM Xiang W <wxjstz@126.com> wrote:
>
> Remove dummy driver. Optimize fdt_ipi_cold_init to exit the loop
> early.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/ipi/fdt_ipi.c | 36 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 21 deletions(-)
>
> diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
> index 66dc510..54f7c4c 100644
> --- a/lib/utils/ipi/fdt_ipi.c
> +++ b/lib/utils/ipi/fdt_ipi.c
> @@ -16,24 +16,17 @@
>  extern struct fdt_ipi *fdt_ipi_drivers[];
>  extern unsigned long fdt_ipi_drivers_size;
>
> -static struct fdt_ipi dummy = {
> -       .match_table = NULL,
> -       .cold_init = NULL,
> -       .warm_init = NULL,
> -       .exit = NULL,
> -};
> -
> -static struct fdt_ipi *current_driver = &dummy;
> +static struct fdt_ipi *current_driver = NULL;
>
>  void fdt_ipi_exit(void)
>  {
> -       if (current_driver->exit)
> +       if (current_driver && current_driver->exit)
>                 current_driver->exit();
>  }
>
>  static int fdt_ipi_warm_init(void)
>  {
> -       if (current_driver->warm_init)
> +       if (current_driver && current_driver->warm_init)
>                 return current_driver->warm_init();
>         return 0;
>  }
> @@ -51,20 +44,21 @@ static int fdt_ipi_cold_init(void)
>                 noff = -1;
>                 while ((noff = fdt_find_match(fdt, noff,
>                                         drv->match_table, &match)) >= 0) {
> -                       if (drv->cold_init) {
> -                               rc = drv->cold_init(fdt, noff, match);
> -                               if (rc == SBI_ENODEV)
> -                                       continue;
> -                               if (rc)
> -                                       return rc;
> -                       }
> -                       current_driver = drv;
> -               }
> +                       /* drv->cold_init must not be NULL */
> +                       if (drv->cold_init == NULL)
> +                               return SBI_EFAIL;
>
> -               if (current_driver != &dummy)
> -                       break;
> +                       rc = drv->cold_init(fdt, noff, match);
> +                       if (rc == SBI_ENODEV)
> +                               continue;
> +                       if (rc == 0)
> +                               current_driver = drv;
> +                       return rc;
> +               }
>         }
>
> +       /* On some single-hart system there is no need for ipi,
> +        * so we cannot return a failure here */
>         return 0;
>  }
>
> --
> 2.39.2
>

