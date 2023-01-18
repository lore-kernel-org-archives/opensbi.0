From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 18 Jan 2023 15:42:30 +0100
Subject: [PATCH 07/11] lib: sbi: Add system suspend skeleton
In-Reply-To: <20230118144234.79263-1-ajones@ventanamicro.com>
References: <20230118144234.79263-1-ajones@ventanamicro.com>
Message-ID: <20230118144234.79263-8-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the SUSP extension probe and ecall support, but for now the
system suspend function is just a stub.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_ecall_interface.h |  8 ++++++
 include/sbi/sbi_system.h          | 17 +++++++++++
 lib/sbi/Kconfig                   |  4 +++
 lib/sbi/objects.mk                |  3 ++
 lib/sbi/sbi_ecall_susp.c          | 48 +++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c                |  4 +++
 lib/sbi/sbi_system.c              | 26 +++++++++++++++++
 7 files changed, 110 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_susp.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index a3f2bf4bdf69..98a426a74ec4 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -29,6 +29,7 @@
 #define SBI_EXT_HSM				0x48534D
 #define SBI_EXT_SRST				0x53525354
 #define SBI_EXT_PMU				0x504D55
+#define SBI_EXT_SUSP				0x53555350
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -230,6 +231,13 @@ enum sbi_pmu_ctr_type {
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 
+/* SBI function IDs for SUSP extension */
+#define SBI_EXT_SUSP_SUSPEND			0x0
+
+#define SBI_SUSP_SLEEP_TYPE_SUSPEND		0x0
+#define SBI_SUSP_SLEEP_TYPE_LAST		SBI_SUSP_SLEEP_TYPE_SUSPEND
+#define SBI_SUSP_PLATFORM_SLEEP_START		0x80000000
+
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
diff --git a/include/sbi/sbi_system.h b/include/sbi/sbi_system.h
index 84c281383d8c..65ea3d36d6cf 100644
--- a/include/sbi/sbi_system.h
+++ b/include/sbi/sbi_system.h
@@ -43,4 +43,21 @@ bool sbi_system_reset_supported(u32 reset_type, u32 reset_reason);
 
 void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason);
 
+/** System suspend device */
+struct sbi_system_suspend_device {
+	/** Name of the system suspend device */
+	char name[32];
+
+	/* Check whether sleep type is supported by the device */
+	int (*system_suspend_check)(u32 sleep_type);
+
+	/** Suspend the system */
+	int (*system_suspend)(u32 sleep_type);
+};
+
+const struct sbi_system_suspend_device *sbi_system_suspend_get_device(void);
+void sbi_system_suspend_set_device(struct sbi_system_suspend_device *dev);
+bool sbi_system_suspend_supported(u32 sleep_type);
+int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque);
+
 #endif
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index df74bba38540..7e139017fec7 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -22,6 +22,10 @@ config SBI_ECALL_SRST
 	bool "System Reset extension"
 	default y
 
+config SBI_ECALL_SUSP
+	bool "System Suspend extension"
+	default y
+
 config SBI_ECALL_PMU
 	bool "Performance Monitoring Unit extension"
 	default y
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index c774ebbcd142..c4f3d0991aa2 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -34,6 +34,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_HSM) += sbi_ecall_hsm.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SRST) += ecall_srst
 libsbi-objs-$(CONFIG_SBI_ECALL_SRST) += sbi_ecall_srst.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SUSP) += ecall_susp
+libsbi-objs-$(CONFIG_SBI_ECALL_SUSP) += sbi_ecall_susp.o
+
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_PMU) += ecall_pmu
 libsbi-objs-$(CONFIG_SBI_ECALL_PMU) += sbi_ecall_pmu.o
 
diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
new file mode 100644
index 000000000000..f20126c49a60
--- /dev/null
+++ b/lib/sbi/sbi_ecall_susp.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: BSD-2-Clause
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_system.h>
+
+static int sbi_ecall_susp_handler(unsigned long extid, unsigned long funcid,
+				  const struct sbi_trap_regs *regs,
+				  unsigned long *out_val,
+				  struct sbi_trap_info *out_trap)
+{
+	int ret = SBI_ENOTSUPP;
+
+	if (funcid == SBI_EXT_SUSP_SUSPEND)
+		ret = sbi_system_suspend(regs->a0, regs->a1, regs->a2);
+
+	if (ret >= 0) {
+		*out_val = ret;
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static int sbi_ecall_susp_probe(unsigned long extid, unsigned long *out_val)
+{
+	u32 type, count = 0;
+
+	/*
+	 * At least one suspend type should be supported by the
+	 * platform for the SBI SUSP extension to be usable.
+	 */
+	for (type = 0; type <= SBI_SUSP_SLEEP_TYPE_LAST; type++) {
+		if (sbi_system_suspend_supported(type))
+			count++;
+	}
+
+	*out_val = count ? 1 : 0;
+	return 0;
+}
+
+struct sbi_ecall_extension ecall_susp = {
+	.extid_start = SBI_EXT_SUSP,
+	.extid_end = SBI_EXT_SUSP,
+	.handle = sbi_ecall_susp_handler,
+	.probe = sbi_ecall_susp_probe,
+};
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 259a191051a7..0d8fdfbe9a41 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -69,6 +69,7 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	const struct sbi_timer_device *tdev;
 	const struct sbi_console_device *cdev;
 	const struct sbi_system_reset_device *srdev;
+	const struct sbi_system_suspend_device *susp_dev;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
@@ -103,6 +104,9 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	srdev = sbi_system_reset_get_device(SBI_SRST_RESET_TYPE_SHUTDOWN, 0);
 	sbi_printf("Platform Shutdown Device  : %s\n",
 		   (srdev) ? srdev->name : "---");
+	susp_dev = sbi_system_suspend_get_device();
+	sbi_printf("Platform Suspend Device   : %s\n",
+		   (susp_dev) ? susp_dev->name : "---");
 
 	/* Firmware details */
 	sbi_printf("Firmware Base             : 0x%lx\n", scratch->fw_start);
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index f37c811d0bf3..5c123a6c9d8d 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -92,3 +92,29 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
 	/* If platform specific reset did not work then do sbi_exit() */
 	sbi_exit(scratch);
 }
+
+static const struct sbi_system_suspend_device *suspend_dev = NULL;
+
+const struct sbi_system_suspend_device *sbi_system_suspend_get_device(void)
+{
+	return suspend_dev;
+}
+
+void sbi_system_suspend_set_device(struct sbi_system_suspend_device *dev)
+{
+	if (!dev || suspend_dev)
+		return;
+
+	suspend_dev = dev;
+}
+
+bool sbi_system_suspend_supported(u32 sleep_type)
+{
+	return suspend_dev && suspend_dev->system_suspend_check &&
+	       suspend_dev->system_suspend_check(sleep_type);
+}
+
+int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
+{
+	return 0;
+}
-- 
2.39.0


