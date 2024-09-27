From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Sep 2024 10:39:26 +0530
Subject: [PATCH] lib: utils/gpio: designware: Allocate chips on the heap
In-Reply-To: <20240831015550.58588-1-samuel.holland@sifive.com>
References: <20240831015550.58588-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1QfdRbaRT61HFNb2APmN4tUGkTAvxdjYUpWsnAMK5WNw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 31, 2024 at 7:25?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This reduces firmware size for SoCs which do not use this driver.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  lib/utils/gpio/fdt_gpio_designware.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
> index 20701a15..fa2cd1f9 100644
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

We need to free "chip" below wherever it fails.

>
>         chip->dr = (void *)(uintptr_t)addr + (bank * 0xc);
>         chip->ext = (void *)(uintptr_t)addr + (bank * 4) + 0x50;
> @@ -123,7 +119,6 @@ static int dw_gpio_init_bank(const void *fdt, int nodeoff, u32 phandle,
>         if (rc)
>                 return rc;
>
> -       dw_gpio_chip_count++;
>         return 0;
>  }
>
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

