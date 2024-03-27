From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Wed, 27 Mar 2024 11:11:37 +0100
Subject: [PATCH 9/9] platform: generic: Add generic T-Head override
In-Reply-To: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
Message-ID: <20240327101137.3644359-10-christoph.muellner@vrull.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we have support for three T-Head C9xx platforms:

* Allwinner D1
* T-Head TH1520
* Sophgo SG2042

To make the platform detection more generic, let's add a
T-Head generic override that matches on T-Head's vendor ID.

Proper detection of T-Head harts is needed so we can insert
the CSR read-handler for th.mxstatus.

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
---
 platform/generic/Kconfig               |  5 +++++
 platform/generic/configs/defconfig     |  1 +
 platform/generic/thead/objects.mk      |  3 +++
 platform/generic/thead/thead-generic.c | 27 ++++++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 platform/generic/thead/thead-generic.c

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 6d85e51..e53582b 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -63,6 +63,11 @@ config PLATFORM_STARFIVE_JH7110
 	bool "StarFive JH7110 support"
 	default n
 
+config PLATFORM_THEAD_GENERIC
+	bool "T-HEAD generic support"
+	select THEAD_C9XX_CSR
+	default n
+
 config PLATFORM_THEAD_TH1520
 	bool "T-HEAD TH1520 support"
 	select THEAD_C9XX_CSR
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 52ec0f6..e435b6d 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -5,6 +5,7 @@ CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
+CONFIG_PLATFORM_THEAD_GENERIC=y
 CONFIG_PLATFORM_THEAD_TH1520=y
 CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_DESIGNWARE=y
diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
index 42f1f53..9d3a7e2 100644
--- a/platform/generic/thead/objects.mk
+++ b/platform/generic/thead/objects.mk
@@ -12,5 +12,8 @@ platform-objs-$(CONFIG_THEAD_C9XX_PMU) += thead/thead_c9xx_pmu.o
 platform-objs-$(CONFIG_THEAD_C9XX_ERRATA) += thead/thead_c9xx_tlb_trap_handler.o
 platform-objs-$(CONFIG_THEAD_C9XX_ERRATA) += thead/thead_c9xx_errata_tlb_flush.o
 
+carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead_generic
+platform-objs-$(CONFIG_PLATFORM_THEAD_GENERIC) += thead/thead-generic.o
+
 carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD_TH1520) += thead_th1520
 platform-objs-$(CONFIG_PLATFORM_THEAD_TH1520) += thead/thead-th1520.o
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
new file mode 100644
index 0000000..f694b90
--- /dev/null
+++ b/platform/generic/thead/thead-generic.c
@@ -0,0 +1,27 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Christoph M?llner <christoph.muellner@vrull.eu>
+ */
+
+#include <platform_override.h>
+#include <sbi/sbi_platform.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <thead/c9xx_csr.h>
+#include <thead/c9xx_encoding.h>
+
+static unsigned long thead_generic_vendor_ids[] = {
+	THEAD_VENDOR_ID,
+	0,
+};
+
+static const struct fdt_match thead_generic_match[] = {
+	{ },
+};
+
+const struct platform_override thead_generic = {
+	.match_table		= thead_generic_match,
+	.match_vendor_ids	= thead_generic_vendor_ids,
+	.read_csr		= thead_c9xx_read_csr,
+};
-- 
2.44.0


