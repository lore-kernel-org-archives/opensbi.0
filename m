From: Xiang W <wxjstz@126.com>
Date: Tue, 11 Apr 2023 12:56:20 +0800
Subject: [PATCH v5 3/4] sbi: tlb: Simplify to tlb_process_count/tlb_process function
In-Reply-To: <20230411045621.60331-1-wxjstz@126.com>
References: <y>
 <20230411045621.60331-1-wxjstz@126.com>
Message-ID: <20230411045621.60331-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

tlb_process_count is only used when count=1, so refactor to
tlb_process_once and add the return value to be reused in
tlb_process

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_tlb.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index d950c45..60ca8c6 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -229,30 +229,23 @@ static void tlb_entry_process(struct sbi_tlb_info *tinfo)
 	}
 }
 
-static void tlb_process_count(struct sbi_scratch *scratch, int count)
+static bool tlb_process_once(struct sbi_scratch *scratch)
 {
 	struct sbi_tlb_info tinfo;
-	unsigned int deq_count = 0;
 	struct sbi_fifo *tlb_fifo =
 			sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
 
-	while (!sbi_fifo_dequeue(tlb_fifo, &tinfo)) {
+	if (!sbi_fifo_dequeue(tlb_fifo, &tinfo)) {
 		tlb_entry_process(&tinfo);
-		deq_count++;
-		if (deq_count > count)
-			break;
-
+		return true;
 	}
+
+	return false;
 }
 
 static void tlb_process(struct sbi_scratch *scratch)
 {
-	struct sbi_tlb_info tinfo;
-	struct sbi_fifo *tlb_fifo =
-			sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
-
-	while (!sbi_fifo_dequeue(tlb_fifo, &tinfo))
-		tlb_entry_process(&tinfo);
+	while (tlb_process_once(scratch));
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
@@ -380,7 +373,7 @@ static int tlb_update(struct sbi_scratch *scratch,
 		 * TODO: Introduce a wait/wakeup event mechanism to handle
 		 * this properly.
 		 */
-		tlb_process_count(scratch, 1);
+		tlb_process_once(scratch);
 		sbi_dprintf("hart%d: hart%d tlb fifo full\n",
 			    curr_hartid, remote_hartid);
 	}
-- 
2.39.2


