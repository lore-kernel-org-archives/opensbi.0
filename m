From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 15 Sep 2023 17:39:36 +0800
Subject: [PATCH v2] platform: generic: thead: fix stale TLB entries for th1520/sg2042
Message-ID: <IA1PR20MB495365BF4F1FFA74C7CCEA9CBBF6A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The TLB entries remain functional all the time once added in T-HEAD th1520
and Sophgo sg2042 (even if the MMU is then disabled afterwards). If there
are some stale TLB entries that contains the address of SBI, it will cause
unexpected memory access and issue a illegal instruction error. To avoid
this, a TLB flush is needed to drop these TLB entries before any memory
access in the trap handler.

To handle this workaroud, add a custom trap handler with executing TLB flush
first in the T-HEAD platform to fix affected socs.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
Changed from v1:
1. remove stale code in RFC v2;
2. change quirk and function name to "TLB_FLUSH_FIXUP" for clear meaning.

Changed from RFC v2:
1. rollback the moving of trap helper macro to sbi_trap.h
2. use direct jump in custom trap handler to access _trap_handler

Changed from RFC:
1. use custom trap handler instead of asm alternative.
2. change description
---
 platform/generic/Kconfig                    |  4 ++
 platform/generic/configs/defconfig          |  1 +
 platform/generic/thead/objects.mk           | 10 +++++
 platform/generic/thead/thead-generic.c      | 50 +++++++++++++++++++++
 platform/generic/thead/thead-trap-handler.S | 13 ++++++
 5 files changed, 78 insertions(+)
 create mode 100644 platform/generic/thead/objects.mk
 create mode 100644 platform/generic/thead/thead-generic.c
 create mode 100644 platform/generic/thead/thead-trap-handler.S

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 72768ed..68dd58c 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -52,6 +52,10 @@ config PLATFORM_STARFIVE_JH7110
 	bool "StarFive JH7110 support"
 	default n

+config PLATFORM_THEAD_GENERIC
+	bool "THEAD C9xx generic platform support"
+	default n
+
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"

 endif
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 634d410..26f0874 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -4,6 +4,7 @@ CONFIG_PLATFORM_RENESAS_RZFIVE=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
+CONFIG_PLATFORM_THEAD_GENERIC=y
 CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_DESIGNWARE=y
 CONFIG_FDT_GPIO_SIFIVE=y
diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
new file mode 100644
index 0000000..cbbab18
--- /dev/null
+++ b/platform/generic/thead/objects.mk
@@ -0,0 +1,10 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+# Copyright (C) 2023 Alibaba Group Holding Limited.
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead_generic
+platform-objs-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead/thead-generic.o
+platform-objs-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead/thead-trap-handler.o
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
new file mode 100644
index 0000000..8120f6f
--- /dev/null
+++ b/platform/generic/thead/thead-generic.c
@@ -0,0 +1,50 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#include <platform_override.h>
+#include <sbi/riscv_barrier.h>
+#include <sbi/sbi_const.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+/**
+ * T-HEAD board with this quirk need to execute sfence.vma to flush
+ * stale entrie avoid incorrect memory access.
+ */
+#define THEAD_QUIRK_TLB_FLUSH_FIXUP		BIT(0)
+
+void _thead_tlb_flush_fixup_trap_handler(void);
+
+void thead_register_tlb_flush_trap_handler(void)
+{
+	csr_write(CSR_MTVEC, &_thead_tlb_flush_fixup_trap_handler);
+}
+
+static int thead_generic_early_init(bool cold_boot,
+				    const struct fdt_match *match)
+{
+	unsigned long quirks = (unsigned long)match->data;
+
+	if (quirks & THEAD_QUIRK_TLB_FLUSH_FIXUP)
+		thead_register_tlb_flush_trap_handler();
+
+	return 0;
+}
+
+static const struct fdt_match thead_generic_match[] = {
+	{ .compatible = "thead,th1520",
+	  .data = (void*)THEAD_QUIRK_TLB_FLUSH_FIXUP },
+	{ },
+};
+
+const struct platform_override thead_generic = {
+	.match_table	= thead_generic_match,
+	.early_init	= thead_generic_early_init,
+};
diff --git a/platform/generic/thead/thead-trap-handler.S b/platform/generic/thead/thead-trap-handler.S
new file mode 100644
index 0000000..861c029
--- /dev/null
+++ b/platform/generic/thead/thead-trap-handler.S
@@ -0,0 +1,13 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+	.section .entry, "ax", %progbits
+	.align 3
+	.globl _thead_tlb_flush_fixup_trap_handler
+_thead_tlb_flush_fixup_trap_handler:
+	sfence.vma t0, zero
+	j _trap_handler
--
2.42.0


