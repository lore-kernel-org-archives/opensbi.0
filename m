From: Samuel Holland <samuel@sholland.org>
Date: Sun, 12 Jun 2022 20:03:54 -0500
Subject: [PATCH v3 8/9] lib: utils/irqchip: Add wrapper for T-HEAD PLIC delegation
In-Reply-To: <20220613010355.28014-1-samuel@sholland.org>
References: <20220613010355.28014-1-samuel@sholland.org>
Message-ID: <20220613010355.28014-9-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The delegation bit is lost along with the rest of the PLIC state when
the CPU power domain in the Allwinner D1 is powered down, so the PLIC
needs to be re-delegated to S-mode during the hart resume path.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 include/sbi_utils/irqchip/fdt_irqchip_plic.h | 2 ++
 lib/utils/irqchip/fdt_irqchip_plic.c         | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sbi_utils/irqchip/fdt_irqchip_plic.h b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
index f158b02..98d4de5 100644
--- a/include/sbi_utils/irqchip/fdt_irqchip_plic.h
+++ b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
@@ -17,4 +17,6 @@ void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold);
 
 void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold);
 
+void thead_plic_restore(void);
+
 #endif
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 89b12d4..a6e185c 100644
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


