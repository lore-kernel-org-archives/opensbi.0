From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Thu,  8 Dec 2022 02:14:21 +0100
Subject: [PATCH v2 3/3] lib: fix irqchip_plic_update_hartid_table
In-Reply-To: <20221208011421.11624-1-heinrich.schuchardt@canonical.com>
References: <20221208011421.11624-1-heinrich.schuchardt@canonical.com>
Message-ID: <20221208011421.11624-4-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After determining cpu_offset we have to check this value.

Addresses-Coverity-ID: 1529706 ("Logically dead code")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Xiang W <wxjstz@126.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
v2:
	add reviewed-by lines
---
 lib/utils/irqchip/fdt_irqchip_plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index a6e185c..fe08836 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -86,7 +86,7 @@ static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
 			continue;
 
 		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_intc_offset < 0)
+		if (cpu_offset < 0)
 			continue;
 
 		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-- 
2.37.2


