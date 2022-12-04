From: Bin Meng <bmeng@tinylab.org>
Date: Sun,  4 Dec 2022 13:17:41 +0800
Subject: [RESEND PATCH v2 5/5] lib: utils/irqchip: plic: Ensure no out-of-bound access in context save/restore helpers
In-Reply-To: <20221204051741.440008-1-bmeng@tinylab.org>
References: <20221204051741.440008-1-bmeng@tinylab.org>
Message-ID: <20221204051741.440008-5-bmeng@tinylab.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently the context save/restore helpers writes/reads the provided
array using an index whose maximum value is determined by PLIC, which
potentially may disagree with the caller to these helpers.

Add a parameter to ask the caller to provide the size limit of the
array to ensure no out-of-bound access happens.

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

Changes in v2:
- new patch: lib: utils/irqchip: plic: Ensure no out-of-bound access in context save/restore helpers

 include/sbi_utils/irqchip/fdt_irqchip_plic.h |  5 +++--
 include/sbi_utils/irqchip/plic.h             |  4 ++--
 lib/utils/irqchip/fdt_irqchip_plic.c         | 21 ++++++++++++++------
 lib/utils/irqchip/plic.c                     | 12 ++++-------
 platform/generic/allwinner/sun20i-d1.c       |  5 +++--
 5 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/include/sbi_utils/irqchip/fdt_irqchip_plic.h b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
index 5f3f54d..f855454 100644
--- a/include/sbi_utils/irqchip/fdt_irqchip_plic.h
+++ b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
@@ -13,9 +13,10 @@ void fdt_plic_priority_save(u8 *priority, u32 num);
 
 void fdt_plic_priority_restore(const u8 *priority, u32 num);
 
-void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold);
+void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold, u32 num);
 
-void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold);
+void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold,
+			      u32 num);
 
 void thead_plic_restore(void);
 
diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
index 38704a1..112a714 100644
--- a/include/sbi_utils/irqchip/plic.h
+++ b/include/sbi_utils/irqchip/plic.h
@@ -24,10 +24,10 @@ void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
 			   u32 num);
 
 void plic_context_save(const struct plic_data *plic, int context_id,
-		       u32 *enable, u32 *threshold);
+		       u32 *enable, u32 *threshold, u32 num);
 
 void plic_context_restore(const struct plic_data *plic, int context_id,
-			  const u32 *enable, u32 threshold);
+			  const u32 *enable, u32 threshold, u32 num);
 
 int plic_context_init(const struct plic_data *plic, int context_id,
 		      bool enable, u32 threshold);
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 87fb9bd..e975415 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -42,22 +42,31 @@ void fdt_plic_priority_restore(const u8 *priority, u32 num)
 	plic_priority_restore(plic, priority, num);
 }
 
-void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold)
+void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold, u32 num)
 {
 	u32 hartid = current_hartid();
+	struct plic_data *plic = plic_hartid2data[hartid];
+	u32 ie_words = plic->num_src / 32 + 1;
 
-	plic_context_save(plic_hartid2data[hartid],
+	if (num > ie_words)
+		num = ie_words;
+	plic_context_save(plic,
 			  plic_hartid2context[hartid][smode],
-			  enable, threshold);
+			  enable, threshold, num);
 }
 
-void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold)
+void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold,
+			      u32 num)
 {
 	u32 hartid = current_hartid();
+	struct plic_data *plic = plic_hartid2data[hartid];
+	u32 ie_words = plic->num_src / 32 + 1;
 
-	plic_context_restore(plic_hartid2data[hartid],
+	if (num > ie_words)
+		num = ie_words;
+	plic_context_restore(plic,
 			     plic_hartid2context[hartid][smode],
-			     enable, threshold);
+			     enable, threshold, num);
 }
 
 static int irqchip_plic_warm_init(void)
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 0a1596c..5922c75 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -92,22 +92,18 @@ static void plic_set_ie(const struct plic_data *plic, u32 cntxid,
 }
 
 void plic_context_save(const struct plic_data *plic, int context_id,
-		       u32 *enable, u32 *threshold)
+		       u32 *enable, u32 *threshold, u32 num)
 {
-	u32 ie_words = plic->num_src / 32 + 1;
-
-	for (u32 i = 0; i < ie_words; i++)
+	for (u32 i = 0; i < num; i++)
 		enable[i] = plic_get_ie(plic, context_id, i);
 
 	*threshold = plic_get_thresh(plic, context_id);
 }
 
 void plic_context_restore(const struct plic_data *plic, int context_id,
-			  const u32 *enable, u32 threshold)
+			  const u32 *enable, u32 threshold, u32 num)
 {
-	u32 ie_words = plic->num_src / 32 + 1;
-
-	for (u32 i = 0; i < ie_words; i++)
+	for (u32 i = 0; i < num; i++)
 		plic_set_ie(plic, context_id, i, enable[i]);
 
 	plic_set_thresh(plic, context_id, threshold);
diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 46d336f..f6f7df1 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -78,7 +78,7 @@ static u32 plic_threshold;
 
 static void sun20i_d1_plic_save(void)
 {
-	fdt_plic_context_save(true, plic_sie, &plic_threshold);
+	fdt_plic_context_save(true, plic_sie, &plic_threshold, PLIC_IE_WORDS);
 	fdt_plic_priority_save(plic_priority, PLIC_SOURCES);
 }
 
@@ -86,7 +86,8 @@ static void sun20i_d1_plic_restore(void)
 {
 	thead_plic_restore();
 	fdt_plic_priority_restore(plic_priority, PLIC_SOURCES);
-	fdt_plic_context_restore(true, plic_sie, plic_threshold);
+	fdt_plic_context_restore(true, plic_sie, plic_threshold,
+				 PLIC_IE_WORDS);
 }
 
 /*
-- 
2.34.1


