From: Xiang W <wxjstz@126.com>
Date: Mon, 11 Nov 2024 10:21:52 +0800
Subject: [PATCH 1/6] lib: utils/gpio: Remove fdt_gpio_driver() function
In-Reply-To: <20241105042240.2994849-2-samuel.holland@sifive.com>
References: <20241105042240.2994849-1-samuel.holland@sifive.com>
	 <20241105042240.2994849-2-samuel.holland@sifive.com>
Message-ID: <3b5ce458af8ce31480eb1045bbd9dd85ee137246.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-11-04?? 20:20 -0800?Samuel Holland???
> This function looks up a chip's driver by matching known drivers against
> chip->driver, but that is equivalent to using chip->driver directly.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

This patch has been merged.
https://github.com/riscv-software-src/opensbi/commit/598cf961d82a12afa3ccbed9645edae2275b76f3

Regards,
Xiang W
> ---
> 
> ?lib/utils/gpio/fdt_gpio.c | 17 +----------------
> ?1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
> index d8d847f1..6422c45f 100644
> --- a/lib/utils/gpio/fdt_gpio.c
> +++ b/lib/utils/gpio/fdt_gpio.c
> @@ -16,21 +16,6 @@
> ?extern struct fdt_gpio *fdt_gpio_drivers[];
> ?extern unsigned long fdt_gpio_drivers_size;
> ?
> -static struct fdt_gpio *fdt_gpio_driver(struct gpio_chip *chip)
> -{
> -	int pos;
> -
> -	if (!chip)
> -		return NULL;
> -
> -	for (pos = 0; pos < fdt_gpio_drivers_size; pos++) {
> -		if (chip->driver == fdt_gpio_drivers[pos])
> -			return fdt_gpio_drivers[pos];
> -	}
> -
> -	return NULL;
> -}
> -
> ?static int fdt_gpio_init(const void *fdt, u32 phandle)
> ?{
> ?	int pos, nodeoff, rc;
> @@ -112,7 +97,7 @@ int fdt_gpio_pin_get(const void *fdt, int nodeoff, int index,
> ?	if (rc)
> ?		return rc;
> ?
> -	drv = fdt_gpio_driver(chip);
> +	drv = chip->driver;
> ?	if (!drv || !drv->xlate)
> ?		return SBI_ENOSYS;
> ?
> -- 
> 2.45.1
> 
> 


