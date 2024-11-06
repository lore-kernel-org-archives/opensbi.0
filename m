From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Nov 2024 11:29:38 +0530
Subject: [PATCH 2/3] lib: utils/gpio: Use FDT node offset as GPIO chip ID
In-Reply-To: <20240904021006.3653559-3-samuel.holland@sifive.com>
References: <20240904021006.3653559-1-samuel.holland@sifive.com> <20240904021006.3653559-3-samuel.holland@sifive.com>
Message-ID: <CAAhSdy0iaj-cXC5+mRm5-bzxYbednDKN3eBAHd7THGDGfoLA6Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 4, 2024 at 7:40?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Since the FDT is not modified during driver initialization, node offsets
> are just as suitable as phandles for use as identifiers: they are stable
> and unique. With this change, it is no longer necessary to pass the
> phandle to the driver init functions, so these init functions now use
> the same prototype as other kinds of drivers.
>
> This matches what is already done for I2C adapters.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  include/sbi_utils/gpio/fdt_gpio.h    |  2 +-
>  lib/utils/gpio/fdt_gpio.c            | 23 ++++++++---------------
>  lib/utils/gpio/fdt_gpio_designware.c |  4 ++--
>  lib/utils/gpio/fdt_gpio_sifive.c     |  4 ++--
>  lib/utils/gpio/fdt_gpio_starfive.c   |  4 ++--
>  5 files changed, 15 insertions(+), 22 deletions(-)
>
> diff --git a/include/sbi_utils/gpio/fdt_gpio.h b/include/sbi_utils/gpio/fdt_gpio.h
> index 303ef632..ab9304bf 100644
> --- a/include/sbi_utils/gpio/fdt_gpio.h
> +++ b/include/sbi_utils/gpio/fdt_gpio.h
> @@ -20,7 +20,7 @@ struct fdt_gpio {
>         int (*xlate)(struct gpio_chip *chip,
>                      const struct fdt_phandle_args *pargs,
>                      struct gpio_pin *out_pin);
> -       int (*init)(const void *fdt, int nodeoff, u32 phandle,
> +       int (*init)(const void *fdt, int nodeoff,
>                     const struct fdt_match *match);
>  };
>
> diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
> index 6422c45f..953fa13a 100644
> --- a/lib/utils/gpio/fdt_gpio.c
> +++ b/lib/utils/gpio/fdt_gpio.c
> @@ -16,17 +16,12 @@
>  extern struct fdt_gpio *fdt_gpio_drivers[];
>  extern unsigned long fdt_gpio_drivers_size;
>
> -static int fdt_gpio_init(const void *fdt, u32 phandle)
> +static int fdt_gpio_init(const void *fdt, int nodeoff)
>  {
> -       int pos, nodeoff, rc;
> +       int pos, rc;
>         struct fdt_gpio *drv;
>         const struct fdt_match *match;
>
> -       /* Find node offset */
> -       nodeoff = fdt_node_offset_by_phandle(fdt, phandle);
> -       if (nodeoff < 0)
> -               return nodeoff;
> -
>         /* Check "gpio-controller" property */
>         if (!fdt_getprop(fdt, nodeoff, "gpio-controller", &rc))
>                 return SBI_EINVAL;
> @@ -37,7 +32,7 @@ static int fdt_gpio_init(const void *fdt, u32 phandle)
>
>                 match = fdt_match_node(fdt, nodeoff, drv->match_table);
>                 if (match && drv->init) {
> -                       rc = drv->init(fdt, nodeoff, phandle, match);
> +                       rc = drv->init(fdt, nodeoff, match);
>                         if (rc == SBI_ENODEV)
>                                 continue;
>                         if (rc)
> @@ -49,20 +44,20 @@ static int fdt_gpio_init(const void *fdt, u32 phandle)
>         return SBI_ENOSYS;
>  }
>
> -static int fdt_gpio_chip_find(const void *fdt, u32 phandle,
> +static int fdt_gpio_chip_find(const void *fdt, int nodeoff,
>                               struct gpio_chip **out_chip)
>  {
>         int rc;
> -       struct gpio_chip *chip = gpio_chip_find(phandle);
> +       struct gpio_chip *chip = gpio_chip_find(nodeoff);
>
>         if (!chip) {
>                 /* GPIO chip not found so initialize matching driver */
> -               rc = fdt_gpio_init(fdt, phandle);
> +               rc = fdt_gpio_init(fdt, nodeoff);
>                 if (rc)
>                         return rc;
>
>                 /* Try to find GPIO chip again */
> -               chip = gpio_chip_find(phandle);
> +               chip = gpio_chip_find(nodeoff);
>                 if (!chip)
>                         return SBI_ENOSYS;
>         }
> @@ -77,7 +72,6 @@ int fdt_gpio_pin_get(const void *fdt, int nodeoff, int index,
>                      struct gpio_pin *out_pin)
>  {
>         int rc;
> -       u32 phandle;
>         struct fdt_gpio *drv;
>         struct gpio_chip *chip = NULL;
>         struct fdt_phandle_args pargs;
> @@ -92,8 +86,7 @@ int fdt_gpio_pin_get(const void *fdt, int nodeoff, int index,
>         if (rc)
>                 return rc;
>
> -       phandle = fdt_get_phandle(fdt, pargs.node_offset);
> -       rc = fdt_gpio_chip_find(fdt, phandle, &chip);
> +       rc = fdt_gpio_chip_find(fdt, pargs.node_offset, &chip);
>         if (rc)
>                 return rc;
>
> diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
> index 20701a15..36733bb4 100644
> --- a/lib/utils/gpio/fdt_gpio_designware.c
> +++ b/lib/utils/gpio/fdt_gpio_designware.c
> @@ -78,7 +78,7 @@ static void dw_gpio_set(struct gpio_pin *gp, int value)
>   * bank A is the only one with irq support but we're not using it here
>  */
>
> -static int dw_gpio_init_bank(const void *fdt, int nodeoff, u32 phandle,
> +static int dw_gpio_init_bank(const void *fdt, int nodeoff,
>                              const struct fdt_match *match)
>  {
>         struct dw_gpio_chip *chip;
> @@ -115,7 +115,7 @@ static int dw_gpio_init_bank(const void *fdt, int nodeoff, u32 phandle,
>         chip->dr = (void *)(uintptr_t)addr + (bank * 0xc);
>         chip->ext = (void *)(uintptr_t)addr + (bank * 4) + 0x50;
>         chip->chip.driver = &fdt_gpio_designware;
> -       chip->chip.id = phandle;
> +       chip->chip.id = nodeoff;
>         chip->chip.ngpio = nr_pins;
>         chip->chip.set = dw_gpio_set;
>         chip->chip.direction_output = dw_gpio_direction_output;
> diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
> index e5dbe2be..d96bf775 100644
> --- a/lib/utils/gpio/fdt_gpio_sifive.c
> +++ b/lib/utils/gpio/fdt_gpio_sifive.c
> @@ -62,7 +62,7 @@ static void sifive_gpio_set(struct gpio_pin *gp, int value)
>
>  extern struct fdt_gpio fdt_gpio_sifive;
>
> -static int sifive_gpio_init(const void *fdt, int nodeoff, u32 phandle,
> +static int sifive_gpio_init(const void *fdt, int nodeoff,
>                             const struct fdt_match *match)
>  {
>         int rc;
> @@ -81,7 +81,7 @@ static int sifive_gpio_init(const void *fdt, int nodeoff, u32 phandle,
>
>         chip->addr = addr;
>         chip->chip.driver = &fdt_gpio_sifive;
> -       chip->chip.id = phandle;
> +       chip->chip.id = nodeoff;
>         chip->chip.ngpio = SIFIVE_GPIO_PINS_DEF;
>         chip->chip.direction_output = sifive_gpio_direction_output;
>         chip->chip.set = sifive_gpio_set;
> diff --git a/lib/utils/gpio/fdt_gpio_starfive.c b/lib/utils/gpio/fdt_gpio_starfive.c
> index d84ff1fe..55752425 100644
> --- a/lib/utils/gpio/fdt_gpio_starfive.c
> +++ b/lib/utils/gpio/fdt_gpio_starfive.c
> @@ -71,7 +71,7 @@ static void starfive_gpio_set(struct gpio_pin *gp, int value)
>
>  extern struct fdt_gpio fdt_gpio_starfive;
>
> -static int starfive_gpio_init(const void *fdt, int nodeoff, u32 phandle,
> +static int starfive_gpio_init(const void *fdt, int nodeoff,
>                               const struct fdt_match *match)
>  {
>         int rc;
> @@ -90,7 +90,7 @@ static int starfive_gpio_init(const void *fdt, int nodeoff, u32 phandle,
>
>         chip->addr = addr;
>         chip->chip.driver = &fdt_gpio_starfive;
> -       chip->chip.id = phandle;
> +       chip->chip.id = nodeoff;
>         chip->chip.ngpio = STARFIVE_GPIO_PINS_DEF;
>         chip->chip.direction_output = starfive_gpio_direction_output;
>         chip->chip.set = starfive_gpio_set;
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

