From: Xiang W <wxjstz@126.com>
Date: Mon, 25 Oct 2021 15:04:09 +0800
Subject: [PATCH V2 1/2] lib: utils:/gpio: Improve the sifive gpio driver
In-Reply-To: <20211025070410.1228846-1-wxjstz@126.com>
References: <20211025070410.1228846-1-wxjstz@126.com>
Message-ID: <20211025070410.1228846-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

1. Add input support
2. Add pull-up support

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/gpio/fdt_gpio_sifive.c | 63 ++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
index 677f0fa..5744503 100644
--- a/lib/utils/gpio/fdt_gpio_sifive.c
+++ b/lib/utils/gpio/fdt_gpio_sifive.c
@@ -18,8 +18,11 @@
 #define SIFIVE_GPIO_PINS_MAX	32
 #define SIFIVE_GPIO_PINS_DEF	16
 
+#define SIFIVE_GPIO_INVAL	0x00
+#define SIFIVE_GPIO_INEN	0x04
 #define SIFIVE_GPIO_OUTEN	0x8
 #define SIFIVE_GPIO_OUTVAL	0xc
+#define SIFIVE_GPIO_PUE		0x10
 #define SIFIVE_GPIO_BIT(b)	(1U << (b))
 
 struct sifive_gpio_chip {
@@ -30,6 +33,23 @@ struct sifive_gpio_chip {
 static unsigned int sifive_gpio_chip_count;
 static struct sifive_gpio_chip sifive_gpio_chip_array[SIFIVE_GPIO_CHIP_MAX];
 
+static int sifive_gpio_get_direction(struct gpio_pin *gp)
+{
+	unsigned int v;
+	struct sifive_gpio_chip *chip =
+		container_of(gp->chip, struct sifive_gpio_chip, chip);
+
+	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
+	if (v & SIFIVE_GPIO_BIT(gp->offset))
+		return 0;
+
+	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_INEN));
+	if (v & SIFIVE_GPIO_BIT(gp->offset))
+		return 1;
+
+	return -1;
+}
+
 static int sifive_gpio_direction_output(struct gpio_pin *gp, int value)
 {
 	unsigned int v;
@@ -40,6 +60,13 @@ static int sifive_gpio_direction_output(struct gpio_pin *gp, int value)
 	v |= SIFIVE_GPIO_BIT(gp->offset);
 	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
 
+	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_PUE));
+	if (gp->flags & GPIO_FLAG_PULL_UP)
+		v |= SIFIVE_GPIO_BIT(gp->offset);
+	else
+		v &= ~SIFIVE_GPIO_BIT(gp->offset);
+	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_PUE));
+
 	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_OUTVAL));
 	if (!value)
 		v &= ~SIFIVE_GPIO_BIT(gp->offset);
@@ -50,6 +77,30 @@ static int sifive_gpio_direction_output(struct gpio_pin *gp, int value)
 	return 0;
 }
 
+static int sifive_gpio_direction_input(struct gpio_pin *gp)
+{
+	unsigned int v;
+	struct sifive_gpio_chip *chip =
+		container_of(gp->chip, struct sifive_gpio_chip, chip);
+
+	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
+	v &= ~SIFIVE_GPIO_BIT(gp->offset);
+	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTEN));
+
+	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_INEN));
+	v |= SIFIVE_GPIO_BIT(gp->offset);
+	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_INEN));
+
+	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_PUE));
+	if (gp->flags & GPIO_FLAG_PULL_UP)
+		v |= SIFIVE_GPIO_BIT(gp->offset);
+	else
+		v &= ~SIFIVE_GPIO_BIT(gp->offset);
+	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_PUE));
+
+	return 0;
+}
+
 static void sifive_gpio_set(struct gpio_pin *gp, int value)
 {
 	unsigned int v;
@@ -64,6 +115,15 @@ static void sifive_gpio_set(struct gpio_pin *gp, int value)
 	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTVAL));
 }
 
+static int sifive_gpio_get(struct gpio_pin *gp)
+{
+	unsigned int v;
+	struct sifive_gpio_chip *chip =
+		container_of(gp->chip, struct sifive_gpio_chip, chip);
+	v = readl((volatile void *)(chip->addr + SIFIVE_GPIO_INVAL));
+	return (v & SIFIVE_GPIO_BIT(gp->offset)) != 0;
+}
+
 extern struct fdt_gpio fdt_gpio_sifive;
 
 static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
@@ -85,8 +145,11 @@ static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
 	chip->chip.driver = &fdt_gpio_sifive;
 	chip->chip.id = phandle;
 	chip->chip.ngpio = SIFIVE_GPIO_PINS_DEF;
+	chip->chip.get_direction = sifive_gpio_get_direction;
 	chip->chip.direction_output = sifive_gpio_direction_output;
+	chip->chip.direction_input = sifive_gpio_direction_input;
 	chip->chip.set = sifive_gpio_set;
+	chip->chip.get = sifive_gpio_get;
 	rc = gpio_chip_add(&chip->chip);
 	if (rc)
 		return rc;
-- 
2.30.2


