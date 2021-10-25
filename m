From: Xiang W <wxjstz@126.com>
Date: Mon, 25 Oct 2021 15:04:10 +0800
Subject: [PATCH V2 2/2] lib: utils:/gpio: Move the invert logic of ACTIVE_LOW
 to gpio
In-Reply-To: <20211025070410.1228846-1-wxjstz@126.com>
References: <20211025070410.1228846-1-wxjstz@126.com>
Message-ID: <20211025070410.1228846-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to reduce the repetitive code of the driver, move the invert
logic of ACTIVE_LOW to gpio

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/gpio/gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/utils/gpio/gpio.c b/lib/utils/gpio/gpio.c
index fb30c0f..e7d1bed 100644
--- a/lib/utils/gpio/gpio.c
+++ b/lib/utils/gpio/gpio.c
@@ -91,17 +91,20 @@ int gpio_direction_output(struct gpio_pin *gp, int value)
 	if (!gp->chip->direction_output)
 		return SBI_ENOSYS;
 
+	value = (gp->flags & GPIO_FLAG_ACTIVE_LOW) ? !value : value;
 	return gp->chip->direction_output(gp, value);
 }
 
 int gpio_get(struct gpio_pin *gp)
 {
+	int value;
 	if (!gp || !gp->chip || (gp->chip->ngpio <= gp->offset))
 		return SBI_EINVAL;
 	if (!gp->chip->get)
 		return SBI_ENOSYS;
 
-	return gp->chip->get(gp);
+	value = gp->chip->get(gp);
+	return (gp->flags & GPIO_FLAG_ACTIVE_LOW) ? !value : value;
 }
 
 int gpio_set(struct gpio_pin *gp, int value)
@@ -111,6 +114,7 @@ int gpio_set(struct gpio_pin *gp, int value)
 	if (!gp->chip->set)
 		return SBI_ENOSYS;
 
+	value = (gp->flags & GPIO_FLAG_ACTIVE_LOW) ? !value : value;
 	gp->chip->set(gp, value);
 	return 0;
 }
-- 
2.30.2


