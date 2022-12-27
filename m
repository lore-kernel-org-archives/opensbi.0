From: Samuel Holland <samuel@sholland.org>
Date: Tue, 27 Dec 2022 12:44:44 -0600
Subject: [PATCH] platform: generic: allwinner: Fix PLIC array bounds
Message-ID: <20221227184444.61331-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The two referenced commits passed incorrect bounds to the PLIC save/
restore functions, causing out-of-bounds memory access. The functions
expect "num" to be the 1-based number of interrupt sources, equivalent
to the "riscv,ndev" devicetree property. Thus, "num" must be strictly
smaller than the 0-based size of the array storing the register values.

However, the referenced commits incorrectly passed in the unmodified
size of the array as "num". Fix this by reducing PLIC_SOURCES (matching
"riscv,ndev" on this platform), while keeping the same array sizes.

Addresses-Coverity-ID: 1530251 ("Out-of-bounds access")
Addresses-Coverity-ID: 1530252 ("Out-of-bounds access")
Fixes: 8509e46ca63a ("lib: utils/irqchip: plic: Ensure no out-of-bound access in priority save/restore helpers")
Fixes: 9a2eeb4aaeac ("lib: utils/irqchip: plic: Ensure no out-of-bound access in context save/restore helpers")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 platform/generic/allwinner/sun20i-d1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 1da9e5b..e2b76a3 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -69,10 +69,10 @@ static void sun20i_d1_csr_restore(void)
  * PLIC
  */
 
-#define PLIC_SOURCES			176
-#define PLIC_IE_WORDS			((PLIC_SOURCES + 31) / 32)
+#define PLIC_SOURCES			175
+#define PLIC_IE_WORDS			(PLIC_SOURCES / 32 + 1)
 
-static u8 plic_priority[PLIC_SOURCES];
+static u8 plic_priority[1 + PLIC_SOURCES];
 static u32 plic_sie[PLIC_IE_WORDS];
 static u32 plic_threshold;
 
-- 
2.37.4


