From: Raj Vishwanathan <raj.vishwanathan@gmail.com>
Date: Mon, 27 Jan 2025 12:20:17 -0800
Subject: [PATCH v3] New configuration CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT
In-Reply-To: <20250115234607.410148-1-Raj.Vishwanathan@gmail.com>
References: <20250115234607.410148-1-Raj.Vishwanathan@gmail.com>
Message-ID: <20250127202017.1043240-1-Raj.Vishwanathan@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add a new configuration CONFIG_SBI_SCRATCH_ALLOC_ALIGNMENT as an int
If it is set to 0 or not defined, we will continue with the previous
defintion of allocating pointer size chunks. Otherwise we will use the
user specified size.
We use the scratch allocation alignment to 64 bytes or cacheline size,
to avoid two atomic variables from the same cache line causing livelock
on some platforms.

Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
---

Changes in V2:
	Remove platform specific references to 64 bytes in the configuration

Changes in V3:
	Remove platform specific references in 64 bytes in the comments
---
 lib/sbi/Kconfig       |  7 +++++++
 lib/sbi/sbi_scratch.c | 14 ++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

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
index ccbbc68..0f1be58 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -14,6 +14,16 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
+/*
+ * We do the scratch allocation on the basis of a user configuration.
+ */
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
@@ -70,8 +80,8 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
 	if (!size)
 		return 0;
 
-	size += __SIZEOF_POINTER__ - 1;
-	size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
+	size += SCRATCH_ALLOC_ALIGNMENT- 1;
+	size &= ~((unsigned long)SCRATCH_ALLOC_ALIGNMENT - 1);
 
 	spin_lock(&extra_lock);
 
-- 
2.43.0


