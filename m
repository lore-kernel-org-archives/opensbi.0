From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  9 Jul 2021 18:40:59 +0530
Subject: [PATCH v2 6/6] lib: utils/fdt: Disable GPIO restart and poweroff
 nodes in fdt_fixups()
In-Reply-To: <20210709131059.1502293-1-anup.patel@wdc.com>
References: <20210709131059.1502293-1-anup.patel@wdc.com>
Message-ID: <20210709131059.1502293-7-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We now have SBI SRST extension provided via generic GPIO restart and
poweroff similar to Linux kernel so let's disable corresponding
device tree nodes in fdt_fixups().

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi_utils/fdt/fdt_fixup.h | 17 +++++++++++++++--
 lib/utils/fdt/fdt_fixup.c         | 25 +++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
index c38e5d9..cc86440 100644
--- a/include/sbi_utils/fdt/fdt_fixup.h
+++ b/include/sbi_utils/fdt/fdt_fixup.h
@@ -21,6 +21,18 @@
  */
 void fdt_cpu_fixup(void *fdt);
 
+/**
+ * Fix up the GPIO restart and poweroff nodes in the device tree
+ *
+ * This routine disabls the GPIO restart and poweroff nodes in the device
+ * tree because OpenSBI provides SBI SRST extension based on it.
+ *
+ * It is recommended that platform codes call this helper in their final_init()
+ *
+ * @param fdt: device tree blob
+ */
+void fdt_gpio_reset_fixup(void *fdt);
+
 /**
  * Fix up the PLIC node in the device tree
  *
@@ -64,8 +76,9 @@ int fdt_reserved_memory_nomap_fixup(void *fdt);
  * General device tree fix-up
  *
  * This routine do all required device tree fix-ups for a typical platform.
- * It fixes up the PLIC node and the reserved memory node in the device tree
- * by calling the corresponding helper routines to accomplish the task.
+ * It fixes up the GPIO restart/poweroff node, PLIC node and the reserved
+ * memory node in the device tree by calling the corresponding helper
+ * routines to accomplish the task.
  *
  * It is recommended that platform codes call this helper in their final_init()
  *
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 1465500..52d1a0e 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -51,6 +51,27 @@ void fdt_cpu_fixup(void *fdt)
 	}
 }
 
+void fdt_gpio_reset_fixup(void *fdt)
+{
+	int err, nodeoff;
+
+	nodeoff = fdt_node_offset_by_compatible(fdt, 0, "gpio-poweroff");
+	if (nodeoff >= 0) {
+		err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
+		if (err < 0)
+			return;
+		fdt_setprop_string(fdt, nodeoff, "status", "disabled");
+	}
+
+	nodeoff = fdt_node_offset_by_compatible(fdt, 0, "gpio-restart");
+	if (nodeoff >= 0) {
+		err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
+		if (err < 0)
+			return;
+		fdt_setprop_string(fdt, nodeoff, "status", "disabled");
+	}
+}
+
 void fdt_plic_fixup(void *fdt)
 {
 	u32 *cells;
@@ -260,9 +281,9 @@ int fdt_reserved_memory_nomap_fixup(void *fdt)
 
 void fdt_fixups(void *fdt)
 {
+	fdt_gpio_reset_fixup(fdt);
+
 	fdt_plic_fixup(fdt);
 
 	fdt_reserved_memory_fixup(fdt);
 }
-
-
-- 
2.25.1


