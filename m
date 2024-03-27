From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Wed, 27 Mar 2024 11:11:33 +0100
Subject: [PATCH 5/9] {allwinner/sun20i-d1,sophgo/sg2042,thead-generic}: Enable T-Head CSR read access
In-Reply-To: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
Message-ID: <20240327101137.3644359-6-christoph.muellner@vrull.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's enable the T-Head CSR read handler for all platform-overrides that
include a T-Head hart.

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
---
 platform/generic/Kconfig               | 3 +++
 platform/generic/allwinner/sun20i-d1.c | 2 ++
 platform/generic/sophgo/sg2042.c       | 2 ++
 platform/generic/thead/thead-generic.c | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index c9b6011..82024a5 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -26,6 +26,7 @@ config PLATFORM_GENERIC_MINOR_VER
 config PLATFORM_ALLWINNER_D1
 	bool "Allwinner D1 support"
 	depends on FDT_IRQCHIP_PLIC
+	select THEAD_C9XX_CSR
 	select THEAD_C9XX_PMU
 	default n
 
@@ -53,6 +54,7 @@ config PLATFORM_SIFIVE_FU740
 
 config PLATFORM_SOPHGO_SG2042
 	bool "Sophgo sg2042 support"
+	select THEAD_C9XX_CSR
 	select THEAD_C9XX_ERRATA
 	select THEAD_C9XX_PMU
 	default n
@@ -63,6 +65,7 @@ config PLATFORM_STARFIVE_JH7110
 
 config PLATFORM_THEAD
 	bool "THEAD C9xx support"
+	select THEAD_C9XX_CSR
 	select THEAD_C9XX_ERRATA
 	select THEAD_C9XX_PMU
 	default n
diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index ed19d5d..79bfe8b 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -5,6 +5,7 @@
  */
 
 #include <platform_override.h>
+#include <thead/c9xx_csr.h>
 #include <thead/c9xx_encoding.h>
 #include <thead/c9xx_pmu.h>
 #include <sbi/riscv_asm.h>
@@ -238,4 +239,5 @@ const struct platform_override sun20i_d1 = {
 	.final_init	= sun20i_d1_final_init,
 	.fdt_fixup	= sun20i_d1_fdt_fixup,
 	.extensions_init = sun20i_d1_extensions_init,
+	.read_csr		= thead_c9xx_read_csr,
 };
diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
index ae2d702..86c498e 100644
--- a/platform/generic/sophgo/sg2042.c
+++ b/platform/generic/sophgo/sg2042.c
@@ -7,6 +7,7 @@
  */
 
 #include <platform_override.h>
+#include <thead/c9xx_csr.h>
 #include <thead/c9xx_errata.h>
 #include <thead/c9xx_pmu.h>
 #include <sbi/sbi_const.h>
@@ -60,4 +61,5 @@ const struct platform_override sophgo_sg2042 = {
 	.match_table		= sophgo_sg2042_match,
 	.early_init		= sophgo_sg2042_early_init,
 	.extensions_init	= sophgo_sg2042_extensions_init,
+	.read_csr		= thead_c9xx_read_csr,
 };
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index 72f4aaa..5771642 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -7,6 +7,7 @@
  */
 
 #include <platform_override.h>
+#include <thead/c9xx_csr.h>
 #include <thead/c9xx_errata.h>
 #include <thead/c9xx_pmu.h>
 #include <sbi/sbi_const.h>
@@ -50,4 +51,5 @@ const struct platform_override thead_generic = {
 	.match_table		= thead_generic_match,
 	.early_init		= thead_generic_early_init,
 	.extensions_init	= thead_generic_extensions_init,
+	.read_csr		= thead_c9xx_read_csr,
 };
-- 
2.44.0


