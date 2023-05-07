From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon,  8 May 2023 02:28:43 +0800
Subject: [PATCH] lib: utils/irqchip: plic: support T-HEAD C910 PLIC
Message-ID: <20230507182843.2987-1-jszhang@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

T-HEAD's C910 PLIC still needs the delegation bit setting to allow
access from S-mode, but it doesn't need the edge quirk. To distinguish
it from C906, add C910 binding.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 lib/utils/irqchip/fdt_irqchip_plic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 1aadf91..ed572f7 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -165,6 +165,8 @@ static const struct fdt_match irqchip_plic_match[] = {
 	{ .compatible = "sifive,plic-1.0.0" },
 	{ .compatible = "thead,c900-plic",
 	  .data = thead_plic_plat_init },
+	{ .compatible = "thead,c910-plic",
+	  .data = thead_plic_plat_init },
 	{ /* sentinel */ }
 };
 
-- 
2.40.1


