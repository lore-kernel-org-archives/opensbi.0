From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri,  8 Dec 2023 12:29:55 -0800
Subject: [PATCH] lib: sbi_tlb: Check tlb_range_flush_limit only once per request
Message-ID: <20231208203532.3640005-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The tlb_update() callback is called for each destination hart.
Move the size check earlier, so it is executed only once.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_tlb.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index dad95088..d3ed56df 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -327,16 +327,6 @@ static int tlb_update(struct sbi_scratch *scratch,
 	struct sbi_tlb_info *tinfo = data;
 	u32 curr_hartid = current_hartid();
 
-	/*
-	 * If address range to flush is too big then simply
-	 * upgrade it to flush all because we can only flush
-	 * 4KB at a time.
-	 */
-	if (tinfo->size > tlb_range_flush_limit) {
-		tinfo->start = 0;
-		tinfo->size = SBI_TLB_FLUSH_ALL;
-	}
-
 	/*
 	 * If the request is to queue a tlb flush entry for itself
 	 * then just do a local flush and return;
@@ -385,6 +375,16 @@ int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo)
 	if (!tinfo->local_fn)
 		return SBI_EINVAL;
 
+	/*
+	 * If address range to flush is too big then simply
+	 * upgrade it to flush all because we can only flush
+	 * 4KB at a time.
+	 */
+	if (tinfo->size > tlb_range_flush_limit) {
+		tinfo->start = 0;
+		tinfo->size = SBI_TLB_FLUSH_ALL;
+	}
+
 	tlb_pmu_incr_fw_ctr(tinfo);
 
 	return sbi_ipi_send_many(hmask, hbase, tlb_event, tinfo);
-- 
2.42.0


