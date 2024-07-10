From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 10 Jul 2024 14:09:24 -0700
Subject: [PATCH v2 2/2] lib: sbi: Implement aligned memory allocators
In-Reply-To: <20240710210924.817753-1-gregorhaas1997@gmail.com>
References: <20240710210924.817753-1-gregorhaas1997@gmail.com>
Message-ID: <20240710210924.817753-3-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This change adds a simple implementation of sbi_memalign(), for future use in
allocating aligned memory for SMMTT tables.
---
 include/sbi/sbi_heap.h |  5 +++++
 lib/sbi/sbi_heap.c     | 37 ++++++++++++++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
index a3f5a0c..468ad11 100644
--- a/include/sbi/sbi_heap.h
+++ b/include/sbi/sbi_heap.h
@@ -24,6 +24,11 @@ struct sbi_scratch;
 void *sbi_malloc(size_t size);
 void *sbi_malloc_from(struct heap_control *hpctrl, size_t size);
 
+/** Allocate aligned from heap area */
+void *sbi_memalign(size_t alignment, size_t size);
+void *sbi_memalign_from(struct heap_control *hpctrl, size_t alignment,
+			size_t size);
+
 /** Zero allocate from heap area */
 void *sbi_zalloc(size_t size);
 void *sbi_zalloc_from(struct heap_control *hpctrl, size_t size);
diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index 3be56f3..af18692 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -37,7 +37,8 @@ struct heap_control {
 
 static struct heap_control global_hpctrl;
 
-void *sbi_malloc_from(struct heap_control *hpctrl, size_t size)
+static void *alloc_with_align(struct heap_control *hpctrl,
+			      size_t align, size_t size)
 {
 	void *ret = NULL;
 	struct heap_node *n, *np;
@@ -45,8 +46,8 @@ void *sbi_malloc_from(struct heap_control *hpctrl, size_t size)
 	if (!size)
 		return NULL;
 
-	size += HEAP_ALLOC_ALIGN - 1;
-	size &= ~((unsigned long)HEAP_ALLOC_ALIGN - 1);
+	size += align - 1;
+	size &= ~((unsigned long)align - 1);
 
 	spin_lock(&hpctrl->lock);
 
@@ -80,11 +81,41 @@ void *sbi_malloc_from(struct heap_control *hpctrl, size_t size)
 	return ret;
 }
 
+void *sbi_malloc_from(struct heap_control *hpctrl, size_t size)
+{
+	return alloc_with_align(hpctrl, HEAP_ALLOC_ALIGN, size);
+}
+
 void *sbi_malloc(size_t size)
 {
 	return sbi_malloc_from(&global_hpctrl, size);
 }
 
+void *sbi_memalign_from(struct heap_control *hpctrl, size_t alignment,
+			size_t size)
+{
+	if(alignment < HEAP_ALLOC_ALIGN) {
+		alignment = HEAP_ALLOC_ALIGN;
+	}
+
+	// Make sure alignment is power of two
+	if((alignment & (alignment - 1)) != 0) {
+		return NULL;
+	}
+
+	// Make sure size is multiple of alignment
+	if(size % alignment != 0) {
+		return NULL;
+	}
+
+	return alloc_with_align(hpctrl, alignment, size);
+}
+
+void *sbi_memalign(size_t alignment, size_t size)
+{
+	return sbi_memalign_from(&global_hpctrl, alignment, size);
+}
+
 void *sbi_zalloc_from(struct heap_control *hpctrl, size_t size)
 {
 	void *ret = sbi_malloc_from(hpctrl, size);
-- 
2.45.2


