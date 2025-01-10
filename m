From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu,  9 Jan 2025 16:34:50 -0800
Subject: [PATCH] Align the scratch allocation to 64 bytes
Message-ID: <20250110003451.2800-1-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We increase the scratch allocation alignment to 64 bytes
as the cache line size, to avoid two atomic variables from
the same cache line that may cause livelock on some platforms.
---
 lib/sbi/sbi_scratch.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index ccbbc68..6b161bc 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -14,6 +14,9 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
+/* Minimum size and alignment of scratch allocations */
+#define SCRATCH_ALLOC_ALIGN 64
+
 u32 last_hartindex_having_scratch = 0;
 u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
 struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
@@ -70,8 +73,12 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
 	if (!size)
 		return 0;
 
-	size += __SIZEOF_POINTER__ - 1;
-	size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
+	/*
+	 * We let the allocation align to 64 bytes to avoid livelock on
+	 * certain platforms due to atomic variables from the same cache line.
+	 */
+	size += SCRATCH_ALLOC_ALIGN - 1;
+	size &= ~((unsigned long)SCRATCH_ALLOC_ALIGN - 1);
 
 	spin_lock(&extra_lock);
 
-- 
2.47.1


