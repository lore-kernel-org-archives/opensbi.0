From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 15 Sep 2021 14:51:28 +0530
Subject: [PATCH 5/5] lib: utils/reset: use sbi_timer_mdelay() in gpio reset
 driver
In-Reply-To: <20210915092128.1029868-1-anup.patel@wdc.com>
References: <20210915092128.1029868-1-anup.patel@wdc.com>
Message-ID: <20210915092128.1029868-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should use sbi_timer_mdelay() instead of custom gpio_mdelay() in
the gpio reset driver.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/utils/reset/fdt_reset_gpio.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index 77e308a..30127f5 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_system.h>
+#include <sbi/sbi_timer.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/gpio/fdt_gpio.h>
 #include <sbi_utils/reset/fdt_reset.h>
@@ -34,14 +35,6 @@ static struct gpio_reset restart = {
 	.inactive_delay = 100
 };
 
-/* Custom mdelay function until we have a generic mdelay() API */
-static void gpio_mdelay(unsigned long msecs)
-{
-	volatile int i;
-	while (msecs--)
-		for (i = 0; i < 100000; i++) ;
-}
-
 static int gpio_system_reset_check(u32 type, u32 reason)
 {
 	switch (type) {
@@ -76,11 +69,11 @@ static void gpio_system_reset(u32 type, u32 reason)
 
 		/* drive it active, also inactive->active edge */
 		gpio_direction_output(&reset->pin, 1);
-		gpio_mdelay(reset->active_delay);
+		sbi_timer_mdelay(reset->active_delay);
 
 		/* drive inactive, also active->inactive edge */
 		gpio_set(&reset->pin, 0);
-		gpio_mdelay(reset->inactive_delay);
+		sbi_timer_mdelay(reset->inactive_delay);
 
 		/* drive it active, also inactive->active edge */
 		gpio_set(&reset->pin, 1);
-- 
2.25.1


