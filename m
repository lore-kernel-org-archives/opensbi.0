From: Bin Meng <bmeng@tinylab.org>
Date: Sun,  4 Dec 2022 13:15:02 +0800
Subject: [PATCH v2 4/5] lib: utils/irqchip: plic: Fix the off-by-one error in context save/restore helpers
In-Reply-To: <20221204051503.439727-1-bmeng@tinylab.org>
References: <20221204051503.439727-1-bmeng@tinylab.org>
Message-ID: <20221204051503.439727-4-bmeng@tinylab.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

plic->num_src holds the number of interrupt sources without interrupt
source 0 but the interrupt enable register includes a bit for the
interrupt source 0 in the first word.

Fixes: 415ecf28f7ad ("lib: irqchip/plic: Add context save/restore helpers")
Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

Changes in v2:
- new patch: lib: utils/irqchip: plic: Fix the off-by-one error in context save/restore helpers

 lib/utils/irqchip/plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 5b87d3b..0a1596c 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -94,7 +94,7 @@ static void plic_set_ie(const struct plic_data *plic, u32 cntxid,
 void plic_context_save(const struct plic_data *plic, int context_id,
 		       u32 *enable, u32 *threshold)
 {
-	u32 ie_words = (plic->num_src + 31) / 32;
+	u32 ie_words = plic->num_src / 32 + 1;
 
 	for (u32 i = 0; i < ie_words; i++)
 		enable[i] = plic_get_ie(plic, context_id, i);
@@ -105,7 +105,7 @@ void plic_context_save(const struct plic_data *plic, int context_id,
 void plic_context_restore(const struct plic_data *plic, int context_id,
 			  const u32 *enable, u32 threshold)
 {
-	u32 ie_words = (plic->num_src + 31) / 32;
+	u32 ie_words = plic->num_src / 32 + 1;
 
 	for (u32 i = 0; i < ie_words; i++)
 		plic_set_ie(plic, context_id, i, enable[i]);
-- 
2.34.1


