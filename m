From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:45 -0700
Subject: [PATCH 04/16] lib: utils/gpio: Constify FDT pointers in parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-5-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/gpio/fdt_gpio.h    | 4 ++--
 lib/utils/gpio/fdt_gpio.c            | 6 +++---
 lib/utils/gpio/fdt_gpio_designware.c | 2 +-
 lib/utils/gpio/fdt_gpio_sifive.c     | 2 +-
 lib/utils/gpio/fdt_gpio_starfive.c   | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sbi_utils/gpio/fdt_gpio.h b/include/sbi_utils/gpio/fdt_gpio.h
index ccbf2a11..303ef632 100644
--- a/include/sbi_utils/gpio/fdt_gpio.h
+++ b/include/sbi_utils/gpio/fdt_gpio.h
@@ -20,12 +20,12 @@ struct fdt_gpio {
 	int (*xlate)(struct gpio_chip *chip,
 		     const struct fdt_phandle_args *pargs,
 		     struct gpio_pin *out_pin);
-	int (*init)(void *fdt, int nodeoff, u32 phandle,
+	int (*init)(const void *fdt, int nodeoff, u32 phandle,
 		    const struct fdt_match *match);
 };
 
 /** Get a GPIO pin using "gpios" DT property of client DT node */
-int fdt_gpio_pin_get(void *fdt, int nodeoff, int index,
+int fdt_gpio_pin_get(const void *fdt, int nodeoff, int index,
 		     struct gpio_pin *out_pin);
 
 /** Simple xlate function to convert two GPIO FDT cells into GPIO pin */
diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
index 7258128d..d8d847f1 100644
--- a/lib/utils/gpio/fdt_gpio.c
+++ b/lib/utils/gpio/fdt_gpio.c
@@ -31,7 +31,7 @@ static struct fdt_gpio *fdt_gpio_driver(struct gpio_chip *chip)
 	return NULL;
 }
 
-static int fdt_gpio_init(void *fdt, u32 phandle)
+static int fdt_gpio_init(const void *fdt, u32 phandle)
 {
 	int pos, nodeoff, rc;
 	struct fdt_gpio *drv;
@@ -64,7 +64,7 @@ static int fdt_gpio_init(void *fdt, u32 phandle)
 	return SBI_ENOSYS;
 }
 
-static int fdt_gpio_chip_find(void *fdt, u32 phandle,
+static int fdt_gpio_chip_find(const void *fdt, u32 phandle,
 			      struct gpio_chip **out_chip)
 {
 	int rc;
@@ -88,7 +88,7 @@ static int fdt_gpio_chip_find(void *fdt, u32 phandle,
 	return 0;
 }
 
-int fdt_gpio_pin_get(void *fdt, int nodeoff, int index,
+int fdt_gpio_pin_get(const void *fdt, int nodeoff, int index,
 		     struct gpio_pin *out_pin)
 {
 	int rc;
diff --git a/lib/utils/gpio/fdt_gpio_designware.c b/lib/utils/gpio/fdt_gpio_designware.c
index 018e2d54..20701a15 100644
--- a/lib/utils/gpio/fdt_gpio_designware.c
+++ b/lib/utils/gpio/fdt_gpio_designware.c
@@ -78,7 +78,7 @@ static void dw_gpio_set(struct gpio_pin *gp, int value)
  * bank A is the only one with irq support but we're not using it here
 */
 
-static int dw_gpio_init_bank(void *fdt, int nodeoff, u32 phandle,
+static int dw_gpio_init_bank(const void *fdt, int nodeoff, u32 phandle,
 			     const struct fdt_match *match)
 {
 	struct dw_gpio_chip *chip;
diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
index 5e3f39d7..e5dbe2be 100644
--- a/lib/utils/gpio/fdt_gpio_sifive.c
+++ b/lib/utils/gpio/fdt_gpio_sifive.c
@@ -62,7 +62,7 @@ static void sifive_gpio_set(struct gpio_pin *gp, int value)
 
 extern struct fdt_gpio fdt_gpio_sifive;
 
-static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
+static int sifive_gpio_init(const void *fdt, int nodeoff, u32 phandle,
 			    const struct fdt_match *match)
 {
 	int rc;
diff --git a/lib/utils/gpio/fdt_gpio_starfive.c b/lib/utils/gpio/fdt_gpio_starfive.c
index bd2a9f21..d84ff1fe 100644
--- a/lib/utils/gpio/fdt_gpio_starfive.c
+++ b/lib/utils/gpio/fdt_gpio_starfive.c
@@ -71,7 +71,7 @@ static void starfive_gpio_set(struct gpio_pin *gp, int value)
 
 extern struct fdt_gpio fdt_gpio_starfive;
 
-static int starfive_gpio_init(void *fdt, int nodeoff, u32 phandle,
+static int starfive_gpio_init(const void *fdt, int nodeoff, u32 phandle,
 			      const struct fdt_match *match)
 {
 	int rc;
-- 
2.45.1


