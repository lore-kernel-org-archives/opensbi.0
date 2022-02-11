From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 11 Feb 2022 14:11:55 +0300
Subject: [PATCH 3/3] lib: utils/timer: check if addr exists
In-Reply-To: <20220211111155.16121-1-nikita.shubin@maquefel.me>
References: <20220211111155.16121-1-nikita.shubin@maquefel.me>
Message-ID: <20220211111155.16121-4-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

In case we want shared time addr register for different mtimer's,
we need to check if region was already added to domain, otherwise
sbi_domain_root_add_memregion will fail and will couse init to fail
with:
init_coldboot: timer init failed (error -3)

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 lib/utils/timer/aclint_mtimer.c | 51 ++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index a957b1c..2c90e22 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -175,6 +175,9 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 {
 	u32 i;
 	int rc;
+	struct aclint_mtimer_data *last_mt = NULL;
+	bool skip_time_addr = false;
+	bool skip_timecmp_addr = false;
 
 	/* Sanity checks */
 	if (!mt || !mt->mtime_size ||
@@ -206,27 +209,53 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 	for (i = 0; i < mt->hart_count; i++)
 		mtimer_hartid2data[mt->first_hartid + i] = mt;
 
+	/* Check if timer or timercmp addr already exists
+	 * otherwise aclint_mtimer_add_regions will fail
+	 * becouse of regions conflict.
+	 */
+	for (i = 0; i < mt->first_hartid; i++) {
+		if (last_mt && last_mt == mtimer_hartid2data[i])
+			continue;
+
+		if (mtimer_hartid2data[i]->mtime_addr == mt->mtime_addr)
+			skip_time_addr = true;
+
+		if (mtimer_hartid2data[i]->mtimecmp_addr == mt->mtimecmp_addr)
+			skip_timecmp_addr = true;
+
+		if (skip_time_addr && skip_timecmp_addr)
+			break;
+
+		last_mt = mtimer_hartid2data[i];
+	}
+
 	/* Add MTIMER regions to the root domain */
-	if (mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) {
+	if ((mt->mtime_addr == (mt->mtimecmp_addr + mt->mtimecmp_size)) &&
+		!skip_timecmp_addr) {
 		rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
 					mt->mtime_size + mt->mtimecmp_size);
 		if (rc)
 			return rc;
-	} else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
+	} else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size) &&
+		!skip_time_addr) {
 		rc = aclint_mtimer_add_regions(mt->mtime_addr,
 					mt->mtime_size + mt->mtimecmp_size);
 		if (rc)
 			return rc;
 	} else {
-		rc = aclint_mtimer_add_regions(mt->mtime_addr,
-						mt->mtime_size);
-		if (rc)
-			return rc;
-
-		rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
-						mt->mtimecmp_size);
-		if (rc)
-			return rc;
+		if (!skip_time_addr) {
+			rc = aclint_mtimer_add_regions(mt->mtime_addr,
+							mt->mtime_size);
+			if (rc)
+				return rc;
+		}
+
+		if (!skip_timecmp_addr) {
+			rc = aclint_mtimer_add_regions(mt->mtimecmp_addr,
+							mt->mtimecmp_size);
+			if (rc)
+				return rc;
+		}
 	}
 
 	mtimer.timer_freq = mt->mtime_freq;
-- 
2.31.1


