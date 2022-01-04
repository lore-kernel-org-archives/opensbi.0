From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  4 Jan 2022 15:43:23 +0530
Subject: [PATCH 13/13] lib: utils: Disable appropriate APLIC DT nodes in
 fdt_fixups()
In-Reply-To: <20220104101323.127564-1-apatel@ventanamicro.com>
References: <20220104101323.127564-1-apatel@ventanamicro.com>
Message-ID: <20220104101323.127564-11-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should disable APLIC DT nodes in fdt_fixups() which are not
accessible to the next booting stage based on currently assigned
domain.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/fdt/fdt_fixup.h | 18 +++++++++++++++---
 lib/utils/fdt/fdt_fixup.c         | 11 +++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
index 77575bb..fb076ba 100644
--- a/include/sbi_utils/fdt/fdt_fixup.h
+++ b/include/sbi_utils/fdt/fdt_fixup.h
@@ -21,6 +21,18 @@
  */
 void fdt_cpu_fixup(void *fdt);
 
+/**
+ * Fix up the APLIC nodes in the device tree
+ *
+ * This routine disables APLIC nodes which are not accessible to the next
+ * booting stage based on currently assigned domain.
+ *
+ * It is recommended that platform codes call this helper in their final_init()
+ *
+ * @param fdt: device tree blob
+ */
+void fdt_aplic_fixup(void *fdt);
+
 /**
  * Fix up the IMSIC nodes in the device tree
  *
@@ -76,9 +88,9 @@ int fdt_reserved_memory_nomap_fixup(void *fdt);
  * General device tree fix-up
  *
  * This routine do all required device tree fix-ups for a typical platform.
- * It fixes up the PLIC node, IMSIC nodes, and the reserved memory node in
- * the device tree by calling the corresponding helper routines to accomplish
- * the task.
+ * It fixes up the PLIC node, IMSIC nodes, APLIC nodes, and the reserved
+ * memory node in the device tree by calling the corresponding helper
+ * routines to accomplish the task.
  *
  * It is recommended that platform codes call this helper in their final_init()
  *
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index c2460b8..a80bd82 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -71,6 +71,15 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
 	}
 }
 
+void fdt_aplic_fixup(void *fdt)
+{
+	int noff = 0;
+
+	while ((noff = fdt_node_offset_by_compatible(fdt, noff,
+						     "riscv,aplic")) >= 0)
+		fdt_domain_based_fixup_one(fdt, noff);
+}
+
 void fdt_imsic_fixup(void *fdt)
 {
 	int noff = 0;
@@ -289,6 +298,8 @@ int fdt_reserved_memory_nomap_fixup(void *fdt)
 
 void fdt_fixups(void *fdt)
 {
+	fdt_aplic_fixup(fdt);
+
 	fdt_imsic_fixup(fdt);
 
 	fdt_plic_fixup(fdt);
-- 
2.25.1


