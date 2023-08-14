From: Xiang W <wxjstz@126.com>
Date: Mon, 14 Aug 2023 19:29:05 +0800
Subject: [PATCH] lib: sbi: alloc tlb fifo by sbi_malloc
Message-ID: <20230814112905.151466-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the system is defined from tlb_fifo_num_entries, the scratch may be
too small to hold the fifo, so it is alloc through the heap.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_tlb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 92648da..517ef90 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_fifo.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_tlb.h>
@@ -25,7 +26,6 @@
 
 static unsigned long tlb_sync_off;
 static unsigned long tlb_fifo_off;
-static unsigned long tlb_fifo_mem_off;
 static unsigned long tlb_range_flush_limit;
 
 static void tlb_flush_all(void)
@@ -407,7 +407,7 @@ int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo)
 int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int ret;
-	void *tlb_mem;
+	void *tlb_mem = NULL;
 	atomic_t *tlb_sync;
 	struct sbi_fifo *tlb_q;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
@@ -421,16 +421,16 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 			sbi_scratch_free_offset(tlb_sync_off);
 			return SBI_ENOMEM;
 		}
-		tlb_fifo_mem_off = sbi_scratch_alloc_offset(
+		tlb_mem = sbi_malloc(
 				sbi_platform_tlb_fifo_num_entries(plat) * SBI_TLB_INFO_SIZE);
-		if (!tlb_fifo_mem_off) {
+		if (!tlb_mem) {
 			sbi_scratch_free_offset(tlb_fifo_off);
 			sbi_scratch_free_offset(tlb_sync_off);
 			return SBI_ENOMEM;
 		}
 		ret = sbi_ipi_event_create(&tlb_ops);
 		if (ret < 0) {
-			sbi_scratch_free_offset(tlb_fifo_mem_off);
+			sbi_free(tlb_mem);
 			sbi_scratch_free_offset(tlb_fifo_off);
 			sbi_scratch_free_offset(tlb_sync_off);
 			return ret;
@@ -440,7 +440,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 	} else {
 		if (!tlb_sync_off ||
 		    !tlb_fifo_off ||
-		    !tlb_fifo_mem_off)
+			!tlb_mem)
 			return SBI_ENOMEM;
 		if (SBI_IPI_EVENT_MAX <= tlb_event)
 			return SBI_ENOSPC;
@@ -448,7 +448,6 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 
 	tlb_sync = sbi_scratch_offset_ptr(scratch, tlb_sync_off);
 	tlb_q = sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
-	tlb_mem = sbi_scratch_offset_ptr(scratch, tlb_fifo_mem_off);
 
 	ATOMIC_INIT(tlb_sync, 0);
 
-- 
2.40.1


