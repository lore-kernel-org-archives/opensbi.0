From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 12 Oct 2023 16:33:28 +0800
Subject: [PATCH v2] platform: Uses hart count as the default size of tlb info
Message-ID: <IA1PR20MB495379709E66871C21333296BBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
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
Changed from v1:
1. replace SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES with hart count in all cases.

---
 include/sbi/sbi_platform.h  | 3 +--
 platform/generic/platform.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 389203b..58b9069 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -41,7 +41,6 @@
 #define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))

 #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
-#define SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES				8

 #ifndef __ASSEMBLER__

@@ -330,7 +329,7 @@ static inline u32 sbi_platform_tlb_fifo_num_entries(const struct sbi_platform *p
 {
 	if (plat && sbi_platform_ops(plat)->get_tlb_num_entries)
 		return sbi_platform_ops(plat)->get_tlb_num_entries();
-	return SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES;
+	return sbi_scratch_last_hartindex() + 1;
 }

 /**
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


