From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:43 -0700
Subject: [PATCH v2 14/15] lib:sbi:tlb: Improve function naming
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-15-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Follow the standard conventon for static function names:

	All global functions should be start with sbi_<module name>_
	All static functions should be start with <module name>_

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_tlb.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 6e9e4f0b1916..bddf2654005e 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -28,7 +28,7 @@ static unsigned long tlb_fifo_off;
 static unsigned long tlb_fifo_mem_off;
 static unsigned long tlb_range_flush_limit;
 
-static void sbi_tlb_flush_all(void)
+static void tlb_flush_all(void)
 {
 	__asm__ __volatile("sfence.vma");
 }
@@ -85,7 +85,7 @@ void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_RCVD);
 
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
-		sbi_tlb_flush_all();
+		tlb_flush_all();
 		return;
 	}
 
@@ -162,7 +162,7 @@ void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
 
 	if (start == 0 && size == 0) {
-		sbi_tlb_flush_all();
+		tlb_flush_all();
 		return;
 	}
 
@@ -211,7 +211,7 @@ static void tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data)
 		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
 }
 
-static void sbi_tlb_entry_process(struct sbi_tlb_info *tinfo)
+static void tlb_entry_process(struct sbi_tlb_info *tinfo)
 {
 	u32 rhartid;
 	struct sbi_scratch *rscratch = NULL;
@@ -229,7 +229,7 @@ static void sbi_tlb_entry_process(struct sbi_tlb_info *tinfo)
 	}
 }
 
-static void sbi_tlb_process_count(struct sbi_scratch *scratch, int count)
+static void tlb_process_count(struct sbi_scratch *scratch, int count)
 {
 	struct sbi_tlb_info tinfo;
 	u32 deq_count = 0;
@@ -237,7 +237,7 @@ static void sbi_tlb_process_count(struct sbi_scratch *scratch, int count)
 			sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
 
 	while (!sbi_fifo_dequeue(tlb_fifo, &tinfo)) {
-		sbi_tlb_entry_process(&tinfo);
+		tlb_entry_process(&tinfo);
 		deq_count++;
 		if (deq_count > count)
 			break;
@@ -245,17 +245,17 @@ static void sbi_tlb_process_count(struct sbi_scratch *scratch, int count)
 	}
 }
 
-static void sbi_tlb_process(struct sbi_scratch *scratch)
+static void tlb_process(struct sbi_scratch *scratch)
 {
 	struct sbi_tlb_info tinfo;
 	struct sbi_fifo *tlb_fifo =
 			sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
 
 	while (!sbi_fifo_dequeue(tlb_fifo, &tinfo))
-		sbi_tlb_entry_process(&tinfo);
+		tlb_entry_process(&tinfo);
 }
 
-static void sbi_tlb_sync(struct sbi_scratch *scratch)
+static void tlb_sync(struct sbi_scratch *scratch)
 {
 	unsigned long *tlb_sync =
 			sbi_scratch_offset_ptr(scratch, tlb_sync_off);
@@ -265,13 +265,13 @@ static void sbi_tlb_sync(struct sbi_scratch *scratch)
 		 * While we are waiting for remote hart to set the sync,
 		 * consume fifo requests to avoid deadlock.
 		 */
-		sbi_tlb_process_count(scratch, 1);
+		tlb_process_count(scratch, 1);
 	}
 
 	return;
 }
 
-static inline int __sbi_tlb_range_check(struct sbi_tlb_info *curr,
+static inline int tlb_range_check(struct sbi_tlb_info *curr,
 					struct sbi_tlb_info *next)
 {
 	unsigned long curr_end;
@@ -314,7 +314,7 @@ static inline int __sbi_tlb_range_check(struct sbi_tlb_info *curr,
  *	before continuing the while loop. This method is preferred over wfi/ipi because
  *	of MMIO cost involved in later method.
  */
-static int sbi_tlb_update_cb(void *in, void *data)
+static int tlb_update_cb(void *in, void *data)
 {
 	struct sbi_tlb_info *curr;
 	struct sbi_tlb_info *next;
@@ -329,16 +329,16 @@ static int sbi_tlb_update_cb(void *in, void *data)
 	if (next->local_fn == sbi_tlb_local_sfence_vma_asid &&
 	    curr->local_fn == sbi_tlb_local_sfence_vma_asid) {
 		if (next->asid == curr->asid)
-			ret = __sbi_tlb_range_check(curr, next);
+			ret = tlb_range_check(curr, next);
 	} else if (next->local_fn == sbi_tlb_local_sfence_vma &&
 		   curr->local_fn == sbi_tlb_local_sfence_vma) {
-		ret = __sbi_tlb_range_check(curr, next);
+		ret = tlb_range_check(curr, next);
 	}
 
 	return ret;
 }
 
-static int sbi_tlb_update(struct sbi_scratch *scratch,
+static int tlb_update(struct sbi_scratch *scratch,
 			  struct sbi_scratch *remote_scratch,
 			  u32 remote_hartid, void *data)
 {
@@ -368,7 +368,7 @@ static int sbi_tlb_update(struct sbi_scratch *scratch,
 
 	tlb_fifo_r = sbi_scratch_offset_ptr(remote_scratch, tlb_fifo_off);
 
-	ret = sbi_fifo_inplace_update(tlb_fifo_r, data, sbi_tlb_update_cb);
+	ret = sbi_fifo_inplace_update(tlb_fifo_r, data, tlb_update_cb);
 	if (ret != SBI_FIFO_UNCHANGED) {
 		return 1;
 	}
@@ -382,7 +382,7 @@ static int sbi_tlb_update(struct sbi_scratch *scratch,
 		 * TODO: Introduce a wait/wakeup event mechanism to handle
 		 * this properly.
 		 */
-		sbi_tlb_process_count(scratch, 1);
+		tlb_process_count(scratch, 1);
 		sbi_dprintf("hart%d: hart%d tlb fifo full\n",
 			    curr_hartid, remote_hartid);
 	}
@@ -392,9 +392,9 @@ static int sbi_tlb_update(struct sbi_scratch *scratch,
 
 static struct sbi_ipi_event_ops tlb_ops = {
 	.name = "IPI_TLB",
-	.update = sbi_tlb_update,
-	.sync = sbi_tlb_sync,
-	.process = sbi_tlb_process,
+	.update = tlb_update,
+	.sync = tlb_sync,
+	.process = tlb_process,
 };
 
 static u32 tlb_event = SBI_IPI_EVENT_MAX;
-- 
2.25.1


