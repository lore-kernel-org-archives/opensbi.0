From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:48 +0530
Subject: [PATCH v2 17/18] lib: utils/irqchip: Don't check hartid in imsic_update_hartid_table()
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-18-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The imsic_map_hartid_to_data() already checks hartid before using
so we don't need to check in imsic_update_hartid_table().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/utils/irqchip/fdt_irqchip_imsic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
index 590b202..d032ac8 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -12,7 +12,6 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
-#include <sbi/sbi_hartmask.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
@@ -44,8 +43,6 @@ static int irqchip_imsic_update_hartid_table(void *fdt, int nodeoff,
 		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
 		if (err)
 			return SBI_EINVAL;
-		if (SBI_HARTMASK_MAX_BITS <= hartid)
-			return SBI_EINVAL;
 
 		switch (hwirq) {
 		case IRQ_M_EXT:
-- 
2.34.1


