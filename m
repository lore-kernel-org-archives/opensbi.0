From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 15 Oct 2021 16:19:21 +0300
Subject: [PATCH v2 1/5] lib: utils/reset: add priority to gpio reset
In-Reply-To: <20211015131925.22585-1-nikita.shubin@maquefel.me>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
Message-ID: <20211015131925.22585-2-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

Make gpio_system_reset_check return priority instead of just true/false.

Make default 128 priority for reset/shutdown and ability to specify
priority in device tree.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 lib/utils/reset/fdt_reset_gpio.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index 4da1450..44b67d8 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -23,16 +23,19 @@ struct gpio_reset {
 	struct gpio_pin pin;
 	u32 active_delay;
 	u32 inactive_delay;
+	u8 priority;
 };
 
 static struct gpio_reset poweroff = {
 	.active_delay = 100,
-	.inactive_delay = 100
+	.inactive_delay = 100,
+	.priority = 128
 };
 
 static struct gpio_reset restart = {
 	.active_delay = 100,
-	.inactive_delay = 100
+	.inactive_delay = 100,
+	.priority = 128
 };
 
 static struct gpio_reset *gpio_get_reset_settings(u32 type)
@@ -59,7 +62,12 @@ static struct gpio_reset *gpio_get_reset_settings(u32 type)
 
 static int gpio_system_reset_check(u32 type, u32 reason)
 {
-	return !!gpio_get_reset_settings(type);
+	struct gpio_reset *reset = gpio_get_reset_settings(type);
+
+	if (reset)
+		return reset->priority;
+
+	return 0;
 }
 
 static void gpio_system_reset(u32 type, u32 reason)
@@ -115,6 +123,10 @@ static int gpio_reset_init(void *fdt, int nodeoff,
 	if (len > 0)
 		reset->inactive_delay = fdt32_to_cpu(*val);
 
+	val = fdt_getprop(fdt, nodeoff, "priority", &len);
+	if (len > 0)
+		reset->priority = fdt32_to_cpu(*val);
+
 	sbi_system_reset_add_device(&gpio_reset);
 
 	return 0;
-- 
2.31.1


