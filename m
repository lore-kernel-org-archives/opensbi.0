From: Samuel Holland <samuel@sholland.org>
Date: Sun, 29 May 2022 22:37:37 -0500
Subject: [RFC PATCH v2 8/9] lib: utils/irqchip: Add wrapper for T-HEAD PLIC delegation
In-Reply-To: <20220530033738.27127-1-samuel@sholland.org>
References: <20220530033738.27127-1-samuel@sholland.org>
Message-ID: <20220530033738.27127-9-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The delegation bit is lost along with the rest of the PLIC state when
the CPU power domain in the Allwinner D1 is powered down, so the PLIC
needs to be re-delegated to S-mode during the hart resume path.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - New patch for v2

 include/sbi_utils/irqchip/fdt_irqchip_plic.h | 2 ++
 lib/utils/irqchip/fdt_irqchip_plic.c         | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sbi_utils/irqchip/fdt_irqchip_plic.h b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
index 66650a2..d1ab5bd 100644
--- a/include/sbi_utils/irqchip/fdt_irqchip_plic.h
+++ b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
@@ -17,4 +17,6 @@ void irqchip_plic_context_save(u32 *enable, u32 *threshold);
 
 void irqchip_plic_context_restore(const u32 *enable, u32 threshold);
 
+void thead_plic_restore(void);
+
 #endif
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 37090d3..5589863 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -151,6 +151,13 @@ static void thead_plic_plat_init(struct plic_data *pd)
 	writel_relaxed(BIT(0), (char *)pd->addr + THEAD_PLIC_CTRL_REG);
 }
 
+void thead_plic_restore(void)
+{
+	struct plic_data *plic = plic_hartid2data[current_hartid()];
+
+	thead_plic_plat_init(plic);
+}
+
 static const struct fdt_match irqchip_plic_match[] = {
 	{ .compatible = "riscv,plic0" },
 	{ .compatible = "sifive,plic-1.0.0" },
-- 
2.35.1


