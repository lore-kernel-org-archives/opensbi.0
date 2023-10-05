From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu,  5 Oct 2023 14:58:42 +0800
Subject: [PATCH v2 3/4] platform: generic: thead: separate implement of T-HEAD c9xx errata
In-Reply-To: <20231005065843.239501-1-inochiama@outlook.com>
References: <IA1PR20MB4953287B7688E0F5058984BDBBCAA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231005065843.239501-1-inochiama@outlook.com>
Message-ID: <IA1PR20MB495386DC04E588A3869ADD69BBCAA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Separate the implement of T-HEAD c9xx errata to allow any platform
with bug related to c9xx cores can use it.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 platform/generic/Kconfig                      |  1 +
 platform/generic/include/thead/c9xx_errata.h  | 14 ++++++++++
 platform/generic/thead/Kconfig                |  4 +++
 platform/generic/thead/objects.mk             |  4 ++-
 platform/generic/thead/thead-generic.c        | 28 ++++++++-----------
 .../thead/thead_c9xx_errata_tlb_flush.c       | 17 +++++++++++
 ...andler.S => thead_c9xx_tlb_trap_handler.S} |  0
 7 files changed, 50 insertions(+), 18 deletions(-)
 create mode 100644 platform/generic/include/thead/c9xx_errata.h
 create mode 100644 platform/generic/thead/thead_c9xx_errata_tlb_flush.c
 rename platform/generic/thead/{thead-trap-handler.S => thead_c9xx_tlb_trap_handler.S} (100%)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index ea3b5cf..3be75cf 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -55,6 +55,7 @@ config PLATFORM_STARFIVE_JH7110
 
 config PLATFORM_THEAD
 	bool "THEAD C9xx support"
+	select THEAD_C9XX_ERRATA
 	default n
 
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
diff --git a/platform/generic/include/thead/c9xx_errata.h b/platform/generic/include/thead/c9xx_errata.h
new file mode 100644
index 0000000..b617762
--- /dev/null
+++ b/platform/generic/include/thead/c9xx_errata.h
@@ -0,0 +1,14 @@
+
+#ifndef __RISCV_THEAD_C9XX_ERRATA_H____
+#define __RISCV_THEAD_C9XX_ERRATA_H____
+
+/**
+ * T-HEAD board with this quirk need to execute sfence.vma to flush
+ * stale entrie avoid incorrect memory access.
+ */
+#define THEAD_QUIRK_ERRATA_TLB_FLUSH		BIT(0)
+
+void thead_register_tlb_flush_trap_handler(void);
+
+#endif // __RISCV_THEAD_C9XX_ERRATA_H____
+
diff --git a/platform/generic/thead/Kconfig b/platform/generic/thead/Kconfig
index e54e621..c50d38e 100644
--- a/platform/generic/thead/Kconfig
+++ b/platform/generic/thead/Kconfig
@@ -3,3 +3,7 @@
 config THEAD_C9XX_PMU
 	bool "T-HEAD c9xx M-mode PMU support"
 	default n
+
+config THEAD_C9XX_ERRATA
+	bool "T-HEAD c9xx errata support"
+	default n
diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
index df2c61b..84f9faf 100644
--- a/platform/generic/thead/objects.mk
+++ b/platform/generic/thead/objects.mk
@@ -7,6 +7,8 @@
 
 platform-objs-$(CONFIG_THEAD_C9XX_PMU) += thead/thead_c9xx_pmu.o
 
+platform-objs-$(CONFIG_THEAD_C9XX_ERRATA) += thead/thead_c9xx_tlb_trap_handler.o
+platform-objs-$(CONFIG_THEAD_C9XX_ERRATA) += thead/thead_c9xx_errata_tlb_flush.o
+
 carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD) += thead_generic
 platform-objs-$(CONFIG_PLATFORM_THEAD) += thead/thead-generic.o
-platform-objs-$(CONFIG_PLATFORM_THEAD) += thead/thead-trap-handler.o
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index 8120f6f..c77140c 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -7,40 +7,34 @@
  */
 
 #include <platform_override.h>
-#include <sbi/riscv_barrier.h>
+#include <thead/c9xx_errata.h>
 #include <sbi/sbi_const.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
-/**
- * T-HEAD board with this quirk need to execute sfence.vma to flush
- * stale entrie avoid incorrect memory access.
- */
-#define THEAD_QUIRK_TLB_FLUSH_FIXUP		BIT(0)
-
-void _thead_tlb_flush_fixup_trap_handler(void);
-
-void thead_register_tlb_flush_trap_handler(void)
-{
-	csr_write(CSR_MTVEC, &_thead_tlb_flush_fixup_trap_handler);
-}
+struct thead_generic_quirks {
+	u64	errata;
+};
 
 static int thead_generic_early_init(bool cold_boot,
 				    const struct fdt_match *match)
 {
-	unsigned long quirks = (unsigned long)match->data;
+	struct thead_generic_quirks *quirks = (void *)match->data;
 
-	if (quirks & THEAD_QUIRK_TLB_FLUSH_FIXUP)
+	if (quirks->errata & THEAD_QUIRK_ERRATA_TLB_FLUSH)
 		thead_register_tlb_flush_trap_handler();
 
 	return 0;
 }
 
+static struct thead_generic_quirks thead_th1520_quirks = {
+	.errata = THEAD_QUIRK_ERRATA_TLB_FLUSH,
+};
+
 static const struct fdt_match thead_generic_match[] = {
-	{ .compatible = "thead,th1520",
-	  .data = (void*)THEAD_QUIRK_TLB_FLUSH_FIXUP },
+	{ .compatible = "thead,th1520", .data = &thead_th1520_quirks },
 	{ },
 };
 
diff --git a/platform/generic/thead/thead_c9xx_errata_tlb_flush.c b/platform/generic/thead/thead_c9xx_errata_tlb_flush.c
new file mode 100644
index 0000000..755899a
--- /dev/null
+++ b/platform/generic/thead/thead_c9xx_errata_tlb_flush.c
@@ -0,0 +1,17 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_asm.h>
+
+void _thead_tlb_flush_fixup_trap_handler(void);
+
+void thead_register_tlb_flush_trap_handler(void)
+{
+	csr_write(CSR_MTVEC, &_thead_tlb_flush_fixup_trap_handler);
+}
diff --git a/platform/generic/thead/thead-trap-handler.S b/platform/generic/thead/thead_c9xx_tlb_trap_handler.S
similarity index 100%
rename from platform/generic/thead/thead-trap-handler.S
rename to platform/generic/thead/thead_c9xx_tlb_trap_handler.S
-- 
2.42.0


