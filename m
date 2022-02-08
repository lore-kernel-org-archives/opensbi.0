From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 8 Feb 2022 00:54:40 -0800
Subject: [PATCH 05/13] lib: utils/irqchip: Allow multiple FDT irqchip
 drivers
In-Reply-To: <20220104101323.127564-3-apatel@ventanamicro.com>
References: <20220104101323.127564-1-apatel@ventanamicro.com>
 <20220104101323.127564-3-apatel@ventanamicro.com>
Message-ID: <CAOnJCULSQuYnooTf656914p5stpVUGDhvu92NLYo5so-uq=qyw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 4, 2022 at 2:13 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We can have multiple FDT irqchip drivers to be probed when a RISC-V
> system has different types of interrupt controller in a hierarchy.
>
> This will be certainely the case when a RISC-V system has both

/s/certainely/certainly

> RISC-V AIA IMSIC and RISC-V AIA APLIC implemented.
>
> We extend simple FDT irqchip framework to allow multiple FDT
> irqchip drivers to be used for same RISC-V platform.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/irqchip/fdt_irqchip.c | 37 ++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
> index 8dda661..bf6969a 100644
> --- a/lib/utils/irqchip/fdt_irqchip.c
> +++ b/lib/utils/irqchip/fdt_irqchip.c
> @@ -18,23 +18,40 @@ static struct fdt_irqchip *irqchip_drivers[] = {
>         &fdt_irqchip_plic
>  };
>
> -static struct fdt_irqchip *current_driver = NULL;
> +#define FDT_IRQCHIP_MAX_DRIVERS        8
> +
> +static struct fdt_irqchip *current_drivers[FDT_IRQCHIP_MAX_DRIVERS] = {0};
> +static int current_drivers_count;
>
>  void fdt_irqchip_exit(void)
>  {
> -       if (current_driver && current_driver->exit)
> -               current_driver->exit();
> +       int i;
> +
> +       for (i = 0; i < current_drivers_count; i++) {
> +               if (!current_drivers[i] || !current_drivers[i]->exit)
> +                       continue;
> +               current_drivers[i]->exit();
> +       }
>  }
>
>  static int fdt_irqchip_warm_init(void)
>  {
> -       if (current_driver && current_driver->warm_init)
> -               return current_driver->warm_init();
> +       int i, rc;
> +
> +       for (i = 0; i < current_drivers_count; i++) {
> +               if (!current_drivers[i] || !current_drivers[i]->warm_init)
> +                       continue;
> +               rc = current_drivers[i]->warm_init();
> +               if (rc)
> +                       return rc;
> +       }
> +
>         return 0;
>  }
>
>  static int fdt_irqchip_cold_init(void)
>  {
> +       bool drv_added;
>         int pos, noff, rc;
>         struct fdt_irqchip *drv;
>         const struct fdt_match *match;
> @@ -44,6 +61,7 @@ static int fdt_irqchip_cold_init(void)
>                 drv = irqchip_drivers[pos];
>
>                 noff = -1;
> +               drv_added = false;
>                 while ((noff = fdt_find_match(fdt, noff,
>                                         drv->match_table, &match)) >= 0) {
>                         if (drv->cold_init) {
> @@ -53,10 +71,15 @@ static int fdt_irqchip_cold_init(void)
>                                 if (rc)
>                                         return rc;
>                         }
> -                       current_driver = drv;
> +
> +                       if (drv_added)
> +                               continue;
> +
> +                       current_drivers[current_drivers_count++] = drv;
> +                       drv_added = true;
>                 }
>
> -               if (current_driver)
> +               if (FDT_IRQCHIP_MAX_DRIVERS <= current_drivers_count)
>                         break;
>         }
>
> --
> 2.25.1
>

Otherwise,

Reviewed-by: Atish Patra <atishp@rivosinc.com>



-- 
Regards,
Atish

