From: Xiang W <wxjstz@126.com>
Date: Sun, 24 Sep 2023 23:57:43 +0800
Subject: [PATCH 1/3] lib: sbi: Refactor sbi_scratch_last_hartindex as a function
In-Reply-To: <20230924155745.1753120-1-wxjstz@126.com>
References: <20230924155745.1753120-1-wxjstz@126.com>
Message-ID: <20230924155745.1753120-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor sbi_scratch_last_hartindex as a function. This prevents the
last_hartindex_having_scratch variable from being corrupted elsewhere

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_scratch.h | 5 +----
 lib/sbi/sbi_scratch.c     | 7 ++++++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index e6a33ba..28f91ac 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -202,11 +202,8 @@ do {									\
 					= (__type)(__ptr);		\
 } while (0)
 
-/** Last HART index having a sbi_scratch pointer */
-extern u32 last_hartindex_having_scratch;
-
 /** Get last HART index having a sbi_scratch pointer */
-#define sbi_scratch_last_hartindex()	last_hartindex_having_scratch
+u32 sbi_scratch_last_hartindex(void);
 
 /** Check whether a particular HART index is valid or not */
 #define sbi_hartindex_valid(__hartindex) \
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index ccbbc68..5dab2e6 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -14,13 +14,18 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
-u32 last_hartindex_having_scratch = 0;
+static u32 last_hartindex_having_scratch = 0;
 u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
 struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
 
 static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
 static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
 
+u32 sbi_scratch_last_hartindex(void)
+{
+	return last_hartindex_having_scratch;
+}
+
 u32 sbi_hartid_to_hartindex(u32 hartid)
 {
 	u32 i;
-- 
2.40.1


