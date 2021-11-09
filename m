From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue,  9 Nov 2021 15:41:23 +0300
Subject: [PATCH v3 1/6] lib: utils/reset: add priority to gpio reset
In-Reply-To: <20211109124128.19666-1-nikita.shubin@maquefel.me>
References: <20211109124128.19666-1-nikita.shubin@maquefel.me>
Message-ID: <20211109124128.19666-2-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

Make gpio_system_reset_check return priority instead of just true/false.

Make default 128 priority for reset/shutdown.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
v2->v3:
- dropped dts priority
---
 lib/utils/reset/fdt_reset_gpio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index 302035b..d28b6f5 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -77,7 +77,10 @@ static void gpio_reset_exec(struct gpio_reset *reset)
 
 static int gpio_system_poweroff_check(u32 type, u32 reason)
 {
-	return !!gpio_reset_get(FALSE, type);
+	if (gpio_reset_get(FALSE, type))
+		return 128;
+
+	return 0;
 }
 
 static void gpio_system_poweroff(u32 type, u32 reason)
@@ -93,7 +96,10 @@ static struct sbi_system_reset_device gpio_poweroff = {
 
 static int gpio_system_restart_check(u32 type, u32 reason)
 {
-	return !!gpio_reset_get(TRUE, type);
+	if (gpio_reset_get(TRUE, type))
+		return 128;
+
+	return 0;
 }
 
 static void gpio_system_restart(u32 type, u32 reason)
-- 
2.31.1


