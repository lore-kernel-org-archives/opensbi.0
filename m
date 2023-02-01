From: Xiang W <wxjstz@126.com>
Date: Wed,  1 Feb 2023 23:07:55 +0800
Subject: [PATCH v3 3/4] lib: sbi: rename function of sbi_ipi
In-Reply-To: <20230201150756.161507-1-wxjstz@126.com>
References: <20230201150756.161507-1-wxjstz@126.com>
Message-ID: <20230201150756.161507-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Renamed some functions and reused some code

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_tlb.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 685b8ea..c82f53a 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -211,7 +211,7 @@ static void tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data)
 		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
 }
 
-static void tlb_entry_process(struct sbi_tlb_info *tinfo)
+static void tlb_process_helper(struct sbi_tlb_info *tinfo)
 {
 	u32 rhartid;
 	struct sbi_scratch *rscratch = NULL;
@@ -229,30 +229,23 @@ static void tlb_entry_process(struct sbi_tlb_info *tinfo)
 	}
 }
 
-static void tlb_process_count(struct sbi_scratch *scratch, int count)
+static int tlb_process_once(struct sbi_scratch *scratch)
 {
 	struct sbi_tlb_info tinfo;
-	unsigned int deq_count = 0;
 	struct sbi_fifo *tlb_fifo =
 			sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
 
-	while (!sbi_fifo_dequeue(tlb_fifo, &tinfo)) {
-		tlb_entry_process(&tinfo);
-		deq_count++;
-		if (deq_count > count)
-			break;
-
+	if (!sbi_fifo_dequeue(tlb_fifo, &tinfo)) {
+		tlb_process_helper(&tinfo);
+		return 0;
 	}
+
+	return -1;
 }
 
 static void tlb_process(struct sbi_scratch *scratch)
 {
-	struct sbi_tlb_info tinfo;
-	struct sbi_fifo *tlb_fifo =
-			sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
-
-	while (!sbi_fifo_dequeue(tlb_fifo, &tinfo))
-		tlb_entry_process(&tinfo);
+	while (!tlb_process_once(scratch));
 }
 
 static void tlb_sync(struct sbi_scratch *scratch)
@@ -265,7 +258,7 @@ static void tlb_sync(struct sbi_scratch *scratch)
 		 * While we are waiting for remote hart to set the sync,
 		 * consume fifo requests to avoid deadlock.
 		 */
-		tlb_process_count(scratch, 1);
+		tlb_process_once(scratch);
 	}
 
 	return;
@@ -383,7 +376,7 @@ static int tlb_update(struct sbi_scratch *scratch,
 		 * TODO: Introduce a wait/wakeup event mechanism to handle
 		 * this properly.
 		 */
-		tlb_process_count(scratch, 1);
+		tlb_process_once(scratch);
 		sbi_dprintf("hart%d: hart%d tlb fifo full\n",
 			    curr_hartid, remote_hartid);
 	}
-- 
2.39.0


