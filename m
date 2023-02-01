From: Xiang W <wxjstz@126.com>
Date: Wed,  1 Feb 2023 23:07:53 +0800
Subject: [PATCH v3 1/4] lib: sbi: Optimize sbi_tlb
In-Reply-To: <20230201150756.161507-1-wxjstz@126.com>
References: <20230201150756.161507-1-wxjstz@126.com>
Message-ID: <20230201150756.161507-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Originally, the process and sync of sbi_tlb need to wait for each other.
Evasion by atomic addition and subtraction.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_tlb.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 4c142ea..685b8ea 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -215,7 +215,7 @@ static void tlb_entry_process(struct sbi_tlb_info *tinfo)
 {
 	u32 rhartid;
 	struct sbi_scratch *rscratch = NULL;
-	unsigned long *rtlb_sync = NULL;
+	atomic_t *rtlb_sync = NULL;
 
 	tinfo->local_fn(tinfo);
 
@@ -225,7 +225,7 @@ static void tlb_entry_process(struct sbi_tlb_info *tinfo)
 			continue;
 
 		rtlb_sync = sbi_scratch_offset_ptr(rscratch, tlb_sync_off);
-		while (atomic_raw_xchg_ulong(rtlb_sync, 1)) ;
+		atomic_sub_return(rtlb_sync, 1);
 	}
 }
 
@@ -257,10 +257,10 @@ static void tlb_process(struct sbi_scratch *scratch)
 
 static void tlb_sync(struct sbi_scratch *scratch)
 {
-	unsigned long *tlb_sync =
+	atomic_t *tlb_sync =
 			sbi_scratch_offset_ptr(scratch, tlb_sync_off);
 
-	while (!atomic_raw_xchg_ulong(tlb_sync, 0)) {
+	while (atomic_read(tlb_sync) > 0) {
 		/*
 		 * While we are waiting for remote hart to set the sync,
 		 * consume fifo requests to avoid deadlock.
@@ -343,6 +343,7 @@ static int tlb_update(struct sbi_scratch *scratch,
 			  u32 remote_hartid, void *data)
 {
 	int ret;
+	atomic_t *tlb_sync;
 	struct sbi_fifo *tlb_fifo_r;
 	struct sbi_tlb_info *tinfo = data;
 	u32 curr_hartid = current_hartid();
@@ -387,6 +388,9 @@ static int tlb_update(struct sbi_scratch *scratch,
 			    curr_hartid, remote_hartid);
 	}
 
+	tlb_sync = sbi_scratch_offset_ptr(scratch, tlb_sync_off);
+	atomic_add_return(tlb_sync, 1);
+
 	return 0;
 }
 
@@ -413,7 +417,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int ret;
 	void *tlb_mem;
-	unsigned long *tlb_sync;
+	atomic_t *tlb_sync;
 	struct sbi_fifo *tlb_q;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
@@ -455,7 +459,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 	tlb_q = sbi_scratch_offset_ptr(scratch, tlb_fifo_off);
 	tlb_mem = sbi_scratch_offset_ptr(scratch, tlb_fifo_mem_off);
 
-	*tlb_sync = 0;
+	tlb_sync->counter = 0;
 
 	sbi_fifo_init(tlb_q, tlb_mem,
 		      SBI_TLB_FIFO_NUM_ENTRIES, SBI_TLB_INFO_SIZE);
-- 
2.39.0


