From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 6 Sep 2023 17:40:49 +0800
Subject: [PATCH 4/6] platform: andes: Enable Andes PMU for AE350
In-Reply-To: <20230906094051.3957564-1-peterlin@andestech.com>
References: <20230906094051.3957564-1-peterlin@andestech.com>
Message-ID: <20230906094051.3957564-5-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable Andes PMU extension support for AE350 platforms.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 platform/generic/Kconfig       | 1 +
 platform/generic/andes/ae350.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 72768ed..16c28fe 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -31,6 +31,7 @@ config PLATFORM_ALLWINNER_D1
 config PLATFORM_ANDES_AE350
 	bool "Andes AE350 support"
 	select SYS_ATCSMU
+	select ANDES_PMU
 	default n
 
 config PLATFORM_RENESAS_RZFIVE
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 01bd02d..c8adb0d 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -8,6 +8,7 @@
  */
 
 #include <platform_override.h>
+#include <andes/andes_pmu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/sys/atcsmu.h>
@@ -118,4 +119,5 @@ static const struct fdt_match andes_ae350_match[] = {
 const struct platform_override andes_ae350 = {
 	.match_table = andes_ae350_match,
 	.final_init  = ae350_final_init,
+	.extensions_init = andes_pmu_extensions_init,
 };
-- 
2.34.1


