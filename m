From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Oct 2024 17:58:22 +0530
Subject: [PATCH v2] lib: utils/gpio: designware: Allocate chips on the heap
In-Reply-To: <20241025183624.1358982-1-samuel.holland@sifive.com>
References: <20241025183624.1358982-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1g0afKGEbYgCQKDqoAkkuCCX_Jj_brd1hvuy2GyU7jcQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 26, 2024 at 12:43?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This reduces firmware size for SoCs which do not use this driver.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
> Changes in v2:
>  - Free the allocated chip if gpio_chip_add() fails.
>
>  lib/utils/gpio/fdt_gpio_designware.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
> index 20701a15..b5baf1c1 100644
> --- a/lib/utils/gpio/fdt_gpio_designware.c
> +++ b/lib/utils/gpio/fdt_gpio_designware.c
> @@ -13,11 +13,11 @@
>
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_error.h>
> +#include <sbi/sbi_heap.h>
>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/gpio/fdt_gpio.h>
>
> -#define DW_GPIO_CHIP_MAX       4       /* need 1 per bank in use */
>  #define DW_GPIO_PINS_MAX       32
>
>  #define DW_GPIO_DDR    0x4
> @@ -32,9 +32,6 @@ struct dw_gpio_chip {
>
>  extern struct fdt_gpio fdt_gpio_designware;
>
> -static unsigned int dw_gpio_chip_count;
> -static struct dw_gpio_chip dw_gpio_chip_array[DW_GPIO_CHIP_MAX];
> -
>  #define pin_to_chip(__p) container_of((__p)->chip, struct dw_gpio_chip, chip);
>
>  static int dw_gpio_direction_output(struct gpio_pin *gp, int value)
> @@ -86,9 +83,6 @@ static int dw_gpio_init_bank(const void *fdt, int nodeoff, u32 phandle,
>         uint64_t addr;
>         int rc, poff, nr_pins, bank, len;
>
> -       if (dw_gpio_chip_count >= DW_GPIO_CHIP_MAX)
> -               return SBI_ENOSPC;
> -
>         /* need to get parent for the address property  */
>         poff = fdt_parent_offset(fdt, nodeoff);
>         if (poff < 0)
> @@ -110,7 +104,9 @@ static int dw_gpio_init_bank(const void *fdt, int nodeoff, u32 phandle,
>                 return SBI_EINVAL;
>         nr_pins = fdt32_to_cpu(*val);
>
> -       chip = &dw_gpio_chip_array[dw_gpio_chip_count];
> +       chip = sbi_zalloc(sizeof(*chip));
> +       if (!chip)
> +               return SBI_ENOMEM;
>
>         chip->dr = (void *)(uintptr_t)addr + (bank * 0xc);
>         chip->ext = (void *)(uintptr_t)addr + (bank * 4) + 0x50;
> @@ -121,10 +117,13 @@ static int dw_gpio_init_bank(const void *fdt, int nodeoff, u32 phandle,
>         chip->chip.direction_output = dw_gpio_direction_output;
>         rc = gpio_chip_add(&chip->chip);
>         if (rc)
> -               return rc;
> +               goto err_free_chip;
>
> -       dw_gpio_chip_count++;
>         return 0;
> +
> +err_free_chip:
> +       sbi_free(chip);
> +       return rc;
>  }
>
>  /* since we're only probed when used, match on port not main controller node */
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

