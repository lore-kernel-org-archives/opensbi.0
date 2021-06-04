From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri,  4 Jun 2021 22:52:26 +0800
Subject: [PATCH 1/2] platform: andex/ae350: Fix comments in plicsw.c
Message-ID: <20210604145227.14005-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- %s/CLINT/PLICSW
- replace '.' with a space

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 platform/andes/ae350/plicsw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/platform/andes/ae350/plicsw.c b/platform/andes/ae350/plicsw.c
index d07df28..fb994bf 100644
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
@@ -111,7 +111,7 @@ int plicsw_cold_ipi_init(unsigned long base, u32 hart_count)
 	for (int i = 0; i < AE350_HART_COUNT*PLICSW_PENDING_PER_HART; i++)
 		writel(1, &priority[i]);
 
-	/* Setup target enable.*/
+	/* Setup target enable */
 	uint32_t enable_mask = PLICSW_HART_MASK;
 
 	for (int i = 0; i < AE350_HART_COUNT; i++) {
-- 
2.25.1


