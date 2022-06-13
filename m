From: Samuel Holland <samuel@sholland.org>
Date: Sun, 12 Jun 2022 20:03:51 -0500
Subject: [PATCH v3 5/9] lib: irqchip/plic: Add context save/restore helpers
In-Reply-To: <20220613010355.28014-1-samuel@sholland.org>
References: <20220613010355.28014-1-samuel@sholland.org>
Message-ID: <20220613010355.28014-6-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These can be used by platform code to save the PLIC context state, if
it would otherwise be lost during non-retentive suspend. The platform
is responsible for allocating all necessary storage.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 include/sbi_utils/irqchip/plic.h |  6 ++++
 lib/utils/irqchip/plic.c         | 51 ++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
index 8f21af6..21b2266 100644
--- a/include/sbi_utils/irqchip/plic.h
+++ b/include/sbi_utils/irqchip/plic.h
@@ -17,6 +17,12 @@ struct plic_data {
 	unsigned long num_src;
 };
 
+void plic_context_save(const struct plic_data *plic, int context_id,
+		       u32 *enable, u32 *threshold);
+
+void plic_context_restore(const struct plic_data *plic, int context_id,
+			  const u32 *enable, u32 threshold);
+
 int plic_context_init(const struct plic_data *plic, int context_id,
 		      bool enable, u32 threshold);
 
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 9bd3bf1..0c64078 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -29,6 +29,16 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
 	writel(val, plic_priority);
 }
 
+static u32 plic_get_thresh(const struct plic_data *plic, u32 cntxid)
+{
+	volatile void *plic_thresh;
+
+	plic_thresh = (char *)plic->addr +
+		      PLIC_CONTEXT_BASE + PLIC_CONTEXT_STRIDE * cntxid;
+
+	return readl(plic_thresh);
+}
+
 static void plic_set_thresh(const struct plic_data *plic, u32 cntxid, u32 val)
 {
 	volatile void *plic_thresh;
@@ -38,14 +48,49 @@ static void plic_set_thresh(const struct plic_data *plic, u32 cntxid, u32 val)
 	writel(val, plic_thresh);
 }
 
+static u32 plic_get_ie(const struct plic_data *plic, u32 cntxid,
+		       u32 word_index)
+{
+	volatile void *plic_ie;
+
+	plic_ie = (char *)plic->addr +
+		   PLIC_ENABLE_BASE + PLIC_ENABLE_STRIDE * cntxid +
+		   4 * word_index;
+
+	return readl(plic_ie);
+}
+
 static void plic_set_ie(const struct plic_data *plic, u32 cntxid,
 			u32 word_index, u32 val)
 {
-	volatile char *plic_ie;
+	volatile void *plic_ie;
 
 	plic_ie = (char *)plic->addr +
-		   PLIC_ENABLE_BASE + PLIC_ENABLE_STRIDE * cntxid;
-	writel(val, plic_ie + word_index * 4);
+		   PLIC_ENABLE_BASE + PLIC_ENABLE_STRIDE * cntxid +
+		   4 * word_index;
+	writel(val, plic_ie);
+}
+
+void plic_context_save(const struct plic_data *plic, int context_id,
+		       u32 *enable, u32 *threshold)
+{
+	u32 ie_words = (plic->num_src + 31) / 32;
+
+	for (u32 i = 0; i < ie_words; i++)
+		enable[i] = plic_get_ie(plic, context_id, i);
+
+	*threshold = plic_get_thresh(plic, context_id);
+}
+
+void plic_context_restore(const struct plic_data *plic, int context_id,
+			  const u32 *enable, u32 threshold)
+{
+	u32 ie_words = (plic->num_src + 31) / 32;
+
+	for (u32 i = 0; i < ie_words; i++)
+		plic_set_ie(plic, context_id, i, enable[i]);
+
+	plic_set_thresh(plic, context_id, threshold);
 }
 
 int plic_context_init(const struct plic_data *plic, int context_id,
-- 
2.35.1


