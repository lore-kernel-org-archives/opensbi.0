From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon,  4 Nov 2024 20:10:03 -0800
Subject: [PATCH 2/9] lib: utils/irqchip: plic: Move delegation to base PLIC driver
In-Reply-To: <20241105041015.2949808-1-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com>
Message-ID: <20241105041015.2949808-3-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This needs to be in the base PLIC driver as part of the power management
save/restore flow.

This is also in preparation for moving the PLIC information in the
scratch area to the base PLIC driver. After that change, the FDT PLIC
layer will be unable to look up the `struct plic_data` after cold boot.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/irqchip/plic.h     |  4 ++++
 lib/utils/irqchip/fdt_irqchip_plic.c | 16 +++-------------
 lib/utils/irqchip/plic.c             | 11 +++++++++++
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
index 5da09055..cbe66761 100644
--- a/include/sbi_utils/irqchip/plic.h
+++ b/include/sbi_utils/irqchip/plic.h
@@ -21,6 +21,8 @@ struct plic_data {
 
 /** Work around a bug on Ariane that requires enabling interrupts at boot */
 #define PLIC_FLAG_ARIANE_BUG		BIT(0)
+/** PLIC must be delegated to S-mode like T-HEAD C906 and C910 */
+#define PLIC_FLAG_THEAD_DELEGATION	BIT(1)
 
 /* So far, priorities on all consumers of these functions fit in 8 bits. */
 void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num);
@@ -28,6 +30,8 @@ void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num);
 void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
 			   u32 num);
 
+void plic_delegate(const struct plic_data *plic);
+
 void plic_context_save(const struct plic_data *plic, int context_id,
 		       u32 *enable, u32 *threshold, u32 num);
 
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index a8aa4fcd..3c57a0f5 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -164,10 +164,7 @@ static int irqchip_plic_cold_init(const void *fdt, int nodeoff,
 	if (rc)
 		goto fail_free_data;
 
-	if (match->data) {
-		void (*plic_plat_init)(struct plic_data *) = match->data;
-		plic_plat_init(pd);
-	}
+	pd->flags = (unsigned long)match->data;
 
 	rc = plic_cold_irqchip_init(pd);
 	if (rc)
@@ -184,19 +181,12 @@ fail_free_data:
 	return rc;
 }
 
-#define THEAD_PLIC_CTRL_REG 0x1ffffc
-
-static void thead_plic_plat_init(struct plic_data *pd)
-{
-	writel_relaxed(BIT(0), (char *)pd->addr + THEAD_PLIC_CTRL_REG);
-}
-
 void thead_plic_restore(void)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct plic_data *plic = plic_get_hart_data_ptr(scratch);
 
-	thead_plic_plat_init(plic);
+	plic_delegate(plic);
 }
 
 static const struct fdt_match irqchip_plic_match[] = {
@@ -204,7 +194,7 @@ static const struct fdt_match irqchip_plic_match[] = {
 	{ .compatible = "riscv,plic0" },
 	{ .compatible = "sifive,plic-1.0.0" },
 	{ .compatible = "thead,c900-plic",
-	  .data = thead_plic_plat_init },
+	  .data = (void *)PLIC_FLAG_THEAD_DELEGATION },
 	{ /* sentinel */ }
 };
 
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index c66a6886..a432a8c4 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -24,6 +24,8 @@
 #define PLIC_CONTEXT_BASE 0x200000
 #define PLIC_CONTEXT_STRIDE 0x1000
 
+#define THEAD_PLIC_CTRL_REG 0x1ffffc
+
 static u32 plic_get_priority(const struct plic_data *plic, u32 source)
 {
 	volatile void *plic_priority = (char *)plic->addr +
@@ -93,6 +95,13 @@ static void plic_set_ie(const struct plic_data *plic, u32 cntxid,
 	writel(val, plic_ie);
 }
 
+void plic_delegate(const struct plic_data *plic)
+{
+	/* If this is a T-HEAD PLIC, delegate access to S-mode */
+	if (plic->flags & PLIC_FLAG_THEAD_DELEGATION)
+		writel_relaxed(BIT(0), (char *)plic->addr + THEAD_PLIC_CTRL_REG);
+}
+
 void plic_context_save(const struct plic_data *plic, int context_id,
 		       u32 *enable, u32 *threshold, u32 num)
 {
@@ -178,6 +187,8 @@ int plic_cold_irqchip_init(const struct plic_data *plic)
 	for (i = 1; i <= plic->num_src; i++)
 		plic_set_priority(plic, i, 0);
 
+	plic_delegate(plic);
+
 	return sbi_domain_root_add_memrange(plic->addr, plic->size, BIT(20),
 					(SBI_DOMAIN_MEMREGION_MMIO |
 					 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
-- 
2.45.1


