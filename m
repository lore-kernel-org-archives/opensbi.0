From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:50 -0700
Subject: [PATCH 09/16] lib: utils/reset: Constify FDT pointers in parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-10-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/reset/fdt_reset.h          | 6 +++---
 lib/utils/reset/fdt_reset.c                  | 4 ++--
 lib/utils/reset/fdt_reset_atcwdt200.c        | 2 +-
 lib/utils/reset/fdt_reset_gpio.c             | 2 +-
 lib/utils/reset/fdt_reset_htif.c             | 2 +-
 lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c | 2 +-
 lib/utils/reset/fdt_reset_sunxi_wdt.c        | 2 +-
 lib/utils/reset/fdt_reset_syscon.c           | 4 ++--
 platform/generic/sifive/fu740.c              | 2 +-
 platform/generic/starfive/jh7110.c           | 6 +++---
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
index ea8063b8..80179873 100644
--- a/include/sbi_utils/reset/fdt_reset.h
+++ b/include/sbi_utils/reset/fdt_reset.h
@@ -14,7 +14,7 @@
 
 struct fdt_reset {
 	const struct fdt_match *match_table;
-	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*init)(const void *fdt, int nodeoff, const struct fdt_match *match);
 };
 
 #ifdef CONFIG_FDT_RESET
@@ -22,7 +22,7 @@ struct fdt_reset {
 /**
  * fdt_reset_driver_init() - initialize reset driver based on the device-tree
  */
-int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv);
+int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv);
 
 /**
  * fdt_reset_init() - initialize reset drivers based on the device-tree
@@ -33,7 +33,7 @@ void fdt_reset_init(void);
 
 #else
 
-static inline int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
+static inline int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv)
 {
 	return 0;
 }
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index ee4e29a3..960c08d0 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -17,7 +17,7 @@
 extern struct fdt_reset *fdt_reset_drivers[];
 extern unsigned long fdt_reset_drivers_size;
 
-int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
+int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv)
 {
 	int noff, rc, cnt = 0;
 	const struct fdt_match *match;
@@ -45,7 +45,7 @@ int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
 void fdt_reset_init(void)
 {
 	int pos;
-	void *fdt = fdt_get_address();
+	const void *fdt = fdt_get_address();
 
 	for (pos = 0; pos < fdt_reset_drivers_size; pos++)
 		fdt_reset_driver_init(fdt, fdt_reset_drivers[pos]);
diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
index 03d547b9..6ef3b134 100644
--- a/lib/utils/reset/fdt_reset_atcwdt200.c
+++ b/lib/utils/reset/fdt_reset_atcwdt200.c
@@ -80,7 +80,7 @@ static struct sbi_system_reset_device atcwdt200_reset = {
 	.system_reset	    = ae350_system_reset,
 };
 
-static int atcwdt200_reset_init(void *fdt, int nodeoff,
+static int atcwdt200_reset_init(const void *fdt, int nodeoff,
 				const struct fdt_match *match)
 {
 	uint64_t reg_addr;
diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index 6a908dd7..de81e2eb 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -113,7 +113,7 @@ static struct sbi_system_reset_device gpio_restart = {
 	.system_reset = gpio_system_restart
 };
 
-static int gpio_reset_init(void *fdt, int nodeoff,
+static int gpio_reset_init(const void *fdt, int nodeoff,
 			   const struct fdt_match *match)
 {
 	int rc, len;
diff --git a/lib/utils/reset/fdt_reset_htif.c b/lib/utils/reset/fdt_reset_htif.c
index 2cc52dda..7c04c81c 100644
--- a/lib/utils/reset/fdt_reset_htif.c
+++ b/lib/utils/reset/fdt_reset_htif.c
@@ -11,7 +11,7 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/sys/htif.h>
 
-static int htif_reset_init(void *fdt, int nodeoff,
+static int htif_reset_init(const void *fdt, int nodeoff,
 			   const struct fdt_match *match)
 {
 	bool custom = false;
diff --git a/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c b/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
index 51bd74ab..368cd108 100644
--- a/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
+++ b/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
@@ -76,7 +76,7 @@ static int sg2042_mcu_reset_check_board(struct i2c_adapter *adap, uint32_t reg)
 	return 0;
 }
 
-static int sg2042_mcu_reset_init(void *fdt, int nodeoff,
+static int sg2042_mcu_reset_init(const void *fdt, int nodeoff,
 				 const struct fdt_match *match)
 {
 	int ret, i2c_bus;
diff --git a/lib/utils/reset/fdt_reset_sunxi_wdt.c b/lib/utils/reset/fdt_reset_sunxi_wdt.c
index 446d32b4..f4b06d23 100644
--- a/lib/utils/reset/fdt_reset_sunxi_wdt.c
+++ b/lib/utils/reset/fdt_reset_sunxi_wdt.c
@@ -49,7 +49,7 @@ static struct sbi_system_reset_device sunxi_wdt_reset = {
 	.system_reset = sunxi_wdt_system_reset,
 };
 
-static int sunxi_wdt_reset_init(void *fdt, int nodeoff,
+static int sunxi_wdt_reset_init(const void *fdt, int nodeoff,
 				const struct fdt_match *match)
 {
 	uint64_t reg_addr;
diff --git a/lib/utils/reset/fdt_reset_syscon.c b/lib/utils/reset/fdt_reset_syscon.c
index bae9ec58..0dd76acb 100644
--- a/lib/utils/reset/fdt_reset_syscon.c
+++ b/lib/utils/reset/fdt_reset_syscon.c
@@ -96,8 +96,8 @@ static struct sbi_system_reset_device syscon_reboot = {
 	.system_reset = syscon_do_reboot
 };
 
-static int syscon_reset_init(void *fdt, int nodeoff,
-			   const struct fdt_match *match)
+static int syscon_reset_init(const void *fdt, int nodeoff,
+			     const struct fdt_match *match)
 {
 	int rc, len;
 	const fdt32_t *val, *mask;
diff --git a/platform/generic/sifive/fu740.c b/platform/generic/sifive/fu740.c
index fe71ce6a..ce83a050 100644
--- a/platform/generic/sifive/fu740.c
+++ b/platform/generic/sifive/fu740.c
@@ -173,7 +173,7 @@ static struct sbi_system_reset_device da9063_reset_i2c = {
 	.system_reset = da9063_system_reset
 };
 
-static int da9063_reset_init(void *fdt, int nodeoff,
+static int da9063_reset_init(const void *fdt, int nodeoff,
 			     const struct fdt_match *match)
 {
 	int rc, i2c_bus;
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 62dcd256..560fe1d7 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -186,9 +186,9 @@ static struct sbi_system_reset_device pm_reset = {
 	.system_reset = pm_system_reset
 };
 
-static int starfive_jh7110_inst_init(void *fdt);
+static int starfive_jh7110_inst_init(const void *fdt);
 
-static int pm_reset_init(void *fdt, int nodeoff,
+static int pm_reset_init(const void *fdt, int nodeoff,
 			 const struct fdt_match *match)
 {
 	int rc;
@@ -232,7 +232,7 @@ static struct fdt_reset fdt_reset_pmic = {
 	.init = pm_reset_init,
 };
 
-static int starfive_jh7110_inst_init(void *fdt)
+static int starfive_jh7110_inst_init(const void *fdt)
 {
 	int noff, rc = 0;
 	const fdt32_t *val;
-- 
2.45.1


