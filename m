From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:57 +0530
Subject: [PATCH 09/11] lib: utils/gpio: Generate FDT gpio driver list at
 compile-time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-10-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having FDT gpio driver list hard-coded in the C source,
we generate it using carray.sh at compile-time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/gpio/fdt_gpio.h      |  2 ++
 lib/utils/gpio/fdt_gpio.c              | 18 ++++++++----------
 lib/utils/gpio/fdt_gpio_drivers.carray |  3 +++
 lib/utils/gpio/objects.mk              |  4 ++++
 4 files changed, 17 insertions(+), 10 deletions(-)
 create mode 100644 lib/utils/gpio/fdt_gpio_drivers.carray

diff --git a/include/sbi_utils/gpio/fdt_gpio.h b/include/sbi_utils/gpio/fdt_gpio.h
index 19e1b58..ccbf2a1 100644
--- a/include/sbi_utils/gpio/fdt_gpio.h
+++ b/include/sbi_utils/gpio/fdt_gpio.h
@@ -12,6 +12,8 @@
 
 #include <sbi_utils/gpio/gpio.h>
 
+struct fdt_phandle_args;
+
 /** FDT based GPIO driver */
 struct fdt_gpio {
 	const struct fdt_match *match_table;
diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
index 297b248..7258128 100644
--- a/lib/utils/gpio/fdt_gpio.c
+++ b/lib/utils/gpio/fdt_gpio.c
@@ -12,11 +12,9 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/gpio/fdt_gpio.h>
 
-extern struct fdt_gpio fdt_gpio_sifive;
-
-static struct fdt_gpio *gpio_drivers[] = {
-	&fdt_gpio_sifive
-};
+/* List of FDT gpio drivers generated at compile time */
+extern struct fdt_gpio *fdt_gpio_drivers[];
+extern unsigned long fdt_gpio_drivers_size;
 
 static struct fdt_gpio *fdt_gpio_driver(struct gpio_chip *chip)
 {
@@ -25,9 +23,9 @@ static struct fdt_gpio *fdt_gpio_driver(struct gpio_chip *chip)
 	if (!chip)
 		return NULL;
 
-	for (pos = 0; pos < array_size(gpio_drivers); pos++) {
-		if (chip->driver == gpio_drivers[pos])
-			return gpio_drivers[pos];
+	for (pos = 0; pos < fdt_gpio_drivers_size; pos++) {
+		if (chip->driver == fdt_gpio_drivers[pos])
+			return fdt_gpio_drivers[pos];
 	}
 
 	return NULL;
@@ -49,8 +47,8 @@ static int fdt_gpio_init(void *fdt, u32 phandle)
 		return SBI_EINVAL;
 
 	/* Try all GPIO drivers one-by-one */
-	for (pos = 0; pos < array_size(gpio_drivers); pos++) {
-		drv = gpio_drivers[pos];
+	for (pos = 0; pos < fdt_gpio_drivers_size; pos++) {
+		drv = fdt_gpio_drivers[pos];
 
 		match = fdt_match_node(fdt, nodeoff, drv->match_table);
 		if (match && drv->init) {
diff --git a/lib/utils/gpio/fdt_gpio_drivers.carray b/lib/utils/gpio/fdt_gpio_drivers.carray
new file mode 100644
index 0000000..e863f1c
--- /dev/null
+++ b/lib/utils/gpio/fdt_gpio_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/gpio/fdt_gpio.h
+TYPE: struct fdt_gpio
+NAME: fdt_gpio_drivers
diff --git a/lib/utils/gpio/objects.mk b/lib/utils/gpio/objects.mk
index 8eb7736..a5e131b 100644
--- a/lib/utils/gpio/objects.mk
+++ b/lib/utils/gpio/objects.mk
@@ -8,5 +8,9 @@
 #
 
 libsbiutils-objs-y += gpio/fdt_gpio.o
+libsbiutils-objs-y += gpio/fdt_gpio_drivers.o
+
+carray-fdt_gpio_drivers-y += fdt_gpio_sifive
 libsbiutils-objs-y += gpio/fdt_gpio_sifive.o
+
 libsbiutils-objs-y += gpio/gpio.o
-- 
2.34.1


