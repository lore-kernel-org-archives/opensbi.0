From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  4 Sep 2023 09:33:42 +0530
Subject: [PATCH 4/8] lib: sbi: Use sbi_scratch_last_hartindex() in remote TLB managment
In-Reply-To: <20230904040346.118604-1-apatel@ventanamicro.com>
References: <20230904040346.118604-1-apatel@ventanamicro.com>
Message-ID: <20230904040346.118604-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_hartid_to_scratch() involves translating hartid to hartindex
which is expensive so let's use sbi_hartindex_to_scratch() instead.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_tlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index f8a1aab..1604669 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -213,14 +213,14 @@ static void tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data)
 
 static void tlb_entry_process(struct sbi_tlb_info *tinfo)
 {
-	u32 rhartid, rindex;
+	u32 rindex;
 	struct sbi_scratch *rscratch = NULL;
 	atomic_t *rtlb_sync = NULL;
 
 	tinfo->local_fn(tinfo);
 
-	sbi_hartmask_for_each_hart(rhartid, rindex, &tinfo->smask) {
-		rscratch = sbi_hartid_to_scratch(rhartid);
+	sbi_hartmask_for_each_hartindex(rindex, &tinfo->smask) {
+		rscratch = sbi_hartindex_to_scratch(rindex);
 		if (!rscratch)
 			continue;
 
-- 
2.34.1


