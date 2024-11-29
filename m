From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:44 +0530
Subject: [PATCH v2 09/17] lib: utils/fdt: Allow dynamic registration of FDT fixup callbacks
In-Reply-To: <20241129155052.2866712-1-apatel@ventanamicro.com>
References: <20241129155052.2866712-1-apatel@ventanamicro.com>
Message-ID: <20241129155052.2866712-10-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It should possible to fixup FDT from any part of OpenSBI so add
fdt_register_general_fixup() which allows dynamic registration of
FDT fixup callbacks.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/fdt/fdt_fixup.h | 15 ++++++++++++++
 lib/utils/fdt/fdt_fixup.c         | 33 +++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/sbi_utils/fdt/fdt_fixup.h b/include/sbi_utils/fdt/fdt_fixup.h
index 21a53011..93249968 100644
--- a/include/sbi_utils/fdt/fdt_fixup.h
+++ b/include/sbi_utils/fdt/fdt_fixup.h
@@ -9,6 +9,8 @@
 #ifndef __FDT_FIXUP_H__
 #define __FDT_FIXUP_H__
 
+#include <sbi/sbi_list.h>
+
 struct sbi_cpu_idle_state {
 	const char *name;
 	uint32_t suspend_param;
@@ -93,6 +95,19 @@ void fdt_plic_fixup(void *fdt);
  */
 int fdt_reserved_memory_fixup(void *fdt);
 
+/** Representation of a general fixup */
+struct fdt_general_fixup {
+	struct sbi_dlist head;
+	const char *name;
+	void (*do_fixup)(struct fdt_general_fixup *f, void *fdt);
+};
+
+/** Register a general fixup */
+int fdt_register_general_fixup(struct fdt_general_fixup *fixup);
+
+/** UnRegister a general fixup */
+void fdt_unregister_general_fixup(struct fdt_general_fixup *fixup);
+
 /**
  * General device tree fix-up
  *
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 9e013dfa..192d6dd5 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -401,8 +401,38 @@ void fdt_config_fixup(void *fdt)
 	fdt_nop_node(fdt, config_offset);
 }
 
+static SBI_LIST_HEAD(fixup_list);
+
+int fdt_register_general_fixup(struct fdt_general_fixup *fixup)
+{
+	struct fdt_general_fixup *f;
+
+	if (!fixup || !fixup->name || !fixup->do_fixup)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(f, &fixup_list, head) {
+		if (f == fixup)
+			return SBI_EALREADY;
+	}
+
+	SBI_INIT_LIST_HEAD(&fixup->head);
+	sbi_list_add_tail(&fixup->head, &fixup_list);
+
+	return 0;
+}
+
+void fdt_unregister_general_fixup(struct fdt_general_fixup *fixup)
+{
+	if (!fixup)
+		return;
+
+	sbi_list_del(&fixup->head);
+}
+
 void fdt_fixups(void *fdt)
 {
+	struct fdt_general_fixup *f;
+
 	fdt_aplic_fixup(fdt);
 
 	fdt_imsic_fixup(fdt);
@@ -416,4 +446,7 @@ void fdt_fixups(void *fdt)
 #endif
 
 	fdt_config_fixup(fdt);
+
+	sbi_list_for_each_entry(f, &fixup_list, head)
+		f->do_fixup(f, fdt);
 }
-- 
2.43.0


