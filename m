From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 18 Jan 2023 10:18:59 +0800
Subject: [PATCH v2 6/6] lib: reset/fdt_reset_atcwdt200: Use defined macros and function in atcsmu.h
In-Reply-To: <20230118021859.27010-1-peterlin@andestech.com>
References: <20230118021859.27010-1-peterlin@andestech.com>
Message-ID: <20230118021859.27010-7-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reuse the smu related macros and function in atcsmu.h.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 lib/utils/reset/fdt_reset_atcwdt200.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
index 91acc9f..c524f84 100644
--- a/lib/utils/reset/fdt_reset_atcwdt200.c
+++ b/lib/utils/reset/fdt_reset_atcwdt200.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_system.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/reset/fdt_reset.h>
+#include <sbi_utils/sys/atcsmu.h>
 
 #define ATCWDT200_WP_NUM 0x5aa5
 #define WREN_REG 0x18
@@ -41,12 +42,6 @@
 #define CLK_PCLK (1 << 1)
 #define WDT_EN (1 << 0)
 
-#define FLASH_BASE 0x80000000ULL
-#define SMU_RESET_VEC_LO_OFF 0x50
-#define SMU_RESET_VEC_HI_OFF 0x60
-#define SMU_HARTn_RESET_VEC_LO(n) (SMU_RESET_VEC_LO_OFF + (n * 0x4))
-#define SMU_HARTn_RESET_VEC_HI(n) (SMU_RESET_VEC_HI_OFF + (n * 0x4))
-
 static volatile char *wdt_addr;
 static volatile char *smu_addr;
 
@@ -66,10 +61,8 @@ static void ae350_system_reset(u32 type, u32 reason)
 {
 	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 
-	for (int i = 0; i < sbi_platform_hart_count(plat); i++) {
-		writel(FLASH_BASE, smu_addr + SMU_HARTn_RESET_VEC_LO(i));
-		writel(FLASH_BASE >> 32, smu_addr + SMU_HARTn_RESET_VEC_HI(i));
-	}
+	for (int i = 0; i < sbi_platform_hart_count(plat); i++)
+		smu_set_reset_vector(FLASH_BASE, i);
 
 	/* Program WDT control register  */
 	writew(ATCWDT200_WP_NUM, wdt_addr + WREN_REG);
-- 
2.34.1


