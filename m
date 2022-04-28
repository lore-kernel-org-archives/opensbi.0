From: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
Date: Thu, 28 Apr 2022 17:45:02 +0800
Subject: [PATCH] include: sbi: Define SBI_PMU_HW_EVENT_MAX to 256
Message-ID: <20220428094502.12614-1-junliang.tan@linux.starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Increase maximum number of PMU hardware events that can be mapped
by OpenSBI to 256

Signed-off-by: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
Signed-off-by: Wei Liang Lim <weiliang.lim@linux.starfivetech.com>
---
 include/sbi/sbi_pmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 6a1c62c..f5e3dbd 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -17,7 +17,7 @@
 
 /* Event related macros */
 /* Maximum number of hardware events that can mapped by OpenSBI */
-#define SBI_PMU_HW_EVENT_MAX 64
+#define SBI_PMU_HW_EVENT_MAX 256
 
 /* Maximum number of firmware events that can mapped by OpenSBI */
 #define SBI_PMU_FW_EVENT_MAX 32
-- 
2.25.1



