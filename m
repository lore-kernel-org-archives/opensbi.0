From: Xiang W <wxjstz@126.com>
Date: Tue, 26 Oct 2021 11:43:08 +0800
Subject: [PATCH] lib: utils:/gpio: Improve the sifive gpio driver
In-Reply-To: <CAJivOr6nxhb+_dKuX5QNa2SYf0T1Q-bstj4ms1eKOyQAvXz4Wg@mail.gmail.com>
References: <20211025031249.1072726-1-wxjstz@126.com>
 <CAAhSdy1E2wrXVW+OAZLUvb7MBsD=wkxGTdrZKt7F+ORUFKEy4g@mail.gmail.com>
 <CAAhSdy2B_rPQN0aVH_2hzC2cavJfy7QGVvdtpOrdzkvaPGtz5g@mail.gmail.com>
 <CAJivOr6nxhb+_dKuX5QNa2SYf0T1Q-bstj4ms1eKOyQAvXz4Wg@mail.gmail.com>
Message-ID: <dcd75d2fb10803a3f8e82f005bc1cccb8e8cb6f4.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-10-26???? 10:33 +0800?Green Wan???
> + Andy (he is reviewing the patch and verifying the patch afterward)
> 
> Sorry for replying late. I just found the email was blocked and never
> being sent yesterday.
> 
> Hi Xiang,
> 
> Could you share how you verify the patch? QEMU?
The changes I made through the datasheet without tested.

Regards,
Xiang W
> 
> Hi Anup,
> 
> I checked the v2 patch below. It looks good to me.
> http://lists.infradead.org/pipermail/opensbi/2021-October/001934.html
> 
> As for the active_low logic, should we put more description to
> include/sbi_utils/gpio/gpio.h? Explicitly define the function set the
> GPIO pin value with/without ACTIVE_LOW status. something like below:
> 
> -??????? * Get current value of GPIO pin
> +??????? * Get current value of GPIO pin. Take its ACTIVE_LOW status
> into account. */
> 
> On Mon, Oct 25, 2021 at 11:49 AM Anup Patel <anup@brainfault.org>
> wrote:
> > 
> > Oops, forgot to CC. Sorry for the noise.
> > 
> > On Mon, Oct 25, 2021 at 9:17 AM Anup Patel <anup@brainfault.org>
> > wrote:
> > > 
> > > +Green Wan? +Vincent Chen
> > > 
> > > On Mon, Oct 25, 2021 at 8:43 AM Xiang W <wxjstz@126.com> wrote:
> > > > 
> > > > 1. Add input support
> > > > 2. Add pull-up support
> > > > 3. Add ACTIVE_LOW support
> > > > 
> > > > Signed-off-by: Xiang W <wxjstz@126.com>
> > > 
> > > @Green/Vincent, it would be great if you can review this patch ?
> > > 
> > > Regards,
> > > Anup
> > > 
> > > > ---
> > > > ?lib/utils/gpio/fdt_gpio_sifive.c | 55
> > > > ++++++++++++++++++++++++++++++++
> > > > ?1 file changed, 55 insertions(+)
> > > > 
> > > > diff --git a/lib/utils/gpio/fdt_gpio_sifive.c
> > > > b/lib/utils/gpio/fdt_gpio_sifive.c
> > > > index 677f0fa..d113195 100644
> > > > --- a/lib/utils/gpio/fdt_gpio_sifive.c
> > > > +++ b/lib/utils/gpio/fdt_gpio_sifive.c
> > > > @@ -18,8 +18,12 @@
> > > > ?#define SIFIVE_GPIO_PINS_MAX?? 32
> > > > ?#define SIFIVE_GPIO_PINS_DEF?? 16
> > > > 
> > > > +#define SIFIVE_GPIO_INPUTVAL?? 0x00
> > > > +#define SIFIVE_GPIO_INPUTEN??? 0x04
> > > > ?#define SIFIVE_GPIO_OUTEN????? 0x8
> > > > ?#define SIFIVE_GPIO_OUTVAL???? 0xc
> > > > +#define SIFIVE_GPIO_PUE??????????????? 0x10
> > > > +#define SIFIVE_GPIO_OUTXOR???? 0x40
> > > > ?#define SIFIVE_GPIO_BIT(b)???? (1U << (b))
> > > > 
> > > > ?struct sifive_gpio_chip {
> > > > @@ -40,6 +44,20 @@ static int
> > > > sifive_gpio_direction_output(struct gpio_pin *gp, int value)
> > > > ??????? v |= SIFIVE_GPIO_BIT(gp->offset);
> > > > ??????? writel(v, (volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_OUTEN));
> > > > 
> > > > +?????? v = readl((volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_OUTXOR));
> > > > +?????? if (gp->flags & GPIO_FLAG_ACTIVE_LOW)
> > > > +?????????????? v |= SIFIVE_GPIO_BIT(gp->offset);
> > > > +?????? else
> > > > +?????????????? v &= ~SIFIVE_GPIO_BIT(gp->offset);
> > > > +?????? writel(v, (volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_OUTXOR));
> > > > +
> > > > +?????? v = readl((volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_PUE));
> > > > +?????? if (gp->flags & GPIO_FLAG_PULL_UP)
> > > > +?????????????? v |= SIFIVE_GPIO_BIT(gp->offset);
> > > > +?????? else
> > > > +?????????????? v &= ~SIFIVE_GPIO_BIT(gp->offset);
> > > > +?????? writel(v, (volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_PUE));
> > > > +
> > > > ??????? v = readl((volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_OUTVAL));
> > > > ??????? if (!value)
> > > > ??????????????? v &= ~SIFIVE_GPIO_BIT(gp->offset);
> > > > @@ -50,6 +68,30 @@ static int
> > > > sifive_gpio_direction_output(struct gpio_pin *gp, int value)
> > > > ??????? return 0;
> > > > ?}
> > > > 
> > > > +static int sifive_gpio_direction_input(struct gpio_pin *gp)
> > > > +{
> > > > +?????? unsigned int v;
> > > > +?????? struct sifive_gpio_chip *chip =
> > > > +?????????????? container_of(gp->chip, struct sifive_gpio_chip,
> > > > chip);
> > > > +
> > > > +?????? v = readl((volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_OUTEN));
> > > > +?????? v &= ~SIFIVE_GPIO_BIT(gp->offset);
> > > > +?????? writel(v, (volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_OUTEN));
> > > > +
> > > > +?????? v = readl((volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_INPUTEN));
> > > > +?????? v |= SIFIVE_GPIO_BIT(gp->offset);
> > > > +?????? writel(v, (volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_INPUTEN));
> > > > +
> > > > +?????? v = readl((volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_PUE));
> > > > +?????? if (gp->flags & GPIO_FLAG_PULL_UP)
> > > > +?????????????? v |= SIFIVE_GPIO_BIT(gp->offset);
> > > > +?????? else
> > > > +?????????????? v &= ~SIFIVE_GPIO_BIT(gp->offset);
> > > > +?????? writel(v, (volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_PUE));
> > > > +
> > > > +?????? return 0;
> > > > +}
> > > > +
> > > > ?static void sifive_gpio_set(struct gpio_pin *gp, int value)
> > > > ?{
> > > > ??????? unsigned int v;
> > > > @@ -64,6 +106,17 @@ static void sifive_gpio_set(struct gpio_pin
> > > > *gp, int value)
> > > > ??????? writel(v, (volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_OUTVAL));
> > > > ?}
> > > > 
> > > > +static int sifive_gpio_get(struct gpio_pin *gp)
> > > > +{
> > > > +?????? unsigned int v, invert;
> > > > +?????? struct sifive_gpio_chip *chip =
> > > > +?????????????? container_of(gp->chip, struct sifive_gpio_chip,
> > > > chip);
> > > > +?????? v = readl((volatile void *)(chip->addr +
> > > > SIFIVE_GPIO_INPUTVAL));
> > > > +?????? v = !!(v & SIFIVE_GPIO_BIT(gp->offset));
> > > > +?????? invert = !!(gp->flags & GPIO_FLAG_ACTIVE_LOW);
> > > > +?????? return v ^ invert;
> > > > +}
> > > > +
> > > > ?extern struct fdt_gpio fdt_gpio_sifive;
> > > > 
> > > > ?static int sifive_gpio_init(void *fdt, int nodeoff, u32
> > > > phandle,
> > > > @@ -86,7 +139,9 @@ static int sifive_gpio_init(void *fdt, int
> > > > nodeoff, u32 phandle,
> > > > ??????? chip->chip.id = phandle;
> > > > ??????? chip->chip.ngpio = SIFIVE_GPIO_PINS_DEF;
> > > > ??????? chip->chip.direction_output =
> > > > sifive_gpio_direction_output;
> > > > +?????? chip->chip.direction_input =
> > > > sifive_gpio_direction_input;
> > > > ??????? chip->chip.set = sifive_gpio_set;
> > > > +?????? chip->chip.get = sifive_gpio_get;
> > > > ??????? rc = gpio_chip_add(&chip->chip);
> > > > ??????? if (rc)
> > > > ??????????????? return rc;
> > > > --
> > > > 2.30.2
> > > > 
> > > > 
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> 



