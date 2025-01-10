From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu,  9 Jan 2025 16:03:01 -0800
Subject: [PATCH] Add a counter and debug printf to change the latency inside tlb_sync
Message-ID: <20250110000301.2620-1-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The tlb_sync loop is slowed down by variable latency to avoid
livelock on some platforms.
---
 lib/sbi/sbi_tlb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 01b31f4..d46b95c 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -247,6 +247,7 @@ static void tlb_process(struct sbi_scratch *scratch)
 
 static void tlb_sync(struct sbi_scratch *scratch)
 {
+	int count = 0;
 	atomic_t *tlb_sync =
 			sbi_scratch_offset_ptr(scratch, tlb_sync_off);
 
@@ -256,6 +257,11 @@ static void tlb_sync(struct sbi_scratch *scratch)
 		 * consume fifo requests to avoid deadlock.
 		 */
 		tlb_process_once(scratch);
+		count++;
+		if ((count % 20) == 0) {
+			sbi_dprintf("tlb_sync loop count = %d value = %ld\n",
+				    count, atomic_read(tlb_sync));
+		}
 	}
 
 	return;
-- 
2.47.1


