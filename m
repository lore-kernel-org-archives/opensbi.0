From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 25 Nov 2020 10:46:46 +0530
Subject: [PATCH v3 4/5] lib: sbi: Improve system reset platform operations
In-Reply-To: <20201125051647.295472-1-anup.patel@wdc.com>
References: <20201125051647.295472-1-anup.patel@wdc.com>
Message-ID: <20201125051647.295472-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To implement the SBI SRST extension, we need two platform operations
for system reset:
1) system_reset_check() - This operation will check whether given
   reset type and reason are supported by the platform
2) system_reset() - This operation will do the actual platform
   system reset and it will not return if reset type and reason
   are supported by the platform

This patch updates system reset related code everywhere as-per above.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_platform.h                   | 35 ++++++++++++++++----
 include/sbi/sbi_system.h                     |  4 ++-
 include/sbi_utils/reset/fdt_reset.h          |  7 ++--
 include/sbi_utils/sys/htif.h                 |  4 ++-
 include/sbi_utils/sys/sifive_test.h          |  4 ++-
 lib/sbi/sbi_ecall_legacy.c                   |  3 +-
 lib/sbi/sbi_system.c                         | 13 ++++++--
 lib/utils/reset/fdt_reset.c                  | 13 ++++++--
 lib/utils/reset/fdt_reset_htif.c             |  1 +
 lib/utils/reset/fdt_reset_sifive.c           |  1 +
 lib/utils/sys/htif.c                         |  7 +++-
 lib/utils/sys/sifive_test.c                  | 23 ++++++++++---
 platform/generic/include/platform_override.h |  5 ++-
 platform/generic/platform.c                  | 23 ++++++++++---
 platform/nuclei/ux600/platform.c             |  9 +++--
 platform/template/platform.c                 | 12 +++++--
 platform/thead/c910/platform.c               |  9 +++--
 17 files changed, 137 insertions(+), 36 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 3f4a733..3681a78 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -139,8 +139,10 @@ struct sbi_platform_operations {
 	 */
 	int (*hart_stop)(void);
 
+	/* Check whether reset type and reason supported by the platform */
+	int (*system_reset_check)(u32 reset_type, u32 reset_reason);
 	/** Reset the platform */
-	int (*system_reset)(u32 reset_type);
+	void (*system_reset)(u32 reset_type, u32 reset_reason);
 
 	/** platform specific SBI extension implementation probe function */
 	int (*vendor_ext_check)(long extid);
@@ -669,21 +671,40 @@ static inline void sbi_platform_timer_exit(const struct sbi_platform *plat)
 }
 
 /**
- * Reset the platform
+ * Check whether reset type and reason supported by the platform
  *
  * @param plat pointer to struct sbi_platform
  * @param reset_type type of reset
+ * @param reset_reason reason for reset
  *
- * @return 0 on success and negative error code on failure
+ * @return 0 if reset type and reason not supported and 1 if supported
  */
-static inline int sbi_platform_system_reset(const struct sbi_platform *plat,
-					    u32 reset_type)
+static inline int sbi_platform_system_reset_check(
+					    const struct sbi_platform *plat,
+					    u32 reset_type, u32 reset_reason)
 {
-	if (plat && sbi_platform_ops(plat)->system_reset)
-		return sbi_platform_ops(plat)->system_reset(reset_type);
+	if (plat && sbi_platform_ops(plat)->system_reset_check)
+		return sbi_platform_ops(plat)->system_reset_check(reset_type,
+								  reset_reason);
 	return 0;
 }
 
+/**
+ * Reset the platform
+ *
+ * This function will not return for supported reset type and reset reason
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param reset_type type of reset
+ * @param reset_reason reason for reset
+ */
+static inline void sbi_platform_system_reset(const struct sbi_platform *plat,
+					     u32 reset_type, u32 reset_reason)
+{
+	if (plat && sbi_platform_ops(plat)->system_reset)
+		sbi_platform_ops(plat)->system_reset(reset_type, reset_reason);
+}
+
 /**
  * Check if a vendor extension is implemented or not.
  *
diff --git a/include/sbi/sbi_system.h b/include/sbi/sbi_system.h
index 309e263..34ba766 100644
--- a/include/sbi/sbi_system.h
+++ b/include/sbi/sbi_system.h
@@ -12,6 +12,8 @@
 
 #include <sbi/sbi_types.h>
 
-void __noreturn sbi_system_reset(u32 reset_type);
+bool sbi_system_reset_supported(u32 reset_type, u32 reset_reason);
+
+void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason);
 
 #endif
diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
index 789a6ac..cce441a 100644
--- a/include/sbi_utils/reset/fdt_reset.h
+++ b/include/sbi_utils/reset/fdt_reset.h
@@ -15,10 +15,13 @@
 struct fdt_reset {
 	const struct fdt_match *match_table;
 	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
-	int (*system_reset)(u32 reset_type);
+	int (*system_reset_check)(u32 reset_type, u32 reset_reason);
+	void (*system_reset)(u32 reset_type, u32 reset_reason);
 };
 
-int fdt_system_reset(u32 reset_type);
+int fdt_system_reset_check(u32 reset_type, u32 reset_reason);
+
+void fdt_system_reset(u32 reset_type, u32 reset_reason);
 
 int fdt_reset_init(void);
 
diff --git a/include/sbi_utils/sys/htif.h b/include/sbi_utils/sys/htif.h
index 7384b48..a431723 100644
--- a/include/sbi_utils/sys/htif.h
+++ b/include/sbi_utils/sys/htif.h
@@ -14,6 +14,8 @@ void htif_putc(char ch);
 
 int htif_getc(void);
 
-int htif_system_reset(u32 type);
+int htif_system_reset_check(u32 type, u32 reason);
+
+void htif_system_reset(u32 type, u32 reason);
 
 #endif
diff --git a/include/sbi_utils/sys/sifive_test.h b/include/sbi_utils/sys/sifive_test.h
index 7e153d5..958622e 100644
--- a/include/sbi_utils/sys/sifive_test.h
+++ b/include/sbi_utils/sys/sifive_test.h
@@ -12,7 +12,9 @@
 
 #include <sbi/sbi_types.h>
 
-int sifive_test_system_reset(u32 type);
+int sifive_test_system_reset_check(u32 type, u32 reason);
+
+void sifive_test_system_reset(u32 type, u32 reason);
 
 int sifive_test_init(unsigned long base);
 
diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
index 683b8dc..7844fbb 100644
--- a/lib/sbi/sbi_ecall_legacy.c
+++ b/lib/sbi/sbi_ecall_legacy.c
@@ -103,7 +103,8 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
 		}
 		break;
 	case SBI_EXT_0_1_SHUTDOWN:
-		sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN);
+		sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
+				 SBI_SRST_RESET_REASON_NONE);
 		break;
 	default:
 		ret = SBI_ENOTSUPP;
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index 2f1b7fb..08a8b47 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -18,7 +18,16 @@
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_init.h>
 
-void __noreturn sbi_system_reset(u32 reset_type)
+bool sbi_system_reset_supported(u32 reset_type, u32 reset_reason)
+{
+	if (sbi_platform_system_reset_check(sbi_platform_thishart_ptr(),
+					    reset_type, reset_reason))
+		return TRUE;
+
+	return FALSE;
+}
+
+void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
 {
 	ulong hbase = 0, hmask;
 	u32 cur_hartid = current_hartid();
@@ -40,7 +49,7 @@ void __noreturn sbi_system_reset(u32 reset_type)
 	/* Platform specific reset if domain allowed system reset */
 	if (dom->system_reset_allowed)
 		sbi_platform_system_reset(sbi_platform_ptr(scratch),
-					  reset_type);
+					  reset_type, reset_reason);
 
 	/* If platform specific reset did not work then do sbi_exit() */
 	sbi_exit(scratch);
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index dfbd33e..dead8a3 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -21,13 +21,20 @@ static struct fdt_reset *reset_drivers[] = {
 
 static struct fdt_reset *current_driver = NULL;
 
-int fdt_system_reset(u32 reset_type)
+int fdt_system_reset_check(u32 reset_type, u32 reset_reason)
 {
-	if (current_driver && current_driver->system_reset)
-		return current_driver->system_reset(reset_type);
+	if (current_driver && current_driver->system_reset_check)
+		return current_driver->system_reset_check(reset_type,
+							  reset_reason);
 	return 0;
 }
 
+void fdt_system_reset(u32 reset_type, u32 reset_reason)
+{
+	if (current_driver && current_driver->system_reset)
+		current_driver->system_reset(reset_type, reset_reason);
+}
+
 int fdt_reset_init(void)
 {
 	int pos, noff, rc;
diff --git a/lib/utils/reset/fdt_reset_htif.c b/lib/utils/reset/fdt_reset_htif.c
index e453d05..587e7d6 100644
--- a/lib/utils/reset/fdt_reset_htif.c
+++ b/lib/utils/reset/fdt_reset_htif.c
@@ -18,5 +18,6 @@ static const struct fdt_match htif_reset_match[] = {
 
 struct fdt_reset fdt_reset_htif = {
 	.match_table = htif_reset_match,
+	.system_reset_check = htif_system_reset_check,
 	.system_reset = htif_system_reset
 };
diff --git a/lib/utils/reset/fdt_reset_sifive.c b/lib/utils/reset/fdt_reset_sifive.c
index 6a171ca..38b520c 100644
--- a/lib/utils/reset/fdt_reset_sifive.c
+++ b/lib/utils/reset/fdt_reset_sifive.c
@@ -33,5 +33,6 @@ static const struct fdt_match sifive_test_reset_match[] = {
 struct fdt_reset fdt_reset_sifive = {
 	.match_table = sifive_test_reset_match,
 	.init = sifive_test_reset_init,
+	.system_reset_check = sifive_test_system_reset_check,
 	.system_reset = sifive_test_system_reset
 };
diff --git a/lib/utils/sys/htif.c b/lib/utils/sys/htif.c
index ed800a5..fd70fb9 100644
--- a/lib/utils/sys/htif.c
+++ b/lib/utils/sys/htif.c
@@ -140,7 +140,12 @@ int htif_getc(void)
 	return ch - 1;
 }
 
-int htif_system_reset(u32 type)
+int htif_system_reset_check(u32 type, u32 reason)
+{
+	return 1;
+}
+
+void htif_system_reset(u32 type, u32 reason)
 {
 	while (1) {
 		fromhost = 0;
diff --git a/lib/utils/sys/sifive_test.c b/lib/utils/sys/sifive_test.c
index 06fbfb2..fdf3169 100644
--- a/lib/utils/sys/sifive_test.c
+++ b/lib/utils/sys/sifive_test.c
@@ -8,7 +8,7 @@
  */
 
 #include <sbi/riscv_io.h>
-#include <sbi/sbi_platform.h>
+#include <sbi/sbi_ecall_interface.h>
 #include <sbi_utils/sys/sifive_test.h>
 
 #define FINISHER_FAIL		0x3333
@@ -17,7 +17,19 @@
 
 static void *sifive_test_base;
 
-int sifive_test_system_reset(u32 type)
+int sifive_test_system_reset_check(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		return 1;
+	}
+
+	return 0;
+}
+
+void sifive_test_system_reset(u32 type, u32 reason)
 {
 	/*
 	 * Tell the "finisher" that the simulation
@@ -25,15 +37,16 @@ int sifive_test_system_reset(u32 type)
 	 */
 	switch (type) {
 	case SBI_SRST_RESET_TYPE_SHUTDOWN:
-		writew(FINISHER_PASS, sifive_test_base);
+		if (reason == SBI_SRST_RESET_REASON_NONE)
+			writew(FINISHER_PASS, sifive_test_base);
+		else
+			writew(FINISHER_FAIL, sifive_test_base);
 		break;
 	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
 	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
 		writew(FINISHER_RESET, sifive_test_base);
 		break;
 	}
-
-	return 0;
 }
 
 int sifive_test_init(unsigned long base)
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 8a53cdf..77a90d6 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -20,7 +20,10 @@ struct platform_override {
 	int (*final_init)(bool cold_boot, const struct fdt_match *match);
 	void (*early_exit)(const struct fdt_match *match);
 	void (*final_exit)(const struct fdt_match *match);
-	int (*system_reset)(u32 reset_type, const struct fdt_match *match);
+	int (*system_reset_check)(u32 reset_type, u32 reset_reason,
+				  const struct fdt_match *match);
+	void (*system_reset)(u32 reset_type, u32 reset_reason,
+			     const struct fdt_match *match);
 	int (*fdt_fixup)(void *fdt, const struct fdt_match *match);
 };
 
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 63c405a..6c93a51 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -184,12 +184,24 @@ static u64 generic_tlbr_flush_limit(void)
 	return SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT;
 }
 
-static int generic_system_reset(u32 reset_type)
+static int generic_system_reset_check(u32 reset_type, u32 reset_reason)
 {
-	if (generic_plat && generic_plat->system_reset)
-		return generic_plat->system_reset(reset_type,
-						  generic_plat_match);
-	return fdt_system_reset(reset_type);
+	if (generic_plat && generic_plat->system_reset_check)
+		return generic_plat->system_reset_check(reset_type,
+							reset_reason,
+							generic_plat_match);
+	return fdt_system_reset_check(reset_type, reset_reason);
+}
+
+static void generic_system_reset(u32 reset_type, u32 reset_reason)
+{
+	if (generic_plat && generic_plat->system_reset) {
+		generic_plat->system_reset(reset_type, reset_reason,
+					   generic_plat_match);
+		return;
+	}
+
+	fdt_system_reset(reset_type, reset_reason);
 }
 
 const struct sbi_platform_operations platform_ops = {
@@ -214,6 +226,7 @@ const struct sbi_platform_operations platform_ops = {
 	.timer_event_start	= fdt_timer_event_start,
 	.timer_init		= fdt_timer_init,
 	.timer_exit		= fdt_timer_exit,
+	.system_reset_check	= generic_system_reset_check,
 	.system_reset		= generic_system_reset,
 };
 
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index ba6803e..d0a45a2 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -186,13 +186,17 @@ static int ux600_timer_init(bool cold_boot)
 	return clint_warm_timer_init();
 }
 
-static int ux600_system_reset(u32 type)
+static int ux600_system_reset_check(u32 type, u32 reason)
+{
+	return 1;
+}
+
+static void ux600_system_reset(u32 type, u32 reason)
 {
 	/* Reset system using MSFTRST register in Nuclei Timer. */
 	writel(UX600_NUCLEI_TIMER_MSFTRST_KEY, (void *)(UX600_NUCLEI_TIMER_ADDR
 					+ UX600_NUCLEI_TIMER_MSFTRST_OFS));
 	while(1);
-	return 0;
 }
 
 const struct sbi_platform_operations platform_ops = {
@@ -209,6 +213,7 @@ const struct sbi_platform_operations platform_ops = {
 	.timer_event_stop	= clint_timer_event_stop,
 	.timer_event_start	= clint_timer_event_start,
 	.timer_init		= ux600_timer_init,
+	.system_reset_check	= ux600_system_reset_check,
 	.system_reset		= ux600_system_reset
 };
 
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 9cd750e..758e95f 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -178,13 +178,20 @@ static void platform_timer_event_stop(void)
 }
 
 /*
- * Reset the platform.
+ * Check reset type and reason supported by the platform.
  */
-static int platform_system_reset(u32 type)
+static int platform_system_reset_check(u32 type, u32 reason)
 {
 	return 0;
 }
 
+/*
+ * Reset the platform.
+ */
+static void platform_system_reset(u32 type, u32 reason)
+{
+}
+
 /*
  * Platform descriptor.
  */
@@ -202,6 +209,7 @@ const struct sbi_platform_operations platform_ops = {
 	.timer_event_stop	= platform_timer_event_stop,
 	.timer_event_start	= platform_timer_event_start,
 	.timer_init		= platform_timer_init,
+	.system_reset_check	= platform_system_reset_check,
 	.system_reset		= platform_system_reset
 };
 const struct sbi_platform platform = {
diff --git a/platform/thead/c910/platform.c b/platform/thead/c910/platform.c
index df7658a..dfa484a 100644
--- a/platform/thead/c910/platform.c
+++ b/platform/thead/c910/platform.c
@@ -108,10 +108,14 @@ static int c910_timer_init(bool cold_boot)
 	return clint_warm_timer_init();
 }
 
-static int c910_system_reset(u32 type)
+static int c910_system_reset_check(u32 type, u32 reason)
+{
+	return 1;
+}
+
+static void c910_system_reset(u32 type, u32 reason)
 {
 	asm volatile ("ebreak");
-	return 0;
 }
 
 int c910_hart_start(u32 hartid, ulong saddr)
@@ -135,6 +139,7 @@ const struct sbi_platform_operations platform_ops = {
 	.timer_init          = c910_timer_init,
 	.timer_event_start   = clint_timer_event_start,
 
+	.system_reset_check  = c910_system_reset_check,
 	.system_reset        = c910_system_reset,
 
 	.hart_start          = c910_hart_start,
-- 
2.25.1


