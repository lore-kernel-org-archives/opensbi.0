From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 30 Nov 2023 20:42:10 +0800
Subject: [PATCH v4 12/15] lib: utils: fdt_pmu: Make the fdt_pmu_evt_select table global variable
In-Reply-To: <20231130124213.2590640-1-peterlin@andestech.com>
References: <20231130124213.2590640-1-peterlin@andestech.com>
Message-ID: <20231130124213.2590640-13-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To allow platform override pmu_init() filling the translation table
fdt_pmu_evt_select[] when PMU node doesn't provide such information,
we need to share the table and its entry counter with other .c file.

We also define the structures of PMU property in fdt_helper.h, so we
can initialize the mappings in arrays.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v2 -> v3:
  - New patch
Changes v3 -> v4:
  - No change
---
 include/sbi_utils/fdt/fdt_helper.h | 17 +++++++++++++++++
 include/sbi_utils/fdt/fdt_pmu.h    |  6 ++++++
 lib/utils/fdt/fdt_pmu.c            | 13 ++++---------
 3 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 5c928ff..f6f505b 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -34,6 +34,23 @@ struct platform_uart_data {
 	unsigned long reg_offset;
 };
 
+struct fdt_pmu_hw_event_select_map {
+	uint32_t eidx;
+	uint64_t select;
+};
+
+struct fdt_pmu_hw_event_counter_map {
+	uint32_t eidx_start;
+	uint32_t eidx_end;
+	uint32_t ctr_map;
+};
+
+struct fdt_pmu_raw_event_counter_map {
+	uint64_t select;
+	uint64_t select_mask;
+	uint32_t ctr_map;
+};
+
 const struct fdt_match *fdt_match_node(void *fdt, int nodeoff,
 				       const struct fdt_match *match_table);
 
diff --git a/include/sbi_utils/fdt/fdt_pmu.h b/include/sbi_utils/fdt/fdt_pmu.h
index c65cad7..9a13487 100644
--- a/include/sbi_utils/fdt/fdt_pmu.h
+++ b/include/sbi_utils/fdt/fdt_pmu.h
@@ -12,6 +12,7 @@
 #define __FDT_PMU_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi_utils/fdt/fdt_helper.h>
 
 #ifdef CONFIG_FDT_PMU
 
@@ -45,6 +46,11 @@ int fdt_pmu_setup(void *fdt);
  */
 uint64_t fdt_pmu_get_select_value(uint32_t event_idx);
 
+/** The event index to selector value table instance */
+extern struct fdt_pmu_hw_event_select_map fdt_pmu_evt_select[];
+/** The number of valid entries in fdt_pmu_evt_select[] */
+extern uint32_t hw_event_count;
+
 #else
 
 static inline void fdt_pmu_fixup(void *fdt) { }
diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
index a8d7648..cf3220f 100644
--- a/lib/utils/fdt/fdt_pmu.c
+++ b/lib/utils/fdt/fdt_pmu.c
@@ -17,18 +17,13 @@
 
 #define FDT_PMU_HW_EVENT_MAX (SBI_PMU_HW_EVENT_MAX * 2)
 
-struct fdt_pmu_hw_event_select {
-	uint32_t eidx;
-	uint64_t select;
-};
-
-static struct fdt_pmu_hw_event_select fdt_pmu_evt_select[FDT_PMU_HW_EVENT_MAX] = {0};
-static uint32_t hw_event_count;
+struct fdt_pmu_hw_event_select_map fdt_pmu_evt_select[FDT_PMU_HW_EVENT_MAX] = {0};
+uint32_t hw_event_count;
 
 uint64_t fdt_pmu_get_select_value(uint32_t event_idx)
 {
 	int i;
-	struct fdt_pmu_hw_event_select *event;
+	struct fdt_pmu_hw_event_select_map *event;
 
 	for (i = 0; i < SBI_PMU_HW_EVENT_MAX; i++) {
 		event = &fdt_pmu_evt_select[i];
@@ -65,7 +60,7 @@ int fdt_pmu_setup(void *fdt)
 	int i, pmu_offset, len, result;
 	const u32 *event_val;
 	const u32 *event_ctr_map;
-	struct fdt_pmu_hw_event_select *event;
+	struct fdt_pmu_hw_event_select_map *event;
 	uint64_t raw_selector, select_mask;
 	u32 event_idx_start, event_idx_end, ctr_map;
 
-- 
2.34.1


