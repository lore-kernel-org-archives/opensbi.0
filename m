From: Atish Patra <atish.patra@wdc.com>
Date: Tue, 20 Oct 2020 17:39:13 -0700
Subject: [PATCH v2] lib: utils: Implement "ranges" property parsing
Message-ID: <20201021003913.2376881-1-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "reg" property in a device node may not be the correct address always.
If a parent node defines a "ranges" property, the child address need to be
translated with respect to parents address. If the ranges property is not
present, it will just use 1:1 translation.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
Changes from v1->v2:
1. Improved the range parsing by supporting multiple parent nodes.
---
 lib/utils/fdt/fdt_helper.c | 49 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index aec73a0598d7..90d55dcd8e71 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -71,10 +71,47 @@ int fdt_find_match(void *fdt, int startoff,
 	return SBI_ENODEV;
 }
 
+int fdt_translate_address(void *fdt, uint64_t reg, int parent, unsigned long *addr)
+{
+	int i, rlen;
+	int cell_addr, cell_size;
+	const fdt32_t *ranges;
+	uint64_t offset = 0, caddr = 0, paddr = 0, rsize = 0;
+
+	cell_addr = fdt_address_cells(fdt, parent);
+	if (cell_addr < 1)
+		return SBI_ENODEV;
+
+	cell_size = fdt_size_cells(fdt, parent);
+	if (cell_size < 0)
+		return SBI_ENODEV;
+
+	ranges = fdt_getprop(fdt, parent, "ranges", &rlen);
+	if (ranges && rlen > 0) {
+		for (i = 0; i < cell_addr; i++)
+			caddr = (caddr << 32) | fdt32_to_cpu(*ranges++);
+		for (i = 0; i < cell_addr; i++)
+			paddr = (paddr << 32) | fdt32_to_cpu(*ranges++);
+		for (i = 0; i < cell_size; i++)
+			rsize = (rsize << 32) | fdt32_to_cpu(*ranges++);
+		if (reg < caddr || caddr >= (reg + rsize )) {
+			sbi_printf("invalid address translation\n");
+			return SBI_ENODEV;
+		}
+		offset = reg - caddr;
+		*addr = paddr + offset;
+	} else {
+		/* No translation required */
+		*addr = reg;
+	}
+
+	return 0;
+}
+
 int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
 			   unsigned long *size)
 {
-	int parent, len, i;
+	int parent, len, i, rc;
 	int cell_addr, cell_size;
 	const fdt32_t *prop_addr, *prop_size;
 	uint64_t temp = 0;
@@ -98,7 +135,15 @@ int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
 	if (addr) {
 		for (i = 0; i < cell_addr; i++)
 			temp = (temp << 32) | fdt32_to_cpu(*prop_addr++);
-		*addr = temp;
+		do {
+			if (parent < 0)
+				break;
+			rc  = fdt_translate_address(fdt, temp, parent, addr);
+			if (rc)
+				break;
+			parent = fdt_parent_offset(fdt, parent);
+			temp = *addr;
+		} while (1);
 	}
 	temp = 0;
 
-- 
2.25.1


