From: Xiang W <wxjstz@126.com>
Date: Wed,  6 Sep 2023 21:10:03 +0800
Subject: [PATCH v5 1/2] platform: Allow platforms to specify the size of tlb fifo
In-Reply-To: <20230906131004.427047-1-wxjstz@126.com>
References: <20230906131004.427047-1-wxjstz@126.com>
Message-ID: <20230906131004.427047-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For some platforms with a particularly high number of harts, if the
tlb fifo is too small, it case harts to wait. Platforms should be
allowed to specify the size of the tlb fifo.

Signed-off-by: Xiang W <wxjstz@126.com>
Signed-off-by: Xing Xiaoguang <xiaoguang.xing@sophgo.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_platform.h                   | 18 ++++++++++++++++++
 include/sbi/sbi_tlb.h                        |  2 --
 lib/sbi/sbi_tlb.c                            |  4 ++--
 platform/generic/include/platform_override.h |  1 +
 platform/generic/platform.c                  |  8 ++++++++
 5 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 3e9616f..e6a4a31 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -41,6 +41,7 @@
 #define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))
 
 #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
+#define SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES				8
 
 #ifndef __ASSEMBLER__
 
@@ -125,6 +126,9 @@ struct sbi_platform_operations {
 	/** Get tlb flush limit value **/
 	u64 (*get_tlbr_flush_limit)(void);
 
+	/** Get tlb fifo num entries*/
+	u32 (*get_tlb_num_entries)(void);
+
 	/** Initialize platform timer for current HART */
 	int (*timer_init)(bool cold_boot);
 	/** Exit platform timer for current HART */
@@ -325,6 +329,20 @@ static inline u64 sbi_platform_tlbr_flush_limit(const struct sbi_platform *plat)
 	return SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT;
 }
 
+/**
+ * Get platform specific tlb fifo num entries.
+ *
+ * @param plat pointer to struct sbi_platform
+ *
+ * @return number of tlb fifo entries
+*/
+static inline u32 sbi_platform_tlb_fifo_num_entries(const struct sbi_platform *plat)
+{
+	if (plat && sbi_platform_ops(plat)->get_tlb_num_entries)
+		return sbi_platform_ops(plat)->get_tlb_num_entries();
+	return SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES;
+}
+
 /**
  * Get total number of HARTs supported by the platform
  *
diff --git a/include/sbi/sbi_tlb.h b/include/sbi/sbi_tlb.h
index 48f1962..55dcab0 100644
--- a/include/sbi/sbi_tlb.h
+++ b/include/sbi/sbi_tlb.h
@@ -20,8 +20,6 @@
 
 /* clang-format on */
 
-#define SBI_TLB_FIFO_NUM_ENTRIES		8
-
 struct sbi_scratch;
 
 struct sbi_tlb_info {
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 26a87f3..92648da 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -422,7 +422,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 			return SBI_ENOMEM;
 		}
 		tlb_fifo_mem_off = sbi_scratch_alloc_offset(
-				SBI_TLB_FIFO_NUM_ENTRIES * SBI_TLB_INFO_SIZE);
+				sbi_platform_tlb_fifo_num_entries(plat) * SBI_TLB_INFO_SIZE);
 		if (!tlb_fifo_mem_off) {
 			sbi_scratch_free_offset(tlb_fifo_off);
 			sbi_scratch_free_offset(tlb_sync_off);
@@ -453,7 +453,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
 	ATOMIC_INIT(tlb_sync, 0);
 
 	sbi_fifo_init(tlb_q, tlb_mem,
-		      SBI_TLB_FIFO_NUM_ENTRIES, SBI_TLB_INFO_SIZE);
+		      sbi_platform_tlb_fifo_num_entries(plat), SBI_TLB_INFO_SIZE);
 
 	return 0;
 }
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 0d9e5ee..bf4b112 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -18,6 +18,7 @@ struct platform_override {
 	const struct fdt_match *match_table;
 	u64 (*features)(const struct fdt_match *match);
 	u64 (*tlbr_flush_limit)(const struct fdt_match *match);
+	u32 (*tlb_num_entries)(const struct fdt_match *match);
 	bool (*cold_boot_allowed)(u32 hartid, const struct fdt_match *match);
 	int (*early_init)(bool cold_boot, const struct fdt_match *match);
 	int (*final_init)(bool cold_boot, const struct fdt_match *match);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 34b87f7..66a0b77 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -256,6 +256,13 @@ static u64 generic_tlbr_flush_limit(void)
 	return SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT;
 }
 
+static u32 generic_tlb_num_entries(void)
+{
+	if (generic_plat && generic_plat->tlb_num_entries)
+		return generic_plat->tlb_num_entries(generic_plat_match);
+	return SBI_PLATFORM_TLB_FIFO_NUM_ENTRIES;
+}
+
 static int generic_pmu_init(void)
 {
 	return fdt_pmu_setup(fdt_get_address());
@@ -308,6 +315,7 @@ const struct sbi_platform_operations platform_ops = {
 	.pmu_init		= generic_pmu_init,
 	.pmu_xlate_to_mhpmevent = generic_pmu_xlate_to_mhpmevent,
 	.get_tlbr_flush_limit	= generic_tlbr_flush_limit,
+	.get_tlb_num_entries	= generic_tlb_num_entries,
 	.timer_init		= fdt_timer_init,
 	.timer_exit		= fdt_timer_exit,
 	.vendor_ext_check	= generic_vendor_ext_check,
-- 
2.40.1


