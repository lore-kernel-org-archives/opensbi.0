From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 12 Dec 2023 15:29:23 +0530
Subject: [PATCH v2 3/6] lib: utils/irqchip: Add shared MMIO region for PLIC in root domain
In-Reply-To: <20231212095926.13371-1-apatel@ventanamicro.com>
References: <20231212095926.13371-1-apatel@ventanamicro.com>
Message-ID: <20231212095926.13371-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On platforms with Smepmp, the MMIO regions accessed by M-mode need
to be explicitly marked with M-mode only read/write or shared (both
(M-mode and S-mode) read/write permission.

If the above is not done then runtime PLIC access from M-mode on
platforms with Smepmp will result in access fault when further
results in CPU hotplug not working.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/irqchip/plic.h   | 1 +
 lib/utils/fdt/fdt_helper.c         | 1 +
 lib/utils/irqchip/plic.c           | 6 +++++-
 platform/fpga/ariane/platform.c    | 3 +++
 platform/fpga/openpiton/platform.c | 3 +++
 platform/kendryte/k210/platform.c  | 1 +
 platform/kendryte/k210/platform.h  | 1 +
 platform/nuclei/ux600/platform.c   | 3 +++
 platform/template/platform.c       | 3 +++
 9 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
index 112a714..2eda631 100644
--- a/include/sbi_utils/irqchip/plic.h
+++ b/include/sbi_utils/irqchip/plic.h
@@ -14,6 +14,7 @@
 
 struct plic_data {
 	unsigned long addr;
+	unsigned long size;
 	unsigned long num_src;
 };
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 78c1f38..df74adb 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -878,6 +878,7 @@ int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic)
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
 	plic->addr = reg_addr;
+	plic->size = reg_size;
 
 	val = fdt_getprop(fdt, nodeoffset, "riscv,ndev", &len);
 	if (len > 0)
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index d633514..193e320 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -10,7 +10,9 @@
 
 #include <sbi/riscv_io.h>
 #include <sbi/riscv_encoding.h>
+#include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_string.h>
 #include <sbi_utils/irqchip/plic.h>
@@ -171,5 +173,7 @@ int plic_cold_irqchip_init(const struct plic_data *plic)
 	for (i = 1; i <= plic->num_src; i++)
 		plic_set_priority(plic, i, 0);
 
-	return 0;
+	return sbi_domain_root_add_memrange(plic->addr, plic->size, BIT(20),
+					(SBI_DOMAIN_MEMREGION_MMIO |
+					 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 }
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 975528f..8be5e6c 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -25,6 +25,8 @@
 #define ARIANE_UART_REG_WIDTH			4
 #define ARIANE_UART_REG_OFFSET			0
 #define ARIANE_PLIC_ADDR			0xc000000
+#define ARIANE_PLIC_SIZE			(0x200000 + \
+						 (ARIANE_HART_COUNT * 0x1000))
 #define ARIANE_PLIC_NUM_SOURCES			3
 #define ARIANE_HART_COUNT			1
 #define ARIANE_CLINT_ADDR			0x2000000
@@ -36,6 +38,7 @@
 
 static struct plic_data plic = {
 	.addr = ARIANE_PLIC_ADDR,
+	.size = ARIANE_PLIC_SIZE,
 	.num_src = ARIANE_PLIC_NUM_SOURCES,
 };
 
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index e59dc99..2317a89 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -24,6 +24,8 @@
 #define OPENPITON_DEFAULT_UART_REG_WIDTH	1
 #define OPENPITON_DEFAULT_UART_REG_OFFSET	0
 #define OPENPITON_DEFAULT_PLIC_ADDR		0xfff1100000
+#define OPENPITON_DEFAULT_PLIC_SIZE		(0x200000 + \
+				(OPENPITON_DEFAULT_HART_COUNT * 0x1000))
 #define OPENPITON_DEFAULT_PLIC_NUM_SOURCES	2
 #define OPENPITON_DEFAULT_HART_COUNT		3
 #define OPENPITON_DEFAULT_CLINT_ADDR		0xfff1020000
@@ -40,6 +42,7 @@ static struct platform_uart_data uart = {
 };
 static struct plic_data plic = {
 	.addr = OPENPITON_DEFAULT_PLIC_ADDR,
+	.size = OPENPITON_DEFAULT_PLIC_SIZE,
 	.num_src = OPENPITON_DEFAULT_PLIC_NUM_SOURCES,
 };
 
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index 637a217..27b23f7 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -32,6 +32,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 
 static struct plic_data plic = {
 	.addr = K210_PLIC_BASE_ADDR,
+	.size = K210_PLIC_BASE_SIZE,
 	.num_src = K210_PLIC_NUM_SOURCES,
 };
 
diff --git a/platform/kendryte/k210/platform.h b/platform/kendryte/k210/platform.h
index be52aa3..9417403 100644
--- a/platform/kendryte/k210/platform.h
+++ b/platform/kendryte/k210/platform.h
@@ -27,6 +27,7 @@
 #define K210_ACLINT_MTIMER_ADDR \
 		(K210_CLINT_BASE_ADDR + CLINT_MTIMER_OFFSET)
 #define K210_PLIC_BASE_ADDR	0x0C000000ULL
+#define K210_PLIC_BASE_SIZE	(0x200000ULL + (K210_HART_COUNT * 0x1000))
 
 /* Registers */
 #define K210_PLL0		0x08
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 6fd6cd7..f688b50 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -39,6 +39,8 @@
 					 CLINT_MTIMER_OFFSET)
 
 #define UX600_PLIC_ADDR			0x8000000
+#define UX600_PLIC_SIZE			(0x200000 + \
+					 (UX600_HART_COUNT * 0x1000))
 #define UX600_PLIC_NUM_SOURCES		0x35
 #define UX600_PLIC_NUM_PRIORITIES	7
 
@@ -63,6 +65,7 @@ static u32 ux600_clk_freq = 8000000;
 
 static struct plic_data plic = {
 	.addr = UX600_PLIC_ADDR,
+	.size = UX600_PLIC_SIZE,
 	.num_src = UX600_PLIC_NUM_SOURCES,
 };
 
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 86381ca..4b3f2ac 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -19,6 +19,8 @@
 #include <sbi_utils/timer/aclint_mtimer.h>
 
 #define PLATFORM_PLIC_ADDR		0xc000000
+#define PLATFORM_PLIC_SIZE		(0x200000 + \
+					 (PLATFORM_HART_COUNT * 0x1000))
 #define PLATFORM_PLIC_NUM_SOURCES	128
 #define PLATFORM_HART_COUNT		4
 #define PLATFORM_CLINT_ADDR		0x2000000
@@ -33,6 +35,7 @@
 
 static struct plic_data plic = {
 	.addr = PLATFORM_PLIC_ADDR,
+	.size = PLATFORM_PLIC_SIZE,
 	.num_src = PLATFORM_PLIC_NUM_SOURCES,
 };
 
-- 
2.34.1


