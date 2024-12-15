From: Xiang W <wxjstz@126.com>
Date: Sun, 15 Dec 2024 19:25:44 +0800
Subject: [PATCH] lib: utils: improvement rpmi_cppc_fc_db_trigger
Message-ID: <20241215112602.745461-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Improve 64-bit operation under rv32 and remove db_val_u32_hi.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/cppc/fdt_cppc_rpmi.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
index b6789901..4946ed14 100644
--- a/lib/utils/cppc/fdt_cppc_rpmi.c
+++ b/lib/utils/cppc/fdt_cppc_rpmi.c
@@ -59,11 +59,7 @@ static void rpmi_cppc_fc_db_trigger(struct rpmi_cppc *cppc)
 	u8 db_val_u8 = 0;
 	u16 db_val_u16 = 0;
 	u32 db_val_u32 = 0;
-#if __riscv_xlen != 32
 	u64 db_val_u64 = 0;
-#else
-	u32 db_val_u32_hi = 0;
-#endif
 
 	switch (cppc->fc_db_width) {
 	case RPMI_CPPC_FAST_CHANNEL_DB_WIDTH_8:
@@ -95,16 +91,13 @@ static void rpmi_cppc_fc_db_trigger(struct rpmi_cppc *cppc)
 
 		writeq(db_val_u64, (void *)cppc->fc_db_addr);
 #else
-		db_val_u32 = readl((void *)cppc->fc_db_addr);
-		db_val_u32_hi = readl((void *)(cppc->fc_db_addr + 4));
-
-		db_val_u32 = (u32)cppc->fc_db_setmask |
-				(db_val_u32 & (u32)cppc->fc_db_preservemask);
-		db_val_u32_hi = (u32)(cppc->fc_db_setmask >> 32) |
-				(db_val_u32 & (u32)(cppc->fc_db_preservemask >> 32));
-
-		writel(db_val_u32, (void *)cppc->fc_db_addr);
-		writel(db_val_u32_hi, (void *)(cppc->fc_db_addr + 4));
+		db_val_u64 = readl((void *)(cppc->fc_db_addr + 4));
+		db_val_u64 <<= 32;
+		db_val_u64 |= readl((void *)cppc->fc_db_addr);
+		db_val_u64 = cppc->fc_db_setmask |
+				(db_val_u64 & cppc->fc_db_preservemask);
+		writel(db_val_u64, (void *)cppc->fc_db_addr);
+		writel(db_val_u64 >> 32, (void *)(cppc->fc_db_addr + 4));
 #endif
 		break;
 	default:
-- 
2.45.2


