From: Anup Patel <anup@brainfault.org>
Date: Wed, 12 Jul 2023 11:24:12 +0530
Subject: [PATCH v2] lib: utils/gpio: Fix RV32 compile error for designware
 GPIO driver
In-Reply-To: <20230712040340.1640305-1-apatel@ventanamicro.com>
References: <20230712040340.1640305-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy32HLbrAuDy-j_uY5TpXMQrwhjv0suRH5xuJrapFY01Mg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 9:33?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, we see following compile error in the designeware GPIO driver
> for RV32 systems:
>
> lib/utils/gpio/fdt_gpio_designware.c:115:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   115 |         chip->dr = (void *)addr + (bank * 0xc);
>       |                    ^
> lib/utils/gpio/fdt_gpio_designware.c:116:21: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   116 |         chip->ext = (void *)addr + (bank * 4) + 0x50;
>
> We fix the above error using an explicit type-cast to 'unsigned long'.
>
> Fixes: 7828eebaaa77 ("gpio/desginware: add Synopsys DesignWare APB GPIO support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
> Changes since v1:
>  - Use uintptr_t in-place of ulong data type.
> ---
>  lib/utils/gpio/fdt_gpio_designware.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
> index 6223d7e..018e2d5 100644
> --- a/lib/utils/gpio/fdt_gpio_designware.c
> +++ b/lib/utils/gpio/fdt_gpio_designware.c
> @@ -112,8 +112,8 @@ static int dw_gpio_init_bank(void *fdt, int nodeoff, u32 phandle,
>
>         chip = &dw_gpio_chip_array[dw_gpio_chip_count];
>
> -       chip->dr = (void *)addr + (bank * 0xc);
> -       chip->ext = (void *)addr + (bank * 4) + 0x50;
> +       chip->dr = (void *)(uintptr_t)addr + (bank * 0xc);
> +       chip->ext = (void *)(uintptr_t)addr + (bank * 4) + 0x50;
>         chip->chip.driver = &fdt_gpio_designware;
>         chip->chip.id = phandle;
>         chip->chip.ngpio = nr_pins;
> --
> 2.34.1
>

