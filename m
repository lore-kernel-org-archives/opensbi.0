From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  4 Aug 2022 17:34:24 +0530
Subject: [PATCH v6 12/17] lib: utils/fdt: Use kconfig for enabling/disabling
In-Reply-To: <20220804120429.59444-1-apatel@ventanamicro.com>
References: <20220804120429.59444-1-apatel@ventanamicro.com>
Message-ID: <20220804120429.59444-13-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update FDT support makefile to use kconfig for enabling/disabling.
To avoid compilation errors, we also enable FDT for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi_utils/fdt/fdt_domain.h             |  9 +++++++++
 include/sbi_utils/fdt/fdt_pmu.h                | 10 ++++++++++
 lib/utils/Kconfig                              |  4 ++++
 lib/utils/fdt/Kconfig                          | 18 ++++++++++++++++++
 lib/utils/fdt/objects.mk                       |  8 ++++----
 lib/utils/gpio/Kconfig                         |  1 +
 lib/utils/i2c/Kconfig                          |  1 +
 lib/utils/ipi/Kconfig                          |  1 +
 lib/utils/irqchip/Kconfig                      |  1 +
 {platform/generic => lib/utils/libfdt}/Kconfig |  4 ++--
 lib/utils/libfdt/objects.mk                    |  2 +-
 lib/utils/reset/Kconfig                        |  1 +
 lib/utils/serial/Kconfig                       |  1 +
 lib/utils/timer/Kconfig                        |  1 +
 platform/andes/ae350/Kconfig                   |  1 +
 platform/fpga/ariane/Kconfig                   |  1 +
 platform/fpga/openpiton/Kconfig                |  1 +
 platform/generic/Kconfig                       |  3 +++
 platform/kendryte/k210/Kconfig                 |  1 +
 platform/nuclei/ux600/Kconfig                  |  1 +
 platform/nuclei/ux600/platform.c               |  1 -
 21 files changed, 63 insertions(+), 8 deletions(-)
 create mode 100644 lib/utils/fdt/Kconfig
 copy {platform/generic => lib/utils/libfdt}/Kconfig (57%)

diff --git a/include/sbi_utils/fdt/fdt_domain.h b/include/sbi_utils/fdt/fdt_domain.h
index 5448eb4..ee09d1b 100644
--- a/include/sbi_utils/fdt/fdt_domain.h
+++ b/include/sbi_utils/fdt/fdt_domain.h
@@ -13,6 +13,8 @@
 
 #include <sbi/sbi_types.h>
 
+#ifdef CONFIG_FDT_DOMAIN
+
 struct sbi_domain;
 
 /**
@@ -70,4 +72,11 @@ void fdt_domain_fixup(void *fdt);
  */
 int fdt_domains_populate(void *fdt);
 
+#else
+
+static inline void fdt_domain_fixup(void *fdt) { }
+static inline int fdt_domains_populate(void *fdt) { return 0; }
+
+#endif
+
 #endif /* __FDT_DOMAIN_H__ */
diff --git a/include/sbi_utils/fdt/fdt_pmu.h b/include/sbi_utils/fdt/fdt_pmu.h
index 2fa01ed..c65cad7 100644
--- a/include/sbi_utils/fdt/fdt_pmu.h
+++ b/include/sbi_utils/fdt/fdt_pmu.h
@@ -13,6 +13,8 @@
 
 #include <sbi/sbi_types.h>
 
+#ifdef CONFIG_FDT_PMU
+
 /**
  * Fix up the PMU node in the device tree
  *
@@ -43,4 +45,12 @@ int fdt_pmu_setup(void *fdt);
  */
 uint64_t fdt_pmu_get_select_value(uint32_t event_idx);
 
+#else
+
+static inline void fdt_pmu_fixup(void *fdt) { }
+static inline int fdt_pmu_setup(void *fdt) { return 0; }
+static inline uint64_t fdt_pmu_get_select_value(uint32_t event_idx) { return 0; }
+
+#endif
+
 #endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 673b02b..5a71e75 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -2,6 +2,8 @@
 
 menu "Utils and Drivers Support"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/fdt/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/gpio/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/i2c/Kconfig"
@@ -10,6 +12,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/ipi/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/irqchip/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/libfdt/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/serial/Kconfig"
diff --git a/lib/utils/fdt/Kconfig b/lib/utils/fdt/Kconfig
new file mode 100644
index 0000000..23b003b
--- /dev/null
+++ b/lib/utils/fdt/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menuconfig FDT
+	bool "Flattened Device Tree (FDT) support"
+	select LIBFDT
+	default n
+
+if FDT
+
+config FDT_DOMAIN
+	bool "FDT domain support"
+	default n
+
+config FDT_PMU
+	bool "FDT performance monitoring unit (PMU) support"
+	default n
+
+endif
diff --git a/lib/utils/fdt/objects.mk b/lib/utils/fdt/objects.mk
index 03800f9..5cede81 100644
--- a/lib/utils/fdt/objects.mk
+++ b/lib/utils/fdt/objects.mk
@@ -4,7 +4,7 @@
 # Copyright (C) 2020 Bin Meng <bmeng.cn@gmail.com>
 #
 
-libsbiutils-objs-y += fdt/fdt_domain.o
-libsbiutils-objs-y += fdt/fdt_pmu.o
-libsbiutils-objs-y += fdt/fdt_helper.o
-libsbiutils-objs-y += fdt/fdt_fixup.o
+libsbiutils-objs-$(CONFIG_FDT_DOMAIN) += fdt/fdt_domain.o
+libsbiutils-objs-$(CONFIG_FDT_PMU) += fdt/fdt_pmu.o
+libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_helper.o
+libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_fixup.o
diff --git a/lib/utils/gpio/Kconfig b/lib/utils/gpio/Kconfig
index daf7f91..38a9d75 100644
--- a/lib/utils/gpio/Kconfig
+++ b/lib/utils/gpio/Kconfig
@@ -4,6 +4,7 @@ menu "GPIO Support"
 
 config FDT_GPIO
 	bool "FDT based GPIO drivers"
+	depends on FDT
 	select GPIO
 	default n
 
diff --git a/lib/utils/i2c/Kconfig b/lib/utils/i2c/Kconfig
index 16c4453..46a3454 100644
--- a/lib/utils/i2c/Kconfig
+++ b/lib/utils/i2c/Kconfig
@@ -4,6 +4,7 @@ menu "I2C Support"
 
 config FDT_I2C
 	bool "FDT based I2C drivers"
+	depends on FDT
 	select I2C
 	default n
 
diff --git a/lib/utils/ipi/Kconfig b/lib/utils/ipi/Kconfig
index c0634d3..efc8960 100644
--- a/lib/utils/ipi/Kconfig
+++ b/lib/utils/ipi/Kconfig
@@ -4,6 +4,7 @@ menu "IPI Device Support"
 
 config FDT_IPI
 	bool "FDT based ipi drivers"
+	depends on FDT
 	default n
 
 if FDT_IPI
diff --git a/lib/utils/irqchip/Kconfig b/lib/utils/irqchip/Kconfig
index 6a7e297..7a71388 100644
--- a/lib/utils/irqchip/Kconfig
+++ b/lib/utils/irqchip/Kconfig
@@ -4,6 +4,7 @@ menu "Interrupt Controller Support"
 
 config FDT_IRQCHIP
 	bool "FDT based interrupt controller drivers"
+	depends on FDT
 	default n
 
 if FDT_IRQCHIP
diff --git a/platform/generic/Kconfig b/lib/utils/libfdt/Kconfig
similarity index 57%
copy from platform/generic/Kconfig
copy to lib/utils/libfdt/Kconfig
index 3eab282..d1cecf8 100644
--- a/platform/generic/Kconfig
+++ b/lib/utils/libfdt/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: BSD-2-Clause
 
-config PLATFORM_GENERIC
+config LIBFDT
 	bool
-	default y
+	default n
diff --git a/lib/utils/libfdt/objects.mk b/lib/utils/libfdt/objects.mk
index 8c060df..0e01b54 100644
--- a/lib/utils/libfdt/objects.mk
+++ b/lib/utils/libfdt/objects.mk
@@ -12,5 +12,5 @@ libfdt_files = fdt.o fdt_addresses.o fdt_check.o fdt_empty_tree.o fdt_ro.o fdt_r
 $(foreach file, $(libfdt_files), \
         $(eval CFLAGS_$(file) = -I$(src)/../../utils/libfdt))
 
-libsbiutils-objs-y += $(addprefix libfdt/,$(libfdt_files))
+libsbiutils-objs-$(CONFIG_LIBFDT) += $(addprefix libfdt/,$(libfdt_files))
 libsbiutils-genflags-y  += -I$(libsbiutils_dir)/libfdt/
diff --git a/lib/utils/reset/Kconfig b/lib/utils/reset/Kconfig
index 71996cb..2e83ff6 100644
--- a/lib/utils/reset/Kconfig
+++ b/lib/utils/reset/Kconfig
@@ -4,6 +4,7 @@ menu "System Reset Support"
 
 config FDT_RESET
 	bool "FDT based reset drivers"
+	depends on FDT
 	default n
 
 if FDT_RESET
diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
index bf37e34..152060d 100644
--- a/lib/utils/serial/Kconfig
+++ b/lib/utils/serial/Kconfig
@@ -4,6 +4,7 @@ menu "Serial Device Support"
 
 config FDT_SERIAL
 	bool "FDT based serial drivers"
+	depends on FDT
 	default n
 
 if FDT_SERIAL
diff --git a/lib/utils/timer/Kconfig b/lib/utils/timer/Kconfig
index 0a1c727..23c48c5 100644
--- a/lib/utils/timer/Kconfig
+++ b/lib/utils/timer/Kconfig
@@ -4,6 +4,7 @@ menu "Timer Device Support"
 
 config FDT_TIMER
 	bool "FDT based timer drivers"
+	depends on FDT
 	default n
 
 if FDT_TIMER
diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
index 87deab0..d57f19f 100644
--- a/platform/andes/ae350/Kconfig
+++ b/platform/andes/ae350/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_ANDES_AE350
 	bool
+	select FDT
 	select IRQCHIP_PLIC
 	select SERIAL_UART8250
 	default y
diff --git a/platform/fpga/ariane/Kconfig b/platform/fpga/ariane/Kconfig
index 5a720d9..e1f118b 100644
--- a/platform/fpga/ariane/Kconfig
+++ b/platform/fpga/ariane/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_ARIANE_FPGA
 	bool
+	select FDT
 	select IPI_MSWI
 	select IRQCHIP_PLIC
 	select SERIAL_UART8250
diff --git a/platform/fpga/openpiton/Kconfig b/platform/fpga/openpiton/Kconfig
index 973906e..bc9c86e 100644
--- a/platform/fpga/openpiton/Kconfig
+++ b/platform/fpga/openpiton/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_OPENPITON_FPGA
 	bool
+	select FDT
 	select IPI_MSWI
 	select IRQCHIP_PLIC
 	select SERIAL_UART8250
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 3eab282..c1a77b3 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -2,4 +2,7 @@
 
 config PLATFORM_GENERIC
 	bool
+	select FDT
+	select FDT_DOMAIN
+	select FDT_PMU
 	default y
diff --git a/platform/kendryte/k210/Kconfig b/platform/kendryte/k210/Kconfig
index 2a1daaa..5bf5973 100644
--- a/platform/kendryte/k210/Kconfig
+++ b/platform/kendryte/k210/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_KENDRYTE_K210
 	bool
+	select FDT
 	select IPI_MSWI
 	select IRQCHIP_PLIC
 	select SERIAL_SIFIVE
diff --git a/platform/nuclei/ux600/Kconfig b/platform/nuclei/ux600/Kconfig
index 464802e..84d74e8 100644
--- a/platform/nuclei/ux600/Kconfig
+++ b/platform/nuclei/ux600/Kconfig
@@ -2,6 +2,7 @@
 
 config PLATFORM_NUCLEI_UX600
 	bool
+	select FDT
 	select IPI_MSWI
 	select IRQCHIP_PLIC
 	select SERIAL_SIFIVE
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 5498a1f..2b02734 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -8,7 +8,6 @@
  *   hqfang <578567190@qq.com>
  */
 
-#include <libfdt.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/riscv_encoding.h>
-- 
2.34.1


