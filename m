From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 28 Sep 2021 13:42:46 +0200
Subject: [PATCH 1/1] lib: utils: identify supported GPIO reset methods
Message-ID: <20210928114246.46596-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The GPIO reset driver supports reset and poweroff. But not all boards
support both. gpio_system_reset_check() must detect this situation.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/reset/fdt_reset_gpio.c | 44 +++++++++++++++-----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index 30127f5..77e4d0e 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -35,21 +35,9 @@ static struct gpio_reset restart = {
 	.inactive_delay = 100
 };
 
-static int gpio_system_reset_check(u32 type, u32 reason)
-{
-	switch (type) {
-	case SBI_SRST_RESET_TYPE_SHUTDOWN:
-	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
-	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
-		return 1;
-	}
-
-	return 0;
-}
-
-static void gpio_system_reset(u32 type, u32 reason)
+static struct gpio_reset *gpio_get_reset_settings(u32 type)
 {
-	struct gpio_reset *reset = NULL;
+	struct gpio_reset *reset;
 
 	switch (type) {
 	case SBI_SRST_RESET_TYPE_SHUTDOWN:
@@ -59,14 +47,26 @@ static void gpio_system_reset(u32 type, u32 reason)
 	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
 		reset = &restart;
 		break;
+	default:
+		reset = NULL;
 	}
 
-	if (reset) {
-		if (!reset->pin.chip) {
-			sbi_printf("%s: gpio pin not available\n", __func__);
-			goto skip_reset;
-		}
+	if (reset && !reset->pin.chip)
+		reset = NULL;
+
+	return reset;
+}
+
+static int gpio_system_reset_check(u32 type, u32 reason)
+{
+	return !!gpio_get_reset_settings(type);
+}
+
+static void gpio_system_reset(u32 type, u32 reason)
+{
+	struct gpio_reset *reset = gpio_get_reset_settings(type);
 
+	if (reset) {
 		/* drive it active, also inactive->active edge */
 		gpio_direction_output(&reset->pin, 1);
 		sbi_timer_mdelay(reset->active_delay);
@@ -77,11 +77,9 @@ static void gpio_system_reset(u32 type, u32 reason)
 
 		/* drive it active, also inactive->active edge */
 		gpio_set(&reset->pin, 1);
-
-skip_reset:
-		/* hang !!! */
-		sbi_hart_hang();
 	}
+	/* hang !!! */
+	sbi_hart_hang();
 }
 
 static struct sbi_system_reset_device gpio_reset = {
-- 
2.32.0


