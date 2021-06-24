From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 24 Jun 2021 10:00:19 +0530
Subject: [PATCH v3 6/6] platform: Replace CLINT library usage with ACLINT
 library
In-Reply-To: <20210624043019.498627-1-anup.patel@wdc.com>
References: <20210624043019.498627-1-anup.patel@wdc.com>
Message-ID: <20210624043019.498627-7-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The ACLINT devices are backward compatible with SiFive CLINT
so we replace all CLINT library usage in various platforms
with ACLINT library. As a result of this replacement, the
CLINT library is not used by any part of OpenSBI hence we
remove it.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 include/sbi_utils/sys/clint.h      |  41 -----
 lib/utils/sys/clint.c              | 256 -----------------------------
 lib/utils/sys/objects.mk           |   1 -
 platform/fpga/ariane/platform.c    |  27 ++-
 platform/fpga/openpiton/platform.c |  33 +++-
 platform/kendryte/k210/platform.c  |  23 ++-
 platform/kendryte/k210/platform.h  |   4 +
 platform/nuclei/ux600/platform.c   |  28 +++-
 platform/template/platform.c       |  31 +++-
 9 files changed, 107 insertions(+), 337 deletions(-)
 delete mode 100644 include/sbi_utils/sys/clint.h
 delete mode 100644 lib/utils/sys/clint.c

diff --git a/include/sbi_utils/sys/clint.h b/include/sbi_utils/sys/clint.h
deleted file mode 100644
index 1e2b40b..0000000
--- a/include/sbi_utils/sys/clint.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#ifndef __SYS_CLINT_H__
-#define __SYS_CLINT_H__
-
-#include <sbi/sbi_types.h>
-
-struct clint_data {
-	/* Public details */
-	unsigned long addr;
-	u32 first_hartid;
-	u32 hart_count;
-	bool has_64bit_mmio;
-	/* Private details (initialized and used by CLINT library)*/
-	u32 *ipi;
-	struct clint_data *time_delta_reference;
-	unsigned long time_delta_computed;
-	u64 time_delta;
-	u64 *time_val;
-	u64 *time_cmp;
-	u64 (*time_rd)(volatile u64 *addr);
-	void (*time_wr)(u64 value, volatile u64 *addr);
-};
-
-int clint_warm_ipi_init(void);
-
-int clint_cold_ipi_init(struct clint_data *clint);
-
-int clint_warm_timer_init(void);
-
-int clint_cold_timer_init(struct clint_data *clint,
-			  struct clint_data *reference);
-
-#endif
diff --git a/lib/utils/sys/clint.c b/lib/utils/sys/clint.c
deleted file mode 100644
index e8c2bd9..0000000
--- a/lib/utils/sys/clint.c
+++ /dev/null
@@ -1,256 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#include <sbi/riscv_asm.h>
-#include <sbi/riscv_atomic.h>
-#include <sbi/riscv_io.h>
-#include <sbi/sbi_domain.h>
-#include <sbi/sbi_error.h>
-#include <sbi/sbi_hartmask.h>
-#include <sbi/sbi_ipi.h>
-#include <sbi/sbi_timer.h>
-#include <sbi_utils/sys/clint.h>
-
-#define CLINT_IPI_OFF		0
-#define CLINT_IPI_SIZE		0x4000
-
-#define CLINT_TIME_CMP_OFF	0x4000
-#define CLINT_TIME_CMP_SIZE	0x4000
-
-#define CLINT_TIME_VAL_OFF	0xbff8
-#define CLINT_TIME_VAL_SIZE	0x4000
-
-static struct clint_data *clint_ipi_hartid2data[SBI_HARTMASK_MAX_BITS];
-
-static void clint_ipi_send(u32 target_hart)
-{
-	struct clint_data *clint;
-
-	if (SBI_HARTMASK_MAX_BITS <= target_hart)
-		return;
-	clint = clint_ipi_hartid2data[target_hart];
-	if (!clint)
-		return;
-
-	/* Set CLINT IPI */
-	writel(1, &clint->ipi[target_hart - clint->first_hartid]);
-}
-
-static void clint_ipi_clear(u32 target_hart)
-{
-	struct clint_data *clint;
-
-	if (SBI_HARTMASK_MAX_BITS <= target_hart)
-		return;
-	clint = clint_ipi_hartid2data[target_hart];
-	if (!clint)
-		return;
-
-	/* Clear CLINT IPI */
-	writel(0, &clint->ipi[target_hart - clint->first_hartid]);
-}
-
-static struct sbi_ipi_device clint_ipi = {
-	.name = "clint",
-	.ipi_send = clint_ipi_send,
-	.ipi_clear = clint_ipi_clear
-};
-
-int clint_warm_ipi_init(void)
-{
-	/* Clear CLINT IPI for current HART */
-	clint_ipi_clear(current_hartid());
-
-	return 0;
-}
-
-int clint_cold_ipi_init(struct clint_data *clint)
-{
-	u32 i;
-	int rc;
-	struct sbi_domain_memregion reg;
-
-	if (!clint)
-		return SBI_EINVAL;
-
-	/* Initialize private data */
-	clint->ipi = (void *)clint->addr;
-
-	/* Update IPI hartid table */
-	for (i = 0; i < clint->hart_count; i++)
-		clint_ipi_hartid2data[clint->first_hartid + i] = clint;
-
-	/* Add CLINT ipi region to the root domain */
-	sbi_domain_memregion_init(clint->addr + CLINT_IPI_OFF,
-				  CLINT_IPI_SIZE,
-				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
-	rc = sbi_domain_root_add_memregion(&reg);
-	if (rc)
-		return rc;
-
-	sbi_ipi_set_device(&clint_ipi);
-
-	return 0;
-}
-
-static struct clint_data *clint_timer_hartid2data[SBI_HARTMASK_MAX_BITS];
-
-#if __riscv_xlen != 32
-static u64 clint_time_rd64(volatile u64 *addr)
-{
-	return readq_relaxed(addr);
-}
-
-static void clint_time_wr64(u64 value, volatile u64 *addr)
-{
-	writeq_relaxed(value, addr);
-}
-#endif
-
-static u64 clint_time_rd32(volatile u64 *addr)
-{
-	u32 lo, hi;
-
-	do {
-		hi = readl_relaxed((u32 *)addr + 1);
-		lo = readl_relaxed((u32 *)addr);
-	} while (hi != readl_relaxed((u32 *)addr + 1));
-
-	return ((u64)hi << 32) | (u64)lo;
-}
-
-static void clint_time_wr32(u64 value, volatile u64 *addr)
-{
-	u32 mask = -1U;
-
-	writel_relaxed(value & mask, (void *)(addr));
-	writel_relaxed(value >> 32, (void *)(addr) + 0x04);
-}
-
-static u64 clint_timer_value(void)
-{
-	struct clint_data *clint = clint_timer_hartid2data[current_hartid()];
-
-	/* Read CLINT Time Value */
-	return clint->time_rd(clint->time_val) + clint->time_delta;
-}
-
-static void clint_timer_event_stop(void)
-{
-	u32 target_hart = current_hartid();
-	struct clint_data *clint = clint_timer_hartid2data[target_hart];
-
-	/* Clear CLINT Time Compare */
-	clint->time_wr(-1ULL,
-			&clint->time_cmp[target_hart - clint->first_hartid]);
-}
-
-static void clint_timer_event_start(u64 next_event)
-{
-	u32 target_hart = current_hartid();
-	struct clint_data *clint = clint_timer_hartid2data[target_hart];
-
-	/* Program CLINT Time Compare */
-	clint->time_wr(next_event - clint->time_delta,
-		       &clint->time_cmp[target_hart - clint->first_hartid]);
-}
-
-static struct sbi_timer_device clint_timer = {
-	.name = "clint",
-	.timer_value = clint_timer_value,
-	.timer_event_start = clint_timer_event_start,
-	.timer_event_stop = clint_timer_event_stop
-};
-
-int clint_warm_timer_init(void)
-{
-	u64 v1, v2, mv;
-	u32 target_hart = current_hartid();
-	struct clint_data *reference;
-	struct clint_data *clint = clint_timer_hartid2data[target_hart];
-
-	if (!clint)
-		return SBI_ENODEV;
-
-	/*
-	 * Compute delta if reference available
-	 *
-	 * We deliberately compute time_delta in warm init so that time_delta
-	 * is computed on a HART which is going to use given CLINT. We use
-	 * atomic flag timer_delta_computed to ensure that only one HART does
-	 * time_delta computation.
-	 */
-	if (clint->time_delta_reference) {
-		reference = clint->time_delta_reference;
-		if (!atomic_raw_xchg_ulong(&clint->time_delta_computed, 1)) {
-			v1 = clint->time_rd(clint->time_val);
-			mv = reference->time_rd(reference->time_val);
-			v2 = clint->time_rd(clint->time_val);
-			clint->time_delta = mv - ((v1 / 2) + (v2 / 2));
-		}
-	}
-
-	/* Clear CLINT Time Compare */
-	clint->time_wr(-1ULL,
-		       &clint->time_cmp[target_hart - clint->first_hartid]);
-
-	return 0;
-}
-
-int clint_cold_timer_init(struct clint_data *clint,
-			  struct clint_data *reference)
-{
-	u32 i;
-	int rc;
-	struct sbi_domain_memregion reg;
-
-	if (!clint)
-		return SBI_EINVAL;
-
-	/* Initialize private data */
-	clint->time_delta_reference = reference;
-	clint->time_delta_computed = 0;
-	clint->time_delta = 0;
-	clint->time_val = (u64 *)((void *)clint->addr + CLINT_TIME_VAL_OFF);
-	clint->time_cmp = (u64 *)((void *)clint->addr + CLINT_TIME_CMP_OFF);
-	clint->time_rd = clint_time_rd32;
-	clint->time_wr = clint_time_wr32;
-
-	/* Override read/write accessors for 64bit MMIO */
-#if __riscv_xlen != 32
-	if (clint->has_64bit_mmio) {
-		clint->time_rd = clint_time_rd64;
-		clint->time_wr = clint_time_wr64;
-	}
-#endif
-
-	/* Update timer hartid table */
-	for (i = 0; i < clint->hart_count; i++)
-		clint_timer_hartid2data[clint->first_hartid + i] = clint;
-
-	/* Add CLINT mtime region to the root domain */
-	sbi_domain_memregion_init(clint->addr + CLINT_TIME_VAL_OFF,
-				  CLINT_TIME_VAL_SIZE,
-				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
-	rc = sbi_domain_root_add_memregion(&reg);
-	if (rc)
-		return rc;
-
-	/* Add CLINT timecmp region to the root domain */
-	sbi_domain_memregion_init(clint->addr + CLINT_TIME_CMP_OFF,
-				  CLINT_TIME_CMP_SIZE,
-				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
-	rc = sbi_domain_root_add_memregion(&reg);
-	if (rc)
-		return rc;
-
-	sbi_timer_set_device(&clint_timer);
-
-	return 0;
-}
diff --git a/lib/utils/sys/objects.mk b/lib/utils/sys/objects.mk
index 7878ca8..06be322 100644
--- a/lib/utils/sys/objects.mk
+++ b/lib/utils/sys/objects.mk
@@ -7,6 +7,5 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
-libsbiutils-objs-y += sys/clint.o
 libsbiutils-objs-y += sys/htif.o
 libsbiutils-objs-y += sys/sifive_test.o
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 42e43fa..0b47aa0 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -12,9 +12,10 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_platform.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
 #include <sbi_utils/irqchip/plic.h>
 #include <sbi_utils/serial/uart8250.h>
-#include <sbi_utils/sys/clint.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
 
 #define ARIANE_UART_ADDR			0x10000000
 #define ARIANE_UART_FREQ			50000000
@@ -25,14 +26,26 @@
 #define ARIANE_PLIC_NUM_SOURCES			3
 #define ARIANE_HART_COUNT			1
 #define ARIANE_CLINT_ADDR			0x2000000
+#define ARIANE_ACLINT_MSWI_ADDR			(ARIANE_CLINT_ADDR + \
+						 CLINT_MSWI_OFFSET)
+#define ARIANE_ACLINT_MTIMER_ADDR		(ARIANE_CLINT_ADDR + \
+						 CLINT_MTIMER_OFFSET)
 
 static struct plic_data plic = {
 	.addr = ARIANE_PLIC_ADDR,
 	.num_src = ARIANE_PLIC_NUM_SOURCES,
 };
 
-static struct clint_data clint = {
-	.addr = ARIANE_CLINT_ADDR,
+static struct aclint_mswi_data mswi = {
+	.addr = ARIANE_ACLINT_MSWI_ADDR,
+	.size = ACLINT_MSWI_SIZE,
+	.first_hartid = 0,
+	.hart_count = ARIANE_HART_COUNT,
+};
+
+static struct aclint_mtimer_data mtimer = {
+	.addr = ARIANE_ACLINT_MTIMER_ADDR,
+	.size = ACLINT_MTIMER_SIZE,
 	.first_hartid = 0,
 	.hart_count = ARIANE_HART_COUNT,
 	.has_64bit_mmio = TRUE,
@@ -123,12 +136,12 @@ static int ariane_ipi_init(bool cold_boot)
 	int ret;
 
 	if (cold_boot) {
-		ret = clint_cold_ipi_init(&clint);
+		ret = aclint_mswi_cold_init(&mswi);
 		if (ret)
 			return ret;
 	}
 
-	return clint_warm_ipi_init();
+	return aclint_mswi_warm_init();
 }
 
 /*
@@ -139,12 +152,12 @@ static int ariane_timer_init(bool cold_boot)
 	int ret;
 
 	if (cold_boot) {
-		ret = clint_cold_timer_init(&clint, NULL);
+		ret = aclint_mtimer_cold_init(&mtimer, NULL);
 		if (ret)
 			return ret;
 	}
 
-	return clint_warm_timer_init();
+	return aclint_mtimer_warm_init();
 }
 
 /*
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 894bfdc..57ec21b 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -12,9 +12,10 @@
 #include <sbi/sbi_platform.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
 #include <sbi_utils/irqchip/plic.h>
 #include <sbi_utils/serial/uart8250.h>
-#include <sbi_utils/sys/clint.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
 
 #define OPENPITON_DEFAULT_UART_ADDR		0xfff0c2c000
 #define OPENPITON_DEFAULT_UART_FREQ		60000000
@@ -25,6 +26,10 @@
 #define OPENPITON_DEFAULT_PLIC_NUM_SOURCES	2
 #define OPENPITON_DEFAULT_HART_COUNT		3
 #define OPENPITON_DEFAULT_CLINT_ADDR		0xfff1020000
+#define OPENPITON_DEFAULT_ACLINT_MSWI_ADDR	\
+		(OPENPITON_DEFAULT_CLINT_ADDR + CLINT_MSWI_OFFSET)
+#define OPENPITON_DEFAULT_ACLINT_MTIMER_ADDR	\
+		(OPENPITON_DEFAULT_CLINT_ADDR + CLINT_MTIMER_OFFSET)
 
 static struct platform_uart_data uart = {
 	OPENPITON_DEFAULT_UART_ADDR,
@@ -36,8 +41,16 @@ static struct plic_data plic = {
 	.num_src = OPENPITON_DEFAULT_PLIC_NUM_SOURCES,
 };
 
-static struct clint_data clint = {
-	.addr = OPENPITON_DEFAULT_CLINT_ADDR,
+static struct aclint_mswi_data mswi = {
+	.addr = OPENPITON_DEFAULT_ACLINT_MSWI_ADDR,
+	.size = ACLINT_MSWI_SIZE,
+	.first_hartid = 0,
+	.hart_count = OPENPITON_DEFAULT_HART_COUNT,
+};
+
+static struct aclint_mtimer_data mtimer = {
+	.addr = OPENPITON_DEFAULT_ACLINT_MTIMER_ADDR,
+	.size = ACLINT_MTIMER_SIZE,
 	.first_hartid = 0,
 	.hart_count = OPENPITON_DEFAULT_HART_COUNT,
 	.has_64bit_mmio = TRUE,
@@ -67,8 +80,10 @@ static int openpiton_early_init(bool cold_boot)
 		plic = plic_data;
 
 	rc = fdt_parse_compat_addr(fdt, &clint_addr, "riscv,clint0");
-	if (!rc)
-		clint.addr = clint_addr;
+	if (!rc) {
+		mswi.addr = clint_addr;
+		mtimer.addr = clint_addr + CLINT_MTIMER_OFFSET;
+	}
 
 	return 0;
 }
@@ -149,12 +164,12 @@ static int openpiton_ipi_init(bool cold_boot)
 	int ret;
 
 	if (cold_boot) {
-		ret = clint_cold_ipi_init(&clint);
+		ret = aclint_mswi_cold_init(&mswi);
 		if (ret)
 			return ret;
 	}
 
-	return clint_warm_ipi_init();
+	return aclint_mswi_warm_init();
 }
 
 /*
@@ -165,12 +180,12 @@ static int openpiton_timer_init(bool cold_boot)
 	int ret;
 
 	if (cold_boot) {
-		ret = clint_cold_timer_init(&clint, NULL);
+		ret = aclint_mtimer_cold_init(&mtimer, NULL);
 		if (ret)
 			return ret;
 	}
 
-	return clint_warm_timer_init();
+	return aclint_mtimer_warm_init();
 }
 
 /*
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index 66a0392..55c4b1e 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -14,9 +14,10 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_system.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
 #include <sbi_utils/irqchip/plic.h>
 #include <sbi_utils/serial/sifive-uart.h>
-#include <sbi_utils/sys/clint.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
 #include "platform.h"
 
 extern const char dt_k210_start[];
@@ -33,8 +34,16 @@ static struct plic_data plic = {
 	.num_src = K210_PLIC_NUM_SOURCES,
 };
 
-static struct clint_data clint = {
-	.addr = K210_CLINT_BASE_ADDR,
+static struct aclint_mswi_data mswi = {
+	.addr = K210_ACLINT_MSWI_ADDR,
+	.size = ACLINT_MSWI_SIZE,
+	.first_hartid = 0,
+	.hart_count = K210_HART_COUNT,
+};
+
+static struct aclint_mtimer_data mtimer = {
+	.addr = K210_ACLINT_MTIMER_ADDR,
+	.size = ACLINT_MTIMER_SIZE,
 	.first_hartid = 0,
 	.hart_count = K210_HART_COUNT,
 	.has_64bit_mmio = TRUE,
@@ -139,12 +148,12 @@ static int k210_ipi_init(bool cold_boot)
 	int rc;
 
 	if (cold_boot) {
-		rc = clint_cold_ipi_init(&clint);
+		rc = aclint_mswi_cold_init(&mswi);
 		if (rc)
 			return rc;
 	}
 
-	return clint_warm_ipi_init();
+	return aclint_mswi_warm_init();
 }
 
 static int k210_timer_init(bool cold_boot)
@@ -152,12 +161,12 @@ static int k210_timer_init(bool cold_boot)
 	int rc;
 
 	if (cold_boot) {
-		rc = clint_cold_timer_init(&clint, NULL);
+		rc = aclint_mtimer_cold_init(&mtimer, NULL);
 		if (rc)
 			return rc;
 	}
 
-	return clint_warm_timer_init();
+	return aclint_mtimer_warm_init();
 }
 
 const struct sbi_platform_operations platform_ops = {
diff --git a/platform/kendryte/k210/platform.h b/platform/kendryte/k210/platform.h
index e425faf..0a32530 100644
--- a/platform/kendryte/k210/platform.h
+++ b/platform/kendryte/k210/platform.h
@@ -22,6 +22,10 @@
 #define K210_SYSCTL_BASE_ADDR	0x50440000ULL
 #define K210_UART_BASE_ADDR	0x38000000ULL
 #define K210_CLINT_BASE_ADDR	0x02000000ULL
+#define K210_ACLINT_MSWI_ADDR	\
+		(K210_CLINT_BASE_ADDR + CLINT_MSWI_OFFSET)
+#define K210_ACLINT_MTIMER_ADDR \
+		(K210_CLINT_BASE_ADDR + CLINT_MTIMER_OFFSET)
 #define K210_PLIC_BASE_ADDR	0x0C000000ULL
 
 /* Registers */
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 5414316..22ca4c9 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -17,9 +17,10 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_system.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
 #include <sbi_utils/irqchip/plic.h>
 #include <sbi_utils/serial/sifive-uart.h>
-#include <sbi_utils/sys/clint.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
 
 /* clang-format off */
 
@@ -32,6 +33,10 @@
 #define UX600_NUCLEI_TIMER_MSFTRST_KEY	0x80000A5F
 /* The clint compatiable timer offset is 0x1000 against nuclei timer */
 #define UX600_CLINT_TIMER_ADDR		(UX600_NUCLEI_TIMER_ADDR + 0x1000)
+#define UX600_ACLINT_MSWI_ADDR		(UX600_CLINT_TIMER_ADDR + \
+					 CLINT_MSWI_OFFSET)
+#define UX600_ACLINT_MTIMER_ADDR	(UX600_CLINT_TIMER_ADDR + \
+					 CLINT_MTIMER_OFFSET)
 
 #define UX600_PLIC_ADDR			0x8000000
 #define UX600_PLIC_NUM_SOURCES		0x35
@@ -61,12 +66,21 @@ static struct plic_data plic = {
 	.num_src = UX600_PLIC_NUM_SOURCES,
 };
 
-static struct clint_data clint = {
-	.addr = UX600_CLINT_TIMER_ADDR,
+static struct aclint_mswi_data mswi = {
+	.addr = UX600_ACLINT_MSWI_ADDR,
+	.size = ACLINT_MSWI_SIZE,
+	.first_hartid = 0,
+	.hart_count = UX600_HART_COUNT,
+};
+
+static struct aclint_mtimer_data mtimer = {
+	.addr = UX600_ACLINT_MTIMER_ADDR,
+	.size = ACLINT_MTIMER_SIZE,
 	.first_hartid = 0,
 	.hart_count = UX600_HART_COUNT,
 	.has_64bit_mmio = TRUE,
 };
+
 static u32 measure_cpu_freq(u32 n)
 {
 	u32 start_mtime, delta_mtime;
@@ -188,12 +202,12 @@ static int ux600_ipi_init(bool cold_boot)
 	int rc;
 
 	if (cold_boot) {
-		rc = clint_cold_ipi_init(&clint);
+		rc = aclint_mswi_cold_init(&mswi);
 		if (rc)
 			return rc;
 	}
 
-	return clint_warm_ipi_init();
+	return aclint_mswi_warm_init();
 }
 
 static int ux600_timer_init(bool cold_boot)
@@ -201,12 +215,12 @@ static int ux600_timer_init(bool cold_boot)
 	int rc;
 
 	if (cold_boot) {
-		rc = clint_cold_timer_init(&clint, NULL);
+		rc = aclint_mtimer_cold_init(&mtimer, NULL);
 		if (rc)
 			return rc;
 	}
 
-	return clint_warm_timer_init();
+	return aclint_mtimer_warm_init();
 }
 
 const struct sbi_platform_operations platform_ops = {
diff --git a/platform/template/platform.c b/platform/template/platform.c
index d407fd5..3f09d98 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -13,14 +13,19 @@
  * Include these files as needed.
  * See config.mk PLATFORM_xxx configuration parameters.
  */
+#include <sbi_utils/ipi/aclint_mswi.h>
 #include <sbi_utils/irqchip/plic.h>
 #include <sbi_utils/serial/uart8250.h>
-#include <sbi_utils/sys/clint.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
 
 #define PLATFORM_PLIC_ADDR		0xc000000
 #define PLATFORM_PLIC_NUM_SOURCES	128
 #define PLATFORM_HART_COUNT		4
 #define PLATFORM_CLINT_ADDR		0x2000000
+#define PLATFORM_ACLINT_MSWI_ADDR	(PLATFORM_CLINT_ADDR + \
+					 CLINT_MSWI_OFFSET)
+#define PLATFORM_ACLINT_MTIMER_ADDR	(PLATFORM_CLINT_ADDR + \
+					 CLINT_MTIMER_OFFSET)
 #define PLATFORM_UART_ADDR		0x09000000
 #define PLATFORM_UART_INPUT_FREQ	10000000
 #define PLATFORM_UART_BAUDRATE		115200
@@ -30,8 +35,16 @@ static struct plic_data plic = {
 	.num_src = PLATFORM_PLIC_NUM_SOURCES,
 };
 
-static struct clint_data clint = {
-	.addr = PLATFORM_CLINT_ADDR,
+static struct aclint_mswi_data mswi = {
+	.addr = PLATFORM_ACLINT_MSWI_ADDR,
+	.size = ACLINT_MSWI_SIZE,
+	.first_hartid = 0,
+	.hart_count = PLATFORM_HART_COUNT,
+};
+
+static struct aclint_mtimer_data mtimer = {
+	.addr = PLATFORM_ACLINT_MTIMER_ADDR,
+	.size = ACLINT_MTIMER_SIZE,
 	.first_hartid = 0,
 	.hart_count = PLATFORM_HART_COUNT,
 	.has_64bit_mmio = TRUE,
@@ -88,14 +101,14 @@ static int platform_ipi_init(bool cold_boot)
 {
 	int ret;
 
-	/* Example if the generic CLINT driver is used */
+	/* Example if the generic ACLINT driver is used */
 	if (cold_boot) {
-		ret = clint_cold_ipi_init(&clint);
+		ret = aclint_mswi_cold_init(&mswi);
 		if (ret)
 			return ret;
 	}
 
-	return clint_warm_ipi_init();
+	return aclint_mswi_warm_init();
 }
 
 /*
@@ -105,14 +118,14 @@ static int platform_timer_init(bool cold_boot)
 {
 	int ret;
 
-	/* Example if the generic CLINT driver is used */
+	/* Example if the generic ACLINT driver is used */
 	if (cold_boot) {
-		ret = clint_cold_timer_init(&clint, NULL);
+		ret = aclint_mtimer_cold_init(&mtimer, NULL);
 		if (ret)
 			return ret;
 	}
 
-	return clint_warm_timer_init();
+	return aclint_mtimer_warm_init();
 }
 
 /*
-- 
2.25.1


