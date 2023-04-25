From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Apr 2023 18:02:15 +0530
Subject: [PATCH 02/17] lib: sbi: Introduce simple heap allocator
In-Reply-To: <20230425123230.3943447-1-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
Message-ID: <20230425123230.3943447-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We provide simple heap allocator to manage the heap space provided
by OpenSBI firmware and platform.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_heap.h |  44 +++++++++
 lib/sbi/objects.mk     |   1 +
 lib/sbi/sbi_heap.c     | 204 +++++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c     |  15 +++
 4 files changed, 264 insertions(+)
 create mode 100644 include/sbi/sbi_heap.h
 create mode 100644 lib/sbi/sbi_heap.c

diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
new file mode 100644
index 0000000..88d176e
--- /dev/null
+++ b/include/sbi/sbi_heap.h
@@ -0,0 +1,44 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel<apatel@ventanamicro.com>
+ */
+
+#ifndef __SBI_HEAP_H__
+#define __SBI_HEAP_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_scratch;
+
+/** Allocate from heap area */
+void *sbi_malloc(size_t size);
+
+/** Zero allocate from heap area */
+void *sbi_zalloc(size_t size);
+
+/** Allocate array from heap area */
+static inline void *sbi_calloc(size_t nitems, size_t size)
+{
+	return sbi_zalloc(nitems * size);
+}
+
+/** Free-up to heap area */
+void sbi_free(void *ptr);
+
+/** Amount (in bytes) of free space in the heap area */
+unsigned long sbi_heap_free_space(void);
+
+/** Amount (in bytes) of used space in the heap area */
+unsigned long sbi_heap_used_space(void);
+
+/** Amount (in bytes) of reserved space in the heap area */
+unsigned long sbi_heap_reserved_space(void);
+
+/** Initialize heap area */
+int sbi_heap_init(struct sbi_scratch *scratch);
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 7d691c6..c699187 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -59,6 +59,7 @@ libsbi-objs-y += sbi_domain.o
 libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
 libsbi-objs-y += sbi_hart.o
+libsbi-objs-y += sbi_heap.o
 libsbi-objs-y += sbi_math.o
 libsbi-objs-y += sbi_hfence.o
 libsbi-objs-y += sbi_hsm.o
diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
new file mode 100644
index 0000000..82aa1ec
--- /dev/null
+++ b/lib/sbi/sbi_heap.c
@@ -0,0 +1,204 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel<apatel@ventanamicro.com>
+ */
+
+#include <sbi/riscv_locks.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_list.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+
+#define HEAP_BASE_ALIGN			1024
+#define HEAP_ALLOC_ALIGN		64
+#define HEAP_HOUSEKEEPING_FACTOR	16
+
+struct heap_node {
+	struct sbi_dlist head;
+	unsigned long addr;
+	unsigned long size;
+};
+
+struct heap_control {
+	spinlock_t lock;
+	unsigned long base;
+	unsigned long size;
+	unsigned long hkbase;
+	unsigned long hksize;
+	struct sbi_dlist free_node_list;
+	struct sbi_dlist free_space_list;
+	struct sbi_dlist used_space_list;
+};
+
+static struct heap_control hpctrl;
+
+void *sbi_malloc(size_t size)
+{
+	void *ret = NULL;
+	struct heap_node *n, *np;
+
+	if (!size)
+		return NULL;
+
+	size += HEAP_ALLOC_ALIGN - 1;
+	size &= ~((unsigned long)HEAP_ALLOC_ALIGN - 1);
+
+	spin_lock(&hpctrl.lock);
+
+	np = NULL;
+	sbi_list_for_each_entry(n, &hpctrl.free_space_list, head) {
+		if (size <= n->size) {
+			np = n;
+			break;
+		}
+	}
+	if (np) {
+		if ((size < np->size) &&
+		    !sbi_list_empty(&hpctrl.free_node_list)) {
+			n = sbi_list_first_entry(&hpctrl.free_node_list,
+						 struct heap_node, head);
+			sbi_list_del(&n->head);
+			n->addr = np->addr + np->size - size;
+			n->size = size;
+			np->size -= size;
+			sbi_list_add_tail(&n->head, &hpctrl.used_space_list);
+			ret = (void *)n->addr;
+		} else if (size == np->size) {
+			sbi_list_del(&np->head);
+			sbi_list_add_tail(&np->head, &hpctrl.used_space_list);
+			ret = (void *)np->addr;
+		}
+	}
+
+	spin_unlock(&hpctrl.lock);
+
+	return ret;
+}
+
+void *sbi_zalloc(size_t size)
+{
+	void *ret = sbi_malloc(size);
+
+	if (ret)
+		sbi_memset(ret, 0, size);
+	return ret;
+}
+
+void sbi_free(void *ptr)
+{
+	struct heap_node *n, *np;
+
+	if (!ptr)
+		return;
+
+	spin_lock(&hpctrl.lock);
+
+	np = NULL;
+	sbi_list_for_each_entry(n, &hpctrl.used_space_list, head) {
+		if ((n->addr <= (unsigned long)ptr) &&
+		    ((unsigned long)ptr < (n->addr + n->size))) {
+			np = n;
+			break;
+		}
+	}
+	if (!np) {
+		spin_unlock(&hpctrl.lock);
+		return;
+	}
+
+	sbi_list_del(&np->head);
+
+	sbi_list_for_each_entry(n, &hpctrl.free_space_list, head) {
+		if ((np->addr + np->size) == n->addr) {
+			n->addr = np->addr;
+			n->size += np->size;
+			sbi_list_add_tail(&np->head, &hpctrl.free_node_list);
+			np = NULL;
+			break;
+		} else if (np->addr == (n->addr + n->size)) {
+			n->size += np->size;
+			sbi_list_add_tail(&np->head, &hpctrl.free_node_list);
+			np = NULL;
+			break;
+		} else if ((n->addr + n->size) < np->addr) {
+			sbi_list_add(&np->head, &n->head);
+			np = NULL;
+			break;
+		}
+	}
+	if (np)
+		sbi_list_add_tail(&np->head, &hpctrl.free_space_list);
+
+	spin_unlock(&hpctrl.lock);
+}
+
+unsigned long sbi_heap_free_space(void)
+{
+	struct heap_node *n;
+	unsigned long ret = 0;
+
+	spin_lock(&hpctrl.lock);
+	sbi_list_for_each_entry(n, &hpctrl.free_space_list, head)
+		ret += n->size;
+	spin_unlock(&hpctrl.lock);
+
+	return ret;
+}
+
+unsigned long sbi_heap_used_space(void)
+{
+	return hpctrl.size - hpctrl.hksize - sbi_heap_free_space();
+}
+
+unsigned long sbi_heap_reserved_space(void)
+{
+	return hpctrl.hksize;
+}
+
+int sbi_heap_init(struct sbi_scratch *scratch)
+{
+	unsigned long i;
+	struct heap_node *n;
+
+	/* Sanity checks on heap offset and size */
+	if (!scratch->fw_heap_size ||
+	    (scratch->fw_heap_size & (HEAP_BASE_ALIGN - 1)) ||
+	    (scratch->fw_heap_offset < scratch->fw_rw_offset) ||
+	    (scratch->fw_size < (scratch->fw_heap_offset + scratch->fw_heap_size)) ||
+	    (scratch->fw_heap_offset & (HEAP_BASE_ALIGN - 1)))
+		return SBI_EINVAL;
+
+	/* Initialize heap control */
+	SPIN_LOCK_INIT(hpctrl.lock);
+	hpctrl.base = scratch->fw_start + scratch->fw_heap_offset;
+	hpctrl.size = scratch->fw_heap_size;
+	hpctrl.hkbase = hpctrl.base;
+	hpctrl.hksize = hpctrl.size / HEAP_HOUSEKEEPING_FACTOR;
+	hpctrl.hksize &= ~((unsigned long)HEAP_BASE_ALIGN - 1);
+	SBI_INIT_LIST_HEAD(&hpctrl.free_node_list);
+	SBI_INIT_LIST_HEAD(&hpctrl.free_space_list);
+	SBI_INIT_LIST_HEAD(&hpctrl.used_space_list);
+
+	/* Prepare free node list */
+	for (i = 0; i < (hpctrl.hksize / sizeof(*n)); i++) {
+		n = (struct heap_node *)(hpctrl.hkbase + (sizeof(*n) * i));
+		SBI_INIT_LIST_HEAD(&n->head);
+		n->addr = n->size = 0;
+		sbi_list_add_tail(&n->head, &hpctrl.free_node_list);
+	}
+
+	/* Prepare free space list */
+	n = sbi_list_first_entry(&hpctrl.free_node_list,
+				 struct heap_node, head);
+	sbi_list_del(&n->head);
+	n->addr = hpctrl.hkbase + hpctrl.hksize;
+	n->size = hpctrl.size - hpctrl.hksize;
+	sbi_list_add_tail(&n->head, &hpctrl.free_space_list);
+
+	return 0;
+}
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5db8e7f..f09a7ac 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_irqchip.h>
@@ -118,6 +119,15 @@ static void sbi_boot_print_general(struct sbi_scratch *scratch)
 	sbi_printf("Firmware Size             : %d KB\n",
 		   (u32)(scratch->fw_size / 1024));
 	sbi_printf("Firmware RW Offset        : 0x%lx\n", scratch->fw_rw_offset);
+	sbi_printf("Firmware RW Size          : %d KB\n",
+		   (u32)((scratch->fw_size - scratch->fw_rw_offset) / 1024));
+	sbi_printf("Firmware Heap Offset      : 0x%lx\n", scratch->fw_heap_offset);
+	sbi_printf("Firmware Heap Size        : "
+		   "%d KB (total), %d KB (reserved), %d KB (used), %d KB (free)\n",
+		   (u32)(scratch->fw_heap_size / 1024),
+		   (u32)(sbi_heap_reserved_space() / 1024),
+		   (u32)(sbi_heap_used_space() / 1024),
+		   (u32)(sbi_heap_free_space() / 1024));
 
 	/* SBI details */
 	sbi_printf("Runtime SBI Version       : %d.%d\n",
@@ -258,6 +268,11 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 
 	/* Note: This has to be second thing in coldboot init sequence */
+	rc = sbi_heap_init(scratch);
+	if (rc)
+		sbi_hart_hang();
+
+	/* Note: This has to be thing thing in coldboot init sequence */
 	rc = sbi_domain_init(scratch, hartid);
 	if (rc)
 		sbi_hart_hang();
-- 
2.34.1


