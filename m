From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 27 Mar 2021 13:05:26 +0800
Subject: [PATCH 2/3] lib/utils: Drop the 'compat' parameter of fdt_plic_fixup()
In-Reply-To: <20210327050527.15955-1-bmeng.cn@gmail.com>
References: <20210327050527.15955-1-bmeng.cn@gmail.com>
Message-ID: <20210327050527.15955-2-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

At present fdt_plic_fixup() accepts a 'compat' parameter for PLIC
compatible string. In preparation to support the new DT bindings,
drop this and use "riscv,plic0" directly in fdt_plic_fixup().

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 include/sbi_utils/fdt/fdt_fixup.h | 3 +--
 lib/utils/fdt/fdt_fixup.c         | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
index 0697a18..c38e5d9 100644
--- a/include/sbi_utils/fdt/fdt_fixup.h
+++ b/include/sbi_utils/fdt/fdt_fixup.h
@@ -30,9 +30,8 @@ void fdt_cpu_fixup(void *fdt);
  * It is recommended that platform codes call this helper in their final_init()
  *
  * @param fdt: device tree blob
- * @param compat: PLIC node compatible string
  */
-void fdt_plic_fixup(void *fdt, const char *compat);
+void fdt_plic_fixup(void *fdt);
 
 /**
  * Fix up the reserved memory node in the device tree
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index eea450d..a306ff5 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -51,13 +51,13 @@ void fdt_cpu_fixup(void *fdt)
 	}
 }
 
-void fdt_plic_fixup(void *fdt, const char *compat)
+void fdt_plic_fixup(void *fdt)
 {
 	u32 *cells;
 	int i, cells_count;
 	int plic_off;
 
-	plic_off = fdt_node_offset_by_compatible(fdt, 0, compat);
+	plic_off = fdt_node_offset_by_compatible(fdt, 0, "riscv,plic0");
 	if (plic_off < 0)
 		return;
 
@@ -257,7 +257,7 @@ int fdt_reserved_memory_nomap_fixup(void *fdt)
 
 void fdt_fixups(void *fdt)
 {
-	fdt_plic_fixup(fdt, "riscv,plic0");
+	fdt_plic_fixup(fdt);
 
 	fdt_reserved_memory_fixup(fdt);
 }
-- 
2.25.1


