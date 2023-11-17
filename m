From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 17 Nov 2023 20:11:00 +0800
Subject: [PATCH] platform: recalculate heap size to support new tlb entry number
Message-ID: <IA1PR20MB4953BC55F07EE072FE9E4288BBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Previous patch introduct a change that using hart count as the default
number of tlb entry in the fifo. This makes the default tlb fifo size
grow in square with the number of harts. So the default heap size is
not enough to allocate tlb fifo when the hart count is big.

Use new formula for default heap size:
0x40 * (__num_hart) ^ 2   -> handle the tlb fifo
0x600 * (__num_hart)      -> remove previous static fifo allocation

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Fixes: 52fd64b ("platform: Uses hart count as the default size of tlb info")
---
 include/sbi/sbi_bitops.h   | 1 +
 include/sbi/sbi_heap.h     | 3 +++
 include/sbi/sbi_platform.h | 8 ++++++--
 lib/sbi/sbi_heap.c         | 2 --
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h
index 48a2090..7d90334 100644
--- a/include/sbi/sbi_bitops.h
+++ b/include/sbi/sbi_bitops.h
@@ -26,6 +26,7 @@
 #define BIT_MASK(nr)		(1UL << ((nr) % BITS_PER_LONG))
 #define BIT_WORD(bit)		((bit) / BITS_PER_LONG)
 #define BIT_WORD_OFFSET(bit)	((bit) & (BITS_PER_LONG - 1))
+#define BIT_ALIGN(bit, align)	(((bit) + ((align) - 1)) & ~((align) - 1))
 
 #define GENMASK(h, l) \
 	(((~0UL) - (1UL << (l)) + 1) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
index 88d176e..16755ec 100644
--- a/include/sbi/sbi_heap.h
+++ b/include/sbi/sbi_heap.h
@@ -12,6 +12,9 @@
 
 #include <sbi/sbi_types.h>
 
+/* Alignment of heap base address and size */
+#define HEAP_BASE_ALIGN			1024
+
 struct sbi_scratch;
 
 /** Allocate from heap area */
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 58b9069..609f608 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -44,8 +44,10 @@
 
 #ifndef __ASSEMBLER__
 
+#include <sbi/sbi_bitops.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_version.h>
 
@@ -146,8 +148,10 @@ struct sbi_platform_operations {
 #define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE	8192
 
 /** Platform default heap size */
-#define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)	\
-					(0x8000 + 0x800 * (__num_hart))
+#define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)		\
+	BIT_ALIGN((0x8000 + 0x600 * (__num_hart) +		\
+		   0x40 * (__num_hart) * (__num_hart)),		\
+		  HEAP_BASE_ALIGN)
 
 /** Representation of a platform */
 struct sbi_platform {
diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index 698c377..bcd404b 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -14,8 +14,6 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
-/* Alignment of heap base address and size */
-#define HEAP_BASE_ALIGN			1024
 /* Minimum size and alignment of heap allocations */
 #define HEAP_ALLOC_ALIGN		64
 #define HEAP_HOUSEKEEPING_FACTOR	16
-- 
2.42.1


