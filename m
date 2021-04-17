From: guoren@kernel.org <guoren@kernel.org>
Date: Sat, 17 Apr 2021 16:26:16 +0000
Subject: [PATCH v2 1/2] lib: utils: Implement "64bit-mmio" property parsing
Message-ID: <1618676777-89271-1-git-send-email-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

Figure out CLINT has_64bit_mmio from DT node and using antonym for
compatibility.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
---
 lib/utils/fdt/fdt_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index bf19ff9..909de01 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -442,8 +442,9 @@ int fdt_parse_clint_node(void *fdt, int nodeoffset, bool for_timer,
 	if (clint->hart_count < count)
 		clint->hart_count = count;
 
-	/* TODO: We should figure-out CLINT has_64bit_mmio from DT node */
 	clint->has_64bit_mmio = TRUE;
+	if (fdt_getprop(fdt, nodeoffset, "clint,has-no-64bit-mmio", &count))
+		clint->has_64bit_mmio = FALSE;
 
 	return 0;
 }
-- 
2.7.4


