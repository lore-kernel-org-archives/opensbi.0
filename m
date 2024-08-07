From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed,  7 Aug 2024 11:17:17 -0700
Subject: [PATCH v3 1/3] lib: sbi: Support multiple heaps
In-Reply-To: <20240807181719.244099-1-gregorhaas1997@gmail.com>
References: <20240807181719.244099-1-gregorhaas1997@gmail.com>
Message-ID: <20240807181719.244099-2-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The upcoming SMMTT implementation will require some larger contiguous memory
regions for the memory tracking tables. We plan to specify the memory region
for these tables as a reserved-memory node in the device tree, and then
dynamically allocate individual tables out of this region. These changes to the
SBI heap allocator will allow us to explicitly create and allocate from a
dedicated heap tied to the table memory region.

Signed-off-by: Gregor Haas <gregorhaas1997@gmail.com>
---
 include/sbi/sbi_heap.h |  57 +++++++++++++++++--
 lib/sbi/sbi_heap.c     | 122 +++++++++++++++++++++++------------------
 2 files changed, 119 insertions(+), 60 deletions(-)

diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
index 16755ec..9a67090 100644
--- a/include/sbi/sbi_heap.h
+++ b/include/sbi/sbi_heap.h
@@ -12,16 +12,32 @@
 
 #include <sbi/sbi_types.h>
 
+/* Opaque declaration of heap control struct */
+struct sbi_heap_control;
+
+/* Global heap control structure */
+extern struct sbi_heap_control global_hpctrl;
+
 /* Alignment of heap base address and size */
 #define HEAP_BASE_ALIGN			1024
 
 struct sbi_scratch;
 
 /** Allocate from heap area */
-void *sbi_malloc(size_t size);
+void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size);
+
+static inline void *sbi_malloc(size_t size)
+{
+	return sbi_malloc_from(&global_hpctrl, size);
+}
 
 /** Zero allocate from heap area */
-void *sbi_zalloc(size_t size);
+void *sbi_zalloc_from(struct sbi_heap_control *hpctrl, size_t size);
+
+static inline void *sbi_zalloc(size_t size)
+{
+	return sbi_zalloc_from(&global_hpctrl, size);
+}
 
 /** Allocate array from heap area */
 static inline void *sbi_calloc(size_t nitems, size_t size)
@@ -29,19 +45,48 @@ static inline void *sbi_calloc(size_t nitems, size_t size)
 	return sbi_zalloc(nitems * size);
 }
 
+static inline void *sbi_calloc_from(struct sbi_heap_control *hpctrl,
+				    size_t nitems, size_t size)
+{
+	return sbi_zalloc_from(hpctrl, nitems * size);
+}
+
 /** Free-up to heap area */
-void sbi_free(void *ptr);
+void sbi_free_from(struct sbi_heap_control *hpctrl, void *ptr);
+
+static inline void sbi_free(void *ptr)
+{
+	return sbi_free_from(&global_hpctrl, ptr);
+}
 
 /** Amount (in bytes) of free space in the heap area */
-unsigned long sbi_heap_free_space(void);
+unsigned long sbi_heap_free_space_from(struct sbi_heap_control *hpctrl);
+
+static inline unsigned long sbi_heap_free_space(void)
+{
+	return sbi_heap_free_space_from(&global_hpctrl);
+}
 
 /** Amount (in bytes) of used space in the heap area */
-unsigned long sbi_heap_used_space(void);
+unsigned long sbi_heap_used_space_from(struct sbi_heap_control *hpctrl);
+
+static inline unsigned long sbi_heap_used_space(void)
+{
+	return sbi_heap_used_space_from(&global_hpctrl);
+}
 
 /** Amount (in bytes) of reserved space in the heap area */
-unsigned long sbi_heap_reserved_space(void);
+unsigned long sbi_heap_reserved_space_from(struct sbi_heap_control *hpctrl);
+
+static inline unsigned long sbi_heap_reserved_space(void)
+{
+	return sbi_heap_reserved_space_from(&global_hpctrl);
+}
 
 /** Initialize heap area */
 int sbi_heap_init(struct sbi_scratch *scratch);
+int sbi_heap_init_new(struct sbi_heap_control *hpctrl, unsigned long base,
+		       unsigned long size);
+int sbi_heap_alloc_new(struct sbi_heap_control **hpctrl);
 
 #endif
diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index bcd404b..e43d77c 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -24,7 +24,7 @@ struct heap_node {
 	unsigned long size;
 };
 
-struct heap_control {
+struct sbi_heap_control {
 	spinlock_t lock;
 	unsigned long base;
 	unsigned long size;
@@ -35,9 +35,9 @@ struct heap_control {
 	struct sbi_dlist used_space_list;
 };
 
-static struct heap_control hpctrl;
+struct sbi_heap_control global_hpctrl;
 
-void *sbi_malloc(size_t size)
+void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size)
 {
 	void *ret = NULL;
 	struct heap_node *n, *np;
@@ -48,10 +48,10 @@ void *sbi_malloc(size_t size)
 	size += HEAP_ALLOC_ALIGN - 1;
 	size &= ~((unsigned long)HEAP_ALLOC_ALIGN - 1);
 
-	spin_lock(&hpctrl.lock);
+	spin_lock(&hpctrl->lock);
 
 	np = NULL;
-	sbi_list_for_each_entry(n, &hpctrl.free_space_list, head) {
+	sbi_list_for_each_entry(n, &hpctrl->free_space_list, head) {
 		if (size <= n->size) {
 			np = n;
 			break;
@@ -59,47 +59,47 @@ void *sbi_malloc(size_t size)
 	}
 	if (np) {
 		if ((size < np->size) &&
-		    !sbi_list_empty(&hpctrl.free_node_list)) {
-			n = sbi_list_first_entry(&hpctrl.free_node_list,
+		    !sbi_list_empty(&hpctrl->free_node_list)) {
+			n = sbi_list_first_entry(&hpctrl->free_node_list,
 						 struct heap_node, head);
 			sbi_list_del(&n->head);
 			n->addr = np->addr + np->size - size;
 			n->size = size;
 			np->size -= size;
-			sbi_list_add_tail(&n->head, &hpctrl.used_space_list);
+			sbi_list_add_tail(&n->head, &hpctrl->used_space_list);
 			ret = (void *)n->addr;
 		} else if (size == np->size) {
 			sbi_list_del(&np->head);
-			sbi_list_add_tail(&np->head, &hpctrl.used_space_list);
+			sbi_list_add_tail(&np->head, &hpctrl->used_space_list);
 			ret = (void *)np->addr;
 		}
 	}
 
-	spin_unlock(&hpctrl.lock);
+	spin_unlock(&hpctrl->lock);
 
 	return ret;
 }
 
-void *sbi_zalloc(size_t size)
+void *sbi_zalloc_from(struct sbi_heap_control *hpctrl, size_t size)
 {
-	void *ret = sbi_malloc(size);
+	void *ret = sbi_malloc_from(hpctrl, size);
 
 	if (ret)
 		sbi_memset(ret, 0, size);
 	return ret;
 }
 
-void sbi_free(void *ptr)
+void sbi_free_from(struct sbi_heap_control *hpctrl, void *ptr)
 {
 	struct heap_node *n, *np;
 
 	if (!ptr)
 		return;
 
-	spin_lock(&hpctrl.lock);
+	spin_lock(&hpctrl->lock);
 
 	np = NULL;
-	sbi_list_for_each_entry(n, &hpctrl.used_space_list, head) {
+	sbi_list_for_each_entry(n, &hpctrl->used_space_list, head) {
 		if ((n->addr <= (unsigned long)ptr) &&
 		    ((unsigned long)ptr < (n->addr + n->size))) {
 			np = n;
@@ -107,22 +107,22 @@ void sbi_free(void *ptr)
 		}
 	}
 	if (!np) {
-		spin_unlock(&hpctrl.lock);
+		spin_unlock(&hpctrl->lock);
 		return;
 	}
 
 	sbi_list_del(&np->head);
 
-	sbi_list_for_each_entry(n, &hpctrl.free_space_list, head) {
+	sbi_list_for_each_entry(n, &hpctrl->free_space_list, head) {
 		if ((np->addr + np->size) == n->addr) {
 			n->addr = np->addr;
 			n->size += np->size;
-			sbi_list_add_tail(&np->head, &hpctrl.free_node_list);
+			sbi_list_add_tail(&np->head, &hpctrl->free_node_list);
 			np = NULL;
 			break;
 		} else if (np->addr == (n->addr + n->size)) {
 			n->size += np->size;
-			sbi_list_add_tail(&np->head, &hpctrl.free_node_list);
+			sbi_list_add_tail(&np->head, &hpctrl->free_node_list);
 			np = NULL;
 			break;
 		} else if ((n->addr + n->size) < np->addr) {
@@ -132,73 +132,87 @@ void sbi_free(void *ptr)
 		}
 	}
 	if (np)
-		sbi_list_add_tail(&np->head, &hpctrl.free_space_list);
+		sbi_list_add_tail(&np->head, &hpctrl->free_space_list);
 
-	spin_unlock(&hpctrl.lock);
+	spin_unlock(&hpctrl->lock);
 }
 
-unsigned long sbi_heap_free_space(void)
+unsigned long sbi_heap_free_space_from(struct sbi_heap_control *hpctrl)
 {
 	struct heap_node *n;
 	unsigned long ret = 0;
 
-	spin_lock(&hpctrl.lock);
-	sbi_list_for_each_entry(n, &hpctrl.free_space_list, head)
+	spin_lock(&hpctrl->lock);
+	sbi_list_for_each_entry(n, &hpctrl->free_space_list, head)
 		ret += n->size;
-	spin_unlock(&hpctrl.lock);
+	spin_unlock(&hpctrl->lock);
 
 	return ret;
 }
 
-unsigned long sbi_heap_used_space(void)
+unsigned long sbi_heap_used_space_from(struct sbi_heap_control *hpctrl)
 {
-	return hpctrl.size - hpctrl.hksize - sbi_heap_free_space();
+	return hpctrl->size - hpctrl->hksize - sbi_heap_free_space();
 }
 
-unsigned long sbi_heap_reserved_space(void)
+unsigned long sbi_heap_reserved_space_from(struct sbi_heap_control *hpctrl)
 {
-	return hpctrl.hksize;
+	return hpctrl->hksize;
 }
 
-int sbi_heap_init(struct sbi_scratch *scratch)
+int sbi_heap_init_new(struct sbi_heap_control *hpctrl, unsigned long base,
+		       unsigned long size)
 {
 	unsigned long i;
 	struct heap_node *n;
 
-	/* Sanity checks on heap offset and size */
-	if (!scratch->fw_heap_size ||
-	    (scratch->fw_heap_size & (HEAP_BASE_ALIGN - 1)) ||
-	    (scratch->fw_heap_offset < scratch->fw_rw_offset) ||
-	    (scratch->fw_size < (scratch->fw_heap_offset + scratch->fw_heap_size)) ||
-	    (scratch->fw_heap_offset & (HEAP_BASE_ALIGN - 1)))
-		return SBI_EINVAL;
-
 	/* Initialize heap control */
-	SPIN_LOCK_INIT(hpctrl.lock);
-	hpctrl.base = scratch->fw_start + scratch->fw_heap_offset;
-	hpctrl.size = scratch->fw_heap_size;
-	hpctrl.hkbase = hpctrl.base;
-	hpctrl.hksize = hpctrl.size / HEAP_HOUSEKEEPING_FACTOR;
-	hpctrl.hksize &= ~((unsigned long)HEAP_BASE_ALIGN - 1);
-	SBI_INIT_LIST_HEAD(&hpctrl.free_node_list);
-	SBI_INIT_LIST_HEAD(&hpctrl.free_space_list);
-	SBI_INIT_LIST_HEAD(&hpctrl.used_space_list);
+	SPIN_LOCK_INIT(hpctrl->lock);
+	hpctrl->base = base;
+	hpctrl->size = size;
+	hpctrl->hkbase = hpctrl->base;
+	hpctrl->hksize = hpctrl->size / HEAP_HOUSEKEEPING_FACTOR;
+	hpctrl->hksize &= ~((unsigned long)HEAP_BASE_ALIGN - 1);
+	SBI_INIT_LIST_HEAD(&hpctrl->free_node_list);
+	SBI_INIT_LIST_HEAD(&hpctrl->free_space_list);
+	SBI_INIT_LIST_HEAD(&hpctrl->used_space_list);
 
 	/* Prepare free node list */
-	for (i = 0; i < (hpctrl.hksize / sizeof(*n)); i++) {
-		n = (struct heap_node *)(hpctrl.hkbase + (sizeof(*n) * i));
+	for (i = 0; i < (hpctrl->hksize / sizeof(*n)); i++) {
+		n = (struct heap_node *)(hpctrl->hkbase + (sizeof(*n) * i));
 		SBI_INIT_LIST_HEAD(&n->head);
 		n->addr = n->size = 0;
-		sbi_list_add_tail(&n->head, &hpctrl.free_node_list);
+		sbi_list_add_tail(&n->head, &hpctrl->free_node_list);
 	}
 
 	/* Prepare free space list */
-	n = sbi_list_first_entry(&hpctrl.free_node_list,
+	n = sbi_list_first_entry(&hpctrl->free_node_list,
 				 struct heap_node, head);
 	sbi_list_del(&n->head);
-	n->addr = hpctrl.hkbase + hpctrl.hksize;
-	n->size = hpctrl.size - hpctrl.hksize;
-	sbi_list_add_tail(&n->head, &hpctrl.free_space_list);
+	n->addr = hpctrl->hkbase + hpctrl->hksize;
+	n->size = hpctrl->size - hpctrl->hksize;
+	sbi_list_add_tail(&n->head, &hpctrl->free_space_list);
+
+	return 0;
+}
 
+int sbi_heap_init(struct sbi_scratch *scratch)
+{
+	/* Sanity checks on heap offset and size */
+	if (!scratch->fw_heap_size ||
+	    (scratch->fw_heap_size & (HEAP_BASE_ALIGN - 1)) ||
+	    (scratch->fw_heap_offset < scratch->fw_rw_offset) ||
+	    (scratch->fw_size < (scratch->fw_heap_offset + scratch->fw_heap_size)) ||
+	    (scratch->fw_heap_offset & (HEAP_BASE_ALIGN - 1)))
+		return SBI_EINVAL;
+
+	return sbi_heap_init_new(&global_hpctrl,
+				  scratch->fw_start + scratch->fw_heap_offset,
+				  scratch->fw_heap_size);
+}
+
+int sbi_heap_alloc_new(struct sbi_heap_control **hpctrl)
+{
+	*hpctrl = sbi_calloc(1, sizeof(struct sbi_heap_control));
 	return 0;
 }
-- 
2.45.2


