From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 6 Sep 2023 17:40:50 +0800
Subject: [PATCH 5/6] platform: rzfive: Enable Andes PMU for RZ/Five
In-Reply-To: <20230906094051.3957564-1-peterlin@andestech.com>
References: <20230906094051.3957564-1-peterlin@andestech.com>
Message-ID: <20230906094051.3957564-6-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable Andes PMU extension support for RZ/Five.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 platform/generic/Kconfig                 | 1 +
 platform/generic/renesas/rzfive/rzfive.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 16c28fe..e6e7e94 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -38,6 +38,7 @@ config PLATFORM_RENESAS_RZFIVE
 	bool "Renesas RZ/Five support"
 	select ANDES45_PMA
 	select ANDES_SBI
+	select ANDES_PMU
 	default n
 
 config PLATFORM_SIFIVE_FU540
diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index a69797b..7b65a50 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -5,6 +5,7 @@
  */
 
 #include <andes/andes45_pma.h>
+#include <andes/andes_pmu.h>
 #include <andes/andes_sbi.h>
 #include <platform_override.h>
 #include <sbi/sbi_domain.h>
@@ -57,4 +58,5 @@ const struct platform_override renesas_rzfive = {
 	.early_init = renesas_rzfive_early_init,
 	.final_init = renesas_rzfive_final_init,
 	.vendor_ext_provider = andes_sbi_vendor_ext_provider,
+	.extensions_init = andes_pmu_extensions_init,
 };
-- 
2.34.1


