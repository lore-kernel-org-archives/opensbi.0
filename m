From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Sat, 10 Dec 2022 10:30:10 +0000
Subject: [PATCH v5 4/5] platform: generic: Add Renesas RZ/Five initial support
In-Reply-To: <20221210103011.7814-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221210103011.7814-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <20221210103011.7814-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This commit provides basic support for the Renesas RZ/Five
(R9A07G043F) SoC.

The RZ/Five microprocessor includes a single RISC-V CPU Core (Andes AX45MP)
1.0 GHz, 16-bit DDR3L/DDR4 interface. Supported interfaces include:
- Gigabit Ethernet 2ch
- CAN interface (CAN-FD) 2ch
- USB 2.0 interface 2ch
- SD interface 2ch
- AD converter 2ch

Useful links:
-------------
Links: https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
Links: http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
v4->v5
* No change

v3->v4
* Replaced "renesas,r9a07g043" -> "renesas,r9a07g043f01"
* Included RB tag

v2->v3
* New patch
---
 platform/generic/Kconfig                   |  4 ++++
 platform/generic/configs/defconfig         |  2 ++
 platform/generic/renesas/rzfive/objects.mk |  8 ++++++++
 platform/generic/renesas/rzfive/rzfive.c   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 platform/generic/renesas/rzfive/objects.mk
 create mode 100644 platform/generic/renesas/rzfive/rzfive.c

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 4b5d2cd..62c7a2d 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -32,6 +32,10 @@ config PLATFORM_ANDES_AE350
 	bool "Andes AE350 support"
 	default n
 
+config PLATFORM_RENESAS_RZFIVE
+	bool "Renesas RZ/Five support"
+	default n
+
 config PLATFORM_SIFIVE_FU540
 	bool "SiFive FU540 support"
 	default n
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 2eaeeb7..47fca95 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,5 +1,6 @@
 CONFIG_PLATFORM_ALLWINNER_D1=y
 CONFIG_PLATFORM_ANDES_AE350=y
+CONFIG_PLATFORM_RENESAS_RZFIVE=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_FDT_GPIO=y
@@ -24,6 +25,7 @@ CONFIG_FDT_SERIAL=y
 CONFIG_FDT_SERIAL_CADENCE=y
 CONFIG_FDT_SERIAL_GAISLER=y
 CONFIG_FDT_SERIAL_HTIF=y
+CONFIG_FDT_SERIAL_RENESAS_SCIF=y
 CONFIG_FDT_SERIAL_SHAKTI=y
 CONFIG_FDT_SERIAL_SIFIVE=y
 CONFIG_FDT_SERIAL_LITEX=y
diff --git a/platform/generic/renesas/rzfive/objects.mk b/platform/generic/renesas/rzfive/objects.mk
new file mode 100644
index 0000000..2e7e37f
--- /dev/null
+++ b/platform/generic/renesas/rzfive/objects.mk
@@ -0,0 +1,8 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (C) 2022 Renesas Electronics Corp.
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_RENESAS_RZFIVE) += renesas_rzfive
+platform-objs-$(CONFIG_PLATFORM_RENESAS_RZFIVE) += renesas/rzfive/rzfive.o
diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
new file mode 100644
index 0000000..ca182e3
--- /dev/null
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ */
+
+#include <platform_override.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+static const struct fdt_match renesas_rzfive_match[] = {
+	{ .compatible = "renesas,r9a07g043f01" },
+	{ /* sentinel */ }
+};
+
+const struct platform_override renesas_rzfive = {
+	.match_table = renesas_rzfive_match,
+};
-- 
2.17.1


