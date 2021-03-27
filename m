From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 27 Mar 2021 13:05:27 +0800
Subject: [PATCH 3/3] lib/utils: Support fixing up the official DT bindings of
 PLIC
In-Reply-To: <20210327050527.15955-1-bmeng.cn@gmail.com>
References: <20210327050527.15955-1-bmeng.cn@gmail.com>
Message-ID: <20210327050527.15955-3-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Current fdt_plic_fixup() only does necessary fix-up against the legacy
"riscv,plic0" node. The upstream Linux kernel defines its official DT
bindings which uses "sifive,plic-1.0.0" as the compatible string and
we should check that first, and if not present fall back to legacy.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 lib/utils/fdt/fdt_fixup.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index a306ff5..1465500 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -57,9 +57,12 @@ void fdt_plic_fixup(void *fdt)
 	int i, cells_count;
 	int plic_off;
 
-	plic_off = fdt_node_offset_by_compatible(fdt, 0, "riscv,plic0");
-	if (plic_off < 0)
-		return;
+	plic_off = fdt_node_offset_by_compatible(fdt, 0, "sifive,plic-1.0.0");
+	if (plic_off < 0) {
+		plic_off = fdt_node_offset_by_compatible(fdt, 0, "riscv,plic0");
+		if (plic_off < 0)
+			return;
+	}
 
 	cells = (u32 *)fdt_getprop(fdt, plic_off,
 				   "interrupts-extended", &cells_count);
-- 
2.25.1


