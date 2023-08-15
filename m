From: Xiang W <wxjstz@126.com>
Date: Tue, 15 Aug 2023 15:15:16 +0800
Subject: [PATCH v4 2/2] lib: sbi: alloc tlb fifo by sbi_malloc
In-Reply-To: <20230815071516.422658-1-wxjstz@126.com>
References: <20230815071516.422658-1-wxjstz@126.com>
Message-ID: <20230815071516.422658-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the system is defined from tlb_fifo_num_entries, the scratch may be
too small to hold the fifo, so it is alloc through the heap.

Signed-off-by: Xiang W <wxjstz@126.com>
Signed-off-by: Xing Xiaoguang <xiaoguang.xing@sophgo.com>
---
 lib/sbi/sbi_tlb.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 92648da..7b3ec0a 100644
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
@@ -421,16 +421,8 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 			sbi_scratch_free_offset(tlb_sync_off);
 			return SBI_ENOMEM;
 		}
-		tlb_fifo_mem_off = sbi_scratch_alloc_offset(
-				sbi_platform_tlb_fifo_num_entries(plat) * SBI_TLB_INFO_SIZE);
-		if (!tlb_fifo_mem_off) {
-			sbi_scratch_free_offset(tlb_fifo_off);
-			sbi_scratch_free_offset(tlb_sync_off);
-			return SBI_ENOMEM;
-		}
 		ret = sbi_ipi_event_create(&tlb_ops);
 		if (ret < 0) {
-			sbi_scratch_free_offset(tlb_fifo_mem_off);
 			sbi_scratch_free_offset(tlb_fifo_off);
 			sbi_scratch_free_offset(tlb_sync_off);
 			return ret;
@@ -438,9 +430,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 		tlb_event = ret;
 		tlb_range_flush_limit = sbi_platform_tlbr_flush_limit(plat);
 	} else {
-		if (!tlb_sync_off ||
-		    !tlb_fifo_off ||
-		    !tlb_fifo_mem_off)
+		if (!tlb_sync_off || !tlb_fifo_off)
 			return SBI_ENOMEM;
 		if (SBI_IPI_EVENT_MAX <= tlb_event)
 			return SBI_ENOSPC;
@@ -448,7 +438,10 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 
 	tlb_sync = sbi_scratch_offset_ptr(scratch, tlb_sync_off);
 	tlb_q = sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
-	tlb_mem = sbi_scratch_offset_ptr(scratch, tlb_fifo_mem_off);
+	tlb_mem = sbi_malloc(
+			sbi_platform_tlb_fifo_num_entries(plat) * SBI_TLB_INFO_SIZE);
+	if (!tlb_mem)
+		return SBI_ENOMEM;
 
 	ATOMIC_INIT(tlb_sync, 0);
 
-- 
2.40.1


