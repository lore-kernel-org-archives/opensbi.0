From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 22 Apr 2021 16:50:20 +0530
Subject: [PATCH 4/7] lib: sbi: Simplify ipi platform operations
In-Reply-To: <20210422112023.670521-1-anup.patel@wdc.com>
References: <20210422112023.670521-1-anup.patel@wdc.com>
Message-ID: <20210422112023.670521-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having ipi_send() and ipi_clear() callbacks in
platform operations, it will be much simpler for ipi driver
to directly register these operations as a device to sbi_ipi
implementation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_ipi.h              | 18 +++++++++++++++++
 include/sbi/sbi_platform.h         | 30 ----------------------------
 include/sbi_utils/ipi/fdt_ipi.h    |  6 ------
 include/sbi_utils/sys/clint.h      |  4 ----
 lib/sbi/sbi_hsm.c                  |  2 +-
 lib/sbi/sbi_init.c                 |  4 +---
 lib/sbi/sbi_ipi.c                  | 32 ++++++++++++++++++++++++------
 lib/utils/ipi/fdt_ipi.c            | 20 -------------------
 lib/utils/ipi/fdt_ipi_clint.c      |  2 --
 lib/utils/sys/clint.c              | 20 ++++++++++++++++---
 platform/andes/ae350/platform.c    | 11 ++++++++--
 platform/fpga/ariane/platform.c    |  2 --
 platform/fpga/openpiton/platform.c |  2 --
 platform/generic/platform.c        |  2 --
 platform/kendryte/k210/platform.c  |  2 --
 platform/nuclei/ux600/platform.c   |  2 --
 platform/sifive/fu540/platform.c   |  2 --
 platform/template/platform.c       | 20 -------------------
 platform/thead/c910/platform.c     |  2 --
 19 files changed, 72 insertions(+), 111 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index 617872c..fb7d658 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -18,6 +18,18 @@
 
 /* clang-format on */
 
+/** IPI hardware device */
+struct sbi_ipi_device {
+	/** Name of the IPI device */
+	char name[32];
+
+	/** Send IPI to a target HART */
+	void (*ipi_send)(u32 target_hart);
+
+	/** Clear IPI for a target HART */
+	void (*ipi_clear)(u32 target_hart);
+};
+
 struct sbi_scratch;
 
 /** IPI event operations or callbacks */
@@ -63,6 +75,12 @@ int sbi_ipi_send_halt(ulong hmask, ulong hbase);
 
 void sbi_ipi_process(void);
 
+void sbi_ipi_raw_send(u32 target_hart);
+
+const struct sbi_ipi_device *sbi_ipi_get_device(void);
+
+void sbi_ipi_set_device(const struct sbi_ipi_device *dev);
+
 int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot);
 
 void sbi_ipi_exit(struct sbi_scratch *scratch);
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index a2084c1..2756d73 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -101,10 +101,6 @@ struct sbi_platform_operations {
 	/** Exit the platform interrupt controller for current HART */
 	void (*irqchip_exit)(void);
 
-	/** Send IPI to a target HART */
-	void (*ipi_send)(u32 target_hart);
-	/** Clear IPI for a target HART */
-	void (*ipi_clear)(u32 target_hart);
 	/** Initialize IPI for current HART */
 	int (*ipi_init)(bool cold_boot);
 	/** Exit IPI for current HART */
@@ -522,32 +518,6 @@ static inline void sbi_platform_irqchip_exit(const struct sbi_platform *plat)
 		sbi_platform_ops(plat)->irqchip_exit();
 }
 
-/**
- * Send IPI to a target HART
- *
- * @param plat pointer to struct sbi_platform
- * @param target_hart HART ID of IPI target
- */
-static inline void sbi_platform_ipi_send(const struct sbi_platform *plat,
-					 u32 target_hart)
-{
-	if (plat && sbi_platform_ops(plat)->ipi_send)
-		sbi_platform_ops(plat)->ipi_send(target_hart);
-}
-
-/**
- * Clear IPI for a target HART
- *
- * @param plat pointer to struct sbi_platform
- * @param target_hart HART ID of IPI target
- */
-static inline void sbi_platform_ipi_clear(const struct sbi_platform *plat,
-					  u32 target_hart)
-{
-	if (plat && sbi_platform_ops(plat)->ipi_clear)
-		sbi_platform_ops(plat)->ipi_clear(target_hart);
-}
-
 /**
  * Initialize the platform IPI support for current HART
  *
diff --git a/include/sbi_utils/ipi/fdt_ipi.h b/include/sbi_utils/ipi/fdt_ipi.h
index e817141..9337353 100644
--- a/include/sbi_utils/ipi/fdt_ipi.h
+++ b/include/sbi_utils/ipi/fdt_ipi.h
@@ -17,14 +17,8 @@ struct fdt_ipi {
 	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
 	int (*warm_init)(void);
 	void (*exit)(void);
-	void (*send)(u32 target_hart);
-	void (*clear)(u32 target_hart);
 };
 
-void fdt_ipi_send(u32 target_hart);
-
-void fdt_ipi_clear(u32 target_hart);
-
 void fdt_ipi_exit(void);
 
 int fdt_ipi_init(bool cold_boot);
diff --git a/include/sbi_utils/sys/clint.h b/include/sbi_utils/sys/clint.h
index e102196..1e2b40b 100644
--- a/include/sbi_utils/sys/clint.h
+++ b/include/sbi_utils/sys/clint.h
@@ -29,10 +29,6 @@ struct clint_data {
 	void (*time_wr)(u64 value, volatile u64 *addr);
 };
 
-void clint_ipi_send(u32 target_hart);
-
-void clint_ipi_clear(u32 target_hart);
-
 int clint_warm_ipi_init(void);
 
 int clint_cold_ipi_init(struct clint_data *clint);
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index bbc4ce9..64d299b 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -238,7 +238,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		return sbi_platform_hart_start(plat, hartid,
 					       scratch->warmboot_addr);
 	} else {
-		sbi_platform_ipi_send(plat, hartid);
+		sbi_ipi_raw_send(hartid);
 	}
 
 	return 0;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 4de2dfa..7380d01 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -178,8 +178,6 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 {
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
-
 	/* Mark coldboot done */
 	__smp_store_release(&coldboot_done, 1);
 
@@ -190,7 +188,7 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 	for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
 		if ((i != hartid) &&
 		    sbi_hartmask_test_hart(i, &coldboot_wait_hmask))
-			sbi_platform_ipi_send(plat, i);
+			sbi_ipi_raw_send(i);
 	}
 
 	/* Release coldboot lock */
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index b50735e..bfaf4e9 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -25,7 +25,7 @@ struct sbi_ipi_data {
 };
 
 static unsigned long ipi_data_off;
-
+static const struct sbi_ipi_device *ipi_dev = NULL;
 static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
 
 static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
@@ -33,7 +33,6 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 {
 	int ret;
 	struct sbi_scratch *remote_scratch = NULL;
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	struct sbi_ipi_data *ipi_data;
 	const struct sbi_ipi_event_ops *ipi_ops;
 
@@ -61,7 +60,9 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 	 */
 	atomic_raw_set_bit(event, &ipi_data->ipi_type);
 	smp_wmb();
-	sbi_platform_ipi_send(plat, remote_hartid);
+
+	if (ipi_dev && ipi_dev->ipi_send)
+		ipi_dev->ipi_send(remote_hartid);
 
 	if (ipi_ops->sync)
 		ipi_ops->sync(scratch);
@@ -178,12 +179,12 @@ void sbi_ipi_process(void)
 	unsigned int ipi_event;
 	const struct sbi_ipi_event_ops *ipi_ops;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	struct sbi_ipi_data *ipi_data =
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
-
 	u32 hartid = current_hartid();
-	sbi_platform_ipi_clear(plat, hartid);
+
+	if (ipi_dev && ipi_dev->ipi_clear)
+		ipi_dev->ipi_clear(hartid);
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
@@ -201,6 +202,25 @@ skip:
 	};
 }
 
+void sbi_ipi_raw_send(u32 target_hart)
+{
+	if (ipi_dev && ipi_dev->ipi_send)
+		ipi_dev->ipi_send(target_hart);
+}
+
+const struct sbi_ipi_device *sbi_ipi_get_device(void)
+{
+	return ipi_dev;
+}
+
+void sbi_ipi_set_device(const struct sbi_ipi_device *dev)
+{
+	if (!dev || ipi_dev)
+		return;
+
+	ipi_dev = dev;
+}
+
 int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int ret;
diff --git a/lib/utils/ipi/fdt_ipi.c b/lib/utils/ipi/fdt_ipi.c
index 6562469..efca37e 100644
--- a/lib/utils/ipi/fdt_ipi.c
+++ b/lib/utils/ipi/fdt_ipi.c
@@ -17,35 +17,15 @@ static struct fdt_ipi *ipi_drivers[] = {
 	&fdt_ipi_clint
 };
 
-static void dummy_send(u32 target_hart)
-{
-}
-
-static void dummy_clear(u32 target_hart)
-{
-}
-
 static struct fdt_ipi dummy = {
 	.match_table = NULL,
 	.cold_init = NULL,
 	.warm_init = NULL,
 	.exit = NULL,
-	.send = dummy_send,
-	.clear = dummy_clear
 };
 
 static struct fdt_ipi *current_driver = &dummy;
 
-void fdt_ipi_send(u32 target_hart)
-{
-	current_driver->send(target_hart);
-}
-
-void fdt_ipi_clear(u32 target_hart)
-{
-	current_driver->clear(target_hart);
-}
-
 void fdt_ipi_exit(void)
 {
 	if (current_driver->exit)
diff --git a/lib/utils/ipi/fdt_ipi_clint.c b/lib/utils/ipi/fdt_ipi_clint.c
index e799fd7..529f978 100644
--- a/lib/utils/ipi/fdt_ipi_clint.c
+++ b/lib/utils/ipi/fdt_ipi_clint.c
@@ -45,6 +45,4 @@ struct fdt_ipi fdt_ipi_clint = {
 	.cold_init = ipi_clint_cold_init,
 	.warm_init = clint_warm_ipi_init,
 	.exit = NULL,
-	.send = clint_ipi_send,
-	.clear = clint_ipi_clear,
 };
diff --git a/lib/utils/sys/clint.c b/lib/utils/sys/clint.c
index 4b1963a..e8c2bd9 100644
--- a/lib/utils/sys/clint.c
+++ b/lib/utils/sys/clint.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_ipi.h>
 #include <sbi/sbi_timer.h>
 #include <sbi_utils/sys/clint.h>
 
@@ -27,7 +28,7 @@
 
 static struct clint_data *clint_ipi_hartid2data[SBI_HARTMASK_MAX_BITS];
 
-void clint_ipi_send(u32 target_hart)
+static void clint_ipi_send(u32 target_hart)
 {
 	struct clint_data *clint;
 
@@ -41,7 +42,7 @@ void clint_ipi_send(u32 target_hart)
 	writel(1, &clint->ipi[target_hart - clint->first_hartid]);
 }
 
-void clint_ipi_clear(u32 target_hart)
+static void clint_ipi_clear(u32 target_hart)
 {
 	struct clint_data *clint;
 
@@ -55,6 +56,12 @@ void clint_ipi_clear(u32 target_hart)
 	writel(0, &clint->ipi[target_hart - clint->first_hartid]);
 }
 
+static struct sbi_ipi_device clint_ipi = {
+	.name = "clint",
+	.ipi_send = clint_ipi_send,
+	.ipi_clear = clint_ipi_clear
+};
+
 int clint_warm_ipi_init(void)
 {
 	/* Clear CLINT IPI for current HART */
@@ -66,6 +73,7 @@ int clint_warm_ipi_init(void)
 int clint_cold_ipi_init(struct clint_data *clint)
 {
 	u32 i;
+	int rc;
 	struct sbi_domain_memregion reg;
 
 	if (!clint)
@@ -82,7 +90,13 @@ int clint_cold_ipi_init(struct clint_data *clint)
 	sbi_domain_memregion_init(clint->addr + CLINT_IPI_OFF,
 				  CLINT_IPI_SIZE,
 				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
-	return sbi_domain_root_add_memregion(&reg);
+	rc = sbi_domain_root_add_memregion(&reg);
+	if (rc)
+		return rc;
+
+	sbi_ipi_set_device(&clint_ipi);
+
+	return 0;
 }
 
 static struct clint_data *clint_timer_hartid2data[SBI_HARTMASK_MAX_BITS];
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 17a4e48..ae4ef71 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -12,6 +12,7 @@
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_const.h>
+#include <sbi/sbi_ipi.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_trap.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -85,6 +86,12 @@ static int ae350_irqchip_init(bool cold_boot)
 	return plic_warm_irqchip_init(&plic, 2 * hartid, 2 * hartid + 1);
 }
 
+static struct sbi_ipi_device plicsw_ipi = {
+	.name = "ae350_plicsw",
+	.ipi_send = plicsw_ipi_send,
+	.ipi_clear = plicsw_ipi_clear
+};
+
 /* Initialize IPI for current HART. */
 static int ae350_ipi_init(bool cold_boot)
 {
@@ -95,6 +102,8 @@ static int ae350_ipi_init(bool cold_boot)
 					   AE350_HART_COUNT);
 		if (ret)
 			return ret;
+
+		sbi_ipi_set_device(&plicsw_ipi);
 	}
 
 	return plicsw_warm_ipi_init();
@@ -168,8 +177,6 @@ const struct sbi_platform_operations platform_ops = {
 	.irqchip_init = ae350_irqchip_init,
 
 	.ipi_init     = ae350_ipi_init,
-	.ipi_send     = plicsw_ipi_send,
-	.ipi_clear    = plicsw_ipi_clear,
 
 	.timer_init	   = ae350_timer_init,
 
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 73c8b9c..42e43fa 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -156,8 +156,6 @@ const struct sbi_platform_operations platform_ops = {
 	.console_init = ariane_console_init,
 	.irqchip_init = ariane_irqchip_init,
 	.ipi_init = ariane_ipi_init,
-	.ipi_send = clint_ipi_send,
-	.ipi_clear = clint_ipi_clear,
 	.timer_init = ariane_timer_init,
 };
 
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 4d876c9..894bfdc 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -182,8 +182,6 @@ const struct sbi_platform_operations platform_ops = {
 	.console_init = openpiton_console_init,
 	.irqchip_init = openpiton_irqchip_init,
 	.ipi_init = openpiton_ipi_init,
-	.ipi_send = clint_ipi_send,
-	.ipi_clear = clint_ipi_clear,
 	.timer_init = openpiton_timer_init,
 };
 
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index cf18a1b..4ae8b88 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -213,8 +213,6 @@ const struct sbi_platform_operations platform_ops = {
 	.console_init		= fdt_serial_init,
 	.irqchip_init		= fdt_irqchip_init,
 	.irqchip_exit		= fdt_irqchip_exit,
-	.ipi_send		= fdt_ipi_send,
-	.ipi_clear		= fdt_ipi_clear,
 	.ipi_init		= fdt_ipi_init,
 	.ipi_exit		= fdt_ipi_exit,
 	.get_tlbr_flush_limit	= generic_tlbr_flush_limit,
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index c8fd45e..4b89939 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -153,8 +153,6 @@ const struct sbi_platform_operations platform_ops = {
 	.irqchip_init = k210_irqchip_init,
 
 	.ipi_init  = k210_ipi_init,
-	.ipi_send  = clint_ipi_send,
-	.ipi_clear = clint_ipi_clear,
 
 	.system_reset_check	= k210_system_reset_check,
 	.system_reset		= k210_system_reset,
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 86130c8..ac81d03 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -204,8 +204,6 @@ const struct sbi_platform_operations platform_ops = {
 	.final_init		= ux600_final_init,
 	.console_init		= ux600_console_init,
 	.irqchip_init		= ux600_irqchip_init,
-	.ipi_send		= clint_ipi_send,
-	.ipi_clear		= clint_ipi_clear,
 	.ipi_init		= ux600_ipi_init,
 	.timer_init		= ux600_timer_init,
 	.system_reset_check	= ux600_system_reset_check,
diff --git a/platform/sifive/fu540/platform.c b/platform/sifive/fu540/platform.c
index 78de30d..a17034d 100644
--- a/platform/sifive/fu540/platform.c
+++ b/platform/sifive/fu540/platform.c
@@ -158,8 +158,6 @@ const struct sbi_platform_operations platform_ops = {
 	.final_init		= fu540_final_init,
 	.console_init		= fu540_console_init,
 	.irqchip_init		= fu540_irqchip_init,
-	.ipi_send		= clint_ipi_send,
-	.ipi_clear		= clint_ipi_clear,
 	.ipi_init		= fu540_ipi_init,
 	.get_tlbr_flush_limit	= fu540_get_tlbr_flush_limit,
 	.timer_init		= fu540_timer_init,
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 1691652..04334b2 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -98,24 +98,6 @@ static int platform_ipi_init(bool cold_boot)
 	return clint_warm_ipi_init();
 }
 
-/*
- * Send IPI to a target HART
- */
-static void platform_ipi_send(u32 target_hart)
-{
-	/* Example if the generic CLINT driver is used */
-	clint_ipi_send(target_hart);
-}
-
-/*
- * Clear IPI for a target HART.
- */
-static void platform_ipi_clear(u32 target_hart)
-{
-	/* Example if the generic CLINT driver is used */
-	clint_ipi_clear(target_hart);
-}
-
 /*
  * Initialize platform timer for current HART.
  */
@@ -156,8 +138,6 @@ const struct sbi_platform_operations platform_ops = {
 	.final_init		= platform_final_init,
 	.console_init		= platform_console_init,
 	.irqchip_init		= platform_irqchip_init,
-	.ipi_send		= platform_ipi_send,
-	.ipi_clear		= platform_ipi_clear,
 	.ipi_init		= platform_ipi_init,
 	.timer_init		= platform_timer_init,
 	.system_reset_check	= platform_system_reset_check,
diff --git a/platform/thead/c910/platform.c b/platform/thead/c910/platform.c
index 989ef90..352edb6 100644
--- a/platform/thead/c910/platform.c
+++ b/platform/thead/c910/platform.c
@@ -133,8 +133,6 @@ const struct sbi_platform_operations platform_ops = {
 	.irqchip_init        = c910_irqchip_init,
 
 	.ipi_init            = c910_ipi_init,
-	.ipi_send            = clint_ipi_send,
-	.ipi_clear           = clint_ipi_clear,
 
 	.timer_init          = c910_timer_init,
 
-- 
2.25.1


