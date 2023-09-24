From: Xiang W <wxjstz@126.com>
Date: Sun, 24 Sep 2023 23:57:45 +0800
Subject: [PATCH 3/3] lib: sbi: Refactor sbi_hartindex_to_scratch as a function
In-Reply-To: <20230924155745.1753120-1-wxjstz@126.com>
References: <20230924155745.1753120-1-wxjstz@126.com>
Message-ID: <20230924155745.1753120-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor sbi_hartindex_to_scratch as a function. This prevents the
hartindex_to_scratch_table variable from being corrupted elsewhere.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_scratch.h | 14 +++++---------
 lib/sbi/sbi_scratch.c     |  9 ++++++++-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 6119ab4..3145880 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -215,15 +215,11 @@ u32 sbi_scratch_last_hartindex(void);
 */
 u32 sbi_hartindex_to_hartid(u32 hartindex);
 
-/** HART index to scratch table */
-extern struct sbi_scratch *hartindex_to_scratch_table[];
-
-/** Get sbi_scratch from HART index */
-#define sbi_hartindex_to_scratch(__hartindex)		\
-({							\
-	((__hartindex) <= sbi_scratch_last_hartindex()) ?\
-	hartindex_to_scratch_table[__hartindex] : NULL;\
-})
+/** Get sbi_scratch from HART index
+ * @param hartindex HART index
+ * @return scratch of HART
+*/
+struct sbi_scratch *sbi_hartindex_to_scratch(u32 hartindex);
 
 /**
  * Get logical index for given HART id
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index 74288bd..dc9ab6c 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -16,7 +16,7 @@
 
 static u32 last_hartindex_having_scratch = 0;
 static const u32 *hartindex_to_hartid_table = NULL;
-struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
+static struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
 
 static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
 static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
@@ -47,6 +47,13 @@ u32 sbi_hartindex_to_hartid(u32 hartindex)
 	return -1U;
 }
 
+struct sbi_scratch *sbi_hartindex_to_scratch(u32 hartindex)
+{
+	if (hartindex < last_hartindex_having_scratch)
+		return hartindex_to_scratch_table[hartindex];
+	return NULL;
+}
+
 typedef struct sbi_scratch *(*hartid2scratch)(ulong hartid, ulong hartindex);
 
 int sbi_scratch_init(struct sbi_scratch *scratch)
-- 
2.40.1


