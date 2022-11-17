From: zhangleizheng@eswincomputing.com <zhangleizheng@eswincomputing.com>
Date: Thu, 17 Nov 2022 15:17:05 +0800
Subject: [PATCH] platform: generic/allwinner: Optimize header file location
Message-ID: <20221117071705.350-1-zhangleizheng@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Leizheng Zhang <zhangleizheng@eswincomputing.com>

Optimize sbi/sbi_console.h file location

Signed-off-by: Leizheng Zhang <zhangleizheng@eswincomputing.com>
---
 platform/generic/allwinner/sun20i-d1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 6a502e5..d2a0f53 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -7,6 +7,7 @@
 #include <platform_override.h>
 #include <thead_c9xx.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
@@ -201,8 +202,6 @@ static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
 	return 0;
 }
 
-#include <sbi/sbi_console.h>
-
 static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
 {
 	unsigned long mip_val;
-- 
2.17.1


