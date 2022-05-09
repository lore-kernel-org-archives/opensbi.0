From: Jan Remeš <jan.remes@codasip.com>
Date: Mon, 9 May 2022 14:43:13 +0200
Subject: [PATCH] lib: utils/irqchip: fix typo when checking for CPU node
Message-ID: <CALXH3=LymzDa6c7DjYSfqZFTU3eUFZa0QgYxw6OOc3_577hO9g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix typo in irqchip_imsic_update_hartid_table() when checking for CPU
node.

Signed-off-by: Jan Remes <jan.remes@codasip.com>
---
 lib/utils/irqchip/fdt_irqchip_imsic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c
b/lib/utils/irqchip/fdt_irqchip_imsic.c
index b6962be..6020ac0 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -42,7 +42,7 @@ static int irqchip_imsic_update_hartid_table(void
*fdt, int nodeoff,
  continue;

  cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
- if (cpu_intc_offset < 0)
+ if (cpu_offset < 0)
  continue;

  err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-- 
2.35.1

