From: zhangleizheng@eswincomputing.com <zhangleizheng@eswincomputing.com>
Date: Fri, 18 Nov 2022 13:20:29 +0800
Subject: [PATCH v2] platform: generic/allwinner: Remove unused header files
Message-ID: <20221118052029.1275-1-zhangleizheng@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Leizheng Zhang <zhangleizheng@eswincomputing.com>

Remove "#include <sbi/sbi_console.h>"

Signed-off-by: Leizheng Zhang <zhangleizheng@eswincomputing.com>
---
 platform/generic/allwinner/sun20i-d1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 6a502e5..707313b 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -201,8 +201,6 @@ static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
 	return 0;
 }
 
-#include <sbi/sbi_console.h>
-
 static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
 {
 	unsigned long mip_val;
-- 
2.17.1


