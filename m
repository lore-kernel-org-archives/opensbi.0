From: Samuel Holland <samuel@sholland.org>
Date: Sun, 12 Jun 2022 20:03:50 -0500
Subject: [PATCH v3 4/9] lib: irqchip/plic: Factor out a context init function
In-Reply-To: <20220613010355.28014-1-samuel@sholland.org>
References: <20220613010355.28014-1-samuel@sholland.org>
Message-ID: <20220613010355.28014-5-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This simplifies both the callers and the callees by removing duplicated
code and consolidating the error handling. It also fixes two bugs in the
process:
  1) ie_words was one too large when plic->num_src was a multiple of 32.
  2) plic_set_ie takes a 32-bit mask, not a Boolean value, so the FPGA
     platforms previously only enabled one out of every 32 interrupts.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 include/sbi_utils/irqchip/plic.h   |  8 ++---
 lib/utils/irqchip/plic.c           | 55 ++++++++++++++++--------------
 platform/fpga/ariane/platform.c    | 19 +++++------
 platform/fpga/openpiton/platform.c | 19 +++++------
 4 files changed, 48 insertions(+), 53 deletions(-)

diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
index 50be5df..8f21af6 100644
--- a/include/sbi_utils/irqchip/plic.h
+++ b/include/sbi_utils/irqchip/plic.h
@@ -17,14 +17,12 @@ struct plic_data {
 	unsigned long num_src;
 };
 
+int plic_context_init(const struct plic_data *plic, int context_id,
+		      bool enable, u32 threshold);
+
 int plic_warm_irqchip_init(const struct plic_data *plic,
 			   int m_cntx_id, int s_cntx_id);
 
 int plic_cold_irqchip_init(const struct plic_data *plic);
 
-void plic_set_thresh(const struct plic_data *plic, u32 cntxid, u32 val);
-
-void plic_set_ie(const struct plic_data *plic, u32 cntxid,
-		 u32 word_index, u32 val);
-
 #endif
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 4c334ec..9bd3bf1 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -5,6 +5,7 @@
  *
  * Authors:
  *   Anup Patel <anup.patel@wdc.com>
+ *   Samuel Holland <samuel@sholland.org>
  */
 
 #include <sbi/riscv_io.h>
@@ -28,61 +29,63 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
 	writel(val, plic_priority);
 }
 
-void plic_set_thresh(const struct plic_data *plic, u32 cntxid, u32 val)
+static void plic_set_thresh(const struct plic_data *plic, u32 cntxid, u32 val)
 {
 	volatile void *plic_thresh;
 
-	if (!plic)
-		return;
-
 	plic_thresh = (char *)plic->addr +
 		      PLIC_CONTEXT_BASE + PLIC_CONTEXT_STRIDE * cntxid;
 	writel(val, plic_thresh);
 }
 
-void plic_set_ie(const struct plic_data *plic, u32 cntxid,
-		 u32 word_index, u32 val)
+static void plic_set_ie(const struct plic_data *plic, u32 cntxid,
+			u32 word_index, u32 val)
 {
 	volatile char *plic_ie;
 
-	if (!plic)
-		return;
-
 	plic_ie = (char *)plic->addr +
 		   PLIC_ENABLE_BASE + PLIC_ENABLE_STRIDE * cntxid;
 	writel(val, plic_ie + word_index * 4);
 }
 
-int plic_warm_irqchip_init(const struct plic_data *plic,
-			   int m_cntx_id, int s_cntx_id)
+int plic_context_init(const struct plic_data *plic, int context_id,
+		      bool enable, u32 threshold)
 {
-	size_t i, ie_words;
+	u32 ie_words, ie_value;
 
-	if (!plic)
+	if (!plic || context_id < 0)
 		return SBI_EINVAL;
 
-	ie_words = plic->num_src / 32 + 1;
+	ie_words = (plic->num_src + 31) / 32;
+	ie_value = enable ? 0xffffffffU : 0U;
+
+	for (u32 i = 0; i < ie_words; i++)
+		plic_set_ie(plic, context_id, i, ie_value);
+
+	plic_set_thresh(plic, context_id, threshold);
+
+	return 0;
+}
+
+int plic_warm_irqchip_init(const struct plic_data *plic,
+			   int m_cntx_id, int s_cntx_id)
+{
+	int ret;
 
 	/* By default, disable all IRQs for M-mode of target HART */
 	if (m_cntx_id > -1) {
-		for (i = 0; i < ie_words; i++)
-			plic_set_ie(plic, m_cntx_id, i, 0);
+		ret = plic_context_init(plic, m_cntx_id, false, 0x7);
+		if (ret)
+			return ret;
 	}
 
 	/* By default, disable all IRQs for S-mode of target HART */
 	if (s_cntx_id > -1) {
-		for (i = 0; i < ie_words; i++)
-			plic_set_ie(plic, s_cntx_id, i, 0);
+		ret = plic_context_init(plic, m_cntx_id, false, 0x7);
+		if (ret)
+			return ret;
 	}
 
-	/* By default, disable M-mode threshold */
-	if (m_cntx_id > -1)
-		plic_set_thresh(plic, m_cntx_id, 0x7);
-
-	/* By default, disable S-mode threshold */
-	if (s_cntx_id > -1)
-		plic_set_thresh(plic, s_cntx_id, 0x7);
-
 	return 0;
 }
 
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index 3fdc03b..56a666b 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -99,24 +99,21 @@ static int ariane_console_init(void)
 
 static int plic_ariane_warm_irqchip_init(int m_cntx_id, int s_cntx_id)
 {
-	size_t i, ie_words = ARIANE_PLIC_NUM_SOURCES / 32 + 1;
+	int ret;
 
 	/* By default, enable all IRQs for M-mode of target HART */
 	if (m_cntx_id > -1) {
-		for (i = 0; i < ie_words; i++)
-			plic_set_ie(&plic, m_cntx_id, i, 1);
+		ret = plic_context_init(&plic, m_cntx_id, true, 0x1);
+		if (ret)
+			return ret;
 	}
+
 	/* Enable all IRQs for S-mode of target HART */
 	if (s_cntx_id > -1) {
-		for (i = 0; i < ie_words; i++)
-			plic_set_ie(&plic, s_cntx_id, i, 1);
+		ret = plic_context_init(&plic, s_cntx_id, true, 0x0);
+		if (ret)
+			return ret;
 	}
-	/* By default, enable M-mode threshold */
-	if (m_cntx_id > -1)
-		plic_set_thresh(&plic, m_cntx_id, 1);
-	/* By default, disable S-mode threshold */
-	if (s_cntx_id > -1)
-		plic_set_thresh(&plic, s_cntx_id, 0);
 
 	return 0;
 }
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 15e289a..7ca2123 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -134,24 +134,21 @@ static int openpiton_console_init(void)
 
 static int plic_openpiton_warm_irqchip_init(int m_cntx_id, int s_cntx_id)
 {
-	size_t i, ie_words = plic.num_src / 32 + 1;
+	int ret;
 
 	/* By default, enable all IRQs for M-mode of target HART */
 	if (m_cntx_id > -1) {
-		for (i = 0; i < ie_words; i++)
-			plic_set_ie(&plic, m_cntx_id, i, 1);
+		ret = plic_context_init(&plic, m_cntx_id, true, 0x1);
+		if (ret)
+			return ret;
 	}
+
 	/* Enable all IRQs for S-mode of target HART */
 	if (s_cntx_id > -1) {
-		for (i = 0; i < ie_words; i++)
-			plic_set_ie(&plic, s_cntx_id, i, 1);
+		ret = plic_context_init(&plic, s_cntx_id, true, 0x0);
+		if (ret)
+			return ret;
 	}
-	/* By default, enable M-mode threshold */
-	if (m_cntx_id > -1)
-		plic_set_thresh(&plic, m_cntx_id, 1);
-	/* By default, disable S-mode threshold */
-	if (s_cntx_id > -1)
-		plic_set_thresh(&plic, s_cntx_id, 0);
 
 	return 0;
 }
-- 
2.35.1


