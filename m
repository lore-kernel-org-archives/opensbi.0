From: Xiang W <wxjstz@126.com>
Date: Wed,  1 Feb 2023 23:07:56 +0800
Subject: [PATCH v3 4/4] lib: sbi: Optimize sbi_tlb queue waiting
In-Reply-To: <20230201150756.161507-1-wxjstz@126.com>
References: <20230201150756.161507-1-wxjstz@126.com>
Message-ID: <20230201150756.161507-5-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When tlb_fifo is full, it will wait and affect the ipi update to
other harts. This patch is optimized.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_ipi.h |  3 +++
 lib/sbi/sbi_ipi.c     | 43 ++++++++++++++++++++-----------------------
 lib/sbi/sbi_tlb.c     |  3 ++-
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index f6ac807..aad7f77 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -41,6 +41,9 @@ struct sbi_ipi_event_ops {
 	 * Update callback to save/enqueue data for remote HART
 	 * Note: This is an optional callback and it is called just before
 	 * triggering IPI to remote HART.
+	 * @return 0  success
+	 * @return -1 break IPI, done on local hart
+	 * @return -2 need retry
 	 */
 	int (* update)(struct sbi_scratch *scratch,
 			struct sbi_scratch *remote_scratch,
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 92a33bd..89c485e 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -94,8 +94,10 @@ static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
  */
 int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 {
-	int rc;
-	ulong i, m, n;
+	int rc, done;
+	ulong i, m;
+	struct sbi_hartmask target_mask = {0};
+	struct sbi_hartmask retry_mask = {0};
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
@@ -104,41 +106,36 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 		if (rc)
 			return rc;
 		m &= hmask;
-		n = m;
 
-		/* update IPIs */
 		for (i = hbase; m; i++, m >>= 1) {
 			if (m & 1UL)
-				sbi_ipi_update(scratch, i, event, data);
-		}
-
-		/* sync IPIs */
-		m = n;
-		for (i = hbase; m; i++, m >>= 1) {
-			if (m & 1UL)
-				sbi_ipi_sync(scratch, event);
+				sbi_hartmask_set_hart(i, &target_mask);
 		}
 	} else {
-		/* update IPIs */
 		hbase = 0;
 		while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
 			for (i = hbase; m; i++, m >>= 1) {
 				if (m & 1UL)
-					sbi_ipi_update(scratch, i, event, data);
+					sbi_hartmask_set_hart(i, &target_mask);
 			}
 			hbase += BITS_PER_LONG;
 		}
+	}
 
-		/* sync IPIs */
-		hbase = 0;
-		while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
-			for (i = hbase; m; i++, m >>= 1) {
-				if (m & 1UL)
-					sbi_ipi_sync(scratch, event);
-			}
-			hbase += BITS_PER_LONG;
+	retry_mask = target_mask;
+	do {
+		done = true;
+		sbi_hartmask_for_each_hart(i, &retry_mask) {
+			rc = sbi_ipi_update(scratch, i, event, data);
+			if (rc == -2)
+				done = false;
+			else
+				sbi_hartmask_clear_hart(i, &retry_mask);
 		}
-	}
+	} while (!done);
+
+	/* sync IPIs */
+	sbi_ipi_sync(scratch, event);
 
 	return 0;
 }
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index c82f53a..673f948 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -367,7 +367,7 @@ static int tlb_update(struct sbi_scratch *scratch,
 		return 1;
 	}
 
-	while (sbi_fifo_enqueue(tlb_fifo_r, data) < 0) {
+	if (sbi_fifo_enqueue(tlb_fifo_r, data) < 0) {
 		/**
 		 * For now, Busy loop until there is space in the fifo.
 		 * There may be case where target hart is also
@@ -379,6 +379,7 @@ static int tlb_update(struct sbi_scratch *scratch,
 		tlb_process_once(scratch);
 		sbi_dprintf("hart%d: hart%d tlb fifo full\n",
 			    curr_hartid, remote_hartid);
+		return -2;
 	}
 
 	tlb_sync = sbi_scratch_offset_ptr(scratch, tlb_sync_off);
-- 
2.39.0


