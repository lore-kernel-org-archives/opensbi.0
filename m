From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Oct 2021 15:17:40 +0530
Subject: [PATCH 1/1] lib: utils/reset: error handling in fdt_reset_init()
In-Reply-To: <20211026082525.10070-1-heinrich.schuchardt@canonical.com>
References: <20211026082525.10070-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy2vtAxbM81tXKdr3y=4nv9_rXTtsThJGXN-hPLygD65-g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 26, 2021 at 1:55 PM Heinrich Schuchardt
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
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  lib/utils/reset/fdt_reset.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
> index 92f37b0..e1d6fdc 100644
> --- a/lib/utils/reset/fdt_reset.c
> +++ b/lib/utils/reset/fdt_reset.c
> @@ -46,10 +46,11 @@ int fdt_reset_init(void)
>
>                 if (drv->init) {
>                         rc = drv->init(fdt, noff, match);
> -                       if (rc == SBI_ENODEV)
> -                               continue;
> -                       if (rc)
> -                               return rc;
> +                       /*
> +                        * The driver will not call
> +                        * sbi_system_reset_add_device() in case of an error.
> +                        * Hence any error shall be ignored here.
> +                        */

Just a minor suggestion, how about having an error print
for "rc && rc != SBI_ENODEV" ?

>                 }
>         }
>
> --
> 2.32.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

