From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon,  4 Nov 2024 20:10:05 -0800
Subject: [PATCH 4/9] lib: utils/irqchip: plic: Common PM save/restore
In-Reply-To: <20241105041015.2949808-1-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com>
Message-ID: <20241105041015.2949808-5-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the PLIC save/restore functions inside the driver, so they can be
reused on any platform that needs them. The memory needed to store the
PLIC context is also allocated by the driver. The PM data cannot be
completely encapsulated, as some platforms (including Allwinner D1) need
to program the IRQ enable status to a sideband interrupt controller for
wakeup capability.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/irqchip/fdt_irqchip_plic.h |  22 +--
 include/sbi_utils/irqchip/plic.h             |  19 +--
 lib/utils/irqchip/fdt_irqchip_plic.c         |  32 +----
 lib/utils/irqchip/plic.c                     | 134 ++++++++++++-------
 platform/generic/allwinner/sun20i-d1.c       |  34 +----
 5 files changed, 112 insertions(+), 129 deletions(-)

diff --git a/include/sbi_utils/irqchip/fdt_irqchip_plic.h b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
index df645dd0..fe769993 100644
--- a/include/sbi_utils/irqchip/fdt_irqchip_plic.h
+++ b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
@@ -8,26 +8,12 @@
 #define __IRQCHIP_FDT_IRQCHIP_PLIC_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi_utils/irqchip/plic.h>
 
-/**
- * Save the PLIC priority state
- * @param priority pointer to the memory region for the saved priority
- * @param num size of the memory region including interrupt source 0
- */
-void fdt_plic_priority_save(u8 *priority, u32 num);
-
-/**
- * Restore the PLIC priority state
- * @param priority pointer to the memory region for the saved priority
- * @param num size of the memory region including interrupt source 0
- */
-void fdt_plic_priority_restore(const u8 *priority, u32 num);
-
-void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold, u32 num);
+struct plic_data *fdt_plic_get(void);
 
-void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold,
-			      u32 num);
+void fdt_plic_suspend(void);
 
-void thead_plic_restore(void);
+void fdt_plic_resume(void);
 
 #endif
diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
index e6b6f823..29fe60c1 100644
--- a/include/sbi_utils/irqchip/plic.h
+++ b/include/sbi_utils/irqchip/plic.h
@@ -17,6 +17,7 @@ struct plic_data {
 	unsigned long size;
 	unsigned long num_src;
 	unsigned long flags;
+	void *pm_data;
 	s16 context_map[][2];
 };
 
@@ -24,6 +25,8 @@ struct plic_data {
 #define PLIC_FLAG_ARIANE_BUG		BIT(0)
 /** PLIC must be delegated to S-mode like T-HEAD C906 and C910 */
 #define PLIC_FLAG_THEAD_DELEGATION	BIT(1)
+/** Allocate space for power management save/restore operations */
+#define PLIC_FLAG_ENABLE_PM		BIT(2)
 
 #define PLIC_M_CONTEXT			0
 #define PLIC_S_CONTEXT			1
@@ -31,22 +34,14 @@ struct plic_data {
 #define PLIC_DATA_SIZE(__hart_count)	(sizeof(struct plic_data) + \
 					 (__hart_count) * 2 * sizeof(s16))
 
-/* So far, priorities on all consumers of these functions fit in 8 bits. */
-void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num);
+#define PLIC_IE_WORDS(__p)		((__p)->num_src / 32 + 1)
 
-void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
-			   u32 num);
+void plic_suspend(const struct plic_data *plic);
 
-void plic_delegate(const struct plic_data *plic);
-
-void plic_context_save(const struct plic_data *plic, bool smode,
-		       u32 *enable, u32 *threshold, u32 num);
-
-void plic_context_restore(const struct plic_data *plic, bool smode,
-			  const u32 *enable, u32 threshold, u32 num);
+void plic_resume(const struct plic_data *plic);
 
 int plic_warm_irqchip_init(const struct plic_data *plic);
 
-int plic_cold_irqchip_init(const struct plic_data *plic);
+int plic_cold_irqchip_init(struct plic_data *plic);
 
 #endif
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 2ba56748..3826d2ae 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -26,35 +26,25 @@ static unsigned long plic_ptr_offset;
 #define plic_set_hart_data_ptr(__scratch, __plic)			\
 	sbi_scratch_write_type((__scratch), void *, plic_ptr_offset, (__plic))
 
-void fdt_plic_priority_save(u8 *priority, u32 num)
+struct plic_data *fdt_plic_get(void)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-	plic_priority_save(plic_get_hart_data_ptr(scratch), priority, num);
+	return plic_get_hart_data_ptr(scratch);
 }
 
-void fdt_plic_priority_restore(const u8 *priority, u32 num)
+void fdt_plic_suspend(void)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-	plic_priority_restore(plic_get_hart_data_ptr(scratch), priority, num);
+	plic_suspend(plic_get_hart_data_ptr(scratch));
 }
 
-void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold, u32 num)
+void fdt_plic_resume(void)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-	plic_context_save(plic_get_hart_data_ptr(scratch), smode,
-			  enable, threshold, num);
-}
-
-void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold,
-			      u32 num)
-{
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-
-	plic_context_restore(plic_get_hart_data_ptr(scratch), smode,
-			     enable, threshold, num);
+	plic_resume(plic_get_hart_data_ptr(scratch));
 }
 
 static int irqchip_plic_warm_init(void)
@@ -151,20 +141,12 @@ fail_free_data:
 	return rc;
 }
 
-void thead_plic_restore(void)
-{
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	struct plic_data *plic = plic_get_hart_data_ptr(scratch);
-
-	plic_delegate(plic);
-}
-
 static const struct fdt_match irqchip_plic_match[] = {
 	{ .compatible = "andestech,nceplic100" },
 	{ .compatible = "riscv,plic0" },
 	{ .compatible = "sifive,plic-1.0.0" },
 	{ .compatible = "thead,c900-plic",
-	  .data = (void *)PLIC_FLAG_THEAD_DELEGATION },
+	  .data = (void *)(PLIC_FLAG_THEAD_DELEGATION | PLIC_FLAG_ENABLE_PM) },
 	{ /* sentinel */ }
 };
 
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index c8ea8840..ab58e390 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_string.h>
 #include <sbi_utils/irqchip/plic.h>
 
@@ -40,19 +41,6 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
 	writel(val, plic_priority);
 }
 
-void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num)
-{
-	for (u32 i = 1; i <= num; i++)
-		priority[i] = plic_get_priority(plic, i);
-}
-
-void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
-			   u32 num)
-{
-	for (u32 i = 1; i <= num; i++)
-		plic_set_priority(plic, i, priority[i]);
-}
-
 static u32 plic_get_thresh(const struct plic_data *plic, u32 cntxid)
 {
 	volatile void *plic_thresh;
@@ -95,62 +83,91 @@ static void plic_set_ie(const struct plic_data *plic, u32 cntxid,
 	writel(val, plic_ie);
 }
 
-void plic_delegate(const struct plic_data *plic)
+static void plic_delegate(const struct plic_data *plic)
 {
 	/* If this is a T-HEAD PLIC, delegate access to S-mode */
 	if (plic->flags & PLIC_FLAG_THEAD_DELEGATION)
 		writel_relaxed(BIT(0), (char *)plic->addr + THEAD_PLIC_CTRL_REG);
 }
 
-void plic_context_save(const struct plic_data *plic, bool smode,
-		       u32 *enable, u32 *threshold, u32 num)
+static int plic_context_init(const struct plic_data *plic, int context_id,
+			     bool enable, u32 threshold)
 {
-	u32 hartindex = current_hartindex();
-	s16 context_id = plic->context_map[hartindex][smode];
-	u32 ie_words = plic->num_src / 32 + 1;
+	u32 ie_words, ie_value;
 
-	if (num > ie_words)
-		num = ie_words;
+	if (!plic || context_id < 0)
+		return SBI_EINVAL;
 
-	for (u32 i = 0; i < num; i++)
-		enable[i] = plic_get_ie(plic, context_id, i);
+	ie_words = PLIC_IE_WORDS(plic);
+	ie_value = enable ? 0xffffffffU : 0U;
+
+	for (u32 i = 0; i < ie_words; i++)
+		plic_set_ie(plic, context_id, i, ie_value);
+
+	plic_set_thresh(plic, context_id, threshold);
 
-	*threshold = plic_get_thresh(plic, context_id);
+	return 0;
 }
 
-void plic_context_restore(const struct plic_data *plic, bool smode,
-			  const u32 *enable, u32 threshold, u32 num)
+void plic_suspend(const struct plic_data *plic)
 {
-	u32 hartindex = current_hartindex();
-	s16 context_id = plic->context_map[hartindex][smode];
-	u32 ie_words = plic->num_src / 32 + 1;
+	u32 ie_words = PLIC_IE_WORDS(plic);
+	u32 *data_word = plic->pm_data;
+	u8 *data_byte;
 
-	if (num > ie_words)
-		num = ie_words;
+	if (!data_word)
+		return;
 
-	for (u32 i = 0; i < num; i++)
-		plic_set_ie(plic, context_id, i, enable[i]);
+	for (u32 h = 0; h <= sbi_scratch_last_hartindex(); h++) {
+		u32 context_id = plic->context_map[h][PLIC_S_CONTEXT];
 
-	plic_set_thresh(plic, context_id, threshold);
+		if (context_id < 0)
+			continue;
+
+		/* Save the enable bits */
+		for (u32 i = 0; i < ie_words; i++)
+			*data_word++ = plic_get_ie(plic, context_id, i);
+
+		/* Save the context threshold */
+		*data_word++ = plic_get_thresh(plic, context_id);
+	}
+
+	/* Restore the input priorities */
+	data_byte = (u8 *)data_word;
+	for (u32 i = 1; i <= plic->num_src; i++)
+		*data_byte++ = plic_get_priority(plic, i);
 }
 
-static int plic_context_init(const struct plic_data *plic, int context_id,
-			     bool enable, u32 threshold)
+void plic_resume(const struct plic_data *plic)
 {
-	u32 ie_words, ie_value;
+	u32 ie_words = PLIC_IE_WORDS(plic);
+	u32 *data_word = plic->pm_data;
+	u8 *data_byte;
 
-	if (!plic || context_id < 0)
-		return SBI_EINVAL;
+	if (!data_word)
+		return;
 
-	ie_words = plic->num_src / 32 + 1;
-	ie_value = enable ? 0xffffffffU : 0U;
+	for (u32 h = 0; h <= sbi_scratch_last_hartindex(); h++) {
+		u32 context_id = plic->context_map[h][PLIC_S_CONTEXT];
 
-	for (u32 i = 0; i < ie_words; i++)
-		plic_set_ie(plic, context_id, i, ie_value);
+		if (context_id < 0)
+			continue;
 
-	plic_set_thresh(plic, context_id, threshold);
+		/* Restore the enable bits */
+		for (u32 i = 0; i < ie_words; i++)
+			plic_set_ie(plic, context_id, i, *data_word++);
 
-	return 0;
+		/* Restore the context threshold */
+		plic_set_thresh(plic, context_id, *data_word++);
+	}
+
+	/* Restore the input priorities */
+	data_byte = (u8 *)data_word;
+	for (u32 i = 1; i <= plic->num_src; i++)
+		plic_set_priority(plic, i, *data_byte++);
+
+	/* Restore the delegation */
+	plic_delegate(plic);
 }
 
 int plic_warm_irqchip_init(const struct plic_data *plic)
@@ -182,13 +199,38 @@ int plic_warm_irqchip_init(const struct plic_data *plic)
 	return 0;
 }
 
-int plic_cold_irqchip_init(const struct plic_data *plic)
+int plic_cold_irqchip_init(struct plic_data *plic)
 {
 	int i;
 
 	if (!plic)
 		return SBI_EINVAL;
 
+	if (plic->flags & PLIC_FLAG_ENABLE_PM) {
+		unsigned long data_size = 0;
+
+		for (u32 i = 0; i <= sbi_scratch_last_hartindex(); i++) {
+			if (plic->context_map[i][PLIC_S_CONTEXT] < 0)
+				continue;
+
+			/* Allocate space for enable bits */
+			data_size += (plic->num_src / 32 + 1) * sizeof(u32);
+
+			/* Allocate space for the context threshold */
+			data_size += sizeof(u32);
+		}
+
+		/*
+		 * Allocate space for the input priorities. So far,
+		 * priorities on all known implementations fit in 8 bits.
+		 */
+		data_size += plic->num_src * sizeof(u8);
+
+		plic->pm_data = sbi_malloc(data_size);
+		if (!plic->pm_data)
+			return SBI_ENOMEM;
+	}
+
 	/* Configure default priorities of all IRQs */
 	for (i = 1; i <= plic->num_src; i++)
 		plic_set_priority(plic, i, 0);
diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 9b1d5559..c4b06d1a 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -60,31 +60,6 @@ static void sun20i_d1_csr_restore(void)
 	csr_write(THEAD_C9XX_CSR_MHINT, csr_mhint);
 }
 
-/*
- * PLIC
- */
-
-#define PLIC_SOURCES			175
-#define PLIC_IE_WORDS			(PLIC_SOURCES / 32 + 1)
-
-static u8 plic_priority[1 + PLIC_SOURCES];
-static u32 plic_sie[PLIC_IE_WORDS];
-static u32 plic_threshold;
-
-static void sun20i_d1_plic_save(void)
-{
-	fdt_plic_context_save(true, plic_sie, &plic_threshold, PLIC_IE_WORDS);
-	fdt_plic_priority_save(plic_priority, PLIC_SOURCES);
-}
-
-static void sun20i_d1_plic_restore(void)
-{
-	thead_plic_restore();
-	fdt_plic_priority_restore(plic_priority, PLIC_SOURCES);
-	fdt_plic_context_restore(true, plic_sie, plic_threshold,
-				 PLIC_IE_WORDS);
-}
-
 /*
  * PPU
  */
@@ -117,6 +92,9 @@ static void sun20i_d1_ppu_restore(void)
 
 static void sun20i_d1_riscv_cfg_save(void)
 {
+	struct plic_data *plic = fdt_plic_get();
+	u32 *plic_sie = plic->pm_data;
+
 	/* Enable MMIO access. Do not assume S-mode leaves the clock enabled. */
 	writel_relaxed(CCU_BGR_ENABLE, SUN20I_D1_CCU_BASE + RISCV_CFG_BGR_REG);
 
@@ -126,7 +104,7 @@ static void sun20i_d1_riscv_cfg_save(void)
 	 * the wakeup mask registers (the offset is for GIC compatibility). So
 	 * copying SIE to the wakeup mask needs some bit manipulation.
 	 */
-	for (int i = 0; i < PLIC_IE_WORDS - 1; i++)
+	for (int i = 0; i < PLIC_IE_WORDS(plic) - 1; i++)
 		writel_relaxed(plic_sie[i] >> 16 | plic_sie[i + 1] << 16,
 			       SUN20I_D1_RISCV_CFG_BASE + WAKEUP_MASK_REG(i));
 
@@ -158,7 +136,7 @@ static int sun20i_d1_hart_suspend(u32 suspend_type)
 	if (!(suspend_type & SBI_HSM_SUSP_NON_RET_BIT))
 		return SBI_ENOTSUPP;
 
-	sun20i_d1_plic_save();
+	fdt_plic_suspend();
 	sun20i_d1_ppu_save();
 	sun20i_d1_riscv_cfg_save();
 	sun20i_d1_csr_save();
@@ -178,7 +156,7 @@ static void sun20i_d1_hart_resume(void)
 	sun20i_d1_csr_restore();
 	sun20i_d1_riscv_cfg_restore();
 	sun20i_d1_ppu_restore();
-	sun20i_d1_plic_restore();
+	fdt_plic_resume();
 }
 
 static const struct sbi_hsm_device sun20i_d1_ppu = {
-- 
2.45.1


