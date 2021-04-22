From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 22 Apr 2021 16:50:19 +0530
Subject: [PATCH 3/7] lib: sbi: Simplify timer platform operations
In-Reply-To: <20210422112023.670521-1-anup.patel@wdc.com>
References: <20210422112023.670521-1-anup.patel@wdc.com>
Message-ID: <20210422112023.670521-4-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having timer_value(), timer_event_start(), and
timer_event_stop() callbacks in platform operations, it will
be much simpler for timer driver to directly register these
operations as device to the sbi_timer implementation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_platform.h          | 58 ++---------------------------
 include/sbi/sbi_timer.h             | 21 +++++++++++
 include/sbi_utils/sys/clint.h       |  6 ---
 include/sbi_utils/timer/fdt_timer.h |  9 -----
 lib/sbi/sbi_platform.c              |  3 --
 lib/sbi/sbi_timer.c                 | 55 +++++++++++++++++----------
 lib/utils/sys/clint.c               | 22 +++++++++--
 lib/utils/timer/fdt_timer.c         | 31 ---------------
 lib/utils/timer/fdt_timer_clint.c   |  3 --
 platform/andes/ae350/platform.c     |  3 --
 platform/andes/ae350/plmt.c         | 16 ++++++--
 platform/andes/ae350/plmt.h         |  6 ---
 platform/fpga/ariane/platform.c     |  3 --
 platform/fpga/openpiton/platform.c  |  3 --
 platform/generic/platform.c         |  3 --
 platform/kendryte/k210/platform.c   |  5 +--
 platform/nuclei/ux600/platform.c    |  3 --
 platform/sifive/fu540/platform.c    |  3 --
 platform/template/platform.c        | 30 ---------------
 platform/thead/c910/platform.c      |  1 -
 20 files changed, 92 insertions(+), 192 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 0d18ef2..a2084c1 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -51,14 +51,12 @@ struct sbi_trap_regs;
 
 /** Possible feature flags of a platform */
 enum sbi_platform_features {
-	/** Platform has timer value */
-	SBI_PLATFORM_HAS_TIMER_VALUE = (1 << 0),
 	/** Platform has HART hotplug support */
-	SBI_PLATFORM_HAS_HART_HOTPLUG = (1 << 1),
+	SBI_PLATFORM_HAS_HART_HOTPLUG = (1 << 0),
 	/** Platform has fault delegation support */
-	SBI_PLATFORM_HAS_MFAULTS_DELEGATION = (1 << 2),
+	SBI_PLATFORM_HAS_MFAULTS_DELEGATION = (1 << 1),
 	/** Platform has custom secondary hart booting support */
-	SBI_PLATFORM_HAS_HART_SECONDARY_BOOT = (1 << 3),
+	SBI_PLATFORM_HAS_HART_SECONDARY_BOOT = (1 << 2),
 
 	/** Last index of Platform features*/
 	SBI_PLATFORM_HAS_LAST_FEATURE = SBI_PLATFORM_HAS_HART_SECONDARY_BOOT,
@@ -66,7 +64,7 @@ enum sbi_platform_features {
 
 /** Default feature set for a platform */
 #define SBI_PLATFORM_DEFAULT_FEATURES                                \
-	(SBI_PLATFORM_HAS_TIMER_VALUE | SBI_PLATFORM_HAS_MFAULTS_DELEGATION)
+	(SBI_PLATFORM_HAS_MFAULTS_DELEGATION)
 
 /** Platform functions */
 struct sbi_platform_operations {
@@ -115,12 +113,6 @@ struct sbi_platform_operations {
 	/** Get tlb flush limit value **/
 	u64 (*get_tlbr_flush_limit)(void);
 
-	/** Get platform timer value */
-	u64 (*timer_value)(void);
-	/** Start platform timer event for current HART */
-	void (*timer_event_start)(u64 next_event);
-	/** Stop platform timer event for current HART */
-	void (*timer_event_stop)(void);
 	/** Initialize platform timer for current HART */
 	int (*timer_init)(bool cold_boot);
 	/** Exit platform timer for current HART */
@@ -210,9 +202,6 @@ struct sbi_platform {
 #define sbi_platform_ops(__p) \
 	((const struct sbi_platform_operations *)(__p)->platform_ops_addr)
 
-/** Check whether the platform supports timer value */
-#define sbi_platform_has_timer_value(__p) \
-	((__p)->features & SBI_PLATFORM_HAS_TIMER_VALUE)
 /** Check whether the platform supports HART hotplug */
 #define sbi_platform_has_hart_hotplug(__p) \
 	((__p)->features & SBI_PLATFORM_HAS_HART_HOTPLUG)
@@ -586,45 +575,6 @@ static inline void sbi_platform_ipi_exit(const struct sbi_platform *plat)
 		sbi_platform_ops(plat)->ipi_exit();
 }
 
-/**
- * Get platform timer value
- *
- * @param plat pointer to struct sbi_platform
- *
- * @return 64-bit timer value
- */
-static inline u64 sbi_platform_timer_value(const struct sbi_platform *plat)
-{
-	if (plat && sbi_platform_ops(plat)->timer_value)
-		return sbi_platform_ops(plat)->timer_value();
-	return 0;
-}
-
-/**
- * Start platform timer event for current HART
- *
- * @param plat pointer to struct struct sbi_platform
- * @param next_event timer value when timer event will happen
- */
-static inline void
-sbi_platform_timer_event_start(const struct sbi_platform *plat, u64 next_event)
-{
-	if (plat && sbi_platform_ops(plat)->timer_event_start)
-		sbi_platform_ops(plat)->timer_event_start(next_event);
-}
-
-/**
- * Stop platform timer event for current HART
- *
- * @param plat pointer to struct sbi_platform
- */
-static inline void
-sbi_platform_timer_event_stop(const struct sbi_platform *plat)
-{
-	if (plat && sbi_platform_ops(plat)->timer_event_stop)
-		sbi_platform_ops(plat)->timer_event_stop();
-}
-
 /**
  * Initialize the platform timer for current HART
  *
diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
index 87bbdbf..1ba6da0 100644
--- a/include/sbi/sbi_timer.h
+++ b/include/sbi/sbi_timer.h
@@ -12,6 +12,21 @@
 
 #include <sbi/sbi_types.h>
 
+/** Timer hardware device */
+struct sbi_timer_device {
+	/** Name of the timer operations */
+	char name[32];
+
+	/** Get free-running timer value */
+	u64 (*timer_value)(void);
+
+	/** Start timer event for current HART */
+	void (*timer_event_start)(u64 next_event);
+
+	/** Stop timer event for current HART */
+	void (*timer_event_stop)(void);
+};
+
 struct sbi_scratch;
 
 /** Get timer value for current HART */
@@ -35,6 +50,12 @@ void sbi_timer_event_start(u64 next_event);
 /** Process timer event for current HART */
 void sbi_timer_process(void);
 
+/** Get current timer device */
+const struct sbi_timer_device *sbi_timer_get_device(void);
+
+/** Register timer device */
+void sbi_timer_set_device(const struct sbi_timer_device *dev);
+
 /* Initialize timer */
 int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot);
 
diff --git a/include/sbi_utils/sys/clint.h b/include/sbi_utils/sys/clint.h
index b07cf62..e102196 100644
--- a/include/sbi_utils/sys/clint.h
+++ b/include/sbi_utils/sys/clint.h
@@ -37,12 +37,6 @@ int clint_warm_ipi_init(void);
 
 int clint_cold_ipi_init(struct clint_data *clint);
 
-u64 clint_timer_value(void);
-
-void clint_timer_event_stop(void);
-
-void clint_timer_event_start(u64 next_event);
-
 int clint_warm_timer_init(void);
 
 int clint_cold_timer_init(struct clint_data *clint,
diff --git a/include/sbi_utils/timer/fdt_timer.h b/include/sbi_utils/timer/fdt_timer.h
index 770a0f3..36202a4 100644
--- a/include/sbi_utils/timer/fdt_timer.h
+++ b/include/sbi_utils/timer/fdt_timer.h
@@ -17,17 +17,8 @@ struct fdt_timer {
 	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
 	int (*warm_init)(void);
 	void (*exit)(void);
-	u64 (*value)(void);
-	void (*event_stop)(void);
-	void (*event_start)(u64 next_event);
 };
 
-u64 fdt_timer_value(void);
-
-void fdt_timer_event_stop(void);
-
-void fdt_timer_event_start(u64 next_event);
-
 void fdt_timer_exit(void);
 
 int fdt_timer_init(bool cold_boot);
diff --git a/lib/sbi/sbi_platform.c b/lib/sbi/sbi_platform.c
index 568d956..e78119a 100644
--- a/lib/sbi/sbi_platform.c
+++ b/lib/sbi/sbi_platform.c
@@ -19,9 +19,6 @@ static inline char *sbi_platform_feature_id2string(unsigned long feature)
 		return NULL;
 
 	switch (feature) {
-	case SBI_PLATFORM_HAS_TIMER_VALUE:
-		fstr = "timer";
-		break;
 	case SBI_PLATFORM_HAS_HART_HOTPLUG:
 		fstr = "hotplug";
 		break;
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index b571b17..63e8ea9 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -16,10 +16,11 @@
 #include <sbi/sbi_timer.h>
 
 static unsigned long time_delta_off;
-static u64 (*get_time_val)(const struct sbi_platform *plat);
+static u64 (*get_time_val)(void);
+static const struct sbi_timer_device *timer_dev = NULL;
 
 #if __riscv_xlen == 32
-static u64 get_ticks(const struct sbi_platform *plat)
+static u64 get_ticks(void)
 {
 	u32 lo, hi, tmp;
 	__asm__ __volatile__("1:\n"
@@ -31,7 +32,7 @@ static u64 get_ticks(const struct sbi_platform *plat)
 	return ((u64)hi << 32) | lo;
 }
 #else
-static u64 get_ticks(const struct sbi_platform *plat)
+static u64 get_ticks(void)
 {
 	unsigned long n;
 
@@ -40,9 +41,16 @@ static u64 get_ticks(const struct sbi_platform *plat)
 }
 #endif
 
+static u64 get_platform_ticks(void)
+{
+	return timer_dev->timer_value();
+}
+
 u64 sbi_timer_value(void)
 {
-	return get_time_val(sbi_platform_thishart_ptr());
+	if (get_time_val)
+		return get_time_val();
+	return 0;
 }
 
 u64 sbi_timer_virt_value(void)
@@ -80,7 +88,8 @@ void sbi_timer_set_delta_upper(ulong delta_upper)
 
 void sbi_timer_event_start(u64 next_event)
 {
-	sbi_platform_timer_event_start(sbi_platform_thishart_ptr(), next_event);
+	if (timer_dev && timer_dev->timer_event_start)
+		timer_dev->timer_event_start(next_event);
 	csr_clear(CSR_MIP, MIP_STIP);
 	csr_set(CSR_MIE, MIP_MTIP);
 }
@@ -91,17 +100,34 @@ void sbi_timer_process(void)
 	csr_set(CSR_MIP, MIP_STIP);
 }
 
+const struct sbi_timer_device *sbi_timer_get_device(void)
+{
+	return timer_dev;
+}
+
+void sbi_timer_set_device(const struct sbi_timer_device *dev)
+{
+	if (!dev || timer_dev)
+		return;
+
+	timer_dev = dev;
+	if (!get_time_val && timer_dev->timer_value)
+		get_time_val = get_platform_ticks;
+}
+
 int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	u64 *time_delta;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
-	int ret;
 
 	if (cold_boot) {
 		time_delta_off = sbi_scratch_alloc_offset(sizeof(*time_delta),
 							  "TIME_DELTA");
 		if (!time_delta_off)
 			return SBI_ENOMEM;
+
+		if (sbi_hart_has_feature(scratch, SBI_HART_HAS_TIME))
+			get_time_val = get_ticks;
 	} else {
 		if (!time_delta_off)
 			return SBI_ENOMEM;
@@ -110,24 +136,13 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 	time_delta = sbi_scratch_offset_ptr(scratch, time_delta_off);
 	*time_delta = 0;
 
-	ret = sbi_platform_timer_init(plat, cold_boot);
-	if (ret)
-		return ret;
-
-	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_TIME))
-		get_time_val = get_ticks;
-	else if (sbi_platform_has_timer_value(plat))
-		get_time_val = sbi_platform_timer_value;
-	else
-		/* There is no method to provide timer value */
-		return SBI_ENODEV;
-
-	return 0;
+	return sbi_platform_timer_init(plat, cold_boot);
 }
 
 void sbi_timer_exit(struct sbi_scratch *scratch)
 {
-	sbi_platform_timer_event_stop(sbi_platform_ptr(scratch));
+	if (timer_dev && timer_dev->timer_event_stop)
+		timer_dev->timer_event_stop();
 
 	csr_clear(CSR_MIP, MIP_STIP);
 	csr_clear(CSR_MIE, MIP_MTIP);
diff --git a/lib/utils/sys/clint.c b/lib/utils/sys/clint.c
index 80e04fb..4b1963a 100644
--- a/lib/utils/sys/clint.c
+++ b/lib/utils/sys/clint.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_timer.h>
 #include <sbi_utils/sys/clint.h>
 
 #define CLINT_IPI_OFF		0
@@ -118,7 +119,7 @@ static void clint_time_wr32(u64 value, volatile u64 *addr)
 	writel_relaxed(value >> 32, (void *)(addr) + 0x04);
 }
 
-u64 clint_timer_value(void)
+static u64 clint_timer_value(void)
 {
 	struct clint_data *clint = clint_timer_hartid2data[current_hartid()];
 
@@ -126,7 +127,7 @@ u64 clint_timer_value(void)
 	return clint->time_rd(clint->time_val) + clint->time_delta;
 }
 
-void clint_timer_event_stop(void)
+static void clint_timer_event_stop(void)
 {
 	u32 target_hart = current_hartid();
 	struct clint_data *clint = clint_timer_hartid2data[target_hart];
@@ -136,7 +137,7 @@ void clint_timer_event_stop(void)
 			&clint->time_cmp[target_hart - clint->first_hartid]);
 }
 
-void clint_timer_event_start(u64 next_event)
+static void clint_timer_event_start(u64 next_event)
 {
 	u32 target_hart = current_hartid();
 	struct clint_data *clint = clint_timer_hartid2data[target_hart];
@@ -146,6 +147,13 @@ void clint_timer_event_start(u64 next_event)
 		       &clint->time_cmp[target_hart - clint->first_hartid]);
 }
 
+static struct sbi_timer_device clint_timer = {
+	.name = "clint",
+	.timer_value = clint_timer_value,
+	.timer_event_start = clint_timer_event_start,
+	.timer_event_stop = clint_timer_event_stop
+};
+
 int clint_warm_timer_init(void)
 {
 	u64 v1, v2, mv;
@@ -224,5 +232,11 @@ int clint_cold_timer_init(struct clint_data *clint,
 	sbi_domain_memregion_init(clint->addr + CLINT_TIME_CMP_OFF,
 				  CLINT_TIME_CMP_SIZE,
 				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
-	return sbi_domain_root_add_memregion(&reg);
+	rc = sbi_domain_root_add_memregion(&reg);
+	if (rc)
+		return rc;
+
+	sbi_timer_set_device(&clint_timer);
+
+	return 0;
 }
diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
index d1d0e0c..92198cd 100644
--- a/lib/utils/timer/fdt_timer.c
+++ b/lib/utils/timer/fdt_timer.c
@@ -17,46 +17,15 @@ static struct fdt_timer *timer_drivers[] = {
 	&fdt_timer_clint
 };
 
-static u64 dummy_value(void)
-{
-	return 0;
-}
-
-static void dummy_event_stop(void)
-{
-}
-
-static void dummy_event_start(u64 next_event)
-{
-}
-
 static struct fdt_timer dummy = {
 	.match_table = NULL,
 	.cold_init = NULL,
 	.warm_init = NULL,
 	.exit = NULL,
-	.value = dummy_value,
-	.event_stop = dummy_event_stop,
-	.event_start = dummy_event_start
 };
 
 static struct fdt_timer *current_driver = &dummy;
 
-u64 fdt_timer_value(void)
-{
-	return current_driver->value();
-}
-
-void fdt_timer_event_stop(void)
-{
-	current_driver->event_stop();
-}
-
-void fdt_timer_event_start(u64 next_event)
-{
-	current_driver->event_start(next_event);
-}
-
 void fdt_timer_exit(void)
 {
 	if (current_driver->exit)
diff --git a/lib/utils/timer/fdt_timer_clint.c b/lib/utils/timer/fdt_timer_clint.c
index 6ba6c7b..0352e53 100644
--- a/lib/utils/timer/fdt_timer_clint.c
+++ b/lib/utils/timer/fdt_timer_clint.c
@@ -47,7 +47,4 @@ struct fdt_timer fdt_timer_clint = {
 	.cold_init = timer_clint_cold_init,
 	.warm_init = clint_warm_timer_init,
 	.exit = NULL,
-	.value = clint_timer_value,
-	.event_stop = clint_timer_event_stop,
-	.event_start = clint_timer_event_start,
 };
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 338159d..17a4e48 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -172,9 +172,6 @@ const struct sbi_platform_operations platform_ops = {
 	.ipi_clear    = plicsw_ipi_clear,
 
 	.timer_init	   = ae350_timer_init,
-	.timer_value	   = plmt_timer_value,
-	.timer_event_start = plmt_timer_event_start,
-	.timer_event_stop  = plmt_timer_event_stop,
 
 	.vendor_ext_provider = ae350_vendor_ext_provider
 };
diff --git a/platform/andes/ae350/plmt.c b/platform/andes/ae350/plmt.c
index 3848e15..54dcb94 100644
--- a/platform/andes/ae350/plmt.c
+++ b/platform/andes/ae350/plmt.c
@@ -10,13 +10,14 @@
 
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_timer.h>
 
 static u32 plmt_time_hart_count;
 static volatile void *plmt_time_base;
 static volatile u64 *plmt_time_val;
 static volatile u64 *plmt_time_cmp;
 
-u64 plmt_timer_value(void)
+static u64 plmt_timer_value(void)
 {
 #if __riscv_xlen == 64
 	return readq_relaxed(plmt_time_val);
@@ -32,7 +33,7 @@ u64 plmt_timer_value(void)
 #endif
 }
 
-void plmt_timer_event_stop(void)
+static void plmt_timer_event_stop(void)
 {
 	u32 target_hart = current_hartid();
 
@@ -48,7 +49,7 @@ void plmt_timer_event_stop(void)
 #endif
 }
 
-void plmt_timer_event_start(u64 next_event)
+static void plmt_timer_event_start(u64 next_event)
 {
 	u32 target_hart = current_hartid();
 
@@ -68,6 +69,13 @@ void plmt_timer_event_start(u64 next_event)
 
 }
 
+static struct sbi_timer_device plmt_timer = {
+	.name = "ae350_plmt",
+	.timer_value = plmt_timer_value,
+	.timer_event_start = plmt_timer_event_start,
+	.timer_event_stop = plmt_timer_event_stop
+};
+
 int plmt_warm_timer_init(void)
 {
 	u32 target_hart = current_hartid();
@@ -93,5 +101,7 @@ int plmt_cold_timer_init(unsigned long base, u32 hart_count)
 	plmt_time_val        = (u64 *)(plmt_time_base);
 	plmt_time_cmp        = (u64 *)(plmt_time_base + 0x8);
 
+	sbi_timer_set_device(&plmt_timer);
+
 	return 0;
 }
diff --git a/platform/andes/ae350/plmt.h b/platform/andes/ae350/plmt.h
index 129fcf8..db093e0 100644
--- a/platform/andes/ae350/plmt.h
+++ b/platform/andes/ae350/plmt.h
@@ -10,12 +10,6 @@
 #ifndef _AE350_PLMT_H_
 #define _AE350_PLMT_H_
 
-u64 plmt_timer_value(void);
-
-void plmt_timer_event_stop(void);
-
-void plmt_timer_event_start(u64 next_event);
-
 int plmt_warm_timer_init(void);
 
 int plmt_cold_timer_init(unsigned long base, u32 hart_count);
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 4f32c42..73c8b9c 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -159,9 +159,6 @@ const struct sbi_platform_operations platform_ops = {
 	.ipi_send = clint_ipi_send,
 	.ipi_clear = clint_ipi_clear,
 	.timer_init = ariane_timer_init,
-	.timer_value = clint_timer_value,
-	.timer_event_start = clint_timer_event_start,
-	.timer_event_stop = clint_timer_event_stop,
 };
 
 const struct sbi_platform platform = {
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 77403c9..4d876c9 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -185,9 +185,6 @@ const struct sbi_platform_operations platform_ops = {
 	.ipi_send = clint_ipi_send,
 	.ipi_clear = clint_ipi_clear,
 	.timer_init = openpiton_timer_init,
-	.timer_value = clint_timer_value,
-	.timer_event_start = clint_timer_event_start,
-	.timer_event_stop = clint_timer_event_stop,
 };
 
 const struct sbi_platform platform = {
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 445cbcf..cf18a1b 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -218,9 +218,6 @@ const struct sbi_platform_operations platform_ops = {
 	.ipi_init		= fdt_ipi_init,
 	.ipi_exit		= fdt_ipi_exit,
 	.get_tlbr_flush_limit	= generic_tlbr_flush_limit,
-	.timer_value		= fdt_timer_value,
-	.timer_event_stop	= fdt_timer_event_stop,
-	.timer_event_start	= fdt_timer_event_start,
 	.timer_init		= fdt_timer_init,
 	.timer_exit		= fdt_timer_exit,
 	.system_reset_check	= generic_system_reset_check,
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index 495d214..c8fd45e 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -160,16 +160,13 @@ const struct sbi_platform_operations platform_ops = {
 	.system_reset		= k210_system_reset,
 
 	.timer_init	   = k210_timer_init,
-	.timer_value	   = clint_timer_value,
-	.timer_event_stop  = clint_timer_event_stop,
-	.timer_event_start = clint_timer_event_start,
 };
 
 const struct sbi_platform platform = {
 	.opensbi_version	= OPENSBI_VERSION,
 	.platform_version   	= SBI_PLATFORM_VERSION(0x0, 0x01),
 	.name			= "Kendryte K210",
-	.features		= SBI_PLATFORM_HAS_TIMER_VALUE,
+	.features		= 0,
 	.hart_count		= K210_HART_COUNT,
 	.hart_stack_size	= SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
 	.platform_ops_addr	= (unsigned long)&platform_ops
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 4f4f884..86130c8 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -207,9 +207,6 @@ const struct sbi_platform_operations platform_ops = {
 	.ipi_send		= clint_ipi_send,
 	.ipi_clear		= clint_ipi_clear,
 	.ipi_init		= ux600_ipi_init,
-	.timer_value		= clint_timer_value,
-	.timer_event_stop	= clint_timer_event_stop,
-	.timer_event_start	= clint_timer_event_start,
 	.timer_init		= ux600_timer_init,
 	.system_reset_check	= ux600_system_reset_check,
 	.system_reset		= ux600_system_reset
diff --git a/platform/sifive/fu540/platform.c b/platform/sifive/fu540/platform.c
index 82f6f75..78de30d 100644
--- a/platform/sifive/fu540/platform.c
+++ b/platform/sifive/fu540/platform.c
@@ -162,9 +162,6 @@ const struct sbi_platform_operations platform_ops = {
 	.ipi_clear		= clint_ipi_clear,
 	.ipi_init		= fu540_ipi_init,
 	.get_tlbr_flush_limit	= fu540_get_tlbr_flush_limit,
-	.timer_value		= clint_timer_value,
-	.timer_event_stop	= clint_timer_event_stop,
-	.timer_event_start	= clint_timer_event_start,
 	.timer_init		= fu540_timer_init,
 };
 
diff --git a/platform/template/platform.c b/platform/template/platform.c
index fbbac30..1691652 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -133,33 +133,6 @@ static int platform_timer_init(bool cold_boot)
 	return clint_warm_timer_init();
 }
 
-/*
- * Get platform timer value.
- */
-static u64 platform_timer_value(void)
-{
-	/* Example if the generic CLINT driver is used */
-	return clint_timer_value();
-}
-
-/*
- * Start platform timer event for current HART.
- */
-static void platform_timer_event_start(u64 next_event)
-{
-	/* Example if the generic CLINT driver is used */
-	clint_timer_event_start(next_event);
-}
-
-/*
- * Stop platform timer event for current HART.
- */
-static void platform_timer_event_stop(void)
-{
-	/* Example if the generic CLINT driver is used */
-	clint_timer_event_stop();
-}
-
 /*
  * Check reset type and reason supported by the platform.
  */
@@ -186,9 +159,6 @@ const struct sbi_platform_operations platform_ops = {
 	.ipi_send		= platform_ipi_send,
 	.ipi_clear		= platform_ipi_clear,
 	.ipi_init		= platform_ipi_init,
-	.timer_value		= platform_timer_value,
-	.timer_event_stop	= platform_timer_event_stop,
-	.timer_event_start	= platform_timer_event_start,
 	.timer_init		= platform_timer_init,
 	.system_reset_check	= platform_system_reset_check,
 	.system_reset		= platform_system_reset
diff --git a/platform/thead/c910/platform.c b/platform/thead/c910/platform.c
index dfa484a..989ef90 100644
--- a/platform/thead/c910/platform.c
+++ b/platform/thead/c910/platform.c
@@ -137,7 +137,6 @@ const struct sbi_platform_operations platform_ops = {
 	.ipi_clear           = clint_ipi_clear,
 
 	.timer_init          = c910_timer_init,
-	.timer_event_start   = clint_timer_event_start,
 
 	.system_reset_check  = c910_system_reset_check,
 	.system_reset        = c910_system_reset,
-- 
2.25.1


