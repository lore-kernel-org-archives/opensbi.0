From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 12 Oct 2023 11:29:29 +0800
Subject: [PATCH] platform: Uses hart count as the default size of tlb info
Message-ID: <IA1PR20MB4953569FCD95E4E40FC6A4CABBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For platform with high number of harts, it is better to auto detect a
suitable number of entries in tlb fifo. Since allocating tlb entry for
all online harts can reduce the wait time significantly, using the
number of the online harts can make most platforms happy. This auto
detection can avoid most duplicate code for setting tlb fifo size.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 platform/generic/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 66a0b77..4246efd 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -260,7 +260,7 @@ static u32 generic_tlb_num_entries(void)
 {
 	if (generic_plat && generic_plat->tlb_num_entries)
 		return generic_plat->tlb_num_entries(generic_plat_match);
-	return SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES;
+	return sbi_scratch_last_hartindex() + 1;
 }
 
 static int generic_pmu_init(void)
-- 
2.42.0


