From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Nov 2024 14:02:45 -0800
Subject: [PATCH v2 01/11] treewide: Make carray arrays const and NULL-terminated
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <20241111220304.1228821-2-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This allows the compiler to generate significantly better code, because
it does not have to maintain either the loop counter or loop limit. Plus
there are half as many symbols to relocate. This also simplifies passing
carray arrays to helper functions.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/sbi/sbi_ecall.c             | 5 ++---
 lib/sbi/tests/sbi_unit_test.c   | 5 ++---
 lib/utils/gpio/fdt_gpio.c       | 5 ++---
 lib/utils/i2c/fdt_i2c.c         | 5 ++---
 lib/utils/ipi/fdt_ipi.c         | 5 ++---
 lib/utils/irqchip/fdt_irqchip.c | 5 ++---
 lib/utils/regmap/fdt_regmap.c   | 5 ++---
 lib/utils/reset/fdt_reset.c     | 5 ++---
 lib/utils/serial/fdt_serial.c   | 7 +++----
 lib/utils/timer/fdt_timer.c     | 5 ++---
 platform/generic/platform.c     | 5 ++---
 scripts/carray.sh               | 7 +++----
 12 files changed, 26 insertions(+), 38 deletions(-)

diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index d4fc58c5..be0b67e1 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -13,8 +13,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_trap.h>
 
-extern struct sbi_ecall_extension *sbi_ecall_exts[];
-extern unsigned long sbi_ecall_exts_size;
+extern struct sbi_ecall_extension *const sbi_ecall_exts[];
 
 u16 sbi_ecall_version_major(void)
 {
@@ -148,7 +147,7 @@ int sbi_ecall_init(void)
 	struct sbi_ecall_extension *ext;
 	unsigned long i;
 
-	for (i = 0; i < sbi_ecall_exts_size; i++) {
+	for (i = 0; sbi_ecall_exts[i]; i++) {
 		ext = sbi_ecall_exts[i];
 		ret = SBI_ENODEV;
 
diff --git a/lib/sbi/tests/sbi_unit_test.c b/lib/sbi/tests/sbi_unit_test.c
index cd091663..d5e81568 100644
--- a/lib/sbi/tests/sbi_unit_test.c
+++ b/lib/sbi/tests/sbi_unit_test.c
@@ -11,8 +11,7 @@
 #define ANSI_COLOR_RED "\x1b[31m"
 #define ANSI_COLOR_RESET "\x1b[0m"
 
-extern struct sbiunit_test_suite *sbi_unit_tests[];
-extern unsigned long sbi_unit_tests_size;
+extern struct sbiunit_test_suite *const sbi_unit_tests[];
 
 static void run_test_suite(struct sbiunit_test_suite *suite)
 {
@@ -48,6 +47,6 @@ void run_all_tests(void)
 
 	sbi_printf("\n# Running SBIUNIT tests #\n");
 
-	for (i = 0; i < sbi_unit_tests_size; i++)
+	for (i = 0; sbi_unit_tests[i]; i++)
 		run_test_suite(sbi_unit_tests[i]);
 }
diff --git a/lib/utils/gpio/fdt_gpio.c b/lib/utils/gpio/fdt_gpio.c
index 953fa13a..eac2b863 100644
--- a/lib/utils/gpio/fdt_gpio.c
+++ b/lib/utils/gpio/fdt_gpio.c
@@ -13,8 +13,7 @@
 #include <sbi_utils/gpio/fdt_gpio.h>
 
 /* List of FDT gpio drivers generated at compile time */
-extern struct fdt_gpio *fdt_gpio_drivers[];
-extern unsigned long fdt_gpio_drivers_size;
+extern struct fdt_gpio *const fdt_gpio_drivers[];
 
 static int fdt_gpio_init(const void *fdt, int nodeoff)
 {
@@ -27,7 +26,7 @@ static int fdt_gpio_init(const void *fdt, int nodeoff)
 		return SBI_EINVAL;
 
 	/* Try all GPIO drivers one-by-one */
-	for (pos = 0; pos < fdt_gpio_drivers_size; pos++) {
+	for (pos = 0; fdt_gpio_drivers[pos]; pos++) {
 		drv = fdt_gpio_drivers[pos];
 
 		match = fdt_match_node(fdt, nodeoff, drv->match_table);
diff --git a/lib/utils/i2c/fdt_i2c.c b/lib/utils/i2c/fdt_i2c.c
index d23b40db..56891a0a 100644
--- a/lib/utils/i2c/fdt_i2c.c
+++ b/lib/utils/i2c/fdt_i2c.c
@@ -17,8 +17,7 @@
 #include <sbi_utils/i2c/fdt_i2c.h>
 
 /* List of FDT i2c adapter drivers generated at compile time */
-extern struct fdt_i2c_adapter *fdt_i2c_adapter_drivers[];
-extern unsigned long fdt_i2c_adapter_drivers_size;
+extern struct fdt_i2c_adapter *const fdt_i2c_adapter_drivers[];
 
 static int fdt_i2c_adapter_init(const void *fdt, int nodeoff)
 {
@@ -27,7 +26,7 @@ static int fdt_i2c_adapter_init(const void *fdt, int nodeoff)
 	const struct fdt_match *match;
 
 	/* Try all I2C drivers one-by-one */
-	for (pos = 0; pos < fdt_i2c_adapter_drivers_size; pos++) {
+	for (pos = 0; fdt_i2c_adapter_drivers[pos]; pos++) {
 		drv = fdt_i2c_adapter_drivers[pos];
 		match = fdt_match_node(fdt, nodeoff, drv->match_table);
 		if (match && drv->init) {
diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
index c2ff9cfa..6c2feafb 100644
--- a/lib/utils/ipi/fdt_ipi.c
+++ b/lib/utils/ipi/fdt_ipi.c
@@ -13,8 +13,7 @@
 #include <sbi_utils/ipi/fdt_ipi.h>
 
 /* List of FDT ipi drivers generated at compile time */
-extern struct fdt_ipi *fdt_ipi_drivers[];
-extern unsigned long fdt_ipi_drivers_size;
+extern struct fdt_ipi *const fdt_ipi_drivers[];
 
 int fdt_ipi_init(void)
 {
@@ -23,7 +22,7 @@ int fdt_ipi_init(void)
 	const struct fdt_match *match;
 	const void *fdt = fdt_get_address();
 
-	for (pos = 0; pos < fdt_ipi_drivers_size; pos++) {
+	for (pos = 0; fdt_ipi_drivers[pos]; pos++) {
 		drv = fdt_ipi_drivers[pos];
 
 		noff = -1;
diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
index b4f054ae..0c8c76b2 100644
--- a/lib/utils/irqchip/fdt_irqchip.c
+++ b/lib/utils/irqchip/fdt_irqchip.c
@@ -13,8 +13,7 @@
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 
 /* List of FDT irqchip drivers generated at compile time */
-extern struct fdt_irqchip *fdt_irqchip_drivers[];
-extern unsigned long fdt_irqchip_drivers_size;
+extern struct fdt_irqchip *const fdt_irqchip_drivers[];
 
 #define FDT_IRQCHIP_MAX_DRIVERS	8
 
@@ -55,7 +54,7 @@ static int fdt_irqchip_cold_init(void)
 	const struct fdt_match *match;
 	const void *fdt = fdt_get_address();
 
-	for (pos = 0; pos < fdt_irqchip_drivers_size; pos++) {
+	for (pos = 0; fdt_irqchip_drivers[pos]; pos++) {
 		drv = fdt_irqchip_drivers[pos];
 
 		noff = -1;
diff --git a/lib/utils/regmap/fdt_regmap.c b/lib/utils/regmap/fdt_regmap.c
index 933938fb..ab991c45 100644
--- a/lib/utils/regmap/fdt_regmap.c
+++ b/lib/utils/regmap/fdt_regmap.c
@@ -13,8 +13,7 @@
 #include <sbi_utils/regmap/fdt_regmap.h>
 
 /* List of FDT regmap drivers generated at compile time */
-extern struct fdt_regmap *fdt_regmap_drivers[];
-extern unsigned long fdt_regmap_drivers_size;
+extern struct fdt_regmap *const fdt_regmap_drivers[];
 
 static int fdt_regmap_init(const void *fdt, int nodeoff)
 {
@@ -23,7 +22,7 @@ static int fdt_regmap_init(const void *fdt, int nodeoff)
 	const struct fdt_match *match;
 
 	/* Try all I2C drivers one-by-one */
-	for (pos = 0; pos < fdt_regmap_drivers_size; pos++) {
+	for (pos = 0; fdt_regmap_drivers[pos]; pos++) {
 		drv = fdt_regmap_drivers[pos];
 		match = fdt_match_node(fdt, nodeoff, drv->match_table);
 		if (match && drv->init) {
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 05deb75e..4b20c3e3 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -14,8 +14,7 @@
 #include <sbi_utils/reset/fdt_reset.h>
 
 /* List of FDT reset drivers generated at compile time */
-extern struct fdt_reset *fdt_reset_drivers[];
-extern unsigned long fdt_reset_drivers_size;
+extern struct fdt_reset *const fdt_reset_drivers[];
 
 int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv)
 {
@@ -46,6 +45,6 @@ void fdt_reset_init(const void *fdt)
 {
 	int pos;
 
-	for (pos = 0; pos < fdt_reset_drivers_size; pos++)
+	for (pos = 0; fdt_reset_drivers[pos]; pos++)
 		fdt_reset_driver_init(fdt, fdt_reset_drivers[pos]);
 }
diff --git a/lib/utils/serial/fdt_serial.c b/lib/utils/serial/fdt_serial.c
index a2a96cb2..a7129bdd 100644
--- a/lib/utils/serial/fdt_serial.c
+++ b/lib/utils/serial/fdt_serial.c
@@ -14,8 +14,7 @@
 #include <sbi_utils/serial/fdt_serial.h>
 
 /* List of FDT serial drivers generated at compile time */
-extern struct fdt_serial *fdt_serial_drivers[];
-extern unsigned long fdt_serial_drivers_size;
+extern struct fdt_serial *const fdt_serial_drivers[];
 
 int fdt_serial_init(const void *fdt)
 {
@@ -46,7 +45,7 @@ int fdt_serial_init(const void *fdt)
 	}
 
 	/* First check DT node pointed by stdout-path */
-	for (pos = 0; pos < fdt_serial_drivers_size && -1 < noff; pos++) {
+	for (pos = 0; fdt_serial_drivers[pos] && -1 < noff; pos++) {
 		drv = fdt_serial_drivers[pos];
 
 		match = fdt_match_node(fdt, noff, drv->match_table);
@@ -64,7 +63,7 @@ int fdt_serial_init(const void *fdt)
 	}
 
 	/* Lastly check all DT nodes */
-	for (pos = 0; pos < fdt_serial_drivers_size; pos++) {
+	for (pos = 0; fdt_serial_drivers[pos]; pos++) {
 		drv = fdt_serial_drivers[pos];
 
 		noff = -1;
diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
index 37965f5e..a2412409 100644
--- a/lib/utils/timer/fdt_timer.c
+++ b/lib/utils/timer/fdt_timer.c
@@ -13,8 +13,7 @@
 #include <sbi_utils/timer/fdt_timer.h>
 
 /* List of FDT timer drivers generated at compile time */
-extern struct fdt_timer *fdt_timer_drivers[];
-extern unsigned long fdt_timer_drivers_size;
+extern struct fdt_timer *const fdt_timer_drivers[];
 
 int fdt_timer_init(void)
 {
@@ -23,7 +22,7 @@ int fdt_timer_init(void)
 	const struct fdt_match *match;
 	const void *fdt = fdt_get_address();
 
-	for (pos = 0; pos < fdt_timer_drivers_size; pos++) {
+	for (pos = 0; fdt_timer_drivers[pos]; pos++) {
 		drv = fdt_timer_drivers[pos];
 
 		noff = -1;
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 3b20ffbe..2ffb41e2 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -30,8 +30,7 @@
 #include <sbi_utils/serial/semihosting.h>
 
 /* List of platform override modules generated at compile time */
-extern const struct platform_override *platform_override_modules[];
-extern unsigned long platform_override_modules_size;
+extern const struct platform_override *const platform_override_modules[];
 
 static const struct platform_override *generic_plat = NULL;
 static const struct fdt_match *generic_plat_match = NULL;
@@ -42,7 +41,7 @@ static void fw_platform_lookup_special(const void *fdt, int root_offset)
 	const struct fdt_match *match;
 	int pos;
 
-	for (pos = 0; pos < platform_override_modules_size; pos++) {
+	for (pos = 0; platform_override_modules[pos]; pos++) {
 		plat = platform_override_modules[pos];
 		if (!plat->match_table)
 			continue;
diff --git a/scripts/carray.sh b/scripts/carray.sh
index 1fa2366a..72808697 100755
--- a/scripts/carray.sh
+++ b/scripts/carray.sh
@@ -69,10 +69,9 @@ for VAR in ${VAR_LIST}; do
 done
 printf "\n"
 
-printf "%s *%s[] = {\n" "${TYPE_NAME}" "${ARRAY_NAME}"
+printf "%s *const %s[] = {\n" "${TYPE_NAME}" "${ARRAY_NAME}"
 for VAR in ${VAR_LIST}; do
 	printf "\t&%s,\n" "${VAR}"
 done
-printf "};\n\n"
-
-printf "unsigned long %s_size = sizeof(%s) / sizeof(%s *);\n" "${ARRAY_NAME}" "${ARRAY_NAME}" "${TYPE_NAME}"
+	printf "\tNULL\n"
+printf "};\n"
-- 
2.45.1


