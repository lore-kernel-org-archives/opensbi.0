From: Xiang W <wxjstz@126.com>
Date: Sun, 24 Sep 2023 23:57:44 +0800
Subject: [PATCH 2/3] lib: sbi: Refactor sbi_hartindex_to_hartid as a function
In-Reply-To: <20230924155745.1753120-1-wxjstz@126.com>
References: <20230924155745.1753120-1-wxjstz@126.com>
Message-ID: <20230924155745.1753120-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor sbi_hartindex_to_hartid as a function.
hartindex_to_hartid_table is modified to a pointer and points to
plat->hart_index2id to reduce memory consumption.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_scratch.h | 14 +++++---------
 lib/sbi/sbi_scratch.c     | 14 ++++++++++++--
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 28f91ac..6119ab4 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -209,15 +209,11 @@ u32 sbi_scratch_last_hartindex(void);
 #define sbi_hartindex_valid(__hartindex) \
 (((__hartindex) <= sbi_scratch_last_hartindex()) ? true : false)
 
-/** HART index to HART id table */
-extern u32 hartindex_to_hartid_table[];
-
-/** Get sbi_scratch from HART index */
-#define sbi_hartindex_to_hartid(__hartindex)		\
-({							\
-	((__hartindex) <= sbi_scratch_last_hartindex()) ?\
-	hartindex_to_hartid_table[__hartindex] : -1U;	\
-})
+/** Get sbi_scratch from HART index
+ * @param hartindex hart index
+ * @return phtsical HART id, -1U indicate input is invalid
+*/
+u32 sbi_hartindex_to_hartid(u32 hartindex);
 
 /** HART index to scratch table */
 extern struct sbi_scratch *hartindex_to_scratch_table[];
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index 5dab2e6..74288bd 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -15,7 +15,7 @@
 #include <sbi/sbi_string.h>
 
 static u32 last_hartindex_having_scratch = 0;
-u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
+static const u32 *hartindex_to_hartid_table = NULL;
 struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
 
 static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
@@ -37,6 +37,16 @@ u32 sbi_hartid_to_hartindex(u32 hartid)
 	return -1U;
 }
 
+u32 sbi_hartindex_to_hartid(u32 hartindex)
+{
+	if (hartindex < last_hartindex_having_scratch) {
+		if (hartindex_to_hartid_table)
+			return hartindex_to_hartid_table[hartindex];
+		return hartindex;
+	}
+	return -1U;
+}
+
 typedef struct sbi_scratch *(*hartid2scratch)(ulong hartid, ulong hartindex);
 
 int sbi_scratch_init(struct sbi_scratch *scratch)
@@ -46,12 +56,12 @@ int sbi_scratch_init(struct sbi_scratch *scratch)
 
 	for (i = 0; i < plat->hart_count; i++) {
 		h = (plat->hart_index2id) ? plat->hart_index2id[i] : i;
-		hartindex_to_hartid_table[i] = h;
 		hartindex_to_scratch_table[i] =
 			((hartid2scratch)scratch->hartid_to_scratch)(h, i);
 	}
 
 	last_hartindex_having_scratch = plat->hart_count - 1;
+	hartindex_to_hartid_table = plat->hart_index2id;
 
 	return 0;
 }
-- 
2.40.1


