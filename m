From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 25 Oct 2021 04:47:37 +0100
Subject: [PATCH] lib: utils:/gpio: Improve the sifive gpio driver
In-Reply-To: <20211025031249.1072726-1-wxjstz@126.com>
References: <20211025031249.1072726-1-wxjstz@126.com>
Message-ID: <A88CAB8F-D17E-482C-AF8A-F2743BAFF9D3@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25 Oct 2021, at 04:12, Xiang W <wxjstz@126.com> wrote:
> 
> 1. Add input support
> 2. Add pull-up support
> 3. Add ACTIVE_LOW support
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> lib/utils/gpio/fdt_gpio_sifive.c | 55 ++++++++++++++++++++++++++++++++
> 1 file changed, 55 insertions(+)
> 
> diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
> index 677f0fa..d113195 100644
> --- a/lib/utils/gpio/fdt_gpio_sifive.c
> +++ b/lib/utils/gpio/fdt_gpio_sifive.c
> @@ -18,8 +18,12 @@
> #define SIFIVE_GPIO_PINS_MAX	32
> #define SIFIVE_GPIO_PINS_DEF	16
> 
> +#define SIFIVE_GPIO_INPUTVAL	0x00
> +#define SIFIVE_GPIO_INPUTEN	0x04

For consistency with OUT* these should be IN*.

> #define SIFIVE_GPIO_OUTEN	0x8
> #define SIFIVE_GPIO_OUTVAL	0xc
> +#define SIFIVE_GPIO_PUE		0x10

Even Linux doesn?t bother with this.

> +#define SIFIVE_GPIO_OUTXOR	0x40
> #define SIFIVE_GPIO_BIT(b)	(1U << (b))
> 
> struct sifive_gpio_chip {
> @@ -40,6 +44,20 @@ static int sifive_gpio_direction_output(struct gpio_pin *gp, int value)
> 	v |= SIFIVE_GPIO_BIT(gp->offset);
> 	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
> 
> +	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_OUTXOR));
> +	if (gp->flags & GPIO_FLAG_ACTIVE_LOW)
> +		v |= SIFIVE_GPIO_BIT(gp->offset);
> +	else
> +		v &= ~SIFIVE_GPIO_BIT(gp->offset);
> +	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTXOR));
> +
> +	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_PUE));
> +	if (gp->flags & GPIO_FLAG_PULL_UP)
> +		v |= SIFIVE_GPIO_BIT(gp->offset);
> +	else
> +		v &= ~SIFIVE_GPIO_BIT(gp->offset);

Pull-up on an output sounds strange, that?d tie it to 1, no? Unless you
have open-drain-like things, but that?s not the case here.

> +	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_PUE));
> +
> 	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_OUTVAL));
> 	if (!value)
> 		v &= ~SIFIVE_GPIO_BIT(gp->offset);
> @@ -50,6 +68,30 @@ static int sifive_gpio_direction_output(struct gpio_pin *gp, int value)
> 	return 0;
> }
> 
> +static int sifive_gpio_direction_input(struct gpio_pin *gp)
> +{
> +	unsigned int v;
> +	struct sifive_gpio_chip *chip =
> +		container_of(gp->chip, struct sifive_gpio_chip, chip);
> +
> +	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
> +	v &= ~SIFIVE_GPIO_BIT(gp->offset);
> +	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
> +
> +	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_INPUTEN));
> +	v |= SIFIVE_GPIO_BIT(gp->offset);
> +	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_INPUTEN));
> +
> +	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_PUE));
> +	if (gp->flags & GPIO_FLAG_PULL_UP)
> +		v |= SIFIVE_GPIO_BIT(gp->offset);
> +	else
> +		v &= ~SIFIVE_GPIO_BIT(gp->offset);
> +	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_PUE));
> +
> +	return 0;
> +}
> +
> static void sifive_gpio_set(struct gpio_pin *gp, int value)
> {
> 	unsigned int v;
> @@ -64,6 +106,17 @@ static void sifive_gpio_set(struct gpio_pin *gp, int value)
> 	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTVAL));
> }
> 
> +static int sifive_gpio_get(struct gpio_pin *gp)
> +{
> +	unsigned int v, invert;
> +	struct sifive_gpio_chip *chip =
> +		container_of(gp->chip, struct sifive_gpio_chip, chip);
> +	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_INPUTVAL));
> +	v = !!(v & SIFIVE_GPIO_BIT(gp->offset));
> +	invert = !!(gp->flags & GPIO_FLAG_ACTIVE_LOW);

Can we not just use a normal != 0? !! always looks silly and confusing.

> +	return v ^ invert;

In Linux the inversion is done in generic code rather than repeating in
every driver. This means you avoid a bunch of copy-pasting, but comes
with the downside that you can?t take advantage of configurable
hardware polarity. A conscious choice should be made about which route
OpenSBI should go down, but I would personally favour the simplicity of
doing it in generic code (shaving a couple of instructions off a GPIO
read hardly matters).

Jess

> +}
> +
> extern struct fdt_gpio fdt_gpio_sifive;
> 
> static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
> @@ -86,7 +139,9 @@ static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
> 	chip->chip.id = phandle;
> 	chip->chip.ngpio = SIFIVE_GPIO_PINS_DEF;
> 	chip->chip.direction_output = sifive_gpio_direction_output;
> +	chip->chip.direction_input = sifive_gpio_direction_input;
> 	chip->chip.set = sifive_gpio_set;
> +	chip->chip.get = sifive_gpio_get;
> 	rc = gpio_chip_add(&chip->chip);
> 	if (rc)
> 		return rc;
> -- 
> 2.30.2
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


