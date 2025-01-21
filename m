From: Raj Vishwanathan <raj.vishwanathan@gmail.com>
Date: Mon, 20 Jan 2025 17:46:05 -0800
Subject: [PATCH v3] New configuration CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT
In-Reply-To: <20250119200448.662074-1-Raj.Vishwanathan@gmail.com>
References: <20250119200448.662074-1-Raj.Vishwanathan@gmail.com>
Message-ID: <20250121014605.718309-1-Raj.Vishwanathan@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add a new configuration CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT as an int
If it is set to 0 or not defined, we will continue with the previous
defintion of allocating pointer size chunks. Otherwise we will use the
chacheline size of 64.
We have the option of increasing the scratch allocation alignment to 64 bytes
as the cache line size, to avoid two atomic variables from
the same cache line that may cause livelock on some platforms.

Update: Agreeing with the reviewer's comment about not stressing 64 bytes.
---
 lib/sbi/Kconfig       |  7 +++++++
 lib/sbi/sbi_scratch.c | 18 ++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index c6cc04b..5f7eb70 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -69,4 +69,11 @@ config SBI_ECALL_SSE
 config SBI_ECALL_MPXY
 	bool "MPXY extension"
 	default y
+config SBI_SCRATCH_ALLOC_ALIGNMENT
+	int  "Scratch allocation alignment"
+	default 0
+	help
+	  We provide the option to customize the alignment to allocate from
+	  the extra space in sbi_scratch. Leave it 0 for default behaviour.
+
 endmenu
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index ccbbc68..88ea3c7 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -14,6 +14,13 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
+#if !defined(CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT) || (CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT==0)
+#define SCRATCH_ALLOC_ALIGNMENT __SIZEOF_POINTER__
+#else
+#define SCRATCH_ALLOC_ALIGNMENT CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT
+#endif
+
+
 u32 last_hartindex_having_scratch = 0;
 u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
 struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
@@ -70,8 +77,15 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
 	if (!size)
 		return 0;
 
-	size += __SIZEOF_POINTER__ - 1;
-	size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
+	/*
+	 * We let the allocation align to the cache line size, so
+	 * certain platforms due to atomic variables from the same cache line.
+	 * This ensures that the LR/SC variables are in a separate cache line 
+	 * to avoid live lock.
+	 */
+
+	size += SCRATCH_ALLOC_ALIGNMENT- 1;
+	size &= ~((unsigned long)SCRATCH_ALLOC_ALIGNMENT - 1);
 
 	spin_lock(&extra_lock);
 
-- 
2.43.0


