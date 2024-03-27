From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Wed, 27 Mar 2024 11:11:34 +0100
Subject: [PATCH 6/9] platform: thead: Rename thead-generic to thead-th1520
In-Reply-To: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
Message-ID: <20240327101137.3644359-7-christoph.muellner@vrull.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The name generic is misleading since the compatible string list
only has a single entry for the TH1520 ('thead,th1520').
Further, thead-generic is irrelevant for other platforms
that include a T-Head CPU (e.g. the Allwinner D1).
Therefore, let's rename thead-generic to thead-th1520.

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
---
 platform/generic/Kconfig                      |  4 ++--
 platform/generic/configs/defconfig            |  2 +-
 platform/generic/thead/objects.mk             |  4 ++--
 .../thead/{thead-generic.c => thead-th1520.c} | 20 +++++++++----------
 4 files changed, 15 insertions(+), 15 deletions(-)
 rename platform/generic/thead/{thead-generic.c => thead-th1520.c} (61%)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 82024a5..6d85e51 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -63,8 +63,8 @@ config PLATFORM_STARFIVE_JH7110
 	bool "StarFive JH7110 support"
 	default n
 
-config PLATFORM_THEAD
-	bool "THEAD C9xx support"
+config PLATFORM_THEAD_TH1520
+	bool "T-HEAD TH1520 support"
 	select THEAD_C9XX_CSR
 	select THEAD_C9XX_ERRATA
 	select THEAD_C9XX_PMU
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 1ce6a12..52ec0f6 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -5,7 +5,7 @@ CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
-CONFIG_PLATFORM_THEAD=y
+CONFIG_PLATFORM_THEAD_TH1520=y
 CONFIG_FDT_GPIO=y
 CONFIG_FDT_GPIO_DESIGNWARE=y
 CONFIG_FDT_GPIO_SIFIVE=y
diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
index 5606d36..42f1f53 100644
--- a/platform/generic/thead/objects.mk
+++ b/platform/generic/thead/objects.mk
@@ -12,5 +12,5 @@ platform-objs-$(CONFIG_THEAD_C9XX_PMU) += thead/thead_c9xx_pmu.o
 platform-objs-$(CONFIG_THEAD_C9XX_ERRATA) += thead/thead_c9xx_tlb_trap_handler.o
 platform-objs-$(CONFIG_THEAD_C9XX_ERRATA) += thead/thead_c9xx_errata_tlb_flush.o
 
-carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD) += thead_generic
-platform-objs-$(CONFIG_PLATFORM_THEAD) += thead/thead-generic.o
+carray-platform_override_modules-$(CONFIG_PLATFORM_THEAD_TH1520) += thead_th1520
+platform-objs-$(CONFIG_PLATFORM_THEAD_TH1520) += thead/thead-th1520.o
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-th1520.c
similarity index 61%
rename from platform/generic/thead/thead-generic.c
rename to platform/generic/thead/thead-th1520.c
index 5771642..86c265f 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-th1520.c
@@ -16,14 +16,14 @@
 #include <sbi/sbi_string.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
-struct thead_generic_quirks {
+struct thead_th1520_quirks {
 	u64	errata;
 };
 
-static int thead_generic_early_init(bool cold_boot,
+static int thead_th1520_early_init(bool cold_boot,
 				    const struct fdt_match *match)
 {
-	struct thead_generic_quirks *quirks = (void *)match->data;
+	struct thead_th1520_quirks *quirks = (void *)match->data;
 
 	if (quirks->errata & THEAD_QUIRK_ERRATA_TLB_FLUSH)
 		thead_register_tlb_flush_trap_handler();
@@ -31,25 +31,25 @@ static int thead_generic_early_init(bool cold_boot,
 	return 0;
 }
 
-static int thead_generic_extensions_init(const struct fdt_match *match,
+static int thead_th1520_extensions_init(const struct fdt_match *match,
 					 struct sbi_hart_features *hfeatures)
 {
 	thead_c9xx_register_pmu_device();
 	return 0;
 }
 
-static struct thead_generic_quirks thead_th1520_quirks = {
+static struct thead_th1520_quirks thead_th1520_quirks = {
 	.errata = THEAD_QUIRK_ERRATA_TLB_FLUSH,
 };
 
-static const struct fdt_match thead_generic_match[] = {
+static const struct fdt_match thead_th1520_match[] = {
 	{ .compatible = "thead,th1520", .data = &thead_th1520_quirks },
 	{ },
 };
 
-const struct platform_override thead_generic = {
-	.match_table		= thead_generic_match,
-	.early_init		= thead_generic_early_init,
-	.extensions_init	= thead_generic_extensions_init,
+const struct platform_override thead_th1520 = {
+	.match_table		= thead_th1520_match,
+	.early_init		= thead_th1520_early_init,
+	.extensions_init	= thead_th1520_extensions_init,
 	.read_csr		= thead_c9xx_read_csr,
 };
-- 
2.44.0


