From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 13 Oct 2022 10:29:45 +0800
Subject: [PATCH v3 07/13] lib: utils/timer: Add Andes fdt timer support
In-Reply-To: <20221013022951.5206-1-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com>
Message-ID: <20221013022951.5206-8-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since we can get the PLMT base address and timer frequency from
device tree, move plmt timer device to fdt timer framework.

dts example (Quad-core AX45MP):

  cpus {
      ...
      timebase-frequency = <0x3938700>;
      ...
  }
  soc {
      ...
      plmt0 at e6000000 {
          compatible = "andestech,plmt0";
          reg = <0x00 0xe6000000 0x00 0x100000>;
          interrupts-extended = <&cpu0_intc 0x07
                                 &cpu1_intc 0x07
                                 &cpu2_intc 0x07
                                 &cpu3_intc 0x07>;
      };
      ...
  }

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v2 -> v3
  - Use sbi_domain_root_add_memrange() to add PLMT region to root domain
---
 include/sbi_utils/fdt/fdt_helper.h   |   3 +
 include/sbi_utils/timer/andes_plmt.h |  33 +++++++++
 lib/utils/fdt/fdt_helper.c           |  54 ++++++++++++++
 lib/utils/timer/Kconfig              |   9 +++
 lib/utils/timer/andes_plmt.c         |  54 ++++++++++++++
 lib/utils/timer/fdt_timer_plmt.c     |  79 ++++++++++++++++++++
 lib/utils/timer/objects.mk           |   4 +
 platform/andes/ae350/Kconfig         |   2 +
 platform/andes/ae350/objects.mk      |   2 +-
 platform/andes/ae350/platform.c      |  19 +----
 platform/andes/ae350/platform.h      |   2 -
 platform/andes/ae350/plmt.c          | 107 ---------------------------
 platform/andes/ae350/plmt.h          |  17 -----
 13 files changed, 241 insertions(+), 144 deletions(-)
 create mode 100644 include/sbi_utils/timer/andes_plmt.h
 create mode 100644 lib/utils/timer/andes_plmt.c
 create mode 100644 lib/utils/timer/fdt_timer_plmt.c
 delete mode 100644 platform/andes/ae350/plmt.c
 delete mode 100644 platform/andes/ae350/plmt.h

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index bcd4996..7ef63c9 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -95,6 +95,9 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 			  unsigned long *out_addr2, unsigned long *out_size2,
 			  u32 *out_first_hartid, u32 *out_hart_count);
 
+int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
+			  unsigned long *plmt_size, u32 *hart_count);
+
 int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
 			  const char *compatible);
 
diff --git a/include/sbi_utils/timer/andes_plmt.h b/include/sbi_utils/timer/andes_plmt.h
new file mode 100644
index 0000000..427dc78
--- /dev/null
+++ b/include/sbi_utils/timer/andes_plmt.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Andes Technology Corporation
+ *
+ * Authors:
+ *   Zong Li <zong@andestech.com>
+ *   Nylon Chen <nylon7@andestech.com>
+ *   Yu Chien Peter Lin <peterlin@andestech.com>
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_timer.h>
+
+#ifndef __TIMER_ANDES_PLMT_H__
+#define __TIMER_ANDES_PLMT_H__
+
+#define DEFAULT_AE350_PLMT_FREQ 60000000
+#define PLMT_REGION_ALIGN 0x1000
+
+struct plmt_data {
+	u32 hart_count;
+	unsigned long size;
+	volatile u64 *time_val;
+	volatile u64 *time_cmp;
+};
+
+u64 plmt_timer_value(void);
+void plmt_timer_event_stop(void);
+void plmt_timer_event_start(u64 next_event);
+
+#endif /* __TIMER_ANDES_PLMT_H__ */
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 6a75d6f..ce52fca 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -835,6 +835,60 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 	return 0;
 }
 
+int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
+			  unsigned long *plmt_size, u32 *hart_count)
+{
+	const fdt32_t *val;
+	int rc, i, count;
+	uint64_t reg_addr, reg_size, cpu_offset, cpu_intc_offset;
+	u32 phandle, hwirq, hartid, hcount;
+
+	if (nodeoffset < 0 || !fdt || !plmt_base ||
+	    !hart_count || !plmt_size)
+		return SBI_EINVAL;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
+	if (rc < 0 || !plmt_base || !plmt_size)
+		return SBI_ENODEV;
+	*plmt_base = reg_addr;
+	*plmt_size = reg_size;
+
+	val = fdt_getprop(fdt, nodeoffset, "interrupts-extended", &count);
+	if (!val || count < sizeof(fdt32_t))
+		return 0;
+	count = count / sizeof(fdt32_t);
+
+	hcount = 0;
+	for (i = 0; i < (count / 2); i++) {
+		phandle = fdt32_to_cpu(val[2 * i]);
+		hwirq = fdt32_to_cpu(val[2 * i + 1]);
+
+		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
+		if (cpu_intc_offset < 0)
+			continue;
+
+		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
+		if (cpu_intc_offset < 0)
+			continue;
+
+		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+
+		if (rc)
+			continue;
+
+		if (SBI_HARTMASK_MAX_BITS <= hartid)
+			continue;
+
+		if (hwirq == IRQ_M_TIMER)
+			hcount++;
+	}
+
+	*hart_count = hcount;
+
+	return 0;
+}
+
 int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
 			  const char *compatible)
 {
diff --git a/lib/utils/timer/Kconfig b/lib/utils/timer/Kconfig
index 23c48c5..ba211b6 100644
--- a/lib/utils/timer/Kconfig
+++ b/lib/utils/timer/Kconfig
@@ -14,10 +14,19 @@ config FDT_TIMER_MTIMER
 	select TIMER_MTIMER
 	default n
 
+config FDT_TIMER_PLMT
+	bool "Andes PLMT FDT driver"
+	select TIMER_PLMT
+	default n
+
 endif
 
 config TIMER_MTIMER
 	bool "ACLINT MTIMER support"
 	default n
 
+config TIMER_PLMT
+	bool "Andes PLMT support"
+	default n
+
 endmenu
diff --git a/lib/utils/timer/andes_plmt.c b/lib/utils/timer/andes_plmt.c
new file mode 100644
index 0000000..ea4f311
--- /dev/null
+++ b/lib/utils/timer/andes_plmt.c
@@ -0,0 +1,54 @@
+#include <sbi_utils/timer/andes_plmt.h>
+
+struct plmt_data plmt;
+
+u64 plmt_timer_value(void)
+{
+#if __riscv_xlen == 64
+	return readq_relaxed(plmt.time_val);
+#else
+	u32 lo, hi;
+
+	do {
+		hi = readl_relaxed((void *)plmt.time_val + 0x04);
+		lo = readl_relaxed(plmt.time_val);
+	} while (hi != readl_relaxed((void *)plmt.time_val + 0x04));
+
+	return ((u64)hi << 32) | (u64)lo;
+#endif
+}
+
+void plmt_timer_event_stop(void)
+{
+	u32 target_hart = current_hartid();
+
+	if (plmt.hart_count <= target_hart)
+		ebreak();
+
+	/* Clear PLMT Time Compare */
+#if __riscv_xlen == 64
+	writeq_relaxed(-1ULL, &plmt.time_cmp[target_hart]);
+#else
+	writel_relaxed(-1UL, &plmt.time_cmp[target_hart]);
+	writel_relaxed(-1UL, (void *)(&plmt.time_cmp[target_hart]) + 0x04);
+#endif
+}
+
+void plmt_timer_event_start(u64 next_event)
+{
+	u32 target_hart = current_hartid();
+
+	if (plmt.hart_count <= target_hart)
+		ebreak();
+
+	/* Program PLMT Time Compare */
+#if __riscv_xlen == 64
+	writeq_relaxed(next_event, &plmt.time_cmp[target_hart]);
+#else
+	u32 mask = -1UL;
+
+	writel_relaxed(next_event & mask, &plmt.time_cmp[target_hart]);
+	writel_relaxed(next_event >> 32,
+		       (void *)(&plmt.time_cmp[target_hart]) + 0x04);
+#endif
+}
diff --git a/lib/utils/timer/fdt_timer_plmt.c b/lib/utils/timer/fdt_timer_plmt.c
new file mode 100644
index 0000000..8947fa5
--- /dev/null
+++ b/lib/utils/timer/fdt_timer_plmt.c
@@ -0,0 +1,79 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Andes Technology Corporation
+ *
+ * Authors:
+ *   Yu Chien Peter Lin <peterlin@andestech.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_domain.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/timer/fdt_timer.h>
+#include <sbi_utils/timer/andes_plmt.h>
+
+extern struct plmt_data plmt;
+
+static struct sbi_timer_device plmt_timer = {
+	.name		   = "andes_plmt",
+	.timer_freq	   = DEFAULT_AE350_PLMT_FREQ,
+	.timer_value	   = plmt_timer_value,
+	.timer_event_start = plmt_timer_event_start,
+	.timer_event_stop  = plmt_timer_event_stop
+};
+
+static int plmt_warm_timer_init(void)
+{
+	if (!plmt.time_val)
+		return SBI_ENODEV;
+
+	plmt_timer_event_stop();
+
+	return 0;
+}
+
+static int plmt_cold_timer_init(void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
+	int rc;
+	unsigned long freq, plmt_base;
+
+	rc = fdt_parse_plmt_node(fdt, nodeoff, &plmt_base, &plmt.size,
+				 &plmt.hart_count);
+	if (rc)
+		return rc;
+
+	plmt.time_val = (u64 *)plmt_base;
+	plmt.time_cmp = (u64 *)(plmt_base + 0x8);
+
+	rc = fdt_parse_timebase_frequency(fdt, &freq);
+	if (rc)
+		return rc;
+
+	plmt_timer.timer_freq = freq;
+
+	/* Add PLMT region to the root domain */
+	rc = sbi_domain_root_add_memrange(
+		plmt_base, plmt.size, PLMT_REGION_ALIGN,
+		SBI_DOMAIN_MEMREGION_MMIO | SBI_DOMAIN_MEMREGION_READABLE);
+	if (rc)
+		return rc;
+
+	sbi_timer_set_device(&plmt_timer);
+
+	return 0;
+}
+
+static const struct fdt_match timer_plmt_match[] = {
+	{ .compatible = "andestech,plmt0" },
+	{},
+};
+
+struct fdt_timer fdt_timer_plmt = {
+	.match_table = timer_plmt_match,
+	.cold_init   = plmt_cold_timer_init,
+	.warm_init   = plmt_warm_timer_init,
+	.exit	     = NULL,
+};
diff --git a/lib/utils/timer/objects.mk b/lib/utils/timer/objects.mk
index 7f5f3ce..9360a76 100644
--- a/lib/utils/timer/objects.mk
+++ b/lib/utils/timer/objects.mk
@@ -8,9 +8,13 @@
 #
 
 libsbiutils-objs-$(CONFIG_TIMER_MTIMER) += timer/aclint_mtimer.o
+libsbiutils-objs-$(CONFIG_TIMER_PLMT) += timer/andes_plmt.o
 
 libsbiutils-objs-$(CONFIG_FDT_TIMER) += timer/fdt_timer.o
 libsbiutils-objs-$(CONFIG_FDT_TIMER) += timer/fdt_timer_drivers.o
 
 carray-fdt_timer_drivers-$(CONFIG_FDT_TIMER_MTIMER) += fdt_timer_mtimer
 libsbiutils-objs-$(CONFIG_FDT_TIMER_MTIMER) += timer/fdt_timer_mtimer.o
+
+carray-fdt_timer_drivers-$(CONFIG_FDT_TIMER_PLMT) += fdt_timer_plmt
+libsbiutils-objs-$(CONFIG_FDT_TIMER_PLMT) += timer/fdt_timer_plmt.o
diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
index 8dd8ebe..f6f50eb 100644
--- a/platform/andes/ae350/Kconfig
+++ b/platform/andes/ae350/Kconfig
@@ -6,6 +6,8 @@ config PLATFORM_ANDES_AE350
 	select IRQCHIP_PLIC
 	select FDT_SERIAL
 	select FDT_SERIAL_UART8250
+	select FDT_TIMER
+	select FDT_TIMER_PLMT
 	default y
 
 if PLATFORM_ANDES_AE350
diff --git a/platform/andes/ae350/objects.mk b/platform/andes/ae350/objects.mk
index 80f0737..1ccb894 100644
--- a/platform/andes/ae350/objects.mk
+++ b/platform/andes/ae350/objects.mk
@@ -15,7 +15,7 @@ platform-asflags-y =
 platform-ldflags-y =
 
 # Objects to build
-platform-objs-y += cache.o platform.o plicsw.o plmt.o
+platform-objs-y += cache.o platform.o plicsw.o
 
 # Blobs to build
 FW_TEXT_START=0x00000000
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 04428d1..79736c0 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -19,9 +19,9 @@
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/irqchip/plic.h>
 #include <sbi_utils/serial/fdt_serial.h>
+#include <sbi_utils/timer/fdt_timer.h>
 #include "platform.h"
 #include "plicsw.h"
-#include "plmt.h"
 #include "cache.h"
 
 static struct plic_data plic = {
@@ -81,21 +81,6 @@ static int ae350_ipi_init(bool cold_boot)
 	return plicsw_warm_ipi_init();
 }
 
-/* Initialize platform timer for current HART. */
-static int ae350_timer_init(bool cold_boot)
-{
-	int ret;
-
-	if (cold_boot) {
-		ret = plmt_cold_timer_init(AE350_PLMT_ADDR,
-					   AE350_HART_COUNT);
-		if (ret)
-			return ret;
-	}
-
-	return plmt_warm_timer_init();
-}
-
 /* Vendor-Specific SBI handler */
 static int ae350_vendor_ext_provider(long extid, long funcid,
 	const struct sbi_trap_regs *regs, unsigned long *out_value,
@@ -150,7 +135,7 @@ const struct sbi_platform_operations platform_ops = {
 
 	.ipi_init     = ae350_ipi_init,
 
-	.timer_init	   = ae350_timer_init,
+	.timer_init	   = fdt_timer_init,
 
 	.vendor_ext_provider = ae350_vendor_ext_provider
 };
diff --git a/platform/andes/ae350/platform.h b/platform/andes/ae350/platform.h
index c699b7f..6a29fe5 100644
--- a/platform/andes/ae350/platform.h
+++ b/platform/andes/ae350/platform.h
@@ -18,8 +18,6 @@
 
 #define AE350_PLICSW_ADDR		0xe6400000
 
-#define AE350_PLMT_ADDR			0xe6000000
-
 #define AE350_L2C_ADDR			0xe0500000
 
 /*Memory and Miscellaneous Registers*/
diff --git a/platform/andes/ae350/plmt.c b/platform/andes/ae350/plmt.c
deleted file mode 100644
index 54dcb94..0000000
--- a/platform/andes/ae350/plmt.c
+++ /dev/null
@@ -1,107 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Andes Technology Corporation
- *
- * Authors:
- *   Zong Li <zong@andestech.com>
- *   Nylon Chen <nylon7@andestech.com>
- */
-
-#include <sbi/riscv_asm.h>
-#include <sbi/riscv_io.h>
-#include <sbi/sbi_timer.h>
-
-static u32 plmt_time_hart_count;
-static volatile void *plmt_time_base;
-static volatile u64 *plmt_time_val;
-static volatile u64 *plmt_time_cmp;
-
-static u64 plmt_timer_value(void)
-{
-#if __riscv_xlen == 64
-	return readq_relaxed(plmt_time_val);
-#else
-	u32 lo, hi;
-
-	do {
-		hi = readl_relaxed((void *)plmt_time_val + 0x04);
-		lo = readl_relaxed(plmt_time_val);
-	} while (hi != readl_relaxed((void *)plmt_time_val + 0x04));
-
-	return ((u64)hi << 32) | (u64)lo;
-#endif
-}
-
-static void plmt_timer_event_stop(void)
-{
-	u32 target_hart = current_hartid();
-
-	if (plmt_time_hart_count <= target_hart)
-		return;
-
-	/* Clear PLMT Time Compare */
-#if __riscv_xlen == 64
-	writeq_relaxed(-1ULL, &plmt_time_cmp[target_hart]);
-#else
-	writel_relaxed(-1UL, &plmt_time_cmp[target_hart]);
-	writel_relaxed(-1UL, (void *)(&plmt_time_cmp[target_hart]) + 0x04);
-#endif
-}
-
-static void plmt_timer_event_start(u64 next_event)
-{
-	u32 target_hart = current_hartid();
-
-	if (plmt_time_hart_count <= target_hart)
-		return;
-
-	/* Program PLMT Time Compare */
-#if __riscv_xlen == 64
-	writeq_relaxed(next_event, &plmt_time_cmp[target_hart]);
-#else
-	u32 mask = -1UL;
-
-	writel_relaxed(next_event & mask, &plmt_time_cmp[target_hart]);
-	writel_relaxed(next_event >> 32,
-		       (void *)(&plmt_time_cmp[target_hart]) + 0x04);
-#endif
-
-}
-
-static struct sbi_timer_device plmt_timer = {
-	.name = "ae350_plmt",
-	.timer_value = plmt_timer_value,
-	.timer_event_start = plmt_timer_event_start,
-	.timer_event_stop = plmt_timer_event_stop
-};
-
-int plmt_warm_timer_init(void)
-{
-	u32 target_hart = current_hartid();
-
-	if (plmt_time_hart_count <= target_hart || !plmt_time_base)
-		return -1;
-
-	/* Clear PLMT Time Compare */
-#if __riscv_xlen == 64
-	writeq_relaxed(-1ULL, &plmt_time_cmp[target_hart]);
-#else
-	writel_relaxed(-1UL, &plmt_time_cmp[target_hart]);
-	writel_relaxed(-1UL, (void *)(&plmt_time_cmp[target_hart]) + 0x04);
-#endif
-
-	return 0;
-}
-
-int plmt_cold_timer_init(unsigned long base, u32 hart_count)
-{
-	plmt_time_hart_count = hart_count;
-	plmt_time_base	     = (void *)base;
-	plmt_time_val        = (u64 *)(plmt_time_base);
-	plmt_time_cmp        = (u64 *)(plmt_time_base + 0x8);
-
-	sbi_timer_set_device(&plmt_timer);
-
-	return 0;
-}
diff --git a/platform/andes/ae350/plmt.h b/platform/andes/ae350/plmt.h
deleted file mode 100644
index db093e0..0000000
--- a/platform/andes/ae350/plmt.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Andes Technology Corporation
- *
- * Authors:
- *   Zong Li <zong@andestech.com>
- */
-
-#ifndef _AE350_PLMT_H_
-#define _AE350_PLMT_H_
-
-int plmt_warm_timer_init(void);
-
-int plmt_cold_timer_init(unsigned long base, u32 hart_count);
-
-#endif /* _AE350_PLMT_H_ */
-- 
2.34.1


