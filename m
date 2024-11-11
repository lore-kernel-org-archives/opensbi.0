From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Nov 2024 14:02:49 -0800
Subject: [PATCH v2 05/11] lib: utils/gpio: Use fdt_driver for initialization
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <20241111220304.1228821-6-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

FDT gpio drivers have an extra .xlate operation, so they need to embed
the `struct fdt_driver` inside the subsystem-specific type. The gpio
subsystem always initializes the driver for a specific DT node.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 include/sbi_utils/gpio/fdt_gpio.h      |  5 ++---
 include/sbi_utils/gpio/gpio.h          |  2 +-
 lib/utils/gpio/fdt_gpio.c              | 27 ++++----------------------
 lib/utils/gpio/fdt_gpio_designware.c   | 10 ++++++----
 lib/utils/gpio/fdt_gpio_drivers.carray |  4 +++-
 lib/utils/gpio/fdt_gpio_sifive.c       | 10 ++++++----
 lib/utils/gpio/fdt_gpio_starfive.c     | 10 ++++++----
 7 files changed, 28 insertions(+), 40 deletions(-)

diff --git a/include/sbi_utils/gpio/fdt_gpio.h b/include/sbi_utils/gpio/fdt_gpio.h
index ab9304bf..fde667e0 100644
--- a/include/sbi_utils/gpio/fdt_gpio.h
+++ b/include/sbi_utils/gpio/fdt_gpio.h
@@ -10,18 +10,17 @@
 #ifndef __FDT_GPIO_H__
 #define __FDT_GPIO_H__
 
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/gpio/gpio.h>
 
 struct fdt_phandle_args;
 
 /** FDT based GPIO driver */
 struct fdt_gpio {
-	const struct fdt_match *match_table;
+	struct fdt_driver driver;
 	int (*xlate)(struct gpio_chip *chip,
 		     const struct fdt_phandle_args *pargs,
 		     struct gpio_pin *out_pin);
-	int (*init)(const void *fdt, int nodeoff,
-		    const struct fdt_match *match);
 };
 
 /** Get a GPIO pin using "gpios" DT property of client DT node */
diff --git a/include/sbi_utils/gpio/gpio.h b/include/sbi_utils/gpio/gpio.h
index 7a3d8bbe..7027fd19 100644
--- a/include/sbi_utils/gpio/gpio.h
+++ b/include/sbi_utils/gpio/gpio.h
@@ -40,7 +40,7 @@ struct gpio_pin {
 /** Representation of a GPIO chip */
 struct gpio_chip {
 	/** Pointer to GPIO driver owning this GPIO chip */
-	void *driver;
+	const void *driver;
 	/** Uniquie ID of the GPIO chip assigned by the driver */
 	unsigned int id;
 	/** Number of GPIOs supported by the GPIO chip */
diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
index eac2b863..88ba282d 100644
--- a/lib/utils/gpio/fdt_gpio.c
+++ b/lib/utils/gpio/fdt_gpio.c
@@ -13,34 +13,15 @@
 #include <sbi_utils/gpio/fdt_gpio.h>
 
 /* List of FDT gpio drivers generated at compile time */
-extern struct fdt_gpio *const fdt_gpio_drivers[];
+extern const struct fdt_driver *const fdt_gpio_drivers[];
 
 static int fdt_gpio_init(const void *fdt, int nodeoff)
 {
-	int pos, rc;
-	struct fdt_gpio *drv;
-	const struct fdt_match *match;
-
 	/* Check "gpio-controller" property */
-	if (!fdt_getprop(fdt, nodeoff, "gpio-controller", &rc))
+	if (!fdt_getprop(fdt, nodeoff, "gpio-controller", NULL))
 		return SBI_EINVAL;
 
-	/* Try all GPIO drivers one-by-one */
-	for (pos = 0; fdt_gpio_drivers[pos]; pos++) {
-		drv = fdt_gpio_drivers[pos];
-
-		match = fdt_match_node(fdt, nodeoff, drv->match_table);
-		if (match && drv->init) {
-			rc = drv->init(fdt, nodeoff, match);
-			if (rc == SBI_ENODEV)
-				continue;
-			if (rc)
-				return rc;
-			return 0;
-		}
-	}
-
-	return SBI_ENOSYS;
+	return fdt_driver_init_by_offset(fdt, nodeoff, fdt_gpio_drivers);
 }
 
 static int fdt_gpio_chip_find(const void *fdt, int nodeoff,
@@ -71,7 +52,7 @@ int fdt_gpio_pin_get(const void *fdt, int nodeoff, int index,
 		     struct gpio_pin *out_pin)
 {
 	int rc;
-	struct fdt_gpio *drv;
+	const struct fdt_gpio *drv;
 	struct gpio_chip *chip = NULL;
 	struct fdt_phandle_args pargs;
 
diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
index 26e0a7ce..8c19b4f1 100644
--- a/lib/utils/gpio/fdt_gpio_designware.c
+++ b/lib/utils/gpio/fdt_gpio_designware.c
@@ -30,7 +30,7 @@ struct dw_gpio_chip {
 	struct gpio_chip chip;
 };
 
-extern struct fdt_gpio fdt_gpio_designware;
+const struct fdt_gpio fdt_gpio_designware;
 
 #define pin_to_chip(__p) container_of((__p)->chip, struct dw_gpio_chip, chip);
 
@@ -132,8 +132,10 @@ static const struct fdt_match dw_gpio_match[] = {
 	{ },
 };
 
-struct fdt_gpio fdt_gpio_designware = {
-	.match_table = dw_gpio_match,
+const struct fdt_gpio fdt_gpio_designware = {
+	.driver = {
+		.match_table = dw_gpio_match,
+		.init = dw_gpio_init_bank,
+	},
 	.xlate = fdt_gpio_simple_xlate,
-	.init = dw_gpio_init_bank,
 };
diff --git a/lib/utils/gpio/fdt_gpio_drivers.carray b/lib/utils/gpio/fdt_gpio_drivers.carray
index e863f1c5..7807777e 100644
--- a/lib/utils/gpio/fdt_gpio_drivers.carray
+++ b/lib/utils/gpio/fdt_gpio_drivers.carray
@@ -1,3 +1,5 @@
 HEADER: sbi_utils/gpio/fdt_gpio.h
-TYPE: struct fdt_gpio
+TYPE: const struct fdt_gpio
 NAME: fdt_gpio_drivers
+MEMBER-NAME: driver
+MEMBER-TYPE: const struct fdt_driver
diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
index d96bf775..0ebc2a4f 100644
--- a/lib/utils/gpio/fdt_gpio_sifive.c
+++ b/lib/utils/gpio/fdt_gpio_sifive.c
@@ -60,7 +60,7 @@ static void sifive_gpio_set(struct gpio_pin *gp, int value)
 	writel(v, (volatile void *)(chip->addr + SIFIVE_GPIO_OUTVAL));
 }
 
-extern struct fdt_gpio fdt_gpio_sifive;
+const struct fdt_gpio fdt_gpio_sifive;
 
 static int sifive_gpio_init(const void *fdt, int nodeoff,
 			    const struct fdt_match *match)
@@ -99,8 +99,10 @@ static const struct fdt_match sifive_gpio_match[] = {
 	{ },
 };
 
-struct fdt_gpio fdt_gpio_sifive = {
-	.match_table = sifive_gpio_match,
+const struct fdt_gpio fdt_gpio_sifive = {
+	.driver = {
+		.match_table = sifive_gpio_match,
+		.init = sifive_gpio_init,
+	},
 	.xlate = fdt_gpio_simple_xlate,
-	.init = sifive_gpio_init,
 };
diff --git a/lib/utils/gpio/fdt_gpio_starfive.c b/lib/utils/gpio/fdt_gpio_starfive.c
index 55752425..4d09b65c 100644
--- a/lib/utils/gpio/fdt_gpio_starfive.c
+++ b/lib/utils/gpio/fdt_gpio_starfive.c
@@ -69,7 +69,7 @@ static void starfive_gpio_set(struct gpio_pin *gp, int value)
 	writel(val, (void *)(reg_addr + STARFIVE_GPIO_OUTVAL));
 }
 
-extern struct fdt_gpio fdt_gpio_starfive;
+const struct fdt_gpio fdt_gpio_starfive;
 
 static int starfive_gpio_init(const void *fdt, int nodeoff,
 			      const struct fdt_match *match)
@@ -109,8 +109,10 @@ static const struct fdt_match starfive_gpio_match[] = {
 	{ },
 };
 
-struct fdt_gpio fdt_gpio_starfive = {
-	.match_table = starfive_gpio_match,
+const struct fdt_gpio fdt_gpio_starfive = {
+	.driver = {
+		.match_table = starfive_gpio_match,
+		.init = starfive_gpio_init,
+	},
 	.xlate = fdt_gpio_simple_xlate,
-	.init = starfive_gpio_init,
 };
-- 
2.45.1


