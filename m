From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Jul 2022 18:48:31 +0530
Subject: [PATCH v3 09/15] lib: utils/irqchip: Use kconfig for enabling/disabling drivers
In-Reply-To: <20220719131837.2389630-1-apatel@ventanamicro.com>
References: <20220719131837.2389630-1-apatel@ventanamicro.com>
Message-ID: <20220719131837.2389630-10-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update irqchip drivers makefile to use kconfig for enabling/disabling
drivers. To avoid compile errors, we also enable appropriate irqchip
drivers for each platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/irqchip/fdt_irqchip.h | 10 +++++++
 include/sbi_utils/irqchip/imsic.h       | 10 +++++++
 lib/utils/Kconfig                       |  2 ++
 lib/utils/irqchip/Kconfig               | 40 +++++++++++++++++++++++++
 lib/utils/irqchip/objects.mk            | 22 +++++++-------
 platform/andes/ae350/Kconfig            |  1 +
 platform/fpga/ariane/Kconfig            |  1 +
 platform/fpga/openpiton/Kconfig         |  1 +
 platform/generic/configs/defconfig      |  4 +++
 platform/kendryte/k210/Kconfig          |  1 +
 platform/nuclei/ux600/Kconfig           |  1 +
 platform/template/Kconfig               |  1 +
 12 files changed, 83 insertions(+), 11 deletions(-)
 create mode 100644 lib/utils/irqchip/Kconfig

diff --git a/include/sbi_utils/irqchip/fdt_irqchip.h b/include/sbi_utils/irqchip/fdt_irqchip.h
index 13ef6f7..63e9fd9 100644
--- a/include/sbi_utils/irqchip/fdt_irqchip.h
+++ b/include/sbi_utils/irqchip/fdt_irqchip.h
@@ -12,6 +12,8 @@
 
 #include <sbi/sbi_types.h>
 
+#ifdef CONFIG_FDT_IRQCHIP
+
 struct fdt_irqchip {
 	const struct fdt_match *match_table;
 	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
@@ -23,4 +25,12 @@ void fdt_irqchip_exit(void);
 
 int fdt_irqchip_init(bool cold_boot);
 
+#else
+
+static inline void fdt_irqchip_exit(void) { }
+
+static inline int fdt_irqchip_init(bool cold_boot) { return 0; }
+
+#endif
+
 #endif
diff --git a/include/sbi_utils/irqchip/imsic.h b/include/sbi_utils/irqchip/imsic.h
index cffcb5a..e295771 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -33,6 +33,8 @@ struct imsic_data {
 	struct imsic_regs regs[IMSIC_MAX_REGS];
 };
 
+#ifdef CONFIG_IRQCHIP_IMSIC
+
 int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file);
 
 struct imsic_data *imsic_get_data(u32 hartid);
@@ -47,4 +49,12 @@ int imsic_data_check(struct imsic_data *imsic);
 
 int imsic_cold_irqchip_init(struct imsic_data *imsic);
 
+#else
+
+static inline void imsic_local_irqchip_init(void) { }
+
+static inline int imsic_data_check(struct imsic_data *imsic) { return 0; }
+
+#endif
+
 #endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 50d9770..3f315fd 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -4,6 +4,8 @@ menu "Utils and Drivers Support"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/ipi/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/irqchip/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/serial/Kconfig"
diff --git a/lib/utils/irqchip/Kconfig b/lib/utils/irqchip/Kconfig
new file mode 100644
index 0000000..6a7e297
--- /dev/null
+++ b/lib/utils/irqchip/Kconfig
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "Interrupt Controller Support"
+
+config FDT_IRQCHIP
+	bool "FDT based interrupt controller drivers"
+	default n
+
+if FDT_IRQCHIP
+
+config FDT_IRQCHIP_APLIC
+	bool "Advanced Platform Level Interrupt Controller (APLIC) FDT driver"
+	select IRQCHIP_APLIC
+	default n
+
+config FDT_IRQCHIP_IMSIC
+	bool "Incoming Message Signalled Interrupt Controller (IMSIC) FDT driver"
+	select IRQCHIP_IMSIC
+	default n
+
+config FDT_IRQCHIP_PLIC
+	bool "Platform Level Interrupt Controller (PLIC) FDT driver"
+	select IRQCHIP_PLIC
+	default n
+
+endif
+
+config IRQCHIP_APLIC
+	bool "Advanced Platform Level Interrupt Controller (APLIC) support"
+	default n
+
+config IRQCHIP_IMSIC
+	bool "Incoming Message Signalled Interrupt Controller (IMSIC) support"
+	default n
+
+config IRQCHIP_PLIC
+	bool "Platform Level Interrupt Controller (PLIC) support"
+	default n
+
+endmenu
diff --git a/lib/utils/irqchip/objects.mk b/lib/utils/irqchip/objects.mk
index 7775bc4..e458891 100644
--- a/lib/utils/irqchip/objects.mk
+++ b/lib/utils/irqchip/objects.mk
@@ -7,18 +7,18 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-y += irqchip/fdt_irqchip.o
-libsbiutils-objs-y += irqchip/fdt_irqchip_drivers.o
+libsbiutils-objs-$(CONFIG_FDT_IRQCHIP) += irqchip/fdt_irqchip.o
+libsbiutils-objs-$(CONFIG_FDT_IRQCHIP) += irqchip/fdt_irqchip_drivers.o
 
-carray-fdt_irqchip_drivers-y += fdt_irqchip_aplic
-libsbiutils-objs-y += irqchip/fdt_irqchip_aplic.o
+carray-fdt_irqchip_drivers-$(CONFIG_FDT_IRQCHIP_APLIC) += fdt_irqchip_aplic
+libsbiutils-objs-$(CONFIG_FDT_IRQCHIP_APLIC) += irqchip/fdt_irqchip_aplic.o
 
-carray-fdt_irqchip_drivers-y += fdt_irqchip_imsic
-libsbiutils-objs-y += irqchip/fdt_irqchip_imsic.o
+carray-fdt_irqchip_drivers-$(CONFIG_FDT_IRQCHIP_IMSIC) += fdt_irqchip_imsic
+libsbiutils-objs-$(CONFIG_FDT_IRQCHIP_IMSIC) += irqchip/fdt_irqchip_imsic.o
 
-carray-fdt_irqchip_drivers-y += fdt_irqchip_plic
-libsbiutils-objs-y += irqchip/fdt_irqchip_plic.o
+carray-fdt_irqchip_drivers-$(CONFIG_FDT_IRQCHIP_PLIC) += fdt_irqchip_plic
+libsbiutils-objs-$(CONFIG_FDT_IRQCHIP_PLIC) += irqchip/fdt_irqchip_plic.o
 
-libsbiutils-objs-y += irqchip/aplic.o
-libsbiutils-objs-y += irqchip/imsic.o
-libsbiutils-objs-y += irqchip/plic.o
+libsbiutils-objs-$(CONFIG_IRQCHIP_APLIC) += irqchip/aplic.o
+libsbiutils-objs-$(CONFIG_IRQCHIP_IMSIC) += irqchip/imsic.o
+libsbiutils-objs-$(CONFIG_IRQCHIP_PLIC) += irqchip/plic.o
diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
index 162d19c..87deab0 100644
--- a/platform/andes/ae350/Kconfig
+++ b/platform/andes/ae350/Kconfig
@@ -2,5 +2,6 @@
 
 config PLATFORM_ANDES_AE350
 	bool
+	select IRQCHIP_PLIC
 	select SERIAL_UART8250
 	default y
diff --git a/platform/fpga/ariane/Kconfig b/platform/fpga/ariane/Kconfig
index 0bc1597..5a720d9 100644
--- a/platform/fpga/ariane/Kconfig
+++ b/platform/fpga/ariane/Kconfig
@@ -3,6 +3,7 @@
 config PLATFORM_ARIANE_FPGA
 	bool
 	select IPI_MSWI
+	select IRQCHIP_PLIC
 	select SERIAL_UART8250
 	select TIMER_MTIMER
 	default y
diff --git a/platform/fpga/openpiton/Kconfig b/platform/fpga/openpiton/Kconfig
index 0e4e3ba..973906e 100644
--- a/platform/fpga/openpiton/Kconfig
+++ b/platform/fpga/openpiton/Kconfig
@@ -3,6 +3,7 @@
 config PLATFORM_OPENPITON_FPGA
 	bool
 	select IPI_MSWI
+	select IRQCHIP_PLIC
 	select SERIAL_UART8250
 	select TIMER_MTIMER
 	default y
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index e218c32..ad66a63 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,5 +1,9 @@
 CONFIG_FDT_IPI=y
 CONFIG_FDT_IPI_MSWI=y
+CONFIG_FDT_IRQCHIP=y
+CONFIG_FDT_IRQCHIP_APLIC=y
+CONFIG_FDT_IRQCHIP_IMSIC=y
+CONFIG_FDT_IRQCHIP_PLIC=y
 CONFIG_FDT_RESET=y
 CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
diff --git a/platform/kendryte/k210/Kconfig b/platform/kendryte/k210/Kconfig
index 685a5cd..2a1daaa 100644
--- a/platform/kendryte/k210/Kconfig
+++ b/platform/kendryte/k210/Kconfig
@@ -3,6 +3,7 @@
 config PLATFORM_KENDRYTE_K210
 	bool
 	select IPI_MSWI
+	select IRQCHIP_PLIC
 	select SERIAL_SIFIVE
 	select TIMER_MTIMER
 	default y
diff --git a/platform/nuclei/ux600/Kconfig b/platform/nuclei/ux600/Kconfig
index cd995a3..464802e 100644
--- a/platform/nuclei/ux600/Kconfig
+++ b/platform/nuclei/ux600/Kconfig
@@ -3,6 +3,7 @@
 config PLATFORM_NUCLEI_UX600
 	bool
 	select IPI_MSWI
+	select IRQCHIP_PLIC
 	select SERIAL_SIFIVE
 	select TIMER_MTIMER
 	default y
diff --git a/platform/template/Kconfig b/platform/template/Kconfig
index 672b6e7..8338425 100644
--- a/platform/template/Kconfig
+++ b/platform/template/Kconfig
@@ -3,6 +3,7 @@
 config PLATFORM_TEMPLATE
 	bool
 	select IPI_MSWI
+	select IRQCHIP_PLIC
 	select SERIAL_UART8250
 	select TIMER_MTIMER
 	default y
-- 
2.34.1


