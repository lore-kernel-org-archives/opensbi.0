From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri,  4 Jun 2021 23:35:42 +0800
Subject: [PATCH v2 1/4] platform: andes/ae350: Cosmetic fixes in plicsw.c
Message-ID: <20210604153545.18949-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- %s/CLINT/PLICSW
- replace '.' with a space
- add a space around * in plicsw_cold_ipi_init()

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- andex => andes in the commit title
- add a space around *

 platform/andes/ae350/plicsw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/platform/andes/ae350/plicsw.c b/platform/andes/ae350/plicsw.c
index d07df28..4df7317 100644
--- a/platform/andes/ae350/plicsw.c
+++ b/platform/andes/ae350/plicsw.c
@@ -83,7 +83,7 @@ void plicsw_ipi_clear(u32 target_hart)
 	if (plicsw_ipi_hart_count <= target_hart)
 		return;
 
-	/* Clear CLINT IPI */
+	/* Clear PLICSW IPI */
 	plicsw_claim();
 	plicsw_complete();
 }
@@ -108,10 +108,10 @@ int plicsw_cold_ipi_init(unsigned long base, u32 hart_count)
 	/* Setup source priority */
 	uint32_t *priority = (void *)base + PLICSW_PRIORITY_BASE;
 
-	for (int i = 0; i < AE350_HART_COUNT*PLICSW_PENDING_PER_HART; i++)
+	for (int i = 0; i < AE350_HART_COUNT * PLICSW_PENDING_PER_HART; i++)
 		writel(1, &priority[i]);
 
-	/* Setup target enable.*/
+	/* Setup target enable */
 	uint32_t enable_mask = PLICSW_HART_MASK;
 
 	for (int i = 0; i < AE350_HART_COUNT; i++) {
-- 
2.25.1


