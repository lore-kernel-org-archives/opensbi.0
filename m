From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Tue,  8 Jun 2021 22:30:46 +0200
Subject: [PATCH 1/1] lib: sbi_scratch: re-implement scratch memory allocator
Message-ID: <20210608203046.105890-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Up to now we could allocated scratch memory but not deallocate it.

Provide a best fit memory allocator.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 include/sbi/sbi_scratch.h |  52 +++++++++-
 include/sbi/sbi_types.h   |   2 +
 lib/sbi/sbi_scratch.c     | 203 +++++++++++++++++++++++++++++++-------
 3 files changed, 218 insertions(+), 39 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 186a40c..f9ea434 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -36,10 +36,10 @@
 #define SBI_SCRATCH_TMP0_OFFSET			(9 * __SIZEOF_POINTER__)
 /** Offset of options member in sbi_scratch */
 #define SBI_SCRATCH_OPTIONS_OFFSET		(10 * __SIZEOF_POINTER__)
-/** Offset of extra space in sbi_scratch */
-#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(11 * __SIZEOF_POINTER__)
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
+/** Offset of field mem in the sbi_mem_alloc structure */
+#define SBI_SCRATCH_ALLOC_SIZE (offsetof(struct sbi_scratch_alloc, mem))

 /* clang-format on */

@@ -47,6 +47,49 @@

 #include <sbi/sbi_types.h>

+/**
+ * struct sbi_scratch_alloc - memory allocation
+ *
+ * This structure describes a block of allocated or free memory.
+ * The fields @prev and @next are only used for free blocks.
+ */
+struct sbi_scratch_alloc {
+	/**
+	 * @prev_size: size of previous memory block
+	 *
+	 * If the bit 0 is zero the memory is available.
+	 * If the bit 0 is non-zero the memory is allocated.
+	 */
+	unsigned int prev_size;
+	/**
+	 * @size: size of memory block
+	 *
+	 * If the bit 0 is zero the memory is available.
+	 * If the bit 0 is non-zero the memory is allocated.
+	 */
+	unsigned int size;
+
+	union {
+		/**
+		 * @mem: allocated memory
+		 *
+		 * The macro SBI_SCRATCH_ALLOC_SIZE provides the offset of @mem
+		 * in the sbi_mem_alloc structure.
+		 */
+		unsigned char mem[0];
+		struct {
+			/**
+			 * @prev: offset of preceeding block in free block list
+			 */
+			unsigned int prev;
+			/**
+			 * @next: offset of succceeding block in free block list
+			 */
+			unsigned int next;
+		};
+	};
+} __aligned(2 * sizeof(int));
+
 /** Representation of per-HART scratch space */
 struct sbi_scratch {
 	/** Start (or base) address of firmware linked to OpenSBI library */
@@ -71,6 +114,8 @@ struct sbi_scratch {
 	unsigned long tmp0;
 	/** Options for OpenSBI library */
 	unsigned long options;
+	/** Start of scratch memory allocation list */
+	struct sbi_scratch_alloc mem;
 };

 /** Possible options for OpenSBI library */
@@ -95,8 +140,7 @@ int sbi_scratch_init(struct sbi_scratch *scratch);
 /**
  * Allocate from extra space in sbi_scratch
  *
- * @return zero on failure and non-zero (>= SBI_SCRATCH_EXTRA_SPACE_OFFSET)
- * on success
+ * @return zero on failure and non-zero on success
  */
 unsigned long sbi_scratch_alloc_offset(unsigned long size);

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 38e3565..2050265 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -88,6 +88,8 @@ typedef unsigned long		physical_size_t;
 #define STR(x) XSTR(x)
 #define XSTR(x) #x

+#define ALIGN(x, a) ((typeof(x))((unsigned long)(x + (a - 1)) & ~(a - 1)))
+
 #define ROUNDUP(a, b) ((((a)-1) / (b) + 1) * (b))
 #define ROUNDDOWN(a, b) ((a) / (b) * (b))

diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index 87b34c6..4c59c62 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -18,10 +18,16 @@ u32 last_hartid_having_scratch = SBI_HARTMASK_MAX_BITS - 1;
 struct sbi_scratch *hartid_to_scratch_table[SBI_HARTMASK_MAX_BITS] = { 0 };

 static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
-static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
+static unsigned int first_free;

 typedef struct sbi_scratch *(*hartid2scratch)(ulong hartid, ulong hartindex);

+/**
+ * sbi_scratch_init() - initialize scratch table and allocator
+ *
+ * @scratch:	pointer to table
+ * Return:	0 on success
+ */
 int sbi_scratch_init(struct sbi_scratch *scratch)
 {
 	u32 i;
@@ -37,63 +43,190 @@ int sbi_scratch_init(struct sbi_scratch *scratch)
 			last_hartid_having_scratch = i;
 	}

+	/* Initialize memory allocation block list */
+	scratch = sbi_hartid_to_scratch(last_hartid_having_scratch);
+
+	scratch->mem.prev_size = (2 * sizeof(unsigned int)) | 1U;
+	scratch->mem.size = SBI_SCRATCH_SIZE -
+			    offsetof(struct sbi_scratch, mem.mem);
+	first_free = offsetof(struct sbi_scratch, mem);
+	scratch->mem.prev = 0;
+	scratch->mem.next = 0;
+
 	return 0;
 }

+/**
+ * sbi_scratch_alloc_offset() - allocate scratch memory
+ *
+ * @size:	requested size
+ * Return:	offset of allocated block on succcess, 0 on failure
+ */
 unsigned long sbi_scratch_alloc_offset(unsigned long size)
 {
-	u32 i;
-	void *ptr;
-	unsigned long ret = 0;
-	struct sbi_scratch *rscratch;
+	unsigned long ret;
+	unsigned int best_size = ~0U;
+	struct sbi_scratch_alloc *best = NULL;
+	struct sbi_scratch *scratch =
+		sbi_hartid_to_scratch(last_hartid_having_scratch);
+	unsigned int next;
+	struct sbi_scratch_alloc *current;
+	struct sbi_scratch_alloc *pred, *succ;
+	struct sbi_scratch_alloc *end =
+		(void *)((char *)scratch + SBI_SCRATCH_SIZE);

 	/*
-	 * We have a simple brain-dead allocator which never expects
-	 * anything to be free-ed hence it keeps incrementing the
-	 * next allocation offset until it runs-out of space.
-	 *
-	 * In future, we will have more sophisticated allocator which
-	 * will allow us to re-claim free-ed space.
+	 * When allocating zero bytes we still need space
+	 * for the prev and next fields.
 	 */
-
 	if (!size)
+		size = 1;
+	size = ALIGN(size, 2 * sizeof(unsigned int));
+
+	spin_lock(&extra_lock);
+
+	/* Find best fitting free block */
+	for (next = first_free; next; next = current->next) {
+		current = (void *)((char *)scratch + next);
+		if (current->size > best_size || current->size < size)
+			continue;
+		best_size = current->size;
+		best = current;
+	}
+	if (!best) {
+		spin_unlock(&extra_lock);
 		return 0;
+	}

-	if (size & (__SIZEOF_POINTER__ - 1))
-		size = (size & ~(__SIZEOF_POINTER__ - 1)) + __SIZEOF_POINTER__;
+	/* Update free list */
+	if (best->prev)
+		pred = (void *)((char *)scratch + best->prev);
+	else
+		pred = NULL;
+	if (best->next)
+		succ = (void *)((char *)scratch + best->next);
+	else
+		succ = NULL;
+
+	if (best->size > size + SBI_SCRATCH_ALLOC_SIZE) {
+		/* Split block, use the lower part for allocation. */
+		current = (struct sbi_scratch_alloc *)&best->mem[size];
+		next = (char *)current - (char *)scratch;
+		current->size = best->size - size -
+				SBI_SCRATCH_ALLOC_SIZE;
+		current->prev = best->prev;
+		current->next = best->next;
+		current->prev_size = size | 1U;
+		best->size = size;
+		if (succ)
+			succ->prev = next;
+	} else {
+		next = best->next;
+		if (succ)
+			succ->prev = best->prev;
+		current = best;
+	}

-	spin_lock(&extra_lock);
+	if (pred)
+		pred->next = next;
+	else
+		first_free = next;

-	if (SBI_SCRATCH_SIZE < (extra_offset + size))
-		goto done;
+	/* Update memory block list */
+	succ = (struct sbi_scratch_alloc *)&current->mem[current->size];

-	ret = extra_offset;
-	extra_offset += size;
+	best->size |= 1U;

-done:
-	spin_unlock(&extra_lock);
+	if (succ < end)
+		succ->prev_size = current->size;

-	if (ret) {
-		for (i = 0; i <= sbi_scratch_last_hartid(); i++) {
-			rscratch = sbi_hartid_to_scratch(i);
-			if (!rscratch)
-				continue;
-			ptr = sbi_scratch_offset_ptr(rscratch, ret);
-			sbi_memset(ptr, 0, size);
-		}
+	ret =  best->mem - (unsigned char *)scratch;
+
+	/* Erase allocated scratch memory */
+	for (unsigned int i = 0; i <= last_hartid_having_scratch; i++) {
+		void *ptr;
+		struct sbi_scratch *rscratch;
+
+		rscratch = sbi_hartid_to_scratch(i);
+		if (!rscratch)
+			continue;
+		ptr = sbi_scratch_offset_ptr(rscratch, ret);
+		sbi_memset(ptr, 0, size);
 	}

+	spin_unlock(&extra_lock);
+
 	return ret;
 }

+/**
+ * sbi_scratch_free_offset() - free scratch memory
+ *
+ * @offset:	offset to memory to be freed
+ */
 void sbi_scratch_free_offset(unsigned long offset)
 {
-	if ((offset < SBI_SCRATCH_EXTRA_SPACE_OFFSET) ||
-	    (SBI_SCRATCH_SIZE <= offset))
+	struct sbi_scratch *scratch =
+		sbi_hartid_to_scratch(last_hartid_having_scratch);
+	struct sbi_scratch_alloc *freed = (void *)((unsigned char *)scratch +
+				      offset - SBI_SCRATCH_ALLOC_SIZE);
+	struct sbi_scratch_alloc *pred, *succ;
+	struct sbi_scratch_alloc *end =
+		(void *)((char *)scratch + SBI_SCRATCH_SIZE);
+
+	spin_lock(&extra_lock);
+
+	if (!offset || !(freed->size & 1U)) {
+		spin_unlock(&extra_lock);
 		return;
+	}

-	/*
-	 * We don't actually free-up because it's a simple
-	 * brain-dead allocator.
-	 */
+	/* Mark block as free */
+	freed->size &= ~1U;
+
+	pred = (struct sbi_scratch_alloc *)((char *)freed -
+	       (freed->prev_size & ~1U) - SBI_SCRATCH_ALLOC_SIZE);
+	if (pred >= &scratch->mem && !(pred->size & 1U)) {
+		/* Coalesce free blocks */
+		pred->size += freed->size + SBI_SCRATCH_ALLOC_SIZE;
+		freed = pred;
+	} else {
+		/* Insert at start of free list */
+		if (first_free) {
+			succ = (void *)((char *)scratch + first_free);
+			succ->prev = offset - SBI_SCRATCH_ALLOC_SIZE;
+		}
+		freed->next = first_free;
+		freed->prev = 0;
+		first_free = offset - SBI_SCRATCH_ALLOC_SIZE;
+	}
+
+	succ = (struct sbi_scratch_alloc *)&freed->mem[freed->size & ~1U];
+	if (succ < end) {
+		if (!(succ->size & 1U)) {
+			struct sbi_scratch_alloc *succ2;
+
+			/* Coalesce free blocks */
+			succ2 = (struct sbi_scratch_alloc *)
+				&succ->mem[succ->size & ~1U];
+			freed->size += SBI_SCRATCH_ALLOC_SIZE + succ->size;
+			if (succ2 < end)
+				succ2->prev_size = freed->size;
+
+			/* Remove successor from free list */
+			if (succ->prev) {
+				pred = (void *)((char *)scratch + succ->prev);
+				pred->next = succ->next;
+			} else {
+				first_free = succ->next;
+			}
+			if (succ->next) {
+				succ2 = (void *)((char *)scratch + succ->next);
+				succ2->prev = succ->prev;
+			}
+		} else {
+			succ->prev_size = freed->size;
+		}
+	}
+	spin_unlock(&extra_lock);
 }
--
2.30.2


