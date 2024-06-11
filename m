From: Xiang W <wxjstz@126.com>
Date: Tue, 11 Jun 2024 19:19:30 +0800
Subject: [PATCH 3/7] lib: utils/irqchip: Skip initialize irqchip when dt is not enabled
In-Reply-To: <20240611111937.1459876-1-wxjstz@126.com>
References: <20240611111937.1459876-1-wxjstz@126.com>
Message-ID: <20240611111937.1459876-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the dt node has a status property and the value is not ok or
okay, skip initializing irqchip.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/irqchip/fdt_irqchip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
index 1b6b674..c38b1d8 100644
--- a/lib/utils/irqchip/fdt_irqchip.c
+++ b/lib/utils/irqchip/fdt_irqchip.c
@@ -62,6 +62,9 @@ static int fdt_irqchip_cold_init(void)
 		drv_added = false;
 		while ((noff = fdt_find_match(fdt, noff,
 					drv->match_table, &match)) >= 0) {
+			if (!fdt_node_is_enabled(fdt,noff))
+				continue;
+
 			if (drv->cold_init) {
 				rc = drv->cold_init(fdt, noff, match);
 				if (rc == SBI_ENODEV)
-- 
2.43.0


