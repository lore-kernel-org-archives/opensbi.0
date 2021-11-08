From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Nov 2021 10:58:02 +0530
Subject: [PATCH v5 3/3] lib: sbi: error handling in fdt_reset_init()
In-Reply-To: <20211106095451.13200-4-heinrich.schuchardt@canonical.com>
References: <20211106095451.13200-1-heinrich.schuchardt@canonical.com>
 <20211106095451.13200-4-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy38DiO1AcipDk1mkwhzO9L+SDSt7cK+FFnZXAi0TrsDfQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 6, 2021 at 3:24 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The initialization of a reset driver may fail for various reasons, like
> a PMIC based reset driver not finding the required I2C driver. The return
> code of the init routine may take other error values than -ENODEV.
>
> If the initialization of a reset driver fails, this should not lead to the
> board hanging. It is enough that the reset driver does not call
> sbi_system_reset_add_device() to avoid invoking the driver for a device
> that could not be initialized.
>
> Change the return type of fdt_reset_init() to void.
> Print a message if an error occurs.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
> v5:
>         no change
> v4:
>         add a code comment indicating that fdt_reset_init() is invoke
>         in final init
> v3:
>         fix sign of SBI_ENODEV in fdt_reset_init()
> v2:
> ---
>  include/sbi_utils/reset/fdt_reset.h |  7 ++++++-
>  lib/utils/reset/fdt_reset.c         | 13 ++++++-------
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
> index 6d58697..46167b9 100644
> --- a/include/sbi_utils/reset/fdt_reset.h
> +++ b/include/sbi_utils/reset/fdt_reset.h
> @@ -17,6 +17,11 @@ struct fdt_reset {
>         int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
>  };
>
> -int fdt_reset_init(void);
> +/**
> + * fdt_reset_init() - initialize reset drivers based on the device-tree
> + *
> + * This function shall be invoked in final init.
> + */
> +void fdt_reset_init(void);
>
>  #endif
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index 168bb0c..9bd727a 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -7,6 +7,7 @@
>   *   Anup Patel <anup.patel@wdc.com>
>   */
>
> +#include <sbi/sbi_console.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> @@ -28,7 +29,7 @@ static struct fdt_reset *reset_drivers[] = {
>         &fdt_reset_thead,
>  };
>
> -int fdt_reset_init(void)
> +void fdt_reset_init(void)
>  {
>         int pos, noff, rc;
>         struct fdt_reset *drv;
> @@ -44,12 +45,10 @@ int fdt_reset_init(void)
>
>                 if (drv->init) {
>                         rc = drv->init(fdt, noff, match);
> -                       if (rc == SBI_ENODEV)
> -                               continue;
> -                       if (rc)
> -                               return rc;
> +                       if (rc && rc != SBI_ENODEV) {
> +                               sbi_printf("%s: %s init failed, %d\n",
> +                                          __func__, match->compatible, rc);
> +                       }
>                 }
>         }
> -
> -       return 0;
>  }
> --
> 2.32.0
>

