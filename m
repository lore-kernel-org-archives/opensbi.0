From: Vivian Wang <dramforever@live.com>
Date: Tue, 11 Oct 2022 00:34:45 +0800
Subject: [PATCH 3/3] lib: sbi_ecall: Add Kconfig option for each extension
In-Reply-To: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <TYYP286MB14396945149DFFB36ADA5D8FC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For each SBI extension, we:

- Add a Kconfig option for it
- Add the extension to sbi_ecall_exts only if the extension is enabled
- Add the corresponding sbi_ecall_* object file only if the extension is
  enabled

Special cases are as follows:

- The legacy extensions are lumped together as one 'big' extension, as
  has always been the case in OpenSBI code.
- The platform-defined vendor extensions are regarded as one extension.
- The Base extension cannot be disabled.
- sbi_ecall_replace implements multiple extensions, so it's not easy to
  avoid linking it in. Enable it always, and use #ifdef to
  disable/enable individual extensions.

Signed-off-by: Vivian Wang <dramforever@live.com>
---
 Kconfig                     |  2 ++
 lib/sbi/Kconfig             | 37 +++++++++++++++++++++++++++++++++++++
 lib/sbi/objects.mk          | 24 ++++++++++++------------
 lib/sbi/sbi_ecall_replace.c |  8 ++++++++
 4 files changed, 59 insertions(+), 12 deletions(-)
 create mode 100644 lib/sbi/Kconfig

diff --git a/Kconfig b/Kconfig
index b3213a9..acfc138 100644
--- a/Kconfig
+++ b/Kconfig
@@ -18,6 +18,8 @@ menu "Platform Options"
 source "$(OPENSBI_PLATFORM_SRC_DIR)/Kconfig"
 endmenu
 
+source "$(OPENSBI_SRC_DIR)/lib/sbi/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/firmware/Kconfig"
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
new file mode 100644
index 0000000..df74bba
--- /dev/null
+++ b/lib/sbi/Kconfig
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "SBI Extension Support"
+
+config SBI_ECALL_TIME
+	bool "Timer extension"
+	default y
+
+config SBI_ECALL_RFENCE
+	bool "RFENCE extension"
+	default y
+
+config SBI_ECALL_IPI
+	bool "IPI extension"
+	default y
+
+config SBI_ECALL_HSM
+	bool "Hart State Management extension"
+	default y
+
+config SBI_ECALL_SRST
+	bool "System Reset extension"
+	default y
+
+config SBI_ECALL_PMU
+	bool "Performance Monitoring Unit extension"
+	default y
+
+config SBI_ECALL_LEGACY
+	bool "SBI v0.1 legacy extensions"
+	default y
+
+config SBI_ECALL_VENDOR
+	bool "Platform-defined vendor extensions"
+	default y
+
+endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index fa20b7b..783c46d 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -16,22 +16,22 @@ libsbi-objs-y += sbi_ecall.o
 libsbi-objs-y += sbi_ecall_exts.o
 
 # The order of below extensions is performance optimized
-carray-sbi_ecall_exts-y += ecall_time
-carray-sbi_ecall_exts-y += ecall_rfence
-carray-sbi_ecall_exts-y += ecall_ipi
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_TIME) += ecall_time
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_RFENCE) += ecall_rfence
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_IPI) += ecall_ipi
 carray-sbi_ecall_exts-y += ecall_base
-carray-sbi_ecall_exts-y += ecall_hsm
-carray-sbi_ecall_exts-y += ecall_srst
-carray-sbi_ecall_exts-y += ecall_pmu
-carray-sbi_ecall_exts-y += ecall_legacy
-carray-sbi_ecall_exts-y += ecall_vendor
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_HSM) += ecall_hsm
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SRST) += ecall_srst
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_PMU) += ecall_pmu
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
 
 libsbi-objs-y += sbi_ecall_base.o
-libsbi-objs-y += sbi_ecall_hsm.o
-libsbi-objs-y += sbi_ecall_legacy.o
-libsbi-objs-y += sbi_ecall_pmu.o
+libsbi-objs-$(CONFIG_SBI_ECALL_HSM) += sbi_ecall_hsm.o
+libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
+libsbi-objs-$(CONFIG_SBI_ECALL_PMU) += sbi_ecall_pmu.o
 libsbi-objs-y += sbi_ecall_replace.o
-libsbi-objs-y += sbi_ecall_vendor.o
+libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
 
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_replace.c
index 93f44da..0ea00d6 100644
--- a/lib/sbi/sbi_ecall_replace.c
+++ b/lib/sbi/sbi_ecall_replace.c
@@ -19,6 +19,7 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_trap.h>
 
+#ifdef CONFIG_SBI_ECALL_TIME
 static int sbi_ecall_time_handler(unsigned long extid, unsigned long funcid,
 				  const struct sbi_trap_regs *regs,
 				  unsigned long *out_val,
@@ -43,7 +44,9 @@ struct sbi_ecall_extension ecall_time = {
 	.extid_end = SBI_EXT_TIME,
 	.handle = sbi_ecall_time_handler,
 };
+#endif
 
+#ifdef CONFIG_SBI_ECALL_RFENCE
 static int sbi_ecall_rfence_handler(unsigned long extid, unsigned long funcid,
 				    const struct sbi_trap_regs *regs,
 				    unsigned long *out_val,
@@ -113,7 +116,9 @@ struct sbi_ecall_extension ecall_rfence = {
 	.extid_end = SBI_EXT_RFENCE,
 	.handle = sbi_ecall_rfence_handler,
 };
+#endif
 
+#ifdef CONFIG_SBI_ECALL_IPI
 static int sbi_ecall_ipi_handler(unsigned long extid, unsigned long funcid,
 				 const struct sbi_trap_regs *regs,
 				 unsigned long *out_val,
@@ -134,7 +139,9 @@ struct sbi_ecall_extension ecall_ipi = {
 	.extid_end = SBI_EXT_IPI,
 	.handle = sbi_ecall_ipi_handler,
 };
+#endif
 
+#ifdef CONFIG_SBI_ECALL_SRST
 static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
 				  const struct sbi_trap_regs *regs,
 				  unsigned long *out_val,
@@ -194,3 +201,4 @@ struct sbi_ecall_extension ecall_srst = {
 	.handle = sbi_ecall_srst_handler,
 	.probe = sbi_ecall_srst_probe,
 };
+#endif
-- 
2.37.1


