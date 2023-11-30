From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 30 Nov 2023 20:42:06 +0800
Subject: [PATCH v4 08/15] platform: andes: Enable Andes PMU for AE350
In-Reply-To: <20231130124213.2590640-1-peterlin@andestech.com>
References: <20231130124213.2590640-1-peterlin@andestech.com>
Message-ID: <20231130124213.2590640-9-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable Andes PMU extension support for AE350 platforms.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Changes v1 -> v2:
  - Implement ae350_extensions_init()
Changes v2 -> v3:
  - Use the andes_pmu_extensions_init() and andes_pmu_init() provided by andes_pmu.c
    We have no plan to introduce other extensions in near future so extensions_init()
    bind with andes_pmu_extensions_init() directly.
Changes v3 -> v4:
  - Include RB tags
---
 platform/generic/Kconfig       | 1 +
 platform/generic/andes/ae350.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index a902cf3..89e5603 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -32,6 +32,7 @@ config PLATFORM_ALLWINNER_D1
 config PLATFORM_ANDES_AE350
 	bool "Andes AE350 support"
 	select SYS_ATCSMU
+	select ANDES_PMU
 	default n
 
 config PLATFORM_RENESAS_RZFIVE
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 80eca05..dc769b7 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -8,6 +8,7 @@
  */
 
 #include <platform_override.h>
+#include <andes/andes_pmu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/sys/atcsmu.h>
@@ -118,4 +119,6 @@ static const struct fdt_match andes_ae350_match[] = {
 const struct platform_override andes_ae350 = {
 	.match_table = andes_ae350_match,
 	.final_init  = ae350_final_init,
+	.extensions_init = andes_pmu_extensions_init,
+	.pmu_init = andes_pmu_init,
 };
-- 
2.34.1


