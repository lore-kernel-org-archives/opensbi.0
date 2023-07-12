From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Wed, 12 Jul 2023 10:19:38 +0100
Subject: [PATCH v2] lib: utils/gpio: Fix RV32 compile error for designware
 GPIO driver
In-Reply-To: <20230712040340.1640305-1-apatel@ventanamicro.com>
References: <20230712040340.1640305-1-apatel@ventanamicro.com>
Message-ID: <4634a716-9a81-2521-155f-fd0dea5eb333@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/07/2023 05:03, Anup Patel wrote:
> Currently, we see following compile error in the designeware GPIO driver
> for RV32 systems:
> 
> lib/utils/gpio/fdt_gpio_designware.c:115:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>    115 |         chip->dr = (void *)addr + (bank * 0xc);
>        |                    ^
> lib/utils/gpio/fdt_gpio_designware.c:116:21: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>    116 |         chip->ext = (void *)addr + (bank * 4) + 0x50;
> 
> We fix the above error using an explicit type-cast to 'unsigned long'.
> 
> Fixes: 7828eebaaa77 ("gpio/desginware: add Synopsys DesignWare APB GPIO support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> Changes since v1:
>   - Use uintptr_t in-place of ulong data type.
> ---
>   lib/utils/gpio/fdt_gpio_designware.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
> index 6223d7e..018e2d5 100644
> --- a/lib/utils/gpio/fdt_gpio_designware.c
> +++ b/lib/utils/gpio/fdt_gpio_designware.c
> @@ -112,8 +112,8 @@ static int dw_gpio_init_bank(void *fdt, int nodeoff, u32 phandle,
>   
>   	chip = &dw_gpio_chip_array[dw_gpio_chip_count];
>   
> -	chip->dr = (void *)addr + (bank * 0xc);
> -	chip->ext = (void *)addr + (bank * 4) + 0x50;
> +	chip->dr = (void *)(uintptr_t)addr + (bank * 0xc);
> +	chip->ext = (void *)(uintptr_t)addr + (bank * 4) + 0x50;

would a macro to do this, maybe called fdt_addr_to_ptr(addr) ?

>   	chip->chip.driver = &fdt_gpio_designware;
>   	chip->chip.id = phandle;
>   	chip->chip.ngpio = nr_pins;

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


