From: Inochi Amaoto <inochiama@outlook.com>
Date: Sun,  8 Oct 2023 20:17:41 +0800
Subject: [PATCH v2 3/4] platform: Allow platform uses hart count as the size of tlb info
In-Reply-To: <IA1PR20MB4953CAA2C31F07F9A1157EF7BBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953CAA2C31F07F9A1157EF7BBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB4953F3CC7ED87825F69B50CEBBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For platform with high number of harts, it is better to auto detect a
suitable number of entries in tlb fifo. Since allocating tlb entry for
all online harts can reduce the wait time significantly, using the
number of the online harts can make most platforms happy. This auto
detection can avoid most duplicate code for setting tlb fifo size if
the hart count of platform is big.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 platform/generic/platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 66a0b77..9397afc 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -258,8 +258,15 @@ static u64 generic_tlbr_flush_limit(void)
 
 static u32 generic_tlb_num_entries(void)
 {
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	u32 hart_count = sbi_platform_hart_count(plat);
+
 	if (generic_plat && generic_plat->tlb_num_entries)
 		return generic_plat->tlb_num_entries(generic_plat_match);
+
+	/* for platform with too many harts, use hart count instead */
+	if (hart_count > SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES)
+		return hart_count;
 	return SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES;
 }
 
-- 
2.42.0


