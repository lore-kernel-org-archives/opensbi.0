From: Xiang W <wxjstz@126.com>
Date: Tue, 11 Jul 2023 22:49:13 +0800
Subject: [PATCH] lib: utils/gpio: Fix RV32 compile error for designware
 GPIO driver
In-Reply-To: <20230711124519.1591123-1-apatel@ventanamicro.com>
References: <20230711124519.1591123-1-apatel@ventanamicro.com>
Message-ID: <cd6775519593fda08c423e4c4c9e1d3b2aabb2ae.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-07-11???? 18:15 +0530?Anup Patel???
> Currently, we see following compile error in the designeware GPIO driver
> for RV32 systems:
> 
> lib/utils/gpio/fdt_gpio_designware.c:115:20: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> ? 115 |???????? chip->dr = (void *)addr + (bank * 0xc);
> ????? |??????????????????? ^
> lib/utils/gpio/fdt_gpio_designware.c:116:21: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> ? 116 |???????? chip->ext = (void *)addr + (bank * 4) + 0x50;
> 
> We fix the above error using an explicit type-cast to 'unsigned long'.
> 
> Fixes: 7828eebaaa77 ("gpio/desginware: add Synopsys DesignWare APB GPIO support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> ?lib/utils/gpio/fdt_gpio_designware.c | 4 ++--
> ?1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
> index 6223d7e..603e5a0 100644
> --- a/lib/utils/gpio/fdt_gpio_designware.c
> +++ b/lib/utils/gpio/fdt_gpio_designware.c
> @@ -112,8 +112,8 @@ static int dw_gpio_init_bank(void *fdt, int nodeoff, u32 phandle,
> ?
> ????????chip = &dw_gpio_chip_array[dw_gpio_chip_count];
> ?
> -???????chip->dr = (void *)addr + (bank * 0xc);
> -???????chip->ext = (void *)addr + (bank * 4) + 0x50;
> +???????chip->dr = (void *)(ulong)addr + (bank * 0xc);
> +???????chip->ext = (void *)(ulong)addr + (bank * 4) + 0x50;
Replacing ulong with uintptr_t would be better.

Otherwise it looks good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ????????chip->chip.driver = &fdt_gpio_designware;
> ????????chip->chip.id = phandle;
> ????????chip->chip.ngpio = nr_pins;
> -- 
> 2.34.1
> 
> 


