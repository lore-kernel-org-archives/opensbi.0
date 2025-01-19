From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 11:03:57 -0800
Subject: [PATCH 3/3] lib: utils: Initialize miscellaneous drivers in one pass
In-Reply-To: <20250119190435.3603452-1-samuel.holland@sifive.com>
References: <20250119190435.3603452-1-samuel.holland@sifive.com>
Message-ID: <20250119190435.3603452-4-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For driver subsystems that are not tightly integrated into the OpenSBI
init sequence, it is not important that the drivers are initialized in
any particular order. By putting all of these drivers in one array, they
can all be initialized with a single pass through the devicetree. This
saves about 10 ms of boot time on HiFive Unmatched.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/cppc/fdt_cppc.h            | 26 ----------------
 include/sbi_utils/fdt/fdt_driver.h           |  3 ++
 include/sbi_utils/hsm/fdt_hsm.h              | 26 ----------------
 include/sbi_utils/reset/fdt_reset.h          | 31 --------------------
 include/sbi_utils/suspend/fdt_suspend.h      | 26 ----------------
 lib/utils/cppc/fdt_cppc.c                    | 22 --------------
 lib/utils/cppc/fdt_cppc_drivers.carray       |  3 --
 lib/utils/cppc/fdt_cppc_rpmi.c               |  2 +-
 lib/utils/cppc/objects.mk                    |  5 +---
 lib/utils/fdt/fdt_early_drivers.carray       |  3 ++
 lib/utils/fdt/objects.mk                     |  2 ++
 lib/utils/hsm/fdt_hsm.c                      | 22 --------------
 lib/utils/hsm/fdt_hsm_drivers.carray         |  3 --
 lib/utils/hsm/fdt_hsm_rpmi.c                 |  4 +--
 lib/utils/hsm/objects.mk                     |  5 +---
 lib/utils/reset/fdt_reset.c                  | 18 ------------
 lib/utils/reset/fdt_reset_atcwdt200.c        |  2 +-
 lib/utils/reset/fdt_reset_drivers.carray     |  3 --
 lib/utils/reset/fdt_reset_gpio.c             |  2 +-
 lib/utils/reset/fdt_reset_htif.c             |  2 +-
 lib/utils/reset/fdt_reset_rpmi.c             |  2 +-
 lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c |  2 +-
 lib/utils/reset/fdt_reset_sunxi_wdt.c        |  2 +-
 lib/utils/reset/fdt_reset_syscon.c           |  2 +-
 lib/utils/reset/objects.mk                   | 21 ++++++-------
 lib/utils/suspend/fdt_suspend.c              | 22 --------------
 lib/utils/suspend/fdt_suspend_drivers.carray |  3 --
 lib/utils/suspend/fdt_suspend_rpmi.c         |  2 +-
 lib/utils/suspend/objects.mk                 |  5 +---
 platform/generic/platform.c                  | 16 ++++------
 platform/generic/sifive/fu740.c              |  4 +--
 platform/generic/starfive/jh7110.c           |  2 +-
 32 files changed, 39 insertions(+), 254 deletions(-)
 delete mode 100644 include/sbi_utils/cppc/fdt_cppc.h
 delete mode 100644 include/sbi_utils/hsm/fdt_hsm.h
 delete mode 100644 include/sbi_utils/reset/fdt_reset.h
 delete mode 100644 include/sbi_utils/suspend/fdt_suspend.h
 delete mode 100644 lib/utils/cppc/fdt_cppc.c
 delete mode 100644 lib/utils/cppc/fdt_cppc_drivers.carray
 create mode 100644 lib/utils/fdt/fdt_early_drivers.carray
 delete mode 100644 lib/utils/hsm/fdt_hsm.c
 delete mode 100644 lib/utils/hsm/fdt_hsm_drivers.carray
 delete mode 100644 lib/utils/reset/fdt_reset.c
 delete mode 100644 lib/utils/reset/fdt_reset_drivers.carray
 delete mode 100644 lib/utils/suspend/fdt_suspend.c
 delete mode 100644 lib/utils/suspend/fdt_suspend_drivers.carray

diff --git a/include/sbi_utils/cppc/fdt_cppc.h b/include/sbi_utils/cppc/fdt_cppc.h
deleted file mode 100644
index 433c6d32..00000000
--- a/include/sbi_utils/cppc/fdt_cppc.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2024 Ventana Micro Systems Inc.
- *
- * Authors:
- *   Anup Patel <apatel@ventanamicro.com>
- */
-
-#ifndef __FDT_CPPC_H__
-#define __FDT_CPPC_H__
-
-#include <sbi/sbi_types.h>
-#include <sbi_utils/fdt/fdt_driver.h>
-
-#ifdef CONFIG_FDT_CPPC
-
-void fdt_cppc_init(const void *fdt);
-
-#else
-
-static inline void fdt_cppc_init(const void *fdt) { }
-
-#endif
-
-#endif
diff --git a/include/sbi_utils/fdt/fdt_driver.h b/include/sbi_utils/fdt/fdt_driver.h
index 12ffe3f9..5b5bda90 100644
--- a/include/sbi_utils/fdt/fdt_driver.h
+++ b/include/sbi_utils/fdt/fdt_driver.h
@@ -18,6 +18,9 @@ struct fdt_driver {
 	bool experimental;
 };
 
+/* List of early FDT drivers generated at compile time */
+extern const struct fdt_driver *const fdt_early_drivers[];
+
 /**
  * Initialize a driver instance for a specific DT node
  *
diff --git a/include/sbi_utils/hsm/fdt_hsm.h b/include/sbi_utils/hsm/fdt_hsm.h
deleted file mode 100644
index 58061afc..00000000
--- a/include/sbi_utils/hsm/fdt_hsm.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2024 Ventana Micro Systems Inc.
- *
- * Authors:
- *   Anup Patel <apatel@ventanamicro.com>
- */
-
-#ifndef __FDT_HSM_H__
-#define __FDT_HSM_H__
-
-#include <sbi/sbi_types.h>
-#include <sbi_utils/fdt/fdt_driver.h>
-
-#ifdef CONFIG_FDT_HSM
-
-void fdt_hsm_init(const void *fdt);
-
-#else
-
-static inline void fdt_hsm_init(const void *fdt) { }
-
-#endif
-
-#endif
diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
deleted file mode 100644
index 5fba3886..00000000
--- a/include/sbi_utils/reset/fdt_reset.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2020 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#ifndef __FDT_RESET_H__
-#define __FDT_RESET_H__
-
-#include <sbi/sbi_types.h>
-#include <sbi_utils/fdt/fdt_driver.h>
-
-#ifdef CONFIG_FDT_RESET
-
-/**
- * fdt_reset_init() - initialize reset drivers based on the device-tree
- *
- * This function shall be invoked in final init.
- */
-void fdt_reset_init(const void *fdt);
-
-#else
-
-static inline void fdt_reset_init(const void *fdt) { }
-
-#endif
-
-#endif
diff --git a/include/sbi_utils/suspend/fdt_suspend.h b/include/sbi_utils/suspend/fdt_suspend.h
deleted file mode 100644
index bfc6c69a..00000000
--- a/include/sbi_utils/suspend/fdt_suspend.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2024 Ventana Micro Systems Inc.
- *
- * Authors:
- *   Anup Patel <apatel@ventanamicro.com>
- */
-
-#ifndef __FDT_SUSPEND_H__
-#define __FDT_SUSPEND_H__
-
-#include <sbi/sbi_types.h>
-#include <sbi_utils/fdt/fdt_driver.h>
-
-#ifdef CONFIG_FDT_SUSPEND
-
-void fdt_suspend_init(const void *fdt);
-
-#else
-
-static inline void fdt_suspend_init(const void *fdt) { }
-
-#endif
-
-#endif
diff --git a/lib/utils/cppc/fdt_cppc.c b/lib/utils/cppc/fdt_cppc.c
deleted file mode 100644
index 0e1ecb24..00000000
--- a/lib/utils/cppc/fdt_cppc.c
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2024 Ventana Micro Systems Inc.
- *
- * Authors:
- *   Anup Patel <apatel@ventanamicro.com>
- */
-
-#include <sbi_utils/cppc/fdt_cppc.h>
-
-/* List of FDT CPPC drivers generated at compile time */
-extern const struct fdt_driver *const fdt_cppc_drivers[];
-
-void fdt_cppc_init(const void *fdt)
-{
-	/*
-	 * Platforms might have multiple CPPC devices or might
-	 * not have any so probe all and don't fail.
-	 */
-	fdt_driver_init_all(fdt, fdt_cppc_drivers);
-}
diff --git a/lib/utils/cppc/fdt_cppc_drivers.carray b/lib/utils/cppc/fdt_cppc_drivers.carray
deleted file mode 100644
index b25c7888..00000000
--- a/lib/utils/cppc/fdt_cppc_drivers.carray
+++ /dev/null
@@ -1,3 +0,0 @@
-HEADER: sbi_utils/cppc/fdt_cppc.h
-TYPE: const struct fdt_driver
-NAME: fdt_cppc_drivers
diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
index 95328404..39342198 100644
--- a/lib/utils/cppc/fdt_cppc_rpmi.c
+++ b/lib/utils/cppc/fdt_cppc_rpmi.c
@@ -12,7 +12,7 @@
 #include <sbi/sbi_cppc.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_scratch.h>
-#include <sbi_utils/cppc/fdt_cppc.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/mailbox/fdt_mailbox.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
diff --git a/lib/utils/cppc/objects.mk b/lib/utils/cppc/objects.mk
index 07dc7d89..ece1791b 100644
--- a/lib/utils/cppc/objects.mk
+++ b/lib/utils/cppc/objects.mk
@@ -7,8 +7,5 @@
 #   Anup Patel <apatel@ventanamicro.com>
 #
 
-libsbiutils-objs-$(CONFIG_FDT_CPPC) += cppc/fdt_cppc.o
-libsbiutils-objs-$(CONFIG_FDT_CPPC) += cppc/fdt_cppc_drivers.carray.o
-
-carray-fdt_cppc_drivers-$(CONFIG_FDT_CPPC_RPMI) += fdt_cppc_rpmi
+carray-fdt_early_drivers-$(CONFIG_FDT_CPPC_RPMI) += fdt_cppc_rpmi
 libsbiutils-objs-$(CONFIG_FDT_CPPC_RPMI) += cppc/fdt_cppc_rpmi.o
diff --git a/lib/utils/fdt/fdt_early_drivers.carray b/lib/utils/fdt/fdt_early_drivers.carray
new file mode 100644
index 00000000..969e10b1
--- /dev/null
+++ b/lib/utils/fdt/fdt_early_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/fdt/fdt_driver.h
+TYPE: const struct fdt_driver
+NAME: fdt_early_drivers
diff --git a/lib/utils/fdt/objects.mk b/lib/utils/fdt/objects.mk
index 1a2298be..31cf1c5a 100644
--- a/lib/utils/fdt/objects.mk
+++ b/lib/utils/fdt/objects.mk
@@ -4,6 +4,8 @@
 # Copyright (C) 2020 Bin Meng <bmeng.cn@gmail.com>
 #
 
+libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_early_drivers.carray.o
+
 libsbiutils-objs-$(CONFIG_FDT_DOMAIN) += fdt/fdt_domain.o
 libsbiutils-objs-$(CONFIG_FDT_PMU) += fdt/fdt_pmu.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_helper.o
diff --git a/lib/utils/hsm/fdt_hsm.c b/lib/utils/hsm/fdt_hsm.c
deleted file mode 100644
index 162b9867..00000000
--- a/lib/utils/hsm/fdt_hsm.c
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2024 Ventana Micro Systems Inc.
- *
- * Authors:
- *   Anup Patel <apatel@ventanamicro.com>
- */
-
-#include <sbi_utils/hsm/fdt_hsm.h>
-
-/* List of FDT HSM drivers generated at compile time */
-extern const struct fdt_driver *const fdt_hsm_drivers[];
-
-void fdt_hsm_init(const void *fdt)
-{
-	/*
-	 * Platforms might have multiple HSM devices or might
-	 * not have any so probe all and don't fail.
-	 */
-	fdt_driver_init_all(fdt, fdt_hsm_drivers);
-}
diff --git a/lib/utils/hsm/fdt_hsm_drivers.carray b/lib/utils/hsm/fdt_hsm_drivers.carray
deleted file mode 100644
index 73680a25..00000000
--- a/lib/utils/hsm/fdt_hsm_drivers.carray
+++ /dev/null
@@ -1,3 +0,0 @@
-HEADER: sbi_utils/hsm/fdt_hsm.h
-TYPE: const struct fdt_driver
-NAME: fdt_hsm_drivers
diff --git a/lib/utils/hsm/fdt_hsm_rpmi.c b/lib/utils/hsm/fdt_hsm_rpmi.c
index 66fa0fe2..5142c3e6 100644
--- a/lib/utils/hsm/fdt_hsm_rpmi.c
+++ b/lib/utils/hsm/fdt_hsm_rpmi.c
@@ -12,9 +12,9 @@
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_scratch.h>
-#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
-#include <sbi_utils/hsm/fdt_hsm.h>
+#include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/mailbox/fdt_mailbox.h>
 #include <sbi_utils/mailbox/mailbox.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
diff --git a/lib/utils/hsm/objects.mk b/lib/utils/hsm/objects.mk
index b54b6f6c..c13d81f7 100644
--- a/lib/utils/hsm/objects.mk
+++ b/lib/utils/hsm/objects.mk
@@ -7,8 +7,5 @@
 #   Anup Patel <apatel@ventanamicro.com>
 #
 
-libsbiutils-objs-$(CONFIG_FDT_HSM) += hsm/fdt_hsm.o
-libsbiutils-objs-$(CONFIG_FDT_HSM) += hsm/fdt_hsm_drivers.carray.o
-
-carray-fdt_hsm_drivers-$(CONFIG_FDT_HSM_RPMI) += fdt_hsm_rpmi
+carray-fdt_early_drivers-$(CONFIG_FDT_HSM_RPMI) += fdt_hsm_rpmi
 libsbiutils-objs-$(CONFIG_FDT_HSM_RPMI) += hsm/fdt_hsm_rpmi.o
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
deleted file mode 100644
index 633a25cd..00000000
--- a/lib/utils/reset/fdt_reset.c
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2020 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#include <sbi_utils/reset/fdt_reset.h>
-
-/* List of FDT reset drivers generated at compile time */
-extern const struct fdt_driver *const fdt_reset_drivers[];
-
-void fdt_reset_init(const void *fdt)
-{
-	fdt_driver_init_all(fdt, fdt_reset_drivers);
-}
diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
index d3e38e61..97ec7431 100644
--- a/lib/utils/reset/fdt_reset_atcwdt200.c
+++ b/lib/utils/reset/fdt_reset_atcwdt200.c
@@ -14,8 +14,8 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/reset/fdt_reset.h>
 #include <sbi_utils/sys/atcsmu.h>
 
 #define ATCWDT200_WP_NUM 0x5aa5
diff --git a/lib/utils/reset/fdt_reset_drivers.carray b/lib/utils/reset/fdt_reset_drivers.carray
deleted file mode 100644
index 2e9e86af..00000000
--- a/lib/utils/reset/fdt_reset_drivers.carray
+++ /dev/null
@@ -1,3 +0,0 @@
-HEADER: sbi_utils/reset/fdt_reset.h
-TYPE: const struct fdt_driver
-NAME: fdt_reset_drivers
diff --git a/lib/utils/reset/fdt_reset_gpio.c b/lib/utils/reset/fdt_reset_gpio.c
index cf751254..fabeee58 100644
--- a/lib/utils/reset/fdt_reset_gpio.c
+++ b/lib/utils/reset/fdt_reset_gpio.c
@@ -15,9 +15,9 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_timer.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/gpio/fdt_gpio.h>
-#include <sbi_utils/reset/fdt_reset.h>
 
 struct gpio_reset {
 	struct gpio_pin pin;
diff --git a/lib/utils/reset/fdt_reset_htif.c b/lib/utils/reset/fdt_reset_htif.c
index 61c907fa..a1066dac 100644
--- a/lib/utils/reset/fdt_reset_htif.c
+++ b/lib/utils/reset/fdt_reset_htif.c
@@ -7,7 +7,7 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
-#include <sbi_utils/reset/fdt_reset.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/sys/htif.h>
 
diff --git a/lib/utils/reset/fdt_reset_rpmi.c b/lib/utils/reset/fdt_reset_rpmi.c
index 70826b96..15d3c6d5 100644
--- a/lib/utils/reset/fdt_reset_rpmi.c
+++ b/lib/utils/reset/fdt_reset_rpmi.c
@@ -10,8 +10,8 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_console.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/reset/fdt_reset.h>
 #include <sbi_utils/mailbox/fdt_mailbox.h>
 #include <sbi_utils/mailbox/rpmi_msgprot.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
diff --git a/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c b/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
index 66826830..94ac4162 100644
--- a/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
+++ b/lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c
@@ -10,8 +10,8 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_console.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/reset/fdt_reset.h>
 #include <sbi_utils/i2c/fdt_i2c.h>
 
 #define MANGO_BOARD_TYPE_MASK		0x80
diff --git a/lib/utils/reset/fdt_reset_sunxi_wdt.c b/lib/utils/reset/fdt_reset_sunxi_wdt.c
index 708bf25c..7e7b1118 100644
--- a/lib/utils/reset/fdt_reset_sunxi_wdt.c
+++ b/lib/utils/reset/fdt_reset_sunxi_wdt.c
@@ -9,8 +9,8 @@
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/reset/fdt_reset.h>
 
 #define WDT_KEY_VAL			0x16aa0000
 
diff --git a/lib/utils/reset/fdt_reset_syscon.c b/lib/utils/reset/fdt_reset_syscon.c
index d1a3bc0e..50badcd0 100644
--- a/lib/utils/reset/fdt_reset_syscon.c
+++ b/lib/utils/reset/fdt_reset_syscon.c
@@ -12,9 +12,9 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/regmap/fdt_regmap.h>
-#include <sbi_utils/reset/fdt_reset.h>
 
 struct syscon_reset {
 	struct regmap *rmap;
diff --git a/lib/utils/reset/objects.mk b/lib/utils/reset/objects.mk
index 8f3774c5..ac38b49d 100644
--- a/lib/utils/reset/objects.mk
+++ b/lib/utils/reset/objects.mk
@@ -7,28 +7,25 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-$(CONFIG_FDT_RESET) += reset/fdt_reset.o
-libsbiutils-objs-$(CONFIG_FDT_RESET) += reset/fdt_reset_drivers.carray.o
-
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_ATCWDT200) += fdt_reset_atcwdt200
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_ATCWDT200) += fdt_reset_atcwdt200
 libsbiutils-objs-$(CONFIG_FDT_RESET_ATCWDT200) += reset/fdt_reset_atcwdt200.o
 
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_GPIO) += fdt_poweroff_gpio
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_GPIO) += fdt_reset_gpio
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_GPIO) += fdt_poweroff_gpio
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_GPIO) += fdt_reset_gpio
 libsbiutils-objs-$(CONFIG_FDT_RESET_GPIO) += reset/fdt_reset_gpio.o
 
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_HTIF) += fdt_reset_htif
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_HTIF) += fdt_reset_htif
 libsbiutils-objs-$(CONFIG_FDT_RESET_HTIF) += reset/fdt_reset_htif.o
 
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += fdt_reset_sg2042_mcu
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += fdt_reset_sg2042_mcu
 libsbiutils-objs-$(CONFIG_FDT_RESET_SG2042_HWMON_MCU) += reset/fdt_reset_sg2042_hwmon_mcu.o
 
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SUNXI_WDT) += fdt_reset_sunxi_wdt
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SUNXI_WDT) += fdt_reset_sunxi_wdt
 libsbiutils-objs-$(CONFIG_FDT_RESET_SUNXI_WDT) += reset/fdt_reset_sunxi_wdt.o
 
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SYSCON) += fdt_syscon_poweroff
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_SYSCON) += fdt_syscon_reboot
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SYSCON) += fdt_syscon_poweroff
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_SYSCON) += fdt_syscon_reboot
 libsbiutils-objs-$(CONFIG_FDT_RESET_SYSCON) += reset/fdt_reset_syscon.o
 
-carray-fdt_reset_drivers-$(CONFIG_FDT_RESET_RPMI) += fdt_reset_rpmi
+carray-fdt_early_drivers-$(CONFIG_FDT_RESET_RPMI) += fdt_reset_rpmi
 libsbiutils-objs-$(CONFIG_FDT_RESET_RPMI) += reset/fdt_reset_rpmi.o
diff --git a/lib/utils/suspend/fdt_suspend.c b/lib/utils/suspend/fdt_suspend.c
deleted file mode 100644
index bd4691a0..00000000
--- a/lib/utils/suspend/fdt_suspend.c
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2024 Ventana Micro Systems Inc.
- *
- * Authors:
- *   Anup Patel <apatel@ventanamicro.com>
- */
-
-#include <sbi_utils/suspend/fdt_suspend.h>
-
-/* List of FDT suspend drivers generated at compile time */
-extern const struct fdt_driver *const fdt_suspend_drivers[];
-
-void fdt_suspend_init(const void *fdt)
-{
-	/*
-	 * Platforms might have multiple system suspend devices or
-	 * might not have any so probe all and don't fail.
-	 */
-	fdt_driver_init_all(fdt, fdt_suspend_drivers);
-}
diff --git a/lib/utils/suspend/fdt_suspend_drivers.carray b/lib/utils/suspend/fdt_suspend_drivers.carray
deleted file mode 100644
index a0c857fc..00000000
--- a/lib/utils/suspend/fdt_suspend_drivers.carray
+++ /dev/null
@@ -1,3 +0,0 @@
-HEADER: sbi_utils/suspend/fdt_suspend.h
-TYPE: const struct fdt_driver
-NAME: fdt_suspend_drivers
diff --git a/lib/utils/suspend/fdt_suspend_rpmi.c b/lib/utils/suspend/fdt_suspend_rpmi.c
index 07ff5198..b08c33e9 100644
--- a/lib/utils/suspend/fdt_suspend_rpmi.c
+++ b/lib/utils/suspend/fdt_suspend_rpmi.c
@@ -10,11 +10,11 @@
 #include <libfdt.h>
 #include <sbi/sbi_system.h>
 #include <sbi/riscv_asm.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/mailbox/fdt_mailbox.h>
 #include <sbi_utils/mailbox/mailbox.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
-#include <sbi_utils/suspend/fdt_suspend.h>
 
 struct rpmi_syssusp {
 	struct mbox_chan *chan;
diff --git a/lib/utils/suspend/objects.mk b/lib/utils/suspend/objects.mk
index 657670a8..9c386248 100644
--- a/lib/utils/suspend/objects.mk
+++ b/lib/utils/suspend/objects.mk
@@ -7,8 +7,5 @@
 #   Anup Patel <apatel@ventanamicro.com>
 #
 
-libsbiutils-objs-$(CONFIG_FDT_SUSPEND) += suspend/fdt_suspend.o
-libsbiutils-objs-$(CONFIG_FDT_SUSPEND) += suspend/fdt_suspend_drivers.carray.o
-
-carray-fdt_suspend_drivers-$(CONFIG_FDT_SUSPEND_RPMI) += fdt_suspend_rpmi
+carray-fdt_early_drivers-$(CONFIG_FDT_SUSPEND_RPMI) += fdt_suspend_rpmi
 libsbiutils-objs-$(CONFIG_FDT_SUSPEND_RPMI) += suspend/fdt_suspend_rpmi.o
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index c03ed88e..ffcf3fc7 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -17,21 +17,18 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_tlb.h>
-#include <sbi_utils/mpxy/fdt_mpxy.h>
-#include <sbi_utils/cppc/fdt_cppc.h>
 #include <sbi_utils/fdt/fdt_domain.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_pmu.h>
-#include <sbi_utils/hsm/fdt_hsm.h>
+#include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/serial/fdt_serial.h>
-#include <sbi_utils/suspend/fdt_suspend.h>
-#include <sbi_utils/timer/fdt_timer.h>
-#include <sbi_utils/ipi/fdt_ipi.h>
-#include <sbi_utils/reset/fdt_reset.h>
 #include <sbi_utils/serial/semihosting.h>
+#include <sbi_utils/timer/fdt_timer.h>
 
 /* List of platform override modules generated at compile time */
 extern const struct platform_override *const platform_override_modules[];
@@ -257,10 +254,7 @@ static int generic_early_init(bool cold_boot)
 		if (rc)
 			return rc;
 
-		fdt_cppc_init(fdt);
-		fdt_hsm_init(fdt);
-		fdt_reset_init(fdt);
-		fdt_suspend_init(fdt);
+		fdt_driver_init_all(fdt, fdt_early_drivers);
 	}
 
 	if (!generic_plat || !generic_plat->early_init)
diff --git a/platform/generic/sifive/fu740.c b/platform/generic/sifive/fu740.c
index 52ca12ff..7a6c0319 100644
--- a/platform/generic/sifive/fu740.c
+++ b/platform/generic/sifive/fu740.c
@@ -15,9 +15,9 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_console.h>
-#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
-#include <sbi_utils/reset/fdt_reset.h>
+#include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/i2c/fdt_i2c.h>
 
 #define DA9063_REG_PAGE_CON		0x00
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 6d95758f..cd8ce27d 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -16,8 +16,8 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/riscv_io.h>
+#include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/reset/fdt_reset.h>
 #include <sbi_utils/i2c/fdt_i2c.h>
 
 struct pmic {
-- 
2.47.0


