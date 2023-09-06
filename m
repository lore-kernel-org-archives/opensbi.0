From: Xiang W <wxjstz@126.com>
Date: Wed,  6 Sep 2023 21:10:04 +0800
Subject: [PATCH v5 2/2] lib: sbi: alloc tlb fifo by sbi_malloc
In-Reply-To: <20230906131004.427047-1-wxjstz@126.com>
References: <20230906131004.427047-1-wxjstz@126.com>
Message-ID: <20230906131004.427047-3-wxjstz@126.com>
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
 lib/sbi/sbi_tlb.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 92648da..24bf76b 100644
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
@@ -421,8 +422,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 			sbi_scratch_free_offset(tlb_sync_off);
 			return SBI_ENOMEM;
 		}
-		tlb_fifo_mem_off = sbi_scratch_alloc_offset(
-				sbi_platform_tlb_fifo_num_entries(plat) * SBI_TLB_INFO_SIZE);
+		tlb_fifo_mem_off = sbi_scratch_alloc_offset(sizeof(tlb_mem));
 		if (!tlb_fifo_mem_off) {
 			sbi_scratch_free_offset(tlb_fifo_off);
 			sbi_scratch_free_offset(tlb_sync_off);
@@ -448,7 +448,14 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 
 	tlb_sync = sbi_scratch_offset_ptr(scratch, tlb_sync_off);
 	tlb_q = sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
-	tlb_mem = sbi_scratch_offset_ptr(scratch, tlb_fifo_mem_off);
+	tlb_mem = sbi_scratch_read_type(scratch, void*, tlb_fifo_mem_off);
+	if (!tlb_mem) {
+		tlb_mem = sbi_malloc(
+				sbi_platform_tlb_fifo_num_entries(plat) * SBI_TLB_INFO_SIZE);
+		if (!tlb_mem)
+			return SBI_ENOMEM;
+		sbi_scratch_write_type(scratch, void*, tlb_fifo_mem_off, tlb_mem);
+	}
 
 	ATOMIC_INIT(tlb_sync, 0);
 
-- 
2.40.1


