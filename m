From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:39 +0530
Subject: [PATCH v2 08/18] lib: utils/gpio: Use heap in SiFive and StartFive GPIO drivers
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's use heap allocation in SiFive and Starfive GPIO drivers
instead of using a fixed size global array.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/utils/gpio/fdt_gpio_sifive.c   | 21 ++++++++++-----------
 lib/utils/gpio/fdt_gpio_starfive.c | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
index 677f0fa..5e3f39d 100644
--- a/lib/utils/gpio/fdt_gpio_sifive.c
+++ b/lib/utils/gpio/fdt_gpio_sifive.c
@@ -9,11 +9,10 @@
 
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/gpio/fdt_gpio.h>
 
-#define SIFIVE_GPIO_CHIP_MAX	2
-
 #define SIFIVE_GPIO_PINS_MIN	1
 #define SIFIVE_GPIO_PINS_MAX	32
 #define SIFIVE_GPIO_PINS_DEF	16
@@ -27,9 +26,6 @@ struct sifive_gpio_chip {
 	struct gpio_chip chip;
 };
 
-static unsigned int sifive_gpio_chip_count;
-static struct sifive_gpio_chip sifive_gpio_chip_array[SIFIVE_GPIO_CHIP_MAX];
-
 static int sifive_gpio_direction_output(struct gpio_pin *gp, int value)
 {
 	unsigned int v;
@@ -73,13 +69,15 @@ static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
 	struct sifive_gpio_chip *chip;
 	uint64_t addr;
 
-	if (SIFIVE_GPIO_CHIP_MAX <= sifive_gpio_chip_count)
-		return SBI_ENOSPC;
-	chip = &sifive_gpio_chip_array[sifive_gpio_chip_count];
+	chip = sbi_zalloc(sizeof(*chip));
+	if (!chip)
+		return SBI_ENOMEM;
 
 	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
-	if (rc)
+	if (rc) {
+		sbi_free(chip);
 		return rc;
+	}
 
 	chip->addr = addr;
 	chip->chip.driver = &fdt_gpio_sifive;
@@ -88,10 +86,11 @@ static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
 	chip->chip.direction_output = sifive_gpio_direction_output;
 	chip->chip.set = sifive_gpio_set;
 	rc = gpio_chip_add(&chip->chip);
-	if (rc)
+	if (rc) {
+		sbi_free(chip);
 		return rc;
+	}
 
-	sifive_gpio_chip_count++;
 	return 0;
 }
 
diff --git a/lib/utils/gpio/fdt_gpio_starfive.c b/lib/utils/gpio/fdt_gpio_starfive.c
index 18cca72..f430b13 100644
--- a/lib/utils/gpio/fdt_gpio_starfive.c
+++ b/lib/utils/gpio/fdt_gpio_starfive.c
@@ -9,11 +9,11 @@
 
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_console.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/gpio/fdt_gpio.h>
 
-#define STARFIVE_GPIO_CHIP_MAX		2
 #define STARFIVE_GPIO_PINS_DEF		64
 #define STARFIVE_GPIO_OUTVAL		0x40
 #define STARFIVE_GPIO_MASK		0xff
@@ -25,9 +25,6 @@ struct starfive_gpio_chip {
 	struct gpio_chip chip;
 };
 
-static unsigned int starfive_gpio_chip_count;
-static struct starfive_gpio_chip starfive_gpio_chip_array[STARFIVE_GPIO_CHIP_MAX];
-
 static int starfive_gpio_direction_output(struct gpio_pin *gp, int value)
 {
 	u32 val;
@@ -82,13 +79,15 @@ static int starfive_gpio_init(void *fdt, int nodeoff, u32 phandle,
 	struct starfive_gpio_chip *chip;
 	u64 addr;
 
-	if (starfive_gpio_chip_count >= STARFIVE_GPIO_CHIP_MAX)
-		return SBI_ENOSPC;
-	chip = &starfive_gpio_chip_array[starfive_gpio_chip_count];
+	chip = sbi_zalloc(sizeof(*chip));
+	if (!chip)
+		return SBI_ENOMEM;
 
 	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
-	if (rc)
+	if (rc) {
+		sbi_free(chip);
 		return rc;
+	}
 
 	chip->addr = addr;
 	chip->chip.driver = &fdt_gpio_starfive;
@@ -97,10 +96,11 @@ static int starfive_gpio_init(void *fdt, int nodeoff, u32 phandle,
 	chip->chip.direction_output = starfive_gpio_direction_output;
 	chip->chip.set = starfive_gpio_set;
 	rc = gpio_chip_add(&chip->chip);
-	if (rc)
+	if (rc) {
+		sbi_free(chip);
 		return rc;
+	}
 
-	starfive_gpio_chip_count++;
 	return 0;
 }
 
-- 
2.34.1


