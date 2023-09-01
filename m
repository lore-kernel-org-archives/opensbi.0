From: Xu Zhang <zhx901223@gmail.com>
Date: Fri,  1 Sep 2023 23:14:42 +0800
Subject: [PATCH] lib: utils/timer: mtimer: Change to use correct condition
Message-ID: <20230901151442.1830095-1-xu.zhang@hexintek.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It should use mt->mtime_addr to check align.

Signed-off-by: Xu Zhang <xu.zhang@hexintek.com>
---
 lib/utils/timer/aclint_mtimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 271e625..ddfa2bd 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -187,7 +187,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 	/* Sanity checks */
 	if (!mt ||
 	    (mt->hart_count && !mt->mtimecmp_size) ||
-	    (mt->mtime_size && (mt->mtime_addr & (ACLINT_MTIMER_ALIGN - 1))) ||
+	    (mt->mtime_addr && (mt->mtime_addr & (ACLINT_MTIMER_ALIGN - 1))) ||
 	    (mt->mtime_size && (mt->mtime_size & (ACLINT_MTIMER_ALIGN - 1))) ||
 	    (mt->mtimecmp_addr & (ACLINT_MTIMER_ALIGN - 1)) ||
 	    (mt->mtimecmp_size & (ACLINT_MTIMER_ALIGN - 1)) ||
-- 
2.25.1


