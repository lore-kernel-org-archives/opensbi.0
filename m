From: Samuel Holland <samuel@sholland.org>
Date: Tue, 19 Oct 2021 20:58:37 -0500
Subject: [PATCH 1/2] lib: utils/fdt: Require match data to be const
In-Reply-To: <20211020015838.45399-1-samuel@sholland.org>
References: <20211020015838.45399-1-samuel@sholland.org>
Message-ID: <20211020015838.45399-2-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Match data stores hardware attributes which do not change at runtime, so
it does not need to be mutable. Make it const.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 include/sbi_utils/fdt/fdt_helper.h | 2 +-
 lib/utils/ipi/fdt_ipi_mswi.c       | 2 +-
 lib/utils/reset/fdt_reset_gpio.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 5cb7340..d51c3d3 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -14,7 +14,7 @@
 
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
index 4da1450..b683d88 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -121,7 +121,7 @@ static int gpio_reset_init(void *fdt, int nodeoff,
 }
 
 static const struct fdt_match gpio_poweroff_match[] = {
-	{ .compatible = "gpio-poweroff", .data = (void *)FALSE },
+	{ .compatible = "gpio-poweroff", .data = (const void *)FALSE },
 	{ },
 };
 
@@ -131,7 +131,7 @@ struct fdt_reset fdt_poweroff_gpio = {
 };
 
 static const struct fdt_match gpio_reset_match[] = {
-	{ .compatible = "gpio-restart", .data = (void *)TRUE },
+	{ .compatible = "gpio-restart", .data = (const void *)TRUE },
 	{ },
 };
 
-- 
2.32.0


