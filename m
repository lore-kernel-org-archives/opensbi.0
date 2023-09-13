From: Inochi Amaoto <inochiama@outlook.com>
Date: Wed, 13 Sep 2023 13:08:43 +0800
Subject: [RFC PATCH] platform: generic: thead: add sfence workaroud for th1520/sg2042
Message-ID: <IA1PR20MB4953D24EB4F9B84723C1BBCCBBF0A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As the mmu of T-HEAD th1520 and Sophgo sg2042 is still functional after
switching opensbi, so they need to execute sfence.vma in the trap handler to
function properly.

To handle this workaroud, add a degraded alternative mechanism in the thead
platform to patch the trap handler.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 firmware/fw_base.S                     |  9 ++++
 platform/generic/Kconfig               |  4 ++
 platform/generic/configs/defconfig     |  1 +
 platform/generic/thead/objects.mk      | 10 +++++
 platform/generic/thead/thead-generic.c | 62 ++++++++++++++++++++++++++
 platform/generic/thead/thead-patch.S   | 28 ++++++++++++
 6 files changed, 114 insertions(+)
 create mode 100644 platform/generic/thead/objects.mk
 create mode 100644 platform/generic/thead/thead-generic.c
 create mode 100644 platform/generic/thead/thead-patch.S

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index ca34b4c..80aa0a3 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -760,6 +760,15 @@ memcmp:
 	.globl _trap_handler
 	.globl _trap_exit
 _trap_handler:
+	/* pile for T-HEAD sfence workaround, nop for otherwise */
+	.option push
+	.option norvc
+	.option norelax
+
+	nop
+
+	.option pop
+
 	TRAP_SAVE_AND_SETUP_SP_T0
 
 	TRAP_SAVE_MEPC_MSTATUS 0
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
index 0000000..78a2a79
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
+platform-objs-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead/thead-patch.o
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
new file mode 100644
index 0000000..2755ae2
--- /dev/null
+++ b/platform/generic/thead/thead-generic.c
@@ -0,0 +1,62 @@
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
+#define THEAD_QUIRK_SFENCE_FIXUP		BIT(0)
+
+#define thead_get_symbol_local_address(_name)				\
+	({								\
+		register unsigned long __v;				\
+		__asm__ __volatile__ ("lla %0, " STRINGIFY(_name)	\
+				     : "=r"(__v)			\
+				     :					\
+				     : "memory");			\
+		(void*)__v;						\
+	})
+
+extern const unsigned int thead_patch_sfence_size;
+
+void thead_fixup_sfence(void)
+{
+	void* trap_addr = thead_get_symbol_local_address(_trap_handler);
+	void* patch_addr = thead_get_symbol_local_address(thead_patch_sfence);
+
+	sbi_memcpy(trap_addr, patch_addr, thead_patch_sfence_size);
+	RISCV_FENCE_I;
+}
+
+static int thead_generic_early_init(bool cold_boot, const struct fdt_match *match)
+{
+	unsigned long quirks = (unsigned long)match->data;
+
+	if (cold_boot) {
+		if (quirks & THEAD_QUIRK_SFENCE_FIXUP) {
+			thead_fixup_sfence();
+		}
+	}
+
+	return 0;
+}
+
+static const struct fdt_match thead_generic_match[] = {
+	{ .compatible = "thead,th1520",
+	  .data = (void*)THEAD_QUIRK_SFENCE_FIXUP },
+	{ },
+};
+
+const struct platform_override thead_generic = {
+	.match_table	= thead_generic_match,
+	.early_init	= thead_generic_early_init,
+};
diff --git a/platform/generic/thead/thead-patch.S b/platform/generic/thead/thead-patch.S
new file mode 100644
index 0000000..6921b1c
--- /dev/null
+++ b/platform/generic/thead/thead-patch.S
@@ -0,0 +1,28 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#include <sbi/riscv_elf.h>
+
+	.section .entry, "ax", %progbits
+	.align 3
+	.globl thead_patch_sfence
+thead_patch_sfence:
+	.option push
+	.option norvc
+	.option norelax
+
+	sfence.vma zero, t0
+
+	.option pop
+.equ _thead_patch_sfence_size, . - thead_patch_sfence
+
+	.section .rodata
+	.align 3
+	.globl thead_patch_sfence_size
+thead_patch_sfence_size:
+	RISCV_INT	_thead_patch_sfence_size
-- 
2.42.0


