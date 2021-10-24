From: Samuel Holland <samuel@sholland.org>
Date: Sun, 24 Oct 2021 13:42:40 -0500
Subject: [PATCH] lib: utils/reset: Add voltage level for gpio_reset
In-Reply-To: <20211024164642.810274-1-wxjstz@126.com>
References: <20211024164642.810274-1-wxjstz@126.com>
Message-ID: <f9c976ab-d69b-c829-f7a3-f24fa81b487a@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/24/21 11:46 AM, Xiang W wrote:
> The reset voltage may be different under different platforms, so fdt
> should describe the reset level.

FDT already has a way to describe the reset level: the flags cell in
your GPIO specifier. The GPIO controller is responsible for inverting
the levels when GPIO_FLAG_ACTIVE_LOW is present. That way, the inversion
logic does not need to be duplicated in every GPIO consumer driver.

> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/utils/reset/fdt_reset_gpio.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
> index 4da1450..b834522 100644
> --- a/lib/utils/reset/fdt_reset_gpio.c
> +++ b/lib/utils/reset/fdt_reset_gpio.c
> @@ -21,16 +21,19 @@
>  
>  struct gpio_reset {
>  	struct gpio_pin pin;
> +	u32 active_level;
>  	u32 active_delay;
>  	u32 inactive_delay;
>  };
>  
>  static struct gpio_reset poweroff = {
> +	.active_level = 1,
>  	.active_delay = 100,
>  	.inactive_delay = 100
>  };
>  
>  static struct gpio_reset restart = {
> +	.active_level = 1,
>  	.active_delay = 100,
>  	.inactive_delay = 100
>  };
> @@ -68,15 +71,15 @@ static void gpio_system_reset(u32 type, u32 reason)
>  
>  	if (reset) {
>  		/* drive it active, also inactive->active edge */
> -		gpio_direction_output(&reset->pin, 1);
> +		gpio_direction_output(&reset->pin, reset->active_level);

"1" as an argument to gpio_direction_output/gpio_set always means the
active level, which could be high or low, depending on if reset->pin has
the GPIO_FLAG_ACTIVE_LOW flag.

>  		sbi_timer_mdelay(reset->active_delay);
>  
>  		/* drive inactive, also active->inactive edge */
> -		gpio_set(&reset->pin, 0);
> +		gpio_set(&reset->pin, !reset->active_level);
>  		sbi_timer_mdelay(reset->inactive_delay);
>  
>  		/* drive it active, also inactive->active edge */
> -		gpio_set(&reset->pin, 1);
> +		gpio_set(&reset->pin, reset->active_level);
>  	}
>  	/* hang !!! */
>  	sbi_hart_hang();
> @@ -107,6 +110,10 @@ static int gpio_reset_init(void *fdt, int nodeoff,
>  			return rc;
>  	}
>  
> +	val = fdt_getprop(fdt, nodeoff, "active-level", &len);
> +	if (len > 0)
> +		reset->active_level = !!fdt32_to_cpu(*val);
> +

Like Jessica said, all device tree properties must be documented in the
binding for that device. And the bindings for the "gpio-poweroff" and
"gpio-restart" compatible strings live in the Linux kernel tree. So if
you want to add a new property, that binding must be updated first.

But here, no new property is needed, because there is already a way to
do what you want within the existing binding.

Regards,
Samuel

>  	val = fdt_getprop(fdt, nodeoff, "active-delay-ms", &len);
>  	if (len > 0)
>  		reset->active_delay = fdt32_to_cpu(*val);
> 


