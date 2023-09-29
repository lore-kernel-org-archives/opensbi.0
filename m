From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 29 Sep 2023 23:53:55 +0200
Subject: [PATCH 1/1] gpio/starfive: redundant readl() call
Message-ID: <20230929215355.18985-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In starfive_gpio_direction_output() readl() is called twice to read the
gpio direction register. The result of the first read is discarded.

Remove the redundant read.

Fixes: 908be1b85c8f ("gpio/starfive: add gpio driver and support gpio reset")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/gpio/fdt_gpio_starfive.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/utils/gpio/fdt_gpio_starfive.c b/lib/utils/gpio/fdt_gpio_starfive.c
index f430b13..bd2a9f2 100644
--- a/lib/utils/gpio/fdt_gpio_starfive.c
+++ b/lib/utils/gpio/fdt_gpio_starfive.c
@@ -37,7 +37,6 @@ static int starfive_gpio_direction_output(struct gpio_pin *gp, int value)
 	reg_addr = chip->addr + gp->offset;
 	reg_addr &= ~(STARFIVE_GPIO_REG_SHIFT_MASK);
 
-	val = readl((void *)(reg_addr));
 	shift_bits = (gp->offset & STARFIVE_GPIO_REG_SHIFT_MASK)
 		<< STARFIVE_GPIO_SHIFT_BITS;
 	bit_mask = STARFIVE_GPIO_MASK << shift_bits;
-- 
2.40.1


