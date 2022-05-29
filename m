From: Samuel Holland <samuel@sholland.org>
Date: Sun, 29 May 2022 13:32:11 -0500
Subject: [PATCH v2] lib: utils/fdt: Require match data to be const
Message-ID: <20220529183211.34539-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Match data stores hardware attributes which do not change at runtime, so
it does not need to be mutable. Make it const.

Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Xiang W <wxjstz@126.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Send separately from D1 CLINT patch
 - Add Reviewed-by tags

 include/sbi_utils/fdt/fdt_helper.h | 2 +-
 lib/utils/ipi/fdt_ipi_mswi.c       | 2 +-
 lib/utils/reset/fdt_reset_gpio.c   | 4 ++--
 lib/utils/timer/fdt_timer_mtimer.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 74ea234..c60af35 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -15,7 +15,7 @@
 
 struct fdt_match {
 	const char *compatible;
-	void *data;
+	const void *data;
 };
 
 #define FDT_MAX_PHANDLE_ARGS 16
diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index 1f0fda7..0176941 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -51,7 +51,7 @@ static int ipi_mswi_cold_init(void *fdt, int nodeoff,
 	return 0;
 }
 
-static unsigned long clint_offset = CLINT_MSWI_OFFSET;
+static const unsigned long clint_offset = CLINT_MSWI_OFFSET;
 
 static const struct fdt_match ipi_mswi_match[] = {
 	{ .compatible = "riscv,clint0", .data = &clint_offset },
diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index d28b6f5..bd2c622 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -149,7 +149,7 @@ static int gpio_reset_init(void *fdt, int nodeoff,
 }
 
 static const struct fdt_match gpio_poweroff_match[] = {
-	{ .compatible = "gpio-poweroff", .data = (void *)FALSE },
+	{ .compatible = "gpio-poweroff", .data = (const void *)FALSE },
 	{ },
 };
 
@@ -159,7 +159,7 @@ struct fdt_reset fdt_poweroff_gpio = {
 };
 
 static const struct fdt_match gpio_reset_match[] = {
-	{ .compatible = "gpio-restart", .data = (void *)TRUE },
+	{ .compatible = "gpio-restart", .data = (const void *)TRUE },
 	{ },
 };
 
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 1ad8508..82239d5 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -107,7 +107,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
 	return 0;
 }
 
-static unsigned long clint_offset = CLINT_MTIMER_OFFSET;
+static const unsigned long clint_offset = CLINT_MTIMER_OFFSET;
 
 static const struct fdt_match timer_mtimer_match[] = {
 	{ .compatible = "riscv,clint0", .data = &clint_offset },
-- 
2.35.1


